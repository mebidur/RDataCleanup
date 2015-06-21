# Clean and Tidy Data generation

## Data Source
The data in this assignment has been obtained from UCI Machine Learning Repository and is titled "Human Activity Recognition Using Smartphones Data Set". Full Description is available at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and the actual data can be downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Analysis Process
The file run_analysis.R reads the training and test data set and performs a number of operations on the data to generate the resultant tidy data set. The tidy data set is described in the attached codebook. Following is the list of operations performed by 'run_analysis.R' script:
1. **Merge Datas**: The script reads the test and training data and merge them using rbind function
2. **Extract mean and standard deviation**: The mean and standard deviation variables are determined by going througn features.txt file. Out of 561 total fields, the data on mean and standard deviation are extracted.
3. **Activity Name**: The activity number is also merged, mapped to the data row and converted to descriptive activity name.
4. **Labels**: The columns are assigned descriptive labels based on the features.txt file
5. **Mean for each activity and each subject**: The mean of all the variables are calculated for each activity and subject.
6. **The tidy data set**: Finally the tidy data set 'tidy.txt' is generated.