# Getting and Cleaning Data Course Project

## Introduction
This repo hosts my work for the final project of the Getting and Cleaning Data course on Coursera.  

There are 5 main files:
- README.md: This readme file.
- run_analysis.R: The R script used to process the data.
- data.txt: The main processed dataset.
- average_data.txt: A second dataset produced by averaging the values of every variable for each subject-activity combination.
- code_book.txt: A text file describing the variables in each dataset.

## Source Data

The original data can be downloaded at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Below is a description of the original data:
>==================================================================  
Human Activity Recognition Using Smartphones Dataset  
Version 1.0  
==================================================================  
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.  
Smartlab - Non Linear Complex Systems Laboratory  
DITEN - Università degli Studi di Genova.  
Via Opera Pia 11A, I-16145, Genoa, Italy.  
activityrecognition@smartlab.ws  
www.smartlab.ws  
==================================================================  

>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.  

Node that code_book.txt provides the necessary information from features_info.txt.

## Summary of Analysis
The original data source had the accelerometer and gyroscope measurements separate from the labels describing the activities, and each of those were in turn separate from the subject identifiers. Furthermore, as mentioned above, the data were split into a training set and a test set. My analysis combines all six parts of the data into one large dataset containing the subject id, the activity label, and the measurements. The numerical activity labels are replaced with the provided text descriptions; i.e. 5 is replaced by 'STANDING'. The measurements are given the descriptive names provided by features.txt. Then only the columns recording the mean or standard deviation of a set of measurements are kept (in addition to the subject and activity columns, of course). Finally, the data is sorted by subject, then activity. This completes the creation and processing of the first data set.

The second dataset is created by taking the average of each variable (except subject and activity) for each subject and activity combination. The second data set remains sorted by subject then activity. This completes the creation and processing of the second data set.

For the complete details, see the run_analysis.R script which performs the whole analysis. 

Finally, the R function write.table (with row.numbers = FALSE) was used to export the resulting datasets to text files. This results in a text file with variable names as the first row and every other row an observation with columns separated by a single space.
