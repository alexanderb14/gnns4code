#!/bin/bash

# Workaround for GPU sharing across SLURM job steps.
# A ticket has been filed here: https://bugs.schedmd.com/show_bug.cgi?id=8425
# Script for saving the CUDA_VISIBLE_DEVICES variable into a file, if it is set.
# This file corresponds to the slurm job id.
# Otherwise, if it is not set, load it from the corresponding job id.

# Handle CUDA_VISIBLE_DEVICES
GPUID_FILE=cuda_visible_devices_${SLURM_JOBID}.txt

if [ "$CUDA_VISIBLE_DEVICES" != "NoDevFiles" ];
then
  echo $CUDA_VISIBLE_DEVICES > $GPUID_FILE
else
  while [ ! -f $GPUID_FILE ]; do sleep 1; done
  export CUDA_VISIBLE_DEVICES=$(cat $GPUID_FILE)
fi

echo "SLURM_JOB_NODELIST=$SLURM_JOB_NODELIST PMI_JOBID=$PMI_JOBID CUDA_VISIBLE_DEVICES=$CUDA_VISIBLE_DEVICES"

$@

# Handle completion
COMPLETION_FILE=completion_${SLURM_JOBID}.txt
echo "" >> $COMPLETION_FILE
