import argparse
import json
import os
import re
import time

import paramiko
import skopt
import sys

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
sys.path.append(SCRIPT_DIR + '/..')

import experiment.DevMapExperiment as DevMapExperiment
import experiment.runners.exp_utils as exp_utils
import utils as utils


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
    pending_jobs = set()
    running_jobs = set()

    for line in lines[2:]:
        job_id = int(re.findall('[0-9]+', line)[0])
        job_status = re.findall('[A-Z]+', line)[0]

        if job_status == 'COMPLETED':
            completed_jobs.add(job_id)
        elif job_status == 'PENDING':
            pending_jobs.add(job_id)
        elif job_status == 'RUNNING':
            running_jobs.add(job_id)

    return {
        'completed': completed_jobs,
        'pending': pending_jobs,
        'running': running_jobs
    }


def run_slurm_job(cmd):
    lines = execute_ssh_command(cmd)
    job_id = int(re.findall('[0-9]+', lines[0])[0])

    return job_id


def get_gnn_dimensions_and_default_params():
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

        (skopt.space.Integer(low=0, high=1, name='tie_fwd_bkwd'), 0),
    ]

    dims = []
    default_params = []
    for x in dims_and_default_params:
        dims.append(x[0])
        default_params.append(x[1])

    return dims, default_params


def f_gnn(*data):
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

    tie_fwd_bkwd = int(data[0][10])

    config = {
        "run_id": 'foo',
        'fold_mode': 'random_10fold',

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
        "L2_loss_factor": 0,

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
    config_str = json.dumps(config).replace('\"', '\\"')
    print(config_str)
    utils.pretty_print_dict(config)

    # Run several instances of the experiment on slurm
    triggered_jobs = set()
    for i in range(0, 2):
        cmd = exp_utils.build_tc_experiment_cmd('DeepGMGClang', '/tmp', 0, config_str)
        cmd = ' '.join(['sbatch'] + [os.path.join(exp_utils.CONFIG_DIR, 'ml.slurm')] +
                       ['\"'] +
                       ['python'] + cmd +
                       ['\"'])

        job_id = run_slurm_job(cmd)
        triggered_jobs.add(job_id)

    # Periodically poll and wait for completion
    while len(triggered_jobs) > 0:
        time.sleep(30)

        stati = get_slurm_job_stati()
        print(stati)

        completed_jobs = stati['completed']
        triggered_jobs = triggered_jobs - completed_jobs

    # When completed, aggregate all result csvs to geometric mean and report


    exit(0)

    return 1


def main():
    parser = argparse.ArgumentParser()

    parser.add_argument('--experiment')
    parser.add_argument('--method')

    args = parser.parse_args()

    #
    dims, default_params = get_gnn_dimensions_and_default_params()
    gp_result = skopt.gp_minimize(func=f_gnn,
                                  dimensions=dims,
                                  n_calls=12,
                                  noise=0.01,
                                  n_jobs=-1,
                                  kappa=5,
                                  x0=default_params)


if __name__ == '__main__':
    main()
