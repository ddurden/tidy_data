tidy_data
=========


The run_analysis.R program is used to create a tidy data set from the Samsung S data.

Required packages:
reshape2

Input files:
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels. 

Output files:
-'phone_dat.txt': tidy dataset of the mean values stratified by subject ID and activity

It reads the files, combines all the test/train data sets together. Then, creates a column ids using the features.txt file. The data are subset to acquire just the mean and standard deviations of the measurements. 
The activity id represented by integer factor levels are replace with descriptive factor variables using activity_labels.txt. The data frame is then melted and casted using the reshape2 package to cast a tidy data frame of the mean values stratified by subject ID and activity. Finally the output is written to the phone_dat.txt file.

Notes:
======
-run_analysis.R should be placed in the same folder as the UCI HAR data folder, keeping the file structure the same.
- The following files found in the UCI HAR Data folder contain information on the original dataset.
	-'README.txt'
	- 'features_info.txt': Shows information about the variables used on the feature vector.
	- 'features.txt': List of all features.
- Also, see the codebook for a description of the variables.


