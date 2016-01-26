#STEP 0: load required packages
if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("reshape2")) {
  install.packages("reshape2")
}

require("data.table")
require("reshape2")

#STEP 1: merge training and data sets to create one data set

#set the working directory
WD <- getwd()
if (!is.null(WD)) setwd(WD)

#set the file paths to read the correct txt files for the features file
file_path_features <- "UCI HAR Dataset"
list_files_features <- list.files(file_path_features, full.names=TRUE, pattern=".txt")
features <- read.table(list_files_features[3])[,2]

#set the file paths to read the correct txt files for the train folder
file_path_train <- "UCI HAR Dataset/train"
list_files_train <- list.files(file_path_train, full.names=TRUE, pattern=".txt")

#as we are pulling each file, label the columns appropriately
subject_train <- read.table(list_files_train[1])
names(subject_train) <- "subjectID"
x_train <- read.table(list_files_train[2])
names(x_train) <- features
y_train <- read.table(list_files_train[3])
names(y_train) <- "activity"

#set the file paths to read the correct txt files for the test folder
file_path_test <- "UCI HAR Dataset/test"
list_files_test <- list.files(file_path_test, full.names=TRUE, pattern=".txt")

#as we are pulling each file, label the columns appropriately
subject_test <- read.table(list_files_test[1])
names(subject_test) <- "subjectID"
x_test <- read.table(list_files_test[2])
names(x_test) <- features
y_test <- read.table(list_files_test[3])
names(y_test) <- "activity"

#bind the data together
train <- cbind(subject_train, y_train, x_train)
test <- cbind(subject_test, y_test, x_test)

final <- rbind(train, test)

#STEP 2: extracts only the measurements on the main and std for each measurement

#find the right columns from the features file
good_features <- grep("mean|std", features)

#make sure to save the first two columns: subjectID and activity
first <- final[, 1:2]

#separate out the last columns
second <- final[, 3:563]

#remove the columns we do not need
good_columns <- second[, good_features]

#bind the good columns back to the first two columns
merged <- cbind(first, good_columns)

#STEP 3: uses descriptive activity names to name the activities in the data sets
file_path_activities <- "UCI HAR Dataset"
list_files_activities <- list.files(file_path_activities, full.names=TRUE, pattern=".txt")
activities <- read.table(list_files_activities[1])[,2]

#remove extraneous symbols for easier reading
activities <- tolower(gsub("_"," ", activities))

#change from numeric to factors for human readable data
merged$activity <- factor(merged$activity, labels=activities)

#STEP 4: appropriately label the data set with desciptive variable names

#remove extraneous symbols
names(merged) <- gsub( "[-]", "", names(merged))
names(merged) <- gsub( "[()]", "", names(merged))

#change mean\std to first letter Caps, for easier reading
names(merged) <- sub("mean", "Mean", names(merged))
names(merged) <- sub("std", "Std", names(merged))

#STEP 5: from the data set in step 4, creates a second
#independent tidy data set with the average of each variable
#for each activity and each subject

# create the new melted data frame and get the means for each column
melt_data <- melt(merged, id=c("subjectID","activity"))
tidy <- dcast(melt_data, subjectID + activity ~ variable, mean)

# export the data as txt
write.table(tidy, "tidy.txt", row.name=FALSE)
