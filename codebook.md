## File Provides active run book complete with some of the codes and descriptions used in the completion of the project
## Part 1: Variable created as part of the code                                                                                                    
1. trainingData --> data frame created after reading train data (./Data/train/X_train.txt)
2. trainingLabel --> data frame created after reading Label data (./Data/train/y_train.txt)
3. trainingSubject --> Data frame created after reading subject data (./Data/train/subject_train.txt)
4. testData --> data frame created after reading train data (./Data/test/X_test.txt)
5. testLabel --> data frame created after reading train data (./Data/test/y_test.txt)
6. testSubject --> Data frame created after reading subject data (./Data/test/subject_test.txt)
7. featuresData --> data frame created after reading the features file (./Data/features.txt)
8. meanorStdIndices --> Variable created to hold only those measurement features that are either calculating mean or std deviation(use grep)
9. activityData --> Data frame created after reading Activity data descriptors given in Part 3 below.
10. oneDataSet --> merged data set of training and testing data(use rbind on trainingData,testData)
11. oneLabelSet --> Merged label set of training and testing labesl(use rbind on trainingLabel,testLabel)
12. oneSubjectSet --> Merged Subject data set of training and testing subjects(use rbind on trainingSubject,testSubject)
13. cleanedData --> Cleaned data frame created by binding the oneDataset,oneLabelSet,oneSubjectSet data sets
14. resultSet --> an mxn matrix created to store results of the tidy set as per #5 in the project instructions
     this variable is a 180x66 matrix which supports storing all the 30 subjects and 6 activities across 66 measurements

## Part 2: Transformations
 1. transform the values oneLabelSet according to activityData frame under "ACtivity" as column name(using names())
 2. transform the values of oneSubjectSet under"Subject" as column name

## Part 3 Activities used in the project from Activity file
 Activity Code          Activity Description                                                                                     
 1                        WALKING                                                                                                
 2                        WALKING_UPSTAIRS                                                                                             
 3                        WALKING_DOWNSTAIRS                                                                                     
 4                        SITTING                                                                                                
 5                        STANDING                                                                                                     
 6                        LAYING
 
 
