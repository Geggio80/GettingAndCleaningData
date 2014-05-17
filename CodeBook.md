# Getting and Cleaning Data Course Project: collect, work with, and clean a data set.

## 1. The Original Dataset
The work name is "_Human Activity Recognition Using Smartphones Dataset Version 1.0_" performed by Reyes-Ortiz J.L., Anguita D., Ghio A., Oneto L. in **Smartlab - Non Linear Complex Systems Laboratory** (Genova, Italy). You can go to the [link](www.smartlab.ws) or download it from [data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Summarizing the experiment:

* 30 volunteers within an age bracket of 19-48 years;
* six activities wearing a smartphone;
* data captured from embedded accelerometer and gyroscope;
* 70% of volunteers for the training data, 30% for the test data.


## 2. The Data
There are two principal datasets, **train** and **test**, that have the same features:

* triaxial acceleration from the accelerometer and the estimated body acceleration;
* triaxial angular velocity from the gyroscope;
* a 561-feature vector with time and frequency domain variables;
* its activity label;
* an identifier of the subject who carried out the experiment.

For further information, download the data and read original README.txt or contact _activityrecognition@smartlab.ws_. If you are lazy, there's a renamed version of the original file, README_Original.txt, inside the public [repository](https://github.com/Geggio80/GettingAndCleaningData).


## 3. Work On Data
In order to complete the assigned project, it will be explained every step computed in R environment with RStudio in the **run_analysis.R**:

1. After (external) dowloading the data and putting them in the right workspace, it has been used **_read.table_** to read and load them (data,activities,subjects and features);

2. Using regular expression function **_grep_**, they have been chosen mean and standard deviation data (**ATTENTION:** to be more precise, _meanFreq feature_ is different from the previous data, because it's an average on a frequency component, not a single values mean);

3. Using regular espression function **_sub_**, features names have been cleaned up and adjusted, following the "Camel Case" notation;

4. Chosen data and cleaned up features have been merged together with **_rbind_** and **_cbind_** functions;

5. New dataset has been order for subjects and activities with **_order_** and activieties numbers have been replaced with their names using **_within_** (casting them as factor);

6. **_aggregate_** function has been used for obtaining mean values over all the data, for subject and for activity, in order to obtain the final tidy dataset;

7. the final tidy dataset has been stored in a tab delimited file "Overall_Mean_Data.txt" with **_write.table_**.

