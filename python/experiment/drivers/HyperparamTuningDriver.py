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
import socket
import sys
import time
import uuid
from datetime import datetime, timedelta
from io import StringIO
from skopt.plots import plot_convergence, plot_evaluations, plot_objective


SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
sys.path.append(SCRIPT_DIR + '/../..')

import experiment.DevMapExperiment as DevMapExperiment
import experiment.drivers.exp_utils as exp_utils
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
    global ssh_client
    if not ssh_client:
        ssh_client = paramiko.SSHClient()
        ssh_client.load_system_host_keys()
        ssh_client.set_missing_host_key_policy(paramiko.WarningPolicy)
        ssh_client.connect(os.environ['ZIH_LOGIN_SERVER'], username=os.environ['ZIH_USERNAME'], timeout=10)

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


def trigger_slurm_jobs(task: str, method: str, config: dict, num_iterations: int, train_idx, valid_idx, test_idx, fold_idx, dataset):
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
            cmd = exp_utils.build_devmap_experiment_fold_cmd(method, train_idx, valid_idx, test_idx, fold_idx, dataset, run_artifact_dir, 0, config_str)

        cmd = ' '.join(['sbatch'] + [os.path.join(exp_utils.CONFIG_DIR, 'ml.slurm')] +
                       ['\"'] +
                       ['python'] + cmd +
                       ['\"'])
        cmds.append(cmd)

    job_ids = set()
    for cmd in cmds:
        job_id = run_slurm_job(cmd)
        job_ids.add(job_id)

    return job_ids, run_artifact_dirs


def wait_for_slurm_jobs(pending_jobs, check_interval_in_seconds):
    # Periodically poll and wait for completion
    while len(pending_jobs) != 0:
        time.sleep(check_interval_in_seconds)

        # Get job stati from slurm
        try:
            stati = get_slurm_job_stati()
        except socket.timeout:
            continue

        # Remove jobs from pending set on completion
        pending_jobs = pending_jobs - stati['completed']

        utils.log_with_time('Pending: Total: %i, Jobs: %s' % (len(pending_jobs), pending_jobs))


def aggregate_results_of_slurm_jobs(run_artifact_dirs):
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


class f_lstm_tc(object):
    def trigger(self, *data):
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
        # utils.pretty_print_dict(config)

        job_ids, run_artifact_dirs = trigger_slurm_jobs(task='devmap',
                                          method='DeepTuneLSTM',
                                          config=config,
                                          num_iterations=NUM_EXP_ITERATIONS)

        self.run_artifact_dirs = run_artifact_dirs

        return job_ids

    def get_result(self):
        results_df = aggregate_results_of_slurm_jobs(self.run_artifact_dirs)

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


class f_lstm_devmap(object):
    def __init__(self, fold_mode):
        self.fold_mode = fold_mode

    def trigger(self, *data):
        # Build config
        h_size = int(data[0][0])
        num_extra_lstm_layers = int(data[0][1])
        L2_loss_factor = int(data[0][2])
        num_epochs = int(data[0][3])

        config = {
            "fold_mode": self.fold_mode,

            "h_size": 2 ** h_size,
            "num_extra_lstm_layers": num_extra_lstm_layers,

            "L2_loss_factor": 0.05 * L2_loss_factor,

            "batch_size": 64,
            "num_epochs": 2 ** num_epochs * 50,
            "out_dir": "/tmp",
        }
        # utils.pretty_print_dict(config)

        job_ids, run_artifact_dirs = trigger_slurm_jobs(task='devmap',
                                          fold_mode=self.fold_mode,
                                          split_mode='3',
                                          method='DeepTuneLSTM',
                                          config=config,
                                          num_iterations=NUM_EXP_ITERATIONS)

        self.run_artifact_dirs = run_artifact_dirs

        return job_ids

    def get_result(self):
        results_df = aggregate_results_of_slurm_jobs(self.run_artifact_dirs)

        # Calculate metric
        accuracy = np.mean(results_df[results_df['set'] == 'valid']['Correct?'])
        print('Metric:', accuracy)

        return accuracy * (-1)


class f_lstm_devmap_random(f_lstm_devmap):
    def __init__(self):
        f_lstm_devmap.__init__(self, 'random')


class f_lstm_devmap_grouped(f_lstm_devmap):
    def __init__(self):
        f_lstm_devmap.__init__(self, 'grouped')


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


class f_gnn_ast_tc(object):
    def trigger(self, *data):
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
        # utils.pretty_print_dict(config)

        job_ids, run_artifact_dirs = trigger_slurm_jobs(task='tc',
                                          method='DeepTuneGNNClang',
                                          config=config,
                                          num_iterations=NUM_EXP_ITERATIONS)

        self.run_artifact_dirs = run_artifact_dirs

        return job_ids


    def get_result(self):
        results_df = aggregate_results_of_slurm_jobs(self.run_artifact_dirs)

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


