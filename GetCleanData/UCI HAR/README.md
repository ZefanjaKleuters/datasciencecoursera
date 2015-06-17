## Run_analysis ##

Description of the function that outputs a file of calculated mean (accelerator and gyroscope) values per variable grouped by Subject and activity.

**To get the requested output, the following files from the UCI HAR Dataset are needed:**

1. X_ test.txt and y_ test.txt
2. X_ train.txt and y_ train.txt
3. subject_ test.txt and subject_ train.txt
4. activity_labels.txt
5. features.txt


**Libraries used:**

- gdata: matchcols for filtering on column names
- reshape2: melt and dcast. Group by subject and activity and calculate mean values over the variables.

**Pre conditions:**

- All files needed are in the same folder as the script.
- All packages needed are installed.

**Post Conditions:**

Output file SubjectActivMean.txt contains calculated mean values of Mean & Standard Deviation variabled that are grouped by subject and activity.


##Plan of approach##

To get the output file as stated above, the execution sequence is as follows:

1. **Create a test data set**. Make test set complete by merging X_ test (variable), y_ test (activity number) and subject number. Subject as first and Activity as second column of the test set.
2. **Create a training data set**. Make training set complete by merging X_ train (variable), y_ train (activity number) and subject number. Subject as first and Activity as second column of the test set.
3. **Create a to complete data set**. Merge training and test set. Change on errors or lost column names are small by keeping test and training separate until both are definite in dimension
4. **Add descriptive labels to colomn variables**. Add descriptive names to the column names of the total set. Starting with subject and activity and the rest obtained from features.txt
5. Obtain Activity labels from activity_labels.txt
6. **Add Activity labels**. Add Activity labels to the total data set by using the merge() function (on activity number).
7. **Cleanup and reorder total data set**. Activity.id and Activity are the first columns. To restore the initialcolumn order by omitting column 1 and switch column 2 and 3 (respectivily Activity and Subject.No)
8. **Create data set with Mean and Standard Deviation variables**. Build a data set containing Subject.No, Activity and the measurements on the mean and standard deviation excluding meanFreq which not a mean value.
9. **Create a subset grouped by subject & activity and calculate mean values** on all variables. Create subset 2 data set using the 'melt' and 'dcast' functions.
10. **Write subset 2 to text file 'SubjectActivMean.txt'**.


## Approach explained in code##

In this paragraph shows clarification on how the steps are carried out by code.

**Bullit 5: Joining on Activity number**

    strFile<- "./activity_labels.txt"
    dfActivities <- read.table(strFile, header=FALSE, sep="") 
    colnames(dfActivities) <- c("Activity.id", "Activity")
    dfTotal <- merge(dfActivities,dfTotal,by.x="Activity.id",by.y="Activity.id")

**Bullit 7: Reordering columns**

    dfTotal <- dfTotal[,c(3,2,4:ncol(dfTotal))]

**Bullit 8: Select on column names**

Build a list with column names containing 'mean' and 'std' using 'matchcols' function. Create a subset  of total set by selecting columns 'Subject.No','Activity' and all containing 'mean' and 'std'.


    lstMeanStd <- matchcols(dfTotal, with=c("mean","std"), method="or")
    dfMeanStd <- dfTotal[,c("Subject.No","Activity",
							unlist(lstMeanStd$mean),unlist(lstMeanStd$std))]


Build a list with column names containing 'Freq' and exclude the list from the subset.

    lstFreq <- matchcols(dfTotal, with="Freq")
    dfMeanStd <- dfMeanStd[,!(colnames(dfMeanStd) %in% lstFreq)]
    

**Bullit 9: Group by & calculate mean by melting and casting**

Subset 2 (dfSubjectActivMean) is created by melting the data set from bullit 8 using subject and activity as groupby ('id.vars' parameter in 'melt' function).  Parameter 'measure.vars' contains a list with all measurement variables (column 'variable' in melted subset).

    lstVariables <- colnames(dfMeanStd[,-c(1:2)])
    dfMelt <- melt(dfMeanStd,id.vars=c("Subject.No","Activity"),
										measure.vars=lstVariables)
    
After the merged data is casted to a data set and the mean values on all measurement variables (column 'variable' in melted subset) are calculated.


    dfSubjectActivMean <- dcast(dfMelt, Subject.No+Activity ~ variable, mean)
    
**Bullit 10: Write subset 2 to a text file**

Write subset 2 to a text file adding column names as header, without row names and always overwrites existing file

    strFile <- "SubjectActivMean.txt"
    write.table(dfSubjectActivMean, file = strFile, append = FALSE, row.names=FALSE, 
				col.names = TRUE ) 
   