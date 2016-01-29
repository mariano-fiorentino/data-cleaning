# Getting and Cleaning Data Course Project CodeBook


About the data source
-----------
The script uses as data source the "Human Activity Recognition Using Smartphones Dataset". The original experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, has been captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.
The data source of the original dataset is downloadble at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

About the original dataset, a full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


Used files of the data source
-----------
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


Work performed to clean up the data
-----------
To clean up the data you have to run_analysis.R, the script does the following jobs:

- loads the required libraries
- checks if exists the "UCI HAR Dataset" directory, otherwise it will try to download and unzips the required files
- reads test and train datasets and binds the rows using (train/X_train.txt and test/X_test.txt)
- reads features names (features.txt)
- selects columns indexes by mean & std        
- cleans names with some regexpr and adds column names to the dataset
- reads "activity" column from train & test files
- read "subject" column for train & test        
- joins the main table with the activity and subject datasets
- reads activities labels and assigns it to the table 
- creates a second, independent tidy data set with the average of each variable for each activity and each subject.
- writes tidy_ucihar.txt in the working directory

The script will generate a new dataset - "tidy_ucihar.txt", a data.frame with 180 observation of  68 variables - in your working dir.

Variables on the original dataset
-----------
The features selected for the source database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Work performed on variables
-----------

The original features names was modified in the script to fit the variable standard in R. In R, a syntactically valid name, consists of letters, numbers and the dot or underline characters, and starts with a letter or the dot not followed by a number.
This transformation has been necessary to improve readability of the variables and to assign descriptive column name to the dataset.  
The follows is the map of the changes that the script makes on the signals name:

- tBodyAcc                ->  time.body.accelerometer
- tGravityAcc             ->  time.gravity.accelerometer
- tBodyAccJerk            ->  time.body.accelerometer.jerk
- tBodyGyro               ->  time.body.gyroscope
- tBodyGyroJerk           ->  time.body.gyroscope.jerk
- tBodyAccMag             ->  time.body.accelerometer.magnitude
- tGravityAccMag          ->  time.gravity.accelerometer.magnitude
- tBodyAccJerkMag         ->  time.body.accelerometer.jerk.magnitude
- tBodyGyroMag            ->  time.body.gyroscope.magnitude
- tBodyGyroJerkMag        ->  time.body.gyroscope.jerk.magnitude
- fBodyAcc                ->  frequency.body.accelerometer
- fBodyAccJerk            ->  frequency.body.accelerometer.jerk
- fBodyGyro               ->  frequency.body.gyroscope
- fBodyAccMag             ->  frequency.body.accelerometer.magnitude
- fBodyAccJerkMag         ->  frequency.body.accelerometer.jerk.magnitude
- fBodyGyroMag            ->  frequency.body.gyroscope.magnitude
- fBodyGyroJerkMag        ->  frequency.body.gyroscope.jerk.magnitude

The set of variables that were kept from the original dataset are only the mean and standard deviation for each measurement.

List of variables
-----------
All of variables, excuding "subject" and "activity", are normalized and bounded within [-1,1]

 $ subject                                         : int  1:30, subject id
 $ activity                                        : Factor w/ 6 levels WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
 $ time.body.accelerometer.mean.x                  : num 
 $ time.body.accelerometer.mean.y                  : num 
 $ time.body.accelerometer.mean.z                  : num  
 $ time.body.accelerometer.std.x                   : num  
 $ time.body.accelerometer.std.y                   : num  
 $ time.body.accelerometer.std.z                   : num  
 $ time.gravity.accelerometer.mean.x               : num  
 $ time.gravity.accelerometer.mean.y               : num  
 $ time.gravity.accelerometer.mean.z               : num  
 $ time.gravity.accelerometer.std.x                : num  
 $ time.gravity.accelerometer.std.y                : num  
 $ time.gravity.accelerometer.std.z                : num  
 $ time.body.accelerometer.jerk.mean.x             : num  
 $ time.body.accelerometer.jerk.mean.y             : num  
 $ time.body.accelerometer.jerk.mean.z             : num  
 $ time.body.accelerometer.jerk.std.x              : num  
 $ time.body.accelerometer.jerk.std.y              : num  
 $ time.body.accelerometer.jerk.std.z              : num  
 $ time.body.gyroscope.mean.x                      : num  
 $ time.body.gyroscope.mean.y                      : num  
 $ time.body.gyroscope.mean.z                      : num  
 $ time.body.gyroscope.std.x                       : num  
 $ time.body.gyroscope.std.y                       : num  
 $ time.body.gyroscope.std.z                       : num  
 $ time.body.gyroscope.jerk.mean.x                 : num  
 $ time.body.gyroscope.jerk.mean.y                 : num  
 $ time.body.gyroscope.jerk.mean.z                 : num  
 $ time.body.gyroscope.jerk.std.x                  : num  
 $ time.body.gyroscope.jerk.std.y                  : num  
 $ time.body.gyroscope.jerk.std.z                  : num  
 $ time.body.accelerometer.magnitude.mean          : num  
 $ time.body.accelerometer.magnitude.std           : num  
 $ time.gravity.accelerometer.magnitude.mean       : num  
 $ time.gravity.accelerometer.magnitude.std        : num  
 $ time.body.accelerometer.jerk.magnitude.mean     : num  
 $ time.body.accelerometer.jerk.magnitude.std      : num  
 $ time.body.gyroscope.magnitude.mean              : num  
 $ time.body.gyroscope.magnitude.std               : num  
 $ time.body.gyroscope.jerk.magnitude.mean         : num  
 $ time.body.gyroscope.jerk.magnitude.std          : num  
 $ frequency.body.accelerometer.mean.x             : num 
 $ frequency.body.accelerometer.mean.y             : num 
 $ frequency.body.accelerometer.mean.z             : num 
 $ frequency.body.accelerometer.std.x              : num 
 $ frequency.body.accelerometer.std.y              : num 
 $ frequency.body.accelerometer.std.z              : num  
 $ frequency.body.accelerometer.jerk.mean.x        : num  
 $ frequency.body.accelerometer.jerk.mean.y        : num  
 $ frequency.body.accelerometer.jerk.mean.z        : num  
 $ frequency.body.accelerometer.jerk.std.x         : num  
 $ frequency.body.accelerometer.jerk.std.y         : num  
 $ frequency.body.accelerometer.jerk.std.z         : num  
 $ frequency.body.gyroscope.mean.x                 : num  
 $ frequency.body.gyroscope.mean.y                 : num  
 $ frequency.body.gyroscope.mean.z                 : num  
 $ frequency.body.gyroscope.std.x                  : num  
 $ frequency.body.gyroscope.std.y                  : num  
 $ frequency.body.gyroscope.std.z                  : num  
 $ frequency.body.accelerometer.magnitude.mean     : num  
 $ frequency.body.accelerometer.magnitude.std      : num  
 $ frequency.body.accelerometer.jerk.magnitude.mean: num  
 $ frequency.body.accelerometer.jerk.magnitude.std : num  
 $ frequency.body.gyroscope.magnitude.mean         : num  
 $ frequency.body.gyroscope.magnitude.std          : num  
 $ frequency.body.gyroscope.jerk.magnitude.mean    : num  
 $ frequency.body.gyroscope.jerk.magnitude.std     : num  
