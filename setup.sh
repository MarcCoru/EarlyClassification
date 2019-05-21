#!/bin/bash

# python environment
conda create -n earlyclassification pip
conda activate earlyclassification
pip install -r requirements.txt

# for rpy r-bindings
sudo apt-get install r-base 
