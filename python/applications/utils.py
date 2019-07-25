import os
import subprocess


SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))

import utils


def get_env_or_default(vairable_name, default_name):
    if vairable_name in os.environ:
        return os.environ[vairable_name]

    return default_name


def print_process_stdout_continuously(process, prefix):
    while True:
        line = process.stdout.readline()
        if not line:
            break
        print(prefix + ': ' + str(line.rstrip(), 'utf-8'))

    process.wait()
    print(prefix + ' RETURNCODE: ' + str(process.returncode))


def build_with_cmake(project_path, target):
    utils.print_dash()
    print('Build with cmake and make. Target: %s, Project path: %s' % (target, project_path))
    utils.print_dash()

    build_path = os.path.join(project_path, 'build')

    if not os.path.exists(build_path):
        subprocess.Popen(['mkdir', build_path], stdout=subprocess.PIPE, stderr=subprocess.PIPE, cwd=project_path)

        process = subprocess.Popen(['cmake', '..'], stdout=subprocess.PIPE, stderr=subprocess.PIPE, cwd=build_path)
        print_process_stdout_continuously(process, 'CMAKE')

    process = subprocess.Popen(['make', '-j', '4', target], stdout=subprocess.PIPE, stderr=subprocess.PIPE, cwd=build_path)
    print_process_stdout_continuously(process, 'MAKE')

    target_executable = os.path.join(build_path, target)
    return target_executable


def compile_to_bytecode(c_code:str, optimize_for_size=False):
    cmd_start = [MINER_PASS_CLANG,
                 '-I' + LIBCLC_DIR,
                 '-include', OPENCL_SHIM_FILE]
    cmd_optimize = ['-Oz'] if optimize_for_size else ['-O0']
    cmd_end = ['-emit-llvm', '-x', 'cl', '-c', '-', '-o', '-']
    cmd = cmd_start + cmd_optimize + cmd_end

    process = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    stdout, stderr = process.communicate(c_code.encode('utf-8'))

    return stdout, process.returncode


def format_c_code(c_code:str):
    cmd = [CLANG_FORMAT_EXECUTABLE]
    process = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    stdout, stderr = process.communicate(c_code.encode('utf-8'))

    process.wait()

    return stdout.decode("utf-8"), process.returncode


CLANG_EXECUTABLE = \
    get_env_or_default(
        'CLANG_EXECUTABLE',
        '/home/alex/clgen/lib/python3.6/site-packages/CLgen-0.4.1-py3.6.egg/clgen/data/bin/clang')
CLANG_FORMAT_EXECUTABLE = \
    get_env_or_default(
        'CLANG_FORMAT_EXECUTABLE',
        'clang-format')
OPT_EXECUTABLE = \
    get_env_or_default(
        'OPT_EXECUTABLE',
        '/usr/local/bin/opt')

MINER_PASS_CLANG = \
    get_env_or_default(
        'MINER_PASS_CLANG',
        'clang')
MINER_PASS_SHARED_LIBRARY = \
    get_env_or_default(
        'MINER_PASS_SHARED_LIBRARY',
        '/devel/git/ML-CodeGraph/c/miner_llvm_pass/build/lib/libminer_pass.so')
CLANG_MINER_EXECUTABLE = \
    build_with_cmake(os.path.join(SCRIPT_DIR, '..', '..', 'c', 'clang_miner'), 'clang_miner')

LIBCLC_DIR = \
    os.path.join(SCRIPT_DIR, '..', '..', 'c', '3rd_party', 'libclc')
OPENCL_SHIM_FILE = \
    os.path.join(SCRIPT_DIR, '..', '..', 'c', '3rd_party', 'opencl-shim.h')
