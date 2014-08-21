## create a complete data set by reading in and concatenating:
## x_train data   the smartphone measurement data
## y_train        the activities that generated the measurment data (coded 1-6)
## subject_train  the person who generated the data

x.train<-read.table("./train/X_train.txt")
y.train<-read.table("./train/y_train.txt") ## read in the training data activity labels
subject.train<-read.table("./train/subject_train.txt") ## add the subject ID column to the data frame

# repeat for the test data set
x.test<-read.table("./test/X_test.txt")
y.test<-read.table("./test/y_test.txt")
subject.test<-read.table("./test/subject_test.txt")

## concatenate the x_train, x_test data sets
x.data <- rbind(x.train, x.test)
## Assign the feature names to the columns of the complete x.data set
names(x.data)<-(read.table("features.txt")[,2]) ## names read in from"features.txt"

## concatenate the activity data from the y_train, y_test data sets
y.data<-rbind(y.train, y.test)  #complete training data set
names(y.data)<-c("activity")  ## name the "activity column" for the training set

#recode Activity labels from (1-5) to descriptive (walking,..)  
# first I define Activity" as a Factor then I assign the Activity Labels as the 
# factor levels
y.data$activity<-as.factor(y.data$activity)
levels(y.data$activity)<-tolower(as.vector(read.table("activity_labels.txt")[,2]))

## concatenate the subject information from subject_train and subject_test to create a subject column
subject<-rbind(subject.train, subject.test)
names(subject)<-c("subject") #give the column a descriptive name

# in the x.data find all column headers with "mean() or std()" in them, and subset to include those columns
meanstd.cols<-sort(c(grep("mean()", names(x.data), fixed=TRUE), grep( "std()" , names(x.data), fixed=TRUE)))
xdata.2<-x.data[,meanstd.cols]

# replace the t and f at the beginning of variable names with time and frequency
tandf<-substr(names(xdata.2),1,1)
tandf[tandf=="t"]<-"time"
tandf[tandf=="f"]<-"frequency"

new.names<-paste0(tandf,substring(names(xdata.2),2))
# remove "-" and "()" from variable names
new.names<-gsub("-","",new.names)
new.names<-gsub("\\()","",new.names)
# make all letters lower case
new.names<-tolower(new.names)
#noticed some of the measurment names incorrectly said "body" twice, remove one of them
new.names<-gsub("bodybody","body",new.names)
#apply these new names to the data.2 data set's variable names
names(xdata.2)<-new.names

#create the whole data set by bringing the subject ID, Activity (y), and measurments(x) together
data<-cbind(subject, y.data, xdata.2)

#calculate the means for all x columns (3-68) by activity and subject 

tidy.data<-aggregate(data[,3:68],by=list(subject=data$subject, activity=data$activity),mean)

write.csv(tidy.data, file="C:/Users/dgorman/Desktop/tidy.csv", row.names=FALSE) #write out to csv

