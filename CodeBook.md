# Code Book
Description of variables, data and transformations applied in the script.

## Variables:

labelData -> contents of activity_labels.txt
trainData -> contents of X_train.txt
subjectTrainData -> contents of subject_train.txt
activityTrainData -> contents of y_train.txt

testData -> contents of X_test.txt
subjectTestData -> contents of subject_test.txt
activityTestData -> contents of y_test.txt

testDataID -> a two column dataset with subject ID and activity labels
testDataClean -> a 563 column dataset with subject ID, activity labels and the 561 variables measured

trainDataID -> a two column dataset with subject ID and activity labels
trainDataClean -> a 563 column dataset with subject ID, activity labels and the 561 variables measured

completeData -> the combination of trainDataClean and testDataClean arranged by subject ID

outputData -> the saved dataset in which the observations in complete Data are averaged by subject and activity. This is the saved data as explained in README.md

## Transformations:

- Data is loaded from the files location
- activityTestData and activityTrainData are transform to apply a label to each activity rather than the original int
- Dataset columns are labeled accordingly
- All different data loaded is put toghether in a single file arranged by subject ID
- completeData is processed to obtain anaveraged of the observed variables by subject and activity
- File is saved and the function returns
