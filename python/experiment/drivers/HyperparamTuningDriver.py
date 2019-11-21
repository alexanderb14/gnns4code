import argparse
import json
import matplotlib.pyplot as plt
import numpy as np
import os
import pandas as pd
import paramiko
import pickle
import re
import scipy
import skopt
import sys
import time
import uuid
from datetime import datetime, timedelta
from io import StringIO
from sklearn.externals.joblib import Parallel,delayed
from skopt.plots import plot_convergence, plot_evaluations, plot_objective


SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
sys.path.append(SCRIPT_DIR + '/..')

import DevMapExperiment as DevMapExperiment
import drivers.exp_utils as exp_utils
import utils as utils


REPORTS_DIR = 'tmp'
NUM_EXP_ITERATIONS = 1

ssh_client = None


def split_dict(d: dict):
    dims = []
    default_params = []
    for x in d:
        dims.append(x[0])
        default_params.append(x[1])

    return dims, default_params


def execute_ssh_command(cmd):
    if ssh_client is None:
        ssh_client = paramiko.SSHClient()
        ssh_client.load_system_host_keys()
        ssh_client.set_missing_host_key_policy(paramiko.WarningPolicy)
        ssh_client.connect(os.environ['ZIH_LOGIN_SERVER'], username=os.environ['ZIH_USERNAME'])

    stdin, stdout, stderr = ssh_client.exec_command(cmd)
    ret = stdout.readlines()

    return ret


def get_slurm_job_stati():
    num_days = 2
    start_date = datetime.strftime(datetime.now() - timedelta(num_days), '%m/%d')
    lines = execute_ssh_command('sacct -o JobID,State -S ' + start_date)

    completed_jobs = set()
    failed_jobs = set()
    pending_jobs = set()
    running_jobs = set()

    for line in lines[2:]:
        job_id = int(re.findall('[0-9]+', line)[0])
        job_status = re.findall('[A-Z]+', line)[0]

        if job_status == 'COMPLETED':
            completed_jobs.add(job_id)
        elif job_status == 'FAILED':
            failed_jobs.add(job_id)
        elif job_status == 'PENDING':
            pending_jobs.add(job_id)
        elif job_status == 'RUNNING':
            running_jobs.add(job_id)

    return {
        'completed': completed_jobs,
        'failed': failed_jobs,
        'pending': pending_jobs,
        'running': running_jobs
    }


def run_slurm_job(cmd):
    lines = execute_ssh_command(cmd)
    job_id = int(re.findall('[0-9]+', lines[0])[0])

    return job_id


