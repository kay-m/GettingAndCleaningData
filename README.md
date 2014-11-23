---
title: "Coursera Data Science Specialization - Getting and Cleaning Data - Course Project"
author: "Krishnamoorthy Balaraman"
date: "Saturday, November 22, 2014"
output: html_document
---

## Background:

The goal of this project is to prepare a summary report of the Human Activity Recognition 
Using Smartphones Data Set made available by the Center of Machine Learning & Intelligent
Systems at the University of California, Irvine, USA. Further information regarding the
data set is available at:

1. http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

2. Jorge L. Reyes-Ortiz. " Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine." International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The data set contains measurements and computations based on those measurements made on people wearing a Samsung Galaxy S2 smartphone on their hips. The accelerometer and the gyroscope on the phone was used to take the measurements. The dataset is divided into a training and test data set as is common with all data used for downstream machine learning based analysis. The training and test data are further categorized into summary data of the measurements and the atomic details of the actual measurements themselves. This project uses only the summary data.  The training data includes 7351 measurements while the test data includes 2946 measurements. 

The goal of the project is to combine the training and test data sets, label the variables and perform further roll-up summaries at the activity and the subject level. The output is a tidy data set containing the requested summary. 


## Problem Statement:
*( The following content is reproduced from the Coursera project requirements document. The reproduction is for the    sake of completeness of the document.)*

Prepare and submit an R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Structure of the dataset folder:

This section provides a brief description of the files constituting the dataset. 

   * UCI HAR Dataset 
     1. **features.txt** ( labels for 561 variables representing measurements & 
                       computations based on those measurements.)
                       
     2. **activity_labels.txt** (Descriptive label for activities performed by 
                             subjects when measurements were taken)
                             
     3. **/train**  ( folder representing training data used for building machine
                 learning model by the authors in original work)
                 
         - **/train/X_train.txt**   ( 7351 measurements for each of the 561 variables
                               described in the features.txt file above)
         - **/train/y_train.txt** ( Code for the activity the subject was performing
                             for each of the 7351 measurements above)
         - **/train/subject_train.txt** (Id of the subject/participant for each of 
                                  the 7351 measurements above)
         - **/train/Intertial Signals/** (I am ignoring this folder for this project)

     4.  **/test** ( Folder that is identical to the test folder. This contains
                data for 2946 measurements )
                
                
## High Level Design:

The tidy data set will be prepared in 3 stages:

**Stage 1 : Prepared a Unified Data Set of the training and test data**

1. Combine the columns of :
      a. x_train.txt
      b. y_train.txt
      c. subject_train.txt
      
 2. Repeat step 1 for the test data set
 
 3. Combine the rows of the result of steps 1 and 2 using rbind
 
 4. Assign the column names from features.txt + "activity_name" + "subject"
 
 5. I call this dataset  - "combinedDataset"
 
 6. Replace the activity Ids with the corresponding activity labels using
    the mapping in the file activity_labels.txt  
  
  
**Stage 2 : Extract columns representing mean and standard deviation values**

1. I consider all column names with the term "mean()" in it to represent the mean of some measurement. 

2. Similarly, I consider all column names containing the term "std()" to represent the standard deviation of some measurement. 

3. Create a subset of the combined data set that contains only the mean and standard deviation columns along with the activity labels and subject ids. 
  
  
  
**Stage 3: Prepare and write out a tidy data set**

1. Convert the data frame created in step 3 of stage 2 into a data table and use the lapply(.SD,mean) idiom of data.table to calculate the mean of all the columns grouped by activity followed by subject id. 

2. Write the tidy data set to an output file named tidy_data.txt. This file will be create within the root of the data set folder. 


## Future Enhancements:

This is my first experience with R. Some of the techniques I have used are not computationally efficient. I would be looking at alternative ways to make the algorithm faster along with better memory utilization. We are reading 561 columns from the data files and using only about 80 of them. There should be a way of reading only selected columns from a data file. 

## Acknowledgements:
1. I was stuck on this project trying to understand the data set until I saw the explanation by [David Hood](https://class.coursera.org/getdata-009/forum/profile?user_id=134866) at https://class.coursera.org/getdata-009/forum/thread?thread_id=58#comment-369 . The pictorial representation helped a lot. Thanks David for your wonderful explanation!
2. Thanks are aldo due to the numerous members on stackoverflow for providing answers to the weirdest questions on R syntax and idioms!