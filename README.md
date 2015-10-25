# Getting and Cleaning Data

This is Chris Chan’s repository for the Getting and Cleaning Data project involving the Human Activity Recognition Using Smartphones Data Set from the UC Irvine Machine Learning Repository <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>.

## Methodology

First, we load the following text files into R:

subject_test.txt
subject_train.txt
X_test.txt
X_train.txt
y_test.txt
y_train.txt

These files correspond to the individual participants in the experiment, the 561 feature vector, and activity labels respectively from the test and training sets.

Then we create two data frames for each of the test and training sets containing the 561 features, subject label, and activity label.

Using the rbind function, we merge the two data sets.

Since the feature labels contain special characters, we use the str_replace_all function from the stringr package to make the feature labels more readable.

We also convert the activity labels into actual activity descriptions by loading the activity_labels.txt into R as a data frame, merging that data frame with our data set, and  removing the column with the activity labels.

Using the grep function, we create a vector containing the indices of columns that contains mean, Mean, Std, and std in the string. 

Finally, we subset the data to get our tidy data set and save it as a text file, as specified in the project description.