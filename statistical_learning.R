# https://github.com/yahwes/ISLR/blob/master/ch02soln.Rmd

# 1. read the data
college <- read.csv("College.csv")

# 2. look at the rownames and make the first column as the rownames and delete
# the first column
rownames(college)
rownames(college) <- college[, 1]
college <- college[, -1]

# 3. produce numerical summary of the variables in the data set
summary(college)

# 4. use pair() function to produce a scatterplot matrix of first 10 columns
pairs(college[, 1:10])

# 5. use plot() function to produce side-by-side boxplots of 'Outstate' vs 'Private'
plot(college$Private, college$Outstate)

# 6. create a qualitative variable with student in top 10% > 50
Elite <- rep("No", nrow(college))
Elite[college$Top10perc > 50]="Yes"
Elite=as.factor(Elite)
college=data.frame(college, Elite)

# 7. use summary() function to see how many elite universities there are
summary(Elite)

# 8. produce histograms
par(mfrow=c(2,2))
hist(college$Apps, breaks = 50, xlim = c(0,30000), ylim = c(0,300), main = "Apps")
hist(college$Enroll, breaks = 25, xlim = c(0,30000), ylim = c(0,300), main = "Enroll")
hist(college$Expend, breaks = 25, xlim = c(0,30000), ylim = c(0,300), main = "Expend")
hist(college$Outstate, xlim = c(0,30000), ylim = c(0,300), main = "Outstate")
#===============================================================================
# 1. read the data
auto <- read.csv("Auto.csv")
str(auto)

# 2. which variables are quantitative and qualitative
# origin and name are qualitative and rest are quantitative

# 3. mean and standard deviation of each quantitative variable
sapply(auto[,1:7], mean)

# 4. remove 10th through 85th observations
observations_removed <- auto[-(10:85),]

# 5. scatterplot
pairs(auto[,1:7])

# mpg is negatively correlated with cylinders, displacement, horsepower, and weight
#===============================================================================
# 1. read the data
library(MASS)
?Boston
str(Boston)     # 506 rows and 14 columns
Boston      # each row is a separate town, each column is a different parameter of the town

# 2 pairwise scatterplots
pairs(Boston)

# there seems to be some positive relation between 'crim' and 'rm'

# 3 correlation between variables and 'crim'
library(ggplot2)
library(reshape2)
boston_melt <- melt(data = Boston, id = 'crim')
ggplot(data = boston_melt, aes(x = value, y = crim)) +
        facet_wrap(~variable, scales = "free") +
        geom_point()
corrmatrix <- cor(Boston, use = "complete.obs")

# 4 relation between suburbs and crime rate, tax rate, pupil teacher ratio
ggplot(Boston, aes(x = 1:nrow(Boston), y = crim)) + geom_point()
ggplot(Boston, aes(x = 1:nrow(Boston), y = tax)) + geom_point()
ggplot(Boston, aes(x = 1:nrow(Boston), y = ptratio)) + geom_point()

# 5 suburbs bound to charles river
table(Boston$chas)     # 35 suurbs bound to Charles river

# 6 median pupil-teacher ratio among the towns in this data set
median(Boston$ptratio)

# 7 suburbs of Boston with lowest median value of owner occupied homes
Boston[Boston$medv == min(Boston$medv),]
sapply(Boston, quantile)

# 8 suburbs averaging more than 7 rooms per dwelling
nrow(Boston[Boston$rm > 7,])    # 64 rooms
nrow(Boston[Boston$rm > 8,])    # 13 rooms
sapply(Boston[Boston$rm > 8,], mean)....# mean for more than 8 rooms
sapply(Boston, median)....# median for all the variables
