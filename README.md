# Course Project
Getting and Cleaning Data
Coursera Data Science Specialty
John Hopkins University

## Requirements
This script was run on an EC2 t2.large instance with the following installed:

* Ubuntu Trusty version 14.04 64-bit
* R version 3.2.2
* dplyr version 0.4.3

## Files
* run_analysis.R
* tidy_har_mean.txt
* tidy_har_mean_codebook.md
* README.md

## Directions
Save run_analysis.R file to a new directory. From the command line run `Rscript run_analysis.R` this will download the dataset from the UCI Repository, process the data, and save the means of the variables by subject/activity to a file called `tidy_har_mean.txt`.  The codebook for the tidy_har_mean.txt file is called `tidy_har_mean_codebook.md`.

## Special Thanks
I would like to thank the R Core team and Hadley Wickham for creating such useful software for data analysis.

R Core Team (2015). R: A language and environment for statistical computing.
R Foundation for Statistical Computing, Vienna, Austria.
URL https://www.R-project.org/.

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

[id1]: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
[id2]: http://archive.ics.uci.edu/ml/index.html