def run_n_times_on_slurm(task: str, method: str, config: dict, num_iterations: int, fold_mode: str, split_mode: str):
    # Run several instances of the experiment on slurm
    # Cleanup and prepare dirs
    pwd = execute_ssh_command('pwd')[0].replace('\n', '')
    reports_dir = os.path.join(pwd, REPORTS_DIR, method + '_' + str(uuid.uuid4()))

    execute_ssh_command('rm -rf ' + reports_dir + ' && mkdir -p ' + reports_dir)
    run_artifact_dirs = []
    cmds = []

    # Prepare dirs and build config
    for i in range(0, num_iterations):
        # Prepare dirs
        run_id = str(uuid.uuid4())
        run_artifact_dir = os.path.join(reports_dir, run_id)
        run_artifact_dirs.append(run_artifact_dir)

        execute_ssh_command('mkdir ' + run_artifact_dir)

        # Set seed
        config['seed'] = i + 1

        # Build config
        config_str = json.dumps(config).replace('"', '\\"').replace(' ', '')

        # Build commands
        if task == 'tc':
            cmd = exp_utils.build_tc_experiment_cmd(method, run_artifact_dir, 0, config_str)
        elif task == 'devmap':
            cmd = exp_utils.build_devmap_experiment_cmd(method, fold_mode, split_mode, run_artifact_dir, 0, config_str)

        cmd = ' '.join(['sbatch'] + [os.path.join(exp_utils.CONFIG_DIR, 'ml.slurm')] +
                       ['\"'] +
                       ['python'] + cmd +
                       ['\"'])
        cmds.append(cmd)

    # Run cmds on slurm. Run multiple cmds in one job if possible
    # num_concurrency = exp_utils.TC_CONFIGS['DeepTuneGNNClang']['slurm']['concurrency']
    # chunks = utils.chunks(cmds, num_concurrency)
    #
    # pending_jobs = set()
    # for cmds in chunks:
    #     complete_cmd = ''
    #     for cmd in cmds:
    #         complete_cmd += cmd + ' & '
    #     complete_cmd += 'wait'
    #
    #     job_id = run_slurm_job(complete_cmd)
    #     pending_jobs.add(job_id)
    pending_jobs = set()
    for cmd in cmds:
        job_id = run_slurm_job(cmd)
        pending_jobs.add(job_id)

    # Periodically poll and wait for completion
    while len(pending_jobs) != 0:
        time.sleep(60)

        # Get job stati from slurm
        stati = get_slurm_job_stati()

        # Remove jobs from pending set on completion
        pending_jobs = pending_jobs - stati['completed']

        print('Running:\t', stati['running'], file=sys.stderr)
        print('Pending:\t', pending_jobs, file=sys.stderr)

    # When completed, aggregate all result csvs to metric and report
    # Get and aggregate results
    result_dfs = []
    for i, run_artifact_dir in enumerate(run_artifact_dirs):
        result_csv = ''.join(execute_ssh_command('cat ' + run_artifact_dir + '/*_raw.txt'))
        result_df = pd.read_csv(StringIO(result_csv))

        result_dfs.append(result_df)

    return pd.concat(result_dfs)


# LSTM
# ##############
# Thread Coarsening
def get_lstm_tc_dimensions_and_default_params():
    dims_and_default_params = [
        (skopt.space.Integer(low=4, high=9, name='h_size'), 6),
        (skopt.space.Integer(low=0, high=6, name='num_extra_lstm_layers'), 1),
        (skopt.space.Integer(low=0, high=10, name='L2_loss_factor'), 0),
        (skopt.space.Integer(low=0, high=6, name='num_epochs'), 0),
    ]

    return split_dict(dims_and_default_params)


def f_lstm_tc(*data):
    # Build config
    h_size = int(data[0][0])
    num_extra_lstm_layers = int(data[0][1])
    L2_loss_factor = int(data[0][2])
    num_epochs = int(data[0][3])

    config = {
        'fold_mode': 'random',

        "h_size": 2 ** h_size,
        "num_extra_lstm_layers": num_extra_lstm_layers,

        "L2_loss_factor": 0.05 * L2_loss_factor,

        "batch_size": 64,
        "num_epochs": 2 ** num_epochs * 50,
        "out_dir": "/tmp",
    }
    utils.pretty_print_dict(config)

    results_df = run_n_times_on_slurm(task='devmap',
                                      fold_mode=fold_mode,
                                      split_mode=split_mode,
                                      method='DeepTuneLSTM',
                                      config=config,
                                      num_iterations=NUM_EXP_ITERATIONS)

    # Calculate metric
    accuracy = np.mean(results_df[results_df['set'] == 'valid']['Correct?'])
    print('Metric:', accuracy)

    return accuracy * (-1)


# Device Mapping
def get_lstm_devmap_dimensions_and_default_params():
    dims_and_default_params = [
        (skopt.space.Integer(low=4, high=7, name='h_size'), 6),
        (skopt.space.Integer(low=0, high=6, name='num_extra_lstm_layers'), 1),
        (skopt.space.Integer(low=0, high=10, name='L2_loss_factor'), 0),
        (skopt.space.Integer(low=0, high=3, name='num_epochs'), 0),
    ]

    return split_dict(dims_and_default_params)

def f_lstm_devmap_random(*data):
    return f_lstm_devmap('random', '3', *data)


