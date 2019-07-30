import argparse
import concurrent.futures
import json
import ntpath
import numpy as np
import os
import pandas as pd
import pickle
import shutil
import subprocess
import sys

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
sys.path.append(SCRIPT_DIR + '/../..')
import applications.clang_code.codegraph_models as codegraph_models
import applications.utils as app_utils
import utils


def get_kernel_names_from_df(A):
    A["group"] = ["A"] * len(A)

    benchmark_names = list(set(A['benchmark']))

    return benchmark_names


def get_files_by_file_size(dirname, reverse=False):
    """ Return list of file paths in directory sorted by file size.
     From: https://stackoverflow.com/questions/20252669/get-files-from-directory-argument-sorting-by-size """

    # Get list of files
    filepaths = []
    for basename in os.listdir(dirname):
        filename = os.path.join(dirname, basename)
        if os.path.isfile(filename):
            filepaths.append(filename)

    # Re-populate list with filename, size tuples
    for i in range(len(filepaths)):
        filepaths[i] = (filepaths[i], os.path.getsize(filepaths[i]))

    # Sort list by file size
    # If reverse=True sort from largest to smallest
    # If reverse=False sort from smallest to largest
    filepaths.sort(key=lambda filename: filename[1], reverse=reverse)

    # Re-populate list with just filenames
    for i in range(len(filepaths)):
        filepaths[i] = os.path.join(dirname, filepaths[i][0])

    return filepaths


def get_files_by_extension(dirname, extension):
    filepaths = []

    for root, dirs, files in os.walk(dirname):
        for file in files:
            if file.endswith(extension):
                filepaths.append(os.path.join(root, file))

    return filepaths


def delete_and_create_folder(path):
    shutil.rmtree(path, ignore_errors=True)
    os.makedirs(path, exist_ok=True)


def create_folder(path):
    os.makedirs(path, exist_ok=True)


def opencl_kernel_c_code_to_llvm_graph(c_code:str):
    # Code to json file
    with open('/tmp/tmp.c', 'w') as f:
        f.write(c_code)

    cmd = [app_utils.CLANG_MINER_EXECUTABLE,
           '-extra-arg-before=-xcl',
           '-extra-arg=-I' + app_utils.LIBCLC_DIR,
           '-extra-arg=-include' + app_utils.OPENCL_SHIM_FILE,
           '/tmp/tmp.c',
           '-o', '/tmp/tmp.json']
    ret = subprocess.call(cmd)

    # Json file to graph
    with open('/tmp/tmp.json') as f:
        graph = codegraph_models.codegraph_create_from_miner_output(json.loads(f.read()))
        return graph


