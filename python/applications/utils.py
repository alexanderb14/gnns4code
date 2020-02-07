import os
import subprocess
import sys


SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))

import utils


def print_process_stdout_continuously(process, prefix):
    while True:
        line = process.stdout.readline()
        if not line:
            break
        print(prefix + ': ' + str(line.rstrip(), 'utf-8'))

    process.wait()
    print(prefix + ' RETURNCODE: ' + str(process.returncode))


def build_with_cmake(project_path, target, additional_cmake_arguments: list = [], is_library=False):
    utils.print_dash()
    print('Build with cmake and make. Target: %s, Project path: %s' % (target, project_path))
    utils.print_dash()

    target_executable = 'NOT_BUILT'
    try:
        build_path = os.path.join(project_path, 'build')

        if not os.path.exists(build_path):
            subprocess.Popen(['mkdir', build_path], stdout=subprocess.PIPE, stderr=subprocess.PIPE, cwd=project_path)

            cmd = ['cmake', '..', '-DCMAKE_BUILD_TYPE=Release'] + additional_cmake_arguments
            print(' '.join(cmd))

            process = subprocess.Popen(['cmake', '..'] + additional_cmake_arguments, stdout=subprocess.PIPE, stderr=subprocess.PIPE, cwd=build_path)
            print_process_stdout_continuously(process, 'CMAKE')

        process = subprocess.Popen(['make', '-j', '4', target], stdout=subprocess.PIPE, stderr=subprocess.PIPE, cwd=build_path)
        print_process_stdout_continuously(process, 'MAKE')

        if is_library:
            target_executable = os.path.join(build_path, 'lib', 'lib' + target + '.so')
        else:
            target_executable = os.path.join(build_path, target)
    except:
        print(sys.exc_info()[0])

    return target_executable


def compile_to_bytecode(c_code:str, optimize_for_size=False):
    cmd_start = [CLANG_EXECUTABLE,
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


def get_llvm_build_dir():
    # First check for custom provided build
    env_var_name = 'LLVM_BUILD'
    if env_var_name in os.environ:
        return os.environ[env_var_name]

    # Then default to project build
    return os.path.join(SCRIPT_DIR, '/devel/git/llvm-project/build')


# Executables / Libraries
CLANG_EXECUTABLE = os.path.join(get_llvm_build_dir(), 'bin/clang')
CLANG_FORMAT_EXECUTABLE = os.path.join(get_llvm_build_dir(), 'bin/clang-format')
OPT_EXECUTABLE = os.path.join(get_llvm_build_dir(), 'bin/opt')

MINER_PASS_SHARED_LIBRARY = \
    build_with_cmake(os.path.join(SCRIPT_DIR, '../../c/miner_llvm_pass'),
                     'miner_pass',
                     ['-DCMAKE_PREFIX_PATH=/devel/git/llvm-project/build/lib/cmake/llvm'], is_library=True)
CLANG_MINER_EXECUTABLE = \
    build_with_cmake(os.path.join(SCRIPT_DIR, '../../c/clang_miner'),
                     'clang_miner',
                     ['-DCMAKE_PREFIX_PATH=/devel/git/llvm-project/build/lib/cmake/clang'])

LIBCLC_DIR = \
    os.path.join(SCRIPT_DIR, '..', '..', 'c', '3rd_party', 'libclc')
OPENCL_SHIM_FILE = \
    os.path.join(SCRIPT_DIR, '..', '..', 'c', '3rd_party', 'opencl-shim.h')
