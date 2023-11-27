# Loading Packages----

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

## e1071 
if (require("e1071")) {
  require("e1071")
} else {
  install.packages("e1071", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## factoextra 
if (require("factoextra")) {
  require("factoextra")
} else {
  install.packages("factoextra", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## FactoMineR 
if (require("FactoMineR")) {
  require("FactoMineR")
} else {
  install.packages("FactoMineR", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

# STEP 1. Install and Load the Required Packages 
## randomForest 
if (require("randomForest")) {
  require("randomForest")
} else {
  install.packages("randomForest", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## RRF 
if (require("RRF")) {
  require("RRF")
} else {
  install.packages("RRF", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
## caretEnsemble 
if (require("caretEnsemble")) {
  require("caretEnsemble")
} else {
  install.packages("caretEnsemble", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## C50 
if (require("C50")) {
  require("C50")
} else {
  install.packages("C50", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## adabag 
if (require("adabag")) {
  require("adabag")
} else {
  install.packages("adabag", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
## plumber 
if (require("plumber")) {
  require("plumber")
} else {
  install.packages("plumber", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
## httr 
if (require("httr")) {
  require("httr")
} else {
  install.packages("httr", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## jsonlite 
if (require("jsonlite")) {
  require("jsonlite")
} else {
  install.packages("jsonlite", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}




# Loading Datasets ----


library(readr)
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- read_csv("data/STREAMLINING PROCESSES AT KINYANJUI FARM.csv")
View(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)

# STEP 1 : Exploratory Data Analysis ----
## Dimensions 
###  Preview the Loaded Datasets ----
# Dimensions refer to the number of observations (rows) and the number of
# attributes/variables/features (columns). Execute the following commands to
# display the dimensions of your datasets:
dim(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)

### Data Types ----
### Identify the Data Types ----
# Knowing the data types will help you to identify the most appropriate
# visualization types and algorithms that can be applied. It can also help you
# to identify the need to convert from categorical data (factors) to integers
# or vice versa where necessary. Execute the following command to identify the
# data types:
sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, class)

# Drop specified columns
columns_to_drop <- c('EmployeeCount', 'EmployeeNumber', 'Over18', 'StandardHours')
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, !(names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM) %in% columns_to_drop)]
View(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)

## Descriptive Statistics ----

#### Measures of Frequency ----

#### Identify the number of instances that belong to Gender
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

#### Measures of Central Tendency ----
#### Mode 

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

#### Measures of Distribution/Dispersion/Spread/Scatter/Variability ----

summary(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)

STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- na.omit(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)

#### Measure the standard deviation ----

sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 11, 12, 13, 15 , 17 , 18, 19,  21, 22, 23,24, 25, 26, 27, 28 ,29, 30, 31   )], sd)

#### Measure the variance of each variable ----
  
sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 11, 12, 13, 15 , 17 , 18, 19,  21, 22, 23,24, 25, 26, 27, 28 ,29, 30, 31   )], var)

#### Measure the kurtosis of each variable ---- 

sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 11, 12, 13, 15 , 17 , 18, 19,  21, 22, 23,24, 25, 26, 27, 28 ,29, 30, 31   )], kurtosis, type = 2)

#### Measure the skewness of each variable ----

sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 11, 12, 13, 15 , 17 , 18, 19,  21, 22, 23,24, 25, 26, 27, 28 ,29, 30, 31   )],  skewness, type = 2)

## Measures of Relationship ----

### Measure the correlation between variables ----


streamlining_processes_cov <- cov(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 11, 12, 13, 15 , 17 , 18, 19,  21, 22, 23,24, 25, 26, 27, 28 ,29, 30, 31   )])
View(streamlining_processes_cov)

### Measure the covariance between variables ----

streamlining_processes_cor <- cor(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 11, 12, 13, 15 , 17 , 18, 19,  21, 22, 23,24, 25, 26, 27, 28 ,29, 30, 31   )])
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

# Drop specified columns
columns_to_drop <- c('EmployeeCount', 'EmployeeNumber', 'Over18', 'StandardHours')
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, !(names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM) %in% columns_to_drop)]

barplot(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 2]), main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[2])

### Create a Missingness Map to Identify Missing Data ----

