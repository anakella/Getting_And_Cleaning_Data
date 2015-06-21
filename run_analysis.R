# Part1. Join/Merge the two datasets(test,Train) to Create one final dataset to be used in further manipulations
# merged data sets to be called oneDataSet,oneLabelSet,oneSubjectSet
# (c) anakella 2014
# set working directory setwd("~/Desktop/Coursera/Getting_And_Cleaning_Data/")
trainingData <- read.table("./Data/train/X_train.txt")
trainingLabel <- read.table("./Data/train/y_train.txt")
trainingSubject <- read.table("./Data/train/subject_train.txt")
testData <- read.table("./Data/test/X_test.txt")
testLabel <- read.table("./Data/test/y_test.txt") 
testSubject <- read.table("./Data/test/subject_test.txt")
oneDataSet <- rbind(trainingData, testData)
oneLabelSet <- rbind(trainingLabel, testLabel)
oneSubjectSet <- rbind(trainingSubject, testSubject)

# Check the dimensions of each of the above data frame
dim(trainingData) #7352x561
dim(trainingLabel) #7352x1
dim(trainingSubject) #7352x1
dim(testData) #2947x561
dim(testLabel) #2947x1
dim(testSubject) #2947x1
dim(oneDataSet) #10299x561
dim(oneLabelSet) #10299x1
dim(oneSubjectSet) #10299x1

# Part2. Extract only those Measurments that are calculating Mean or Standard deviation

featuresData <- read.table("./Data/features.txt")
dim(featuresData)  # 561*2
# finds the measurment which are either MEan or Std Deviation
meanorStdIndices <- grep("mean\\(\\)|std\\(\\)", featuresData[, 2]) 
length(meanorStdIndices) # 66
oneDataSet <- oneDataSet[, meanorStdIndices] 
dim(oneDataSet) # 10299*66
names(oneDataSet) <- gsub("\\(\\)", "", featuresData[meanorStdIndices, 2]) # remove "()"

# Part3. Uses descriptive activity names to name the activities in the data set
activityData <- read.table("./Data/activity_labels.txt")
activityData[, 2] <- gsub("_", "", activityData[, 2])
#activityData <- activityData[,2]
activityLabel <- activityData[oneLabelSet[, 1], 2]
oneLabelSet[, 1] <- activityLabel
names(oneLabelSet) <- "Activity"

# Part4. Appropriately labels the data set with descriptive activity names. 
# Create clean data set and write to file oneData_cleandataset.txt
names(oneSubjectSet) <- "Subject"
cleanedData <- cbind(oneSubjectSet, oneLabelSet, oneDataSet)
dim(cleanedData) # 10299*68
write.table(cleanedData, "oneData_cleandataset.txt") # write out the 1st clean dataset

# Part5. Creates a second, independent tidy data set with the average of 
# each variable for each activity and each subject.  and write to file "oneData_meancleanedSet.txt"
subjectLength <- length(table(oneSubjectSet)) # 30
activityLength <- dim(activityData)[1] # 6
columnLength <- dim(cleanedData)[2]
resultSet <- matrix(NA, nrow=subjectLength*activityLength, ncol=columnLength) 
resultSet <- as.data.frame(resultSet)
colnames(resultSet) <- colnames(cleanedData)
row <- 1
for(i in 1:subjectLength) {
    for(j in 1:activityLength) {
        resultSet[row, 1] <- sort(unique(oneSubjectSet)[, 1])[i]
        resultSet[row, 2] <- activityData[j, 2]
        bool1 <- i == cleanedData$Subject
        bool2 <- activityData[j, 2] == cleanedData$Activity
        resultSet[row, 3:columnLength] <- colMeans(cleanedData[bool1&bool2, 3:columnLength])
        row <- row + 1
    }
}
head(resultSet)
write.table(resultSet, "oneData_meancleanedSet.txt") # write out the 2nd clean dataset with means
