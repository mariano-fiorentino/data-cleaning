# run_analysis.R

Description
-----------

Creates a clean dataset from files of UCI HAR Dataset. The script checks if exists the "UCI HAR Dataset" directory, otherwise it will try to download the required dataset.
The scripts does the following steps:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Usage: 
{{{
./source("run_analysis.R")
}}}





Authors
------------

* Mariano Fiorentino
