# Course Project for Course Getting and Cleaning Data. Following are the brief steps
Step 1: Create a Directory called Getting_And_Cleaning_Data on the desktop-- this will be the working directory.                            
Step 2: Unzip the Dataset provided in the Project instructions https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
and Store in the directory created above renamed as "Data"
Step 3: Ensure that both folder "Data" and the code run_analysis.R are available in the current working directory. If necessary please set working directory to the directory created in Step 1                                                                   
Step 4: Run the Command Source("run_analysis.R")                                                                                   
Step 5: After completion of Step 4 there will be two files created in the working directory. these files are
    1) oneData_cleandataset.txt --> the clean dataset without mean calculations (file size ~8MB)
    2) oneData_meancleanedSet.txt --> tidy dataset created as per the instructions in step 5 of the project instructions. this
       contains the data with means                                                                                                      
Step 6: Run data <- read.table("oneData_meancleanedSet.txt")
  Since the project goal is to calculate average across the activities and subjects 6 and 30 in total respectively there will be
  180 rows across the 66 mean and std deviation calculating features

