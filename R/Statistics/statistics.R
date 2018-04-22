#if you do not have already installed you have to do so
#install.packages("quantmod")

#this is how we can fetch finance related date from the web
require(quantmod)

PETR <- read.csv(file="C:\\Users\\vinic\\Documents\\GitHub\\Quantitative Finance & Algorithmic Trading II - Time Series\\Data\\PETR4.SA.csv", header=TRUE, sep=",")

adClose <- PETR$Adj.Close

#we want to plot the adjusted closing prices
plot(adClose)

#this is the auto-correlation function ... get rid of the NA values
acf(diff(adClose),na.action=na.omit)

#statistics: mean, variance and standard deviation
mean(adClose)
var(adClose)
sd(adClose)

