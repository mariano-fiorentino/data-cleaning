## Creates a clean dataset from files of UCI HAR Dataset
##
## @author Fiorentino
##
## @param directory character with the path of the "UCI HAR Dataset"
## @return a list with $value = TRUE on success, NA on failure
##
## @examples
## source("run_analysis.R")

tidy_ucihar <- function ()
{
    # Check if data is not in dir, otherwise downloads and unzips 
    checkdata <- function()
    {
        if (!"UCI HAR Dataset"  %in% dir()) {
            download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
                destfile = "UCIHAR_Dataset.zip", method = "curl")
            unzip("UCIHAR_Dataset.zip")
        }
        return ("UCI HAR Dataset");
    }
    # Local function, reads test and train datasets and binds the rows by prefix
    bindbyprefix <- function(prefix)
    {
        test <- read.table(sprintf("%s/test/%s_test.txt", directory, prefix));
        train <- read.table(sprintf("%s/train/%s_train.txt", directory, prefix));
        bind_rows(test, train);
    }
    result <- tryCatch({
        # loads the required libraries
        library(dplyr)
        library(data.table)
        # download the file
        directory = checkdata();
        # reads test and train datasets and binds the rows
        binded <- bindbyprefix("X")
        tbl <- tbl_df(binded);
        # reads features names
        names_df <- read.table(sprintf("%s/features.txt", directory));
        # selects columns indexes by mean & std        
        tbl %>% select(grep('-(mean|std)\\(\\)', names_df[,2], perl = TRUE)) -> tbl
        # cleans names with some regexpr and adds column names to the dataset
        names <- names_df[grepl('-(mean|std)\\(\\)', names_df[,2], perl = TRUE),2]
        patterns <- c("^t(.*)", "^f(.*)", "\\(\\)", "-", "(BodyBody|Body)","(Acc)", 
                      "(Gravity)","(Gyro)","(Jerk)", "(Mag)", "(\\.\\.)",    "(.*)")
        repl     <- c("time.\\1", "frequency.\\1", "", ".", "Body.", "Accelerometer.",
                      "Gravity.", "Gyroscope.", "Jerk.",  "magnitude.", ".",  "\\L\\1")
        for (idx in seq_along(patterns)) names = gsub(patterns[idx], repl[idx], names, perl = TRUE)
        names(tbl) <- names
        # reads "activity" column from train & test files
        binded_act <- bindbyprefix("y")
        names(binded_act) <- c("activity")
        # read "subject" column for train & test        
        binded_subj <- bindbyprefix("subject")
        names(binded_subj) <- c("subject")
        # joins the main table with the activity and subject datasets
        tbl <- bind_cols(binded_subj, binded_act, tbl)
        # reads activities labels and assigns it to the table 
        desc_act <- read.table(sprintf("%s/activity_labels.txt", directory));
        tbl$activity <- factor(tbl$activity, desc_act[,1], desc_act[,2])
        # groups by subject & activity and summarise_each
        tbl %>% group_by(subject, activity) %>% summarise_each(funs(mean)) -> tbl 
        write.table(tbl, file="tidy_ucihar.txt", row.name=FALSE)
        return(TRUE)
    }, warning = function(err) {
        
        print(paste("WARNING:  ",err))
        return(NA)
    }, error = function(err) {
        
        print(paste("ERROR:  ",err))
        return(NA)
    }); # END tryCatch
    return(result)
}
tidy_ucihar()
