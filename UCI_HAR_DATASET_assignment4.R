## 1
Xtrain <- read.table("C:\\X_train.txt")
Ytrain <- read.table("C:\\Y_train.txt")
Xtest<- read.table("C:\\X_test.txt")
Ytest <- read.table("C:\\Y_test.txt")
feature <- read.table("C:\\features.txt")
Y <-rbind(Ytest, Ytrain)
X <- rbind(Xtest, Xtrain)
##2
selectfeature <- feature[grep("mean\\(\\)|std\\(\\)",feature[,2]),]
X_total <- X[,selectfeature[,1]]
##3
activitylabels <- read.table("C:\\activity_labels.txt")
colnames(Y) <- "activity"
Y$activitylabels <- factor(Y$activity, labels = as.character(activitylabels[,2]))
activitylabel <- Y[,2]
##4
colnames(X_total) <- feature[selectfeature[,1],2]

##5
subtrain <- read.table("C:\\subject_train.txt")
subtest <- read.table("C:\\subject_test.txt")
Sub_total <- rbind(Subtrain, Subtest)
colnames(Sub_total) <- "subject"
total <- cbind(X_total, activitylabel, Sub_total)
total_mean <- total %>% group_by(activitylabel, subject) %>% summarise_all(funs(mean))
write.table(total_mean, file = " C:\\total_mean.txt", row.names = FALSE, col.names = TRUE)
