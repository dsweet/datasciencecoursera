datasciencecoursera
===================
This file explains the steps the run_analysis.R script in this same repo takes to produce and summarize a tidy data set as described here:  https://class.coursera.org/getdata-002/forum/thread?thread_id=302#post-1175  
The steps the script walks through do the following:

*Read in files
*Combine training and test for x, y, subject data
*Rename with friendly column names
*Read in activity labels as a table to lookup activity names against activity code
*Combine x, y, s into one data frame (x = inputs, y = activity, s = subject
*Select columns incl mean and std - initial steps copied from here https://class.coursera.org/getdata-002/forum/thread?thread_id=398#post-1518 then tweaked
*Melt and decast to reshape
*Take mean of each variable for each combination of subject and activity
*Write out the tidy text file with means
