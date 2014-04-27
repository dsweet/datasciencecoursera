library(plyr)

#Read in files
xtr <- read.table("X_train.txt")
xtest <- read.table("X_test.txt")
ytr <- read.table("Y_train.txt")
ytest <- read.table("Y_test.txt")
str <- read.table("subject_train.txt")
stest <- read.table("subject_test.txt")

#combine training and test for x, y, subject data
x <- rbind(xtr,xtest)
y <- rbind(ytr,ytest)
s <- rbind(str,stest)

#friendly column names
fcolnames <- read.table("features.txt")
colnames(s) <- c("Subject")
colnames(y) <- c("Activity_Code")
colnames(x) <- fcolnames[,2]

#read in activity labels as a table to merge with HAR to put activity labels on the Y (outcomes)
activities <- read.table("activity_labels.txt")
merged_activity = merge(y, activities,by.x="Activity_Code",by.y="V1")
colnames(merged_activity) <- c("Activity_Code","Activity")

#combine x, y, s into one data frame
HAR <- cbind(s,merged_activity,x)

#write out a text file
write.table(HAR, file="HAR.txt")

#copied from here https://class.coursera.org/getdata-002/forum/thread?thread_id=398#post-1518 then tweaked - finding mean and sd columns
toMatch <- c(".*mean\\(\\).*-X$", ".*std\\(\\).*-X$")
matches <- unique (grep(paste(toMatch,collapse="|"), fcolnames[,2], value=TRUE))
matches
matches_index <- colnames(HAR) %in% matches

head(HAR[,1:10])
HAR_tidy1 <- HAR[,c(1,2,3)]
HAR_tidy2 <- HAR[,colnames(HAR[,matches_index]==TRUE)]
head(HAR_tidy2)
HAR_tidy <- cbind(HAR_tidy1,HAR_tidy2)
summary(HAR_tidy)

#write out the tidy text file
write.table(HAR_tidy, file="HAR_tidy.txt")

#melt and decast to reshape
install.packages("reshape2")
library(reshape2)
melted <- melt(HAR_tidy, id=c("Subject","Activity"),na.rm=TRUE)
HAR_tidy_means <- dcast(melted, Subject + Activity ~ variable, mean)

#write out the tidy text file - with means
write.table(HAR_tidy_means, file="HAR_tidy_means.txt")
