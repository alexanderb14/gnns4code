import argparse
import concurrent.futures
import os
import subprocess
import sys


def print_process_stdout_continuously(process, prefix):
    while True:
        line = process.stdout.readline()
        if not line:
            break
        print(str(prefix) + ': ' + str(line.rstrip(), 'utf-8'))

    process.wait()
    print(prefix + ' RETURNCODE: ' + str(process.returncode))


def main():
    parser = argparse.ArgumentParser()

    parser.add_argument('--command')
    parser.add_argument('--num_command_iterations')
    parser.add_argument('--num_threads')

    args = parser.parse_args()

    iterations = range(0, int(args.num_command_iterations))

    def fnc(iteration):
        command = args.command.split(' ')
        process = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, cwd=os.getcwd())
        print_process_stdout_continuously(process, iteration)

    with concurrent.futures.ThreadPoolExecutor(max_workers=int(args.num_threads)) as executor:
        executor.map(fnc, iterations)

if __name__ == '__main__':
    main()
