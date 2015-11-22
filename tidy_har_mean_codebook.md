# Codebook

## Intro
The course project was to download the [Human Activity Recognition Using Smartphones][id1] dataset from the [UCI Machine Learning Repository][id2] and transform it into a tidy dataset.  The transformation consisted of:

1. Combining the train and test datasets.
2. Extracting the mean value and standard deviation variables associated with signals from the feature vector.
3. Include the subject id and name of activity associated with each record.
4. Transform the dataset to calculate and average of each variable for each subject/activity combination.

## Source Data
Please see the documentation for the [Human Activity Recognition Using Smartphones][id1] dataset for information on the original source data.

Measurements from accelerometers and gyroscopes were taken on 30 individuals between the ages of 19-48 years performing various activities.  As stated in the README from the original data, "[t]he sensor signals were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window)."  In the original data, several aggregations were performed on these 128 readings/window to create 516 new features.

## Step-by-Step of Analysis
The original data was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip into a file called uci.zip.  This file was then unzipped into a directory called UCI HAR Dataset.  The source data was then read into R data.frames.

Using the dplyr package, the rows of the training and testing datasets were combined into a single dataset.  Then using the `grep` function, the column names were filtered to leave only the subset of the 516 features which were mean or standard deviation aggregates of the underlying signals leaving 66 features in the tidy_har data.frame.

Next, activity integer code values were replaced with their full lables and abbreviated forms of the variable names were replaced with more readable ones.  Finally, these were aggregated by subject and activity by calculating means and exported to a text file called tidy_har_mean.txt.

The script run_analysis.R performs above steps.

## Variables

### tidy_har_mean.txt
Calculates the mean by subject/activity for each of the mean/standard deviation features from the Human Activity Recognition Using Smartphones dataset.

Variables with "Acceleration" in the name are in units of g (standard gravity).  Variables with "Gyroscope" in the name are in units of radians/second.

