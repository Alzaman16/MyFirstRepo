# Load necessary libraries
install.packages("tidyverse")
library(tidyverse)

# Load the data (replace 'file_path' with the actual path to your CSV file)
data <- read.csv("/Users/prakashpatel/Desktop/A101/New/bank_additional_full.csv", sep=",")

data$y <- as.factor(data$y)
data$job <- as.factor(data$job)

str(data)

summary(data)

contingency_table <- table(data$job, data$y)
chi_square_test <- chisq.test(contingency_table)
chi_square_test

# Load ggplot2 library
library(ggplot2)

# Create a simple bar plot to show proportions
ggplot(data, aes(x = job, fill = y)) +
  geom_bar(position = "fill") +
  labs(title = "Subscriptions by Job Type", x = "Job Type", y = "Proportion") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))