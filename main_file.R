install.packages('dplyr')
install.packages('ggplot2')
library('dplyr')
library('ggplot2')

View(dplus)

dplus <- read.csv("C:/Users/ashwa/OneDrive/Documents/Columbia/Data Analysis/disney_plus_titles.csv")
valstat <- read.csv("C:/Users/ashwa/OneDrive/Documents/Columbia/Data Analysis/valorant-stats.csv")

dplus <- data.frame(dplus$type, dplus$title, dplus$listed_in, dplus$duration, dplus$release_year, dplus$rating, dplus$country)
valstat <- data.frame(valstat$Weapon.Type, valstat$Price, valstat$Fire.Rate, valstat$Wall.Penetration, valstat$Magazine.Capacity, valstat$BDMG_0, valstat$BDMG_1, valstat$BDMG_2)

#Hypothesis 1 for Disney+: Media rated PG has the longest duration.
#Hypothesis 2 for Disney+: TV shows are more likely to be categorized as "Family" than "Drama".
#Hypothesis 1 for Valorant: Sidearms are the most cost-effective weapon type.
#Hypothesis 2 for Valorant: Weapons with high fire rates have lower wall penetration.