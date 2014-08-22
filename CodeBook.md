Codebook
========

## Dataset Description

There are a total of 20 variables in this dataset in "tidy_summ.txt".

There are 5 variables corresponding to 5 different acceleration/velocity measurements made for each activity and test subject. For each measurement this dataset contains: (1) the mean of several repeated measurements that have been normalized, and (2) the mean of the standard deviation of several repeated measurements that have been normalized.

An additional 4 variables are created from 4 of the 5 measurements by transforming the acceleration/velocity data to frequency data (by applying a Fourier transform). This creates a total of 9 variables of type (1) described above. There are 9 additional variables that are of type (2) described above creating a total of 18 variables in this dataset based on measurement data. 

There are an additional 2 variables that provide the test subject identification number and the type of physical activity being performed for each measurement.

## Variables

### Descriptive 

#### *Unitless*

__id__ 

The integer-based identification number assigned to the test subject

__activity__ 

The type of physical activity being performed

### Mean acceleration/velocity measurements

#### *Standard gravity units of 'g'*

__tBodyAcc_mean__

Mean of the body acceleration signal

__tGravityAcc_mean__

Mean of the gravity acceleration signal

__tBodyAccJerk_mean__

Mean of the body acceleration jerk signal

#### *Units of radians/second*

__tBodyGyro_mean__ 

Mean of the body angular velocity signal

__tBodyGyroJerk_mean__

Mean of the body angular velocity jerk signal

### Transformed acceleration/velocity measurements to frequency domain

#### *Units of Hertz*

__fBodyAcc_mean__ 

Mean of the body acceleration signal

__fBodyAccJerk_mean__

Mean of the body acceleration jerk signal

__fBodyGyro_mean__ 

Mean of the body angular velocity signal

__fBodyGyroJerk_mean__

Mean of the body angular velocity jerk signal

### Mean standard deviation of acceleration/velocity measurements

#### *Standard gravity units of 'g'*

__tBodyAcc_std__  

Standard deviation of the body acceleration signal

__tGravityAcc_std__

Standard deviation of the gravity acceleration signal

__tBodyAccJerk_std__

Standard deviation of the body acceleration jerk signal

#### *Units of radians/second*

__tBodyGyro_std__

Standard deviation of the body angular velocity signal

__tBodyGyroJerk_std__

Standard deviation of the body angular velocity jerk signal

#### *Units of Hertz*

__fBodyAcc_std__

Standard deviation of the body acceleration signal

__fBodyAccJerk_std__ 

Standard deviation of the body acceleration jerk signal

__fBodyGyro_std__

Standard deviation of the body angular velocity signal

__fBodyGyroJerk_std__ 

Standard deviation of the body angular velocity jerk signal
