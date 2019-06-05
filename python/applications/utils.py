import os


def get_env_or_default(vairable_name, default_name):
    if vairable_name in os.environ:
        return os.environ[vairable_name]

    return default_name


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
    get_env_or_default(
        'CLANG_MINER_EXECUTABLE',
        '/devel/git/ML-CodeGraph/c/clang_miner/build/clang_miner')

LIBCLC_DIR = \
    get_env_or_default(
        'LIBCLC_DIR',
        '/home/alex/clgen/lib/python3.6/site-packages/CLgen-0.4.1-py3.6.egg/clgen/data/libclc')
OPENCL_SHIM_FILE = \
    get_env_or_default(
        'OPENCL_SHIM_FILE',
        '/home/alex/clgen/lib/python3.6/site-packages/CLgen-0.4.1-py3.6.egg/clgen/data/include/opencl-shim.h')