def f_lstm_devmap_grouped(*data):
    return f_gnn_ast_devmap('grouped', '3', *data)


def f_lstm_devmap(fold_mode, split_mode, *data):
    # Build config
    h_size = int(data[0][0])
    num_extra_lstm_layers = int(data[0][1])
    L2_loss_factor = int(data[0][2])
    num_epochs = int(data[0][3])

    config = {
        "fold_mode": fold_mode,

        "h_size": 2 ** h_size,
        "num_extra_lstm_layers": num_extra_lstm_layers,

        "L2_loss_factor": 0.05 * L2_loss_factor,

        "batch_size": 64,
        "num_epochs": 2 ** num_epochs * 50,
        "out_dir": "/tmp",
    }
    utils.pretty_print_dict(config)

    results_df = run_n_times_on_slurm(task='devmap',
                                      fold_mode=fold_mode,
                                      split_mode=split_mode,
                                      method='DeepTuneLSTM',
                                      config=config,
                                      num_iterations=NUM_EXP_ITERATIONS)

    # Calculate metric
    accuracy = np.mean(results_df[results_df['set'] == 'valid']['Correct?'])
    print('Metric:', accuracy)

    return accuracy * (-1)


# GNN AST
# ##############
# Thread Coarsening
def get_gnn_ast_tc_dimensions_and_default_params():
    dims_and_default_params = [
        (skopt.space.Integer(low=1, high=4, name='num_timesteps'), 4),
        (skopt.space.Integer(low=1, high=9, name='gnn_h_size'), 7),
        (skopt.space.Integer(low=1, high=4, name='gnn_m_size'), 2),

        (skopt.space.Integer(low=0, high=4, name='prediction_cell_mlp_f_m_dims'), 2),
        (skopt.space.Integer(low=0, high=4, name='prediction_cell_mlp_g_m_dims'), 2),
        (skopt.space.Integer(low=0, high=4, name='prediction_cell_mlp_reduce_dims'), 2),

        (skopt.space.Integer(low=0, high=4, name='embedding_layer_dims'), 2),

        (skopt.space.Integer(low=0, high=4, name='learning_rate'), 1),
        (skopt.space.Integer(low=0, high=10, name='L2_loss_factor'), 0),
        (skopt.space.Integer(low=0, high=4, name='num_epochs'), 1),

        (skopt.space.Integer(low=0, high=1, name='tie_fwd_bkwd'), 0),
    ]

    return split_dict(dims_and_default_params)


