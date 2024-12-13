DF <- read.csv("all-states-history.csv", header=TRUE)
library(psych)
library(dplyr)

#question 1

ggplot(DF, aes(x = hospitalizedCurrently, y = positiveTestsAntibody)) +
  geom_point()
plot(DF, hospitalizedCurrently, positiveTestsAntibody)

DFfiltered <- filter(DF, positiveTestsAntibody > 0)
View(DFfiltered)

ggplot(DFfiltered, aes(x = hospitalizedCurrently, y = positiveTestsAntibody)) +
  geom_point()
DFpr <- filter(DFfiltered, state == "PR")

ggplot(DFpr, aes(x = positiveTestsAntibody, y = hospitalizedCurrently)) +
  geom_point()
cor(DFpr$positiveTestsAntibody, DFpr$hospitalizedCurrently)
plot(DFpr$positiveTestsAntibody, DFpr$hospitalizedCurrently)

DFga <- filter(DFfiltered, state == "GA")
cor(DFga$positiveTestsAntibody, DFga$hospitalizedCurrently)
plot(DFga$positiveTestsAntibody, DFga$hospitalizedCurrently)

DFtx <- filter(DFfiltered, state == "TX")
cor(DFtx$positiveTestsAntibody, DFtx$hospitalizedCurrently)
plot(DFtx$positiveTestsAntibody, DFtx$hospitalizedCurrently)

DFva <- filter(DFfiltered, state == "VA")
cor(DFva$positiveTestsAntibody, DFva$hospitalizedCurrently)
plot(DFva$positiveTestsAntibody, DFva$hospitalizedCurrently)

DFky <- filter(DFfiltered, state == "KY")
cor(DFky$positiveTestsAntibody, DFky$hospitalizedCurrently)
plot(DFky$positiveTestsAntibody, DFky$hospitalizedCurrently)

DFco <- filter(DFfiltered, state == "CO")
cor(DFco$positiveTestsAntibody, DFco$hospitalizedCurrently)
plot(DFco$positiveTestsAntibody, DFco$hospitalizedCurrently)

#question 2

DFil <- filter(DF, date == "2021-03-07")
DFarr <- arrange(DFil, desc(positive))
View(DFarr)
DFarr <- select(DFarr, date, state, positive)
View(DFarr)
