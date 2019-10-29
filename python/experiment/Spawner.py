import argparse
import concurrent.futures
import enum
import os
import subprocess
import sys


CONFIG_DIR = 'configs'
ENV_AND_CLUSTER_MAPPINGS = {
    'RandomMapping': {
        'cluster': 'ml.slurm',
        'env': '~/env/bin/activate'
    },
    'StaticMapping': {
        'cluster': 'ml.slurm',
        'env': '~/env/bin/activate'
    },
    'Grewe': {
        'cluster': 'ml.slurm',
        'env': '~/env/bin/activate'
    },
    'DeepTuneLSTM': {
        'cluster': 'ml.slurm',
        'env': '~/env/bin/activate'
    },
    'DeepTuneGNNClang': {
        'cluster': 'ml.slurm',
        'env': '~/env/bin/activate'
    },
    'DeepTuneGNNLLVM': {
        'cluster': 'ml.slurm',
        'env': '~/env/bin/activate'
    }
}

def print_process_stdout_continuously(process, prefix):
    while True:
        line = process.stdout.readline()
        if not line:
            break
        print(str(prefix) + ': ' + str(line.rstrip(), 'utf-8'))

    process.wait()
    print(prefix + ' RETURNCODE: ' + str(process.returncode))


# DevMap experiment
def build_devmap_experiment_args(method, fold_mode, report_write_dir, seed):
    experiment_arg = ['experiment']
    dataset_args = ['--dataset_nvidia ../../data/dev_mapping_task/prediction_task.csv',
                    '--dataset_amd ../../data/dev_mapping_task/prediction_task_amd.csv']

    args = experiment_arg \
            + dataset_args \
            + ['--' + method] \
            + ['--fold_mode', fold_mode] \
            + ['--report_write_dir', report_write_dir] \
            + ['--seed', str(seed)] \

    return args


def build_devmap_experiment_infos(report_write_root_dir):
    cmds = []

    for method in ['RandomMapping', 'StaticMapping', 'Grewe', 'DeepTuneLSTM', 'DeepTuneGNNClang', 'DeepTuneGNNLLVM']:
        for fold_mode in ['random_10fold', 'benchmark_grouped_7fold']:
            for seed in range(1, 11):
                # Create report dir
                report_write_dir = os.path.join(report_write_root_dir, 'devmap_%s_%s' % (method, fold_mode))
                os.makedirs(report_write_dir, exist_ok=True)

                # Build command
                cmd = ['python', 'python/experiment/DevMapExperiment.py']
                cmd += build_devmap_experiment_args(method, fold_mode, report_write_dir, seed)

                cmds.append({
                    'cmd': cmd,
                    'cluster': ENV_AND_CLUSTER_MAPPINGS[method]['cluster'],
                    'env': ENV_AND_CLUSTER_MAPPINGS[method]['env']
                })

    return cmds


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--experiment')
    args = parser.parse_args()

    if args.experiment == 'devmap':
        infos = build_devmap_experiment_infos('/tmp/devmap')

        for info in infos:

            # Build complete command
            complete_command = ' '.join(['sbatch'] + [os.path.join(CONFIG_DIR, info['cluster'])] +
                                        ['activate'] + [info['env']] +
                                        ['&&'] +
                                        info['cmd'])
            process = subprocess.Popen(complete_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, cwd=os.getcwd())
            print_process_stdout_continuously(process, 0)

            break

if __name__ == '__main__':
    main()
