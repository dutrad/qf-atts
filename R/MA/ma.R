set.seed(1)

len <- 1000

x <- rep(0, len)
w <- rnorm(len)

sys <- c(0.4)

for (k in 3:len) x[k] <- sys*c(w[k-1]) + w[k]

plot(x, type = 'l')
acf(x)

#Ident
x.ma <- arima(x, order = c(0,0,1))
0.3757 + c(-1.96,1.96)*0.0306
