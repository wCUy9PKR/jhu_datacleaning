library(dplyr)

# 0. Downloads data and reads into R
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile="uci.zip", method="curl")
unzip("uci.zip")

meta_data <- "UCI\ HAR\ Dataset"
features <- read.table(file.path(meta_data, "features.txt"), as.is=TRUE)
names(features) <- c("index", "variable_name")

activity_labels <- read.table(file.path(meta_data, "activity_labels.txt"), as.is=TRUE, col.names=c("index", "activity"))

train_data <- "UCI\ HAR\ Dataset/train"
subject_train <- read.table(file.path(train_data, "subject_train.txt"), col.names="subject")
X_train <- read.table(file.path(train_data, "X_train.txt"))
y_train <- read.table(file.path(train_data, "y_train.txt"), col.names="activity")

test_data <- "UCI\ HAR\ Dataset/test"
subject_test <- read.table(file.path(test_data, "subject_test.txt"), col.names="subject")
X_test <- read.table(file.path(test_data, "X_test.txt"))
y_test <- read.table(file.path(test_data, "y_test.txt"), col.names="activity")

# 1. Merges the training and the test sets to create one data set.
X <- bind_rows(X_train, X_test)
y <- bind_rows(y_train, y_test)
subject <- bind_rows(subject_train, subject_test)
rm(list=ls(pattern="train|test|data|url"))

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 4. Appropriately labels the data set with descriptive variable names. 
mean_std_vars <- grep("mean\\(|std\\(", features$variable_name)
X = select(X, mean_std_vars)
names(X) = features$variable_name[mean_std_vars]

# 3. Uses descriptive activity names to name the activities in the data set
activity_lookup = activity_labels$activity
y = mutate(y, activity=activity_lookup[activity])
tidy_har <- bind_cols(subject, X, y)

# 5. From the data set in step 4, creates a second, independent tidy data set with
# the average of each variable for each activity and each subject.
tidy_har_mean <- tidy_har %>%
  group_by(subject, activity) %>%
  summarize_each(funs(mean))