# library
library(ggplot2)
library(tidyverse)
library(readr)

df <- read_csv("04_Share_in_land.csv")
summary(df)
head(df)
tail(df)

# EXAMPLES

# 1. Basic Category-wise Bar Chart (Frequency Count) -------------------->
library(ggplot2)

# Sample data
data <- data.frame(
  Category = c("A", "B", "C", "A", "B", "C", "A", "B")
)

# Create the bar chart
ggplot(data, aes(x = Category)) +
  geom_bar() +
  labs(title = "Frequency of Categories",
       x = "Category",
       y = "Count") +
  theme_minimal()

# 2. Bar Chart with Numerical Values per Category -------------------->
library(ggplot2)

# Sample data
data_values <- data.frame(
  Category = c("A", "B", "C", "D"),
  Value = c(15, 25, 10, 30)
)

# Create the bar chart
ggplot(data_values, aes(x = Category, y = Value)) +
  geom_col(fill = "steelblue") + # Use geom_col for pre-calculated values
  labs(title = "Values per Category",
       x = "Category",
       y = "Value") +
  theme_minimal()

# 3. Grouped Bar Chart (Two Categorical Variables) -------------------->
library(ggplot2)

# Sample data
data_grouped <- data.frame(
  Category1 = c("X", "X", "Y", "Y", "Z", "Z"),
  Category2 = c("P", "Q", "P", "Q", "P", "Q"),
  Value = c(10, 15, 12, 18, 8, 20)
)

# Create the grouped bar chart
ggplot(data_grouped, aes(x = Category1, y = Value, fill = Category2)) +
  geom_col(position = "dodge") + # "dodge" positions bars side-by-side
  labs(title = "Grouped Bar Chart",
       x = "Category 1",
       y = "Value",
       fill = "Category 2") +
  theme_minimal()

# 4. Stacked Bar Chart (Two Categorical Variables) -------------------->

library(ggplot2)

# Sample data (same as grouped for demonstration)
data_stacked <- data.frame(
  Category1 = c("X", "X", "Y", "Y", "Z", "Z"),
  Category2 = c("P", "Q", "P", "Q", "P", "Q"),
  Value = c(10, 15, 12, 18, 8, 20)
)

# Create the stacked bar chart
ggplot(data_stacked, aes(x = Category1, y = Value, fill = Category2)) +
  geom_col(position = "stack") + # "stack" stacks bars on top of each other
  labs(title = "Stacked Bar Chart",
       x = "Category 1",
       y = "Value",
       fill = "Category 2") +
  theme_minimal()

# 4. MINE Grouped Bar Chart (Two Categorical Variables) -------------------->

data_stacked <- read_csv("04_Share_in_land.csv")
summary(df)

ggplot(data_stacked, aes(x = Year, y = Value, fill = Item)) +
    geom_col(position = "stack") + # "stack" stacks bars on top of each other
    labs(title = "Stacked Bar Chart",
       x = "Year",
       y = "Value (%)",
       fill = "Categories") +
    theme(
            axis.text.x = element_text(face="bold", color="black",
                        size=12, angle=45),
            axis.text.y = element_text(face="bold", color="black",
                        size=12, angle=45),
            axis.line = element_line(colour = "mediumpurple4",
                        size = 0.5, linetype = "solid")
        )

