read.csv("/Users/abner/Dropbox/Mac/Downloads/wagedata.csv")
## problem 1.
wagedata <- read.csv("/Users/abner/Dropbox/Mac/Downloads/wagedata.csv")

## problem 2.
mean(wagedata$wage) # mean
sd(wagedata$wage) # standard error

## problem 3-1.
set.seed(123)
samplewage <- sample(wagedata$wage, size = 5, replace = FALSE)
mean(samplewage)

## problem 3-2 , 3-3.
sample_mean_seq <- rep(0,100)
sample_sd_seq <- rep(0,100)
for(i in 1:100)
{
  sample_mean_seq[i] <- mean(sample(wagedata$wage, size = 5, replace = FALSE))
  sample_sd_seq[i] <- sd(sample(wagedata$wage, size = 5, replace = FALSE))
}
sample_mean_seq
sample_sd_seq

## problem 4.
samplewage <- sample(wagedata$wage, size = 10, replace = FALSE)
mean(samplewage)

sample_mean_seq <- rep(0,100)
sample_sd_seq <- rep(0,100)
for(i in 1:100)
{
  sample_mean_seq[i] <- mean(sample(wagedata$wage, size = 10, replace = FALSE))
  sample_sd_seq[i] <- sd(sample(wagedata$wage, size = 10, replace = FALSE))
}
sample_mean_seq
sample_sd_seq
