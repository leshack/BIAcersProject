#Loading Packages 

if (!is.element("languageserver", installed.packages()[, 1])) {
  install.packages("languageserver", dependencies = TRUE)
}
require("languageserver")

if (!is.element("e1071", installed.packages()[, 1])) {
  install.packages("e1071", dependencies = TRUE)
}
require("e1071")

if (!is.element("Amelia", installed.packages()[, 1])) {
  install.packages("Amelia", dependencies = TRUE)
}
require("Amelia")

if (!is.element("corrplot", installed.packages()[, 1])) {
  install.packages("corrplot", dependencies = TRUE)
}
require("corrplot")

if (!is.element("ggcorrplot", installed.packages()[, 1])) {
  install.packages("ggcorrplot", dependencies = TRUE)
}
require("ggcorrplot")

if (!is.element("readr", installed.packages()[, 1])) {
  install.packages("readr", dependencies = TRUE)
}
require("readr")

if (!is.element("caret", installed.packages()[, 1])) {
  install.packages("caret", dependencies = TRUE)
}
require("caret")

if (!is.element("naniar", installed.packages()[, 1])) {
  install.packages("naniar", dependencies = TRUE)
}
require("naniar")

if (!is.element("dplyr", installed.packages()[, 1])) {
  install.packages("dplyr", dependencies = TRUE)
}
require("dplyr")

if (!is.element("ggplot2", installed.packages()[, 1])) {
  install.packages("ggplot2", dependencies = TRUE)
}
require("ggplot2")

if (!is.element("mice", installed.packages()[, 1])) {
  install.packages("mice", dependencies = TRUE)
}
require("mice")

## e1071 ----
if (require("e1071")) {
  require("e1071")
} else {
  install.packages("e1071", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## factoextra ----
if (require("factoextra")) {
  require("factoextra")
} else {
  install.packages("factoextra", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## FactoMineR ----
if (require("FactoMineR")) {
  require("FactoMineR")
} else {
  install.packages("FactoMineR", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}



# Lab 1: Loading Datasets ----


library(readr)
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- read_csv("data/STREAMLINING PROCESSES AT KINYANJUI FARM.csv")
View(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)

# Lab 2: Exploratory Data Analysis ----
## Dimensions ----
###  Preview the Loaded Datasets ----
# Dimensions refer to the number of observations (rows) and the number of
# attributes/variables/features (columns). Execute the following commands to
# display the dimensions of your datasets:
dim(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)

## Data Types ----
### Identify the Data Types ----
# Knowing the data types will help you to identify the most appropriate
# visualization types and algorithms that can be applied. It can also help you
# to identify the need to convert from categorical data (factors) to integers
# or vice versa where necessary. Execute the following command to identify the
# data types:
sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, class)


## Descriptive Statistics ----

### Measures of Frequency ----

#### Identify the number of instances that belong to Gender ----
# It is more sensible to count categorical variables (factors or dimensions)
# than numeric variables, e.g., counting the number of male and female

streamlining_processes_freq <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$Gender
cbind(frequency = table(streamlining_processes_freq),
      percentage = prop.table(table(streamlining_processes_freq)) * 100)

streamlining_processes_freq <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$JobRole
cbind(frequency = table(streamlining_processes_freq),
      percentage = prop.table(table(streamlining_processes_freq)) * 100)

streamlining_processes_freq <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$BusinessTravel
cbind(frequency = table(streamlining_processes_freq),
      percentage = prop.table(table(streamlining_processes_freq)) * 100)

### Measures of Central Tendency ----
#### Mode ----

streamlining_processes_gender_mode <- names(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$Gender))[
  which(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$Gender) == max(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$Gender)))
]
print(streamlining_processes_gender_mode)

streamlining_processes_jobRole_mode <- names(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$JobRole))[
  which(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$JobRole) == max(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$JobRole)))
]
print(streamlining_processes_jobRole_mode)


streamlining_processes_businessRole_mode <- names(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$BusinessTravel))[
  which(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$BusinessTravel) == max(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$BusinessTravel)))
]
print(streamlining_processes_businessRole_mode)

