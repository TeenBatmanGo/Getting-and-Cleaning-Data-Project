if(!file.exists("./data")) dir.create("./data")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ",destfile="./data/project.zip")
unzip("./data/project.zip",exdir="./data")

#Merges the training and the test sets to create one data set
train<-read.table("./data/UCI HAR Dataset/train/X_train.txt")
trainlabel<-read.table("./data/UCI HAR Dataset/train/y_train.txt")
trainsub<-read.table("./data/UCI HAR Dataset/train/subject_train.txt")
traindata<-cbind(trainlabel,trainsub,train)
test<-read.table("./data/UCI HAR Dataset/test/X_test.txt")
testlabel<-read.table("./data/UCI HAR Dataset/test/y_test.txt")
testsub<-read.table("./data/UCI HAR Dataset/test/subject_test.txt")
testdata<-cbind(testlabel,testsub,test)
full<-rbind(traindata,testdata)

#Extracts only the measurements on the mean and standard deviation for each measurement. 
features<-read.table("./data/UCI HAR Dataset/features.txt")
colnames(full)<-c("labels","subjects",as.character(features$V2))
g<-grep(".mean\\(\\).|.std\\(\\).",colnames(full))
sub<-full[,c(1,2,g)]

#Uses descriptive activity names to name the activities in the data set
activity<-read.table("./data/UCI HAR Dataset/activity_labels.txt")
sub$labels<-factor(sub$labels,levels=activity$V1,labels=activity$V2)

#Appropriately labels the data set with descriptive variable names 
names(sub)<-gsub("\\()","",names(sub))
names(sub)<-gsub("^t","time",names(sub))
names(sub)<-gsub("^f","frequency",names(sub))
names(sub)<-gsub("-mean","Mean",names(sub))
names(sub)<-gsub("-std","Std",names(sub))

#From the data set in step 4, creates a second
#independent tidy data set with the average of each variable for each activity and each subject
newdata<-sub %>% group_by(labels,subjects) %>% summarise_each(funs(mean))
