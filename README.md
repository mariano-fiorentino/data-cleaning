# run_analysis.R

Description
-----------
This script creates a clean dataset from files of UCI HAR Dataset. The data source of the original dataset is downloadble at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

About the original dataset, a full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The scripts does the following steps:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Usage
-----------
The script checks if exists the "UCI HAR Dataset" directory, otherwise it will try to download the required files.

From unix shell:
```R
$ Rscript source("run_analysis.R")
````

From RStudio console
```R
> out <- source("run_analysis.R")
> out
$value
[1] TRUE

$visible
[1] TRUE
````
The scripts returns TRUE on success, NA on failure

Dependencies
-----------
The script has been tested with the follows installed packages packages 
*  "dplyr":  	0.4.3

In case of error yon can install dplyr from RStudio console:
```R
> install.packages("dplyr")
````

Authors
------------

* Mariano Fiorentino
