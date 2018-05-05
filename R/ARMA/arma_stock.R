rm(list=ls())

#this is how we can fetch finance related date from the web
require(quantmod)

#we download S&P500 prices from Yahoo Finance
getSymbols("^GSPC",src="yahoo")

PETR <- read.csv(file="..\\Data\\SP500.csv", header=TRUE, sep=",")

#log daily returns
returns <- diff(log(PETR$Adj.Close))

#calculate the optimal q and p values with AIC
solution.aic <- Inf
solution.order <- c(0,0,0)

#we don't know the q and p parameters so lets generate several ARMA(p,q) models
#and choose the best according to the AIC
for(i in 1:4) for(j in 1:4) { 
  
  actual <- arima(returns,order=c(i,0,j),optim.control=list(maxit = 1000))
  
  if( actual$aic < solution.aic){
    solution.aic <- actual$aic
    solution.order <- c(i,0,j)
    solution.arma <- actual
  }
}

#fitted model
solution.order

#autocorrelation plot
acf(resid(solution.arma),na.action=na.omit, lag.max = 35)

#Ljung-Box test for the y(t) residual series
Box.test(resid(solution.arma),lag=20,type="Ljung-Box")