def f_gnn_ast_tc(*data):
    # Build config
    num_timesteps = int(data[0][0])
    gnn_h_size = int(data[0][1])
    gnn_m_size = int(data[0][2])

    prediction_cell_mlp_f_m_dims = int(data[0][3])
    prediction_cell_mlp_g_m_dims = int(data[0][4])
    prediction_cell_mlp_reduce_dims = int(data[0][5])

    embedding_layer_dims = int(data[0][6])

    learning_rate = int(data[0][7])
    L2_loss_factor = int(data[0][8])
    num_epochs = int(data[0][9])

    tie_fwd_bkwd = int(data[0][10])

    config = {
        "run_id": 'foo',
        'fold_mode': 'random',

        "gnn_type": "GGNN",

        "num_timesteps": num_timesteps * 2,
        "hidden_size_orig": 46,
        "gnn_h_size": 2 ** gnn_h_size,
        "gnn_m_size": gnn_m_size * 2,

        "num_edge_types": 2,

        "prediction_cell": {
            "mlp_f_m_dims": [gnn_h_size * gnn_m_size * 2] * prediction_cell_mlp_f_m_dims,
            "mlp_f_m_activation": "relu",

            "mlp_g_m_dims": [gnn_h_size * gnn_m_size * 2] * prediction_cell_mlp_g_m_dims,
            "mlp_g_m_activation": "sigmoid",

            "mlp_reduce_dims": [gnn_h_size * gnn_m_size * 2] * prediction_cell_mlp_reduce_dims,
            "mlp_reduce_activation": "relu",
            "mlp_reduce_out_dim": 32,

            "mlp_reduce_after_aux_in_1_dims": [],
            "mlp_reduce_after_aux_in_1_activation": "relu",
            "mlp_reduce_after_aux_in_1_out_dim": 32,

            "mlp_reduce_after_aux_in_2_dims": [],
            "mlp_reduce_after_aux_in_2_activation": "sigmoid",
            "mlp_reduce_after_aux_in_2_out_dim": 6,

            "output_dim": 6,
        },

        "embedding_layer": {
            "mapping_dims": [46] * embedding_layer_dims
        },

        "learning_rate": 0.00001 * learning_rate,
        "clamp_gradient_norm": 1.0,
        "L2_loss_factor": 0.05 * L2_loss_factor,

        "batch_size": 16,
        "num_epochs": 2 ** num_epochs * 100,
        "out_dir": "/tmp",

        "tie_fwd_bkwd": tie_fwd_bkwd,
        "use_edge_bias": 0,
        "use_edge_msg_avg_aggregation": 0,

        "use_node_values": 0,
        "save_best_model_interval": 1,
        "with_aux_in": 0,

        "edge_type_filter": []
    }
    utils.pretty_print_dict(config)

    results_df = run_n_times_on_slurm(task='tc',
                                      method='DeepTuneGNNClang',
                                      config=config,
                                      num_iterations=NUM_EXP_ITERATIONS)

    # Calculate metric
    speedup = scipy.stats.gmean(list(results_df['Speedup']))
    print('Metric:', speedup)

    return speedup * (-1)


# Device Mapping
def get_gnn_ast_devmap_dimensions_and_default_params():
    dims_and_default_params = [
        (skopt.space.Integer(low=1, high=4, name='num_timesteps'), 2),
        (skopt.space.Integer(low=1, high=7, name='gnn_h_size'), 5),
        (skopt.space.Integer(low=1, high=4, name='gnn_m_size'), 1),

        (skopt.space.Integer(low=0, high=4, name='prediction_cell_mlp_f_m_dims'), 2),
        (skopt.space.Integer(low=0, high=4, name='prediction_cell_mlp_g_m_dims'), 2),
        (skopt.space.Integer(low=0, high=4, name='prediction_cell_mlp_reduce_dims'), 2),

        (skopt.space.Integer(low=0, high=4, name='embedding_layer_dims'), 2),

        (skopt.space.Integer(low=0, high=4, name='learning_rate'), 4),
        (skopt.space.Integer(low=0, high=10, name='L2_loss_factor'), 0),
        (skopt.space.Integer(low=0, high=4, name='num_epochs'), 4),

        (skopt.space.Integer(low=0, high=1, name='tie_fwd_bkwd'), 0),
    ]

    return split_dict(dims_and_default_params)


def f_gnn_ast_devmap_random(*data):
    return f_gnn_ast_devmap('random', '3', *data)


def f_gnn_ast_devmap_grouped(*data):
    return f_gnn_ast_devmap('grouped', '3', *data)


