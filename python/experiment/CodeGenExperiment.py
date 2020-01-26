import argparse
import json
import os
import shutil
import sys
import tqdm

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
sys.path.append(SCRIPT_DIR + '/..')

import utils
import applications.utils as app_utils

import applications.clang_code.codegraph_models as clang_codegraph_models
import applications.clang_code.preprocess as clang_preprocess
from model.DeepGMGModel import DeepGMGModel, DeepGMGState, DeepGMGTrainer, DeepGMGGenerator


STATEMENT_NAME_WHITELIST = [
    'ArraySubscriptExpr',
    'BinaryOperator',
    'CallExpr',
    'CharacterLiteral',
    'CompoundAssignOperator',
    'CompoundStmt',
    'DeclStmt',
    'ForStmt',
    'FunctionArgument',
    'IfStmt',
    'IntegerLiteral',
    'ParenExpr',
    'ReturnStmt',
    'UnaryOperator',
    'WhileStmt'
]

FILE_NAME_BLACKLIST_10_30_STATEMENT_NAME_WHITELIST_COMPLEX_TYPE_FILTERED = [
    'https-api-github-com-repos-google-clspv-git-blobs-3ac5afccc676aa6315215b6b403b672a27587671',
    'https-api-github-com-repos-mc-imperial-gpuverify-git-blobs-e28a601d9ac2236409e49ea82437aff5a091becb',
    'https-api-github-com-repos-TU-Berlin-DIMA-OpenCL-SIMD-hashing-git-blobs-950f2c74617d0075e2cadbb59911ca32e9283ca9',
    'https-api-github-com-repos-YaccConstructor-Brahma-FSharp-git-blobs-1fc3b268ead0fd88d4f2edda5cc26e466874cd62'
]

