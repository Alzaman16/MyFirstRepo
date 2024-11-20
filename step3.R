# Load necessary libraries
install.packages("tidyverse")
library(tidyverse)

# Load the data (replace 'file_path' with the actual path to your CSV file)
data <- read.csv("Users/prakashpatel/Desktop\A101\bank_additional_full.csv", sep=",")

data$y <- as.factor(data$y)
data$job <- as.factor(data$job)

str(data)

summary(data)

contingency_table <- table(data$job, data$y)
chi_square_test <- chisq.test(contingency_table)
chi_square_test