### Measures of Distribution/Dispersion/Spread/Scatter/Variability ----

summary(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)

STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- na.omit(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)

#### Measure the standard deviation ----

sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 10, 11, 13,14, 15 , 17 , 19, 20 , 21,  25, 26, 27 , 28 ,29, 30, 31 , 32 , 33 , 34 ,35  )], sd)

#### Measure the variance of each variable ----
  
sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 10, 11, 13,14, 15 , 17 , 19, 20 , 21,  25, 26, 27 , 28 ,29, 30, 31 , 32 , 33 , 34 ,35  )], var)

#### Measure the kurtosis of each variable ---- 

sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[,c(1,4, 6, 7, 9, 10, 11, 13,14, 15 , 17 , 19, 20 , 21,  25, 26, 27 , 28 ,29, 30, 31 , 32 , 33 , 34 ,35  )], kurtosis, type = 2)

#### Measure the skewness of each variable ----

sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 10, 11, 13,14, 15 , 17 , 19, 20 , 21,  25, 26, 27 , 28 ,29, 30, 31 , 32 , 33 , 34 ,35  )],  skewness, type = 2)

## Measures of Relationship ----

### Measure the correlation between variables ----


streamlining_processes_cov <- cov(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 10, 11, 13,14, 15 , 17 , 19, 20 , 21,  25, 26, 27 , 28 ,29, 30, 31 , 32 , 33 , 34 ,35  )])
View(streamlining_processes_cov)

### Measure the covariance between variables ----

streamlining_processes_cor <- cor(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 10, 11, 13,14, 15 , 17 , 19, 20 , 21,  25, 26, 27 , 28 ,29, 30, 31 , 32 , 33 , 34 ,35  )])
View(streamlining_processes_cor)

# Inferential Statistics ----

streamlining_processes_one_way_anova <- aov( Age ~ Attrition , data = STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)
summary(streamlining_processes_one_way_anova)

streamlining_processes_two_way_anova <- aov(Age  ~ Attrition + Gender, data = STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)
summary(streamlining_processes_two_way_anova)

# Basic Visualization ----
## Univariate Plots ----
### Create Histograms for Each Numeric Attribute ----
str(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)

# Identify numeric columns
numeric_columns <- sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, is.numeric)

# Extract only numeric columns
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, numeric_columns]

STREAMLINING_PROCESSES_AT_KINYANJUI_FARM<- sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, as.numeric)

# Set up the layout for multiple histograms
par(mfrow = c(1, sum(numeric_columns)))

# Plot histograms for numeric columns
for (i in 1:ncol(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)) {
  hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, i], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[i])
}

hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 1], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[1])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 4], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[4])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 6], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[6])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 7], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[7])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 9], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[9])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 10], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[10])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 11], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[11])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 13], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[13])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 14], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[14])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 15], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[15])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 17], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[17])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 19], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[19])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 20], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[20])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 21], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[21])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 25], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[25])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 26], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[26])


### Create Box and Whisker Plots for Each Numeric Attribute ----

# Set up the layout for multiple histograms

# Plot histograms for numeric columns
for (i in 1:ncol(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)) {
  jpeg("boxplot.jpg", width = 800, height = 600)
  boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 1], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[1])
  dev.off()
  
}

boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 1], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[1])
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 4], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[4])
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 6], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[6])
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 7], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[7])
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 9], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[9])
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 10], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[10])
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 11], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[11])
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 13], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[13])
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 14], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[14])
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 15], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[15])
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 17], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[17])
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 19], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[19])
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 20], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[20])
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 21], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[21])
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 25], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[25])
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 26], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[26])

### Create Bar Plots for Each Categorical Attribute Gender ----

library(readr)
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- read_csv("data/STREAMLINING PROCESSES AT KINYANJUI FARM.csv")


barplot(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 2]), main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[2])

### Create a Missingness Map to Identify Missing Data ----

missmap(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, col = c("red", "grey"), legend = TRUE)

## Multivariate Plots ----

### Create a Correlation Plot ----

corrplot(cor(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 10, 11, 13,14, 15 , 17 , 19, 20 , 21,  25, 26, 27 , 28 ,29, 30, 31 , 32 , 33 , 34 ,35  )]), method = "circle")

