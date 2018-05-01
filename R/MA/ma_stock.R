#this is how we can fetch finance related date from the web
require(quantmod)

PETR <- read.csv(file="..\\Data\\SP500.csv", header=TRUE, sep=",")

getSymbols("AAPL", src= "yahoo")

adClose <- PETR$Adj.Close
#we want to plot the adjusted closing prices
plot(Ad(AAPL))

#log daily returns of AAPL stock (for adjusted closing price)
aaplreturn = diff(log(Ad(AAPL)))

plot(aaplreturn)
acf(aaplreturn,na.action=na.omit)

#we set AR=0 and integrated component=0 so it is a MA(3)
aaplreturn.ma <- arima(aaplreturn,order=c(0,0,3))
aaplreturn.ma

#drop the first value because it is NA
aaplreturn.ma$res[-1]

#y=x-x' the residual series: if the model is good there is no serial correlation in y(t)
acf(aaplreturn.ma$res[-1])
