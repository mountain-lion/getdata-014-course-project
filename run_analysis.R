setwd("E:/mooc/Data Science/Getting and Cleaning Data/workspace")
dataset1 <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
dataset2 <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
names <- read.table("./data/UCI HAR Dataset/features.txt")

colnames(dataset1) <- names[,2]

colnames(dataset2) <- names[,2]

merged_df <- rbind(dataset1,dataset2)


activity_labels <- as.vector(names[,2])

slice_cols <- c()

#mean_cols_index <- grep(paste0(paste0("*","-mean()"),"*"),activity_labels,ignore.case=TRUE)
mean_cols <- grep(paste0("*","\\-mean\\(\\)"),activity_labels,ignore.case=TRUE, value=TRUE)
slice_cols <- c(slice_cols, mean_cols)
std_cols <- grep(paste0("*","\\-std\\(\\)"),activity_labels,ignore.case=TRUE, value=TRUE)
slice_cols <- c(slice_cols, std_cols)

format_column_names <- function(columns,type)
{
  col_names <- columns
  col_names <-gsub("Acc", " Activity ", col_names)
  
  col_names <-grep("Activity", col_names,value=TRUE)
  
  col_names <-gsub("fBody", "Frequency Domain Body", col_names)
  
  col_names <-gsub("tBody", "Time Domain Body", col_names)
  
  col_names <-gsub("tGravity", "Time Domain Gravity", col_names)
  
  if(type=="mean")
  {
    col_names<-gsub("-mean()", " Average", col_names)
  }
  
  if(type=="std")
  {
    col_names<-gsub("-std()", " Standard Deviation", col_names)
  }
  
  col_names <-gsub("[(]", "", col_names)
  
  col_names <-gsub("[)]", "", col_names)
  
  return (col_names)
}

mean_cols <- format_column_names(mean_cols, "mean")
std_cols <- format_column_names(std_cols, "std")

merged_slice <- merged_df[,slice_cols]

slice_cols <- format_column_names(slice_cols, "mean")
slice_cols <- format_column_names(slice_cols, "std")

colnames(merged_slice) <- slice_cols

mean_slice <- merged_slice[,mean_cols]

write.table(mean_slice, "./data/tidy_data.txt", sep="\t",row.name=FALSE) 
