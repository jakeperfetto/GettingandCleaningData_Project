### This run_analysis.R script will load the activity data from the zip file,
### mearge the datasets, and appropriately tidy the data

## since the data sets are located in the project folder, I need to make sure I
## set my working directory to reflect this

## for the train data
setwd("~/Desktop/coursera/GettingandCleaningData_Project/UCI HAR Dataset/train")
getwd() ## check the wd is set up correctly 

## Reading in the training data
train_subjects <- read.table("subject_train.txt")
train_values <- read.table("X_train.txt")
train_activity <- read.table("y_train.txt")

## setting the wd for the test data
setwd("~/Desktop/coursera/GettingandCleaningData_Project/UCI HAR Dataset/test")

## Reading in the test data
test_subjects <- read.table("subject_test.txt") 
test_values <- read.table("X_test.txt")
test_activity <- read.table("y_test.txt")

## setting the wd for the features data
setwd("~/Desktop/coursera/GettingandCleaningData_Project/UCI HAR Dataset")

## Reading in the features data
features <- read.table("features.txt", as.is = TRUE)

## Step numberMerging the training and test datasets to make a single dataset
Activity_Data <- rbind(cbind(train_subjects, train_values, train_activity), 
                       cbind(test_subjects, test_values, test_activity)
                       )
## Assign column names using the features object
colnames(Activity_Data) <- c("subject", features[, 2], "activity")
