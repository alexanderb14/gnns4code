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


def process_files(files, preprocessing_artifact_dir, substract_str=None):
    out_dir = os.path.join(preprocessing_artifact_dir, 'out')
    good_code_dir = os.path.join(preprocessing_artifact_dir, 'bad_code')
    bad_code_dir = os.path.join(preprocessing_artifact_dir, 'good_code')
    error_log_dir = os.path.join(preprocessing_artifact_dir, 'error_logs')

    print(files)
    def fnc(filename):
        if substract_str:
            out_filename = filename.replace(substract_str + '/', '') + '.json'
            out_filename = os.path.join(out_dir, out_filename)

            utils.create_folder(os.path.dirname(out_filename))
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

        print(' '.join(cmd))

        process = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

        stdout, stderr = process.communicate()
        result = process.returncode

        # In case of an error
        if result != 0:
            report_filename = os.path.join(
                error_log_dir,
                filename.replace('/', '_') + '.txt')

            # write error report file containing source, stdout, stderr
            utils.write_error_report_file(filename, report_filename, [stdout], [stderr])

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

    parser.add_argument("--json_out", type=str,
                        help="file to write to")

    args = parser.parse_args(sys.argv[1:])

    # Parse command
    command_arg = parser.parse_args(sys.argv[1:2])
    if not hasattr(command_arg, 'command'):
        print('Unrecognized command')
        parser.print_help()
        exit(1)

    utils.delete_and_create_folder(args.out_dir)
    utils.delete_and_create_folder(args.bad_code_dir)
    utils.delete_and_create_folder(args.good_code_dir)
    utils.delete_and_create_folder(args.error_log_dir)

    # Generative command
    if command_arg.command == 'generative':
        filenames = utils.get_files_by_file_size(args.code_dir, False)

        process_files(filenames, args.out_dir, args.good_code_dir,
                      args.bad_code_dir, args.error_log_dir)

        # Write to file
        with open(args.json_out, 'w') as f:
            data = {
                'node_types': node_types,
                'graphs': graphs_export,
                'names': names_export
            }
            json.dump(data, f)

if __name__ == "__main__":
    main()
