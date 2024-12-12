#BIS44 Final Project: COVID Data

##Create a copy as data and convert date to date form
data <- all.states.history
data$date <- as.Date(data$date)

##Question 1: Did recovery rates increase over time?

##Calculate the total number of recovered patients 
##and the total number of positive patients per date
recovery_data <- data %>%
  group_by(date) %>%
  summarize(
    total_recovered = sum(recovered, na.rm = TRUE),##na.rm ignored na values
    total_positive = sum(positive, na.rm = TRUE)
  )

##Using tot_rec and tot_pos we can create a new column, percent recovered
recovery_data <- recovery_data %>%
  mutate(percent_recovered = (total_recovered / total_positive) * 100)

##Plot it
plot(recovery_data$date, recovery_data$percent_recovered,
     type = "l", #line graph
     xlab = "Date",
     ylab = "Percent Recovered",
     main = "COVID-19 Recovery Rate Over Time")


#Question 2: Are there significant differences in the percent of positive tests 
# between antibody and viral test kits?

# Creates a new dataframe with the desired observations ommiting those wtih na 
testkit_data <- data[, c("positiveTestsAntibody", "totalTestsAntibody",
                      "positiveTestsViral", "totalTestsViral")]
testkit_data <- na.omit(testkit_data)

# Find the percent of positive tests for each type of test
testkit_data$percent_positive_antibody <- (testkit_data$positiveTestsAntibody /
                                      testkit_data$totalTestsAntibody) * 100
testkit_data$percent_positive_viral <- (testkit_data$positiveTestsViral /
                                    testkit_data$totalTestsViral) * 100

# Perform a t test to determine if the difference between tests is significant
t_result <- t.test(testkit_data$percent_positive_antibody,
                   testkit_data$percent_positive_viral,
                   paired = TRUE)
print(t_result)

# Make a boxplot to visualize the data
# First, the two percent positive observations must be combined
testkit_combined <- reshape(
  testkit_data[, c("percent_positive_antibody", "percent_positive_viral")],
  varying = c("percent_positive_antibody", "percent_positive_viral"),
  v.names = "percent_positive",
  timevar = "test_type",
  times = c("Antibody", "Viral"),
  direction = "long"
)
ggplot_shiny(testkit_combined)
