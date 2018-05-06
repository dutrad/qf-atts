rm(list=ls())

#this is how we can fetch finance related date from the web
require(quantmod)
#this is how we can make predictions in the future
require(forecast)

#we download IBM stock prices from Yahoo Finance
getSymbols("PETR4.SA",src="yahoo")

#log daily returns
returns <- diff(log(Ad(PETR4.SA)))
head(returns)

returns <- returns[-1]

#let's find the optimal p,d,q values with AIC 
result.aic <- Inf
result.order <- c(0,0,0)

for (p in 1:4) for (d in 0:1) for (q in 1:4){
  actual <- arima(returns, order=c(p, d, q),optim.control=list(maxit = 1000))
  
  if (actual$aic < result.aic) { 
    result.aic <- actual$aic 
    result.order <- c(p, d, q) 
    result.arima <- actual
  } 
}

#order of ARIMA model
result.order

#check autocorrelation
acf(resid(result.arima),na.action=na.omit)

#check Ljung-Box p-value
Box.test(resid(result.arima),lag=25,type="Ljung-Box")

#let's forecast the log daily returns in the coming 50 days!!!
plot(forecast(result.arima,h=50))

result.arima$coef
confint(result.arima)
