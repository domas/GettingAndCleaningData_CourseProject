# Coursera course: Getting and Cleaning Data
# Exercise: Peer Assessments /Getting and Cleaning Data Course Project
# Author: Tomasz Domanski

# You should create one R script called run_analysis.R that does the following. 
#  * Merges the training and the test sets to create one data set.
#  * Extracts only the measurements on the mean and standard deviation for each measuremen
#  * Uses descriptive activity names to name the activities in the data set
#  * Appropriately labels the data set with descriptive variable names. 
#  * From the data set in step 4, creates a second, independent tidy data set with the 
#    average of each variable for each activity and each subject

kDataDir <- "UCI HAR Dataset"
if (!file.exists(kDataDir)) {
  stop(paste("I can not find the input data set. Please make sure that the directory",
             " exists, and your working directory is set accordingly.", sep=""))
}
