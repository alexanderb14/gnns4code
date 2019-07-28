import argparse
import json
import os
import pickle
import random
import shutil
import sys
import time

import numpy as np
import tensorflow as tf

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
sys.path.append(SCRIPT_DIR + '/..')

import utils
import applications.utils as app_utils
import applications.clang_code.codegraph_models as clang_codegraph_models
from model.cell.DeepGMGCell import DeepGMGCell, DeepGMGCellState
from model.layer.GGNNModelLayer import GGNNModelLayer, GGNNModelLayerState

class PredictionModel(object):
    def __init__(self, config, state):
        self.config = config
        self.state = state