library(stringr)
# Reads all the necessary text files
subjecttest <- read.table("test/subject_test.txt")
subjecttrain <- read.table("train/subject_train.txt")
Xtest <- read.table("test/X_test.txt")
Xtrain <- read.table("train/X_train.txt")
ytest <- read.table("test/y_test.txt")
ytrain <- read.table("train/y_train.txt")
features <- read.table("features.txt")
activityNames <- read.table("activity_labels.txt")

# Merges the training and test sets
testset <- data.frame(Xtest,subjecttest,ytest)
trainset <- data.frame(Xtrain,subjecttrain,ytrain)
dataset <- rbind(testset,trainset)

# Cleans up the feature names and labels dataset with descriptive variable names
featureNames <- sapply(features, function(x) str_replace_all(x, "[[:punct:]]", ""))[,2]
names(dataset) <- c(featureNames,"Subject","Activity.Code")

# Uses descriptive activity names
names(activityNames) <- c("Activity.Code","Activity")
descActivity <- merge(dataset, activityNames, by = "Activity.Code")
newdataset <- descActivity[,2:564]

# Finds columns with mean and std in the string
neededCols <- grep(".*mean.*|.*std.*|.*Mean.*|.*Std.*  ", featureNames)

# Tidy Data
tidydata <- newdataset[,c(neededCols,562,563)]
write.table(tidydata,"tidydata.txt",sep="\t")