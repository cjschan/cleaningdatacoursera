Description of Data Set

Human Activity Recognition Using Smartphones Data Set <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>. A full description of the data set can be found by clicking the above link. The experiment involved measuring the activity of 30 individuals within the ages of 19 and 48 years old using the Samsung Galaxy S II smartphone. The original data set contains 10299 observations. Attributes include a 561-feature vector, subject, and activity. The dataset is divided into two parts: 70% training set and 30% test set.

Goal

The goal of this project is to merge six text files into a single data frame with appropriate descriptive labels and extract features or columns that give the mean and standard deviation.

Attributes/Columns

There are 563 attributes. The first 561 attributes are measurements from the accelerometer and gyroscope of the Samsung Galaxy S II Smartphone. A complete list of the attributes can be found in the link above. Attributes that begin with t are time (measured in seconds), while attributes that begin with f are frequency (measured in Hertz). The last two attributes are the subject (1-30 corresponding to an individual in the experiment) and activity label (1-6 corresponding to walking, walking upstairs, walking downstairs, sitting, standing, and laying respectively).

Methodology

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