$ subject                                          : unique ID of subject performing activity  
$ activity                                         : name of activity on of six activities subjects performed during experiment: "LAYING" "SITTING" "STANDING" "WALKING" "WALKING_UPSTAIRS" "WALKING_DOWNSTAIRS"
$ timeBodyAcceleration-mean()-X                    : Mean of means of acceleration of subject's body along X-axis as measured by accelerometer
$ timeBodyAcceleration-mean()-Y                    : Mean of means of acceleration of subject's body along Y-axis as measured by accelerometer
$ timeBodyAcceleration-mean()-Z                    : Mean of means acceleration of subject's body along Z-axis as measured by accelerometer
$ timeBodyAcceleration-std()-X                     : Mean of standard deviations of acceleration of subject's body along X-axis as measured by accelerometer
$ timeBodyAcceleration-std()-Y                     : Mean of standard deviations of acceleration of subject's body along Y-axis as measured by accelerometer
$ timeBodyAcceleration-std()-Z                     : Mean of standard deviations of acceleration of subject's body along Z-axis as measured by accelerometer
$ timeGravityAcceleration-mean()-X                 : Mean of means of acceleration due to gravity along along X-axis 
$ timeGravityAcceleration-mean()-Y                 : Mean of means of acceleration due to gravity along along Y-axis 
$ timeGravityAcceleration-mean()-Z                 : Mean of means of acceleration due to gravity along along Z-axis 
$ timeGravityAcceleration-std()-X                  : Mean of standard deviations of acceleration due to gravity along along X-axis 
$ timeGravityAcceleration-std()-Y                  : Mean of standard deviations of acceleration due to gravity along along Y-axis 
$ timeGravityAcceleration-std()-Z                  : Mean of standard deviations of acceleration due to gravity along along Z-axis 
$ timeBodyAccelerationJerk-mean()-X                : Mean of means of acceleration jerk of subject's body along X-axis as measured by accelerometer
$ timeBodyAccelerationJerk-mean()-Y                : Mean of means of acceleration jerk of subject's body along Y-axis as measured by accelerometer
$ timeBodyAccelerationJerk-mean()-Z                : Mean of means of acceleration jerk of subject's body along Z-axis as measured by accelerometer
$ timeBodyAccelerationJerk-std()-X                 : Mean of standard deviations of acceleration jerk of subject's body along X-axis as measured by accelerometer
$ timeBodyAccelerationJerk-std()-Y                 : Mean of standard deviations of acceleration jerk of subject's body along Y-axis as measured by accelerometer
$ timeBodyAccelerationJerk-std()-Z                 : Mean of standard deviations of acceleration jerk of subject's body along Z-axis as measured by accelerometer
$ timeBodyGyroscope-mean()-X                       : Mean of means of angular velocity of subject's body about X-axis as measured by gyroscope
$ timeBodyGyroscope-mean()-Y                       : Mean of means of angular velocity of subject's body about Y-axis as measured by gyroscope
$ timeBodyGyroscope-mean()-Z                       : Mean of means of angular velocity of subject's body about Z-axis as measured by gyroscope
$ timeBodyGyroscope-std()-X                        : Mean of standard deviations of angular velocity of subject's body about X-axis as measured by gyroscope
$ timeBodyGyroscope-std()-Y                        : Mean of standard deviations of angular velocity of subject's body about Y-axis as measured by gyroscope
$ timeBodyGyroscope-std()-Z                        : Mean of standard deviations of angular velocity of subject's body about Z-axis as measured by gyroscope
$ timeBodyGyroscopeJerk-mean()-X                   : Mean of means of angular velocity jerk of subject's body about about X-axis as measured by gyroscope
$ timeBodyGyroscopeJerk-mean()-Y                   : Mean of means of angular velocity jerk of subject's body about about Y-axis as measured by gyroscope
$ timeBodyGyroscopeJerk-mean()-Z                   : Mean of means of angular velocity jerk of subject's body about about Z-axis as measured by gyroscope
$ timeBodyGyroscopeJerk-std()-X                    : Mean of standard deviations of angular velocity jerk of subject's body about about X-axis as measured by gyroscope
$ timeBodyGyroscopeJerk-std()-Y                    : Mean of standard deviations of angular velocity jerk of subject's body about about Y-axis as measured by gyroscope
$ timeBodyGyroscopeJerk-std()-Z                    : Mean of standard deviations of angular velocity jerk of subject's body about about Z-axis as measured by gyroscope
$ timeBodyAccelerationMagnitude-mean()             : Mean of means of the magnitude of acceleration of subject's body as measured by accelerometer
$ timeBodyAccelerationMagnitude-std()              : Mean of standard deviations of the magnitude of acceleration of subject's body as measured by accelerometer
$ timeGravityAccelerationMagnitude-mean()          : Mean of means of the magnitude of accelerationdue to gravity as measured by accelerometer
$ timeGravityAccelerationMagnitude-std()           : Mean of standard deviations of the magnitude of accelerationdue to gravity as measured by accelerometer
$ timeBodyAccelerationJerkMagnitude-mean()         : Mean of means of the magnitude of jerk acceleration of subject's body as measured by accelerometer
$ timeBodyAccelerationJerkMagnitude-std()          : Mean of means of the magnitude of jerk accelerationdue to gravity as measured by accelerometer
$ timeBodyGyroscopeMagnitude-mean()                : Mean of means of the magnitude of angular velocity of subject's body as measured by gyroscope
$ timeBodyGyroscopeMagnitude-std()                 : Mean of standard deviations of the magnitude of angular velocity of subject's body as measured by gyroscope
$ timeBodyGyroscopeJerkMagnitude-mean()            : Mean of means of the magnitude of jerk angular velocity of subject's body as measured by gyroscope
$ timeBodyGyroscopeJerkMagnitude-std()             : Mean of standard deviations of the magnitude of jerk angular velocity of subject's body as measured by gyroscope
$ frequencyBodyAcceleration-mean()-X               : Mean of means of FFT of acceleration of subject's body along X-axis as measured by accelerometer
$ frequencyBodyAcceleration-mean()-Y               : Mean of means of FFT of acceleration of subject's body along Y-axis as measured by accelerometer
$ frequencyBodyAcceleration-mean()-Z               : Mean of means of FFT of acceleration of subject's body along Z-axis as measured by accelerometer
$ frequencyBodyAcceleration-std()-X                : Mean of standard deviations of FFT of acceleration of subject's body along X-axis as measured by accelerometer
$ frequencyBodyAcceleration-std()-Y                : Mean of standard deviations of FFT of acceleration of subject's body along Y-axis as measured by accelerometer
$ frequencyBodyAcceleration-std()-Z                : Mean of standard deviations of FFT of acceleration of subject's body along Z-axis as measured by accelerometer
$ frequencyBodyAccelerationJerk-mean()-X           : Mean of means of FFT of acceleration jerk of subject's body along X-axis as measured by accelerometer
$ frequencyBodyAccelerationJerk-mean()-Y           : Mean of means of FFT of acceleration jerk of subject's body along Y-axis as measured by accelerometer
$ frequencyBodyAccelerationJerk-mean()-Z           : Mean of means of FFT of acceleration jerk of subject's body along Z-axis as measured by accelerometer
$ frequencyBodyAccelerationJerk-std()-X            : Mean of standard deviations of FFT of acceleration jerk of subject's body along X-axis as measured by accelerometer
$ frequencyBodyAccelerationJerk-std()-Y            : Mean of standard deviations of FFT of acceleration jerk of subject's body along Y-axis as measured by accelerometer
$ frequencyBodyAccelerationJerk-std()-Z            : Mean of standard deviations of FFT of acceleration jerk of subject's body along Z-axis as measured by accelerometer
$ frequencyBodyGyroscope-mean()-X                  : Mean of means of FFT of angular velocity of subject's body about X-axis as measured by gyroscope
$ frequencyBodyGyroscope-mean()-Y                  : Mean of means of FFT of angular velocity of subject's body about Y-axis as measured by gyroscope
$ frequencyBodyGyroscope-mean()-Z                  : Mean of means of FFT of angular velocity of subject's body about Z-axis as measured by gyroscope
$ frequencyBodyGyroscope-std()-X                   : Mean of standard deviations of angular velocity of subject's body about X-axis as measured by gyroscope
$ frequencyBodyGyroscope-std()-Y                   : Mean of standard deviations of angular velocity of subject's body about Y-axis as measured by gyroscope
$ frequencyBodyGyroscope-std()-Z                   : Mean of standard deviations of angular velocity of subject's body about Z-axis as measured by gyroscope
$ frequencyBodyAccelerationMagnitude-mean()        : Mean of means of FFT of the magnitude of acceleration of subject's body as measured by accelerometer
$ frequencyBodyAccelerationMagnitude-std()         : Mean of standard deviations of FFT of the magnitude of acceleration of subject's body as measured by accelerometer
$ frequencyBodyBodyAccelerationJerkMagnitude-mean(): Mean of means of FFT of the magnitude of jerk acceleration of subject's body as measured by accelerometer
$ frequencyBodyBodyAccelerationJerkMagnitude-std() : Mean of standard deviations of FFT of the magnitude of jerk acceleration of subject's body as measured by accelerometer
$ frequencyBodyBodyGyroscopeMagnitude-mean()       : Mean of means of FFT of the magnitude of angular velocity of subject's body as measured by gyroscope
$ frequencyBodyBodyGyroscopeMagnitude-std()        : Mean of standard deviations of FFT of the magnitude of angular velocity of subject's body as measured by gyroscope
$ frequencyBodyBodyGyroscopeJerkMagnitude-mean()   : Mean of means of FFT of the magnitude of jerk angular velocity of subject's body as measured by gyroscope
$ frequencyBodyBodyGyroscopeJerkMagnitude-std()    : Mean of standard deviations of FFT of the magnitude of jerk angular velocity of subject's body as measured by gyroscope

[id1]: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 