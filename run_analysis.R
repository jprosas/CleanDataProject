run_analysis <- function() {
  ##Load dplyr library as some features will be used
  library(dplyr)
  ##Load the data from the computer. The "UCI HAR Dataset" folder should be within
  ##a folder "data" inside the Working Directory.
  labelData<-read.table("./UCI HAR Dataset/activity_labels.txt")
  trainData<-read.table("./UCI HAR Dataset/train/X_train.txt")
  subjectTrainData<-read.table("./UCI HAR Dataset/train/subject_train.txt")
  activityTrainData<-read.table("./UCI HAR Dataset/train/y_train.txt")
  testData<-read.table("./UCI HAR Dataset/test/X_test.txt")
  subjectTestData<-read.table("./UCI HAR Dataset/test/subject_test.txt")
  activityTestData<-read.table("./UCI HAR Dataset/test/y_test.txt")  
  
  ##Replace de integer activity ID for the corresponding labels
  activityTestData[activityTestData==1] <- "WALKING"
  activityTestData[activityTestData==2] <- "WALKING_UPSTAIRS"
  activityTestData[activityTestData==3] <- "WALKING_DOWNSTAIRS"
  activityTestData[activityTestData==4] <- "SITTING"
  activityTestData[activityTestData==5] <- "STANDING"
  activityTestData[activityTestData==6] <- "LAYING"
  activityTrainData[activityTrainData==1] <- "WALKING"
  activityTrainData[activityTrainData==2] <- "WALKING_UPSTAIRS"
  activityTrainData[activityTrainData==3] <- "WALKING_DOWNSTAIRS"
  activityTrainData[activityTrainData==4] <- "SITTING"
  activityTrainData[activityTrainData==5] <- "STANDING"
  activityTrainData[activityTrainData==6] <- "LAYING"  
  
  ##Properly label columns
  colnames(subjectTestData)<-c("Subject_ID")
  colnames(subjectTrainData)<-c("Subject_ID")
  colnames(activityTestData)<-c("Activity")
  colnames(activityTrainData)<-c("Activity")
  
  ##Join all test and train data in two clean data frames
  testDataID<-data.frame(subjectTestData,activityTestData)
  testDataClean<-data.frame(testDataID,testData)
  trainDataID<-data.frame(subjectTrainData,activityTrainData)
  trainDataClean<-data.frame(trainDataID,trainData)  
  
  ##Join the clean test and train data frames into a complete set and arrange
  ##by subject ID
  completeData<-arrange(rbind(testDataClean,trainDataClean),Subject_ID)
  
  ##Group data by subjectID and Activity and take the mean of those observations
  outputData<-aggregate(.~Subject_ID+Activity, data=completeData, mean)
  ##Save dataset as outputDataset.txt
  write.table(outputData, "./UCI HAR Dataset/outputDataset.txt")
  
  return()
}
