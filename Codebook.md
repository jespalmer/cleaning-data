#  Code Book
This assignment is part of the [Getting and Cleaning Data Coursera Course] (https://www.coursera.org/learn/data-cleaning). The goal of this assignment was to prepare tidy data for later analysis.

GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.


This code book will describe the data used in this project, as well as the processing required to create the resulting tidy data set.

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip



Within this repo is a code book and one R script, "run_analysis.R", which does the following:

0. Loads necessary packages to run the script
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the dataset in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

In order to run the script, you must first download the [Human Activity Recognition Using Smartphones Data Set] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). Here are the steps to getting set up:

1. Download the [zip file] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) of the data set
2. Move the zip file to the appropriate directory
3. Un-zip the file
4. Move the "run_analysis.R" script to the same directory that you un-zipped the file, so it is in the root folder
5. You can now run the R script

Note: The output of "run_analysis.R" is a txt file called "tidy.txt". Also, running the script will automatically download the necessary packages reshape2 and data.table, if you do not have them installed alredy.

For more data analysis and information about the variables in the dataset read the code book.
