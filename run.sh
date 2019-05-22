#!/bin/bash
echo "$(date) 1.- Obtain probabilities for training series:"

cd /EarlyClassification/Code/Train.probabilities
Rscript posterior.probabilities.R

echo "$(date) 2.- Obtain probabilities for testing series:"

cd /EarlyClassification/Code/Test.probabilities
Rscript posterior.probabilities.R

echo "$(date) 3.- Optimization: "

cd /EarlyClassification/Code/Optimization/Others
Rscript optimization.simple.R

echo "$(date) 4.- Prediction: "

cd /EarlyClassification/Prediction/Others
Rscript prediction.R

echo "$(date) done..."
