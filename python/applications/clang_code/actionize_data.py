import argparse
import json
import matplotlib.pyplot as plt
import os
import pandas as pd
import shutil
import sys

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
sys.path.append(SCRIPT_DIR + '/../..')
import utils
from applications.clang_code.codegraph_models import codegraphs_create_from_miner_output, save_dot_graph, \
    transform_graph, create_action_sequence, is_graph_in_statement_names_whitelist, \
    NodeTypeIdCreateVisitor, StatisticsVisitor, StmtNameQueryVisitor


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


def main():
    parser = argparse.ArgumentParser()

    # Required
    parser.add_argument("--code_dir", type=str,
                        help="directory of c code files")
    parser.add_argument("--graph_dir", type=str,
                        help="directory of graph files")
    parser.add_argument("--json_out", type=str,
                        help="file to write to")

    # Filter
    parser.add_argument("--num_nodes_min", type=int,
                        help="minimum number of nodes for filter")
    parser.add_argument("--num_nodes_max", type=int,
                        help="maximum number of nodes for filter")
    parser.add_argument("--num_actions_min", type=int,
                        help="minimum number of actions for filter")
    parser.add_argument("--num_actions_max", type=int,
                        help="maximum number of actions for filter")
    parser.add_argument("--statement_name_whitelist_filter",
                        help="filter based on whitelist", action='store_true')
    parser.add_argument("--complex_types_filter",
                        help="filter based on complex types", action='store_true')
    parser.add_argument("--filename_blacklist_filter",
                        help="filter based on file names", action='store_true')

    # Optional
    parser.add_argument("--graph_stmt_names", type=str,
                        help="graph statement names")
    parser.add_argument("--histogram_node_counts", type=str,
                        help="histogram of node counts")
    parser.add_argument('--clip_at', type=int,
                        help='Break dataset processing at this number.')
    parser.add_argument("--create_pngs",
                        help="create pngs of training graphs", action='store_true')
    parser.add_argument("--dump_selected_graphs_as_c_files", type=str,
                        help="dump selected graphs as c files")

    # Debug
    parser.add_argument("--debug",
                        help="write verbose output to stdout", action='store_true')

    args = parser.parse_args()

    # 1: Create graphs from json files in graph_dir
    graph_files = os.listdir(os.path.join(SCRIPT_DIR, args.graph_dir))
    len_graph_files = len(graph_files)
    graphs = []

    for i, filename in enumerate(graph_files):
        utils.printProgressBar(i, len_graph_files, prefix='Parsing:', suffix='Complete', length=50)

        if args.clip_at:
            if int(args.clip_at) == i:
                break

        dir_and_filename = os.path.join(SCRIPT_DIR, args.graph_dir, filename)

        if os.stat(dir_and_filename).st_size == 0:
            continue

        with open(dir_and_filename) as json_data:
            jRoot = json.load(json_data)
            try:
                graph = codegraphs_create_from_miner_output(jRoot)[0]
                graph.name = filename
                graphs.append(graph)
            except:
                pass


    print('size of data set:', len(graphs))

    # 2: Transform graphs
    len_graphs = len(graphs)
    graphs_transformed = []

    for i, graph in enumerate(graphs):
        utils.printProgressBar(i, len_graphs, prefix='Transforming:', suffix='Complete', length=50)

        graphs_transformed.append(transform_graph(graph))
    len_graphs_transformed = len(graphs_transformed)

    # 3a: Get statistics and perform filtering
    graphs_filtered = []
    for i, graph in enumerate(graphs_transformed):
        utils.printProgressBar(i, len_graphs_transformed, prefix='Filtering by number of nodes:', suffix='Complete', length=50)

        num_functions = len(graph.functions)
        print(num_functions)

        stats_vstr = StatisticsVisitor()
        graph.accept(stats_vstr)
        num_nodes = stats_vstr.num_nodes

        ok = True
        if args.num_nodes_min:
            if num_nodes < args.num_nodes_min:
                ok = False

        if args.num_nodes_max:
            if num_nodes > args.num_nodes_max:
                ok = False

        if num_functions != 1:
            ok = False

        if args.statement_name_whitelist_filter:
            if not is_graph_in_statement_names_whitelist(graph, STATEMENT_NAME_WHITELIST):
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

    print('number of filtered data set:', len(graphs_filtered))

    # 3: Create node type ids
    nic_vstr = NodeTypeIdCreateVisitor()

    # 4: Filter based on number of actions
    num_graphs_filtered = len(graphs_filtered)
    graphs_filtered_by_num_actions = []

    num_actions_max = 0
    for i, graph in enumerate(graphs_filtered):
        utils.printProgressBar(i, num_graphs_filtered, prefix='Filtering by number of actions:', suffix='Complete', length=50)

        # Create action sequence
        graph.accept(nic_vstr)
        actions = create_action_sequence(graph, args.debug)
        num_actions = len(actions)

        if num_actions > num_actions_max:
            num_actions_max = num_actions

        # Filter based on number of actions
        ok = True
        if args.num_actions_min:
            if num_actions < args.num_actions_min:
                ok = False

        if args.num_actions_max:
            if num_actions > args.num_actions_max:
                ok = False

        if ok:
            graphs_filtered_by_num_actions.append(graph)

    # 5: Create action sequences and gather stats
    nic_vstr = NodeTypeIdCreateVisitor()

    num_graphs_filtered_by_num_actions = len(graphs_filtered_by_num_actions)
    num_nodes_max = 0

    preprocessed = []

    num_actions_max = 0
    for i, graph in enumerate(graphs_filtered_by_num_actions):
        utils.printProgressBar(i, num_graphs_filtered_by_num_actions, prefix='Actionizing:', suffix='Complete', length=50)

        # Number of nodes
        stats_vstr = StatisticsVisitor()
        graph.accept(stats_vstr)
        if stats_vstr.num_nodes > num_nodes_max:
            num_nodes_max = stats_vstr.num_nodes

        # Action sequence
        graph.accept(nic_vstr)
        actions = create_action_sequence(graph, args.debug)
        num_actions = len(actions)

        if num_actions > num_actions_max:
            num_actions_max = num_actions

        # Filter based on number of actions
        ok = True
        if args.num_actions_min:
            if num_actions < args.num_actions_min:
                ok = False

        if args.num_actions_max:
            if num_actions > args.num_actions_max:
                ok = False

        if ok:
            preprocessed.append({
                utils.AE.GRAPH_IDX: i,
                utils.AE.ACTIONS: actions
            })

    # Print node types and stats
    node_types = nic_vstr.node_type_ids_by_statements
