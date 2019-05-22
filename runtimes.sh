samplesize=10

echo $PWD
mkdir -p $PWD/Results_$samplesize
echo copying $PWD/Databases/BavarianCrops_$samplesize.RData to $PWD/Databases/UCR-4.RData
cp $PWD/Databases/BavarianCrops_$samplesize.RData $PWD/Databases/UCR-4.RData
docker run -v $PWD/Databases:/EarlyClassification/Databases -v $PWD/Results_$samplesize:/EarlyClassification/Results ec bash run.sh > $PWD/Results_$samplesize/run.log
