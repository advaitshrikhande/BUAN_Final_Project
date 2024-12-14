#Final Project

library(readr)
all_states_history <- read_csv("~/BUAN44/all-states-history.csv")
View(all_states_history)
str(all_states_history)
summary(all_states_history)
library(dplyr)


#Question 1:
#which date had the highest deaths
all_states_history %>% arrange(desc(death))
#greatest number of deaths 54,124 in California


#Question 2:
#Is there a positive correlation between death and tests? 

##scatterplot with plot()
plot( all_states_history$death ~ all_states_history$totalTestResults, data = all_states_history)

##Selecting variables
df_states <- select(all_states_history, totalTestResults, death)

##Correlation matrix with cor()
cor(df_states, use = "complete")


# Load the dataset
data <- read.csv("all-states-history.csv")

# Inspect the structure to ensure relevant columns exist
str(data)






