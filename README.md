# getdata-014-course-project
Course Project for Geting and Cleaning Data course by Coursera

This project has the following objectives:

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

 Create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

In order to run this data cleaning R script (namely run_analysis.R) the following needs to be done:

1. Create a directory called "data" in your working directory. 
2. Extract the data files for this project into this directory ("data")
3. Verify that the two files (./data/UCI HAR Dataset/train/X_train.txt and ./data/UCI HAR Dataset/train/X_test.txt) do exist.
4. run the script run_analysis.R 
5. run 'tidy_dataset <- read.table("./data/tidy_data.txt")' in the R console.
5. View or head on the output dataset 'tidy_dataset'. 
