**Getting and Cleaning Data Course Project**

This document serves as an explanation for the code provided in run_analysis.R, submitted for the Coursera Getting and Cleaning Data Course Project. This project deals with cleaning up a dataset from the UCI Machine Learning Repository. These data were collected from Samsung Galaxy S smartphone accelerometers, and measure mean and standard deviation of acceleration on smartphones during 6 different activities. Full dataset here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The file run_analysis loads datasets provided, merges them, organizes them, and cleans them up. The directions were as follows:

You should create one R script called run_analysis.R that does the following. 
-Merges the training and the test sets to create one data set.
-Extracts only the measurements on the mean and standard deviation for each measurement. 
-Uses descriptive activity names to name the activities in the data set
-Appropriately labels the data set with descriptive variable names. 
-From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

**Running the Script**

To run this script, you first need to set your working directory to the UCI data.
-for example, ```setwd("C:/Users/Owner/R_class/data_courseproj")```
Then, run the R script.
The script will take the data, merge datasets, clean them up, and return one table called tidy_data.txt to your working directory. This file is an average of mean and standard deviation of all measurements grouped by subject ID and activity.

**Explanation of Script**

1) Merging testing and training data.
-These data were broken into testing and training data, and this part of the script simply merges these using the ```rbind``` command.
2) Extract measurements on mean and standard deviation.
-This section of the script extracts all measurements containing mean or std in the title from a list of variables. Then, all of these variables are selected from the main dataset.
3) Use activity names to name activities in dataset.
-This section of code reads the activities table and transforms the numbers 1-6 in the activies dataset into descriptive text
4) Label the dataset with variable names
-This section of code adds subject number to the dataset and merges all datasets to create one final tidy dataset
5) Create a second dataset with averages of all measurements according to subject and activity.
-This section of code uses the package ```dplyr``` to average measurements for each subject and activity.
