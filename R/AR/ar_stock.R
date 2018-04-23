require("quantmod")

#Get stock info
getSymbols("AAPL", src='yahoo')

pClose <- Ad(AAPL)

#we want to plot the adjusted closing prices
plot(pClose, type = 'l')

#log daily returns of AAPL stock (for adjusted closing price)
pReturn = diff(log(pClose))

#plot the returns
plot(pReturn)

#autocorrelation function plot
acf(pReturn,na.action=na.omit)

#use autoregressive model to approximate the coefficients
pReturn.ar <- ar(pReturn, na.action = na.omit)
#the order of AR(p) model (so the value of p)
pReturn.ar$order
#the coefficients: as many as the value of p
pReturn.ar$ar
#calculate the variance for the coefficients to be able to calculate the error
pReturn.ar$asy.var

0.036541+c(-1.96,1.96)*sqrt(3.647e-04)
0.027684+c(-1.96,1.96)*sqrt(3.649e-04)
-0.06132+c(-1.96,1.96)*sqrt(3.647e-04)

acf(pReturn.ar$resid, na.action = na.omit)
