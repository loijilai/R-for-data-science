library(nycflights13)
library(tidyverse)
data(flights)

not_cancelled <- filter(flights, !is.na(dep_delay), !is.na(arr_delay))

Q1 <- (not_cancelled %>% group_by(year, month, day) 
  %>% summarize(delateRate= mean(arr_delay>60))) %>% arrange(desc(delateRate))
Q2 <- (not_cancelled %>% group_by(dest) %>% 
         summarize(flights=n(), ave_dist=mean(distance), ave_arr_delay=mean(arr_delay)))
Q3 <- Q2 %>% filter(flights>=20, dest!='HNL')
plot(Q3$ave_dist, Q3$ave_arr_delay, xlab = 'average distance', ylab='average delay')
x <- Q3$ave_dist
y <- Q3$ave_arr_delay
abline(lm(y~x), col='red')


