PETR <- read.csv(file="..\\Data\\PETR4.SA.csv", header=TRUE, sep=",")

adClose <- PETR$Adj.Close

#we want to plot the adjusted closing prices
plot(adClose)

#this is the auto-correlation function ... get rid of the NA values
acf(diff(adClose),na.action=na.omit)

#statistics: mean, variance and standard deviation
mean(adClose)
var(adClose)
sd(adClose)