#    utils.pretty_print_dict(node_types)

    print('num_actions_max:', num_actions_max)
    print('num_nodes_max:', num_nodes_max)
    print('num_node_types:', len(node_types))
    print('num_graphs:', len(preprocessed))

    # Optional: Dump graphs as c files
    if args.dump_selected_graphs_as_c_files:
        dump_dir = args.dump_selected_graphs_as_c_files
        if os.path.exists(dump_dir):
            shutil.rmtree(dump_dir)
        os.makedirs(dump_dir)

        for graph in graphs_filtered:
            filename, _ = os.path.splitext(graph.name)

            shutil.copyfile(
                os.path.join(args.code_dir, filename),
                os.path.join(dump_dir, filename)
            )

    # Optional: Plot statement names
    if args.graph_stmt_names:
        # Get statement names by graph
        stmt_names_by_graph = {}
        for i, graph in enumerate(graphs_filtered):
            snq_vstr = StmtNameQueryVisitor()
            graph.accept(snq_vstr)
            stmt_names_by_graph[graph.name] = snq_vstr.statement_names

        # Get all statement names
        all_stmt_names = set()
        for stmt_names in stmt_names_by_graph.values():
            all_stmt_names.update(stmt_names)

        # Create Pandas df
        df = pd.DataFrame(columns=stmt_names_by_graph.keys())

        # Add content: 1 if statement name exists, 0 if not
        for stmt_name in all_stmt_names:
            row = []

            for graph_name in stmt_names_by_graph.keys():
                if stmt_name in stmt_names_by_graph[graph_name]:
                    row.append(1)
                else:
                    row.append(0)

            df.loc[len(df)] = row

        # Add row names and set as index
        df.insert(loc=0, column='stmt_name', value=all_stmt_names)
        df.set_index("stmt_name", drop=True, inplace=True)

        fig = df.plot.bar(stacked=True, legend=False, figsize=(8, 8)).get_figure()
        fig.savefig(args.graph_stmt_names, bbox_inches='tight')

    # Optional: Plot histogram of node counts
    if args.histogram_node_counts:
        num_nodes = []

        for idx, graph in enumerate(graphs_transformed):
            stats_vstr = StatisticsVisitor()
            graph.accept(stats_vstr)

            #if stats_vstr.num_nodes < 100:
            num_nodes.append(stats_vstr.num_nodes)

        df = pd.DataFrame(num_nodes, columns=['num_nodes'])
        print(df)
        ax = df.hist(bins=20, figsize=(8, 8))
        plt.savefig('/tmp/hist.png')

    # Optional: Dump actions to disk
    if args.json_out:
        with open(args.json_out, 'w') as outfile:
            data = {
                'graphs': preprocessed,
                'types': node_types
            }

            json.dump(data, outfile)

    # Optional: Create png images of graphs
    if args.create_pngs:
        for i, graph in enumerate(graphs_filtered):
            print('Writing PNG: %s' % graph.name)
            save_dot_graph(graph, '/tmp/%s.png' % graph.name, 'png', args.debug)

if __name__ == "__main__":
    main()
