# STEP 1 >> Merges the training and the test sets to create one data set.
X_train <- read.table('./data/train/X_train.txt')
dim(X_train)  
head(X_train)
y_train <- read.table('./data/train/y_train.txt')
table(y_train)
subject_train <- read.table('./data/train/subject_train.txt')
X_test <- read.table('./data/test/X_test.txt')
dim(X_test)  
y_test <- read.table('./data/test/y_test.txt') 
table(y_test) 
subject_test <- read.table('./data/test/subject_test.txt')
mergedDataRaw <- rbind(X_train, X_test)
dim(mergedDataRaw)  
mergedDataLabel <- rbind(y_train, y_test)
dim(mergedDataLabel)  
mergedDataSubject <- rbind(subject_train, subject_test)
dim(mergedDataSubject)  

# STEP 2 >> Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table('./data/features.txt')
dim(features)
meanStdDevFeatures <- grep('mean\\(\\)|std\\(\\)', features[, 2])
length(meanStdDevFeatures)
mergedDataRaw <- mergedDataRaw[, meanStdDevFeatures]
dim(mergedDataRaw)
names(mergedDataRaw) <- gsub('\\(\\)', '', features[meanStdDevFeatures, 2])  
names(mergedDataRaw) <- gsub('mean', 'Mean', names(mergedDataRaw)) 
names(mergedDataRaw) <- gsub('std', 'Std', names(mergedDataRaw)) 
names(mergedDataRaw) <- gsub('-', '', names(mergedDataRaw)) 

# STEP 3 >> Uses descriptive activity names to name the activities in the data set.
activity <- read.table('./data/activity_labels.txt')
activity[, 2] <- tolower(gsub('_', '', activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activityLabel <- activity[mergedDataLabel[, 1], 2]
mergedDataLabel[, 1] <- activityLabel
names(mergedDataLabel) <- 'activity'

# STEP 4 >> Appropriately labels the data set with descriptive activity names. 
names(mergedDataSubject) <- 'subject'
mergedDataClean <- cbind(mergedDataSubject, mergedDataLabel, mergedDataRaw)
dim(mergedDataClean)  
write.table(mergedDataClean, 'step4_output.txt') 

# STEP 5 >> Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
mergedDataSubjectLen <- length(table(mergedDataSubject))  
activityLen <- dim(activity)[1]  
mergedDataCleanLen <- dim(mergedDataClean)[2]
result <- matrix(NA, nrow=mergedDataSubjectLen*activityLen, ncol=mergedDataCleanLen) 
result <- as.data.frame(result)
colnames(result) <- colnames(mergedDataClean)
row <- 1
for(i in 1:mergedDataSubjectLen) {
    for(j in 1:activityLen) {
        result[row, 1] <- sort(unique(mergedDataSubject)[, 1])[i]
        result[row, 2] <- activity[j, 2]
        bool1 <- i == mergedDataClean$subject
        bool2 <- activity[j, 2] == mergedDataClean$activity
        result[row, 3:mergedDataCleanLen] <- colMeans(mergedDataClean[bool1&bool2, 3:mergedDataCleanLen])
        row <- row + 1
    }
}
head(result)
write.table(result, 'output_data.txt')