def f_gnn_ast_devmap(fold_mode, split_mode, *data):
    # Build config
    num_timesteps = int(data[0][0])
    gnn_h_size = int(data[0][1])
    gnn_m_size = int(data[0][2])

    prediction_cell_mlp_f_m_dims = int(data[0][3])
    prediction_cell_mlp_g_m_dims = int(data[0][4])
    prediction_cell_mlp_reduce_dims = int(data[0][5])

    embedding_layer_dims = int(data[0][6])

    learning_rate = int(data[0][7])
    L2_loss_factor = int(data[0][8])
    num_epochs = int(data[0][9])

    tie_fwd_bkwd = int(data[0][10])

    config = {
        "run_id": 'foo',
        'fold_mode': fold_mode,

        "gnn_type": "GGNN",

        "num_timesteps": num_timesteps * 2,
        "hidden_size_orig": 92,
        "gnn_h_size": 2 ** gnn_h_size,
        "gnn_m_size": gnn_m_size * 2,

        "num_edge_types": 2,

        "prediction_cell": {
            "mlp_f_m_dims": [2 ** gnn_h_size * gnn_m_size * 2] * prediction_cell_mlp_f_m_dims,
            "mlp_f_m_activation": "sigmoid",

            "mlp_g_m_dims": [2 ** gnn_h_size * gnn_m_size * 2] * prediction_cell_mlp_g_m_dims,
            "mlp_g_m_activation": "relu",

            "mlp_reduce_dims": [2 ** gnn_h_size * gnn_m_size * 2] * prediction_cell_mlp_reduce_dims,
            "mlp_reduce_activation": "relu",
            "mlp_reduce_out_dim": 32,

            "mlp_reduce_after_aux_in_1_dims": [],
            "mlp_reduce_after_aux_in_1_activation": "relu",
            "mlp_reduce_after_aux_in_1_out_dim": 32,

            "mlp_reduce_after_aux_in_2_dims": [],
            "mlp_reduce_after_aux_in_2_activation": "sigmoid",
            "mlp_reduce_after_aux_in_2_out_dim": 2,

            "output_dim": 2,
        },

        "embedding_layer": {
            "mapping_dims": [92] * embedding_layer_dims
        },

        "learning_rate": 0.0001 * learning_rate,
        "clamp_gradient_norm": 1.0,
        "L2_loss_factor": 0.05 * L2_loss_factor,

        "batch_size": 64,
        "num_epochs": 2 ** num_epochs * 100,
        "out_dir": "/tmp",

        "tie_fwd_bkwd": tie_fwd_bkwd,
        "use_edge_bias": 0,
        "use_edge_msg_avg_aggregation": 0,

        "use_node_values": 0,
        "save_best_model_interval": 1,
        "with_aux_in": 1,

        "edge_type_filter": []
    }
    utils.pretty_print_dict(config)

    results_df = run_n_times_on_slurm(task='devmap',
                                      fold_mode=fold_mode,
                                      split_mode=split_mode,
                                      method='DeepTuneGNNClang',
                                      config=config,
                                      num_iterations=NUM_EXP_ITERATIONS)

    # Calculate metric
    accuracy = np.mean(results_df[results_df['set'] == 'valid']['Correct?'])
    print('Metric:', accuracy)

    return accuracy * (-1)


# GNN LLVM
# ##############
# Thread Coarsening
def get_gnn_llvm_tc_dimensions_and_default_params():
    dims_and_default_params = [
        (skopt.space.Integer(low=1, high=4, name='num_timesteps'), 4),
        (skopt.space.Integer(low=1, high=4, name='gnn_h_size'), 2),
        (skopt.space.Integer(low=1, high=4, name='gnn_m_size'), 2),

        (skopt.space.Integer(low=0, high=4, name='prediction_cell_mlp_f_m_dims'), 2),
        (skopt.space.Integer(low=0, high=4, name='prediction_cell_mlp_g_m_dims'), 2),
        (skopt.space.Integer(low=0, high=4, name='prediction_cell_mlp_reduce_dims'), 2),

        (skopt.space.Integer(low=0, high=4, name='embedding_layer_dims'), 2),

        (skopt.space.Integer(low=0, high=4, name='learning_rate'), 1),
        (skopt.space.Integer(low=0, high=10, name='L2_loss_factor'), 0),
        (skopt.space.Integer(low=0, high=4, name='num_epochs'), 1),

        (skopt.space.Integer(low=0, high=1, name='tie_fwd_bkwd'), 0),
    ]

    return split_dict(dims_and_default_params)


