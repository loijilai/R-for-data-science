## problem 1.
wagedata <- read.csv("D:/?F?G?U/R_forData/wagedata(3).csv")

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
agsd_sample_sd_seq_five <- sd(sample_mean_seq)

## problem 4. sample 10
samplewage_ten <- sample(wagedata$wage, size = 10, replace = FALSE)
mean(samplewage_ten)

sample_mean_seq_ten <- rep(0,100)
sample_sd_seq_ten <- rep(0,100)

for(i in 1:100)
{
  sample_mean_seq_ten[i] <- mean(sample(wagedata$wage, size = 10, replace = FALSE))
  sample_sd_seq_ten[i] <- sd(sample(wagedata$wage, size = 10, replace = FALSE))
}
sample_mean_seq_ten
agsd_sample_sd_seq_ten <- sd(sample_mean_seq_ten)

## sample50
samplewage_fifty <- sample(wagedata$wage, size = 50, replace = FALSE)
mean(samplewage_fifty)

sample_mean_seq_fifty <- rep(0,100)
sample_sd_seq_fifty <- rep(0,100)

for(i in 1:100)
{
  sample_mean_seq_fifty[i] <- mean(sample(wagedata$wage, size = 50, replace = FALSE))
  sample_sd_seq_fifty[i] <- sd(sample(wagedata$wage, size = 50, replace = FALSE))
}
sample_mean_seq_fifty
agsd_sample_sd_seq_fifty <- sd(sample_mean_seq_fifty)

## sample 100
samplewage_hundred <- sample(wagedata$wage, size = 100, replace = FALSE)
mean(samplewage_hundred)

sample_mean_seq_hundred <- rep(0,100)
sample_sd_seq_hundred <- rep(0,100)

for(i in 1:100)
{
  sample_mean_seq_hundred[i] <- mean(sample(wagedata$wage, size = 100, replace = FALSE))
  sample_sd_seq_hundred[i] <- sd(sample(wagedata$wage, size = 100, replace = FALSE))
}
sample_mean_seq_hundred
agsd_sample_sd_seq_hundred <- sd(sample_mean_seq_hundred)

sd(wagedata$wage)/sqrt(526)
