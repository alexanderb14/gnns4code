import concurrent.futures
import json
import os
import shutil
import subprocess
import sys

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
sys.path.append(SCRIPT_DIR + '/../..')

import applications.clang_code.codegraph_models as codegraph_models
import applications.utils as utils

# Static data
TEST_DATA_DIR = SCRIPT_DIR + '/test_data'
REAL_DATA_DIR = SCRIPT_DIR + '/real_data'
OPENCL_KERNEL_DIR = '/devel/clgen/kernels_c'


# Helper functions
def get_filenames_from_directory(directory):
   for dirpath,_,filenames in os.walk(directory):
       for f in filenames:
           yield os.path.abspath(os.path.join(dirpath, f))

def make_graph(c_file, datadir, tmpdir, is_open_cl_code: bool=False):
    graph_out_file = os.path.join(tmpdir, c_file + '.json')

    # Clang tool C -> Graph
    if is_open_cl_code:
        cmd = [utils.CLANG_MINER_EXECUTABLE,
               '-extra-arg-before=-xcl',
               '-extra-arg=-I' + utils.LIBCLC_DIR,
               '-extra-arg=-include' + utils.OPENCL_SHIM_FILE,
               os.path.join(datadir, c_file)]

    else:
        cmd = [utils.CLANG_MINER_EXECUTABLE,
               os.path.join(datadir, c_file)]

    process = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    stdout, stderr = process.communicate()

    assert process.returncode == 0

    # Parse graph
    graph_str = stdout.decode('utf-8')
    print(graph_str)
    graph_j = json.loads(graph_str)
    graph = codegraph_models.codegraphs_create_from_miner_output(graph_j)[0]

    # # Save dot graph
    # codegraph_models.save_dot_graph(graph, graph_out_file + '.png', 'png', True)
    # # subprocess.call(['open', graph_out_file + '.png'])

    # Transform graph:
    codegraph_models.transform_graph(graph)

    # # Save reduced dot graph
    # codegraph_models.save_dot_graph(graph, graph_out_file + '.reduced' + '.png', 'png', True)
    # # subprocess.call(['open', graph_out_file + '.reduced' + '.png'])

    return graph

def generate_code(graph):
    cg_vstr = codegraph_models.CodeGenVisitor(500)
    graph.accept(cg_vstr, codegraph_models.sort_edges_conforming_c_syntax)

    return cg_vstr.get_code_as_str()

def compile_code(tmpdir, code, c_file_basename):
    c_out_filename = os.path.join(tmpdir, c_file_basename + '_generated.cl')
    clang_stdout_stderr_filename = os.path.join(tmpdir, c_file_basename + '_stdout_stderr.txt')

    # Write c code to disk
    with open(c_out_filename, 'w') as f:
        f.write(code)

    # Compile c code and save stdout, stderr to file
    with open(clang_stdout_stderr_filename, 'w') as file:
        cmd = ['clang', '-c', c_out_filename, '-o', c_out_filename + '.a']
        process = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

        if process.returncode != 0:
            stdout, stderr = process.communicate()

        return process.returncode == 0, stdout.decode('utf-8'), stderr.decode('utf-8')

def gen_and_compile_graph(tmpdir, datadir, c_file, is_open_cl_code: bool=False):
    shutil.copyfile(os.path.join(datadir, c_file), os.path.join(tmpdir, c_file))
    with open(os.path.join(datadir, c_file), 'r') as f:
        c_file_str = f.read()

    c_file_basename, _ = os.path.splitext(c_file)

    graph = make_graph(c_file, datadir, tmpdir, is_open_cl_code)
    code = generate_code(graph)
    compile_ok, compile_stdout, compile_stderr = compile_code(tmpdir, code, c_file_basename)

    format_stdout, _ = utils.format_c_code(code)

    return compile_ok, compile_stdout, compile_stderr, format_stdout

def format_gen_and_compile_graph_result(result):
    compile_ok, compile_stdout, compile_stderr, format_stdout = result

    print('compile_stdout: ' + compile_stdout)
    print('compile_stderr: ' + compile_stderr)
    print('format_stdout:  ' + format_stdout)

    return compile_ok

# CodeGen Tests: Test data
def test_gen_and_compile_add(tmpdir_factory):
    tmpdir = tmpdir_factory.mktemp('out')
    print(tmpdir)
    assert format_gen_and_compile_graph_result(gen_and_compile_graph(tmpdir, TEST_DATA_DIR, 'add.c')) == True

def test_gen_and_compile_forward_decl(tmpdir_factory):
    tmpdir = tmpdir_factory.mktemp('out')
    print(tmpdir)
    assert format_gen_and_compile_graph_result(gen_and_compile_graph(tmpdir, TEST_DATA_DIR, 'forward_decl.c')) == True

