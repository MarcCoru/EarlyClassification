docker build -t ec .

for samplesize in 10 50 100 250 500 750 1000 2500 5000 7500 10000;
do

echo $(date) $PWD
mkdir -p $PWD/Results_$samplesize
echo copying $PWD/Databases/BavarianCrops_$samplesize.RData to $PWD/Databases/UCR-4.RData
cp $PWD/Databases/BavarianCrops_$samplesize.RData $PWD/Databases/UCR-4.RData
docker run -v $PWD/Databases:/EarlyClassification/Databases -v $PWD/Results_$samplesize:/EarlyClassification/Results ec bash run.sh

done