class f_gnn_ast_devmap(object):
    def __init__(self, train_idx, valid_idx, test_idx, fold_idx, dataset):
        self.train_idx = train_idx
        self.valid_idx = valid_idx
        self.test_idx = test_idx
        self.fold_idx = fold_idx
        self.dataset = dataset

    def trigger(self, *data):
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
        # utils.pretty_print_dict(config)

        job_ids, run_artifact_dirs = trigger_slurm_jobs(task='devmap',
                                                        method='DeepTuneGNNClang',
                                                        config=config,
                                                        num_iterations=NUM_EXP_ITERATIONS,
                                                        train_idx=self.train_idx,
                                                        valid_idx=self.valid_idx,
                                                        test_idx=self.test_idx,
                                                        fold_idx=self.fold_idx,
                                                        dataset=self.dataset)
        self.run_artifact_dirs = run_artifact_dirs

        return job_ids

    def get_result(self):
        return aggregate_results_of_slurm_jobs(self.run_artifact_dirs)


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


class f_gnn_llvm_tc(object):
    def trigger(self, *data):
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
        # utils.pretty_print_dict(config)

        job_ids, run_artifact_dirs = trigger_slurm_jobs(task='tc',
                                          method='DeepTuneGNNLLVM',
                                          config=config,
                                          num_iterations=NUM_EXP_ITERATIONS)

        self.run_artifact_dirs = run_artifact_dirs

        return job_ids

    def get_result(self):
        results_df = aggregate_results_of_slurm_jobs(self.run_artifact_dirs)

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


class f_gnn_llvm_devmap(object):
    def __init__(self, train_idx, valid_idx, test_idx, fold_idx, dataset):
        self.train_idx = train_idx
        self.valid_idx = valid_idx
        self.test_idx = test_idx
        self.fold_idx = fold_idx
        self.dataset = dataset

    def trigger(self, *data):
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
            "num_epochs": 2, #2 ** num_epochs * 100,
            "out_dir": "/tmp",

            "tie_fwd_bkwd": tie_fwd_bkwd,
            "use_edge_bias": 0,
            "use_edge_msg_avg_aggregation": 0,

            "use_node_values": 0,
            "save_best_model_interval": 1,
            "with_aux_in": 1,

            "edge_type_filter": []
        }
        # utils.pretty_print_dict(config)

        job_ids, run_artifact_dirs = trigger_slurm_jobs(task='devmap',
                                                        method='DeepTuneGNNLLVM',
                                                        config=config,
                                                        num_iterations=NUM_EXP_ITERATIONS,
                                                        train_idx=self.train_idx,
                                                        valid_idx=self.valid_idx,
                                                        test_idx=self.test_idx,
                                                        fold_idx=self.fold_idx,
                                                        dataset=self.dataset)
        self.run_artifact_dirs = run_artifact_dirs

        return job_ids

    def get_result(self):
        return aggregate_results_of_slurm_jobs(self.run_artifact_dirs)


