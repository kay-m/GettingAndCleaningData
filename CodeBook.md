---
title: "Code Book"
author: "Krishnamoorthy Balaraman"
date: "Sunday, November 23, 2014"
output: html_document
---

## Code Book for the tidy data set created as part of the course project for the Getting and Cleaning data course

## Source of Data:

The raw data for this project was provided by the the Center of Machine Learning & Intelligent Systems at the University of California, Irvine, USA. The data was obtained from the following location:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The following links provide a background to the project for which the data was originally captured:

1. http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

2. Jorge L. Reyes-Ortiz. " Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine." International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The data set contains measurements and computations based on those measurements made on people wearing a Samsung Galaxy S2 smartphone on their hips. The accelerometer and the gyroscope on the phone was used to take the measurements. The dataset is divided into a training and test data set as is common with all data used for downstream machine learning based analysis. The training and test data are further categorized into summary data of the measurements and the atomic details of the actual measurements themselves. This project uses only the summary data.  The training data includes 7351 measurements while the test data includes 2946 measurements.

## Transformations done to the raw data:

1. The columns of x_train.txt, y_train.txt and and subject_train.txt were combined to form a single data set.
2. Similarly, the columns of x_test,y_test and subject_test were combined.
3. The data sets generated in steps 1 and 2 were combined row-wise. 
4. The acitivity IDs (obtained from the y_train and y_test files) were replaced with the activity name using the mapping provided in the activity_labels.txt file. 
5. A **subset** of the data generated in step 5 was created by extracting only the columns representing the mean and standard deviation variables (column names containing the phrase mean() and std()) along with the activity names and subject IDs. 
6. The average of the each columns was computed after grouping by rows by activity name followed by the subject ID. This provided a summary of the average of the mean and std values for each activity performed by each subject. This summary data is the final output (tidy data).

## Data Dictionary - Tidy Data Set
The data set consists of 180 records. These are divided across 6 activities performed by 30 subjects (30 x 6 = 180). All values reported are the mean of all the measurements taken during the period the subjects participated in the study.   
**Activity&nbsp;&nbsp;&nbsp;6-18  **  
&nbsp;&nbsp;_Activity being performed by subject when measurement was taken_    
&nbsp;&nbsp;&nbsp;&nbsp;WALKING  
&nbsp;&nbsp;&nbsp;&nbsp;WALKING_UPSTAIRS  
&nbsp;&nbsp;&nbsp;&nbsp;WALKING_DOWNSTAIRS  
&nbsp;&nbsp;&nbsp;&nbsp;SITTING  
&nbsp;&nbsp;&nbsp;&nbsp;STANDING  
&nbsp;&nbsp;&nbsp;&nbsp;LAYING  

<br/>
**SubjectID&nbsp;&nbsp;&nbsp;1-2  **  
&nbsp;&nbsp;_ID of the subject performing the activity_    
&nbsp;&nbsp; Values - 1 - 30

**All of the following variables represent the mean of all measurements for each activity performed by each subject**
**All values fractional and are in the range 0 - 1**  

<br/>
**fBodyAcc-mean()-X&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the Fast Fourier Transform signal value for the total body acceleration along the X-axis.   

<br/>
**fBodyAcc-mean()-Y&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the Fast Fourier Transform signal value for the total body acceleration along the y-axis.  

<br/>
**fBodyAcc-mean()-Z&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the Fast Fourier Transform signal value for the total body acceleartion along the z-axis.  

<br/>
**fBodyAcc-meanFreq()-X&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the Weighted average of the frequency components of the fast Fourier transform signal for total body acceleration along the X-axis.  

<br/>
**fBodyAcc-meanFreq()-Y&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the Weighted average of the frequency components of the fast Fourier transform signal of total body acceleration along the Y-axis.  
  
<br/>
**fBodyAcc-meanFreq()-Z&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the Weighted average of the frequency components of the fast Fourier transform signal of total body acceleration along the Z-axis.    

<br/>
**fBodyAcc-std()-X&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the standard deviation of the fast Fourier Transform signal for total body acceleration along the X-axis.    

<br/>
**fBodyAcc-std()-Y&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the standard deviation of the fast Fourier Transform signal for total body acceleration along the Y-axis.    

<br/>
**fBodyAcc-std()-Z&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the standard deviation of the fast Fourier Transform signal for total body acceleration along the Z-axis.  

<br/>
**fBodyAccJerk-mean()-X&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the jerk signal calculated using the fast Fourier Transform signal for total body acceleration along the X-axis.  

<br/>
**fBodyAccJerk-mean()-Y&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the jerk signal calculated using the fast Fourier Transform signal for total body acceleration along the Y-axis.    

<br/>
**fBodyAccJerk-mean()-Z&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the jerk signal calculated using the fast Fourier Transform signal for total body acceleration along the Z-axis.    

<br/>
**fBodyAccJerk-meanFreq()-X&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the weighted averages of jerk signal. The jerk signal is calculated from the fast Fourier Transform signal for total body acceleration along the X-axis.  