missmap(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, col = c("red", "grey"), legend = TRUE)

## Multivariate Plots ----

### Create a Correlation Plot ----

corrplot(cor(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 11, 12, 13, 15 , 17 , 18, 19,  21, 22, 23,24, 25, 26, 27, 28 ,29, 30, 31   )]), method = "circle")

ggcorrplot(cor(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 11, 12, 13, 15 , 17 , 18, 19,  21, 22, 23,24, 25, 26, 27, 28 ,29, 30, 31   )]))

### Create a Scatter Plot ----

# Select only numeric columns
#numeric_columns <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, is.numeric)]

# Create scatterplot matrix
#pairs(numeric_columns, col = STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$Attrition)

### Create Multivariate Box and Whisker Plots by Attrition ----

library(readr)
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- read_csv("data/STREAMLINING PROCESSES AT KINYANJUI FARM.csv")

# Drop specified columns
columns_to_drop <- c('EmployeeCount', 'EmployeeNumber', 'Over18', 'StandardHours')
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, !(names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM) %in% columns_to_drop)]
featurePlot(x = STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 11, 12, 13, 15 , 17 , 18, 19,  21, 22, 23,24, 25, 26, 27, 28 ,29, 30, 31   )], y = STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 2],
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

# Drop specified columns
columns_to_drop <- c('EmployeeCount', 'EmployeeNumber', 'Over18', 'StandardHours')
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, !(names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM) %in% columns_to_drop)]
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

# Drop specified columns
columns_to_drop <- c('EmployeeCount', 'EmployeeNumber', 'Over18', 'StandardHours')
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, !(names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM) %in% columns_to_drop)]
summary(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)
sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 11, 12, 13, 15 , 17 , 18, 19,  21, 22, 23,24, 25, 26, 27, 28 ,29, 30, 31   )], sd)


model_of_the_transform <- preProcess(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM,
                                     method = c("scale", "center"))
print(model_of_the_transform)
streamling_processes_standardize_transform <- predict(model_of_the_transform, # nolint
                                                STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)

# AFTER
summary(streamling_processes_standardize_transform)
sapply(streamling_processes_standardize_transform[, c(1,4, 6, 7, 9, 11, 12, 13, 15 , 17 , 18, 19,  21, 22, 23,24, 25, 26, 27, 28 ,29, 30, 31   )], sd)


# Training Model ----

## 1. Split the dataset
train_index <- createDataPartition(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$Attrition,
                                   p = 0.75,
                                   list = FALSE)
train_streamling_processes_train <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[train_index, ]
test_streamling_processes_test <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[-train_index, ]

# Check the column names of pima_train
colnames(train_streamling_processes_train)

## OPTION 1: naiveBayes() function in the e1071 package
# Train the Naive Bayes model
e107_streamling_processes_dataset_model_nb_e1071 <-
  e1071::naiveBayes(Attrition ~ .,
                    data = train_streamling_processes_train)

# Testing 
predictions_nb_e1071 <-
  predict(e107_streamling_processes_dataset_model_nb_e1071,
          test_streamling_processes_test[, 1:31])

# Check unique levels
unique_levels_pred <- levels(predictions_nb_e1071)
unique_levels_actual <- levels(test_streamling_processes_test$Attrition)

# Compare levels
setdiff(unique_levels_pred, unique_levels_actual)
setdiff(unique_levels_actual, unique_levels_pred)

# Convert predictions to factor and align levels
predictions_nb_e1071 <- as.factor(predictions_nb_e1071)
#levels(predictions_nb_e1071) <- levels(test_streamling_processes_test$Attrition)

#Update Actual Levels to Match Predicted Levels
test_streamling_processes_test$Attrition <- as.factor(test_streamling_processes_test$Attrition)
levels(test_streamling_processes_test$Attrition) <- levels(predictions_nb_e1071)


# View the Results
print(predictions_nb_e1071)

# Confusion Matrix
conf_matrix <- caret::confusionMatrix(predictions_nb_e1071,
                                      test_streamling_processes_test$Attrition)
print(conf_matrix)

# The confusion matrix can also be viewed graphically,
# although with less information.
plot(table(predictions_nb_e1071,
           test_streamling_processes_test$`Attrition`))

### Bootstrapping train control 

