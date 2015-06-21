#Data is already downloaded to the system
#Set The working directory to the directory of the data
setwd("D:\\study\\Coursera\\Data Science Specialization\\2. R Programming\\wd\\UCI HAR Dataset");

#Read Test and Train Data sets
test<-read.table(".\\test\\X_test.txt",header=F);
train<-read.table(".\\train\\X_train.txt",header=F);

#Merging the data set
merged<-rbind(test,train);

#Mean and standard deviation fields from features.txt file
mean_fields<-c(1,2,3,41,42,43,81,82,83,121,122,123,161,162,163,201,214,227,240,253,266,267,268,345,346,347,424,425,426,503,516,529,542);
std_fields<-c(4,5,6,44,45,46,84,85,86,124,125,126,164,165,166,202,215,228,241,254,269,270,271,348,349,350,427,428,429,504,517,530,543);

#Extract only the measurements on mean and standard deviation
extracted <- merged[,c(mean_fields,std_fields)];

#Appropriately labels the data set with descriptive variable names. 
features<-read.table("features.txt",header=F);
#Extracting the column names of extracted columns only
features<-features[c(mean_fields,std_fields),2];
colnames(extracted)<-features;

#Read and merge subject data
test_subjcts<-read.table(".\\test\\subject_test.txt",header=F);
train_subjcts<-read.table(".\\train\\subject_train.txt",header=F);
subjcts<-rbind(test_subjcts,train_subjcts);
colnames(subjcts)<-c("subject");

#Read and merge activity data
test_activity<-read.table(".\\test\\y_test.txt",header=F);
train_activity<-read.table(".\\train\\y_train.txt",header=F);
activity<-rbind(test_activity,train_activity);
colnames(activity)<-c("activity");

#Read activity lablels
labels<-read.table("activity_labels.txt",header=F);

#Uses descriptive activity names to name the activities in the data set
activity<-labels[activity$activity,2];

#Add subject and activity to the data set
extracted=cbind(subjcts,extracted);
extracted$activity=activity;

#Reorder the data for better readabality. Bringing the subject and activity together
extracted<-extracted[,c(1,68,2:27)];

#Split the data by subject and activity
splitted<-split(extracted,list(extracted$subject,extracted$activity));
