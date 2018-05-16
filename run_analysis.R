# The code should have a file run_analysis.R in the main directory that can be run
# as long as the Samsung data is in your working directory. The output should be the 
# tidy data set you submitted for part 1. You should include a README.md in the repo 
# describing how the script works and the code book describing the variables.
# 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement.
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names.
# From the data set in step 4, creates a second, independent tidy data set with the average 
# of each variable for each activity and each subject.

# Assumes that the working directory is the UCI HAR Dataset
# Load the tidyverse packages
library(tidyverse)

# Read in all the files
X_test <- read_table("test/X_test.txt", col_names = FALSE)
y_test <- read_table("test/y_test.txt", col_names = FALSE)
X_train <- read_table("train/X_train.txt", col_names = FALSE)
y_train <- read_table("train/y_train.txt", col_names = FALSE)
feature_names <- read_table("features.txt", col_names = FALSE)
activity_labels <- read_table("activity_labels.txt", col_names = FALSE)

# Assemble X_test and X_train
X <- bind_rows(X_test, X_train)

# Apply the feature names to the X data frame
names(X) <- feature_names$X1