ggcorrplot(cor(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 10, 11, 13,14, 15 , 17 , 19, 20 , 21,  25, 26, 27 , 28 ,29, 30, 31 , 32 , 33 , 34 ,35  )]))

### Create a Scatter Plot ----

# Select only numeric columns
#numeric_columns <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, is.numeric)]

# Create scatterplot matrix
#pairs(numeric_columns, col = STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$Attrition)

### Create Multivariate Box and Whisker Plots by Class ----

library(readr)
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- read_csv("data/STREAMLINING PROCESSES AT KINYANJUI FARM.csv")

featurePlot(x = STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 10, 11, 13,14, 15 , 17 , 19, 20 , 21,  25, 26, 27 , 28 ,29, 30, 31 , 32 , 33 , 34 ,35  )], y = STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 2],
            plot = "box")

# Preprocessing and Data Transformation ----
## Confirm the "missingness" in the Initial Dataset ----

# Are there missing values in the dataset?
any_na(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)

# How many?
n_miss(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)

# What is the percentage of missing data in the entire dataset?
prop_miss(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)

# How many missing values does each variable have?
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM %>% is.na() %>% colSums()

# What is the number and percentage of missing values grouped by
# each variable?
miss_var_summary(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)

# What is the number and percentage of missing values grouped by
# each observation?
miss_case_summary(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)

# Which variables contain the most missing values?
gg_miss_var(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)

# Where are missing values located (the shaded regions in the plot)?
vis_miss(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM) + theme(axis.text.x = element_text(angle = 80))

# Which combinations of variables are missing together?
gg_miss_upset(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)

# Create a heatmap of "missingness" broken down by "Age"
# First, confirm that the "AgeDecade" variable is a categorical variable
is.factor(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$Age)
# Second, create the visualization
gg_miss_fct(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, fct = Age)

# We can also create a heatmap of "missingness" broken down by "Depressed"
# First, confirm that the "Depressed" variable is a categorical variable
is.factor(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$Attrition)
# Second, create the visualization
gg_miss_fct(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, fct = Attrition)

# Data Transformation
# Scale Data Transform ----
# BEFORE
# Identify numeric columns

library(readr)
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- read_csv("data/STREAMLINING PROCESSES AT KINYANJUI FARM.csv")
numeric_columns <- sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, is.numeric)

# Extract only numeric columns
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, numeric_columns]

STREAMLINING_PROCESSES_AT_KINYANJUI_FARM<- sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, as.numeric)

# Set up the layout for multiple histograms
par(mfrow = c(1, sum(numeric_columns)))

# Plot histograms for numeric columns
for (i in 1:ncol(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)) {
  hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, i], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[i])
}
summary(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)

hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 1], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[1])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 4], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[4])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 6], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[6])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 7], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[7])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 9], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[9])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 10], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[10])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 11], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[11])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 13], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[13])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 14], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[14])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 15], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[15])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 17], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[17])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 19], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[19])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 20], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[20])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 21], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[21])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 25], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[25])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 26], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[26])

model_of_the_transform <- preProcess(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, method = c("scale"))
print(model_of_the_transform)
streamling_processes_scale_transform <- predict(model_of_the_transform,
                                          STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)

