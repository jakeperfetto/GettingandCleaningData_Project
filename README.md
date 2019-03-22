# GettingandCleaningData_Project
Project for the getting and cleaning data course on coursera.com
The project description: 

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on 
a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set 
as described below, 2) a link to a Github repository with your script for performing the analysis, and 
3) a code book that describes the variables, the data, and any transformations or work that you 
performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with 
your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . 
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 
The data linked to from the course website represent data collected from the accelerometers from the 
Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for 
each activity and each subject.
Good luck!

This repository contains the files: README.md which explains the files of the repository and a summary of how the dataset
was created.
CodeBook.md which describes the variables, the data, and any transformations or work that I performed to clean up the data.
tidy_activity_means.txt which contains the tidy data set with the average for each variable grouped by subject and activity.
run_analysis.R which is the R script that contains the code for loading, merging, and tidying the datasets

The data for this project was sourced from the Human Activity using SmartPhones Data Set which is a part of the
UCI machine learning repository. The data is described on the website as: 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each 
person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The 
experiments have been video-recorded to label the data manually. The obtained dataset has been randomly 
partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 
30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled 
in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, 
which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body 
acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a 
filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating 
variables from the time and frequency domain.

How the dataset was created:
The txt files containing the test, subject, activities, and features were loaded into R.
The test and subject data were then merged and the means and standard deviations were extracted for every measurement.

The run_analysis.R script can be used to merge the two data sets (test and training), take just the mean
and standard deviation for each measurment, name the activities variables instead of a number 1-6 representing
the different activities, give the data set cleaner and more appropriate column/variable names, and write a new dataset 
where the mean of each variable (grouped by subject and activity) is displayed. 

The run_analysis.R and tidy_activity_means.txt were created with R version 3.3.2 (2016-10-31), on 
mac x86_64-apple-darwin13.4.0. You need to load the dplyr package (0.8.0.1) to implement this script.
