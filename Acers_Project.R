#Loading Packages 

if (!is.element("languageserver", installed.packages()[, 1])) {
  install.packages("languageserver", dependencies = TRUE)
}
require("languageserver")

if (!is.element("e1071", installed.packages()[, 1])) {
  install.packages("e1071", dependencies = TRUE)
}
require("e1071")





# Lab 1: Loading Datasets ----


library(readxl)
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- read_excel("data/STREAMLINING PROCESSES AT KINYANJUI FARM.xlsx")
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

streamlining_processes_freq <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$GENDER
cbind(frequency = table(streamlining_processes_freq),
      percentage = prop.table(table(streamlining_processes_freq)) * 100)

### Measures of Central Tendency ----
#### Mode ----

streamlining_processes_gender_mode <- names(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$GENDER))[
  which(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$GENDER) == max(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$GENDER)))
]
print(streamlining_processes_gender_mode)


### Measures of Distribution/Dispersion/Spread/Scatter/Variability ----

summary(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)

#### Measure the standard deviation ----

sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(2, 3, 5, 6, 7, 8 )], sd)

#### Measure the variance of each variable ----
  
sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(2, 3, 5, 6, 7, 8 )], var)

#### Measure the kurtosis of each variable ---- 

sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[,c(2, 3, 5, 6, 7, 8 )], kurtosis, type = 2)

#### Measure the skewness of each variable ----

sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[,c(2, 3, 5, 6, 7, 8 )],  skewness, type = 2)

## Measures of Relationship ----

### Measure the correlation between variables ----


streamlining_processes_cov <- cov(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(2, 3, 5, 6, 7, 8 )])
View(streamlining_processes_cov)

### Measure the covariance between variables ----

streamlining_processes_cor <- cor(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(2, 3, 5, 6, 7, 8 )])
View(streamlining_processes_cor)
