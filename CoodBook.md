---
title: "Getting and Cleaning Data Course Project Cood Book"
author: "Shanyun Chu"
date: "19 June 2016"
output: html_document
---

## Getting and Cleaning Data Assignment Code Book

Description of data, transformational steps involved in clean up and variables in resulting files.

  * Original data source: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
  * Data download:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Transformational steps
1. Download the dataset from above url, and save to './data/dataset.zip';
2. Load into R;
  * "dataset.zip/UCI HAR Dataset/features.txt"
  * "dataset.zip/UCI HAR Dataset/activity_labels.txt"
  * "dataset.zip/UCI HAR Dataset/test/subject_test.txt" (Subjects)
  * "dataset.zip/UCI HAR Dataset/test/X_test.txt" (Data)
  * "dataset.zip/UCI HAR Dataset/test/y_test.txt" (Labels)
  * "dataset.zip/UCI HAR Dataset/train/subject_train.txt" (Subjects)
  * "dataset.zip/UCI HAR Dataset/train/X_train.txt" (Data)
  * "dataset.zip/UCI HAR Dataset/train/y_train.txt" (Labels);
3. Merged test & train datasets
  * "X_train.txt' + 'X_test.txt"
  * "y_train.txt' + 'y_test.txt"
  * "subject_train.txt" + "subject_test.txt";
4. Identified the *mean* and *standard* deviation variables in "features.txt";
5. Cleaned the merged data to contain just mean and standard deviation variables;
6. Assigned and cleaned up variable names from "features.txt" to the merged data ;
7. Assign activity labels from "activity_labels.txt" to the label ids in the merged label dataset;
8. Assigned descriptive names to *Subject* and *Activity* variables;
9. Combine cleaned subjects, activity and data tables and saved output to "./SubjectActivityData.txt"
10. Generate new dataset runing dplyr *group_by* on *Subject* and *Activity* and *summarise_each* using mean
11. Save new dataset as "./SubjectActivityMeanData.txt"

## SubjectActivityMeanData.txt structure

1. This file contains the mean measurements for 6 recorded activity types for 30 subjects.
* Subject (int)
* Activity (factor) 6 levels: "Laying", "Sitting", "Standing", "Walking", "Walking Downstairs", "Walking Upstairs"

2. 79 variables are listed below
(The variables below contain the means of each activity listed in the *Activity* variable for each subject)
  * tBodyAccMeanX (num)
  * tBodyAccMeanY (num)
  * tBodyAccMeanZ (num)
  * tBodyAccStdX (num)
  * tBodyAccStdY (num)
  * tBodyAccStdZ (num)
  * tGravityAccMeanX (num)
  * tGravityAccMeanY (num)
  * tGravityAccMeanZ (num)
  * tGravityAccStdX (num)
  * tGravityAccStdY (num)
  * tGravityAccStdZ (num)
  * tBodyAccJerkMeanX (num)
  * tBodyAccJerkMeanY (num)
  * tBodyAccJerkMeanZ (num)
  * tBodyAccJerkStdX (num)
  * tBodyAccJerkStdY (num)
  * tBodyAccJerkStdZ (num)
  * tBodyGyroMeanX (num)
  * tBodyGyroMeanY (num)
  * tBodyGyroMeanZ (num)
  * tBodyGyroStdX (num)
  * tBodyGyroStdY (num)
  * tBodyGyroStdZ (num)
  * tBodyGyroJerkMeanX (num)
  * tBodyGyroJerkMeanY (num)
  * tBodyGyroJerkMeanZ (num)
  * tBodyGyroJerkStdX (num)
  * tBodyGyroJerkStdY (num)
  * tBodyGyroJerkStdZ (num)
  * tBodyAccMagMean (num)
  * tBodyAccMagStd (num)
  * tGravityAccMagMean (num)
  * tGravityAccMagStd (num)
  * tBodyAccJerkMagMean (num)
  * tBodyAccJerkMagStd (num)
  * tBodyGyroMagMean (num)
  * tBodyGyroMagStd (num)
  * tBodyGyroJerkMagMean (num)
  * tBodyGyroJerkMagStd (num)
  * fBodyAccMeanX (num)
  * fBodyAccMeanY (num)
  * fBodyAccMeanZ (num)
  * fBodyAccStdX (num)
  * fBodyAccStdY (num)
  * fBodyAccStdZ (num)
  * fBodyAccMeanFreqX (num)
  * fBodyAccMeanFreqY (num)
  * fBodyAccMeanFreqZ (num)
  * fBodyAccJerkMeanX (num)
  * fBodyAccJerkMeanY (num)
  * fBodyAccJerkMeanZ (num)
  * fBodyAccJerkStdX (num)
  * fBodyAccJerkStdY (num)
  * fBodyAccJerkStdZ (num)
  * fBodyAccJerkMeanFreqX (num)
  * fBodyAccJerkMeanFreqZ (num)
  * fBodyGyroMeanX (num)
  * fBodyGyroMeanY (num)
  * fBodyGyroMeanZ (num)
  * fBodyGyroStdX (num)
  * fBodyGyroStdY (num)
  * fBodyGyroStdZ (num)
  * fBodyGyroMeanFreqX (num)
  * fBodyGyroMeanFreqY (num)
  * fBodyGyroMeanFreqZ (num)
  * fBodyAccMagMean (num)
  * fBodyAccMagStd (num)
  * fBodyAccMagMeanFreq (num)
  * fBodyBodyAccJerkMagMean (num)
  * fBodyBodyAccJerkMagStd (num)
  * fBodyBodyAccJerkMagMeanFreq  (num)
  * fBodyBodyGyroMagMean (num)
  * fBodyBodyGyroMagStd (num)
  * fBodyBodyGyroMagMeanFreq (num)
  * fBodyBodyGyroJerkMagMean (num)
  * fBodyBodyGyroJerkMagStd (num)
  * fBodyBodyGyroJerkMagMeanFreq (num)
