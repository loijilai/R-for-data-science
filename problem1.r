#1.
suidata <- c(5427, 5688, 6198, 6462, 6635, 7336, 7248, 7491, 8161, 8578, 9000)
#2. 
set.seed(2015)


Matrix <- runif(11)
for(i in 1:99999){
    Matrix <- rbind(Matrix, runif(11))
}
Matrix
dim(Matrix)

cor_vector <- cor(suidata, Matrix[i,])
for(i in 2:100000){
    cor_vector <- append(cor_vector, cor(suidata, Matrix[i,]))
}
#5. 
#5.1
length(cor_vector[cor_vector>0.9])

#6.
which()
