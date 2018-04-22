#PETR4
PETR <- read.csv(file="C:\\Users\\vinic\\Documents\\GitHub\\Quantitative Finance & Algorithmic Trading II - Time Series\\Data\\PETR4.SA.csv", header=TRUE, sep=",")

adClose <- PETR$Adj.Close

#we want to plot the adjusted closing prices
plot(adClose, type = 'l')

acf(adClose)

acf(diff(adClose),na.action=na.omit)
