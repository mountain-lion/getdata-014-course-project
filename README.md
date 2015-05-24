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
5. run 'tidy_dataset <- read.table("./data/tidy_data.txt", header=TRUE)' in the R console.
5. View or head on the output dataset 'tidy_dataset'. 

## run_analysis.R Code Description

This section of Code Book describes the logical flow of the run_analysis.R script. 

### Note: The details given in this section is also available in CodeBook.md and has been replicated verbatim herein for self-sufficiency of the README.md

This script assumes that the data files for the project https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip has already been extracted into the working directory ./data folder. # i.e. "./data/UCI HAR Dataset" is already present after the extraction of the .zip data file for the project.

###Step 1 of 5: Merges the training and the test sets to create one data set.

```{r}
dataset1 <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
dataset2 <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
names <- read.table("./data/UCI HAR Dataset/features.txt")
colnames(dataset1) <- names[,2]
colnames(dataset2) <- names[,2]
merged_df <- rbind(dataset1,dataset2)
```
###Step 2 of 5: Extracts only the measurements on the mean and standard deviation for each measurement.

```{r}
activity_labels <- as.vector(names[,2])
slice_cols <- c()
mean_cols_index <- grep(paste0(paste0("*","mean()"),"*"),activity_labels,ignore.case=TRUE)
mean_cols <- grep(paste0("*","\\-mean\\(\\)"),activity_labels,ignore.case=TRUE, value=TRUE)
slice_cols <- c(slice_cols, mean_cols)
std_cols <- grep(paste0("*","\\-std\\(\\)"),activity_labels,ignore.case=TRUE, value=TRUE)
slice_cols <- c(slice_cols, std_cols)
```

###Step 3 of 5: Uses descriptive activity names to name the activities in the data set

```{r}
format_column_names <- function(columns,type)
{
 *#this function formats the column names to data file specific descriptive column names*
  return (col_names)
}

mean_cols <- format_column_names(mean_cols, "mean")
std_cols <- format_column_names(std_cols, "std")
```

###Step 4 of 5: Appropriately labels the data set with descriptive variable names.
```{r}
merged_slice <- merged_df[,slice_cols]
slice_cols <- format_column_names(slice_cols, "mean")
slice_cols <- format_column_names(slice_cols, "std")
colnames(merged_slice) <- slice_cols
activity_slice <- merged_slice[,grep("Activity", slice_cols,value=TRUE)]
```

###Step 5 of 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
```{r}
mean_activity_slice <- merged_slice[,grep("Activity", mean_cols,value=TRUE)]
```

###Finally the following command creates the required tidy data file as in ./data directory as tidy_data.txt.