#train_control <- trainControl(method = "boot", number = 10000)

#streamling_processes_dataset_model_lm <- caret::train(`MonthlyIncome` ~`Attrition` ,
    #                                  data = train_streamling_processes_train,
    #                                  trControl = train_control,
    #                                  method = "lm",
    #                                  metric = "RMSE")


### Test the trained linear regression model using the testing dataset 
#predictions_lm <- predict(streamling_processes_dataset_model_lm,
 #                         test_streamling_processes_test[, 1:31])

### View the RMSE and the predicted values for the 9 observations 
#print(streamling_processes_dataset_model_lm)
#print(predictions_lm)

### Classification: LDA with k-fold Cross Validation ----

### LDA Attritionifier based on a 5-fold cross validation 

train_control_lda <- trainControl(method = "cv", number = 5)

streamling_dateset_model_lda <-
  caret::train(`Attrition` ~ ., data = STREAMLINING_PROCESSES_AT_KINYANJUI_FARM,
               trControl = train_control_lda, na.action = na.omit, method = "lda2",
               metric = "Accuracy")

### 3.b. Test the trained LDA model using the testing dataset 
predictions_lda <- predict(streamling_dateset_model_lda,
                           test_streamling_processes_test[, 1:31])

### 3.c. View the summary of the model and view the confusion matrix
print(streamling_dateset_model_lda)
caret::confusionMatrix(predictions_lda, test_streamling_processes_test$Attrition)

plot(table(predictions_lda, test_streamling_processes_test$Attrition))

### Classification: Naive Bayes with Repeated k-fold Cross Validation ----
### 4.a. Train an e1071::naive Bayes Attritionifier based on the churn variable
streamling_dateset_model_nb <-
  e1071::naiveBayes(`Attrition` ~ ., data = train_streamling_processes_train)

### 4.b. Test the trained naive Bayes Attritionifier using the testing dataset 
predictions_nb_e1071 <-
  predict(streamling_dateset_model_nb, test_streamling_processes_test[, 1:31])

### 4.c. View a summary of the naive Bayes model and the confusion matrix 
print(streamling_dateset_model_nb)
caret::confusionMatrix(predictions_nb_e1071, test_streamling_processes_test$Attrition)

plot(table(predictions_nb_e1071, test_streamling_processes_test$Attrition))

### Classification: SVM with Repeated k-fold Cross Validation ----
### 5.a. SVM Attritionifier using 5-fold cross validation with 3 reps 
# We train a Support Vector Machine (for Classification) using "Churn" variable
# in the training dataset based on a repeated 5-fold cross validation train
# control with 10 reps.

# The repeated k-fold cross-validation method involves repeating the number of
# times the dataset is split into k-subsets. The final model accuracy/RMSE is
# taken as the mean from the number of repeats.

train_control_svm <- trainControl(method = "repeatedcv", number = 5, repeats = 10)

streamling_dateset_model_svm <-
  caret::train(`Attrition` ~ ., data = train_streamling_processes_train,
               trControl = train_control_svm, na.action = na.omit,
               method = "svmLinearWeights2", metric = "Accuracy")

### 5.b. Test the trained SVM model using the testing dataset 
predictions_svm <- predict(streamling_dateset_model_svm, test_streamling_processes_test[, 1:31])

### 5.c. View a summary of the model and view the confusion matrix 
print(streamling_dateset_model_svm)
caret::confusionMatrix(predictions_svm, test_streamling_processes_test$Attrition)
plot(table(predictions_svm, test_streamling_processes_test$Attrition))

### Classification: Naive Bayes with Leave One Out Cross Validation ----
# In Leave One Out Cross-Validation (LOOCV), a data instance is left out and a
# model constructed on all other data instances in the training set. This is
# repeated for all data instances.

### 6.a. Train a Naive Bayes Attritionifier based on an LOOCV 
train_control_loocv <- trainControl(method = "LOOCV")

streamling_dateset_model_nb_loocv <-
  caret::train(`Attrition` ~ ., data = train_streamling_processes_train,
               trControl = train_control_loocv, na.action = na.omit,
               method = "naive_bayes", metric = "Accuracy")

### 6.b. Test the trained model using the testing dataset
predictions_nb_loocv <-
  predict(streamling_dateset_model_nb_loocv, test_streamling_processes_test[, 1:31])

