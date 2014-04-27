datasciencecoursera
===================
This file explains the steps the run_analysis.R script in this same repo takes to produce and summarize a tidy data set as described here:  https://class.coursera.org/getdata-002/forum/thread?thread_id=302#post-1175  
The steps the script walks through do the following:
combine the training and test x and y into one block
gives them headings
turns the numeric activities into something easier to read
extract some variables to do with mean and standard deviation from the full set
those variables are the columns labeled with mean or std in their names
average of each variable for each combination of subject and activity
saved the data frame of this as a set of tidy data

Comments from the script in chronological order below
#Read in files
#combine training and test for x, y, subject data
#friendly column names
#read in activity labels as a table to merge with HAR to put activity labels on the Y (outcomes)
#combine x, y, s into one data frame
#write out a text file
#copied from here https://class.coursera.org/getdata-002/forum/thread?thread_id=398#post-1518 then tweaked - finding mean and sd columns
#write out the tidy text file
#melt and decast to reshape
#write out the tidy text file - with means