def f_gnn_llvm_tc(*data):
    # Build config
    num_timesteps = int(data[0][0])
    gnn_h_size = int(data[0][1])
    gnn_m_size = int(data[0][2])

    prediction_cell_mlp_f_m_dims = int(data[0][3])
    prediction_cell_mlp_g_m_dims = int(data[0][4])
    prediction_cell_mlp_reduce_dims = int(data[0][5])

    embedding_layer_dims = int(data[0][6])

    learning_rate = int(data[0][7])
    L2_loss_factor = int(data[0][8])
    num_epochs = int(data[0][9])

    tie_fwd_bkwd = int(data[0][10])

    config = {
        "run_id": 'foo',
        'fold_mode': 'random',

        "gnn_type": "GGNN",

        "num_timesteps": num_timesteps * 2,
        "hidden_size_orig": 140,
        "gnn_h_size": 2 ** gnn_h_size,
        "gnn_m_size": gnn_m_size * 2,

        "num_edge_types": 4,

        "prediction_cell": {
            "mlp_f_m_dims": [2 ** gnn_h_size * gnn_m_size * 2] * prediction_cell_mlp_f_m_dims,
            "mlp_f_m_activation": "relu",

            "mlp_g_m_dims": [2 ** gnn_h_size * gnn_m_size * 2] * prediction_cell_mlp_g_m_dims,
            "mlp_g_m_activation": "sigmoid",

            "mlp_reduce_dims": [2 ** gnn_h_size * gnn_m_size * 2] * prediction_cell_mlp_reduce_dims,
            "mlp_reduce_activation": "relu",
            "mlp_reduce_out_dim": 32,

            "mlp_reduce_after_aux_in_1_dims": [],
            "mlp_reduce_after_aux_in_1_activation": "relu",
            "mlp_reduce_after_aux_in_1_out_dim": 32,

            "mlp_reduce_after_aux_in_2_dims": [],
            "mlp_reduce_after_aux_in_2_activation": "sigmoid",
            "mlp_reduce_after_aux_in_2_out_dim": 6,

            "output_dim": 6,
        },

        "embedding_layer": {
            "mapping_dims": [140] * embedding_layer_dims
        },

        "learning_rate": 0.00001 * learning_rate,
        "clamp_gradient_norm": 1.0,
        "L2_loss_factor": 0.05 * L2_loss_factor,

        "batch_size": 16,
        "num_epochs": 2 ** num_epochs * 100,
        "out_dir": "/tmp",

        "tie_fwd_bkwd": tie_fwd_bkwd,
        "use_edge_bias": 0,
        "use_edge_msg_avg_aggregation": 0,

        "use_node_values": 0,
        "save_best_model_interval": 1,
        "with_aux_in": 0,

        "edge_type_filter": []
    }
    utils.pretty_print_dict(config)

    results_df = run_n_times_on_slurm(task='tc',
                                      method='DeepTuneGNNLLVM',
                                      config=config,
                                      num_iterations=NUM_EXP_ITERATIONS)

    # Calculate metric
    speedup = scipy.stats.gmean(list(results_df['Speedup']))
    print('Metric:', speedup)

    return speedup * (-1)

# Device Mapping
def get_gnn_llvm_devmap_dimensions_and_default_params():
    dims_and_default_params = [
        (skopt.space.Integer(low=1, high=4, name='num_timesteps'), 4),
        (skopt.space.Integer(low=1, high=7, name='gnn_h_size'), 7),
        (skopt.space.Integer(low=1, high=4, name='gnn_m_size'), 2),

        (skopt.space.Integer(low=0, high=4, name='prediction_cell_mlp_f_m_dims'), 2),
        (skopt.space.Integer(low=0, high=4, name='prediction_cell_mlp_g_m_dims'), 2),
        (skopt.space.Integer(low=0, high=4, name='prediction_cell_mlp_reduce_dims'), 2),

        (skopt.space.Integer(low=0, high=4, name='embedding_layer_dims'), 2),

        (skopt.space.Integer(low=0, high=4, name='learning_rate'), 1),
        (skopt.space.Integer(low=0, high=10, name='L2_loss_factor'), 0),
        (skopt.space.Integer(low=0, high=4, name='num_epochs'), 3),

        (skopt.space.Integer(low=0, high=1, name='tie_fwd_bkwd'), 0),
    ]

    return split_dict(dims_and_default_params)


