import argparse
import os
import sys

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
sys.path.append(SCRIPT_DIR + '/../..')

import exp_utils as utils


def main():
    parser = argparse.ArgumentParser()

    parser.add_argument('--experiment')
    parser.add_argument('--environment')
    parser.add_argument('--num_iterations')
    parser.add_argument('--max_threads')
    parser.add_argument('--report_write_root_dir')
    parser.add_argument('--methods', '--names-list', nargs='+', default=[])

    args = parser.parse_args()

    # Build job list
    if args.experiment == 'devmap':
        infos = utils.build_devmap_experiment_infos(
            os.path.join(args.report_write_root_dir, 'devmap'),
            int(args.num_iterations),
            args.methods)
    elif args.experiment == 'tc':
        infos = utils.build_tc_experiment_infos(
            os.path.join(args.report_write_root_dir, 'tc'),
            int(args.num_iterations),
            args.methods)

    print('Number of jobs: %i' % len(infos))

    # Execute jobs
    if args.environment == 'slurm':
        for info in infos:
            # Build complete command
            complete_command = ' '.join(['sbatch'] + [os.path.join(utils.CONFIG_DIR, info['config']['slurm']['config'])] +
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

            num_workers = max(concurrency, int(args.max_threads))
            with concurrent.futures.ThreadPoolExecutor(max_workers=num_workers) as executor:
                executor.map(exec_job, jobs)


if __name__ == '__main__':
    main()
