#!/bin/bash

echo "1.- Obtain probabilities for training series:"
echo $(date)

cd /EarlyClassification/Code/Train.probabilities
Rscript posterior.probabilities.R

echo "2.- Obtain probabilities for testing series:"
echo $(date)

cd /EarlyClassification/Code/Test.probabilities
Rscript posterior.probabilities.R

echo "3.- Optimization: "
echo $(date)

cd /EarlyClassification/Code/Optimization/Others
Rscript optimization.simple.R

echo "4.- Prediction: "
echo $(date)

cd /EarlyClassification/Prediction/Others
Rscript prediction.R

echo "done..."
echo $(date)
