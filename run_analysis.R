# Coursera - Getting and Cleaning Data (Course Project)

# A brief explpnation of the data set used for this project:
# The data is borrowed from UCI Machine Learning Repository 
# Reference:
#   Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and 
#   Jorge L. Reyes-Ortiz. " Human Activity Recognition on Smartphones using
#   a Multiclass Hardware-Friendly Support Vector Machine." 
#   International Workshop of Ambient Assisted Living (IWAAL 2012).
#   Vitoria-Gasteiz, Spain. Dec 2012

# Structure of the data files folder
# -- UCI HAR Dataset 
#     -- features.txt ( labels for 561 variables representing measurements & 
#                       computations based on those measurements.)
#
#     -- activity_labels.txt (Descriptive label for activities performed by 
#                             subjects when measurements were taken)
#
#     -- /train  ( folder representing training data used for building machine
#                 learnind model by the authors in original work)
# 
#     -- /train/X_train.txt   ( 7351 measurements for each of the 561 variables
#                               described in the features.txt file above)
#
#     -- /train/subject_train.txt (Id of the subject/participant for each of 
#                                  the 7351 measurements above)
#     -- /train/y_train.txt ( Code for the activity the subject was performing
#                             for each of the 7351 measurements above)
#
#     -- /train/Intertial Signals/ (I am ignoring this folder for this project)
#     -- /test ( Folder that is identical to the test folder. This contains
#                data for 2946 measurements )

# Approach to build a unified data set:
#  1. Combine the columns of :  
#        a. x_train.txt
#        b. y_train.txt
#        c. subject_train.txt
#  2. Repeat step 1 for the test data set
#  3. Combine the rows of the result of steps 1 and 2. (rbind)
#  4. Assign the column names from features.txt + "activity_name" + "subject"
#  5. I call this dataset  - "combinedDataset"

# Extracting columns representing mean values
# I consider all column names with the term "mean()" in it to represent
# the mean of some measurement. 
# Extracting columns representing standard deviation values
# I consider all column names containing the term "std()" to represent
# the standard deviation of some measurement. 


# ----------------------- STAGE 1 : ---------------------------------------
# Goal : Prepare a combined data set and convert activity code to labels.
#--------------------------------------------------------------------------

# Keeping the root folder name of the data set configurable. Change this
# according to the folder name on your system
datasetRoot <- "UCI HAR Dataset/"
trainDataFileNames <- c("train/X_train.txt",
                    "train/y_train.txt",
                    "train/subject_train.txt")
# Add the dataset root suffix
trainDataFileNames <- sapply(datasetRoot,paste,trainDataFileNames,
                             sep="",USE.NAMES=FALSE)

names(trainDataFileNames) <- c("Measurements","ActivityCode","SubjectID")


testDataFileNames <- c("test/X_test.txt",
                        "test/y_test.txt",
                        "test/subject_test.txt")
# Add the dataset root suffix
testDataFileNames <- sapply(datasetRoot,paste,testDataFileNames,
                            sep="",USE.NAMES=FALSE)

names(testDataFileNames) <- c("Measurements","ActivityCode","SubjectID")


# Creating combined training and test data sets. 
# These will then be comined using rbind.
combinedTrainData <- 
    cbind (read.delim(trainDataFileNames["Measurements"],sep="",header=FALSE),
           read.delim(trainDataFileNames["ActivityCode"],sep="",header=FALSE,strip.white=TRUE),
           read.delim(trainDataFileNames["SubjectID"]   ,sep="",header=FALSE))

combinedTestData <- 
    cbind(read.delim(testDataFileNames["Measurements"],sep="",header=FALSE),
          read.delim(testDataFileNames["ActivityCode"],sep="",header=FALSE,strip.white=TRUE),
          read.delim(testDataFileNames["SubjectID"]   ,sep="",header=FALSE))

combinedDataset <- rbind(combinedTrainData,combinedTestData)

# Assign column names
# The first 561 columns come from the features.txt file. The remaining two are
# "Activity" and "SubjectID"
featureCols <- read.delim(paste(datasetRoot,"features.txt",sep=""),
                          sep="",header=FALSE,stringsAsFactors=FALSE)
names(combinedDataset) <- c(featureCols$V2,"Activity","SubjectID") 

# Replace activity code with activity Name:
# Brute force looping:
for (i in seq_along(1:length(combinedDataset$Activity)))
{
  if (combinedDataset$Activity[i] == "1")
    combinedDataset$Activity[i] <- "WALKING"
  else if (combinedDataset$Activity[i] == "2")
    combinedDataset$Activity[i] <- "WALKING_UPSTAIRS"
  else if (combinedDataset$Activity[i] == "3")
    combinedDataset$Activity[i] <- "WALKING_DOWNSTAIRS"
  else if (combinedDataset$Activity[i] == "4")
    combinedDataset$Activity[i] <- "SITTING"
  else if (combinedDataset$Activity[i] == "5")
    combinedDataset$Activity[i] <- "STANDING"
  else if (combinedDataset$Activity[i] == "6")
    combinedDataset$Activity[i] <- "LAYING"
  else 
  {
    print ("Error!")
    print (combinedDataset$Activity)
    return(0)
  }
}

# Cleanup unwanted data variables
rm(combinedTrainData,combinedTestData,trainDataFileNames,testDataFileNames)
rm(featureCols,i)

# ----------------------- STAGE 2 : ---------------------------------------
# Goal: Extract columns representing mean() and standard deviation values.
#--------------------------------------------------------------------------

# I am considering columns names with the substring "mean()" and "std()" 
# in the name

columnsWithMeanValues <- grep("mean()",names(combinedDataset),value=TRUE)
columnsWithStdValues <- grep("std()",names(combinedDataset),value=TRUE)

columnsWithMeanAndStdValues <- sort(c(columnsWithMeanValues,columnsWithStdValues))

# Subset combined Data Set to extract only the columns for mean and
# Standard Deviation
combinedDataset_subset <- combinedDataset[,c(columnsWithMeanAndStdValues,"Activity","SubjectID")]

# cleanup unwanted data variables
rm(columnsWithMeanValues,columnsWithStdValues,columnsWithMeanAndStdValues)
rm(combinedDataset)

# ----------------------- STAGE 3 : ---------------------------------------
# Goal: Prepare and write out a tidy data set 
#--------------------------------------------------------------------------

# Using a data table to compute the means easily
library("data.table")
combinedDataTable_subset <- data.table(combinedDataset_subset)
tidy_data <- combinedDataTable_subset[,lapply(.SD,mean),by = c("Activity","SubjectID")] 

# cleanup unwanted data variables
rm(combinedDataset_subset,combinedDataTable_subset)

# Write Tidy Data Set to file "tidy_data.txt"
filePath = paste(datasetRoot,"tidy_data.txt")
write.table(tidy_data,filePath,row.names=FALSE)

rm(tidy_data,datasetRoot)

