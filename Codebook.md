## Code Book

### Background

Source attribution: Much of the following description comes from the description of the raw data that was contained in
the accompanying file, features_info.txt, as it contains a good description of the underlying data.  I have copied the
relevant parts below and then made changes to add contextual information, remove elements that do not pertain to the tidy
data set for the course assignment, and to describe the changes I made to the data elements (naming conventions and data
transformations).

The features selected for the tidy data file, tidy_data.txt, come from the accelerometer and gyroscope 3-axial raw signals
tAcc-XYZ and tGyro-XYZ from a Samsung Galaxy S smartphone.

These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz.
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz
to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals
(tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals
(tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ,
fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
(See below for how these are structured in the tidy data set.)

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

### Tidy Data Set Data Transformations and Naming Conventions

The measurements described above were taken for a group of subjects undergoing different activities, and the means and
standard deviations of these measurements were then calculated from both a test and a training data set in the original
raw data.  In addition, the three-dimensional axial measurements (identified above as "-XYZ") are broken down into their
separate dimensions, so there are separate columns for the X, Y, and Z values, indicated by a ".X", ".Y", or ".Z" at the
end of the column name.  The activity types, which were coded in the raw data, have been replaced with their descriptive
names; they include the following six activities:

WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING

In addition, in the tidy data set, these mean and standard deviation values are then averaged for each subject and activity
type, and one record (row) is provided for each combination of subject and activity type.  This leads to a result set that is 
structured into records as follows:

subject: numeric identifier of the person who performed the activity while using the handset
activity: a description of the activity type
{measurements}: for each base measurement described above, the following exists in the tidy data set:
{measurement}Mean: the average of the mean values for the given measurement, for the particular subject and activity
{measurement}StdDev: the average of the standard deviation values for the given measurement, for the particular subject and activity

So, for example, for the measurement tBodyAcc-XYZ, you will find in the tidy data set the following:
tBodyAccMean.X: the average value of the tBodyAcc mean measurement for the given subject and activity in the x axis
tBodyAccMean.Y: the average value of the tBodyAcc mean measurement for the given subject and activity in the y axis
tBodyAccMean.Z: the average value of the tBodyAcc mean measurement for the given subject and activity in the z axis
tBodyAccStdDev.X: the average value of the tBodyAcc standard deviation measurement for the given subject and activity in the x axis
tBodyAccStdDev.Y: the average value of the tBodyAcc standard deviation measurement for the given subject and activity in the y axis
tBodyAccStdDev.Z: the average value of the tBodyAcc standard deviation measurement for the given subject and activity in the z axis
