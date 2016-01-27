# Getting and Cleaning Data Course Project

Description
-----------
The purpose of this project is to create a script - run_analysis.R - that prepare a tidy data that can be used for later analysis. 

This git repo includes the following files

- 'README.md'      : this file
- 'run_analysis.R' : The script that generate the required dataset
- 'CodeBook.md'    : Contains information about the variables, the data, and any transformations or work that i performed to clean up the data


How to run the script
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
TRUE on success, NA on failure.
Running the R script included in this project will generate a new dataset- "tidy_ucihar.txt" - in your working dir.

Dependencies
-----------
The script has been tested with the follows installed packages packages 
* "dplyr":      0.4.3
* "data.table": 1.9.6

In case of error yon can install dplyr from RStudio console:
```R
> install.packages("dplyr")
> install.packages("data.table")
````

Authors
------------

* Mariano Fiorentino
