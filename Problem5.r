#data <- read.csv('abtest_website.csv', header=F, skip=1, 
#                 col.names=c('variant', 'converted', 'length_of_stay', 'revenue'))
## problem1.
abtest <- read.csv("abtest_website.csv", header=F, skip=1, 
                   col.names=c('variant', 'converted', 'length_of_stay', 'revenue'))
data.frame(abtest)
summary.data.frame(abtest)

num_A <- subset(abtest, subset=(variant == 'A'))
num_B <- subset(abtest, subset = (variant == 'B'))
num_A_buy <- subset(num_A, subset = (length_of_stay != '0'))
num_B_buy <- subset(num_B, subset = (length_of_stay != '0'))

## problem2.
## H0 : p_B - p_A <= 0 , H1 : p_B - p_A > 0   

## problem3.
  prob_A <- 20/721
  prob_B <- 37/730
  prob_diff <- prob_A-prob_B
  prob_T <- (721*prob_A+730*prob_B)/(721+730)
  Spsqrt <- prob_T*(1-prob_T)
  SE <- sqrt((Spsqrt)*(1/731+1/720))

## problem4.
## ( p_B - p_A ) ~ N(0,SE^2)

## problem5.
mu0 <- 0                         
xLims <- c(-0.05, 0.05)   
x <- seq(from=-0.1, to=0.1, length.out=1451)
crit <- qnorm(0.95, mu0, SE)
curve(dnorm(x, mu0, SE),                     
      xlim = xLims, lwd=2, col="black", xlab="x", ylab="density", 
      main="Normal distribution",  xaxs="i")
abline(v = crit, lty=1, lwd=3, col="blue") 
text(crit+1, 10, adj = 0, label="¡öalpha=0.05")
abline(v = prob_B - prob_A , lty=1, lwd=3, col = 'red')
text(prob_B-prob_A+1,  10,  adj=0, label="¡öcritical value") 

## problem6.
Z_value <- ((prob_B - prob_A)-0 ) / SE
p_value <- (1-pnorm(Z_value))

## problem7.
prop.test(c(730*prob_B,721*prob_A),c(730,721),alternative = c("greater"),correct = FALSE)

## problem8.
##  Reject H0, we can conclude when \alpha = 0.05, 
##  there is a confidence that prob_B is statistically significant 
##  larger that prob_A
