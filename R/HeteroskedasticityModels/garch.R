rm(list=ls())

#package needed for GARCH model
#install.packages("tseries")
require("tseries")

set.seed(1)

len <- 2000
#these are the coefficients for GARCH(1,1) model
alpha0 <- 0.1
alpha1 <- 0.4
beta1 <- 0.2

phi <- c(alpha0, alpha1, beta1)

#white noise term values
w <- rnorm(len)

#the actual x(t) time series
x <-rep(0,len)
#volatility squared values
sigma2 <- rep(0,len)

#GARCH(1,1) model simulation
for(t in 2:len){
  sigma2[t] <- phi%*%c(1, (x[t-1])^2, sigma2[t-1])
  x[t] <- w[t]*sqrt(sigma2[t])
}

#autocorrelation plot it seems to be OK 
acf(x)

#but the squared residuals shows there is volatility clustering
acf(x*x)

#use the GARCH function
x.garch <- garch(x,trace=FALSE)
#show the condifence intervals for the parameters
confint(x.garch)

x.garch$coef
