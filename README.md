## Introduction

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.
A full description is available at the site where the data was obtained: 
<a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">UCI.edu website</a>

Here are the data for the project: 
<a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">Source data</a>

## Solution Description

In accordance with the assignment, the R script run_analysis.R contained in this project does the following:
* 1.  Merges the training and the test sets to create one data set.
* 2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
* 3.  Uses descriptive activity names to name the activities in the data set.
* 4.  Appropriately labels the data set with descriptive variable names.
* 5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The solution uses the base packages for reading the data and initial combining into a single data set.
It then uses the select and mutate functions from the dplyr package to make the necessary manipulations described in
requirements 2 and 3, above, and then to do the averaging by group as described in requirement 5.  Step 4 and the
creation of the tidy text data file are done using the base packages.  Details of these steps are contained in the
code comments, which identify which code does the work to meet each requirement.  No additional commentary is warranted
for requirements 1 and 3, as they are straightforward and require no interpretation.  Details of my decisions for the
other requirements follows.

For requirement 2, I chose to include all variables that contained "mean()" or "std()" in their name, as this correlated as closely
to the project requirements as possible (did not include any measurements not on the mean or standard deviation) and included
as wide a range of data within that requirement as possible.  The latter is valuable because, without knowing what future
analyses might be done with this tidy data set, we do not want to exclude mean or standard deviation measurements that might
be necessary for that analysis.

For requirement 4, I chose to simply clean up the one naming error ("BodyBody") contained in the original labeling,
and then change the "mean" and "std" labels to be more readable, changing "std" to "StdDev" to clearly identify what the
column contains.  Otherwise, I left the original naming convention mostly in place, as there is a code book that describes the
convention, and with almost 70 columns, a reasonably compact naming convention is important.

For requirement 5, I chose a wide form of the tidy data.  The primary reason for doing this, besides a simple preference
on my part, is that it seems like a more intuitive layout, and it requires less transformation to do many types of subsequent
analysis on the data than would be required with a narrow form (though certain types of analysis would benefit from starting
with a narrow form).
