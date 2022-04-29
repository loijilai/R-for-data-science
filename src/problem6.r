library(tidyverse)
library(nycflights13)
data(flights)

not_cancelled <- filter(flights, !is.na(dep_delay), !is.na(arr_delay))

Q1 <- (not_cancelled %>% group_by(year, month, day) 
       %>% summarize(delayRate= mean(arr_delay>60))) %>% arrange(desc(delayRate))
Q1

Q2 <- (not_cancelled %>% group_by(dest) %>% 
           summarize(flights=n(), avg_dist=mean(distance), avg_arr_delay=mean(arr_delay)))
Q2

Q3 <- Q2 %>% filter(flights>=20, dest!='HNL')

plot(Q3$avg_dist, Q3$avg_arr_delay, 
     xlab = 'average distance', ylab='average delay')
x <- Q3$avg_dist
y <- Q3$avg_arr_delay
abline(lm(y~x), col='red')