def process_files(files, out_dir, good_code_dir, bad_code_dir, error_log_dir, substract_str=None):
    print(files)
    def fnc(filename):
        if substract_str:
            out_filename = filename.replace(substract_str + '/', '') + '.json'
            out_filename = os.path.join(out_dir, out_filename)

            create_folder(os.path.dirname(out_filename))
        else:
            out_filename = filename

        cmd = [app_utils.CLANG_MINER_EXECUTABLE,
               '-extra-arg-before=-xcl',
               '-extra-arg=-I' + app_utils.LIBCLC_DIR]
        cmd += ['-extra-arg=-include' + app_utils.OPENCL_SHIM_FILE]
        if 'npb' in filename:
            cmd += ['-extra-arg=-DM=1']
        if 'nvidia' in filename or ('rodinia' in filename and 'pathfinder' not in filename):
            cmd += ['-extra-arg=-DBLOCK_SIZE=64']
        cmd += [filename, '-o', out_filename]

        process = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

        stdout, stderr = process.communicate()
        result = process.returncode

        # In case of an error
        if result != 0:
            # write error report file containing source, stdout, stderr
            report = ''

            report += 'SOURCE:' + '\n'
            report += utils.get_dash() + '\n'

            with open(filename, 'r') as f:
                try:
                    report += f.read() + '\n'
                except:
                    pass

            report += 'STDOUT:' + '\n'
            report += utils.get_dash() + '\n'
            report += stdout.decode('utf-8') + '\n'

            report += 'STDERR:' + '\n'
            report += utils.get_dash() + '\n'
            report += stderr.decode('utf-8') + '\n'

            num_files = len([name for name in os.listdir(error_log_dir)])

            report_filename = os.path.join(
                error_log_dir,
                filename.replace('/', '_') + '.txt')
            with open(report_filename, 'w+') as f:
                f.write(report)

            shutil.copyfile(filename, os.path.join(bad_code_dir, os.path.basename(filename)))
        else:
            shutil.copyfile(filename, os.path.join(good_code_dir, os.path.basename(filename)))

        return result

    # Process files
    num_ok = 0
    num_not_ok = 0
    with concurrent.futures.ThreadPoolExecutor(max_workers=8) as executor:
        for result in executor.map(fnc, files):
            if result == 0:
                num_ok += 1
            else:
                num_not_ok += 1

            completed = num_ok + num_not_ok
            todo = len(files) - completed
            progress = float(completed) / float(len(files))
            print('ok: %i, not_ok: %i, completed: %i, todo: %i, progress: %.2f' % (
            num_ok, num_not_ok, completed, todo, progress))


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('command', help='Subcommand to run')
    subparsers = parser.add_subparsers()

    # Parse arguments
    parser.add_argument("--code_dir", type=str,
                        help="directory of c code files")
    parser.add_argument("--out_dir", type=str,
                        help="directory to write graphs to")
    parser.add_argument("--good_code_dir", type=str,
                        help="directory to write c files that are successfully processed to")
    parser.add_argument("--bad_code_dir", type=str,
                        help="directory to write c files that produced errors to")
    parser.add_argument("--error_log_dir", type=str,
                        help="directory to write errors to")

    parser.add_argument('--cgo17_benchmarks_csv', type=str)
    parser.add_argument("--pickle_out", type=str,
                        help="file to write to")
    parser.add_argument("--json_out", type=str,
                        help="file to write to")
    parser.add_argument("--cgo17_benchmarks_csv_out", type=str,
                        help="file to write to")

    args = parser.parse_args(sys.argv[1:])

    # Parse command
    command_arg = parser.parse_args(sys.argv[1:2])
    if not hasattr(command_arg, 'command'):
        print('Unrecognized command')
        parser.print_help()
        exit(1)

    delete_and_create_folder(args.out_dir)
    delete_and_create_folder(args.bad_code_dir)
    delete_and_create_folder(args.good_code_dir)
    delete_and_create_folder(args.error_log_dir)

    # Generative command
    if command_arg.command == 'generative':
        filenames = get_files_by_file_size(args.code_dir, False)

        process_files(filenames, args.out_dir, args.good_code_dir,
                      args.bad_code_dir, args.error_log_dir)

    # Predictive command
    if command_arg.command == 'predictive':
        # Find all .cl files and extract code graphs from them
        files = get_files_by_extension(args.code_dir, '.cl')

        process_files(files, args.out_dir, args.good_code_dir,
                      args.bad_code_dir, args.error_log_dir, args.code_dir)

        # Extract oracle from the cgo17 dataframe
        preprocessed = []
        num_nodes = []

        df_benchmarks = pd.read_csv(args.cgo17_benchmarks_csv)
        filenames = get_files_by_extension(args.out_dir, '.json')

        for filename in filenames:
            relative_filename = filename.replace(args.out_dir + '/', '')

            benchmark_suite_name = relative_filename.split('/')[0]
            if benchmark_suite_name == 'parboil-0.2' or benchmark_suite_name == 'rodinia-3.1':
                benchmark_name = relative_filename.split('/')[2].lower()
            elif benchmark_suite_name == 'shoc-1.1.5':
                benchmark_name = relative_filename.split('/')[4].upper()
            elif benchmark_suite_name == 'polybench-gpu-1.0':
                benchmark_name = relative_filename.split('/')[-2].lower()
                if benchmark_name == 'covar':
                    benchmark_name = 'covariance'
                elif benchmark_name == 'corr':
                    benchmark_name = 'correlation'
                elif benchmark_name == 'gramschm':
                    benchmark_name = 'gramschmidt'
            else:
                benchmark_name = relative_filename.split('/')[-2]

            with open(filename) as f:
                jRoot = json.load(f)
            graphs = codegraph_models.codegraphs_create_from_miner_output(jRoot)
            for graph_idx, graph in enumerate(graphs):
                function_name = graph.functions[0].name

                # Find this kernel in the cgo17 dataframe
                for idx, row in df_benchmarks.iterrows():
                    b = row['benchmark']
                    o = row['oracle']

                    function_name_cgo17 = b.split('-')[-1]
                    benchmark_name_cgo17 = b.split('-')[-2]
                    benchmark_suite_name_cgo17 = b.split('-')[0]

                    if function_name_cgo17 == function_name \
                            and benchmark_name_cgo17.upper() in benchmark_name.upper() \
                            and benchmark_suite_name_cgo17 in benchmark_suite_name:

                        jRoot['functions'][graph_idx][utils.AE.KERNEL_NAME] = b
                        jRoot['functions'][graph_idx][utils.L.LABEL_0] = o

                        # Transform
                        graph = codegraph_models.transform_graph(graph)

                        # Add information to graph
                        graph.name = b
                        graph.oracle = o

                        # Stats: Number of nodes
                        stats_vstr = codegraph_models.StatisticsVisitor()
                        graph.accept(stats_vstr)
                        num_nodes.append(stats_vstr.num_nodes)

                        preprocessed.append(graph)

                        print(benchmark_suite_name, benchmark_name, function_name, o, stats_vstr.num_nodes)

                        # TODO: Work group size!
                        break

        print('num_nodes_max:', np.max(num_nodes))
        print('num_nodes_mean:', np.mean(num_nodes))
        print('num_graphs:', len(preprocessed))

        # CodeGraph -> graph
        nic_vstr = codegraph_models.NodeTypeIdCreateVisitor()
        for graph in preprocessed:
            graph.accept(nic_vstr)
        node_types = nic_vstr.node_type_ids_by_statements
        print('num_node_types:', len(node_types))

        graphs_export = []
        names_export = []

        for graph in preprocessed:
            # Extract node types
            ne_vstr = codegraph_models.NodeTypesExtractionVisitor()
            graph.accept(ne_vstr)
            nodes = ne_vstr.node_types()

            # Extract edges
            ee_vstr = codegraph_models.EdgeExtractionVisitor()
            graph.accept(ee_vstr)
            edges = ee_vstr.edges

            graph_export = {
                utils.T.NODES: nodes,
                utils.T.EDGES: edges
            }
            if graph.oracle == 'CPU':
                graph_export[utils.L.LABEL_0] = 0
            elif graph.oracle == 'GPU':
                graph_export[utils.L.LABEL_0] = 1
            else:
                raise Exception()

            graphs_export.append(graph_export)
            names_export.append(graph.name)

        # Write to file
        with open(args.json_out, 'w') as f:
            data = {
                'node_types': node_types,
                'graphs': graphs_export,
                'names': names_export
            }
            json.dump(data, f)

        # Write cgo17 benchmarks csv file
        if args.cgo17_benchmarks_csv_out:
            # Find this kernel in the cgo17 dataframe
            for row_idx, row in df_benchmarks.iterrows():
                for name, graph in zip(names_export, graphs_export):
                    if row['benchmark'] == name:
                        df_benchmarks.loc[row_idx, 'clang_graph'] = json.dumps(graph)

            df_benchmarks.to_csv(args.cgo17_benchmarks_csv_out)


if __name__ == "__main__":
    main()
