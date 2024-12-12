#Final Project

library(readr)
all_states_history <- read_csv("~/BUAN 44/all-states-history.csv")
View(all_states_history)
str(all_states_history)
summary(all_states_history)
library(dplyr)


#Question 1:
#Does Texas have the most deaths out of all the states? 
all_states_history %>% arrange(desc(death))
#greatest number of deaths 54,124 in California


#Question 2:
#Is there a positive correlation between death and positiveTestsAntibody? 

##scatterplot with plot()
plot( all_states_history$positiveTestsAntibody ~ all_states_history$death, data = all_states_history)

##Selecting variables
df_states <- select(all_states_history, positiveTestsAntibody, death)

##Correlation matrix with cor()
cor(df_states, use = "complete")







