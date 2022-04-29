setwd("/home/loijilai/CS-hub/myR/R-for-data-science")
data <- read.csv("minwage.csv")
head(data)
fteBefore <- data$fullBefore + 0.5 * data$partBefore
fteAfter <- data$fullAfter + 0.5 * data$partAfter
NJ <- ifelse(data$location == "PA", 1, 0)
data <- cbind(data, fteBefore, fteAfter, NJ)
head(data)

data_long <- rbind(data, data)
data_long$fteall <- c(data$fteAfter, data$fteBefore)
head(data_long)
data_long$after <- c(rep(1, 358), rep(0, 358))

head(data_long)
# keep only three variables
length(data_long$fteall)
length(data_long$NJ)
length(data_long$after)
minwage_newdata1 <- 
    data.frame(fte = data_long$fteall, NJ = data_long$NJ, 
               after = data_long$after)
head(minwage_newdata1, 10)
