library(data.table)
varnametbl <- read.table("UCI HAR Dataset/features.txt", sep = " ")
varnames <-varnametbl$V2

testxtbl <- read.table("UCI HAR Dataset/test/X_test.txt", sep = "")
testytbl <- read.table("UCI HAR Dataset/test/y_test.txt", sep = "")
testsubjecttbl <- read.table("UCI HAR Dataset/test/subject_test.txt", sep = "")

testxtbl<-testxtbl[,grep("mean|std", varnames)]

names(testxtbl) <-grep("mean|std", varnames, value = TRUE)

testxtbl$activity=testytbl$V1
testxtbl$subject=testsubjecttbl$V1
testxtbl$observationtype="test"

trainxtbl <- read.table("UCI HAR Dataset/train/X_train.txt", sep = "")
trainytbl <- read.table("UCI HAR Dataset/train/y_train.txt", sep = "")
trainsubjecttbl <- read.table("UCI HAR Dataset/train/subject_train.txt", sep = "")

trainxtbl<-trainxtbl[,grep("mean|std", varnames)]

names(trainxtbl) <-grep("mean|std", varnames, value = TRUE)

trainxtbl$activity=trainytbl$V1
trainxtbl$subject=trainsubjecttbl$V1
trainxtbl$observationtype="train"

maindf <- rbind(testxtbl, trainxtbl)

actlabels <- read.table("UCI HAR Dataset/activity_labels.txt", sep = "")
names(actlabels) <-c("activityid", "activityname")
maindf2 = merge(maindf, actlabels, by.x = "activity", by.y = "activityid")
maindf <-subset(maindf2,,-activity)
write.table(maindf, file = "outputds.txt", row.names=FALSE)