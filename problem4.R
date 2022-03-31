## problem 1.
wagedata <- read.csv("/Users/abner/Dropbox/Mac/Downloads/wagedata.csv")

## problem 2.
mean(wagedata$wage) # mean
popmean <- mean(wagedata$wage)
sd(wagedata$wage) # standard error
popsd <- sd(wagedata$wage)
thmsd <- popsd/(526^0.5)
thmsd

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
agsd <- sd(sample_mean_seq)

## problem 4.
## n = 10
samplewage_1 <- sample(wagedata$wage, size = 10, replace = FALSE)
mean(samplewage_1)
sample_mean_seq_1 <- rep(0,100)
sample_sd_seq_1 <- rep(0,100)
for(i in 1:100)
{
  sample_mean_seq_1[i] <- mean(sample(wagedata$wage, size = 10, replace = FALSE))
  sample_sd_seq_1[i] <- sd(sample(wagedata$wage, size = 10, replace = FALSE))
}
sample_mean_seq_1
sample_sd_seq_1
agsd_1 <- sd(sample_mean_seq_1)

## n = 50
samplewage_2 <- sample(wagedata$wage, size = 50, replace = FALSE)
mean(samplewage_2)
sample_mean_seq_2 <- rep(0,100)
sample_sd_seq_2 <- rep(0,100)
for(i in 1:100)
{
  sample_mean_seq_2[i] <- mean(sample(wagedata$wage, size = 50, replace = FALSE))
  sample_sd_seq_2[i] <- sd(sample(wagedata$wage, size = 50, replace = FALSE))
}
sample_mean_seq_2
sample_sd_seq_2
agsd_2 <- sd(sample_mean_seq_2)

## n = 100
samplewage_3 <- sample(wagedata$wage, size = 100, replace = FALSE)
mean(samplewage_3)
sample_mean_seq_3 <- rep(0,100)
sample_sd_seq_3 <- rep(0,100)
for(i in 1:100)
{
  sample_mean_seq_3[i] <- mean(sample(wagedata$wage, size = 100, replace = FALSE))
  sample_sd_seq_3[i] <- sd(sample(wagedata$wage, size = 100, replace = FALSE))
}
sample_mean_seq_3
sample_sd_seq_3
agsd_3 <- sd(sample_mean_seq_3)

## problem.5
compare <- c(thmsd,agsd,agsd_1,agsd_2,agsd_3)
compare

