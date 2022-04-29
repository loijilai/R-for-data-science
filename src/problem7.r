#1. 

#2. 
minwage <- read.csv(file.path("datasets/minwage.csv"))
head(minwage)

#3. 
# Base R version
#3.1
fteBefore <- minwage$fullBefore + 0.5 * minwage$partBefore
fteAfter <- minwage$fullAfter + 0.5 * minwage$partAfter
NJ <- ifelse(minwage$location == "PA", 0, 1)

#3.2
# 將”before”與”after”同類型變數垂直堆疊成一個變數
fte <- c(fteAfter, fteBefore) 
# 並增加一虛擬變數“after”: after=1 indicating the “after” period 
after <- c(rep(1, 358), rep(0, 358))

#3.3
minwage_newdata_1 <-  data.frame(fte = fte, NJ = NJ,  after = after)
head(minwage_newdata_1, 10)


# tidyverse version
# 3.1
minwage_mutate <- minwage %>% 
                  mutate(fteBefore = fullBefore + 0.5*partBefore, 
                         fteAfter = fullAfter + 0.5*partAfter, 
                         NJ = ifelse(location == "PA", 0, 1))

# 3.2
minwage_gather <- minwage_mutate %>% 
                  gather(key = "ftetype", value = "fte", fteAfter:fteBefore) %>%
                  mutate(after = ifelse(ftetype == "fteAfter", 1, 0))

# 3.3
minwage_newdata_2 <- minwage_gather %>% select(fte, NJ, after)
head(minwage_newdata_2, 10)

# 4. Comparison equality
dplyr::setequal(minwage_newdata_1, minwage_newdata_2)

# 5. Regression
DID <- lm(fte ~ NJ + after + NJ:after, data = minwage_newdata_2)
summary(DID)
## fte = 20.299 means if People lives in PA and before wage adjustment, 
## the minimum wage = 20.299.
## People in PA get 3.01 higher minimum wage than people doesn't live in PA.
## The minimum wage before wage adjustment is 2.134 higher than 
## the minimum wage after adjustment.(It's not significant)
## If people lives in PA and after wage adjustment, 
## the minimum wage will increase by 2.446.(Not significant too)

##            |  NJ = 0   |   NJ = 1 |
##  ---------------------------------|
##  after = 0 | "20.299"  |  "17.289"|
##  ---------------------------------|
##  after = 1 | "18.165"  |  "22.745"|