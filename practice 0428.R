## 4/28 course note

## Merging and Reshaping data
##  reshape to tidy data : tidyr package
##  Data Merging : dyplr package
##  Missing Values
------
## first of all
library(tidyverse)
library(dplyr)
library(nycflights13)
------
a <- c(1,2,3,NA,5)
is.na(a)
sum(a)
NA + 10
which(is.na(a))
sum(na.omit(a))
sum(a, na.rm = TRUE)
------
mydata <- data.frame(a = c(1,2,3,99,5),
                     b = c(10,99,30,40,50))
mydata$a[mydata$a == 99] <- mydata$b[mydata$b == 99] <- NA
mydata
mydata[complete.cases(mydata), ] ## 2 and 4 have NA, so it only shows column 1,3,5
na.omit(mydata) ## same as above
break

------
flights
(not_cancelled <- flights %>% filter(!is.na(dep_delay), !is.na(arr_delay)))
break
------
## How to do data merging?
break
df2 <- data.frame(CustomerId = c(2, 4, 6),
                  State = c(rep("Alabama", 2),
                            rep("Ohio", 1)))
df2
df1 <- data.frame(CustomerId = c(1 : 5),
                  Product = c(rep("Apple", 3),
                              rep("Banana", 2)))
merge(x = df1, y = df2, by = "CustomerId", all.x = TRUE)
merge(x = df1, y = df2, by = "CustomerId", all.y = TRUE)
break
## Merge in dplyr
------
break

inner_join(df1,df2)  ## = merge(x,y,by = )
full_join(df1,df2)   ## = merge(x,y,by = , all = TRUE)
left_join(df1,df2)   ## = merge(x,y,by = , all.x = TRUE)
right_join(df1,df2)  ## = merge()x,y,by = , all.y = TRUE)
break
------
##set operator
break
intersect(1:10, 6:15)
union(1:10, 6:15)
setdiff(1:10, 6:15)
setdiff(6:15, 1:10)
setequal(1:5,1:6)
setequal(1:5,5:1)
break
------
break
data(polls_us_election_2016)
head(results_us_election_2016)
tab <- left_join(murders, results_us_election_2016, by = "state") %>%
        select(-others) %>% rename(ev = electoral_votes)
head(tab)
tab1 <- slice(tab, 1:5)
head(tab1)
tab2 <- slice(tab, 3:7)
head(tab2)
dplyr :: intersect(tab1,tab2)
dplyr::union(tab1,tab2)
union(tab1,tab2)
path <- system.file("extdata", package = "dslabs")
filename <- file.path(path,
                      "fertility-two-countries-example.csv")
wide_data <- read.csv(filename)
dim(wide_data)
head(wide_data)
tidy_data <- gather(wide_data, key = year, value = fertility, "X1960":"X2015")
head(tidy_data)
table1
table2
new_tidy <- spread(table2, key = type, value = count)
head(new_tidy)
table3
table3 %>% separate(rate, into = c("cases", "population"), sep = "/")
table3 %>% separate(rate, into = c("caese", "population"), sep = "/", convert = TRUE)

