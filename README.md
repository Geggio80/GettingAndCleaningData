## AN OVERVIEW ON THE R CODE

### Repository
There are five files:

1. _run_analysis.R_: R code;
2. _CodeBook.md_: explained steps of the work
3. _README.md_: a brief overview on R code;
4. _README_Original.txt_: original dataset README file;
5. _Overall_Mean_Data.txt_: output of the R code;

### R Scripts
Only one script has been writed for the work: **_run_analysis.R_**.

### Libraries
Only standard libraries from _R Studio_ Version 0.98.501 (_R_ Version 3.0.3 64 bit) have been used.

### Variables
A list of the variables in the script:
* **_train, test_**: original data;
* **_activity_train, activity_test_**: related activities as identification number;
* **_subject_train, subject_test_**: related subjects as identification number;
* **_features_**: list of the experiment features
* **_activities_**: match beetween identification numbers and names;
* **_features_eff_**: chosen features;
* **_index_feat, names_feat_**: features names and indices;
* **_train_data, test_data_**: merging of data with features;
* **_overall_data_**: pre-final dataset;
* **_overall_mean_data_**: final dataset with mean values;

### Input and Output

**Input**: various .txt file previously downloaded;

**Output**: tidy dataset **_Overall_Mean_Data.txt_**;

### How The Script Works
Briefly:

1. Store all the data;
2. Chose and rename the features;
3. Merge data with features;
4. Order the data and label the activities;
5. Extract a new dataset;
6. Write the new dataset on a file;

(for further information, see [CodeBook.md](https://github.com/Geggio80/GettingAndCleaningData/blob/master/CodeBook.md) or another file in the repository)