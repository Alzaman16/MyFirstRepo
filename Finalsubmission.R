# Load necessary libraries
install.packages("tidyverse")  # Install if not already installed
library(tidyverse)
# Install dplyr if not already installed
install.packages("dplyr")
# Install ggplot2 (if not already installed)
install.packages("ggplot2")

# Load the ggplot2 package
library(ggplot2)
# Load the dplyr library

library(dplyr)

# Load the dataset (replace with your actual file path)
data <- read.csv("bank_additional_full.csv", sep = ",")

# Step 2: Inspect the dataset
head(data)       # View the first few rows
str(data)        # Check the structure of the dataset
colnames(data)   # Check column names

# Step 3: Explore unique job types
unique_jobs <- unique(data$job)
print(unique_jobs)  # Display all distinct job types in the dataset

# Correct the column name if it's "Job" instead of "job"
filtered_data <- data[data$job %in% c("management", "blue-collar"), ]

# View the first few rows of the filtered data
head(filtered_data)


# Step 5: Create a contingency table for "management" and "blue-collar" jobs
contingency_table <- table(filtered_data$job, filtered_data$y)
print(contingency_table)

# Step 6: Perform a Chi-Square Test
chi_square_test <- chisq.test(contingency_table)
print(chi_square_test)

# Step 7: Visualize the Proportion of Subscriptions by Job Type
ggplot(filtered_data, aes(x = job, fill = y)) +
  geom_bar(position = "fill") +
  labs(title = "Proportion of Subscriptions by Job Type",
       x = "Job Type", y = "Proportion of Subscriptions",
       fill = "Subscription (Yes/No)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))





