data <- read.csv('/home/loijilai/programming/myR/R-for-data-science/rds_list_new.csv')
head(data)
qrmdata <- gsub("[?]", "", data)

chinese <- gsub("[A-z]|-| |,", "", qrmdata[4])
chinese

eng <- gsub("[^A-z\\-\\,\\ ]", "", qrmdata[4])
eng


