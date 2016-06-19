---
title: "Getting and Cleaning Data Course Project"
author: "Shanyun Chu"
date: "19 June 2016"
output: html_document
---



## R Markdown

This file explains the way run_analysis.R works. Summary and information about variables can be found in CodeBook.md.

## Notice

This R script needs 'dplyr' package. If you do not have it, please install prior to running this file.

## Instructions

1. Download run_analysis.R from this repository.

2. Open the script in Rstudio and run the code. The step-by-step explanations are presented within the script.

3. The sequence of codes will download the dataset from the website and produce two txt files.
  + ModifiedMergedData.txt: containing the subject and activity recorded means and standard deviations for both test and train data
  + SubjectActivityMeanData.txt: containing the mean data for each recorded activity type for each subject
