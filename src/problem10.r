library(np)
library(tidyverse)
set.seed(123)
x <- rnorm(100)
u <- rnorm(100, mean=0, sd=0.4)
fx <- x + 2*exp(-16*x^2)
y <- fx+u
df <- data.frame(x,y)
index <- sample(1:100 ,80)
train.data <- df[index,]
test.data <- df[-index, ]
df.order <- df %>% arrange(x)
func <- function(x) x + 2*exp(-16*x^2)

model.lm <- lm(train.data$y~train.data$x)
model.np <- npreg(train.data$y~train.data$x, regtype='lc', gradients=T)

newx <- data.frame(seq(-3, 3, length=100))
#colnames(newx) <- c('x')
predict.lm <- predict(model.lm, newdata=newx)
predict.np <- predict(model.np, newdata=newx)

plot(x, y)
lines(x=newx$x, y=predict.np, col='red')
abline(model.lm, col='blue')
curve(func, add=T, from=-3, to=3)





