# Coursera course: Getting and Cleaning Data
# Exercise: Peer Assessments /Getting and Cleaning Data Course Project
# Author: Tomasz Domanski

# You should create one R script called run_analysis.R that does the following. 
#  1 Merges the training and the test sets to create one data set.
#  2 Extracts only the measurements on the mean and standard deviation for each measuremen
#  3 Uses descriptive activity names to name the activities in the data set
#  4 Appropriately labels the data set with descriptive variable names. 
#  5 From the data set in step 4, creates a second, independent tidy data set with the 
#    average of each variable for each activity and each subject

# PATHS
input.data.dir <- "./UCI HAR Dataset"
output.file <- "tidy_data.csv"

# TRAINING
input.y.train.file <- paste(input.data.dir, "train", "y_train.txt", sep="/")
input.x.train.file <- paste(input.data.dir, "train", "X_train.txt", sep="/")
input.sub.train.file <- paste(input.data.dir, "train", "subject_train.txt", sep="/")

# TEST
input.y.test.file <- paste(input.data.dir, "test", "y_test.txt", sep="/")
input.x.test.file <- paste(input.data.dir, "test", "X_test.txt", sep="/")
input.sub.test.file <- paste(input.data.dir, "test", "subject_test.txt", sep="/")

# FEATURES
input.features.file <- paste(input.data.dir, "features.txt", sep="/")

# ACTIVITY
input.activity.file <- paste(input.data.dir, "activity_labels.txt", sep="/")

if (!file.exists(input.data.dir)) {
  stop(paste("I can not find the input data set. Please make sure that the directory",
             " exists, and your working directory is set accordingly.", sep=""))
}

# we check if all files exists
paths <- c(input.y.train.file, input.x.train.file, input.sub.train.file,
          input.y.test.file, input.x.test.file, input.sub.test.file,
          input.features.file)

for (path in paths) {
  if (!file.exists(path)) {
    stop(paste("Input file not found: ", path))
  }
}

# prepare TRAINING set
train.y   <- read.table(input.y.train.file, header=F)
train.x   <- read.table(input.x.train.file, header=F)
train.sub <- read.table(input.sub.train.file, header=F)

# prepare TEST set
test.y   <- read.table(input.y.test.file, header=F)
test.x   <- read.table(input.x.test.file, header=F)
test.sub <- read.table(input.sub.test.file, header=F)


# 1. merging TEST and TRAINING data

data.y   <- rbind(train.y, test.y)
data.x   <- rbind(train.x, test.x)
data.sub <- rbind(train.sub, test.sub)

# prepering proper names
names(data.sub) <- c("subject")
names(data.y)   <- c("activity")
names(data.x)   <- features[, 2]

# 2. only mean and std columns 

features <- read.table(input.features.file, header=F)

mean.std.cols <- grepl(".*-mean.*|.*std.*", features[,2])

# subject, activity, features[mean,std]
data.set <- cbind(data.sub, data.y, data.x[, mean.std.cols])

# 3. descriptive activity names
activity <- read.table(input.activity.file, header=F)

data.set$activity <- activity[data.set$activity, 2]

# 4. Appropriately labels the data 
names(data.set) <- gsub("\\()", "", gsub("-std", " Std", gsub("-mean", " Mean", names(data.set))))

tidy <- aggregate(. ~ activity + subject, data=data.set, mean)
write.table(tidy, "tidy_data.csv", sep=";")