<br/>
**fBodyAccJerk-meanFreq()-Y&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the weighted averages of jerk signal. The jerk signal is calculated from the fast Fourier Transform signal for total body acceleration along the Y-axis.  

<br/>
**fBodyAccJerk-meanFreq()-Z&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the weighted averages of jerk signal. The jerk signal is calculated from the fast Fourier Transform signal for total body acceleration along the Z-axis.  

<br/>
**fBodyAccJerk-std()-X&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the standard deviation of the jerk signal along the X-axis.The jerk signal is calculated from the fast Fourier Transform signal for total body acceleration along the X-axis.  

<br/>
**fBodyAccJerk-std()-Y&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the standard deviation of the jerk signal along the Y-axis.The jerk signal is calculated from the fast Fourier Transform signal for total body acceleration along the Y-axis.  

<br/>
**fBodyAccJerk-std()-Z&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the standard deviation of the jerk signal along the Z-axis.The jerk signal is calculated from the fast Fourier Transform signal for total body acceleration along the Z-axis.  

<br/>
**fBodyAccMag-mean()&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the magnitude of the signal calculated using the Euclidean norm. The signal is the fast Fourier transform of the total body acceleration across all three dimesions(axis).    

<br/>
**fBodyAccMag-meanFreq()&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the weighted averages of magnitude of the signal calculated using the Euclidean norm. The signal is the fast Fourier transform of the total body acceleration across all three dimesions(axis).      

<br/>
**fBodyAccMag-std()&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the standard deviation of the magnitude of the signal calculated using the Euclidean norm. The signal is the fast Fourier transform of the total body acceleration across all three dimesions(axis).      

<br/>
**fBodyBodyAccJerkMag-mean()&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the magnitude of the jerk signal calculated using the Euclidean norm. The jerk signal is calculated from the fast Fourier Transform signal for total body acceleration across all three dimesions(axis).    

<br/>
**fBodyBodyAccJerkMag-meanFreq()&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the weighted averages of magnitude of the jerk signal calculated using the Euclidean norm. The jerk signal is calculated from the fast Fourier Transform signal for total body acceleration across all three dimesions(axis).      

<br/>
**fBodyBodyAccJerkMag-std()&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the standard deviation of the magnitude of the jerk signal calculated using the Euclidean norm. The jerk signal is calculated from the fast Fourier Transform signal for total body acceleration across all three dimesions(axis).      

<br/>
**fBodyGyroMag-mean()&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the magnitude of the signal calculated using the Euclidean norm. The signal is the fast Fourier transform of the gyroscope signal across all three dimesions(axis).    

<br/>
**fBodyBodyGyroMag-meanFreq()&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the weighted averages of magnitude of the signal calculated using the Euclidean norm. The signal is the fast Fourier transform of the gyroscope signal across all three dimesions(axis).      

<br/>
**fBodyBodyGyroMag-std()&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the standard deviation of the magnitude of the signal calculated using the Euclidean norm. The signal is the fast Fourier transform of the gyroscope signal across all three dimesions(axis).  

<br/>
**fBodyBodyGyroJerkMag-mean()&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the magnitude of the jerk signal calculated using the Euclidean norm. The jerk signal is calculated from the fast Fourier Transform signal for gyroscope signal across all three dimesions(axis).    

<br/>
**fBodyBodyGyroJerkMag-meanFreq()&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the weighted averages of magnitude of the jerk signal calculated using the Euclidean norm. The jerk signal is calculated from the fast Fourier Transform signal for gyroscope signal across all three dimesions(axis).      

<br/>
**fBodyBodyGyroJerkMag-std()&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the standard deviation of the magnitude of the jerk signal calculated using the Euclidean norm. The jerk signal is calculated from the fast Fourier Transform signal for gyroscope signal across all three dimesions(axis).

<br/>
**fBodyGyro-mean()-Y&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the Fast Fourier Transform signal value for the gyroscope signal along the y-axis.  

<br/>
**fBodyGyro-mean()-Z&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the Fast Fourier Transform signal value for the gyroscope signal along the z-axis.  

<br/>
**fBodyGyro-meanFreq()-X&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the Weighted average of the frequency components of the fast Fourier transform signal for gyroscope signal along the X-axis.  

<br/>
**fBodyGyro-meanFreq()-Y&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the Weighted average of the frequency components of the fast Fourier transform signal of gyroscope signal along the Y-axis.  
  
<br/>
**fBodyGyro-meanFreq()-Z&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the Weighted average of the frequency components of the fast Fourier transform signal of gyroscope signal along the Z-axis.    

<br/>
**fBodyGyro-std()-X&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the standard deviation of the fast Fourier Transform signal for gyroscope signal along the X-axis.    

<br/>
**fBodyGyro-std()-Y&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the standard deviation of the fast Fourier Transform signal for gyroscope signal along the Y-axis.    

