
#David Durden
#Program to create a tidy data set from the Samsung S data.

#Names of the feature variables in the test and train dataset
varname<-read.table("features.txt",header=F,colClasses="character")
varname<-unlist(varname[,2])
#Creating a vector to generate the variable names for column ids
varname<-c("subject_id","activity_id",varname)

#Reading in the test data sets
subject_id_test<- read.table(file="./test/subject_test.txt")
fdat_test<- read.table(file="./test/X_test.txt")
activity_id_test<- read.table(file="./test/y_test.txt")

#Combining the test data by columns into a data frame
test_dat<-cbind(suject_id_test,activity_id_test,fdat_test)

#Reading in the train data sets
subject_id_train<- read.table(file="./train/subject_train.txt")
fdat_train<- read.table(file="./train/X_train.txt")
activity_id_train<- read.table(file="./train/y_train.txt")

#Combining the train data by columns into a data frame
train_dat<-cbind(suject_id_train,activity_id_train,fdat_train)

#Combining the test and train data frames into a into a single data frame by rows
alldat<-rbind(test_dat,train_dat)

#Adding the column names to the data frame
names(alldat)<-varname

#Vector of columns that contain mean and standard deviation calculations
colids <- grep("mean()|std()", names(alldat))

#Subsetting the data frame to acquire just the mean and standard deviations of the measurements
sub_dat<-alldat[,c(1,2,colids)]

#Converting the ID variables to factors
sub_dat$subject_id <- as.factor(sub_dat$subject_id)
sub_dat$activity_id <- as.factor(sub_dat$activity_id)

#Reading in activity id descriptive variable and replacing the integer factor levels w/ the descriptive factors
act_id <- read.table("activity_labels.txt")
levels(sub_dat$activity_id) <- act_id$V2

#Melting the data frame using the identified factor ("ID") variables
df_melt <- melt(sub_dat, id = c("subject_id", "activity_id"))

#Casting a tidy data frame of the mean values by subject and activity
df_cast <- dcast(df_melt, subject_id + activity_id ~ variable, mean)

#Writing an output .txt file
write.table(df_cast,"phone_dat.txt",col.names = T, row.name = F)


