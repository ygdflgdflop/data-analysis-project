install.packages(c('dplyr', 'ggplot2', 'randomForest', 'shiny', 'shinythemes'))
library('dplyr')
library('ggplot2')
library('randomForest')
library('shiny')
library('shinythemes')

valstat <- read.csv("C:/Users/ashwa/OneDrive/Documents/Columbia/Data Analysis/valorant-stats.csv")
valstat <- data.frame(valstat$Weapon.Type, valstat$Price, valstat$Fire.Rate, valstat$Wall.Penetration, valstat$Magazine.Capacity, valstat$BDMG_0, valstat$BDMG_1, valstat$BDMG_2)
colnames(valstat) <- c('Type', 'Price', 'Fire.Rate', 'Wall.Penetration', 'Magazine.Capacity', 'BDMG_0', 'BDMG_1', 'BDMG_2')

#Hypothesis 1 for Valorant: Sidearms are the most cost-effective weapon type.
#Hypothesis 2 for Valorant: Weapons with high fire rates have lower wall penetration.

ggplot(valstat, aes(x=Type, y=valstat$BDMG_2)) + geom_tile()

index <- sample(2, nrow(valstat), replace=TRUE, prob=(c(0.9, 0.1)))

trainData <- valstat[index == 1, ]
testData <- valstat[index == 2, ]
trainData <- na.omit(trainData)

valmodel <- randomForest(as.factor(Type)~., data=trainData)

sampleGun <- data.frame(Price=1000, Fire.Rate=4, Wall.Penetration='Low', Magazine.Capacity=4, BDMG_0=20, BDMG_1=20, BDMG_2=10)

predict(valmodel, testData)
