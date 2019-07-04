import tensorflow as tf

import utils


class DeepGMGCellState(object):
    """
    Holds the state / weights of a DeepGMG cell.
    """
    def __init__(self, config):
        self.config = config

        h_size = self.config['hidden_size']
        m_size = self.config['deepgmg_mlp_size']
        num_node_types = self.config['num_node_types']

        action_metas = self.config['actions']
        use_choose_function_module = 'choose_function' in [action_metas[action_metas.index(a_meta)]["type"] for a_meta
                                                           in action_metas]
        if use_choose_function_module:
            if not 'choose_function_dims' in self.config:
                raise KeyError("'choose_function' module is used, but 'choose_function_dims' is not in defined.")
            choose_function_dims = self.config['choose_function_dims']


        self.weights = {}

        with tf.variable_scope('init_node_model_weights'):
            with tf.variable_scope('out_layer_gated_sum_init_node_weights'):
                self.weights['mlp_f_m_init_node'] = utils.MLP(h_size, h_size * m_size, [], 'linear', 'mlp_f_m_init_node')
                self.weights['mlp_g_m_init_node'] = utils.MLP(h_size, h_size * m_size, [], 'sigmoid', 'mlp_g_m_init_node')
            init_extra_number = 1 if 'extended_init' in config and config['extended_init'] else 0
            self.weights['f_init'] = utils.MLP(h_size * m_size + num_node_types + 1 + init_extra_number, h_size, [], 'linear', 'f_init')

        # if with_attention:
        #     with tf.variable_scope('attention_model_weights'):
        #         self.weights['mlp_attention'] = utils.MLP(h_size * 2, 1, [], 'sigmoid', 'mlp_attention')

        with tf.variable_scope('out_model_weights'):
            with tf.variable_scope('out_layer_gated_sum_weights'):
                self.weights['mlp_f_m'] = utils.MLP(h_size, h_size * m_size, [], 'linear', 'mlp_f_m')
                self.weights['mlp_g_m'] = utils.MLP(h_size, h_size * m_size, [], 'sigmoid', 'mlp_g_m')

        with tf.variable_scope('gen_model_weights'):
            for action_idx, action_meta in enumerate(action_metas):
                name = action_meta['name']
                function_name = 'f_' + name
                input_dimension = self.config[action_meta['input_dimension']] \
                    if isinstance(action_meta['input_dimension'], str) else action_meta['input_dimension']

                mlp_dim = h_size * m_size

                if action_meta['type'] == 'add_node':
                    self.weights[function_name] = utils.MLP(mlp_dim, input_dimension, [], 'sigmoid', 'add_node')

                elif action_meta['type'] == 'add_edge':
                    self.weights[function_name] = utils.MLP(mlp_dim, input_dimension, [], 'sigmoid', 'add_edge')

                elif action_meta['type'] == 'add_edge_to':
                    self.weights[function_name] = utils.MLP(h_size * 2, input_dimension, [], 'sigmoid', 'add_edge_to')

                elif action_meta['type'] == 'add_function':
                    self.weights[function_name] = utils.MLP(h_size * m_size, input_dimension, [], 'sigmoid', 'add_function')

                elif action_meta['type'] == 'add_basic_block':
                    self.weights[function_name] = utils.MLP(h_size * m_size * 2, input_dimension, [], 'sigmoid', 'add_basic_block')

                elif action_meta['type'] == 'choose_number':
                    self.weights[function_name] = utils.MLP(mlp_dim, 1, [], 'sigmoid', 'choose_number')

                elif action_meta['type'] == 'choose_function':
                    self.weights[function_name] = utils.MLP(mlp_dim, choose_function_dims, [], 'sigmoid', 'choose_function')

                elif action_meta['type'] in ['add_const_value_node', 'add_type_node', 'add_instruction_node']:
                    self.weights[function_name] = utils.MLP(mlp_dim, input_dimension, [], 'sigmoid', action_meta['type'])


