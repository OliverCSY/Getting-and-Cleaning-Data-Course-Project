## load dplyr package
library(dplyr)

## download the dataset from website

zipurl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
zipfile <- './data/dataset.zip'
if (!file.exists('./data')) {
    dir.create('./data')
}
if (!file.exists(zipfile)) {
    download.file(zipurl, destfile = zipfile)
}

## load individual datasets from the zip file

trainSubject <- read.table(unz(zipfile, "UCI HAR Dataset/train/subject_train.txt"))
trainData <- read.table(unz(zipfile, "UCI HAR Dataset/train/X_train.txt"))
trainLabel <- read.table(unz(zipfile, "UCI HAR Dataset/train/y_train.txt"))
testSubject <- read.table(unz(zipfile, "UCI HAR Dataset/test/subject_test.txt"))
testData <- read.table(unz(zipfile, "UCI HAR Dataset/test/X_test.txt"))
testLabel <- read.table(unz(zipfile, "UCI HAR Dataset/test/y_test.txt"))
features <- read.table(unz(zipfile, "UCI HAR Dataset/features.txt"))
activityLabels <- read.table(unz(zipfile, "UCI HAR Dataset/activity_labels.txt"))

## Merge training and test datasets

mergedSubject <- rbind(trainSubject,testSubject)
mergedData <- rbind(trainData,testData)
mergedLabel <- rbind(trainLabel,testLabel)

## Preserve only mean and standard

meanStdIndex <- grep('mean|std',features[,2])
mergedData <- mergedData[,meanStdIndex]

## Change and simplify column names

names(mergedData) <- gsub("-|(\\(\\))", "", features[meanStdIndex, 2])
names(mergedData) <- gsub("mean", "Mean", names(mergedData))
names(mergedData) <- gsub("std", "Std", names(mergedData))

## Create descriptive activity names

activity <- activityLabels[, 2]
activity <- strsplit(tolower(activity), "_")
activity <- sapply(activity, function(x){
    paste(sapply(x, function(y) paste0(toupper(substr(y, 1, 1)), tolower(substring(y, 2)))),
          collapse=" ")
})

actLabels <- activity[mergedLabel[,1]]
mergedLabel[,1] <- actLabels

## Create descriptive variable names

names(mergedLabel) <- "Activity"
names(mergedSubject) <- "Subject"

## Combine Subjects, Activities and Data into an integrated dataset

inteData <- cbind(mergedSubject,mergedLabel,mergedData)

## Save the new dataset

write.table(inteData, "./ModifiedMergedData.txt")

## Create an independent data set with averages for each activity for each subject
tidyData <- inteData %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))

## Save the summarizing dataset
write.table(tidyData, "./SubjectActivityMeanData.txt", row.name=FALSE)