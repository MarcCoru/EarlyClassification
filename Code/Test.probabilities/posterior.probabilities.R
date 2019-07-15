#This script calculates the posterior probabilities of the second
#half of the training set given the SVM-s trained with the first half of the 
#series

#Parameters
numbd<-4
#Load sources
source("sources.R")

for(earlynessperc in c(1:20)*5){


#Load data
load(paste("../../Databases/UCR-",numbd,".RData",sep=""))

data <- database[[1]]
classes <- as.factor(database[[2]])
tt <- database[[3]]

train <- data[tt==0,,]
classestrain <- classes[tt==0]  

test <- data[tt==1,,]
classestest <- classes[tt==1]

distance<-1
param<-0
kernel<-1

thetaestimate<-FALSE
#Calculate earlyness
earlyness<-round(earlynessperc*dim(train)[2]/100)

#Train SVM model
predicted<-trainmodel(train,classestrain,test,classestest,kernel=1, earlyness, distance, param, thetaestimate)
predicted<-as.data.frame(predicted)
predicted$class<-classestest


#Save values
fichero<-paste("../../Results/Probabilities/Test/Raw/probs-",numbd,"-",earlynessperc,".txt",sep="")
write.table(predicted,fichero)

}

source("formatting.probabilitiestest.R")

