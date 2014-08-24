features <- read.table("d:/getdata_projectfiles_UCI/features.txt")

features <- tolower(gsub("-|\\,","",features[ ,"V2"]))

x_test_data <- read.table("d:/getdata_projectfiles_UCI/test/X_test.txt")
colnames(x_test_data) <- features[]
x_train_data <- read.table("d:/getdata_projectfiles_UCI/train/X_train.txt")
colnames(x_train_data) <- features[]
	
	

		x_test_data_mean <- x_test_data[ ,grepl("mean()",names(x_test_data),fixed =TRUE)]
		x_test_data_std <- x_test_data[ ,grepl("std()",names(x_test_data),fixed =TRUE)]
		x_test_data_extr <- cbind(x_test_data_mean,x_test_data_std)
		x_test_data_colnames <- colnames(x_test_data_extr)		
		x_test_data_colnames <- gsub("\\()","",x_test_data_colnames[])
		colnames(x_test_data_extr) <- x_test_data_colnames[]

		
		x_train_data_mean <- x_train_data[ ,grepl("mean()",names(x_train_data),fixed =TRUE)]
		x_train_data_std <- x_train_data[ ,grepl("std()",names(x_train_data),fixed =TRUE)]
		x_train_data_extr <- cbind(x_train_data_mean,x_train_data_std)
		x_train_data_colnames  <- colnames(x_train_data_extr)
		x_train_data_colnames <- gsub("\\()","",x_train_data_colnames[])
		colnames(x_train_data_extr) <- x_train_data_colnames[]


activity_label_test <- read.table("d:/getdata_projectfiles_UCI/test/y_test.txt")
activity_label_train<- read.table("d:/getdata_projectfiles_UCI/train/y_train.txt")
subject_train <- read.table("d:/getdata_projectfiles_UCI/train/subject_train.txt")
subject_test <- read.table("d:/getdata_projectfiles_UCI/test/subject_test.txt")
x_test_data_complete  <- cbind(activity_label_test,x_test_data_extr)
x_test_data_complete <- cbind(subject_test,x_test_data_complete)

x_train_data_complete  <- cbind(activity_label_train,x_train_data_extr)
x_train_data_complete <- cbind(subject_train,x_train_data_complete)


x_total_data_set <- rbind(x_test_data_complete,x_train_data_complete)
colnames(x_total_data_set)[c(1,2)] <- c("subject","activity_label")
a <- aggregate(x_total_data_set,list(x_total_data_set$subject,x_total_data_set$activity_label), mean)
write.table(a[ ,-c(1,2)],file ="tidy_data_set.txt")


