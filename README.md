# run_analysis.R

Description
-----------

This script creates a clean dataset from files of UCI HAR Dataset. The script checks if exists the "UCI HAR Dataset" directory, otherwise it will try to download the required files.
The scripts does the following steps:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Usage
-----------

From unix shell:
```R
$ Rscript source("run_analysis.R")
````

From RStudio console
```R
> out <- source("run_analysis.R")
````
The scripts returns TRUE on success, NA on failure

Dependencies
------------
*  "dplyr":  	0.4.3

Authors
------------

* Mariano Fiorentino
