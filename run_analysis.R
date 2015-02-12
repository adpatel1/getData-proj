library(reshape2)
library(dplyr)

##Assumes that data is in "UCI HAR Dataset" in the directory
##Get names and those columns which are means or std
featurenames <- read.table("UCI HAR Dataset/features.txt")
featurenames <-featurenames[,2]
selectedcol <- grep("[Mm]ean|std",featurenames)

subjecttest<-read.table("UCI HAR Dataset/test/subject_test.txt")
subjecttest$Set<-rep(1,len=nrow(subjecttest))
subjecttrain<-read.table("UCI HAR Dataset/train/subject_train.txt")
subjecttrain$Set<-rep(2,len=nrow(subjecttrain))
subject <- rbind(subjecttest,subjecttrain)
names(subject)<-c("Subject","Set")
subject$Set<-factor(subject$Set,labels=c("test","train"))

##Read and merge X test and train
Xtest<-read.table("UCI HAR Dataset/test/X_test.txt")
Xtrain<-read.table("UCI HAR Dataset/train/X_train.txt")
Xmerged<-rbind(Xtest,Xtrain)
##Rename columns and select for desired features
names(Xmerged)<-featurenames
Xmerged<-Xmerged[,selectedcol]

##Read and merge y test and train
ytest<-read.table("UCI HAR Dataset/test/y_test.txt")
ytrain<-read.table("UCI HAR Dataset/train/y_train.txt")
ymerged<-rbind(ytest,ytrain)
##convert activity into factors with appropriate labels
names(ymerged)<-"Activity"
activitylabels<-read.table("UCI HAR Dataset/activity_labels.txt")
ymerged$Activity<-factor(ymerged$Activity,labels=activitylabels[,2])

##Merge subject, y and X data
mergedData <-cbind(subject,ymerged,Xmerged)

##Turn data into means of the variables by subject and activity
##Uses a wide format
wideFormAvgData<-melt(mergedData,id=c("Subject","Set","Activity")) %>% 
  dcast(Subject + Activity ~ variable,mean)
##Write to file
write.table(wideFormAvgData,file="tidyData.txt",row.names=FALSE)

