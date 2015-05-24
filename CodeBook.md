#Code Description
This section of Code Book describes the logical flow of the run_analysis.R script.

This script assumes that the data files for the project https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip has already been extracted into the working directory ./data folder. # i.e. "./data/UCI HAR Dataset" is already present after the extraction of the .zip data file for the project.

**Step 1 of 5: Merges the training and the test sets to create one data set.**

    dataset1 <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
    dataset2 <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
    names <- read.table("./data/UCI HAR Dataset/features.txt")
    colnames(dataset1) <- names[,2]
    colnames(dataset2) <- names[,2]
    merged_df <- rbind(dataset1,dataset2)

**End of Step 1 of 5**

**Step 2 of 5: Extracts only the measurements on the mean and standard deviation for each measurement.** 

    activity_labels <- as.vector(names[,2])
    slice_cols <- c()
    mean_cols_index <- grep(paste0(paste0("*","mean()"),"*"),activity_labels,ignore.case=TRUE)
    mean_cols <- grep(paste0("*","\\-mean\\(\\)"),activity_labels,ignore.case=TRUE, value=TRUE)
    slice_cols <- c(slice_cols, mean_cols)
    std_cols <- grep(paste0("*","\\-std\\(\\)"),activity_labels,ignore.case=TRUE, value=TRUE)
    slice_cols <- c(slice_cols, std_cols)

**End of Step 2 of 5**

**Step 3 of 5: Uses descriptive activity names to name the activities in the data set**

    format_column_names <- function(columns,type)
    {
     *#this function formats the column names to data file specific descriptive column names*
      return (col_names)
    }
    
    mean_cols <- format_column_names(mean_cols, "mean")
    std_cols <- format_column_names(std_cols, "std")

**End of Step 3 of 5**

**Step 4 of 5: Appropriately labels the data set with descriptive variable names.**

    merged_slice <- merged_df[,slice_cols]
    slice_cols <- format_column_names(slice_cols, "mean")
    slice_cols <- format_column_names(slice_cols, "std")
    colnames(merged_slice) <- slice_cols

**End of Step 4 of 5**

**Step 5 of 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.**

    mean_slice <- merged_slice[,mean_cols]

**End of Step 5 of 5**

Finally the following command creates the required tidy data file as in ./data directory as tidy_data.txt.

    write.table(mean_slice, "./data/tidy_data.txt", sep="\t",row.name=FALSE)

# Data Description 
Description of the source data files as seen from the README.txt file inside the data folder is as given below:






 