library(ISLR)
data(Caravan)
library(rpart)
library(rpart.plot)

test_data <- Caravan[1:1000,]
train_data <- Caravan[1001:5822, ]
k_fold_precision <- function(k, cp){
  set.seed(123)
  data_sample <- sample(1:nrow(train_data), size = nrow(train_data))
  vali_precision <- c()
  for (i in 1:k){
    vali_data_index <- data_sample[(round((i-1)/k*nrow(Caravan))+1):
                                     round((i/k)*nrow(Caravan))]
    vali_data <- Caravan[vali_data_index,]
    train_data_vali <- Caravan[setdiff(data_sample, vali_data_index),]
    model <- rpart(Purchase~., data = train_data_vali,method = 'class', 
                   control = rpart.control(minsplit = 1, minbucket = 1, cp = cp))
    predicted <- predict(model, newdata=vali_data, type='class')
    confu_mat <- table(predicted, Caravan$Purchase[vali_data_index])
    vali_precision <- append(vali_precision, confu_mat[2,2]/sum(confu_mat[2, ]))
  }
  cross_validation <- sum(na.omit(vali_precision))/5
  cross_validation
}

cp <- seq(0.003, 0.01, 0.0001)
cp_precision_df <- data.frame(cp=rep(0, 71), precision=rep(0,71))
for (i in 1:71){
  cp_precision_df[i, 'cp'] <- cp[i]
  cp_precision_df[i, 'precision'] <- k_fold_precision(5, cp[i])
}
cp_precision_df[which.max(cp_precision_df[, 'precision']), ]

