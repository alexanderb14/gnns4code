import json
import applications.code.codegraph_models as codegraph_models
import applications.code.llvm_utils as llvm_utils
import applications.code.preprocess as preprocess
import test.model.DeepGMGModelTest as DeepGMGModelTest
from model.DeepGMGModel import DeepGMGState, DeepGMGTrainer

KERNEL_SMALL=\
    "__kernel void A(__global int* a) {\
        if ((2 == 0)) {\
            int b = 1;\
            a[0] = b;\
        } else {\
            int c = 2;\
            a[0] = c;\
        }\
    }"

KERNEL_MEDIUM=\
    "__kernel void A(__global int* a) {\
        __local int b, c;\
        b = 0;\
        c = 0;\
        b++;\
        atomic_add(&c, 1);\
        a[0] = b;\
        a[1] = c;\
    }"

action_metas = \
    [
        {
            'name': 'init_node',
            'type': 'init_node',
            'input_dimension': 1,
            'loss_scaling_factor': 1
        },
        {
            'name': 'add_instruction_node',
            'type': 'add_instruction_node',
            'input_dimension': len(llvm_utils.LLVM_NODE_TYPES.instruction_node_types),
            'loss_scaling_factor': 1,
        },
        {
            'name': 'add_edge',
            'type': 'add_edge',
            'input_dimension': 2,
            'loss_scaling_factor': 1
        },
        {
            'name': 'add_edge_to',
            'type': 'add_edge_to',
            'input_dimension': 'num_edge_types',
            'loss_scaling_factor': 1
        },
        {
            'name': 'add_type_node',
            'type': 'add_type_node',
            'input_dimension': len(llvm_utils.LLVM_NODE_TYPES.type_node_types),
            'loss_scaling_factor': 1,
        },
        {
            'name': 'add_const_value_node',
            'type': 'add_const_value_node',
            'input_dimension': len(llvm_utils.LLVM_NODE_TYPES.const_value_node_types),
            'loss_scaling_factor': 1,
        },
        {
            'name': 'add_struct',
            'type': 'add_edge',
            'input_dimension': 2,
            'loss_scaling_factor': 1
        },
        {
            'name': 'add_global',
            'type': 'add_edge',
            'input_dimension': 2,
            'loss_scaling_factor': 1
        },
        {
            'name': 'add_function',
            'type': 'add_edge',
            'input_dimension': 2,
            'loss_scaling_factor': 1
        },
        {
            'name': 'choose_br_edge',
            'type': 'add_edge',
            'input_dimension': 2,
            'loss_scaling_factor': 1
        },
        {
            'name': 'choose_struct',
            'type': 'add_edge_to',
            'input_dimension': 'num_edge_types',
            'loss_scaling_factor': 1
        },
        {
            'name': 'choose_function',
            'type': 'choose_function',
            'input_dimension': 2,
            'loss_scaling_factor': 1
        },
        {
            'name': 'choose_local_function',
            'type': 'add_edge_to',
            'input_dimension': 'num_edge_types',
            'loss_scaling_factor': 1
        },
        {
            'name': 'choose_number',
            'type': 'choose_number',
            'input_dimension': 2,
            'loss_scaling_factor': 1
        },
        {
            'name': 'choose_structural_number',
            'type': 'choose_number',
            'input_dimension': 2,
            'loss_scaling_factor': 1
        },
        {
            'name': 'add_operand',
            'type': 'add_edge',
            'input_dimension': 'num_edge_types',
            'loss_scaling_factor': 1
        },
        {
            'name': 'choose_static',
            'type': 'add_edge',
            'input_dimension': 2,
            'loss_scaling_factor': 1
        }

    ]


config = {}
config.update(DeepGMGModelTest.CONFIG_DEFAULTGRAPH)
config['actions'] = action_metas
config.update({
        "learning_rate": 0.001,
        "num_edge_types": llvm_utils.LLVM_EDGE_TYPES.get_num_edge_types(),
        "num_node_types": llvm_utils.LLVM_NODE_TYPES.get_num_node_types(),
        'hidden_size': 16,
        "gen_num_node_max": 200,
        'extended_init': True,
        'choose_function_dims': 920,
        'add_instruction_node_input_dims' : len(llvm_utils.LLVM_NODE_TYPES.instruction_node_types),
        'add_type_node_input_dims' : len(llvm_utils.LLVM_NODE_TYPES.type_node_types),
        'add_const_value_node_input_dims' : len(llvm_utils.LLVM_NODE_TYPES.const_value_node_types)
    })

def run_llvm_pipeline(kernel, num_graphs_to_generate, epochs):

    bytecode, _ = preprocess.compile_to_bytecode(kernel, True)
    json_graph = preprocess.bytecode_to_json_graph(bytecode)
    llvm_graph = codegraph_models.codegraph_create_from_miner_output(json.loads(json_graph))
    llvm_graph = codegraph_models.reorder(llvm_graph, "BFS")
    graph_actionizer = llvm_utils.GraphActionizer(debug=False)
    graph_actionizer.actionize(llvm_graph)

    local_config = {}
    local_config.update(config)
    local_config.update({"num_epochs": epochs, "num_training_unroll": len(graph_actionizer.actions)})

    actions_by_graphs = [graph_actionizer.actions]
    graph_sizes = [graph_actionizer.internal_llvm_graph.get_num_nodes()]
    state = DeepGMGState(local_config)
    trainer = DeepGMGTrainer(local_config, state)
    trainer.train(actions_by_graphs, graph_sizes)
    generator = llvm_utils.GraphGenerator(config=local_config, state=state)

    num_graphs_equal = 0

    for i in range(num_graphs_to_generate):
        try:
            generator.generate_graph()
            graphs_equivalent = graph_actionizer.internal_llvm_graph.is_equivalent_to(generator.internal_llvm_graph)
            if not graphs_equivalent:
                print("GRAPHS NOT EQUIVALENT")
            else:
                print("GRAPHS EQUIVALENT")
                num_graphs_equal +=1

        except Exception as ex:
            print("GRAPHS NOT EQUIVALENT (EXCEPTION)")

    return num_graphs_equal

def test_llvm_pipeline_small():
    NUM_GRAPHS_TO_GENERATE = 10
    NUM_GRAPHS_TO_BE_EQUAL = 5

    num_graphs_equal = run_llvm_pipeline(kernel=KERNEL_SMALL, num_graphs_to_generate=NUM_GRAPHS_TO_GENERATE, epochs=1000)

    assert num_graphs_equal > NUM_GRAPHS_TO_BE_EQUAL

def test_llvm_pipeline_medium():
    NUM_GRAPHS_TO_GENERATE = 10
    NUM_GRAPHS_TO_BE_EQUAL = 5

    num_graphs_equal = run_llvm_pipeline(kernel=KERNEL_MEDIUM, num_graphs_to_generate=NUM_GRAPHS_TO_GENERATE, epochs=2000)

    assert num_graphs_equal > NUM_GRAPHS_TO_BE_EQUAL


