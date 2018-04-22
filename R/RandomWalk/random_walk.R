set.seed(2)

len <- 2000

w <- rnorm(len, mean = 0, sd = 1)

x <- rep(0, len)

#Simulation
for (i in 2:len) x[i] <- x[i-1] + w[i]

plot(x, type = 'l')
  
#ACF
acf(x)

#Differentiate to make it stationary
acf(diff(x), na.action = na.omit)
