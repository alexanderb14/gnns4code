import argparse
import json
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
from io import StringIO


SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
sys.path.append(SCRIPT_DIR + '/..')

import experiment.DevMapExperiment as DevMapExperiment
import experiment.drivers.exp_utils as exp_utils
import utils as utils



REPORTS_DIR = 'tmp/hyperparam_reports'


def split_dict(d: dict):
    dims = []
    default_params = []
    for x in d:
        dims.append(x[0])
        default_params.append(x[1])

    return dims, default_params


def execute_ssh_command(cmd):
    client = paramiko.SSHClient()
    client.load_system_host_keys()
    client.set_missing_host_key_policy(paramiko.WarningPolicy)
    client.connect(os.environ['ZIH_LOGIN_SERVER'], username=os.environ['ZIH_USERNAME'])

    stdin, stdout, stderr = client.exec_command(cmd)
    ret = stdout.readlines()

    client.close()

    return ret


def get_slurm_job_stati():
    lines = execute_ssh_command('sacct -o JobID,State')

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


def run_n_times_on_slurm(task: str, method: str, config_str: str, num_iterations: int, fold_mode: str, split_mode: str):
    # Run several instances of the experiment on slurm
    # Cleanup and prepare dirs
    pwd = execute_ssh_command('pwd')[0].replace('\n', '')
    reports_dir = os.path.join(pwd, REPORTS_DIR)

    execute_ssh_command('mkdir -p ' + reports_dir)
    run_artifact_dirs = []
    cmds = []

    # Build commands and prepare dirs
    for i in range(0, num_iterations):
        run_id = str(uuid.uuid4())
        run_artifact_dir = os.path.join(reports_dir, run_id)
        run_artifact_dirs.append(run_artifact_dir)

        execute_ssh_command('mkdir ' + run_artifact_dir)

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
    # triggered_jobs = set()
    # for cmds in chunks:
    #     complete_cmd = ''
    #     for cmd in cmds:
    #         complete_cmd += cmd + ' & '
    #     complete_cmd += 'wait'
    #
    #     job_id = run_slurm_job(complete_cmd)
    #     triggered_jobs.add(job_id)
    triggered_jobs = set()
    for cmd in cmds:
        job_id = run_slurm_job(cmd)
        triggered_jobs.add(job_id)

    # Periodically poll and wait for completion
    while len(triggered_jobs) != 0:
        time.sleep(10)

        stati = get_slurm_job_stati()
        print('Running:\t', stati['running'])

        triggered_jobs = triggered_jobs - stati['completed']
        print('Awaiting:\t', triggered_jobs)

    # When completed, aggregate all result csvs to metric and report
    # Get and aggregate results
    result_dfs = []
    for i, run_artifact_dir in enumerate(run_artifact_dirs):
        result_csv = ''.join(execute_ssh_command('cat ' + run_artifact_dir + '/*_raw.txt'))
        print(result_csv)
        result_df = pd.read_csv(StringIO(result_csv))

        result_dfs.append(result_df)

    return pd.concat(result_dfs)