### 6.c. View the confusion matrix 
print(streamling_dateset_model_nb_loocv)
caret::confusionMatrix(predictions_nb_loocv, test_streamling_processes_test$Attrition)
plot(table(predictions_nb_loocv, test_streamling_processes_test$Attrition))

# Actual Model Algorithm ----

### Train the model ----
set.seed(7)
train_control <- trainControl(method = "cv", number = 5)
streamling_caret_model_svm_radial <- # nolint: object_length_linter.
  train(Attrition ~ ., data = train_streamling_processes_train, method = "svmRadial",
        metric = "Accuracy", trControl = train_control)

#### Display the model's details 
print(streamling_caret_model_svm_radial)

#### Make predictions 
predictions <- predict(streamling_caret_model_svm_radial,
                       test_streamling_processes_test[, 1:31])

#### Display the model's evaluation metrics   
table(predictions, test_streamling_processes_test$Attrition)
confusion_matrix <-
  caret::confusionMatrix(predictions,
                         test_streamling_processes_test[, 1:31]$Attrition)
print(confusion_matrix)



# Load required libraries
library(ggplot2)

# Convert the confusion matrix to a data frame
conf_matrix_df <- as.data.frame(as.table(confusion_matrix$table))

# Rename columns for clarity
names(conf_matrix_df) <- c("Reference", "Prediction", "Frequency")

# Plot the confusion matrix as a heatmap
ggplot(data = conf_matrix_df, aes(x = Reference, y = Prediction, fill = Frequency)) +
  geom_tile() +
  geom_text(aes(label = Frequency)) +
  scale_fill_gradient(low = "white", high = "blue") +
  labs(title = "Confusion Matrix") +
  theme_minimal()


## Model Performance and Comparison ----

train_control <- trainControl(method = "repeatedcv", number = 10, repeats = 3)

### LDA
set.seed(7)
streamling_model_lda <- train(Attrition ~ ., data = STREAMLINING_PROCESSES_AT_KINYANJUI_FARM,
                            method = "lda", trControl = train_control)

### CART
set.seed(7)
streamling_model_cart <- train(Attrition ~ ., data = STREAMLINING_PROCESSES_AT_KINYANJUI_FARM,
                             method = "rpart", trControl = train_control)

### KNN 
set.seed(7)
streamling_model_knn <- train(Attrition ~ ., data = STREAMLINING_PROCESSES_AT_KINYANJUI_FARM,
                            method = "knn", trControl = train_control)

### SVM 
set.seed(7)
streamling_model_svm <- train(Attrition ~ ., data = STREAMLINING_PROCESSES_AT_KINYANJUI_FARM,
                            method = "svmRadial", trControl = train_control)

### Random Forest 
set.seed(7)
streamling_model_rf <- train(Attrition ~ ., data = STREAMLINING_PROCESSES_AT_KINYANJUI_FARM,
                           method = "rf", trControl = train_control)

## 3.b. Call the `resamples` Function
# We then create a list of the model results and pass the list as an argument
# to the `resamples` function.

results <- resamples(list(LDA = streamling_model_lda, CART = streamling_model_cart,
                          KNN = streamling_model_knn, SVM = streamling_model_svm,
                          RF = streamling_model_rf))

scales <- list(x = list(relation = "free"), y = list(relation = "free"))
bwplot(results, scales = scales)

scales <- list(x = list(relation = "free"), y = list(relation = "free"))
dotplot(results, scales = scales)

splom(results)

# xyplot plots to compare models
xyplot(results, models = c("LDA", "SVM"))

# or
# xyplot plots to compare models
xyplot(results, models = c("SVM", "CART"))

diffs <- diff(results)

summary(diffs)


# Hyper Parameter Tunning ----

# Apply a "Grid Search" to identify the best parameter value
# Each axis of the grid is an algorithm parameter, and points on the grid are
# specific combinations of parameters.

seed <- 7
metric <- "Accuracy"
train_control <- trainControl(method = "repeatedcv", number = 10, repeats = 3,
                              search = "grid")
set.seed(seed)

getModelInfo("RRFglobal")

