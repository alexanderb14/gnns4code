import argparse
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
    args = parser.parse_args()

    delete_and_create_folder(args.bad_code_dir)

    files = get_files_by_file_size(args.code_dir, True)

    num_ok = 0
    num_not_ok = 0
    for idx, filename_absolute in enumerate(files):
        filename = ntpath.basename(filename_absolute)

        utils.print_dash()
        print('Processing:', filename, 'Filesize:', os.path.getsize(os.path.join(args.code_dir, filename)))
        utils.print_dash()

        cmd = [app_utils.CLANG_MINER_EXECUTABLE,
               '-extra-arg-before=-xcl',
                '-extra-arg=-I' + app_utils.LIBCLC_DIR,
                '-extra-arg=-include' + app_utils.OPENCL_SHIM_FILE,
                os.path.join(args.code_dir, filename),
               '-o', os.path.join(args.out_dir, filename + '.json')]
        print(' '.join(cmd))

        ret = subprocess.call(cmd)

        if ret == 0:
            num_ok += 1
        else:
            print('ERROR. ret: %i' % ret)
            shutil.copyfile(filename_absolute, os.path.join(args.bad_code_dir, filename))
            num_not_ok += 1

        print('num_ok: %i, num_not_ok: %i, idx: %i' % (num_ok, num_not_ok, idx))

if __name__ == "__main__":
    main()
