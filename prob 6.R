not_cancelled <- filter(flights, !is.na(dep_delay), !is.na(arr_delay))
prob1 <- not_cancelled %>% group_by(year, month, day) %>% 
         summarize( delay_rate = mean(arr_delay > 60)) %>% arrange(desc(delay_rate))
prob2 <- not_cancelled %>% group_by(dest) %>% summarize( flights = n(), 
         average_dist = mean(distance), average_arr_delay = mean(arr_delay))
prob2


prob3 <- prob2 %>% filter(flights >= 20, dest!=("HNL"))

plot(prob3$average_dist, prob3$average_arr_delay)
x <- prob3$average_dist
y <- prob3$average_arr_delay
abline(lm(y ~ x), cex = 1, pch = 16, col = "red"
       , xlab = "average distance", ylab = "average arrived delay")