def get_gnn_ast_dimensions_and_default_params():
    dims_and_default_params = [
        (skopt.space.Integer(low=1, high=4, name='num_timesteps'), 4),
        (skopt.space.Integer(low=1, high=4, name='gnn_h_size'), 2),
        (skopt.space.Integer(low=1, high=4, name='gnn_m_size'), 2),

        (skopt.space.Integer(low=0, high=4, name='prediction_cell_mlp_f_m_dims'), 2),
        (skopt.space.Integer(low=0, high=4, name='prediction_cell_mlp_g_m_dims'), 2),
        (skopt.space.Integer(low=0, high=4, name='prediction_cell_mlp_reduce_dims'), 2),

        (skopt.space.Integer(low=0, high=4, name='embedding_layer_size'), 2),
        (skopt.space.Integer(low=0, high=4, name='embedding_layer_dims'), 2),

        (skopt.space.Real(low=0.0001, high=0.001, name='learning_rate'), 0.0001),
        (skopt.space.Integer(low=0, high=5, name='num_epochs'), 1),
        (skopt.space.Integer(low=0, high=10, name='L2_loss_factor'), 0),

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

    embedding_layer_size = int(data[0][6])
    embedding_layer_dims = int(data[0][7])

    learning_rate = float(data[0][8])
    num_epochs = int(data[0][9])
    L2_loss_factor = int(data[0][10])

    tie_fwd_bkwd = int(data[0][11])

    config = {
        "run_id": 'foo',
        'fold_mode': 'random',

        "graph_rnn_cell": "GRU",

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

            "mlp_reduce_after_aux_in_1_dims": [],
            "mlp_reduce_after_aux_in_1_activation": "relu",
            "mlp_reduce_after_aux_in_1_out_dim": 32,

            "mlp_reduce_after_aux_in_2_dims": [],
            "mlp_reduce_after_aux_in_2_activation": "sigmoid",
            "mlp_reduce_after_aux_in_2_out_dim": 6,

            "output_dim": 6,
        },

        "embedding_layer": {
            "mapping_dims": [2 ** embedding_layer_size] * embedding_layer_dims
        },

        "learning_rate": learning_rate,
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

        "seed": 1
    }
    config_str = json.dumps(config).replace('"', '\\"').replace(' ', '')
    utils.pretty_print_dict(config)

    results_df = run_n_times_on_slurm(task='tc',
                                      method='DeepTuneGNNClang',
                                      config_str=config_str,
                                      num_iterations=2)

    # Calculate metric
    speedup = scipy.stats.gmean(list(results_df['Speedup']))
    print(speedup)

    return speedup


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

    embedding_layer_size = int(data[0][6])
    embedding_layer_dims = int(data[0][7])

    learning_rate = float(data[0][8])
    num_epochs = int(data[0][9])
    L2_loss_factor = int(data[0][10])

    tie_fwd_bkwd = int(data[0][11])

    config = {
        "run_id": 'foo',
        'fold_mode': 'random',

        "graph_rnn_cell": "GRU",

        "num_timesteps": num_timesteps * 2,
        "hidden_size_orig": 92,
        "gnn_h_size": 2 ** gnn_h_size,
        "gnn_m_size": gnn_m_size * 2,

        "num_edge_types": 2,

        "prediction_cell": {
            "mlp_f_m_dims": [gnn_h_size * gnn_m_size * 2] * prediction_cell_mlp_f_m_dims,
            "mlp_f_m_activation": "sigmoid",

            "mlp_g_m_dims": [gnn_h_size * gnn_m_size * 2] * prediction_cell_mlp_g_m_dims,
            "mlp_g_m_activation": "relu",

            "mlp_reduce_dims": [gnn_h_size * gnn_m_size * 2] * prediction_cell_mlp_reduce_dims,
            "mlp_reduce_activation": "relu",

            "mlp_reduce_after_aux_in_1_dims": [],
            "mlp_reduce_after_aux_in_1_activation": "relu",
            "mlp_reduce_after_aux_in_1_out_dim": 32,

            "mlp_reduce_after_aux_in_2_dims": [],
            "mlp_reduce_after_aux_in_2_activation": "sigmoid",
            "mlp_reduce_after_aux_in_2_out_dim": 2,

            "output_dim": 2,
        },

        "embedding_layer": {
            "mapping_dims": [2 ** embedding_layer_size] * embedding_layer_dims
        },

        "learning_rate": learning_rate,
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

        "seed": 1
    }
    config_str = json.dumps(config).replace('"', '\\"').replace(' ', '')
    utils.pretty_print_dict(config)

    results_df = run_n_times_on_slurm(task='devmap',
                                      fold_mode=fold_mode,
                                      split_mode=split_mode,
                                      method='DeepTuneGNNClang',
                                      config_str=config_str,
                                      num_iterations=3)

    # Calculate metric
    accuracy = scipy.stats.mean(results_df['set' == 'Valid']['Correct?'])
    print('Metric:', accuracy)

    return accuracy


def main():
    parser = argparse.ArgumentParser()

    parser.add_argument('--experiment')
    parser.add_argument('--fold_mode')
    parser.add_argument('--method')
    parser.add_argument('--checkpoint_file')
    parser.add_argument('--result_file')
    parser.add_argument('--num_iterations')

    args = parser.parse_args()

    #
    fn_dims_and_default_params = None
    fn_f = None

    if args.experiment == 'tc':
        fn_dims_and_default_params = get_gnn_ast_dimensions_and_default_params
        fn_f = f_gnn_ast_tc
    elif args.experiment == 'devmap':
        fn_dims_and_default_params = get_gnn_ast_dimensions_and_default_params
        if args.fold_mode == 'random':
            fn_f = f_gnn_ast_devmap_random
        elif args.fold_mode == 'grouped':
            fn_f = f_gnn_ast_devmap_grouped

    dims, default_params = fn_dims_and_default_params()
    num_iterations = int(args.num_iterations)

    checkpoint_saver = skopt.callbacks.CheckpointSaver(args.checkpoint_file, compress=0)
    if os.path.isfile(args.checkpoint_file):
        res = skopt.load(args.checkpoint_file)

        gp_result = skopt.gp_minimize(func=fn_f,                    # the function to minimize
                                      dimensions=dims,              # the bounds on each dimension of x
                                      n_calls=num_iterations,       # the number of evaluations of f
                                      callback=[checkpoint_saver],
                                      x0=res.x_iters,               # already examined values for x
                                      y0=res.func_vals,             # observed values for x0
                                      verbose=True)

    else:
        gp_result = skopt.gp_minimize(func=fn_f,                        # the function to minimize
                                      dimensions=dims,                  # the bounds on each dimension of x
                                      n_calls=num_iterations,           # the number of evaluations of f
                                      callback=[checkpoint_saver],
                                      x0=default_params,                # start values for x
                                      verbose=True)

    with open(args.result_file, 'w') as f:
        pickle.dump(gp_result, f)

    print(gp_result.x, gp_result.fun)

if __name__ == '__main__':
    main()
