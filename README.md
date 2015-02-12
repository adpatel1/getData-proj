# getData-proj
This repo contains the files for the course project in the coursera course "Getting and Cleaning Data."

### run_analysis.R
run_anaylsis.R is a script designed to take the data from UCI's Human Activity Recognition using Smartphones dataset and produce a dataset consisting of averages of those features that are means or standard deviations, for each subject and activity.

It does so by:
 - Merging the training and test sets
 - Relabelling the feature measurements and activity labels
 - Extracting the feature measurements which involve either mean or std. 
 - Producing a new dataset consisting of averages by subject and activity
 - Writing the resulting new dataset to a txt file.
 

The script makes the assumption that the data is unzipped into the working directory (i.e., the "UCI HAR Dataset" folder containing the data is in the working directory.)

### Codebook.md
Explains further the contained variables


*February 2015*