class DeepGMGCell(object):
    """
    Implementation of the model described in
    Li, Yujia, et al. "Learning deep generative models of graphs." arXiv preprint arXiv:1803.03324 (2018).
    """
    def __init__(self, config, enable_training, state, cell_id):
        self.config = config
        self.enable_training = enable_training
        self.state = state
        self.cell_id = cell_id

        self.ops = {}
        self.placeholders = {}

        action_metas = config['actions']
        use_choose_function_module = 'choose_function' in [action_metas[action_metas.index(a_meta)]["type"] for a_meta
                                                           in action_metas]
        if use_choose_function_module and not 'choose_function_dims' in self.config:
            raise KeyError("'choose_function' module is used, but 'choose_function_dims' is not in defined.")
        self.use_choose_function_module = use_choose_function_module

    def compute_predictions(self, embeddings: tf.Tensor) -> tf.Tensor:
        """
        Make predictions of the individual deepgmg modules based on node embeddings.

        :param embeddings: Tensor of shape [b*v, h]
        :return: Predictions
        """
        h_size = self.config['hidden_size']
        m_size = self.config['deepgmg_mlp_size']
        num_node_types = self.config['num_node_types']

        action_metas = self.config['actions']
        if self.use_choose_function_module:
            if not 'choose_function_dims' in self.config:
                raise KeyError("'choose_function' module is used, but 'choose_function_dims' is not in defined.")
            choose_function_dims = self.config['choose_function_dims']

        # Common Placeholders
        # #########################################
        # Embeddings to graph mappings
        self.placeholders['embeddings_to_graph_mappings'] \
            = tf.placeholder(tf.int32, [None], name='embeddings_to_graph_mappings')
        embeddings_to_graph_mappings = self.placeholders['embeddings_to_graph_mappings']
        num_graphs = tf.math.reduce_max(embeddings_to_graph_mappings) + 1                                   # Scalar

        # Embeddings to graph mappings. Only embeddings that really exists are mapped here. All others are -1.
        self.placeholders['embeddings_to_graph_mappings_existent'] \
            = tf.placeholder(tf.int32, [None], name='embeddings_to_graph_mappings_existent')
        embeddings_to_graph_mappings_existent = self.placeholders['embeddings_to_graph_mappings_existent']

        # Last added node indices of graphs
        self.placeholders['embeddings_last_added_node_idxs'] \
            = tf.placeholder(tf.int32, [None], name='embeddings_last_added_node_idxs')
        embeddings_last_added_node_idxs = self.placeholders['embeddings_last_added_node_idxs']

        # Actions
        self.placeholders['actions'] = tf.placeholder(tf.int32, [None], name='actions')
        actions = tf.one_hot(self.placeholders['actions'], len(action_metas))                               # [b, num_action_metas]

        # Model
        # #########################################
        with tf.variable_scope('DeepGMGCell_%i' % self.cell_id):
            # Init node model
            with tf.variable_scope('init_node_model'):
                # Placeholders
                self.placeholders['last_added_node_types'] = tf.placeholder(tf.int32, [None], name='last_added_node_types')
                last_added_node_types = tf.one_hot(self.placeholders['last_added_node_types'], num_node_types + 1) # [b, v]

                extended_init = 'extended_init' in self.config and self.config['extended_init']
                if extended_init:
                    self.placeholders['extended_init'] = tf.placeholder(tf.float32, [None], name='extended_init')


                # Model
                # Gated Sum
                with tf.variable_scope('out_layer_gated_sum_init_node'):
                    # Gating
                    h_v_G = self.state.weights['mlp_f_m_init_node'](embeddings)                                 # [b*v, 2h]
                    g_v_G = self.state.weights['mlp_g_m_init_node'](embeddings)                                 # [b*v, 2h]
                    g_v_G = tf.nn.sigmoid(g_v_G)                                                                # [b*v, 2h]

                    h_G = h_v_G * g_v_G                                                                         # [b*v, 2h]

                    # Sum
                    h_G = tf.unsorted_segment_sum(data=h_G,
                                                  segment_ids=embeddings_to_graph_mappings_existent,
                                                  num_segments=num_graphs)                                      # [b, 2h]

                    self.ops['h_G_init_node'] = h_G

                # Compute new embedding
                if extended_init:
                    extended_init_data = self.placeholders['extended_init']
                    extended_init_reshaped = tf.reshape(extended_init_data, shape=(-1,1))
                    h_G_e = tf.concat([self.ops['h_G_init_node'], last_added_node_types, extended_init_reshaped], 1)
                else:
                    h_G_e = tf.concat([self.ops['h_G_init_node'], last_added_node_types], 1)                        # [b, 2h + num_node_types+1]
                f_init = self.state.weights['f_init'](h_G_e)                                                    # [b, h]

                # Update embeddings
                # 1) Mask: Action 0 (init node)

                actions_transposed = tf.transpose(tf.cast(actions, dtype=tf.int32))                             # [num_actions, b]
                action_0 = actions_transposed[0]                                                                # [b]
                mask_action_0 = tf.gather(action_0, embeddings_to_graph_mappings)                               # [b*v]

                last_added_node_idxs_onehot = tf.sparse_to_dense(sparse_indices=embeddings_last_added_node_idxs,
                                                                 output_shape=[tf.shape(mask_action_0)[0]],
                                                                 sparse_values=1)                               # [b*v]

                idx_to_update = mask_action_0 * last_added_node_idxs_onehot                                     # [b*v]
                idx_not_to_update = tf.abs(1 - idx_to_update)                                                   # [b*v]
                idx_to_update = tf.expand_dims(idx_to_update, 1)                                                # [b*v, 1]
                idx_not_to_update = tf.expand_dims(idx_not_to_update, 1)                                        # [b*v, 1]

                embeddings_to_update = tf.gather(f_init, embeddings_to_graph_mappings)
                embeddings_to_update = tf.cast(idx_to_update, dtype=tf.float32) * embeddings_to_update

                embeddings_not_to_update = tf.to_float(idx_not_to_update) * embeddings

                # 2) Update embeddings
                embeddings = embeddings_to_update + embeddings_not_to_update

                self.ops['embeddings'] = embeddings

            # Output model
            with tf.variable_scope('out_model'):
                with tf.variable_scope('out_layer_gated_sum'):
                    # Gating
                    h_v_G = self.state.weights['mlp_f_m'](embeddings)                                           # [b*v, 2h]
                    g_v_G = self.state.weights['mlp_g_m'](embeddings)                                           # [b*v, 2h]
                    g_v_G = tf.nn.sigmoid(g_v_G)                                                                # [b*v, 2h]

                    h_G = h_v_G * g_v_G                                                                         # [b*v, 2h]

                    # Sum
                    h_G = tf.unsorted_segment_sum(data=h_G,
                                                  segment_ids=embeddings_to_graph_mappings_existent,
                                                  num_segments=num_graphs)                                      # [b, 2h]

                    self.ops['h_G'] = h_G

            losses = []

            # Generative model
            with tf.variable_scope('gen_model'):
                # Model
                for action_idx, action_meta in enumerate(action_metas):
                    name = action_meta['name']
                    label_name = 'a%i_labels' % action_idx
                    function_name = 'f_%s' % name
                    input_dimension = self.config[action_meta['input_dimension']] \
                        if isinstance(action_meta['input_dimension'], str) else action_meta['input_dimension']
                    loss_scaling_factor = action_meta['loss_scaling_factor']

                    with tf.variable_scope('action_' + name):
                        # General
                        h_v = tf.gather(embeddings, embeddings_last_added_node_idxs)                            # [b, 2h]
                        self.ops['h_v'] = h_v

                        # Action type: add node
                        if action_meta['type'] in ['add_node', 'add_const_value_node', 'add_type_node', 'add_instruction_node']:
                            # Model
                            f_an = self.state.weights[function_name](h_G)                                       # [b, input_dimension]
                            f_an = tf.nn.softmax(f_an)                                                          # [b, input_dimension]
                            self.ops[function_name] = f_an

                            # Training
                            if self.enable_training:
                                # Input

                                self.placeholders[label_name] = tf.placeholder(tf.int32, [None], name=label_name)
                                labels = tf.one_hot(self.placeholders[label_name], input_dimension)        # [b, input_dimension]

                                # Loss
                                diff_loss = f_an - labels                                                       # [b, input_dimension]
                                loss_an = tf.reduce_sum(0.5 * tf.square(diff_loss), 1, keep_dims=True)          # [b, 1]
                                loss_an = loss_an * loss_scaling_factor

                                self.ops['loss_' + action_meta['type']] = loss_an
                                losses.append(loss_an)

                        # Action type: add edge
                        if action_meta['type'] == 'add_edge':
                            # Model
                            f_ae = self.state.weights[function_name](h_G)                                       # [b, input_dimension]
                            f_ae = tf.nn.sigmoid(f_ae)                                                          # [b, input_dimension]
                            self.ops[function_name] = f_ae

                            # Training
                            if self.enable_training:
                                # Input
                                self.placeholders[label_name] = tf.placeholder(tf.int32, [None], name=label_name)
                                labels = tf.one_hot(self.placeholders[label_name], input_dimension)             # [b, input_dimension]

                                # Loss
                                diff_loss = f_ae - labels                                                       # [b, input_dimension]
                                loss_ae = tf.reduce_sum(0.5 * tf.square(diff_loss), 1, keep_dims=True)          # [b, 1]
                                loss_ae = loss_ae * loss_scaling_factor

                                self.ops['loss_ae'] = loss_ae
                                losses.append(loss_ae)

                        # Action type: choose function
                        if action_meta['type'] == 'choose_function':
                            # Model
                            f_cf = self.state.weights[function_name](h_G)
                            f_cf = tf.nn.softmax(f_cf)                                                          # [b, choose_function_dims]
                            self.ops[function_name] = f_cf

                            # Training
                            if self.enable_training:
                                # Input
                                self.placeholders[label_name] = tf.placeholder(tf.int32, [None], name=label_name)
                                labels = tf.one_hot(self.placeholders[label_name], choose_function_dims)        # [b, choose_function_dims]

                                # Loss
                                diff_loss = f_cf - labels                                                       # [b, choose_function_dims]
                                loss_cf = tf.reduce_sum(0.5 * tf.square(diff_loss), 1, keep_dims=True)          # [b, 1]
                                loss_cf = loss_cf * loss_scaling_factor

                                self.ops['loss_cf'] = loss_cf
                                losses.append(loss_cf)

                        # Action type: choose number
                        if action_meta['type'] == 'choose_number':
                            # Model
                            f_cn = self.state.weights[function_name](h_G)                                       # [b, 1]
                            self.ops[function_name] = f_cn

                            # Training
                            if self.enable_training:
                                # Input
                                self.placeholders[label_name] = tf.placeholder(tf.float32, [None],
                                                                               name=label_name)
                                labels = self.placeholders[label_name]                                          # [b, 1]

                                # Loss
                                diff_loss = f_cn - labels  # [b, choose_function_dims]
                                loss_cn = tf.reduce_sum(0.5 * tf.square(diff_loss), 1, keep_dims=True)          # [b, 1]
                                loss_cn = loss_cn * loss_scaling_factor

                                self.ops['loss_cn'] = loss_cn
                                losses.append(loss_cn)

                        # Action type: add edge to
                        if action_meta['type'] == 'add_edge_to':
                            # Model
                            h_v_repeated = tf.gather(h_v, embeddings_to_graph_mappings)                         # [b*v, 2h]

                            h_u_all = embeddings                                                                # [b*v, h]
                            h_u_all_h_v = tf.concat([h_u_all, h_v_repeated], 1)                                 # [b*v, 3h]

                            s_u = self.state.weights[function_name](h_u_all_h_v)                                # [b*v, e]

                            s_u_max = tf.unsorted_segment_max(data=s_u,
                                                              segment_ids=embeddings_to_graph_mappings_existent,
                                                              num_segments=num_graphs)                          # [b, e]
                            s_u_max = tf.reduce_max(s_u_max, axis=1)                                            # [b]
                            s_u_max = tf.broadcast_to(s_u_max, tf.shape(s_u))                                   # [b*v, e]
                            s_u_normalized = s_u - s_u_max                                                      # [b*v, e]
                            # - Build exponents
                            es = tf.math.exp(s_u_normalized)                                                    # [b*v, e]
                            # - Build sums
                            es_sum = tf.unsorted_segment_sum(data=es,
                                                             segment_ids=embeddings_to_graph_mappings_existent,
                                                             num_segments=num_graphs)                           # [b, e]
                            es_sum = tf.reduce_sum(es_sum, axis=1)                                              # [b]
                            es_sum = tf.broadcast_to(es_sum, tf.shape(es))                                      # [b*v, e]
                            # - Build softmax
                            f_nodes = es / es_sum
                            # end test

                            self.ops[function_name] = f_nodes

                            # Training
                            if self.enable_training:
                                # Input
                                self.placeholders[label_name] = tf.placeholder(tf.float32, [None, None], name=label_name)
                                labels = self.placeholders[label_name]                                          # [b*v, e]

                                # Loss
                                diff_loss = f_nodes - labels                                                    # [b*v, e]
                                sqared_loss = tf.square(diff_loss)                                              # [b*v, e]

                                loss_nodes = tf.unsorted_segment_sum(data=sqared_loss,
                                                                     segment_ids=embeddings_to_graph_mappings_existent,
                                                                     num_segments=num_graphs)                   # [b, e]
                                loss_nodes = loss_nodes * loss_scaling_factor                                   # [b, e]
                                loss_nodes = tf.reduce_sum(loss_nodes, axis=1, keep_dims=True)                  # [b, 1]

                                self.ops['loss_nodes'] = loss_nodes
                                losses.append(loss_nodes)

            # Training
            if self.enable_training:
                with tf.variable_scope('action_mask'):
                    action_mask = tf.slice(actions, [0, 1], [-1, len(action_metas) - 1])                        # [b, num_action_metas-1]

                    loss = tf.concat(losses, 1)                                                                 # [b, num_action_metas-1]
                    loss = loss * action_mask                                                                   # [b, num_action_metas-1]
                    loss = tf.reduce_sum(loss, 0)                                                               # [b]

                    self.ops['loss'] = tf.reduce_sum(loss)                                                      # Scalar

        return embeddings