# Random Forest Regression Template

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Splitting the dataset into the Training and Test set >>> Lets not do that here, 10 records only
#install.packages('caTools')
#library(caTools)
#set.seed(123)
#split = sample.split(dataset$Purchased, SplitRatio = 0.8)
#training_set = subset(dataset, split == TRUE)
#test_set = subset(dataset, split == FALSE)

# Feature Scaling  (optional) necessary if there are Euclidian distances to be processed
# training_set[, 2:3] = scale(training_set[, 2:3])
# test_set[, 2:3] = scale(test_set[, 2:3])

# Fitting Regression to the dataset
#install.packages('randomForest')
library(randomForest)
set.seed(1234)
# to have more than one split add the control feature
regressor = randomForest(x = dataset[1],     #dataframe
                         y = dataset$Salary, #vector
                         ntree = 500)

# Single Predicting new result
y_pred = predict(regressor, data.frame(Level = 6.5))
summary(y_pred)

# Visualize RANDOM FOREST REGRESSION Model needs HIGH RES so to have many 
# splits into leaves, which can be seen clearly
# install.packages('ggplot2')
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() +
  # actual values
  geom_point(aes(x=dataset$Level , y=dataset$Salary),
             colour = "red") +
  # prediction
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))), 
            colour = "blue") +
  ggtitle('Truth or Bluff (RANDOM FOREST REGRESSION MODEL)') +
  xlab('Level') +
  ylab('Salary')
