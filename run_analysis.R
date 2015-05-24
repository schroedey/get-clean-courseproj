## run_analysis.R: A script that takes data from the UCI HAR Dataset and
## transforms it into a tidy data set: containing only the the variables
## for the mean and standard deviation for each measurement, reduced to only
## the mean of each of these measurements for each subject and activity type,
## and relabeled with more identifiable variable names.

#############################################
## 0. Make sure we have the required packages
require(dplyr)
require(reshape2)

##################################################################
## 1. Merge the training and the test sets to create one data set.
## first, load the data
print("Loading data...")
## activity labels, for use in step 3
act_labs <- read.table(
    "UCI HAR Dataset/activity_labels.txt"
    , col.names = c("actNbr", "actLabel"))
## features, for creating descriptive column names for feature cols
## in sampling data ("x" files)
features <- read.table(
    "UCI HAR Dataset/features.txt"
    , col.names = c("featNbr", "featName"))

## the feature, activity, and subject data
x_test <- read.table(
    "UCI HAR Dataset/test/X_test.txt"
    , col.names = features$featName)
x_train <- read.table(
    "UCI HAR Dataset/train/X_train.txt"
    , col.names = features$featName)
y_test <- read.table(
    "UCI HAR Dataset/test/y_test.txt"
    , col.names = c("activity"))
y_train <- read.table(
    "UCI HAR Dataset/train/y_train.txt"
    , col.names = c("activity"))
subj_test <- read.table(
    "UCI HAR Dataset/test/subject_test.txt"
    , col.names = c("subject"))
subj_train <- read.table(
    "UCI HAR Dataset/train/subject_train.txt"
    , col.names = c("subject"))

## confirm done
print("Finished loading data.")

## next, combine test files together and train files together
test_all <- cbind(subj_test, y_test, x_test, deparse.level = 1)
train_all <- cbind(subj_train, y_train, x_train, deparse.level = 1)

## and then combine test and train together
combined <- rbind(test_all, train_all)

######################################################################
## 2. Extract only the mean and std dev features for each measurement. 
combined <- select(combined, matches("subject|activity|\\.mean\\.|\\.std\\."))

############################################################################
## 3. Use descriptive activity names to name the activities in the data set.
#combined <- mutate(combined, activity = act_labs[actNbr]$actLabel)
combined <- mutate(combined, activity = act_labs[activity,]$actLabel)

#######################################################################
## 4. Appropriately label the data set with descriptive variable names.
# first, make the mean and std dev identifiers more readable
names(combined) <- sub(".mean..", "Mean", names(combined))
names(combined) <- sub(".std..", "StdDev", names(combined))
# second, correct the "BodyBody" duplication in some column names
names(combined) <- sub("BodyBody", "Body", names(combined))

#############################################################################
## 5. From the data set in step 4, create a second, independent tidy data set
##    with the average of each variable for each activity and each subject.
tidy <- group_by(combined, subject, activity) %>% summarise_each(funs(mean))
write.table(tidy, file = "tidy_data.txt", row.names = FALSE, quote = FALSE)
