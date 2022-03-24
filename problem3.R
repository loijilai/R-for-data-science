data <- read.csv('/home/loijilai/programming/myR/R-for-data-science/rds_list_new.csv')


head(data)
student_id <- gsub("[?]", "", data[,3])
student_id

chin_eng <- gsub("[?]", "", data[,4])
chin_eng

chinese <- gsub("[A-z]|-| |,", "", chin_eng)
chinese

eng <- gsub("[^A-z\\-\\,\\ ]", "", chin_eng) 
eng

student_table <- matrix(0, 44, 2)
student_table[,1] <- student_id
student_table[,2] <- chinese
student_table

set.seed(123)
index <- sample(1:44, 44, replace = FALSE)
index

seat_table <- matrix(0, 20, 5)
rownames(seat_table) <- c(1:20)
colnames(seat_table) <- c('V1', 'V2', 'V3', 'V4', 'V5')
seat_table

student_table[index,1] #亂的學生姓名學號表

###########################
for(i in index){
    seat_table[1,] <- student_table[index,1]
    
     student_table[index,1]
}
    
