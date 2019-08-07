import argparse
import json
import os
import sys

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
sys.path.append(SCRIPT_DIR + '/../..')
import graphgen.utils as utils
from applications.code.codegraph_models import codegraphs_create_from_miner_output, DotGraphVisitor, StatisticsVisitor, reorder, codegraph_to_action_sequence


def main():
    parser = argparse.ArgumentParser()

    # Required
    parser.add_argument("--json_dir_in", type=str)
    parser.add_argument("--json_out", type=str)

    # Filter
    parser.add_argument('--clip_at', type=int)
    parser.add_argument("--num_nodes_min", type=int)
    parser.add_argument("--num_nodes_max", type=int)
    parser.add_argument("--num_actions_max", type=int)

    # Optional
    parser.add_argument("--validate", action='store_true')
    parser.add_argument("--create_pngs", action='store_true')

    # Debug
    parser.add_argument("--debug", action='store_true')

    args = parser.parse_args()

    # 1: Create graphs from json files in json_dir_in
    graphs = []
    for i, filename in enumerate(os.listdir(os.path.join(SCRIPT_DIR, args.json_dir_in))):
        if args.clip_at:
            if int(args.clip_at) == i:
                break

        dir_and_filename = os.path.join(SCRIPT_DIR, args.json_dir_in, filename)

        if os.stat(dir_and_filename).st_size == 0:
            continue

        with open(dir_and_filename) as json_data:
            jRoot = json.load(json_data)
            graph = codegraphs_create_from_miner_output(jRoot)[0]
            graph.name = filename
            graphs.append(graph)
    print(len(graphs))

    # 2a: Get statistics, node_types and edge_type of parsed graphs
    #     and perform filtering
    num_nodes_max = 0

    filtered_graphs = []
    stats_vstr = StatisticsVisitor()
    for graph in graphs:
        graph.visit(stats_vstr)
        num_nodes = stats_vstr.current_num_nodes

        # Filter
        if num_nodes > args.num_nodes_min and num_nodes < args.num_nodes_max \
                and num_functions == 1:
            if num_nodes > num_nodes_max:
                num_nodes_max = num_nodes

            filtered_graphs.append(graph)

    del graphs

    # 2b: Update node_types and edge_types as some graphs have been filtered out
    filtered_stats_vstr = StatisticsVisitor()
    for graph in filtered_graphs:
        graph.visit(filtered_stats_vstr)

    summary = filtered_stats_vstr.get_summary()
    utils.pretty_print_dict(summary)

    node_types = summary['node_types']
    with open('../../node_types.json', 'w') as outfile:
        json.dump(node_types, outfile)
    edge_types = summary['edge_types']
    with open('../../edge_types.json', 'w') as outfile:
        json.dump(edge_types, outfile)

    # 3: Reorder
    for graph in filtered_graphs:
        graph = reorder(graph, 'DFS', args.debug)

    # 4: Create action sequences of graphs
    len_actions_max = 0

    preprocessed = []
    for i, graph in enumerate(filtered_graphs):
        actions = codegraph_to_action_sequence(graph, node_types, edge_types, args.debug)
        if len(actions) < args.num_actions_max:
            if len(actions) > len_actions_max:
                len_actions_max = len(actions)

            preprocessed.append({
                utils.AE.GRAPH_IDX: i,
                utils.AE.ACTIONS: actions
            })

    print('size of preprocessed data set:', len(preprocessed))
    print('len_actions_max:', len_actions_max)
    print('num_nodes_max:', num_nodes_max)

    # Optional: Dump actions to disk
    if args.json_out:
        with open(args.json_out, 'w') as outfile:
            json.dump(preprocessed, outfile)
        
    # Optional: Validate graphs
    if args.validate:
        for graph in filtered_graphs:
            valid_vstr = codegraph_models.ValidationCheckVisitor()
            graph.visit(valid_vstr)

    # Optional: Create png images of graphs
    if args.create_pngs:
        for i, graph in enumerate(filtered_graphs):
            dog_vstr = DotGraphVisitor(args.debug)
            graph.visit(dog_vstr)
        
            dog_vstr.save_to('/tmp/%s.png' % graph.name, 'png')

if __name__ == "__main__":
    main()
