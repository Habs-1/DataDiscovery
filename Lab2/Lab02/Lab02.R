Auto <- read.csv("C:/Users/brand/OneDrive/Desktop/School/DataDrivenDiscovery/Labs/Lab2/Auto.csv")
View(Auto)
Auto <- na.omit(Auto)
# str(Auto) 
# convert horsepower from char to double so it can be in the scatterplot
Auto$horsepower <- as.numeric(Auto$horsepower)
# scatterplot the numerical variables only
Auto_num <- Auto[, -ncol(Auto)]
pairs(Auto_num)
round(cor(Auto_num), digits = 3)
linReg <- lm(mpg ~ . , data = Auto_num)
summary(linReg)
#
# 1. There is a relationship between the predictors and the response as noted by
# the large F statistic of 252.4 and the extremely small p-value of 2.2e-16
#
# 2. The predictors that appear to have significantly significant relationships
# are the ones with the extremely small p-values:
# weight, year, origin, displacement
#
# 3.The coefficient for year is 0.75 which suggests that each year, newer 
# vehicles' mpg will increase by .75 should all other variables stay the same. 
#
par(mfrow=c(4,4))
plot(linReg)
# There are a few unusually large outliers found on the residual plots, 
# 327,323, 336 stand out immediately. The QQ Residuals also has a cluster of 
# unusually large outliers. The leverage plot has a specific instance 14 with 
# an abnormally large leverage.
linReg2 <- lm(mpg ~ weight * year, data = Auto_num)
summary(linReg2)
plot(linReg2)

linReg3 <- lm(mpg ~ log(weight), data = Auto_num)
summary(linReg3)
plot(linReg3)

linReg4 <- lm(mpg ~ sqrt(weight), data = Auto_num)
summary(linReg4)
plot(linReg4)

# The interactions I tested above all seem to be statistically significant as
# they all have very small p-values and large F statistics of 
# 650, 967, and 935. Using the different interactions caused the leverage 
# line of best fit to be more aligned with cook's distance.

