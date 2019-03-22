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

## Reading in the activities data
activities <- read.table("activity_labels.txt")
colnames(activities) <- c("activity_id", "activity_type")

## Step 1: Merging the training and test datasets to make a single dataset
Activity_Data <- rbind(cbind(train_subjects, train_values, train_activity), 
                       cbind(test_subjects, test_values, test_activity)
                       )
## Assign column names using the features object
colnames(Activity_Data) <- c("subject", features[, 2], "activity")

## Step 2: Extracting only the measurements of mean and Standard Deviation 
## for each measurement

Extracted_columns <- grepl("subject|activity|mean|std", colnames(Activity_Data))
Activity_Data <- Activity_Data[, Extracted_columns]

## Step 3: Use descriptive activity names to name the activities in
## the dataset

## Switching out the number of 1-6 for the actual name of the activity
Activity_Data$activity <- factor(Activity_Data$activity, 
                          levels = activities[, 1], labels = activities[, 2])

## Step 4: Appropriately labels the data with descriptive variable names

# create an aobject containing the column names for Activity_Data
Activity_cols <- colnames(Activity_Data)

## remove characters such as // \\ or - 
Activity_cols <- gsub("[\\(\\)-]", "", Activity_cols)
Activity_cols

## Use full words instead of abbreviations and clean other parts up
Activity_cols <- gsub("^f", "FrequencyDomain", Activity_cols)
Activity_cols <- gsub("^t", "timeDomain", Activity_cols)
Activity_cols <- gsub("Acc", "Accelerometer", Activity_cols)
Activity_cols <- gsub("Gyro", "Gyroscope", Activity_cols)
Activity_cols <- gsub("Mag", "Magnitude", Activity_cols)
Activity_cols <- gsub("Freq", "Frequency", Activity_cols)
Activity_cols <- gsub("mean", "Mean", Activity_cols)
Activity_cols <- gsub("std", "StandardDeviation", Activity_cols)
Activity_cols <- gsub("BodyBody", "Body", Activity_cols)

## Make these new column names the actual column names
colnames(Activity_Data) <- Activity_cols

### Step 5: Create a second (separate), independent tidy dataset with
### the average of each variable for each activity and subject
library(dplyr)

activity_means <- Activity_Data %>%
        group_by(subject, activity) %>%
        summarise_each(funs = (mean))
head(activity_means)

## Write this new dataset into a text file
write.table(activity_means, "tidy_activity_means.txt", 
            row.names = FALSE, quote = FALSE
            )
