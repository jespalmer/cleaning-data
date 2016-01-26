#  Code Book
This code book provides further information about the script run_analysis.R, the data sets it creates, and the data variables and summaries.

## Data used in this project

The data sets used in this project come from data collected from the accelerometers from the Samsung Galaxy S smartphone. More information about this study and its description can be found at the [UCI Machine Learning Repository website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The raw data can be downloaded [here] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

### Data set information from the UCI Machine Learning Repository website
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

For more information about this dataset contact: activityrecognition@smartlab.ws

For more information about the original code book for the dataset, please read the readme located in the zip file of the raw data, which contains a record of each original file and the original variable names used.

## Processing required to create and clean the final tidy data set
Within this repo is a code book and one R script, `run_analysis.R`. The R script completes the following:

0. Loads necessary packages to run the script
- If you do not have necessary packages, `reshape2` and `data.table`, installed the script will prompt you to download them.
1. Merges the training and the test sets to create one data set.
- To merge the data sets together, the script sets file paths based on the original file structure of the zip file. It is important not to move the original files in the zip folder, as the script is already looking for the files in the appropriate folder. It is also important that you are running the script in your working directory.
- Once all the data has been read and labeled the data is merged appropriately into one large dataset, called `final`
2. Extracts only the measurements on the mean and standard deviation for each measurement.
- The script next finds the right columns from the features dataset, by searching for the variable names that have either mean or std in their characters
- the script them takes those breaks the large dataset in two, separating the first two columns (which we don't want to edit) and the other rows 3:563 (which we do want to remove the unnecessary columns)
- then the script removes the unnecessary columns and merges the table back together
3. Uses descriptive activity names to name the activities in the data set
- Then the script reads the activities dataset, removes the symbols, and changes the capitalization of the factors before adding them into the data set
4. Appropriately labels the data set with descriptive variable names.
- The script makes a couple changes to the variables, to remove any symbols and make the variables more human readable
5. From the dataset in step 5, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
- Lastly the script uses the reshape2 library to condense the variables and make the large data set easier to read by giving back the column means for each variable for each subject for each different activity

## Variables

### Script variables
`features`: dataset for the feature labels
`activities`: dataset for the activity labels

`subject_train`: dataset for subject_train.txt
`x_train`: dataset for the X_test.txt
`y_train`: dataset for the y_train.txt
`subject_test`: dataset for subject_test.txt
`x_test`: dataset for X_test.txt
`y_test`: dataset for y_test.txt

`final`: first large merged data set of the previous 6 txt files
`merged`: second large merged data set of only the columns with std or mean in the variable name
`tidy`: last data set with that contains the column means for each variable for each subject for each activity for each variable

### Cleaned data set variables
#### Column names
- List of identifiers
"subjectID`: id of the tester
`activity`: the type of activity the tester made, as indicated by the activity label data set

- List of cleaned column name variables, whose means were calculated in the tidy data set. The names were cleaned from their original raw names by removing symbols and capitalizing the first letter of either "Std" or "Mean" to make the variables more human readable
`tBodyAccMeanX`
`tBodyAccMeanY`
`tBodyAccMeanZ`
`tBodyAccStdX`
`tBodyAccStdY`
`tBodyAccStdZ`
`tGravityAccMeanX`
`tGravityAccMeanY`
`tGravityAccMeanZ`
`tGravityAccStdX`
`tGravityAccStdY`
`tGravityAccStdZ`
`tBodyAccJerkMeanX`
`tBodyAccJerkMeanY`
`tBodyAccJerkMeanZ`
`tBodyAccJerkStdX`
`tBodyAccJerkStdY`
`tBodyAccJerkStdZ`
`tBodyGyroMeanX`
`tBodyGyroMeanY`
`tBodyGyroMeanZ`
`tBodyGyroStdX`
`tBodyGyroStdY`
`tBodyGyroStdZ`
`tBodyGyroJerkMeanX`
`tBodyGyroJerkMeanY`
`tBodyGyroJerkMeanZ`
`tBodyGyroJerkStdX`
`tBodyGyroJerkStdY`
`tBodyGyroJerkStdZ`
`tBodyAccMagMean`
`tBodyAccMagStd`
`tGravityAccMagMean`
`tGravityAccMagStd`
`tBodyAccJerkMagMean`
`tBodyAccJerkMagStd`
`tBodyGyroMagMean`
`tBodyGyroMagStd`
`tBodyGyroJerkMagMean`
`tBodyGyroJerkMagStd`
`fBodyAccMeanX`
`fBodyAccMeanY`
`fBodyAccMeanZ`
`fBodyAccStdX`
`fBodyAccStdY`
`fBodyAccStdZ`
`fBodyAccMeanFreqX`
`fBodyAccMeanFreqY`
`fBodyAccMeanFreqZ`
`fBodyAccJerkMeanX`
`fBodyAccJerkMeanY`
`fBodyAccJerkMeanZ`
`fBodyAccJerkStdX`
`fBodyAccJerkStdY`
`fBodyAccJerkStdZ`
`fBodyAccJerkMeanFreqX`
`fBodyAccJerkMeanFreqY`
`fBodyAccJerkMeanFreqZ`
`fBodyGyroMeanX`
`fBodyGyroMeanY`
`fBodyGyroMeanZ`
`fBodyGyroStdX`
`fBodyGyroStdY`
`fBodyGyroStdZ`
`fBodyGyroMeanFreqX`
`fBodyGyroMeanFreqY`
`fBodyGyroMeanFreqZ`
`fBodyAccMagMean`
`fBodyAccMagStd`
`fBodyAccMagMeanFreq`
`fBodyBodyAccJerkMagMean`
`fBodyBodyAccJerkMagStd`
`fBodyBodyAccJerkMagMeanFreq`
`fBodyBodyGyroMagMean`
`fBodyBodyGyroMagStd`
`fBodyBodyGyroMagMeanFreq`
`fBodyBodyGyroJerkMagMean`
`fBodyBodyGyroJerkMagStd`
`fBodyBodyGyroJerkMagMeanFreq"

## Final data tidy data set output
- `tidy.txt` : Final melted data set that contains the column means for each variable for each subject for each activity