# The Regularized Random Forest algorithm exposes the "coefReg" parameter
# in addition to the "mtry" parameter for tuning.
## The "mtry" parameter
# Number of variables randomly sampled as candidates at each split.

## The "coefReg" parameter 
# It stands for coefficient(s) of regularization.
# A smaller coefficient may lead to a smaller feature subset, i.e.,
# there are fewer variables with non-zero importance scores. coefReg must be
# either a single value (all variables have the same coefficient) or a numeric
# vector of length equal to the number of predictor variables. default: 0.8

tunegrid <- expand.grid(.mtry = c(1:10),
                        .coefReg = seq(from = 0.1, to = 1, by = 0.1))

streamling_model_grid_search_rrf_global <- train(Attrition ~ ., data = STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, # nolint
                                            method = "RRFglobal",
                                            metric = metric,
                                            tuneGrid = tunegrid,
                                            trControl = train_control)
print(streamling_model_grid_search_rrf_global)
plot(streamling_model_grid_search_rrf_global)

# Ensemble methods ----

### Boosting ----
#### AdaBoost.M1 ----
seed <- 7
metric <- "Accuracy"
train_control <- trainControl(method = "cv", number = 5)


#### Boosting with C5.0 ----
# C5.0
set.seed(seed)
ion_model_c50 <- train(Attrition ~ ., data = STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, method = "C5.0",
                       metric = metric,
                       trControl = train_control)

####  Boosting with Stochastic Gradient Boosting ----
set.seed(seed)
ion_model_gbm <- train(Attrition ~ ., data = STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, method = "gbm",
                       metric = metric, trControl = train_control,
                       verbose = FALSE)


# Summarize results 
boosting_results <-
  resamples(list("C5.0 boosting ensemble" = ion_model_c50,
                 "Generalized Boosted Regression Modeling (GBM)" =
                   ion_model_gbm
                ))

summary(boosting_results)
dotplot(boosting_results)



# Save and Load your Model ----
# Saving a model into a file allows you to load it later and use it to make
# predictions. Saved models can be loaded by calling the `readRDS()` function

saveRDS(streamling_caret_model_svm_radial, "./models/saved_streamling_caret_model_svm_radial.rds")
# The saved model can then be loaded later as follows:
loaded_streamling_model_svm <- readRDS("./models/saved_streamling_caret_model_svm_radial.rds")
print(loaded_streamling_model_svm)

predictions_with_loaded_model <-
  predict(loaded_streamling_model_svm, newdata = test_streamling_processes_test)
confusionMatrix(predictions_with_loaded_model, test_streamling_processes_test$Attrition)

to_be_predicted <-
  data.frame(
  Age = 41,
  BusinessTravel = "Travel_Rarely",
  DailyRate = 1102,
  Department = "Sales",
  DistanceFromHome = 1,
  Education = 2,
  EducationField = "Life Sciences",
  EnvironmentSatisfaction = 2,
  Gender = "Female",
  HourlyRate = 94,
  JobInvolvement = 3,
  JobLevel = 2,
  JobRole = "Sales Executive",
  JobSatisfaction = 4,
  MaritalStatus = "Single",
  MonthlyIncome = 5993,
  MonthlyRate = 19479,
  NumCompaniesWorked = 8,
  OverTime = "Yes",
  PercentSalaryHike = 11,
  PerformanceRating = 3,
  RelationshipSatisfaction = 1,
  StockOptionLevel = 0,
  TotalWorkingYears = 8,
  TrainingTimesLastYear = 0,
  WorkLifeBalance = 1,
  YearsAtCompany = 6,
  YearsInCurrentRole = 4,
  YearsSinceLastPromotion = 0,
  YearsWithCurrManager = 5
)

predict(loaded_streamling_model_svm, to_be_predicted)

### Make predictions using the model through a function 

