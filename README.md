get-and-clean---project
=======================

This repository is for my get and clean coursera project and contains the following files

codebook - which describes the nature of the data and the describes the name, location, and data for each variable in the
dataset produced by the R script.

run_analysis.R  - an R script that merges together a training data set and test data set that 
were generated in an experiment for Human Activity Recognition using sensors from smartphones.  The original data
comes from:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

This script works as follows:
1. the raw data files from the aforementioned study should be in the working directory
2. the script reads the x\_train.txt, y\_train.txt, subject\_train.txt, x\_test.txt, y\_test.txt, subject_test.txt files
3. names the variables in the x\train.txt data with the names supplied in the "features.txt" file and then
4. simplifies and expands these variable names to be more descriptive, all lower case and removes extra characters
5. recodes the activities from numeric codes to descriptive names like "walking, standing, etc.."
6. takes the original data from this study, extracts columns that are indicated as mean and standard deviataion columns


