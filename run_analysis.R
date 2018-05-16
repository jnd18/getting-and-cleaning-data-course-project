# Assumes that the working directory is the UCI HAR Dataset
# Load the tidyverse packages
library(tidyverse)

# Read in all the files
# read_table2 can account for variable line lengths and is needed when
# reading in features.txt in order to get a two column data frame
X_test <- read_table("test/X_test.txt", col_names = FALSE)
y_test <- read_table("test/y_test.txt", col_names = FALSE)
subject_test <- read_table("test/subject_test.txt", col_names = FALSE)
X_train <- read_table("train/X_train.txt", col_names = FALSE)
y_train <- read_table("train/y_train.txt", col_names = FALSE)
subject_train <- read_table("train/subject_train.txt", col_names = FALSE)
feature_names <- read_table2("features.txt", col_names = FALSE)
activity_labels <- read_table("activity_labels.txt", col_names = FALSE)

# Convert feature_names and activity_levels to character vectors
# (from data frames) by pulling out the second column
# This discards the leading numbers
feature_names <- feature_names[[2]]
activity_labels <- activity_labels[[2]]

# Assemble X_test and X_train
X <- bind_rows(X_test, X_train)

# Apply the feature names to the X data frame
names(X) <- feature_names

# Assemble y_test and y_train
y <- bind_rows(y_test, y_train)

# Change the variable name to "activity"
names(y) <- "activity"

# Use the activity labels to convert activity to a factor
# with meaningful names
y <- y %>% mutate(activity = factor(activity_labels[activity],
                                    levels = activity_labels))

# Assemble subject_test and subject_train
subject <- bind_rows(subject_test, subject_train)

# Change the variable name to "subject"
names(subject) <- "subject"

# Assemble X, y, and subject into one large data frame
data <- bind_cols(subject, y, X)

# Remove all the intermediate variables that are no longer needed
remove(X_test, y_test, subject_test,
       X_train, y_train, subject_train,
       feature_names, activity_labels,
       X, y, subject)

# Keep only the variables measuring mean and standard deviation
# as well as the subject and activity variables
# Then sort by subject and activity
data <- data %>%
    select(matches("subject|activity|mean\\(\\)|std\\(\\)")) %>%
    arrange(subject, activity)

# Create the second dataset of averages for each each variable
# for each activity and each subject
average_data <- data %>%
    group_by(subject, activity) %>%
    summarize_all(mean)
