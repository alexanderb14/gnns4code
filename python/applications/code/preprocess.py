import argparse
import concurrent.futures
import json
import os
import shutil
import subprocess
import sys

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
sys.path.append(SCRIPT_DIR + '/../..')
import applications.code.codegraph_models as codegraph_models
import applications.utils as app_utils
import utils


def bytecode_to_json_graph(bytecode:str):
    cmd = [app_utils.OPT_EXECUTABLE,
           '-load', app_utils.MINER_PASS_SHARED_LIBRARY,
           '-miner', '-', '-f', '-o', '/dev/null']

    process = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    stdout, _ = process.communicate(bytecode)

    return stdout


def opencl_kernel_c_code_to_llvm_graph(c_code:str):
    bytecode, _ = app_utils.compile_to_bytecode(c_code, True)
    json_graph = app_utils.bytecode_to_json_graph(bytecode)

    llvm_graph = codegraph_models.codegraph_create_from_miner_output(json.loads(json_graph))
    llvm_graph.c_code = c_code

    return llvm_graph


def process_files(files, preprocessing_artifact_dir, substract_str=None, optimize_for_size=False):
    out_dir = os.path.join(preprocessing_artifact_dir, 'out')
    good_code_dir = os.path.join(preprocessing_artifact_dir, 'bad_code')
    bad_code_dir = os.path.join(preprocessing_artifact_dir, 'good_code')
    error_log_dir = os.path.join(preprocessing_artifact_dir, 'error_logs')

    print(files)
    def fnc(filename):
        if substract_str:
            out_filename = filename.replace(substract_str + '/', '')
            out_filename = os.path.join(out_dir, out_filename)

            utils.create_folder(os.path.dirname(out_filename))
        else:
            out_filename = filename

        # C -> LLVM IR
        cmd_start = [app_utils.MINER_PASS_CLANG,
                     '-I' + app_utils.LIBCLC_DIR,
                     '-include', app_utils.OPENCL_SHIM_FILE]
        cmd_middle = ['-Oz'] if optimize_for_size else ['-O0']
        if 'npb' in filename:
            cmd_middle += ['-DM=1']
        if 'nvidia' in filename or ('rodinia' in filename and 'pathfinder' not in filename):
            cmd_middle += ['-DBLOCK_SIZE=64']

        cmd_end = ['-emit-llvm', '-xcl', '-c', filename, '-o', out_filename + '.ll']
        cmd_compile = cmd_start + cmd_middle + cmd_end
        print(' '.join(cmd_compile))

        process = subprocess.Popen(cmd_compile, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        stdout_compile, stderr_compile = process.communicate()
        result_compile = process.returncode

        # LLVM IR -> Graph
        cmd_miner = [app_utils.OPT_MINER_EXECUTABLE,
                     '-load', app_utils.MINER_PASS_SHARED_LIBRARY,
                     '-miner', out_filename + '.ll', '-f', '-o', '/dev/null']
        print(' '.join(cmd_miner))

        process = subprocess.Popen(cmd_miner, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        stdout_miner, stderr_miner = process.communicate(stdout_compile)
        result_miner = process.returncode

        with open(out_filename + '.json', 'bw') as f:
            f.write(stdout_miner)

        # In case of an error
        result = result_compile != 0 or result_miner != 0
        if result is False:
            report_filename = os.path.join(
                error_log_dir,
                filename.replace('/', '_') + '.txt')

            # write error report file containing source, stdout, stderr
            utils.write_error_report_file(filename, report_filename,
                                          [], [stderr_compile, stderr_miner])

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
    parser.add_argument("--code_dir", type=str, help="directory of c code files")
    parser.add_argument("--out_dir", type=str, help="directory to write graphs to")
    args = parser.parse_args()

    for filename in os.listdir(args.code_dir):
        with open(os.path.join(args.code_dir, filename), 'r') as f:
            bytecode, _ = app_utils.compile_to_bytecode(f.read(), True)
            json_graph = bytecode_to_json_graph(bytecode)

            with open(os.path.join(args.out_dir, filename + '.json'), 'w') as f_out:
                f_out.write(json_graph.decode("utf-8"))


if __name__ == "__main__":
    main()
