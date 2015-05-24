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


**Step 2 of 5: Extracts only the measurements on the mean and standard deviation for each measurement.** 

    activity_labels <- as.vector(names[,2])
    slice_cols <- c()
    mean_cols_index <- grep(paste0(paste0("*","mean()"),"*"),activity_labels,ignore.case=TRUE)
    mean_cols <- grep(paste0("*","\\-mean\\(\\)"),activity_labels,ignore.case=TRUE, value=TRUE)
    slice_cols <- c(slice_cols, mean_cols)
    std_cols <- grep(paste0("*","\\-std\\(\\)"),activity_labels,ignore.case=TRUE, value=TRUE)
    slice_cols <- c(slice_cols, std_cols)


**Step 3 of 5: Uses descriptive activity names to name the activities in the data set**

    format_column_names <- function(columns,type)
    {
     *#this function formats the column names to data file specific descriptive column names*
      return (col_names)
    }
    
    mean_cols <- format_column_names(mean_cols, "mean")
    std_cols <- format_column_names(std_cols, "std")


**Step 4 of 5: Appropriately labels the data set with descriptive variable names.**

    merged_slice <- merged_df[,slice_cols]
    slice_cols <- format_column_names(slice_cols, "mean")
    slice_cols <- format_column_names(slice_cols, "std")
    colnames(merged_slice) <- slice_cols
    activity_slice <- merged_slice[,grep("Activity", slice_cols,value=TRUE)]


**Step 5 of 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.**

    mean_activity_slice <- merged_slice[,grep("Activity", mean_cols,value=TRUE)]
    

Finally the following command creates the required tidy data file as in ./data directory as tidy_data.txt.

    write.table(mean_slice, "./data/tidy_data.txt", sep="\t",row.name=FALSE)

# Data Description

Description of the source data files as seen from the README.txt file inside the data folder is as given below:


###Human Activity Recognition Using Smartphones Dataset
###Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws



The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

###For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

###The dataset includes the following files:
- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

### Notes: 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

### License:

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

**Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.**


## List of Variables in tidy dataset (Step 5)

 [1] "Time Domain Body Activity  Average-X"              
 [2] "Time Domain Body Activity  Average-Y"              
 [3] "Time Domain Body Activity  Average-Z"              
 [4] "Time Domain Gravity Activity  Average-X"           
 [5] "Time Domain Gravity Activity  Average-Y"           
 [6] "Time Domain Gravity Activity  Average-Z"           
 [7] "Time Domain Body Activity Jerk Average-X"          
 [8] "Time Domain Body Activity Jerk Average-Y"          
 [9] "Time Domain Body Activity Jerk Average-Z"          
[10] "Time Domain Body Activity Mag Average"             
[11] "Time Domain Gravity Activity Mag Average"          
[12] "Time Domain Body Activity JerkMag Average"         
[13] "Frequency Domain Body Activity  Average-X"         
[14] "Frequency Domain Body Activity  Average-Y"         
[15] "Frequency Domain Body Activity  Average-Z"         
[16] "Frequency Domain Body Activity Jerk Average-X"     
[17] "Frequency Domain Body Activity Jerk Average-Y"     
[18] "Frequency Domain Body Activity Jerk Average-Z"     
[19] "Frequency Domain Body Activity Mag Average"        
[20] "Frequency Domain BodyBody Activity JerkMag Average"

## List of variables in the merged dataset for mean and statdard deviations (Step 3 and 4)
 [1] "Time Domain Body Activity  Average-X"                         
 [2] "Time Domain Body Activity  Average-Y"                         
 [3] "Time Domain Body Activity  Average-Z"                         
 [4] "Time Domain Gravity Activity  Average-X"                      
 [5] "Time Domain Gravity Activity  Average-Y"                      
 [6] "Time Domain Gravity Activity  Average-Z"                      
 [7] "Time Domain Body Activity Jerk Average-X"                     
 [8] "Time Domain Body Activity Jerk Average-Y"                     
 [9] "Time Domain Body Activity Jerk Average-Z"                     