# Aggregation functions
def aggregate_arithmetic_mean(results_df, train_or_test_or_valid):
    accuracy = np.mean(results_df[results_df['set'] == train_or_test_or_valid]['Correct?'])

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

        args = parser_exp.parse_args(sys.argv[2:])

        # Map arguments -> Functions
        fn_dims_and_default_params = None
        fn_evaluation = None
        fn_aggregation = None

        if args.method == 'DeepTuneLSTM':
            if args.experiment == 'tc':
                fn_dims_and_default_params = get_lstm_tc_dimensions_and_default_params
                fn_evaluation = f_lstm_tc
            elif args.experiment == 'devmap':
                fn_dims_and_default_params = get_lstm_devmap_dimensions_and_default_params
                if args.fold_mode == 'random':
                    fn_evaluation = f_lstm_devmap_random
                elif args.fold_mode == 'grouped':
                    fn_evaluation = f_lstm_devmap_grouped
        if args.method == 'DeepTuneGNNClang':
            if args.experiment == 'tc':
                fn_dims_and_default_params = get_gnn_ast_tc_dimensions_and_default_params
                fn_evaluation = f_gnn_ast_tc
            elif args.experiment == 'devmap':
                fn_dims_and_default_params = get_gnn_ast_devmap_dimensions_and_default_params
                fn_evaluation = f_gnn_ast_devmap
        if args.method == 'DeepTuneGNNLLVM':
            if args.experiment == 'tc':
                fn_dims_and_default_params = get_gnn_llvm_tc_dimensions_and_default_params
                fn_evaluation = f_gnn_llvm_tc
            elif args.experiment == 'devmap':
                fn_dims_and_default_params = get_gnn_llvm_devmap_dimensions_and_default_params
                fn_evaluation = f_gnn_llvm_devmap

        if args.experiment == 'devmap':
            fn_aggregation = aggregate_arithmetic_mean

        for dataset in ['amd', 'nvidia']:
            result_file_dataset_specific = args.result_file + '_' + dataset + '.pckl'

            # Split into folds
            # ###############################
            kfold_k = 7
            if dataset == 'amd':
                df = pd.read_csv(os.path.join(SCRIPT_DIR, '../../../data/dev_mapping_task/prediction_task_amd.csv'))
            elif dataset == 'nvidia':
                df = pd.read_csv(os.path.join(SCRIPT_DIR, '../../../data/dev_mapping_task/prediction_task_nvidia.csv'))

            y = np.array([1 if x == "GPU" else 0 for x in df["oracle"].values])
            train_valid_test_split = DevMapExperiment.get_stratified_kfold_train_valid_test_split(y, kfold_k)
            num_splits = len(train_valid_test_split)

            # Do optimization
            # ###############################
            dims, default_params = fn_dims_and_default_params()
            num_iterations = int(args.num_iterations)
            num_parallel_per_iteration = 1

            # Create / Load optimizers
            if os.path.isfile(result_file_dataset_specific):
                with open(result_file_dataset_specific, 'rb') as f:
                    data = pickle.load(f)
            else:
                data = {
                    'iteration': 0,
                    'dataset': dataset,
                    'folds': []
                }
                for split_idx in range(num_splits):
                    data['folds'].append({
                        'opt': skopt.optimizer.Optimizer(dimensions=dims),
                        'iterations': []
                    })

            iteration = data['iteration']
            for iteration in range(iteration, num_iterations):
                # Get params and trigger jobs
                job_ids = set()
                for split_idx in range(num_splits):
                    opt = data['folds'][split_idx]['opt']

                    # Get params from optimizer
                    x = opt.ask(n_points=num_parallel_per_iteration)
                    data['folds'][split_idx]['x'] = x

                    # Trigger jobs
                    data['folds'][split_idx]['jobs'] = []
                    for v in x:
                        split = train_valid_test_split[split_idx]

                        job = fn_evaluation(split['train_idx'], split['valid_idx'], split['test_idx'], split_idx, dataset)
                        data['folds'][split_idx]['jobs'].append(job)

                        job_ids = job_ids.union(job.trigger(v))

                # Wait for jobs to complete
                wait_for_slurm_jobs(job_ids, 30)

                # Get and aggregate results
                for split_idx in range(num_splits):
                    opt = data['folds'][split_idx]['opt']

                    x = data['folds'][split_idx]['x']

                    df_fold = [job.get_result() for job in data['folds'][split_idx]['jobs']]
                    df_fold = pd.concat(df_fold)
                    y_valid = fn_aggregation(df_fold, 'valid')

                    # Report to optimizer
                    res = opt.tell(x, y_valid)

                    data['folds'][split_idx]['iterations'].append({
                        'df_fold': df_fold,
                        'y_valid': fn_aggregation(df_fold, 'valid'),
                        'y_test': fn_aggregation(df_fold, 'test')
                    })

                    data['folds'][split_idx]['res'] = res

                # Show metric on stdout
                df_all_folds = pd.concat([data['folds'][split_idx]['iterations'][-1]['df_fold'] for split_idx in range(num_splits)])
                print('Validation accuracy: %f' % fn_aggregation(df_all_folds, 'valid'))
                print('Test accuracy: %f' % fn_aggregation(df_all_folds, 'test'))

                # Show on stdout and store on disk
                for split_idx in range(num_splits):
                    opt = data['folds'][split_idx]['opt']
                    x = data['folds'][split_idx]['x']
                    print('Iteration: %i, Split: %i, Params: %s, Minimum: %f' % (iteration, split_idx, str(x), min(opt.yi)))

                data['iteration'] = iteration

                with open(result_file_dataset_specific, 'wb') as f:
                    pickle.dump(data, f)

        global ssh_client
        ssh_client.close()

    # Visualize command
    if command_arg.command == 'visualize':
        parser_vis = subparsers.add_parser('visualize')

        parser_vis.add_argument('--result_file')

        args = parser_vis.parse_args(sys.argv[2:])

        data = pickle.load(open(args.result_file, "rb"))
        for fold in data['folds']:
            res = fold['res']

            ax = plot_convergence(res)
            plt.grid()
            plt.legend()
            plt.show()

            # ax = plot_evaluations(res)
            # plt.grid()
            # plt.legend()
            # plt.show()
            #
            # ax = plot_objective(res)
            # plt.grid()
            # plt.legend()
            # plt.show()


if __name__ == '__main__':
    main()
