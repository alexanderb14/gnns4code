import argparse
import os
import subprocess


CONFIG_DIR = 'gnns4code/taurus'
TC_CONFIGS = {
    'Magni': {
        'slurm': {
            'config': 'ml.slurm'
        },
        'workstation': {
            'concurrency': 1,
            'env': '/devel/envs/brauckmann-diploma-2019'
        }
    },
    'DeepTuneLSTM': {
        'slurm': {
            'config': 'ml.slurm'
        },
        'workstation': {
            'concurrency': 1,
            'env': '/devel/envs/brauckmann-diploma-2019'
        }
    },
    'DeepTuneGNNClang': {
        'slurm': {
            'config': 'ml.slurm'
        },
        'workstation': {
            'concurrency': 4,
            'env': '/devel/envs/brauckmann-diploma-2019'
        }
    },
    'DeepTuneGNNLLVM': {
        'slurm': {
            'config': 'ml.slurm'
        },
        'workstation': {
            'concurrency': 4,
            'env': '/devel/envs/brauckmann-diploma-2019'
        }
    }
}
DEVMAP_CONFIGS = {
    'RandomMapping': {
        'slurm': {
            'config': 'ml.slurm'
        },
        'workstation': {
            'concurrency': 2,
            'env': '/devel/envs/brauckmann-diploma-2019'
        }
    },
    'StaticMapping': {
        'slurm': {
            'config': 'ml.slurm',
        },
        'workstation': {
            'concurrency': 2,
            'env': '/devel/envs/brauckmann-diploma-2019'
        }
    },
    'Grewe': {
        'slurm': {
            'config': 'ml.slurm'
        },
        'workstation': {
            'concurrency': 2,
            'env': '/devel/envs/brauckmann-diploma-2019'
        }
    },
    'DeepTuneLSTM': {
        'slurm': {
            'config': 'ml.slurm'
        },
        'workstation': {
            'concurrency': 1,
            'env': '/devel/envs/brauckmann-diploma-2019'
        }
    },
    'DeepTuneGNNClang': {
        'slurm': {
            'config': 'ml.slurm'
        },
        'workstation': {
            'concurrency': 2,
            'env': '/devel/envs/brauckmann-diploma-2019'
        }
    },
    'DeepTuneGNNLLVM': {
        'slurm': {
            'config': 'ml.slurm'
        },
        'workstation': {
            'concurrency': 2,
            'env': '/devel/envs/brauckmann-diploma-2019'
        }
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


def build_tc_experiment_infos(report_write_root_dir, num_iterations, methods):
    cmds = []

    if len(methods) == 0:
        methods = ['DeepTuneGNNClang', 'DeepTuneGNNLLVM', 'DeepTuneLSTM', 'Magni']

    for method in methods:
        for seed in range(1, num_iterations + 1):
            # Create report dir
            report_write_dir = os.path.join(report_write_root_dir, 'tc_%s' % (method))
            if not os.path.exists(report_write_dir):
                os.makedirs(report_write_dir)

            # Build command
            cmd = ['gnns4code/python/experiment/ThreadCoarsenExperiment.py']
            cmd += build_tc_experiment_args(method, report_write_dir, seed)

            cmds.append({
                'cmd': cmd,
                'config': TC_CONFIGS[method]
            })

    return cmds


# DevMap experiment
def build_devmap_experiment_args(method, fold_mode, report_write_dir, seed):
    experiment_arg = ['experiment']
    dataset_args = ['--dataset_nvidia gnns4code/data/dev_mapping_task/prediction_task_nvidia.csv',
                    '--dataset_amd gnns4code/data/dev_mapping_task/prediction_task_amd.csv']

    args = experiment_arg \
            + dataset_args \
            + ['--' + method] \
            + ['--fold_mode', fold_mode] \
            + ['--report_write_dir', report_write_dir] \
            + ['--seed', str(seed)] \

    return args


def build_devmap_experiment_infos(report_write_root_dir, num_iterations, methods):
    cmds = []

    if len(methods) == 0:
        methods = ['DeepTuneGNNClang', 'DeepTuneGNNLLVM', 'RandomMapping', 'StaticMapping', 'Grewe', 'DeepTuneLSTM']

    for method in methods:
        for fold_mode in ['random_10fold', 'benchmark_grouped_7fold']:
            for seed in range(1, num_iterations + 1):
                # Create report dir
                report_write_dir = os.path.join(report_write_root_dir, 'devmap_%s_%s' % (method, fold_mode))
                if not os.path.exists(report_write_dir):
                    os.makedirs(report_write_dir)

                # Build command
                cmd = ['gnns4code/python/experiment/DevMapExperiment.py']
                cmd += build_devmap_experiment_args(method, fold_mode, report_write_dir, seed)

                cmds.append({
                    'cmd': cmd,
                    'config': DEVMAP_CONFIGS[method]
                })

    return cmds


def main():
    parser = argparse.ArgumentParser()

    parser.add_argument('--experiment')
    parser.add_argument('--environment')
    parser.add_argument('--num_iterations')
    parser.add_argument('--report_write_root_dir')
    parser.add_argument('--methods', '--names-list', nargs='+', default=[])

    args = parser.parse_args()

    # Build job list
    if args.experiment == 'devmap':
        infos = build_devmap_experiment_infos(
            os.path.join(args.report_write_root_dir, 'devmap'),
            int(args.num_iterations),
            args.methods)
    elif args.experiment == 'tc':
        infos = build_tc_experiment_infos(
            os.path.join(args.report_write_root_dir, 'tc'),
            int(args.num_iterations),
            args.methods)

    print('Number of jobs: %i' % len(infos))

    # Execute jobs
    if args.environment == 'slurm':
        for info in infos:
            # Build complete command
            complete_command = ' '.join(['sbatch'] + [os.path.join(CONFIG_DIR, info['config']['slurm']['config'])] +
                                        ['\"'] +
                                        ['python'] + info['cmd'] +
                                        ['\"'])
            print(complete_command)
            os.system(complete_command)

    elif args.environment == 'workstation':
        import concurrent.futures
        import subprocess

        jobs_by_concurrency = {}
        for i, info in enumerate(infos):
            complete_command = ' '.join([os.path.join(info['config']['workstation']['env'], 'bin/python')] + info['cmd'])
            complete_command = complete_command.split(' ')

            concurrency = info['config']['workstation']['concurrency']

            job = {
                'cmd': complete_command,
                'id': i
            }

            if concurrency not in jobs_by_concurrency:
                jobs_by_concurrency[concurrency] = []
            jobs_by_concurrency[concurrency].append(job)

        for concurrency, jobs in jobs_by_concurrency.items():
            def print_process_stdout_continuously(process, prefix):
                while True:
                    line = process.stdout.readline()
                    if not line:
                        break
                    print(str(prefix) + ': ' + str(line.rstrip(), 'utf-8'))

                process.wait()
                print(prefix + ' RETURNCODE: ' + str(process.returncode))

            def exec_job(job):
                print("job %i: \n%s" % (job['id'], job['cmd']))
                process = subprocess.Popen(job['cmd'], stdout=subprocess.PIPE, stderr=subprocess.PIPE, cwd=os.getcwd())
                stdout, stderr = process.communicate()

                #print(stdout, stderr)
                #print_process_stdout_continuously(process, job['id'])

            with concurrent.futures.ThreadPoolExecutor(max_workers=concurrency) as executor:
                executor.map(exec_job, jobs)


if __name__ == '__main__':
    main()
