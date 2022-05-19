setwd("/home/loijilai/CS-hub/myR/R-for-data-science")
library(quantmod)
library(tidyverse)
cci <- read.csv("datasets/finalproject/CCI new.csv")[,c(1,2)]
cci <- separate(cci, X.年.月, into = c("year", "month"))
cci
cci <- cci %>% mutate(Quarter = ceiling(as.numeric(cci$month) / 3))

index <- cci$不含.雜項類.之總指數
result <- seq(1, length(index), 3)
index_mean <- sapply(result, function(i){mean(index[i:(i+2)])})[1:37]
index_mean

quarter <- rep(c("Q1", "Q2", "Q3", "Q4"), 10)[1:37]
year <- rep(seq(2013, 2022, 1), 4)
year
year <- year[order(year)][1:37]
length(year)

cci_df <- data.frame(year, quarter, index_mean)

# avg <- function(index){
#     sum <- 0
#     result <- rep(0, 28)
#     for (i in (0:27)){
#         for (j in 1:4){
#             sum <- sum + index[i*4+j] 
#         }
#         result[i+1] <- sum/4
#         sum <- 0
#     }
#     return (result)
# }
# ans <- avg(index)
# ans
# 2013

# m2 <- read.csv("datasets/finalproject/M2年增率.csv", header = F)
# m2
# 改季資料

save <- read.csv("datasets/finalproject/Save.csv", header = F)
save
# 2000

twii <- read.csv("datasets/finalproject/^TWII.csv")[,c(1,6)]
twii
#改季資料
#2000

mortgage <- read.csv("datasets/finalproject/五大行庫平均房貸利率.csv", header = F)
mortgage
# 改順序, 改季資料
# 1994

price <- read.csv("datasets/finalproject/國泰房價指數.csv", header = F)
price
# 改順序
# 2000

cpi <- read.csv("datasets/finalproject/消費者物價指數.csv", header = F)
cpi
# 1980
# 改順序, 改季資料

# econgrowth <- read_xlsx("datasets/finalproject/23.臺灣經濟成長率.xlsx")
