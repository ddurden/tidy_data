
#David Durden
#Changing for test

#Names of the feature variables in the test and train dataset
varname<-read.table("features.txt",header=F,colClasses="character")
varname<-unlist(varname[,2])
varname<-c("subject_id","activity_id",varname)

subject_id_test<- read.table(file="./test/subject_test.txt")
fdat_test<- read.table(file="./test/X_test.txt")
activity_id_test<- read.table(file="./test/y_test.txt")

test_dat<-cbind(suject_id_test,activity_id_test,fdat_test)


subject_id_train<- read.table(file="./train/subject_train.txt")
fdat_train<- read.table(file="./train/X_train.txt")
activity_id_train<- read.table(file="./train/y_train.txt")

train_dat<-cbind(suject_id_train,activity_id_train,fdat_train)

alldat<-rbind(test_dat,train_dat)
names(alldat)<-varname

colids <- grep("mean()|std()", names(alldat))
sub_dat<-alldat[,c(1,2,colids)]

