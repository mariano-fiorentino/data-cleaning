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
- groups by subject & activity and summarise_each
- write tidy_ucihar.txt in the working directory

The script will generate a new tidy dataset - "tidy_ucihar.txt" - in your working dir.


Variables on the original dataset
-----------
The features selected for the source database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

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

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.


Work performed on variables
-----------
The original features names was modified in the script to fit the variable standard in R. In R a syntactically valid name consists of letters, numbers and the dot or underline characters and starts with a letter or the dot not followed by a number.
This transformation has been necessary to improve readability of the variables, to assign descriptive column name to the dataset and to avoid camel case variable name.  
The follows schema is the map of the changes that the script makes on the signals name:

tBodyAcc                ->  time.bodyacc
tGravityAcc             ->  time.gravityacc
tBodyAccJerk            ->  time.bodyaccjerk
tBodyGyro               ->  time.bodygyro
tBodyGyroJerk           ->  time.bodygyrojerk
tBodyAccMag             ->  time.bodyaccmag
tGravityAccMag          ->  time.gravityaccmag
tBodyAccJerkMag         ->  time.bodyaccjerkmag
tBodyGyroMag            ->  time.bodygyromag
tBodyGyroJerkMag        ->  time.bodygyrojerkmag
fBodyAcc                ->  frequency.bodyacc
fBodyAccJerk            ->  frequency.bodyaccjerk
fBodyGyro               ->  frequency.bodygyro
fBodyAccMag             ->  frequency.bodyaccmag
fBodyAccJerkMag         ->  frequency.bodyaccjerkmag
fBodyBodyGyroMag        ->  frequency.bodygyromag
fBodyBodyGyroJerkMag    ->  frequency.bodygyrojerkmag

The set of variables that were kept from the original dataset are only the mean and standard deviation for each measurement; the script searches for the follows patterns to match that requirement:

* -mean()
* -std()

A regular expression has been used to modify the resulting 66 variables to removing parethesis and substituing "-" in "." 
Furthermore, to the original dataset has been added two addictional column: 
 
- subject               ->  Subject identifier code
- activity              ->  Description of the activity: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING


Notes
-----------
- Features are normalized and bounded within [-1,1].


