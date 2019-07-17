DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

mkdir -p $DIR/Results/FinalResults/Others/NoReg
mkdir -p $DIR/Results/FinalResults/SR1-CF1
mkdir -p $DIR/Results/Probabilities/Test/Formatted
mkdir -p $DIR/Results/Probabilities/Test/Raw
mkdir -p $DIR/Results/Probabilities/Train/Formatted
mkdir -p $DIR/Results/Probabilities/Train/Raw
mkdir -p $DIR/Results/Rules/Others/NoReg
mkdir -p $DIR/Results/Rules/SR1-CF1

#!/bin/bash
echo "$(date) 1.- Obtain probabilities for training series:" > /EarlyClassification/Results/run.log

cd /EarlyClassification/Code/Train.probabilities
Rscript posterior.probabilities.R > /EarlyClassification/Results/run.out.log

echo "$(date) 2.- Obtain probabilities for testing series:" >> /EarlyClassification/Results/run.log

cd /EarlyClassification/Code/Test.probabilities
Rscript posterior.probabilities.R  >> /EarlyClassification/Results/run.out.log

echo "$(date) 3.- Optimization: "  >> /EarlyClassification/Results/run.log

cd /EarlyClassification/Code/Optimization/Others
Rscript optimization.simple.R  >> /EarlyClassification/Results/run.out.log

echo "$(date) 4.- Prediction: " >> /EarlyClassification/Results/run.log

cd /EarlyClassification/Prediction/Others
Rscript prediction.R >> /EarlyClassification/Results/run.out.log

echo "$(date) done..."
