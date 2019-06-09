import os

def get_base_dir():
    return os.path.join(os.path.dirname(os.path.realpath(__file__)), "..", "..", "..", "..")

def get_repo_dir():
    return os.path.join(os.path.dirname(os.path.realpath(__file__)), "..", "..")

def get_env_or_default(vairable_name, default_name):
    if vairable_name in os.environ:
        return os.environ[vairable_name]

    return default_name


CLANG_EXECUTABLE = \
    get_env_or_default(
        'CLANG_EXECUTABLE',
        get_base_dir() +'/clgen/lib/python3.6/site-packages/CLgen-0.4.1-py3.6.egg/clgen/data/bin/clang')
CLANG_FORMAT_EXECUTABLE = \
    get_env_or_default(
        'CLANG_FORMAT_EXECUTABLE',
        get_base_dir() + '/clgen-0.4.1/third_party/llvm/3.9.0/build/bin/clang-format')
OPT_EXECUTABLE = \
    get_env_or_default(
        'OPT_EXECUTABLE',
        'opt-6.0')

MINER_PASS_CLANG = \
    get_env_or_default(
        'MINER_PASS_CLANG',
        'clang-6.0')
MINER_PASS_SHARED_LIBRARY = \
    get_env_or_default(
        'MINER_PASS_SHARED_LIBRARY',
        get_repo_dir() + '/c/miner_llvm_pass/build/lib/libminer_pass.so')
CLANG_MINER_EXECUTABLE = \
    get_env_or_default(
        'CLANG_MINER_EXECUTABLE',
        '/devel/git/ML-CodeGraph/c/clang_miner/build/clang_miner')

LLVM_MINER_EXECUTABLE = \
    get_env_or_default(
        'LLVM_MINER_EXECUTABLE',
        get_repo_dir() + '/c/miner_llvm_pass/build/bin/miner')

LLVM_CONVERTER_EXECUTABLE = \
    get_env_or_default(
        'LLVM_MINER_EXECUTABLE',
        get_repo_dir() + '/c/ConvertToExactRepresentation/build/bin/ConvertToExactRepresentation')

LIBCLC_DIR = \
    get_env_or_default(
        'LIBCLC_DIR',
        get_base_dir() + '/clgen/lib/python3.6/site-packages/CLgen-0.4.1-py3.6.egg/clgen/data/libclc')
OPENCL_SHIM_FILE = \
    get_env_or_default(
        'OPENCL_SHIM_FILE',
        get_base_dir()+ '/clgen/lib/python3.6/site-packages/CLgen-0.4.1-py3.6.egg/clgen/data/include/opencl-shim.h')