[10] "Time Domain BodyGyro Average-X"                               
[11] "Time Domain BodyGyro Average-Y"                               
[12] "Time Domain BodyGyro Average-Z"                               
[13] "Time Domain BodyGyroJerk Average-X"                           
[14] "Time Domain BodyGyroJerk Average-Y"                           
[15] "Time Domain BodyGyroJerk Average-Z"                           
[16] "Time Domain Body Activity Mag Average"                        
[17] "Time Domain Gravity Activity Mag Average"                     
[18] "Time Domain Body Activity JerkMag Average"                    
[19] "Time Domain BodyGyroMag Average"                              
[20] "Time Domain BodyGyroJerkMag Average"                          
[21] "Frequency Domain Body Activity  Average-X"                    
[22] "Frequency Domain Body Activity  Average-Y"                    
[23] "Frequency Domain Body Activity  Average-Z"                    
[24] "Frequency Domain Body Activity Jerk Average-X"                
[25] "Frequency Domain Body Activity Jerk Average-Y"                
[26] "Frequency Domain Body Activity Jerk Average-Z"                
[27] "Frequency Domain BodyGyro Average-X"                          
[28] "Frequency Domain BodyGyro Average-Y"                          
[29] "Frequency Domain BodyGyro Average-Z"                          
[30] "Frequency Domain Body Activity Mag Average"                   
[31] "Frequency Domain BodyBody Activity JerkMag Average"           
[32] "Frequency Domain BodyBodyGyroMag Average"                     
[33] "Frequency Domain BodyBodyGyroJerkMag Average"                 
[34] "Time Domain Body Activity  Standard Deviation-X"              
[35] "Time Domain Body Activity  Standard Deviation-Y"              
[36] "Time Domain Body Activity  Standard Deviation-Z"              
[37] "Time Domain Gravity Activity  Standard Deviation-X"           
[38] "Time Domain Gravity Activity  Standard Deviation-Y"           
[39] "Time Domain Gravity Activity  Standard Deviation-Z"           
[40] "Time Domain Body Activity Jerk Standard Deviation-X"          
[41] "Time Domain Body Activity Jerk Standard Deviation-Y"          
[42] "Time Domain Body Activity Jerk Standard Deviation-Z"          
[43] "Time Domain BodyGyro Standard Deviation-X"                    
[44] "Time Domain BodyGyro Standard Deviation-Y"                    
[45] "Time Domain BodyGyro Standard Deviation-Z"                    
[46] "Time Domain BodyGyroJerk Standard Deviation-X"                
[47] "Time Domain BodyGyroJerk Standard Deviation-Y"                
[48] "Time Domain BodyGyroJerk Standard Deviation-Z"                
[49] "Time Domain Body Activity Mag Standard Deviation"             
[50] "Time Domain Gravity Activity Mag Standard Deviation"          
[51] "Time Domain Body Activity JerkMag Standard Deviation"         
[52] "Time Domain BodyGyroMag Standard Deviation"                   
[53] "Time Domain BodyGyroJerkMag Standard Deviation"               
[54] "Frequency Domain Body Activity  Standard Deviation-X"         
[55] "Frequency Domain Body Activity  Standard Deviation-Y"         
[56] "Frequency Domain Body Activity  Standard Deviation-Z"         
[57] "Frequency Domain Body Activity Jerk Standard Deviation-X"     
[58] "Frequency Domain Body Activity Jerk Standard Deviation-Y"     
[59] "Frequency Domain Body Activity Jerk Standard Deviation-Z"     
[60] "Frequency Domain BodyGyro Standard Deviation-X"               
[61] "Frequency Domain BodyGyro Standard Deviation-Y"               
[62] "Frequency Domain BodyGyro Standard Deviation-Z"               
[63] "Frequency Domain Body Activity Mag Standard Deviation"        
[64] "Frequency Domain BodyBody Activity JerkMag Standard Deviation"
[65] "Frequency Domain BodyBodyGyroMag Standard Deviation"          
[66] "Frequency Domain BodyBodyGyroJerkMag Standard Deviation" 

## Feature Selection Note
### Feature Selection 


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals **(prefix 't' to denote time)** were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. **(Note the 'f' to indicate frequency domain signals)**. 



 
