Auto <- read_csv("C:/Users/brand/OneDrive/Desktop/School/DataDrivenDiscovery/Labs/Lab2/Auto.csv")
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
