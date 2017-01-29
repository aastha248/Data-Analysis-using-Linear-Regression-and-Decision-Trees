training_data <- read.table("C:\\Users\\Aastha\\Documents\\yeast_training.txt", sep=" ", header = TRUE)
test_data <- read.table("C:\\Users\\Aastha\\Documents\\yeast_test.txt", sep=" ", header = TRUE)
attach(training_data)
attach(test_data)
library(rpart)
decision_tree_model <- rpart(class ~ ., training_data, method = "class")
summary(decision_tree_model)

library(rpart.plot)
rpart.plot(decision_tree_model)

prediction <- predict(decision_tree_model, test_data, type = "class")
prediction

len <- length(which((prediction == class) == "TRUE"))
accuracy = (len * 100)/470
accuracy