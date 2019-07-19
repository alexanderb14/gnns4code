import argparse
import concurrent.futures
import json
import ntpath
import os
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
        filepaths[i] = filepaths[i][0]

    return filepaths

def delete_and_create_folder(path):
    if os.path.isdir(path):
        shutil.rmtree(path)
    os.mkdir(path)

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

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--code_dir", type=str,
                        help="directory of c code files")
    parser.add_argument("--out_dir", type=str,
                        help="directory to write graphs to")
    parser.add_argument("--bad_code_dir", type=str,
                        help="directory to write c files that produced errors to")
    parser.add_argument("--error_log_dir", type=str,
                        help="directory to write errors to")
    args = parser.parse_args()

    delete_and_create_folder(args.out_dir)
    delete_and_create_folder(args.bad_code_dir)
    delete_and_create_folder(args.error_log_dir)

    files = get_files_by_file_size(args.code_dir, False)

    def fnc(filename_absolute):
        filename = ntpath.basename(filename_absolute)

        cmd = [app_utils.CLANG_MINER_EXECUTABLE,
               '-extra-arg-before=-xcl',
                '-extra-arg=-I' + app_utils.LIBCLC_DIR,
                '-extra-arg=-include' + app_utils.OPENCL_SHIM_FILE,
                os.path.join(args.code_dir, filename),
               '-o', os.path.join(args.out_dir, filename + '.json')]

        process = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

        stdout, stderr = process.communicate()
        result = process.returncode

        # In case of an error
        if result != 0:
            # write error report file containing source, stdout, stderr
            report = ''

            report += 'SOURCE:' + '\n'
            report += utils.get_dash() + '\n'
            with open(os.path.join(args.code_dir, filename), 'r') as f:
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

            num_files = len([name for name in os.listdir(args.error_log_dir)])

            report_filename = os.path.join(
                args.error_log_dir,
                str(num_files) + '_' + filename + '.txt')
            with open(report_filename, 'w+') as f:
                f.write(report)

            # file that produced it
            shutil.copyfile(filename_absolute, os.path.join(args.bad_code_dir, filename))

        return result

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
            print('ok: %i, not_ok: %i, completed: %i, todo: %i, progress: %.2f' % (num_ok, num_not_ok, completed, todo, progress))

if __name__ == "__main__":
    main()
