## Project Purpose
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.


## R script
The detail information is in the run_analysis.R file. Below are all the steps needed to finish the project.

*  download the zip file from the given website and store it in the local directory.
*  read train and test data separately into R and add labels and subjects to them.
*  use rbind function to bind train and test data set together.
*  by using grep function, search for the mean() and std() arguments and extract corresponding measurements.
*  substitue the levels of the labels in the full data set with activity names.
*  to make variable names descriptive, remove all the "()". substitue "t" and "f" which are in the start of the lines with "time" and "frequency". substitue "-mean" and "-std" with "Mean" and "Std".
*  create a data set, use summarise_each function to apply mean function to columns, group by labels and subjects.
*  write the new data set into the directory.


## Variables
* full -- full data set which contains both train and test data.
* labels -- six acticity names
* subjects -- subjects who performed the activity for each window sample.
* g -- the sequence number of variables with "mean()" or "std()".
* sub -- the data set which contains only columns from g and the labels and subjects column.
* newdata -- the MeanData file  