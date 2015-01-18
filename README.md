# Getting-and-Cleaning-Data-Assignment
Assignment submitted as part of Getting and Cleaning Data

I. Introduction

One of the most exciting areas in all of data science right now is wearable computing - see for example this article: http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/. 

Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

II. Setup data folder

Create a folder 'data' in the working directory of RStudio. Unzip the contents of the above zip file into this folder. Make sure you copy the contents of the folder 'UCI HAR Dataset' into the folder 'data'. 

III. Copy R package into working directory

Copy run_analysis.R into working directory. 

IV. Run the R package in RStudio

Run the following command in RStudio: 
    source("run_analysis.R")

This script does the following when executed:
    (a) Merges the training and the test sets to create one data set
    (b) Extracts only the measurements on the mean and standard deviation for each measurement
    (c) Uses descriptive activity names to name the activities in the data set
    (d) Appropriately labels the data set with descriptive variable names
    (e) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

V. Output files

The execution of the above R code generates the following files: 
    (a) step4_output.txt
        Output data set created after step (d) mentioned in section IV above.
    (b) output_data.txt
        Output data set created after step (e) mentioned in section IV above.

VI. Conclusion - Results of the assignment work
    (a) step4_output.txt contains cleaned data after merging.
    (b) output_data.txt contains the average of each variable for each activity and each subject.

