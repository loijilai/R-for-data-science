minwage <- read.csv('minwage.csv')
head(minwage)
minwage_adj <- minwage 
minwage_adj$fteBefore <- minwage_adj$fullBefore + 0.5*minwage_adj$partBefore 
minwage_adj$fteAfter <- minwage_adj$fullAfter + 0.5*minwage_adj$partAfter
minwage_adj$NJ <- ifelse(minwage_adj$location=='PA', 0, 1)
minwage_adj_long <-  rbind(minwage_adj, minwage_adj) 
minwage_adj_long$fte <- c(minwage_adj_long$fteAfter[1:358], 
                          minwage_adj_long$fteBefore[1:358])
minwage_adj_long$after <- c(rep(1, 358),rep(0, 358))
regress_data <- minwage_adj_long[, c('fte', 'NJ', 'after')]
apply(regress_data, 2, mean)
