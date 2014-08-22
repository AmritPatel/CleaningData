CleaningData
============

Coursera: "Getting and Cleaning Data" Course Project

The script, "run_analysis.r" contained in this repo performs the following operations on the files contained [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip):

1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
3.  Uses descriptive activity names to name the activities in the data set.
4.  Appropriately labels the data set with descriptive variable names. 
5.  Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

Please review the __comments__ in "run_analysis.r" for a __detailed__ step-by-step guide to the various data manipulations performed. The final tidy dataset of interest is output to "tidy_summ.txt" in the directory where the script is run.
