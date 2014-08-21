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

This script takes the original data from this study, extracts columns that are mean and standard deviataion columns
of raw data, and then averages each of these variables by subject and activity level.
and writes them out to a text file called tidy.txt