def f_gnn_llvm_devmap_random(*data):
    return f_gnn_llvm_devmap('random', '3', *data)


def f_gnn_llvm_devmap_grouped(*data):
    return f_gnn_llvm_devmap('grouped', '3', *data)


def f_gnn_llvm_devmap(fold_mode, split_mode, *data):
    # Build config
    num_timesteps = int(data[0][0])
    gnn_h_size = int(data[0][1])
    gnn_m_size = int(data[0][2])

    prediction_cell_mlp_f_m_dims = int(data[0][3])
    prediction_cell_mlp_g_m_dims = int(data[0][4])
    prediction_cell_mlp_reduce_dims = int(data[0][5])

    embedding_layer_dims = int(data[0][6])

    learning_rate = int(data[0][7])
    L2_loss_factor = int(data[0][8])
    num_epochs = int(data[0][9])

    tie_fwd_bkwd = int(data[0][10])

    config = {
        "run_id": 'foo',
        'fold_mode': fold_mode,

        "gnn_type": "GGNN",

        "num_timesteps": num_timesteps * 2,
        "hidden_size_orig": 140,
        "gnn_h_size": 2 ** gnn_h_size,
        "gnn_m_size": gnn_m_size * 2,

        "num_edge_types": 4,

        "prediction_cell": {
            "mlp_f_m_dims": [2 ** gnn_h_size * gnn_m_size * 2] * prediction_cell_mlp_f_m_dims,
            "mlp_f_m_activation": "sigmoid",

            "mlp_g_m_dims": [2 ** gnn_h_size * gnn_m_size * 2] * prediction_cell_mlp_g_m_dims,
            "mlp_g_m_activation": "relu",

            "mlp_reduce_dims": [2 ** gnn_h_size * gnn_m_size * 2] * prediction_cell_mlp_reduce_dims,
            "mlp_reduce_activation": "relu",
            "mlp_reduce_out_dim": 32,

            "mlp_reduce_after_aux_in_1_dims": [],
            "mlp_reduce_after_aux_in_1_activation": "relu",
            "mlp_reduce_after_aux_in_1_out_dim": 32,

            "mlp_reduce_after_aux_in_2_dims": [],
            "mlp_reduce_after_aux_in_2_activation": "sigmoid",
            "mlp_reduce_after_aux_in_2_out_dim": 2,

            "output_dim": 2,
        },

        "embedding_layer": {
            "mapping_dims": [140] * embedding_layer_dims
        },

        "learning_rate": 0.00001 * learning_rate,
        "clamp_gradient_norm": 1.0,
        "L2_loss_factor": 0.05 * L2_loss_factor,

        "batch_size": 64,
        "num_epochs": 2 ** num_epochs * 100,
        "out_dir": "/tmp",

        "tie_fwd_bkwd": tie_fwd_bkwd,
        "use_edge_bias": 0,
        "use_edge_msg_avg_aggregation": 0,

        "use_node_values": 0,
        "save_best_model_interval": 1,
        "with_aux_in": 1,

        "edge_type_filter": []
    }
    utils.pretty_print_dict(config)

    results_df = run_n_times_on_slurm(task='devmap',
                                      fold_mode=fold_mode,
                                      split_mode=split_mode,
                                      method='DeepTuneGNNLLVM',
                                      config=config,
                                      num_iterations=NUM_EXP_ITERATIONS)

    # Calculate metric
    accuracy = np.mean(results_df[results_df['set'] == 'valid']['Correct?'])
    print('Metric:', accuracy)

    return accuracy * (-1)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('command', help='Subcommand to run')
    subparsers = parser.add_subparsers()

    # Parse command
    command_arg = parser.parse_args(sys.argv[1:2])
    if not hasattr(command_arg, 'command'):
        print('Unrecognized command')
        parser.print_help()
        exit(1)

    # Experiment command
    if command_arg.command == 'experiment':
        parser_exp = subparsers.add_parser('experiment')

        parser_exp.add_argument('--experiment')
        parser_exp.add_argument('--fold_mode')
        parser_exp.add_argument('--method')
        parser_exp.add_argument('--result_file')
        parser_exp.add_argument('--num_iterations')
        parser_exp.add_argument('--num_parallel_per_iteration')

        args = parser_exp.parse_args(sys.argv[2:])

        # Map arguments -> Functions
        fn_dims_and_default_params = None
        fn_f = None

        if args.method == 'DeepTuneLSTM':
            if args.experiment == 'tc':
                fn_dims_and_default_params = get_lstm_tc_dimensions_and_default_params
                fn_f = f_lstm_tc
            elif args.experiment == 'devmap':
                fn_dims_and_default_params = get_lstm_devmap_dimensions_and_default_params
                if args.fold_mode == 'random':
                    fn_f = f_lstm_devmap_random
                elif args.fold_mode == 'grouped':
                    fn_f = f_lstm_devmap_grouped
        if args.method == 'DeepTuneGNNClang':
            if args.experiment == 'tc':
                fn_dims_and_default_params = get_gnn_ast_tc_dimensions_and_default_params
                fn_f = f_gnn_ast_tc
            elif args.experiment == 'devmap':
                fn_dims_and_default_params = get_gnn_ast_devmap_dimensions_and_default_params
                if args.fold_mode == 'random':
                    fn_f = f_gnn_ast_devmap_random
                elif args.fold_mode == 'grouped':
                    fn_f = f_gnn_ast_devmap_grouped
        if args.method == 'DeepTuneGNNLLVM':
            if args.experiment == 'tc':
                fn_dims_and_default_params = get_gnn_llvm_tc_dimensions_and_default_params
                fn_f = f_gnn_llvm_tc
            elif args.experiment == 'devmap':
                fn_dims_and_default_params = get_gnn_llvm_devmap_dimensions_and_default_params
                if args.fold_mode == 'random':
                    fn_f = f_gnn_llvm_devmap_random
                elif args.fold_mode == 'grouped':
                    fn_f = f_gnn_llvm_devmap_grouped

        dims, default_params = fn_dims_and_default_params()
        num_iterations = int(args.num_iterations)
        num_parallel_per_iteration = int(args.num_parallel_per_iteration)

        # Do optimization
        opt = None
        if os.path.isfile(args.result_file):
            with open(args.result_file, 'rb') as f:
                opt = pickle.load(f)['optimizer']
        else:
            opt = skopt.optimizer.Optimizer(
                dimensions=dims
            )

        opt = skopt.optimizer.Optimizer(
            dimensions=dims
        )
        for i in range(0, int(num_iterations)):
            x = opt.ask(n_points=num_parallel_per_iteration)
            if i == 0:
                x.append(default_params)
            y = Parallel(n_jobs=len((x)))(delayed(fn_f)(v) for v in x)
            res = opt.tell(x, y)

            print('Iteration: %i, Minimum: %f' % (i, min(opt.yi)))

            with open(args.result_file, 'wb') as f:
                pickle.dump({
                    'optimizer': opt,
                    'result': res
                }, f)

        ssh_client.close()

    # Visualize command
    if command_arg.command == 'visualize':
        parser_vis = subparsers.add_parser('visualize')

        parser_vis.add_argument('--result_file')

        args = parser_vis.parse_args(sys.argv[2:])

        res = skopt.load(args.result_file)['result']

        ax = plot_convergence(res)
        plt.grid()
        plt.legend()
        plt.show()

        ax = plot_evaluations(res)
        plt.grid()
        plt.legend()
        plt.show()

        ax = plot_objective(res)
        plt.grid()
        plt.legend()
        plt.show()


if __name__ == '__main__':
    main()
