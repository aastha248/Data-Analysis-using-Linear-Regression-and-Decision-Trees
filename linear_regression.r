training_data <- read.table("C:\\Users\\Aastha\\Documents\\yeast_training.txt", sep=" ", header = TRUE)
test_data <- read.table("C:\\Users\\Aastha\\Documents\\yeast_test.txt", sep=" ", header = TRUE)
attach(training_data)
attach(test_data)
classifier <- lm(class ~ attribute1 + attribute2 + attribute3 + attribute4 + attribute5 + attribute6 + attribute7 + attribute8, data = training_data)

plot(classifier)
summary(classifier)

prediction <- predict(classifier, newdata = test_data)
prediction
plot(prediction)
MSE.lm <- sum((prediction - test_data$class)^2)/nrow(test_data)
MSE.lm