predict_attrition <-
  function(arg_Age, arg_BusinessTravel, arg_DailyRate,
           arg_Department, arg_DistanceFromHome, arg_Education, arg_EducationField,
           arg_EnvironmentSatisfaction, arg_Gender,
           arg_HourlyRate, arg_JobInvolvement, arg_JobLevel, arg_JobRole,
           arg_JobSatisfaction, arg_MaritalStatus, arg_MonthlyIncome, arg_MonthlyRate,
           arg_NumCompaniesWorked, arg_OverTime, arg_PercentSalaryHike,
           arg_PerformanceRating, arg_RelationshipSatisfaction, arg_StockOptionLevel,
           arg_TotalWorkingYears, arg_TrainingTimesLastYear, arg_WorkLifeBalance, arg_YearsAtCompany,
           arg_YearsInCurrentRole, arg_YearsSinceLastPromotion, arg_YearsWithCurrManager) {
    
    # Create a data frame using the arguments
    to_be_predicted <- data.frame(Age = arg_Age, 
                                  BusinessTravel = arg_BusinessTravel, DailyRate = arg_DailyRate,
                                  Department = arg_Department, DistanceFromHome = arg_DistanceFromHome,
                                  Education = arg_Education, EducationField = arg_EducationField,
                                  EnvironmentSatisfaction = arg_EnvironmentSatisfaction, Gender = arg_Gender,
                                  HourlyRate = arg_HourlyRate, JobInvolvement = arg_JobInvolvement,
                                  JobLevel = arg_JobLevel, JobRole = arg_JobRole,
                                  JobSatisfaction = arg_JobSatisfaction, MaritalStatus = arg_MaritalStatus,
                                  MonthlyIncome = arg_MonthlyIncome, MonthlyRate = arg_MonthlyRate,
                                  NumCompaniesWorked = arg_NumCompaniesWorked, 
                                  OverTime = arg_OverTime, PercentSalaryHike = arg_PercentSalaryHike,
                                  PerformanceRating = arg_PerformanceRating,
                                  RelationshipSatisfaction = arg_RelationshipSatisfaction,
                                  StockOptionLevel = arg_StockOptionLevel,
                                  TotalWorkingYears = arg_TotalWorkingYears,
                                  TrainingTimesLastYear = arg_TrainingTimesLastYear,
                                  WorkLifeBalance = arg_WorkLifeBalance, YearsAtCompany = arg_YearsAtCompany,
                                  YearsInCurrentRole = arg_YearsInCurrentRole,
                                  YearsSinceLastPromotion = arg_YearsSinceLastPromotion,
                                  YearsWithCurrManager = arg_YearsWithCurrManager)
    
    # Make a prediction based on the data frame
    predict(loaded_streamling_model_svm, to_be_predicted)
  }
predict_attrition(41,
                 "Travel_Rarely",
                 1102,
                 "Sales",
                 1,
                 2,
                "Life Sciences",
                 2,
                 "Female",
                 94,
                 3,
                 2,
                 "Sales Executive",
                 4,
                 "Single",
                 5993,
                 19479,
                 8,
                 "Yes",
                 11,
                 3,
                 1,
                 0,
                 8,
                 0,
                 1,
                 6,
                 4,
                 0,
                 5)

#  Plumber API ----  

### Process a Plumber API ----
# This allows us to process a plumber API
api <- plumber::plumb("PlumberAPI.R")

### Run the API on a specific port ----
# Specify a constant localhost port to use
api$run(host = "127.0.0.1", port = 5022)


### Generate the URL required to access the API ----

# We set this as a constant port 5022 running on localhost
base_url <- "http://127.0.0.1:5022/Attrition"

params <- data.frame(
  arg_Age = 41,
  arg_BusinessTravel = "Travel_Rarely",
  arg_DailyRate = 1102,
  arg_Department = "Sales",
  arg_DistanceFromHome = 1,
  arg_Education = 2,
  arg_EducationField = "Life Sciences",
  arg_EnvironmentSatisfaction = 2,
  arg_Gender = "Female",
  arg_HourlyRate = 94,
  arg_JobInvolvement = 3,
  arg_JobLevel = 2,
  arg_JobRole = "Sales Executive",
  arg_JobSatisfaction = 4,
  arg_MaritalStatus = "Single",
  arg_MonthlyIncome = 5993,
  arg_MonthlyRate = 19479,
  arg_NumCompaniesWorked = 8,
  arg_OverTime = "Yes",
  arg_PercentSalaryHike = 11,
  arg_PerformanceRating = 3,
  arg_RelationshipSatisfaction = 1,
  arg_StockOptionLevel = 0,
  arg_TotalWorkingYears = 8,
  arg_TrainingTimesLastYear = 0,
  arg_WorkLifeBalance = 1,
  arg_YearsAtCompany = 6,
  arg_YearsInCurrentRole = 4,
  arg_YearsSinceLastPromotion = 0,
  arg_YearsWithCurrManager = 5
)