<br/>
**fBodyGyro-std()-Z&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the standard deviation of the fast Fourier Transform signal for gyroscope signal along the Z-axis.  

<br/>
**tbodyAcc-mean()-X&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the  total body acceleration along the X-axis.   

<br/>
**tbodyAcc-mean()-Y&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the  total body acceleration along the y-axis.  

<br/>
**tbodyAcc-mean()-Z&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the  total body acceleartion along the z-axis. 

<br/>
**tbodyAcc-std()-X&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the standard deviation of the total body acceleration along the X-axis.    

<br/>
**tbodyAcc-std()-Y&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the standard deviation of the total body acceleration along the Y-axis.    

<br/>
**tbodyAcc-std()-Z&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the standard deviation of the total body acceleration along the Z-axis.  

<br/>
**tbodyAccJerk-mean()-X&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the jerk signal calculated for total body acceleration along the X-axis.  

<br/>
**tbodyAccJerk-mean()-Y&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the jerk signal calculated for total body acceleration along the Y-axis.    

<br/>
**tbodyAccJerk-mean()-Z&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the jerk signal calculated for total body acceleration along the Z-axis. 

<br/>
**tbodyAccJerk-std()-X&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the standard deviation of the jerk signal along the X-axis.The jerk signal is calculated from the total body acceleration along the X-axis.  

<br/>
**tbodyAccJerk-std()-Y&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the standard deviation of the jerk signal along the Y-axis.The jerk signal is calculated from the total body acceleration along the Y-axis.  

<br/>
**tbodyAccJerk-std()-Z&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the standard deviation of the jerk signal along the Z-axis.The jerk signal is calculated from the total body acceleration along the Z-axis.  

<br/>
**tBodyAccJerkMag-mean()&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the magnitude of the jerk signal calculated using the Euclidean norm. The jerk signal is calculated from the the total body acceleration across all three dimesions(axis).   

<br/>
**tBodyAccJerkMag-std()&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the standard deviation of the magnitude of the jerk signal calculated using the Euclidean norm. The jerk signal is calculated from the  total body acceleration across all three dimesions(axis).  

<br/>
**tBodyAccMag-mean()&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the magnitude of the signal calculated using the Euclidean norm. The signal is the total body acceleration across all three dimesions(axis).    

<br/>
**tBodyAccMag-std()&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the standard deviation of the magnitude of the signal calculated using the Euclidean norm. The signal is the total body acceleration across all three dimesions(axis). 

<br/>
**tbodyGyro-mean()-X&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the  gyroscope signal along the X-axis.   

<br/>
**tbodyGyro-mean()-Y&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the  gyroscope signal along the y-axis.  

<br/>
**tbodyGyro-mean()-Z&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the  total body acceleartion along the z-axis. 

<br/>
**tbodyGyro-std()-X&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the standard deviation of the gyroscope signal along the X-axis.    

<br/>
**tbodyGyro-std()-Y&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the standard deviation of the gyroscope signal along the Y-axis.    

<br/>
**tbodyGyro-std()-Z&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the standard deviation of the gyroscope signal along the Z-axis.  

<br/>
**tbodyGyroJerk-mean()-X&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the jerk signal calculated for gyroscope signal along the X-axis.  

<br/>
**tbodyGyroJerk-mean()-Y&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the jerk signal calculated for gyroscope signal along the Y-axis.    

<br/>
**tbodyGyroJerk-mean()-Z&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the jerk signal calculated for gyroscope signal along the Z-axis.  
   
<br/>
**tBodyGyroMag-mean()&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the magnitude of the signal calculated using the Euclidean norm. The signal is the gyroscope signal across all three dimesions(axis).    

<br/>
**tBodyGyroMag-std()&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the standard deviation of the magnitude of the signal calculated using the Euclidean norm. The signal is the gyroscope signal across all three dimesions(axis). 

<br/>
**tGravityAcc-mean()-X&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the gravity acceleration along the X-axis.   

<br/>
**tGravityAcc-mean()-Y&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the gravity acceleration along the y-axis.  

<br/>
**tGravityAcc-mean()-Z&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the gravity acceleartion along the z-axis. 

<br/>
**tGravityAcc-std()-X&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the standard deviation of the gravity acceleration along the X-axis.    

<br/>
**tGravityAcc-std()-Y&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the standard deviation of the gravity acceleration along the Y-axis.    

<br/>
**tGravityAcc-std()-Z&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the standard deviation of the gravity acceleration along the Z-axis.   

<br/>
**tGravityAccMag-mean()&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the magnitude of the signal calculated using the Euclidean norm. The signal is the gravity acceleration across all three dimesions(axis).    

<br/>
**tGravityAccMag-std()&nbsp;&nbsp;&nbsp;18  **  
&nbsp;&nbsp;Mean of the standard deviation of the magnitude of the signal calculated using the Euclidean norm. The signal is the gravity acceleration across all three dimesions(axis). 
