setwd("/home/loijilai/CS-hub/myR/R-for-data-science")
cci <- read.csv("datasets/finalproject/CCI new.csv")[,c(1,2)]
cci

m2 <- read.csv("datasets/finalproject/M2年增率.csv", header = F)
m2
# 改季資料

save <- read.csv("datasets/finalproject/Save.csv", header = F)
save

twii <- read.csv("datasets/finalproject/^TWII.csv")[,c(1,6)]
twii
#改季資料

mortgage <- read.csv("datasets/finalproject/五大行庫平均房貸利率.csv", header = F)
mortgage
# 改順序, 改季資料

price <- read.csv("datasets/finalproject/國泰房價指數.csv", header = F)
price
# 改順序

cpi <- read.csv("datasets/finalproject/消費者物價指數.csv", header = F)
cpi
# 改順序, 改季資料

# econgrowth <- read_xlsx("datasets/finalproject/23.臺灣經濟成長率.xlsx")
