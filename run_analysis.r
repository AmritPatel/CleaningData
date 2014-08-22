#############################################################################################################################
#
# This script does the following: 
#
#       (1) Merges the training and the test sets to create one data set.
#       (2) Extracts only the measurements on the mean and standard deviation for each measurement. 
#       (3) Uses descriptive activity names to name the activities in the data set
#       (4) Appropriately labels the data set with descriptive variable names. 
#       (5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#
#############################################################################################################################

### The dplyr package is a modern variant of the plyr package that makes it very easy to create tidy datasets from DFs.

library(dplyr)

### Sets the working directory appropriately to perform data manipulations on "UCI HAR Dataset" folder in same directory

setwd("C:/Users/axp13/Dropbox/Coursera/Data Science/Getting and Cleaning Data/Course Project")

#
# Step 0:  Convert "y_test" data to descriptive labels given in "activity_labels"
#
#                                       ** SATISFIES REQUIREMENT (3) **
#

y_test <- scan("./UCI HAR Dataset/test/y_test.txt")
labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE, sep = " ", stringsAsFactors = FALSE)

label_map <- function(map, data) { # A function to convert activity numbers to activity labels
        n <- 1
        new_label <- vector()
        for (i in data) {
                new_label[n] <- map[i, 2]
                n <- n + 1
        }
        new_label
}

testLabels <- label_map(labels, y_test)


#
# Step 1:  Merge "y_test" column to beginning of "X_test" table (use cbind); this is the activity variable
#

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
X_test <- cbind(testLabels, X_test)

#
# Step 2:  Merge "subject_test" column to beginning of "X_test" table (use cbind); this is the id variable
#

subject_test <- scan("./UCI HAR Dataset/test/subject_test.txt")
X_test <- cbind(subject_test, X_test)

#
# Step 3:  Read in "features" into a data frame; these are the variable names. Create a vector, "vars",
#          from 2nd column of data
#
#                                       ** SATISFIES REQUIREMENT (4) **
#

features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE, stringsAsFactors = FALSE)
vars <- features[,2]

#
# Step 4:  Add two additional elements at beginning of "vars" - i.e. vars[1] <- "id", vars[2] <- "activity"
#
#                                       ** SATISFIES REQUIREMENT (4) **
#

vars <- c("id", "activity", vars)

#
# Step 5:  Use `colnames(X_test) <- vars` to create variables for X_test
#
#                                       ** SATISFIES REQUIREMENT (4) **
#

colnames(X_test) <- vars

#
# Step 6:  Simplify variable names and only keep cols w/ variable names: "id", "activity",
#          and those with "_mean$" and "_std$" in the name
#
#                                       ** SATISFIES REQUIREMENT (4) **
#                                                    and
#                                       ** SATISFIES REQUIREMENT (2) **

### Clean up variable labels by removing all occurences of "()"

colnames(X_test) <- gsub("()", "", colnames(X_test), fixed=TRUE)

### Clean up variable labels by removing all occurences of "-" and replacing w/ "_"

colnames(X_test) <- gsub("-", "_", colnames(X_test), fixed=TRUE)

### Create a tidy dataset based on the "test" data by selecting only the mean and standard deviation summary variables

tidy1 <- X_test %>%
        select(id, activity, ends_with("_mean"), ends_with("_std"))

### Clean up names a bit more by removing repeated occurences of "Body"

colnames(tidy1) <- gsub("BodyBody", "Body", colnames(tidy1), fixed=TRUE)
colnames(tidy1) <- gsub("Mag", "", colnames(tidy1), fixed=TRUE)

#
# Step 7:  Repeat process for "train" data
#

### 0
#                                       ** SATISFIES REQUIREMENT (3) **
#

y_train <- scan("./UCI HAR Dataset/train/y_train.txt")
trainLabels <- label_map(labels, y_train)

### 1

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
X_train <- cbind(trainLabels, X_train)

### 2

subject_train <- scan("./UCI HAR Dataset/train/subject_train.txt")
X_train <- cbind(subject_train, X_train)

### 5
#                                       ** SATISFIES REQUIREMENT (4) **
#

colnames(X_train) <- vars

### 6
#                                       ** SATISFIES REQUIREMENT (4) **
#                                                    and
#                                       ** SATISFIES REQUIREMENT (2) **

##### Clean up variable labels by removing all occurences of "()"

colnames(X_train) <- gsub("()", "", colnames(X_train), fixed=TRUE)

##### Clean up variable labels by removing all occurences of "-" and replacing w/ "_"

colnames(X_train) <- gsub("-", "_", colnames(X_train), fixed=TRUE)

##### Create a tidy dataset based on the "test" data by selecting only the Euclidean norm
##### mean and standard deviation variables

tidy2 <- X_train %>%
         select(id, activity, ends_with("_mean"), ends_with("_std"))

##### Clean up names a bit more by removing repeated occurences of "Body"

colnames(tidy2) <- gsub("BodyBody", "Body", colnames(tidy2), fixed=TRUE)
colnames(tidy2) <- gsub("Mag", "", colnames(tidy2), fixed=TRUE)

# Step 8:  Merge tidy "test" data and tidy "train" data (use rbind)
#
#                                       ** SATISFIES REQUIREMENT (1) **

tidy <- rbind(tidy1, tidy2)

# Step 9:  Group data by: "id" and "activity" using dplyr

tidy <- tbl_df(tidy)
tidy <- tidy %>%
        group_by(id, activity)
        
# Step 10: Summarize the data by computing the average
#
#                                       ** SATISFIES REQUIREMENT (5) **

tidy_summ <- tidy %>%
             summarise_each(c("mean"))

write.table(tidy_summ, file="./tidy_summ.txt", row.name=FALSE)
