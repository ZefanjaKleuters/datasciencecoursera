# The function run_analysis merges the training and test set,
# add descriptive labels. From the total set, 2 subsets are extracted
# Subset 1: Extracts only the measurements on the mean and standard deviation for each measurement. 
# Subset 2: Independent tidy data set with the average of each variable for each activity and each subject.
run_analysis <- function () {
    
    setwd("C:/Users/Gebruiker/Documents/@Courses/RCode/03.GettingAndCleaning/AssignW3")
    library(gdata)
    # library(dplyr)
    library(reshape2)
    
    # Test set: Add Subject and activity (y) as first two columns to x (all variables). 
    # Column 1: The subject, column 2: activity, column > 2 other measurement variables 
    strFile<- "./X_test.txt"
    dfTest <- read.table(strFile, header=FALSE, sep="")
    strFile<- "./y_test.txt"
    dfy <- read.table(strFile, header=FALSE, sep="")
    dfTest <- cbind(dfy,dfTest)
    strFile<- "./subject_test.txt"
    dfSubject <- read.table(strFile, header=FALSE, sep="")    
    dfTest <- cbind(dfSubject,dfTest)    
        
    # Train set: Add Subject and activity (y) as first two columns to x (all variables). 
    # Column 1: The subject, column 2: activity, column > 2 other measurement variables
    strFile <- "./X_train.txt"
    dfTrain <- read.table(strFile, header=FALSE, sep="")
    strFile<- "./y_train.txt"
    dfy <- read.table(strFile, header=FALSE, sep="") 
    dfTrain <- cbind(dfy,dfTrain)
    strFile<- "./subject_train.txt"
    dfSubject <- read.table(strFile, header=FALSE, sep="")    
    dfTrain <- cbind(dfSubject,dfTrain) 
    
    # Merge Test and Training sets & free memory
    dfTotal <- rbind(dfTrain,dfTest)
    dfTest <- NULL
    dfTrain <- NULL
    
    # Add descriptive names to all variables (columns). Subscriptive names are obtained form features.txt
    strFile<- "./features.txt"
    dfColNames <- read.table(strFile, header=FALSE, sep="") 
    strColNames <- c("Subject.No","Activity.id",as.character(dfColNames[,2]))
    colnames(dfTotal) <- strColNames
    
    # Change the activity column (second column) the y value with the activity labels.
    # Activity labels are obtained from activity_labels.txt
    # Add column names. Column 1: Activity.id, column 2: Activitiy
    strFile<- "./activity_labels.txt"
    dfActivities <- read.table(strFile, header=FALSE, sep="") 
    colnames(dfActivities) <- c("Activity.id", "Activity")
    dfTotal <- merge(dfActivities,dfTotal,by.x="Activity.id",by.y="Activity.id")
    
    # Merging with Activities merge Activity.id and Activity infront of dfTotal columns.
    # Delete Activity.id and restore order columns of dfTotal by omitting column 1 and 
    # switching column 2 and 3 (respectivily Activity and Subject.No)
    dfTotal <- dfTotal[,c(3,2,4:ncol(dfTotal))]
    
    # subset 1: Build a data frame containing Subject.No, Activity and 
    # the measurements on the mean and standard deviation. Remove meanFreq  
    lstMeanStd <- matchcols(dfTotal, with=c("mean","std"), method="or")
    lstFreq <- matchcols(dfTotal, with="Freq")
    dfMeanStd <- dfTotal[,c("Subject.No","Activity",unlist(lstMeanStd$mean),unlist(lstMeanStd$std))]
    dfMeanStd <- dfMeanStd[,!(colnames(dfMeanStd) %in% lstFreq)]
    
    # Subset 2: mean on measurements of subset 1, grouped by Subject.No and Activity
    lstVariables <- colnames(dfMeanStd[,-c(1:2)])
    dfMelt <- melt(dfMeanStd,id.vars=c("Subject.No","Activity"),measure.vars=lstVariables)
    dfSubjectActivMean <- dcast(dfMelt, Subject.No+Activity ~ variable, mean)
    
    # Write subset 2 to a text file
    strFile <- "SubjectActivMean.txt"
    write.table(dfSubjectActivMean, file = strFile, append = FALSE, row.names=FALSE, col.names = TRUE ) 
    
}