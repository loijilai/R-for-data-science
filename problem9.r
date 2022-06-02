raw_data <- read.csv('Advertising.csv')
k_fold_mse <- function(k){
  set.seed(123)
  data_sample <- sample(1:nrow(raw_data), size = nrow(raw_data))
  test_mse <- c()
  for (i in 1:k){
    test_data_index <- data_sample[(((i-1)/k)*nrow(raw_data)+1):((i/k)*nrow(raw_data))]
    test_data <- raw_data[test_data_index,]
    train_data <- raw_data[setdiff(data_sample, test_data_index),]
    model <- lm(data=train_data, formula = sales~TV+radio)
    predicted <- predict(model, newdata=test_data)
    test_mse <- append(test_mse, mean((test_data$sales-predicted)^2))
  }
  cross_validation <- mean(test_mse)
  cross_validation
}
k_fold_mse(5)
k_fold_mse(10)
k_fold_mse(nrow(raw_data))

k_fold_mse_interaction <- function(k){
  set.seed(123)
  data_sample <- sample(1:nrow(raw_data), size = nrow(raw_data))
  test_mse <- c()
  for (i in 1:k){
    test_data_index <- data_sample[(((i-1)/k)*nrow(raw_data)+1):((i/k)*nrow(raw_data))]
    test_data <- raw_data[test_data_index,]
    train_data <- raw_data[setdiff(data_sample, test_data_index),]
    model <- lm(data=train_data, formula = sales~TV+radio+TV:radio)
    predicted <- predict(model, newdata=test_data)
    test_mse <- append(test_mse, mean((test_data$sales-predicted)^2))
  }
  cross_validation <- mean(test_mse)
  cross_validation
}
k_fold_mse_interaction(5)
k_fold_mse_interaction(10)
k_fold_mse_interaction(nrow(raw_data))



