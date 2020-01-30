#!/bin/bash

# Workaround for GPU sharing across SLURM job steps.
# A ticket has been filed here: https://bugs.schedmd.com/show_bug.cgi?id=8425
# Checks for job completion.

COMPLETION_FILE=completion_${SLURM_JOBID}.txt
NUM_JOBS=$1

touch $COMPLETION_FILE

while true; do 
  NUM_JOBS_CURRENT=$(wc -l < $COMPLETION_FILE)
  if [[ $NUM_JOBS = $NUM_JOBS_CURRENT ]]; then
    break
  fi

  nvidia-smi

  sleep 20
done

echo "DONE WITH ALL JOBS."
