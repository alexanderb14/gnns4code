import argparse
import os
import subprocess


CONFIG_DIR = 'gnns4code/taurus'
DEVMAP_CONFIG_MAPPINGS = {
    'RandomMapping': {
        'slurm_config': 'ml.slurm',
    },
    'StaticMapping': {
        'slurm_config': 'ml.slurm',
    },
    'Grewe': {
        'slurm_config': 'ml.slurm',
    },
    'DeepTuneLSTM': {
        'slurm_config': 'ml.slurm',
    },
    'DeepTuneGNNClang': {
        'slurm_config': 'ml.slurm',
    },
    'DeepTuneGNNLLVM': {
        'slurm_config': 'ml.slurm',
    }
}
TC_CONFIG_MAPPINGS = {
    'Magni': {
        'slurm_config': 'ml.slurm',
    },
    'DeepTuneLSTM': {
        'slurm_config': 'ml.slurm',
    },
    'DeepTuneGNNClang': {
        'slurm_config': 'ml.slurm',
    },
    'DeepTuneGNNLLVM': {
        'slurm_config': 'ml.slurm',
    }
}

# ThreadCoarsening experiment
def build_tc_experiment_args(method, report_write_dir, seed):
    experiment_arg = ['experiment']
    dataset_args = ['--runtimes_csv gnns4code/data/thread_coarsen_task/pact-2014-runtimes.csv',
                    '--oracles_csv gnns4code/data/thread_coarsen_task/pact-2014-oracles.csv',
                    '--devmap_amd_csv gnns4code/data/thread_coarsen_task/cgo17-amd.csv']

    args = experiment_arg \
            + dataset_args \
            + ['--' + method] \
            + ['--report_write_dir', report_write_dir] \
            + ['--seed', str(seed)] \

    return args


def build_tc_experiment_infos(report_write_root_dir, num_iterations):
    cmds = []

    for method in ['Magni', 'DeepTuneLSTM', 'DeepTuneGNNClang', 'DeepTuneGNNLLVM']:
        for seed in range(1, num_iterations + 1):
            # Create report dir
            report_write_dir = os.path.join(report_write_root_dir, 'tc_%s' % (method))
            if not os.path.exists(report_write_dir):
                os.makedirs(report_write_dir)

            # Build command
            cmd = ['python', 'gnns4code/python/experiment/ThreadCoarsenExperiment.py']
            cmd += build_tc_experiment_args(method, report_write_dir, seed)

            cmds.append({
                'cmd': cmd,
                'slurm_config': TC_CONFIG_MAPPINGS[method]['slurm_config']
            })

    return cmds


# DevMap experiment
def build_devmap_experiment_args(method, fold_mode, report_write_dir, seed):
    experiment_arg = ['experiment']
    dataset_args = ['--dataset_nvidia gnns4code/data/dev_mapping_task/prediction_task.csv',
                    '--dataset_amd gnns4code/data/dev_mapping_task/prediction_task_amd.csv']

    args = experiment_arg \
            + dataset_args \
            + ['--' + method] \
            + ['--fold_mode', fold_mode] \
            + ['--report_write_dir', report_write_dir] \
            + ['--seed', str(seed)] \

    return args


def build_devmap_experiment_infos(report_write_root_dir, num_iterations):
    cmds = []

    for method in ['RandomMapping', 'StaticMapping', 'Grewe', 'DeepTuneLSTM', 'DeepTuneGNNClang', 'DeepTuneGNNLLVM']:
        for fold_mode in ['random_10fold', 'benchmark_grouped_7fold']:
            for seed in range(1, num_iterations + 1):
                # Create report dir
                report_write_dir = os.path.join(report_write_root_dir, 'devmap_%s_%s' % (method, fold_mode))
                if not os.path.exists(report_write_dir):
                    os.makedirs(report_write_dir)

                # Build command
                cmd = ['python', 'gnns4code/python/experiment/DevMapExperiment.py']
                cmd += build_devmap_experiment_args(method, fold_mode, report_write_dir, seed)

                cmds.append({
                    'cmd': cmd,
                    'slurm_config': DEVMAP_CONFIG_MAPPINGS[method]['slurm_config']
                })

    return cmds


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--experiment')
    parser.add_argument('--num_iterations')
    parser.add_argument('--report_write_root_dir')
    args = parser.parse_args()

    if args.experiment == 'devmap':
        infos = build_devmap_experiment_infos(
            os.path.join(args.report_write_root_dir, 'devmap'),
            int(args.num_iterations))
    elif args.experiment == 'tc':
        infos = build_tc_experiment_infos(
            os.path.join(args.report_write_root_dir, 'tc'),
            int(args.num_iterations))

    print('Number of jobs: %i' % len(infos))

    for info in infos:
        # Build complete command
        complete_command = ' '.join(['sbatch'] + [os.path.join(CONFIG_DIR, info['slurm_config'])] +
                                    ['\"'] +
                                    info['cmd'] +
                                    ['\"'])
        print(complete_command)
        os.system(complete_command)

if __name__ == '__main__':
    main()