def test_gen_and_compile_function_call(tmpdir_factory):
    tmpdir = tmpdir_factory.mktemp('out')
    print(tmpdir)
    assert format_gen_and_compile_graph_result(gen_and_compile_graph(tmpdir, TEST_DATA_DIR, 'function_call.c')) == True

def test_gen_and_compile_max(tmpdir_factory):
    tmpdir = tmpdir_factory.mktemp('out')
    print(tmpdir)
    assert format_gen_and_compile_graph_result(gen_and_compile_graph(tmpdir, TEST_DATA_DIR, 'max.c')) == True

def test_gen_and_compile_sum_array(tmpdir_factory):
    tmpdir = tmpdir_factory.mktemp('out')
    print(tmpdir)
    assert format_gen_and_compile_graph_result(gen_and_compile_graph(tmpdir, TEST_DATA_DIR, 'sum_array.c')) == True

def test_gen_and_compile_sum_vector(tmpdir_factory):
    tmpdir = tmpdir_factory.mktemp('out')
    print(tmpdir)
    assert format_gen_and_compile_graph_result(gen_and_compile_graph(tmpdir, TEST_DATA_DIR, 'sum_vector.c')) == True

def test_gen_and_compile_sum_vector_2(tmpdir_factory):
    tmpdir = tmpdir_factory.mktemp('out')
    print(tmpdir)
    assert format_gen_and_compile_graph_result(gen_and_compile_graph(tmpdir, TEST_DATA_DIR, 'sum_vector_2.c')) == True


# CodeGen Tests: Real data
def test_gen_and_compile_58fa6f7af33548c10b900db0eb007c6b84b6497d(tmpdir_factory):
    tmpdir = tmpdir_factory.mktemp('out')
    print(tmpdir)
    assert gen_and_compile_graph(tmpdir, REAL_DATA_DIR, 'https-api-github-com-repos-zheguang-gpgpu-git-blobs-58fa6f7af33548c10b900db0eb007c6b84b6497d.cl', True) == True

def test_gen_and_compile_b1021ed71ac0fdc899c631fe3712d2b5c0451a88(tmpdir_factory):
    tmpdir = tmpdir_factory.mktemp('out')
    print(tmpdir)
    assert gen_and_compile_graph(tmpdir, REAL_DATA_DIR, 'https-api-github-com-repos-zheguang-gpgpu-git-blobs-b1021ed71ac0fdc899c631fe3712d2b5c0451a88.cl', True) == True


# CodeGen Tests: All
def test_gen_compile_all(tmpdir_factory):
    tmpdir = tmpdir_factory.mktemp('out')
    print(tmpdir)

    DATA_DIR = os.path.join(SCRIPT_DIR, '..', '..', '..', '..', 'data', 'c')
#    DATA_DIR = '/devel/datasets/opencl_kernels_10..30'

    data = os.listdir(DATA_DIR)

    def fnc(c_file):
        result = gen_and_compile_graph(tmpdir, DATA_DIR, c_file, True)
        return result

    with concurrent.futures.ThreadPoolExecutor(max_workers=8) as executor:
        ok = 0
        not_ok = 0
        for result in executor.map(fnc, data):
            compile_ok = format_gen_and_compile_graph_result(result)
            if compile_ok:
                ok += 1
            else:
                not_ok += 1

            print('>>>>>>>>>>>>>>>> ok: %i, not_ok: %i, total: %i' % (ok, not_ok, len(data)))

# Actionizer tests
def test_actionize(tmpdir_factory):
    tmpdir = tmpdir_factory.mktemp('out')
    print(tmpdir)

    c_files = os.listdir(TEST_DATA_DIR)
    print(c_files)
    c_files.remove('function_call.c')
    for c_file in c_files:
        # Create graph
        graph = make_graph(c_file, TEST_DATA_DIR, tmpdir)

        # Create node type ids
        nic_vstr = codegraph_models.NodeTypeIdCreateVisitor()
        graph.accept(nic_vstr)
        node_types = nic_vstr.node_type_ids_by_statements

        # Actionize
        actions = codegraph_models.create_action_sequence(graph, True)
        graph_generated = codegraph_models.create_graph_from_action_sequence(actions, node_types)

        assert codegraph_models.are_graphs_equal(graph, graph_generated)

def disabled_test_gen_compile_opencl_kernels(tmpdir_factory):
    tmpdir = tmpdir_factory.mktemp('out')
    print(tmpdir)

    for c_file in os.listdir(TEST_DATA_DIR):
        compile_ok = gen_and_compile_graph(tmpdir, OPENCL_KERNEL_DIR, c_file)

        assert(compile_ok == True)