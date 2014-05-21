# COLLECT, WORK AND CLEAN A DATASET

# Clear global environment and load libraries
rm(list = ls())
library(reshape2)

# Read all useful separate data:

# a) Data
train <- read.table("train/X_train.txt")
test <- read.table("test/X_test.txt")

# b) Activities
activity_train <- read.table("train/y_train.txt")
activity_test <- read.table("test/y_test.txt")

# c) Subjects
subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")

# d) Features and Activities Labels
features <- read.table("features.txt")
activities <- read.table("activity_labels.txt")

# Keep mean/std data
features_eff <- features[(grep("mean\\(\\)|std\\(\\)",features$V2)),]
rownames(features_eff) <- NULL

# Clean variables (features) names
index_feat <- as.numeric(features_eff$V1)
names_feat <- as.character(features_eff$V2)

names_feat <- sub("-mean\\(\\)-{0,1}","Mean",names_feat)
names_feat <- sub("-std\\(\\)-{0,1}","Std",names_feat)
names_feat <- sub("^t","Time",names_feat)
names_feat <- sub("^f","Freq",names_feat)
names_feat <- sub("BodyBody","Body",names_feat)

# Merge data and features
train_data <- cbind(subject_train,activity_train,train[,index_feat])
test_data <- cbind(subject_test,activity_test,test[,index_feat])
overall_data <- rbind(train_data,test_data)
colnames(overall_data) <- c("Subject","Activity",names_feat)

# Order dataset by "Subject" and "Activity"
overall_data <- overall_data[with(overall_data,order(Subject,Activity)),]
overall_data <- within(overall_data,Activity <- factor(Activity, labels = c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")))
rownames(overall_data) <- NULL

# Create a new tidy dataset about features means
overall_mean_data <- aggregate(.~Activity+Subject,data=overall_data,FUN=mean)
overall_mean_data <- overall_mean_data[,c(2,1,3:ncol(overall_mean_data))]

# Create a molten version
overall_mean_data2 <- melt(overall_mean_data,id.var=1:2)
colnames(overall_mean_data2) = c("Subject","Activity","Feature","Mean")

# Save tidy datasets in a tab delimitated file
write.table(overall_mean_data,file="Overall_Mean_Data.txt",sep="\t")
write.table(overall_mean_data2,file="Overall_Mean_Data2.txt",sep="\t")

