#Codebook

### Source Data
This dataset is based on data from the Human Activity Recognition Using Smartphones Data Set (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

From the description on the original dataset:
> For each record in the dataset it is provided: 
> - Triaxial acceleration from the accelerometer (total acceleration) and the estimated > > body acceleration. 
> - Triaxial Angular velocity from the gyroscope. 
> - A 561-feature vector with time and frequency domain variables. 
> - Its activity label. 
> - An identifier of the subject who carried out the experiment.

The data consisted of records from 30 subjects, divided into training (30% of records) and test (70% of records) sets.  

### Current Dataset
The dataset output by run_analysis.R (see README for details) contains averages of those features from the original dataset which either calculated a mean or a standard deviation, separated out by subject and activity.

Each row of the dataset consists of the following columns:

 - Subject: The number of the subject (1 to 30)
 - Activity: The activity being performed
    - WALKING
    - WALKING_UPSTAIRS
    - WALKING_DOWNSTAIRS
    - SITTING
    - STANDING
    - LAYING
  - the means of the 86 extracted features (tBodyAcc-mean()-X, etc): for details on these features, please see the documentation of the original dataset. Each of these columns is named as in the original dataset.
