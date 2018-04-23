require("quantmod")

#Get stock info
getSymbols("AAPL", src='yahoo')

pClose <- Ad(AAPL)

#we want to plot the adjusted closing prices
plot(pClose, type = 'l')

acf(pClose)

acf(diff(pClose),na.action=na.omit)
