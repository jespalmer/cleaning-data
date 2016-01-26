#  Getting and Cleaning Data Course Project
This assignment is part of the [Getting and Cleaning Data Coursera Course] (https://www.coursera.org/learn/data-cleaning). The goal of this assignment was to prepare tidy data for later analysis.

Within this repo is a code book and one R script, "run_analysis.R", which does the following:

0. Loads necessary packages to run the script
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the dataset in step 5, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

In order to run the script, you must first download the [Human Activity Recognition Using Smartphones Data Set] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). Here are the steps to getting set up:

1. Download the [zip file] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) of the data set
2. Move the zip file to the appropriate directory
3. Un-zip the file
4. Move the "run_analysis.R" script to the same directory that you un-zipped the file, so your root folder looks like this:
```
  ├── UCI HAR Dataset
  │   ├── README.txt
  │   ├── activity_labels.txt
  │   ├── features.txt
  │   ├── features_info.txt
  │   ├── test
  │   └── train
  └── run_analysis.R
  ```
5. You can now run the R script in R: `source("run_analysis.R")`

Note: The output of "run_analysis.R" is a txt file called "tidy.txt". Also, running the script will automatically download the necessary packages reshape2 and data.table, if you do not have them installed alredy.

For more information about the variables in the dataset, please read the code book.
