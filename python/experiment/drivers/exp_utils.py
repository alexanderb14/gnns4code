import os


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
            'config': 'ml.slurm',
            'concurrency': 4,
        },
        'workstation': {
            'concurrency': 4,
            'env': '/devel/envs/brauckmann-diploma-2019'
        }
    },
    'DeepTuneGNNClangASTEdges': {
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
    },
    'DeepTuneGNNLLVMCFGEdges': {
        'slurm': {
            'config': 'ml.slurm'
        },
        'workstation': {
            'concurrency': 4,
            'env': '/devel/envs/brauckmann-diploma-2019'
        }
    },
    'DeepTuneGNNLLVMCFGDataflowEdges': {
        'slurm': {
            'config': 'ml.slurm'
        },
        'workstation': {
            'concurrency': 4,
            'env': '/devel/envs/brauckmann-diploma-2019'
        }
    },
    'DeepTuneGNNLLVMCFGDataflowCallEdges': {
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
            'concurrency': 4,
            'env': '/devel/envs/brauckmann-diploma-2019'
        }
    },
    'DeepTuneGNNClangASTEdges': {
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
    },
    'DeepTuneGNNLLVMCFGEdges': {
        'slurm': {
            'config': 'ml.slurm'
        },
        'workstation': {
            'concurrency': 4,
            'env': '/devel/envs/brauckmann-diploma-2019'
        }
    },
    'DeepTuneGNNLLVMCFGDataflowEdges': {
        'slurm': {
            'config': 'ml.slurm'
        },
        'workstation': {
            'concurrency': 4,
            'env': '/devel/envs/brauckmann-diploma-2019'
        }
    },
    'DeepTuneGNNLLVMCFGDataflowCallEdges': {
        'slurm': {
            'config': 'ml.slurm'
        },
        'workstation': {
            'concurrency': 4,
            'env': '/devel/envs/brauckmann-diploma-2019'
        }
    }
}


# ThreadCoarsening experiment
def build_tc_experiment_cmd(method, report_write_dir, seed, config=None):
    cmd = ['gnns4code/python/experiment/ThreadCoarsenExperiment.py']

    experiment_arg = ['experiment']
    dataset_args = ['--runtimes_csv gnns4code/data/thread_coarsen_task/pact-2014-runtimes.csv',
                    '--oracles_csv gnns4code/data/thread_coarsen_task/pact-2014-oracles.csv',
                    '--devmap_amd_csv gnns4code/data/thread_coarsen_task/cgo17-amd.csv']

    args = experiment_arg \
            + dataset_args \
            + ['--' + method] \
            + ['--report_write_dir', report_write_dir] \
            + ['--seed', str(seed)] \

    if config:
        args += ['--config', config]

    return cmd + args


def build_tc_experiment_infos(report_write_root_dir, num_iterations, methods):
    cmds = []

    if len(methods) == 0:
        methods = ['DeepTuneGNNClang', 'DeepTuneGNNClangASTEdges', 'DeepTuneGNNLLVM', 'DeepTuneGNNLLVMCFGEdges', 'DeepTuneGNNLLVMCFGDataflowEdges', 'DeepTuneGNNLLVMCFGDataflowCallEdges', 'DeepTuneLSTM', 'Magni']

    for method in methods:
        for seed in range(1, num_iterations + 1):
            # Create report dir
            report_write_dir = os.path.join(report_write_root_dir, 'tc_%s' % (method))
            if not os.path.exists(report_write_dir):
                os.makedirs(report_write_dir)

            # Build command
            cmd = build_tc_experiment_cmd(method, report_write_dir, seed)

            cmds.append({
                'cmd': cmd,
                'config': TC_CONFIGS[method]
            })

    return cmds


# DevMap experiment
def build_devmap_experiment_cmd(method, fold_mode, split_mode, report_write_dir, seed, config=None):
    cmd = ['gnns4code/python/experiment/DevMapExperiment.py']

    experiment_arg = ['experiment']
    dataset_args = ['--dataset_nvidia gnns4code/data/dev_mapping_task/prediction_task_nvidia.csv',
                    '--dataset_amd gnns4code/data/dev_mapping_task/prediction_task_amd.csv']

    args = experiment_arg \
            + dataset_args \
            + ['--' + method] \
            + ['--fold_mode', fold_mode] \
            + ['--split_mode', split_mode] \
            + ['--report_write_dir', report_write_dir] \
            + ['--seed', str(seed)] \

    if config:
        args += ['--config', config]

    return cmd + args


def build_devmap_experiment_infos(report_write_root_dir, num_iterations, methods):
    cmds = []

    if len(methods) == 0:
        methods = ['DeepTuneGNNClang', 'DeepTuneGNNClangASTEdges', 'DeepTuneGNNLLVM', 'DeepTuneGNNLLVMCFGEdges', 'DeepTuneGNNLLVMCFGDataflowEdges', 'DeepTuneGNNLLVMCFGDataflowCallEdges', 'DeepTuneLSTM', 'RandomMapping', 'StaticMapping', 'Grewe']

    for method in methods:
        for fold_mode in ['random', 'grouped']:
            for seed in range(1, num_iterations + 1):
                # Create report dir
                report_write_dir = os.path.join(report_write_root_dir, 'devmap_%s_%s' % (method, fold_mode))
                if not os.path.exists(report_write_dir):
                    os.makedirs(report_write_dir)

                # Build command
                cmd = build_devmap_experiment_cmd(method, fold_mode, report_write_dir, seed)

                cmds.append({
                    'cmd': cmd,
                    'config': DEVMAP_CONFIGS[method]
                })

    return cmds
