# Getting and Cleaning Data

## Course Project

This is solution for te course project in Coursera course "Getting and Cleaning Data".
Detailed description about this exercise can be found at Coursera's page. This package 
should contain three files

 * README.md - this file containing short description and steps needed to run the code
 * CodeBook.md - with detailed description for original and resulting dataset
 * run_analysis.R - file with actual R script that will transform original data into cleaned data set

## How to run the code

To run this code you will need to:
 * create some directory,
 * put run_analysis.R in this new directory,
 * download and extract the original dataset from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 * run ```run_analysis.R``` script in the path where the file is stored
 
Notice, your directory should look like:

```
  ..
  run_analysis.R
  UCI HAR Dataset
```

Of course you can run this script from other directories but just make sure, that 
you have set the working directory to reflect your script's location. For example:

```
setwd("/home/user/data/cleaning_data")
```

As a result of running ```run_analysis.R``` , new file should be created ```tidy_data``` 
 
## Dependencies
This code is using 'data.table' package, so make sure to install it before you run the script.