#After
summary(streamling_processes_scale_transform)
hist(streamling_processes_scale_transform[, 1], main = names(streamling_processes_scale_transform)[1])
hist(streamling_processes_scale_transform[, 4], main = names(streamling_processes_scale_transform)[4])
hist(streamling_processes_scale_transform[, 6], main = names(streamling_processes_scale_transform)[6])
hist(streamling_processes_scale_transform[, 7], main = names(streamling_processes_scale_transform)[7])
hist(streamling_processes_scale_transform[, 9], main = names(streamling_processes_scale_transform)[9])
hist(streamling_processes_scale_transform[, 10], main = names(streamling_processes_scale_transform)[10])
hist(streamling_processes_scale_transform[, 11], main = names(streamling_processes_scale_transform)[11])
hist(streamling_processes_scale_transform[, 13], main = names(streamling_processes_scale_transform)[13])
hist(streamling_processes_scale_transform[, 14], main = names(streamling_processes_scale_transform)[14])
hist(streamling_processes_scale_transform[, 15], main = names(streamling_processes_scale_transform)[15])
hist(streamling_processes_scale_transform[, 17], main = names(streamling_processes_scale_transform)[17])
hist(streamling_processes_scale_transform[, 19], main = names(streamling_processes_scale_transform)[19])
hist(streamling_processes_scale_transform[, 20], main = names(streamling_processes_scale_transform)[20])
hist(streamling_processes_scale_transform[, 21], main = names(streamling_processes_scale_transform)[21])
hist(streamling_processes_scale_transform[, 25], main = names(streamling_processes_scale_transform)[25])
hist(streamling_processes_scale_transform[, 26], main = names(streamling_processes_scale_transform)[26])



# Center Data Transform ----

# BEFORE
summary(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 1], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[1])
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 2], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[2])
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 3], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[3])
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 5], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[5])
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 6], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[6])
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 7], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[7])
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 8], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[8])
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 9], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[9])
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 10], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[10])
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 11], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[11])
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 12], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[12])
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 13], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[13])
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 14], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[14])

model_of_the_transform <- preProcess(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, method = c("center"))
print(model_of_the_transform)
streamling_processes_center_transform <- predict(model_of_the_transform, # nolint
                                           STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)

# AFTER

summary(streamling_processes_center_transform)
boxplot(streamling_processes_center_transform[, 1], main = names(streamling_processes_center_transform)[1])
boxplot(streamling_processes_center_transform[, 2], main = names(streamling_processes_center_transform)[2])
boxplot(streamling_processes_center_transform[, 3], main = names(streamling_processes_center_transform)[3])
boxplot(streamling_processes_center_transform[, 5], main = names(streamling_processes_center_transform)[5])
boxplot(streamling_processes_center_transform[, 6], main = names(streamling_processes_center_transform)[6])
boxplot(streamling_processes_center_transform[, 7], main = names(streamling_processes_center_transform)[7])
boxplot(streamling_processes_center_transform[, 8], main = names(streamling_processes_center_transform)[8])
boxplot(streamling_processes_center_transform[, 9], main = names(streamling_processes_center_transform)[9])
boxplot(streamling_processes_center_transform[, 10], main = names(streamling_processes_center_transform)[10])
boxplot(streamling_processes_center_transform[, 11], main = names(streamling_processes_center_transform)[11])
boxplot(streamling_processes_center_transform[, 12], main = names(streamling_processes_center_transform)[12])
boxplot(streamling_processes_center_transform[, 13], main = names(streamling_processes_center_transform)[13])
boxplot(streamling_processes_center_transform[, 14], main = names(streamling_processes_center_transform)[14])

# Standardize Data Transform to have a std of 1  ----
### The Standardize Basic Transform on the Boston Housing Dataset ----
# BEFORE

library(readr)
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- read_csv("data/STREAMLINING PROCESSES AT KINYANJUI FARM.csv")

summary(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)
sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(4, 6, 7, 9, 10, 11, 13,14, 15 , 17 , 19, 20 , 21,  25, 26, 27 , 28 ,29, 30, 31 , 32 , 33 , 34 ,35  )], sd)


model_of_the_transform <- preProcess(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM,
                                     method = c("scale", "center"))
print(model_of_the_transform)
streamling_processes_standardize_transform <- predict(model_of_the_transform, # nolint
                                                STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)

# AFTER
summary(streamling_processes_standardize_transform)
sapply(streamling_processes_standardize_transform[, c(4, 6, 7, 9, 10, 11, 13,14, 15 , 17 , 19, 20 , 21,  25, 26, 27 , 28 ,29, 30, 31 , 32 , 33 , 34 ,35  )], sd)


# Training Model ----

## 1. Split the dataset
train_index <- createDataPartition(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$Attrition,
                                   p = 0.75,
                                   list = FALSE)
streamling_processes_train <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[train_index, ]
streamling_processes_test <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[-train_index, ]

