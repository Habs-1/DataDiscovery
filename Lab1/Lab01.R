# Brandon Habschied
# bjh3420@rit.edu
# Lab01
college <- read_csv("C:/Users/brand/OneDrive/Desktop/School/DataDrivenDiscovery/Lab1/College.csv")
rownames(college) = college[,1]
fix(college)
college = college[,-1]
fix(college)
summary(college)
college$Private = as.factor(college$Private)
pairs(college[,1:10])
plot(college$Private, college$Outstate, xlab="Private", ylab="Outstate")
Elite = rep("No",nrow(college))
Elite[college$Top10perc>50]="Yes"
Elite=as.factor(Elite)
college=data.frame(college,Elite)
summary(college)
plot(college$Elite, college$Outstate, xlab="Elite", ylab="Outstate")
par(mfrow=c(2,2))
hist(college$Apps,breaks = 5)
hist(college$Accept, breaks = 3)
hist(college$Grad.Rate, breaks = 10)
hist(college$Books, breaks = 10)
par(mfrow=c(1,1))

print(sd(college$Enroll))
# D.i) The predictors Private and Elite are qualitative. ALL the other predictors are Quantitative
print("D.i) The predictors Private and Elite are qualitative. ALL the other predictors are Quantitative")

# D.ii)  The enroll predictor has a range of 35-6392. Its mean is 780 and its standard deviation is 929.1762
cat("D.ii) The enroll predictor has a range of", min(college$Enroll),"-", max(college$Enroll), "a mean of", mean(college$Enroll), "and a std dev of", sd(college$Enroll))

# D.iii) The new range for enroll is 35-6392. Its new mean is 823.1 and its new standard deviation is 972.2258
college = college[-(100:200),]
cat("D.iii) The enroll predictor without 100-200 has a range of", min(college$Enroll),"-", max(college$Enroll), "a mean of", mean(college$Enroll), "and a std dev of", sd(college$Enroll))
