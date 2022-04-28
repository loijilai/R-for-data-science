minwage <- read.csv("/Users/abner/A/Mac/Downloads/minwage.csv")
head(minwage)
new <- minwage %>% mutate(fteBefore = fullBefore + 0.5*partBefore, 
                          fteAfter = fullAfter + 0.5*partAfter, 
                          NJ = ifelse(location == "PA",0,1))
new_tidy <- gather(new, key = "Allfte", value = "fte", fteAfter:fteBefore)
new_tidy_1 <- new_tidy %>% mutate(after = ifelse(Allfte == "fteAfter",1,0))
new_tidy_2 <- select(new_tidy_1, fte, NJ, after)
head(new_tidy_2, 10)
apply(new_tidy_2, 2, mean)

DID <- lm(fte ~ NJ + after + NJ:after, data = new_tidy_2)
summary(DID)
## fte = 20.299 means if People lives in PA and before wage adjustment, the minimum wage = 20.299.
## People in PA get 3.01 higher minimumwage than people doesn't live in PA.
## The minimum wage before wage adjustment is 2.134 higher than after adjustment.(It's not significant)
## When people lives in PA and after wage adjustment, the minimum wage will increase by 2.446.(Not significant too)