CONFIG = {
    "f_add_edge_to_relevant_node_masking": 1,
    "use_edge_bias": 1,
    "tie_fwd_bkwd": 0,

    "save_best_model_interval": 1,

    "num_edge_types": 4,

    "learning_rate": 0.0001,
    "clamp_gradient_norm": 1.0,

    "batch_size": 100,

    "gnn_h_size": 128,
    "gnn_m_size": 2,
    "num_timesteps": 4,

    "gen_num_node_max": 100,

    "gradient_monitoring": 0,
    "do_validstep": 0,
    "batch_scheduling_policy": "LIFO",

    "num_epochs": 1000000,
    "num_epoch_start": 0,

    "random_seed": 0,
    "newline_logging": 1,
    "debug": 0,
    "write_best_epoch_to_file": 1,

    "actions": [
        {
            "name": "init_node",
            "type": "init_node",
            "input_dimension": 1,
            "loss_scaling_factor": 1
        },
        {
            "name": "add_node",
            "type": "add_node",
            "input_dimension": "num_node_types",
            "loss_scaling_factor": 1
        },
        {
            "name": "add_edge",
            "type": "add_edge",
            "input_dimension": 2,
            "loss_scaling_factor": 1
        },
        {
            "name": "add_edge_to",
            "type": "add_edge_to",
            "input_dimension": "num_edge_types",
            "loss_scaling_factor": 1
        }
    ]
}


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('command', help='Subcommand to run')
    subparsers = parser.add_subparsers()

    # Parse command
    command_arg = parser.parse_args(sys.argv[1:2])
    if not hasattr(command_arg, 'command'):
        print('Unrecognized command')
        parser.print_help()
        exit(1)

    # Train command
    if command_arg.command == 'train':
        # Parse args
        parser_train = subparsers.add_parser('train')

        parser_train.add_argument("--artifact_dir", type=str,
                                 help="out directory containing preprocessing information")

        args = parser_train.parse_args(sys.argv[2:])

        #
        # Build Config
        config = CONFIG

        # Load data
        with open(os.path.join(args.artifact_dir, 'actions.json'), 'r') as f:
            data = json.load(f)

            train_data = json.loads(json.dumps(data), object_hook=utils.json_keys_to_int)

        # Get statistics of dataset and dimension model
        data_stats = utils.get_data_stats(train_data)
        utils.pretty_print_dict(data_stats)
        config['num_training_unroll'] = data_stats['num_actions_max'] + 1
        config['num_node_types'] = data_stats['num_node_types'] + 1

        with open(os.path.join(args.artifact_dir, 'config.json'), 'w') as fp:
            json.dump(config, fp)
        utils.pretty_print_dict(config)

        # Create objects
        state = DeepGMGState(config)
        trainer = DeepGMGTrainer(config, state, args.artifact_dir)

        # Train
        trainer.train(train_data)

        # Save weights
        state.save_weights_to_disk(trainer.model_file)

    # Generate command
    if command_arg.command == 'generate':
        # Parse args
        parser_generate = subparsers.add_parser('generate')

        parser_generate.add_argument("--artifact_dir", type=str,
                                    help="directory containing training information")
        parser_generate.add_argument('--num_generate')
        parser_generate.add_argument("--create_pngs")
        parser_generate.add_argument("--temperature", type=float)

        args = parser_generate.parse_args(sys.argv[2:])

        #
        # Build Config
        with open(os.path.join(args.artifact_dir, 'config.json'), 'r') as fp:
            config = json.load(fp)
        print('Config: %s' % json.dumps(config))

        # Create objects
        state = DeepGMGState(config)
        generator = DeepGMGGenerator(config, state, args.temperature)
        state.restore_weights_from_disk(os.path.join(args.artifact_dir, 'training', 'model', 'model.pickle'))

        # Generate
        graphs = []
        graphs_valid = []

        for i in range(0, int(args.num_generate)):
            # Restore node types
            with open(os.path.join(args.artifact_dir, 'node_types.json'), 'r') as f:
                node_types = json.load(f)

            graph, p_codegraph, p_min = generator.generate_clang(node_types)
            graphs.append(graph)

            # Optional: Write dot graphs
            if args.create_pngs:
                try:
                    clang_codegraph_models.save_dot_graph(
                        graph, os.path.join(args.create_pngs, 'graph_%i.png' % i), 'png', node_types, True)
                except RecursionError:
                    pass

            # Optional: Validate
            try:
                # Generate code
                cg_vstr = clang_codegraph_models.CodeGenVisitor(500)
                graph.accept(cg_vstr, clang_codegraph_models.sort_edges_conforming_c_syntax)

                # Format code
                code = cg_vstr.get_code_as_str()
                code_formatted, returncode_format = app_utils.format_c_code(code)

                _, returncode_compile = app_utils.compile_to_bytecode(code)

                if returncode_format == 0 and returncode_compile == 0:
                    print('C Code:')
                    print(code_formatted)

                    graph.c_code = code_formatted
                    graphs_valid.append(graph)

            except Exception as e:
                print(str(e))

            print('p_codegraph: %.4f, p_min: %.4f' % (p_codegraph, p_min))
            print('Number generated: %i, Number valid: %i, Percent valid: %.4f' % (
                i, len(graphs_valid), len(graphs_valid) / len(graphs)))
            utils.print_dash()



    # Preprocess command
    if command_arg.command == 'preprocess':
        # Parse args
        parser_prep = subparsers.add_parser('preprocess')

        parser_prep.add_argument("--code_dir", type=str,
                            help="directory of c code files")
        parser_prep.add_argument("--artifact_dir", type=str,
                                 help="out directory containing preprocessing information")

        # Filter
        parser_prep.add_argument("--num_nodes_min", type=int,
                            help="minimum number of nodes for filter")
        parser_prep.add_argument("--num_nodes_max", type=int,
                            help="maximum number of nodes for filter")
        parser_prep.add_argument("--num_actions_max", type=int,
                            help="maximum number of actions for filter")
        parser_prep.add_argument("--statement_name_whitelist_filter",
                            help="filter based on whitelist", action='store_true')
        parser_prep.add_argument("--complex_types_filter",
                            help="filter based on complex types", action='store_true')
        parser_prep.add_argument("--filename_blacklist_filter",
                            help="filter based on file names", action='store_true')

        # Optional
        parser_prep.add_argument("--graph_stmt_names", type=str,
                            help="graph statement names")
        parser_prep.add_argument("--histogram_node_counts", type=str,
                            help="histogram of node counts")
        parser_prep.add_argument('--clip_at', type=int,
                            help='Break dataset processing at this number.')
        parser_prep.add_argument("--create_pngs",
                            help="create pngs of training graphs", action='store_true')
        parser_prep.add_argument("--dump_selected_graphs_as_c_files", type=str,
                        help="dump selected graphs as c files")
        parser_prep.add_argument("--debug",
                            help="write verbose output to stdout", action='store_true')

        args = parser_prep.parse_args(sys.argv[2:])

        # # C -> JSON Kernels
        # filenames = utils.get_files_by_file_size(args.code_dir, False)
        #
        # utils.prepare_preprocessing_artifact_dir(args.preprocessing_artifact_dir)
        # clang_preprocess.process_source_directory(filenames, args.preprocessing_artifact_dir, None)

        # Actionize
        graph_dir = os.path.join(args.artifact_dir, 'out')

        # PROCESSING 1: Create graphs from json files in graph_dir
        num_ok = 0
        num_not_ok = 0

        graphs = []
        files = os.listdir(graph_dir)
        for i, filename in enumerate(tqdm.tqdm(files, desc='JSON -> Graph')):
            if args.clip_at:
                if int(args.clip_at) == i:
                    break

            dir_and_filename = os.path.join(SCRIPT_DIR, graph_dir, filename)

            if os.stat(dir_and_filename).st_size == 0:
                continue

            with open(dir_and_filename) as file:
                try:
                    jRoot = json.load(file)

                    gs = clang_codegraph_models.codegraphs_create_from_miner_output(jRoot)
                    if len(gs) != 1:
                        raise Exception()
                    g = gs[0]
                    g.name = filename

                    graphs.append(g)

                    num_ok += 1
                except:
                    num_not_ok += 1

                    pass

        print('ok: %i, not_ok: %i' % (num_ok, num_not_ok))
        print('size of data set:', len(graphs))

        # PROCESSING 2: Transform graphs
        graphs_transformed = []
        for graph in tqdm.tqdm(graphs, desc='Transforming graphs'):
            graphs_transformed.append(clang_codegraph_models.transform_graph(graph))

        # PROCESSING 3: Create action sequences of graphs
        nic_vstr = clang_codegraph_models.NodeTypeIdCreateVisitor(with_functionnames=False)

        for i, graph in enumerate(tqdm.tqdm(graphs_transformed, desc='Creating action sequences')):
            # Action sequence
            graph.accept(nic_vstr)
            graph.actions = clang_codegraph_models.create_action_sequence(graph, args.debug)

        # PROCESSING 4: Get statistics and perform filtering
        graphs_filtered = []
        for graph in tqdm.tqdm(graphs_transformed, desc='Filtering graphs'):
            stats_vstr = clang_codegraph_models.StatisticsVisitor()
            graph.accept(stats_vstr)

            num_nodes = stats_vstr.num_nodes

            ok = True
            if args.num_nodes_min and args.num_nodes_max:
                if num_nodes < args.num_nodes_min or num_nodes > args.num_nodes_max:
                    ok = False

            if args.num_actions_max:
                if len(graph.actions) > args.num_actions_max:
                    ok = False

            if args.statement_name_whitelist_filter:
                if not clang_codegraph_models.is_graph_in_statement_names_whitelist(graph, STATEMENT_NAME_WHITELIST):
                    ok = False

            if args.complex_types_filter:
                if graph.has_complex_types == True:
                    ok = False

            if args.filename_blacklist_filter:
                for filename in FILE_NAME_BLACKLIST_10_30_STATEMENT_NAME_WHITELIST_COMPLEX_TYPE_FILTERED:
                    if filename in graph.name:
                        ok = False

            if ok:
                graphs_filtered.append(graph)

        # PROCESSING 5: Get final node types
        final_nic_vstr = clang_codegraph_models.NodeTypeIdCreateVisitor(with_functionnames=False)
        for i, graph in enumerate(tqdm.tqdm(graphs_filtered, desc='Creating final node ids')):
            # Action sequence
            graph.accept(final_nic_vstr)
        node_types = final_nic_vstr.node_type_ids_by_statements

        # PROCESSING 6: Again, create action sequences of graphs. This is needed because the node types changed
        #               and they're part of the action sequences.
        nic_vstr = clang_codegraph_models.NodeTypeIdCreateVisitor(with_functionnames=False)

        for i, graph in enumerate(tqdm.tqdm(graphs_filtered, desc='Creating action sequences')):
            # Action sequence
            graph.accept(nic_vstr)
            graph.actions = clang_codegraph_models.create_action_sequence(graph, args.debug)

        # Save node types
        with open(os.path.join(args.artifact_dir, 'node_types.json'), 'w') as outfile:
            json.dump(node_types, outfile)

        # Save actions to disk
        preprocessed = []
        for i, graph in enumerate(graphs_filtered):
            preprocessed.append({
                utils.AE.GRAPH_IDX: i,
                utils.AE.ACTIONS: graph.actions
            })
        with open(os.path.join(args.artifact_dir, 'actions.json'), 'w') as outfile:
            json.dump(preprocessed, outfile)

        # Optional: Print stats
        if args.debug:
            utils.pretty_print_dict(node_types)

        # Print stats
        num_actions_max = 0
        num_nodes_max = 0
        for graph in graphs_filtered:
            num_actions_max = max(num_actions_max, len(graph.actions))

            stats_vstr = clang_codegraph_models.StatisticsVisitor()
            graph.accept(stats_vstr)
            num_nodes_max = max(num_nodes_max, stats_vstr.num_nodes)

        print('num_node_types:', len(node_types))
        print('num_actions_max:', num_actions_max)
        print('num_nodes_max:', num_nodes_max)
        print('num_graphs:', len(graphs_filtered))

        # Optional: Dump graphs as c files
        if args.dump_selected_graphs_as_c_files:
            dump_dir = args.dump_selected_graphs_as_c_files
            if os.path.exists(dump_dir):
                shutil.rmtree(dump_dir)
            os.makedirs(dump_dir)

            for graph in tqdm.tqdm(graphs_filtered, desc='Saving C files'):
                filename, _ = os.path.splitext(graph.name)

                shutil.copyfile(
                    os.path.join(args.code_dir, filename),
                    os.path.join(dump_dir, filename))

if __name__ == '__main__':
    main()
