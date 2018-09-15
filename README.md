# GetNCleanDataProgAsWk4
Programming assignment for the week 4 of Getting and Cleaning Data Coursera course

To run the script:
1. make sure the data is downloaded and unizipped as a "UCI HAR Dataset" directory inside of the repository root
2. in the R console make sure working directory is set to the repository's path
3. run source("run_analysis.R") to execute the data preparation script
4. the script may take some time, at the end of its execution it will create the main output file groupds.txt


Data preparation process executed in the script:
1. read variable names from the features.txt into data.frame, and extract the factor
2. read values of features, activity ids and subject ids of test observations into respective data.frames
3. select only columns of variables with mean or std in the names
4. assogn the selected columns variable names extracted from the file
5. add activity and subject columns to the test observations dataset using data from the respective files
6. repeat the steps 2 to 5 with train observations
7. stack records from test and train datasets
8. read activity label descriptions from file, assign it descriptive variable names
9. merge the main data.frame with activity descriptions by activity ids
10. remove activity id column from the final version of the cleaned dataset
11. write out the dataset into outputds.txt file
12. create summarized data.frame with averages of all numeric values of the variables by each activityname and subject
13. write out the summarized dataset into groupds.txt file
