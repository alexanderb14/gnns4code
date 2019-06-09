import argparse
import json
import os
import subprocess
import sys

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
sys.path.append(SCRIPT_DIR + '/../..')
import applications.code.codegraph_models as codegraph_models
import applications.utils_llvm as app_utils


def format_c_code(c_code:str):
    cmd = [app_utils.CLANG_FORMAT_EXECUTABLE]
    process = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    stdout, stderr = process.communicate(c_code.encode('utf-8'))

    return stdout.decode("utf-8"), process.returncode

def compile_to_bytecode(c_code:str, optimize_for_size=False):
    optimize_for_size = False
    cmd_start = [app_utils.MINER_PASS_CLANG,
                 '-I' + app_utils.LIBCLC_DIR,
                 '-include', app_utils.OPENCL_SHIM_FILE]
    cmd_optimize = ['-Oz'] if optimize_for_size else ['-O1']


    cmd_end = ['-emit-llvm', '-x', 'cl', '-c', '-', '-o', "-"]
    cmd = cmd_start + cmd_optimize + cmd_end

    command = ""
    for part in cmd:
        command += part + " "
    process = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    stdout, stderr = process.communicate(c_code.encode('utf-8'))

    return stdout, process.returncode

def bytecode_to_json_graph(bytecode:str):
    cmd = [app_utils.OPT_EXECUTABLE,
           '-load', app_utils.MINER_PASS_SHARED_LIBRARY,
           '-miner', '-', '-f', '-o', '/dev/null', '-disable-verify']


    process = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    stdout, stderr = process.communicate(bytecode)

    return stdout

def opencl_kernel_c_code_to_llvm_graph(c_code:str):
    bytecode, _ = compile_to_bytecode(c_code, True)
    json_graph = bytecode_to_json_graph(bytecode)

    llvm_graph = codegraph_models.codegraph_create_from_miner_output(json.loads(json_graph))
    llvm_graph.c_code = c_code

    return llvm_graph

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--code_dir", type=str, help="directory of c code files")
    parser.add_argument("--out_dir", type=str, help="directory to write graphs to")
    args = parser.parse_args()

    for filename in os.listdir(args.code_dir):
        with open(os.path.join(args.code_dir, filename), 'r') as f:
            bytecode, _ = compile_to_bytecode(f.read(), True)
            json_graph = bytecode_to_json_graph(bytecode)

            with open(os.path.join(args.out_dir, filename + '.json'), 'w') as f_out:
                f_out.write(json_graph.decode("utf-8"))

if __name__ == "__main__":
    main()
