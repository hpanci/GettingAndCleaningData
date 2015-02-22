##This code is an exercise in tidying data, for the course Getting and Cleaning Data through Johns Hopkins. Created 2/22/15. Overall goal to read data collected from accelerometers from users with Samsung Galaxy S smartphones and find average and standard deviation of acceleration for each subject and 6 different activities conducted while using phones.

##Step 1: Merge training and testing sets of data to create one dataset.

#read training and testing data
a <- read.table("train/X_train.txt")
b <- read.table("test/X_test.txt")
#merge data
X<- rbind(a,b)

#read training and testing data
a<-read.table("train/subject_train.txt")
b<-read.table("test/subject_test.txt")
#merge data
S<-rbind(a,b)

#read training and testing data
a<- read.table("train/Y_train.txt")
b<- read.table("test/Y_test.txt")
#merge data
Y<- rbind(a,b)

#Step 2: Extract measurements of mean and standard deviation for each measurement

#read table with feature names
features <- read.table("features.txt")
#extract all measurements containing a mean or standard deviation (std)
features_to_analyze <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
#read dataset to obtain column numbers containing mean or std
features_to_analyze
# extract only those column numbers of X
X <- X[, c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227,228,240,241,253,254,266:271,345:350,424:429,503,504,516,517,529,530,542,543)]
#apply names of feature table to X dataset
names(X)<- features[features_to_analyze,2]

## Step 3: Use activity names to name activities in dataset
#read activities table
activities <- read.table("activity_labels.txt")
#change activity names to lowercase and without an underscore - clean them up
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
#apply names of activities to dataset Y
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"

## Step 4: Label data with variable names
#add subject to dataset
names(S) <- "subject"
#merge all three into one final dataset
final_dataset <- cbind(S, Y, X)
#create txt file of final data
write.table(final_dataset, "merged_clean_data.txt")


##Step 5: Create a new dataset with the average of each variable by activity and subject
#engage package dplyr
library(dplyr)

#tell R dataset is being manipulated in dplyr
data <- tbl_df(final_dataset)
##averages each variable by subject and activity
means <- data %>%
        group_by(subject, activity) %>%
        summarise_each(funs(mean))
##writes output table called tidy_data.txt to be shared with other users
write.table(means, "tidy_data.txt", row.name = FALSE)
