# Creates a clean dataset from files of UCI HAR Dataset
#
# @param directory character with the path of the "UCI HAR Dataset"
# @return TRUE on success, NA on failure
#
# @examples
# source("run_analysis.R")
# result <- tidy_ucihar("UCI HAR Dataset")

tidy_ucihar <- function (directory = "UCI HAR Dataset") {

    result <- tryCatch({
        # loads the required libraries
        library(dplyr)
        library(tidyr)
        # reads test and train datasets and binds the rows
        test <- read.table(sprintf("%s/test/X_test.txt", directory));
        train <- read.table(sprintf("%s/train/X_train.txt", directory));
        binded <- bind_rows(test, train);
        # reads the features
        tbl <- tbl_df(binded);
        names_df <- read.table(sprintf("%s/features.txt", directory));
        # selects the features names by mean & std        
        tbl %>% 
            select(grep('-(mean|std)\\(\\)', names_df[,2], perl = TRUE)) -> tbl
        # cleans names with some regexpr and adds column name to the dataset
        names <- names_df[grepl('-(mean|std)\\(\\)', names_df[,2], perl = TRUE),2]
        names <- sub("^t(.*)", "time.\\1", names)
        names <- sub("^f(.*)", "frequency.\\1", names)
        names <- gsub("\\(\\)", "", names)
        names <- gsub("-", ".", names)
        names <- tolower(names)
        names(tbl) <- names
        # reads "activity" column from train & test files
        test_act <- read.table(sprintf("%s/test/y_test.txt", directory));
        train_act <- read.table(sprintf("%s/train/y_train.txt", directory));
        binded_act <- bind_rows(test_act,  train_act)
        names(binded_act) <- c("activity")
        # read "subject" column for train & test        
        test_subj <- read.table(sprintf("%s/test/subject_test.txt", directory));
        train_subj <- read.table(sprintf("%s/train/subject_train.txt", directory));
        binded_subj <- bind_rows(test_subj,  train_subj)
        names(binded_subj) <- c("subject")
        # joins the main table with the activity and subject datasets
        tbl <- bind_cols(
            binded_subj, 
            binded_act, 
            tbl
        )
        # reads activities labels and assigns it to the table 
        desc_act <- read.table(sprintf("%s/activity_labels.txt", directory));
        tbl$activity <- factor(tbl$activity, desc_act[,1], desc_act[,2])
        # groups by subject & activity and gather information using key=observation, value=average
        tbl %>% 
            group_by(subject, activity) %>% 
            summarise_each(funs(mean)) %>%
            gather(key=observation, value=average, -subject, -activity) %>%
            arrange(subject, activity) -> tbl
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