query_url <- httr::modify_url(url = base_url, query = params)
print(query_url)
model_prediction <- GET(query_url)
content(model_prediction)
content(model_prediction)[[1]]

# Parse the response into the right format 
model_prediction_raw <- content(model_prediction, as = "text",
                                encoding = "utf-8")
jsonlite::fromJSON(model_prediction_raw)

get_attrition_predictions <-
  function(arg_Age, arg_BusinessTravel, arg_DailyRate,
           arg_Department, arg_DistanceFromHome, arg_Education, arg_EducationField,
           arg_EnvironmentSatisfaction, arg_Gender,
           arg_HourlyRate, arg_JobInvolvement, arg_JobLevel, arg_JobRole,
           arg_JobSatisfaction, arg_MaritalStatus, arg_MonthlyIncome, arg_MonthlyRate,
           arg_NumCompaniesWorked, arg_OverTime, arg_PercentSalaryHike,
           arg_PerformanceRating, arg_RelationshipSatisfaction, arg_StockOptionLevel,
           arg_TotalWorkingYears, arg_TrainingTimesLastYear, arg_WorkLifeBalance, arg_YearsAtCompany,
           arg_YearsInCurrentRole, arg_YearsSinceLastPromotion, arg_YearsWithCurrManager) {
    
    base_url <- "http://127.0.0.1:5022/Attrition"
    
    params <- list(
      arg_Age = arg_Age,
      arg_BusinessTravel = arg_BusinessTravel,
      arg_DailyRate = arg_DailyRate,
      arg_Department = arg_Department,
      arg_DistanceFromHome = arg_DistanceFromHome,
      arg_Education = arg_Education,
      arg_EducationField = arg_EducationField,
      arg_EnvironmentSatisfaction = arg_EnvironmentSatisfaction,
      arg_Gender = arg_Gender,
      arg_HourlyRate = arg_HourlyRate,
      arg_JobInvolvement = arg_JobInvolvement,
      arg_JobLevel = arg_JobLevel,
      arg_JobRole = arg_JobRole,
      arg_JobSatisfaction = arg_JobSatisfaction,
      arg_MaritalStatus = arg_MaritalStatus,
      arg_MonthlyIncome = arg_MonthlyIncome,
      arg_MonthlyRate = arg_MonthlyRate,
      arg_NumCompaniesWorked = arg_NumCompaniesWorked,
      arg_OverTime = arg_OverTime,
      arg_PercentSalaryHike = arg_PercentSalaryHike,
      arg_PerformanceRating = arg_PerformanceRating,
      arg_RelationshipSatisfaction = arg_RelationshipSatisfaction,
      arg_StockOptionLevel = arg_StockOptionLevel,
      arg_TotalWorkingYears = arg_TotalWorkingYears,
      arg_TrainingTimesLastYear = arg_TrainingTimesLastYear,
      arg_WorkLifeBalance = arg_WorkLifeBalance,
      arg_YearsAtCompany = arg_YearsAtCompany,
      arg_YearsInCurrentRole = arg_YearsInCurrentRole,
      arg_YearsSinceLastPromotion = arg_YearsSinceLastPromotion,
      arg_YearsWithCurrManager = arg_YearsWithCurrManager
    )
    
    
    query_url <- modify_url(url = base_url, query = params)
    
    model_prediction <- GET(query_url)
    
    model_prediction_raw <- content(model_prediction, as = "text",
                                    encoding = "utf-8")
    
    jsonlite::fromJSON(model_prediction_raw)
  }

get_attrition_predictions(41,
                  "Travel_Rarely",
                  1102,
                  "Sales",
                  1,
                  2,
                  "Life Sciences",
                  2,
                  "Female",
                  94,
                  3,
                  2,
                  "Sales Executive",
                  4,
                  "Single",
                  5993,
                  19479,
                  8,
                  "Yes",
                  11,
                  3,
                  1,
                  0,
                  8,
                  0,
                  1,
                  6,
                  4,
                  0,
                  5)

