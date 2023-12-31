---
---
---

# Business Intelligence Project

Acers Team 20th November 2023

-   [Student Details](#student-details)
-   [Setup Chunk](#setup-chunk)
    -   [Downloading the Dataset](#downloading-the-dataset)
        -   [Source:](#source)
        -   [Reference:](#reference)
-   [Install and load all the packages](#install-and-load-all-the-packages)
-   [Loading the Dataset](#loading-the-dataset)
-   [Exploratory Data Analysis](#exploratory-data-analysis)
    -   [Descriptive Statistics](#descriptive-statistics)
        -   [Measures of Frequency](#measures-of-frequency)
        -   [Measures of Central Tendency](#measures-of-central-tendency)
        -   [Measures of Distribution/Dispersion/Spread/Scatter/Variability](#measures-of-distributiondispersionspreadscattervariability)
        -   [Measures of Relationship](#measures-of-relationship)
    -   [Inferential Statistics](#inferential-statistics)
    -   [Basic Visualization](#basic-visualization)
        -   [Univariate Plots](#univariate-plots)
        -   [Multivariate Plots](#multivariate-plots)
-   [Preprocessing and Data Transformation](#preprocessing-and-data-transformation)
    -   [Heatmap of "missingness" broken down by "Age"](#heatmap-of-missingness-broken-down-by-age)
    -   [Data Transformation](#data-transformation)
        -   [Scale Data Transform](#scale-data-transform)
        -   [Center Data Transform](#center-data-transform)
        -   [Standardize Data Transform to have a std of 1](#standardize-data-transform-to-have-a-std-of-1)
-   [Training Models](#training-models)
    -   [Split the dataset](#split-the-dataset)
    -   [NaiveBayes() function in the e1071 package](#naivebayes-function-in-the-e1071-package)
        -   [Classification: LDA with k-fold Cross Validation](#classification-lda-with-k-fold-cross-validation)
        -   [Classification: Naive Bayes with Repeated k-fold Cross Validation ----](#classification-naive-bayes-with-repeated-k-fold-cross-validation--)
        -   [Classification: SVM with Repeated k-fold Cross Validation](#classification-svm-with-repeated-k-fold-cross-validation)
        -   [Classification: Naive Bayes with Leave One Out Cross Validation](#classification-naive-bayes-with-leave-one-out-cross-validation)
    -   [Actual Our Model Algorithm](#actual-our-model-algorithm)
    -   [Model Performance and Comparison](#model-performance-and-comparison)
-   [Hyper Parameter Tunning](#hyper-parameter-tunning)
    -   [Grid Search](#grid-search)
-   [Ensemble methods](#ensemble-methods)
    -   [Boosting](#boosting)
        -   [GBM](#gbm)
-   [Save and Load your Model](#save-and-load-your-model)
    -   [Making prediction with the model](#making-prediction-with-the-model)
    -   [Make predictions using the model through a function](#make-predictions-using-the-model-through-a-function)
-   [Plumber API](#plumber-api)
-   [Prediction Web Form And Customer-facing Dashboard](#prediction-web-form-and-customer-facing-dashboard)

------------------------------------------------------------------------

# Student Details {#student-details}

+---------------------------------------------------+---------------------------------------------+
| **Student ID Numbers and Names of Group Members** | 1.  122790 - C - Bwalley Nicholas           |
|                                                   |                                             |
|                                                   | 2.  133834 - C - Mongare Sarah              |
|                                                   |                                             |
|                                                   | 3.  133928 - C - Cheptoi Millicent          |
|                                                   |                                             |
|                                                   | 4.  134879 - C - Tulienge Lesley            |
|                                                   |                                             |
|                                                   | 5.  124461 - C - Kinya Angela               |
+---------------------------------------------------+---------------------------------------------+
| **GitHub Classroom Group Name**                   | Acers Team                                  |
+---------------------------------------------------+---------------------------------------------+
| **Course Code**                                   | BBT4206                                     |
+---------------------------------------------------+---------------------------------------------+
| **Course Name**                                   | Business Intelligence II                    |
+---------------------------------------------------+---------------------------------------------+
| **Program**                                       | Bachelor of Business Information Technology |
+---------------------------------------------------+---------------------------------------------+
| **Semester Duration**                             | 21^st^ August 2023 to 28^th^ November 2023  |
+---------------------------------------------------+---------------------------------------------+

# Setup Chunk {#setup-chunk}

**Note:** the following KnitR options have been set as the global defaults: <BR> `knitr::opts_chunk$set(echo = TRUE, warning = FALSE, eval = TRUE, collapse = FALSE, tidy = TRUE)`.

More KnitR options are documented here <https://bookdown.org/yihui/rmarkdown-cookbook/chunk-options.html> and here <https://yihui.org/knitr/options/>.

## Downloading the Dataset {#downloading-the-dataset}

### Source: {#source}

The dataset that was used can be downloaded here:

<https://www.kaggle.com/code/faressayah/ibm-hr-analytics-employee-attrition-performance/input>

### Reference: {#reference}

F. (2018). IBM HR Analytics Employee Attrition & Performance. Kaggle. <https://www.kaggle.com/code/faressayah/ibm-hr-analytics-employee-attrition-performance/input>

# Install and load all the packages {#install-and-load-all-the-packages}

We installed all the packages that will enable us execute this lab.

``` r
#Loading Packages 

if (!is.element("languageserver", installed.packages()[, 1])) {
  install.packages("languageserver", dependencies = TRUE)
}
require("languageserver")
```

```         
## Loading required package: languageserver
```

``` r
if (!is.element("e1071", installed.packages()[, 1])) {
  install.packages("e1071", dependencies = TRUE)
}
require("e1071")
```

```         
## Loading required package: e1071
```

``` r
if (!is.element("Amelia", installed.packages()[, 1])) {
  install.packages("Amelia", dependencies = TRUE)
}
require("Amelia")
```

```         
## Loading required package: Amelia

## Loading required package: Rcpp

## ## 
## ## Amelia II: Multiple Imputation
## ## (Version 1.8.1, built: 2022-11-18)
## ## Copyright (C) 2005-2023 James Honaker, Gary King and Matthew Blackwell
## ## Refer to http://gking.harvard.edu/amelia/ for more information
## ##
```

``` r
if (!is.element("corrplot", installed.packages()[, 1])) {
  install.packages("corrplot", dependencies = TRUE)
}
require("corrplot")
```

```         
## Loading required package: corrplot

## corrplot 0.92 loaded
```

``` r
if (!is.element("ggcorrplot", installed.packages()[, 1])) {
  install.packages("ggcorrplot", dependencies = TRUE)
}
require("ggcorrplot")
```

```         
## Loading required package: ggcorrplot

## Loading required package: ggplot2
```

``` r
if (!is.element("readr", installed.packages()[, 1])) {
  install.packages("readr", dependencies = TRUE)
}
require("readr")
```

```         
## Loading required package: readr
```

``` r
if (!is.element("caret", installed.packages()[, 1])) {
  install.packages("caret", dependencies = TRUE)
}
require("caret")
```

```         
## Loading required package: caret

## Loading required package: lattice
```

``` r
if (!is.element("naniar", installed.packages()[, 1])) {
  install.packages("naniar", dependencies = TRUE)
}
require("naniar")
```

```         
## Loading required package: naniar
```

``` r
if (!is.element("dplyr", installed.packages()[, 1])) {
  install.packages("dplyr", dependencies = TRUE)
}
require("dplyr")
```

```         
## Loading required package: dplyr

## 
## Attaching package: 'dplyr'

## The following objects are masked from 'package:stats':
## 
##     filter, lag

## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

``` r
if (!is.element("ggplot2", installed.packages()[, 1])) {
  install.packages("ggplot2", dependencies = TRUE)
}
require("ggplot2")

if (!is.element("mice", installed.packages()[, 1])) {
  install.packages("mice", dependencies = TRUE)
}
require("mice")
```

```         
## Loading required package: mice

## 
## Attaching package: 'mice'

## The following object is masked from 'package:stats':
## 
##     filter

## The following objects are masked from 'package:base':
## 
##     cbind, rbind
```

``` r
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
```

```         
## Loading required package: factoextra

## Welcome! Want to learn more? See two factoextra-related books at https://goo.gl/ve3WBa
```

``` r
## FactoMineR ----
if (require("FactoMineR")) {
  require("FactoMineR")
} else {
  install.packages("FactoMineR", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
```

```         
## Loading required package: FactoMineR
```

``` r
# STEP 1. Install and Load the Required Packages ----
## randomForest ----
if (require("randomForest")) {
  require("randomForest")
} else {
  install.packages("randomForest", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
```

```         
## Loading required package: randomForest

## randomForest 4.7-1.1

## Type rfNews() to see new features/changes/bug fixes.

## 
## Attaching package: 'randomForest'

## The following object is masked from 'package:dplyr':
## 
##     combine

## The following object is masked from 'package:ggplot2':
## 
##     margin
```

``` r
## RRF ----
if (require("RRF")) {
  require("RRF")
} else {
  install.packages("RRF", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
```

```         
## Loading required package: RRF

## Registered S3 method overwritten by 'RRF':
##   method      from        
##   plot.margin randomForest

## RRF 1.9.4

## Type rrfNews() to see new features/changes/bug fixes.

## 
## Attaching package: 'RRF'

## The following objects are masked from 'package:randomForest':
## 
##     classCenter, combine, getTree, grow, importance, margin, MDSplot,
##     na.roughfix, outlier, partialPlot, treesize, varImpPlot, varUsed

## The following object is masked from 'package:dplyr':
## 
##     combine

## The following object is masked from 'package:ggplot2':
## 
##     margin
```

``` r
## caretEnsemble ----
if (require("caretEnsemble")) {
  require("caretEnsemble")
} else {
  install.packages("caretEnsemble", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
```

```         
## Loading required package: caretEnsemble

## 
## Attaching package: 'caretEnsemble'

## The following object is masked from 'package:ggplot2':
## 
##     autoplot
```

``` r
## C50 ----
if (require("C50")) {
  require("C50")
} else {
  install.packages("C50", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
```

```         
## Loading required package: C50
```

``` r
## adabag ----
if (require("adabag")) {
  require("adabag")
} else {
  install.packages("adabag", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
```

```         
## Loading required package: adabag

## Loading required package: rpart

## Loading required package: foreach

## Loading required package: doParallel

## Loading required package: iterators

## Loading required package: parallel
```

``` r
## plumber ----
if (require("plumber")) {
  require("plumber")
} else {
  install.packages("plumber", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
```

```         
## Loading required package: plumber
```

``` r
## httr ----
if (require("httr")) {
  require("httr")
} else {
  install.packages("httr", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
```

```         
## Loading required package: httr

## 
## Attaching package: 'httr'

## The following object is masked from 'package:caret':
## 
##     progress
```

``` r
## jsonlite ----
if (require("jsonlite")) {
  require("jsonlite")
} else {
  install.packages("jsonlite", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
```

```         
## Loading required package: jsonlite
```

# Loading the Dataset {#loading-the-dataset}

we are using `readr` to load a data from IBM HR Analytics Employee Attrition & Performance.The dataset has 1470 observation and 31 variables. Employees are the backbone of the organization. Organization's performance is heavily based on the quality of the employees.

``` r
library(readr)
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- read_csv("data/STREAMLINING PROCESSES AT KINYANJUI FARM.csv")
```

```         
## Rows: 1470 Columns: 35
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr  (9): Attrition, BusinessTravel, Department, EducationField, Gender, Job...
## dbl (26): Age, DailyRate, DistanceFromHome, Education, EmployeeCount, Employ...
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

``` r
View(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)
```

# Exploratory Data Analysis {#exploratory-data-analysis}

we used this approach to analyzing data sets to summarize their main characteristics, often with the help of statistical graphics and other data visualization methods. We then drop 'EmployeeCount', 'Over18', 'StandardHours' have only one unique values and 'EmployeeNumber' has 1470 unique values. This features aren't useful for us, So we are going to drop those columns from the dataset

``` r
## Dimensions ----
###  Preview the Loaded Datasets ----
# Dimensions refer to the number of observations (rows) and the number of
# attributes/variables/features (columns). Execute the following commands to
# display the dimensions of your datasets:
dim(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)
```

```         
## [1] 1470   35
```

``` r
## Data Types ----
### Identify the Data Types ----
# Knowing the data types will help you to identify the most appropriate
# visualization types and algorithms that can be applied. It can also help you
# to identify the need to convert from categorical data (factors) to integers
# or vice versa where necessary. Execute the following command to identify the
# data types:
sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, class)
```

```         
##                      Age                Attrition           BusinessTravel 
##                "numeric"              "character"              "character" 
##                DailyRate               Department         DistanceFromHome 
##                "numeric"              "character"                "numeric" 
##                Education           EducationField            EmployeeCount 
##                "numeric"              "character"                "numeric" 
##           EmployeeNumber  EnvironmentSatisfaction                   Gender 
##                "numeric"                "numeric"              "character" 
##               HourlyRate           JobInvolvement                 JobLevel 
##                "numeric"                "numeric"                "numeric" 
##                  JobRole          JobSatisfaction            MaritalStatus 
##              "character"                "numeric"              "character" 
##            MonthlyIncome              MonthlyRate       NumCompaniesWorked 
##                "numeric"                "numeric"                "numeric" 
##                   Over18                 OverTime        PercentSalaryHike 
##              "character"              "character"                "numeric" 
##        PerformanceRating RelationshipSatisfaction            StandardHours 
##                "numeric"                "numeric"                "numeric" 
##         StockOptionLevel        TotalWorkingYears    TrainingTimesLastYear 
##                "numeric"                "numeric"                "numeric" 
##          WorkLifeBalance           YearsAtCompany       YearsInCurrentRole 
##                "numeric"                "numeric"                "numeric" 
##  YearsSinceLastPromotion     YearsWithCurrManager 
##                "numeric"                "numeric"
```

``` r
# Drop specified columns
columns_to_drop <- c('EmployeeCount', 'EmployeeNumber', 'Over18', 'StandardHours')
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, !(names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM) %in% columns_to_drop)]
View(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)
```

### Descriptive Statistics {#descriptive-statistics}

Descriptive statistics are a set of techniques and metrics used to summarize and describe the main features, characteristics, and patterns within a dataset. These statistics provide a snapshot of the data's distribution, central tendency, variability, and other important properties.Before you can effectively use your data for tasks like building prediction models or drawing meaningful conclusions, it's crucial to have a deep understanding of the dataset.Understanding the context is essential for making informed decisions based on those results

#### Measures of Frequency {#measures-of-frequency}

This code calculates and displays the frequency and mode (most common value) for several categorical variables in a dataset, helping to understand the data's distribution and identify prevalent values.Some datasets show relatively even distributions, while others have dominant categories. The frequencies provide insights into the composition of each dataset. we did this to show categorical variables Gender, JobRole and BusinessTravel.

``` r
#### Identify the number of instances that belong to Gender ----
# It is more sensible to count categorical variables (factors or dimensions)
# than numeric variables, e.g., counting the number of male and female

streamlining_processes_freq <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$Gender
cbind(frequency = table(streamlining_processes_freq),
      percentage = prop.table(table(streamlining_processes_freq)) * 100)
```

```         
##        frequency percentage
## Female       588         40
## Male         882         60
```

``` r
streamlining_processes_freq <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$JobRole
cbind(frequency = table(streamlining_processes_freq),
      percentage = prop.table(table(streamlining_processes_freq)) * 100)
```

```         
##                           frequency percentage
## Healthcare Representative       131   8.911565
## Human Resources                  52   3.537415
## Laboratory Technician           259  17.619048
## Manager                         102   6.938776
## Manufacturing Director          145   9.863946
## Research Director                80   5.442177
## Research Scientist              292  19.863946
## Sales Executive                 326  22.176871
## Sales Representative             83   5.646259
```

``` r
streamlining_processes_freq <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$BusinessTravel
cbind(frequency = table(streamlining_processes_freq),
      percentage = prop.table(table(streamlining_processes_freq)) * 100)
```

```         
##                   frequency percentage
## Non-Travel              150   10.20408
## Travel_Frequently       277   18.84354
## Travel_Rarely          1043   70.95238
```

#### Measures of Central Tendency {#measures-of-central-tendency}

``` r
streamlining_processes_gender_mode <- names(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$Gender))[
  which(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$Gender) == max(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$Gender)))
]
print(streamlining_processes_gender_mode)
```

```         
## [1] "Male"
```

``` r
streamlining_processes_jobRole_mode <- names(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$JobRole))[
  which(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$JobRole) == max(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$JobRole)))
]
print(streamlining_processes_jobRole_mode)
```

```         
## [1] "Sales Executive"
```

``` r
streamlining_processes_businessRole_mode <- names(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$BusinessTravel))[
  which(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$BusinessTravel) == max(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$BusinessTravel)))
]
print(streamlining_processes_businessRole_mode)
```

```         
## [1] "Travel_Rarely"
```

#### Measures of Distribution/Dispersion/Spread/Scatter/Variability {#measures-of-distributiondispersionspreadscattervariability}

The code chunk provides various measures of distribution, dispersion, and variability for selected variables in the 'STREAMLINING_PROCESSES_AT_KINYANJUI_FARM' dataset. It includes a summary of the dataset, calculates `standard deviation`, `variance`, `kurtosis`, and `skewness` for specific columns, offering insights into the spread and shape of the data distribution. `Standard deviation` measures the dispersion or spread of data points around the mean, providing insight into data variability. `Variance`measures the spread or dispersion of a set of values. A higher variance indicates greater variability from the mean, while a lower variance suggests that the values are closer to the mean. `Kurtosis` measures the shape of the probability distribution of a real-valued random variable. Positive kurtosis indicates a relatively peaked distribution (heavy tails), while negative kurtosis indicates a flatter distribution (light tails).`Skewness`measures the asymmetry of the probability distribution of a real-valued random variable. Positive skewness indicates a distribution that is skewed to the right (tail on the right), while negative skewness indicates a distribution that is skewed to the left (tail on the left).

``` r
summary(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)
```

```         
##       Age         Attrition         BusinessTravel       DailyRate     
##  Min.   :18.00   Length:1470        Length:1470        Min.   : 102.0  
##  1st Qu.:30.00   Class :character   Class :character   1st Qu.: 465.0  
##  Median :36.00   Mode  :character   Mode  :character   Median : 802.0  
##  Mean   :36.92                                         Mean   : 802.5  
##  3rd Qu.:43.00                                         3rd Qu.:1157.0  
##  Max.   :60.00                                         Max.   :1499.0  
##   Department        DistanceFromHome   Education     EducationField    
##  Length:1470        Min.   : 1.000   Min.   :1.000   Length:1470       
##  Class :character   1st Qu.: 2.000   1st Qu.:2.000   Class :character  
##  Mode  :character   Median : 7.000   Median :3.000   Mode  :character  
##                     Mean   : 9.193   Mean   :2.913                     
##                     3rd Qu.:14.000   3rd Qu.:4.000                     
##                     Max.   :29.000   Max.   :5.000                     
##  EnvironmentSatisfaction    Gender            HourlyRate     JobInvolvement
##  Min.   :1.000           Length:1470        Min.   : 30.00   Min.   :1.00  
##  1st Qu.:2.000           Class :character   1st Qu.: 48.00   1st Qu.:2.00  
##  Median :3.000           Mode  :character   Median : 66.00   Median :3.00  
##  Mean   :2.722                              Mean   : 65.89   Mean   :2.73  
##  3rd Qu.:4.000                              3rd Qu.: 83.75   3rd Qu.:3.00  
##  Max.   :4.000                              Max.   :100.00   Max.   :4.00  
##     JobLevel       JobRole          JobSatisfaction MaritalStatus     
##  Min.   :1.000   Length:1470        Min.   :1.000   Length:1470       
##  1st Qu.:1.000   Class :character   1st Qu.:2.000   Class :character  
##  Median :2.000   Mode  :character   Median :3.000   Mode  :character  
##  Mean   :2.064                      Mean   :2.729                     
##  3rd Qu.:3.000                      3rd Qu.:4.000                     
##  Max.   :5.000                      Max.   :4.000                     
##  MonthlyIncome    MonthlyRate    NumCompaniesWorked   OverTime        
##  Min.   : 1009   Min.   : 2094   Min.   :0.000      Length:1470       
##  1st Qu.: 2911   1st Qu.: 8047   1st Qu.:1.000      Class :character  
##  Median : 4919   Median :14236   Median :2.000      Mode  :character  
##  Mean   : 6503   Mean   :14313   Mean   :2.693                        
##  3rd Qu.: 8379   3rd Qu.:20462   3rd Qu.:4.000                        
##  Max.   :19999   Max.   :26999   Max.   :9.000                        
##  PercentSalaryHike PerformanceRating RelationshipSatisfaction StockOptionLevel
##  Min.   :11.00     Min.   :3.000     Min.   :1.000            Min.   :0.0000  
##  1st Qu.:12.00     1st Qu.:3.000     1st Qu.:2.000            1st Qu.:0.0000  
##  Median :14.00     Median :3.000     Median :3.000            Median :1.0000  
##  Mean   :15.21     Mean   :3.154     Mean   :2.712            Mean   :0.7939  
##  3rd Qu.:18.00     3rd Qu.:3.000     3rd Qu.:4.000            3rd Qu.:1.0000  
##  Max.   :25.00     Max.   :4.000     Max.   :4.000            Max.   :3.0000  
##  TotalWorkingYears TrainingTimesLastYear WorkLifeBalance YearsAtCompany  
##  Min.   : 0.00     Min.   :0.000         Min.   :1.000   Min.   : 0.000  
##  1st Qu.: 6.00     1st Qu.:2.000         1st Qu.:2.000   1st Qu.: 3.000  
##  Median :10.00     Median :3.000         Median :3.000   Median : 5.000  
##  Mean   :11.28     Mean   :2.799         Mean   :2.761   Mean   : 7.008  
##  3rd Qu.:15.00     3rd Qu.:3.000         3rd Qu.:3.000   3rd Qu.: 9.000  
##  Max.   :40.00     Max.   :6.000         Max.   :4.000   Max.   :40.000  
##  YearsInCurrentRole YearsSinceLastPromotion YearsWithCurrManager
##  Min.   : 0.000     Min.   : 0.000          Min.   : 0.000      
##  1st Qu.: 2.000     1st Qu.: 0.000          1st Qu.: 2.000      
##  Median : 3.000     Median : 1.000          Median : 3.000      
##  Mean   : 4.229     Mean   : 2.188          Mean   : 4.123      
##  3rd Qu.: 7.000     3rd Qu.: 3.000          3rd Qu.: 7.000      
##  Max.   :18.000     Max.   :15.000          Max.   :17.000
```

``` r
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- na.omit(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)

#### Measure the standard deviation ----

sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 11, 12, 13, 15 , 17 , 18, 19,  21, 22, 23,24, 25, 26, 27, 28 ,29, 30, 31   )], sd)
```

```         
##                      Age                DailyRate         DistanceFromHome 
##                9.1353735              403.5090999                8.1068644 
##                Education  EnvironmentSatisfaction               HourlyRate 
##                1.0241649                1.0930822               20.3294276 
##           JobInvolvement                 JobLevel          JobSatisfaction 
##                0.7115611                1.1069399                1.1028461 
##            MonthlyIncome              MonthlyRate       NumCompaniesWorked 
##             4707.9567831             7117.7860441                2.4980090 
##        PercentSalaryHike        PerformanceRating RelationshipSatisfaction 
##                3.6599377                0.3608235                1.0812089 
##         StockOptionLevel        TotalWorkingYears    TrainingTimesLastYear 
##                0.8520767                7.7807817                1.2892706 
##          WorkLifeBalance           YearsAtCompany       YearsInCurrentRole 
##                0.7064758                6.1265252                3.6231370 
##  YearsSinceLastPromotion     YearsWithCurrManager 
##                3.2224303                3.5681361
```

``` r
#### Measure the variance of each variable ----
  
sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 11, 12, 13, 15 , 17 , 18, 19,  21, 22, 23,24, 25, 26, 27, 28 ,29, 30, 31   )], var)
```

```         
##                      Age                DailyRate         DistanceFromHome 
##             8.345505e+01             1.628196e+05             6.572125e+01 
##                Education  EnvironmentSatisfaction               HourlyRate 
##             1.048914e+00             1.194829e+00             4.132856e+02 
##           JobInvolvement                 JobLevel          JobSatisfaction 
##             5.063193e-01             1.225316e+00             1.216270e+00 
##            MonthlyIncome              MonthlyRate       NumCompaniesWorked 
##             2.216486e+07             5.066288e+07             6.240049e+00 
##        PercentSalaryHike        PerformanceRating RelationshipSatisfaction 
##             1.339514e+01             1.301936e-01             1.169013e+00 
##         StockOptionLevel        TotalWorkingYears    TrainingTimesLastYear 
##             7.260346e-01             6.054056e+01             1.662219e+00 
##          WorkLifeBalance           YearsAtCompany       YearsInCurrentRole 
##             4.991081e-01             3.753431e+01             1.312712e+01 
##  YearsSinceLastPromotion     YearsWithCurrManager 
##             1.038406e+01             1.273160e+01
```

``` r
#### Measure the kurtosis of each variable ---- 

sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 11, 12, 13, 15 , 17 , 18, 19,  21, 22, 23,24, 25, 26, 27, 28 ,29, 30, 31   )], kurtosis, type = 2)
```

```         
##                      Age                DailyRate         DistanceFromHome 
##              -0.40414514              -1.20382281              -0.22483340 
##                Education  EnvironmentSatisfaction               HourlyRate 
##              -0.55911497              -1.20252052              -1.19639846 
##           JobInvolvement                 JobLevel          JobSatisfaction 
##               0.27099877               0.39915206              -1.22219257 
##            MonthlyIncome              MonthlyRate       NumCompaniesWorked 
##               1.00523269              -1.21495610               0.01021382 
##        PercentSalaryHike        PerformanceRating RelationshipSatisfaction 
##              -0.30059822               1.69593867              -1.18481398 
##         StockOptionLevel        TotalWorkingYears    TrainingTimesLastYear 
##               0.36463433               0.91826954               0.49499299 
##          WorkLifeBalance           YearsAtCompany       YearsInCurrentRole 
##               0.41946050               3.93550876               0.47742077 
##  YearsSinceLastPromotion     YearsWithCurrManager 
##               3.61267311               0.17105808
```

``` r
#### Measure the skewness of each variable ----

sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 11, 12, 13, 15 , 17 , 18, 19,  21, 22, 23,24, 25, 26, 27, 28 ,29, 30, 31   )],  skewness, type = 2)
```

```         
##                      Age                DailyRate         DistanceFromHome 
##              0.413286302             -0.003518568              0.958117996 
##                Education  EnvironmentSatisfaction               HourlyRate 
##             -0.289681082             -0.321654448             -0.032310953 
##           JobInvolvement                 JobLevel          JobSatisfaction 
##             -0.498419364              1.025401283             -0.329671959 
##            MonthlyIncome              MonthlyRate       NumCompaniesWorked 
##              1.369816681              0.018577808              1.026471112 
##        PercentSalaryHike        PerformanceRating RelationshipSatisfaction 
##              0.821127976              1.921882702             -0.302827565 
##         StockOptionLevel        TotalWorkingYears    TrainingTimesLastYear 
##              0.968980317              1.117171853              0.553124171 
##          WorkLifeBalance           YearsAtCompany       YearsInCurrentRole 
##             -0.552480299              1.764529454              0.917363156 
##  YearsSinceLastPromotion     YearsWithCurrManager 
##              1.984289983              0.833450992
```

#### Measures of Relationship {#measures-of-relationship}

`Measures of Relationship` quantify associations between variables. The Pearson correlation coefficient assesses linear relationships, covariance measures changes together, and the slope of the regression line indicates the strength of a linear relationship. R-squared explains the variance in the dependent variable, and rank correlation coefficients assess monotonic relationships. These measures aid in understanding the extent and nature of connections in data analysis

##### Measure the correlation between variables

``` r
streamlining_processes_cov <- cov(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 11, 12, 13, 15 , 17 , 18, 19,  21, 22, 23,24, 25, 26, 27, 28 ,29, 30, 31   )])
View(streamlining_processes_cov)
```

##### Measure the covariance between variables

``` r
streamlining_processes_cor <- cor(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 11, 12, 13, 15 , 17 , 18, 19,  21, 22, 23,24, 25, 26, 27, 28 ,29, 30, 31   )])
View(streamlining_processes_cor)
```

### Inferential Statistics {#inferential-statistics}

Inferential statistics involves drawing conclusions about a population based on a sample of data. It uses probability theory to make inferences, such as estimating population parameters or testing hypotheses. Techniques include hypothesis testing, confidence intervals, and regression analysis. Inferential statistics helps generalize findings from a sample to the larger population, providing insights beyond the observed data.This code fits a one-way ANOVA model where Age is the dependent variable, and Attrition is the categorical independent variable.determine if there is a significant difference in the means of the 'Age' variable across different levels of 'Attrition'.it further fits a two-way ANOVA model, considering both Attrition and Gender as categorical independent variables affecting the dependent variable Age.

``` r
# Inferential Statistics ----

streamlining_processes_one_way_anova <- aov( Age ~ Attrition , data = STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)
summary(streamlining_processes_one_way_anova)
```

```         
##               Df Sum Sq Mean Sq F value   Pr(>F)    
## Attrition      1   3107  3107.3   38.18 8.36e-10 ***
## Residuals   1468 119488    81.4                     
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

``` r
streamlining_processes_two_way_anova <- aov(Age  ~ Attrition + Gender, data = STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)
summary(streamlining_processes_two_way_anova)
```

```         
##               Df Sum Sq Mean Sq F value  Pr(>F)    
## Attrition      1   3107  3107.3  38.189 8.3e-10 ***
## Gender         1    123   122.7   1.508    0.22    
## Residuals   1467 119365    81.4                    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

### Basic Visualization {#basic-visualization}

#### Univariate Plots {#univariate-plots}

Univariate plots are used to explore the distribution and characteristics of individual variables in a dataset. Common types of univariate plots include histograms, box plots, and density plots, which provide insights into the central tendency, spread, and shape of the distribution of a single variable. These visualizations are fundamental for understanding the nature of individual variables before proceeding to more complex analyses

##### Histograms

``` r
#### Histograms for Each Numeric Attribute ----
str(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)
```

```         
## tibble [1,470 × 31] (S3: tbl_df/tbl/data.frame)
##  $ Age                     : num [1:1470] 41 49 37 33 27 32 59 30 38 36 ...
##  $ Attrition               : chr [1:1470] "Yes" "No" "Yes" "No" ...
##  $ BusinessTravel          : chr [1:1470] "Travel_Rarely" "Travel_Frequently" "Travel_Rarely" "Travel_Frequently" ...
##  $ DailyRate               : num [1:1470] 1102 279 1373 1392 591 ...
##  $ Department              : chr [1:1470] "Sales" "Research & Development" "Research & Development" "Research & Development" ...
##  $ DistanceFromHome        : num [1:1470] 1 8 2 3 2 2 3 24 23 27 ...
##  $ Education               : num [1:1470] 2 1 2 4 1 2 3 1 3 3 ...
##  $ EducationField          : chr [1:1470] "Life Sciences" "Life Sciences" "Other" "Life Sciences" ...
##  $ EnvironmentSatisfaction : num [1:1470] 2 3 4 4 1 4 3 4 4 3 ...
##  $ Gender                  : chr [1:1470] "Female" "Male" "Male" "Female" ...
##  $ HourlyRate              : num [1:1470] 94 61 92 56 40 79 81 67 44 94 ...
##  $ JobInvolvement          : num [1:1470] 3 2 2 3 3 3 4 3 2 3 ...
##  $ JobLevel                : num [1:1470] 2 2 1 1 1 1 1 1 3 2 ...
##  $ JobRole                 : chr [1:1470] "Sales Executive" "Research Scientist" "Laboratory Technician" "Research Scientist" ...
##  $ JobSatisfaction         : num [1:1470] 4 2 3 3 2 4 1 3 3 3 ...
##  $ MaritalStatus           : chr [1:1470] "Single" "Married" "Single" "Married" ...
##  $ MonthlyIncome           : num [1:1470] 5993 5130 2090 2909 3468 ...
##  $ MonthlyRate             : num [1:1470] 19479 24907 2396 23159 16632 ...
##  $ NumCompaniesWorked      : num [1:1470] 8 1 6 1 9 0 4 1 0 6 ...
##  $ OverTime                : chr [1:1470] "Yes" "No" "Yes" "Yes" ...
##  $ PercentSalaryHike       : num [1:1470] 11 23 15 11 12 13 20 22 21 13 ...
##  $ PerformanceRating       : num [1:1470] 3 4 3 3 3 3 4 4 4 3 ...
##  $ RelationshipSatisfaction: num [1:1470] 1 4 2 3 4 3 1 2 2 2 ...
##  $ StockOptionLevel        : num [1:1470] 0 1 0 0 1 0 3 1 0 2 ...
##  $ TotalWorkingYears       : num [1:1470] 8 10 7 8 6 8 12 1 10 17 ...
##  $ TrainingTimesLastYear   : num [1:1470] 0 3 3 3 3 2 3 2 2 3 ...
##  $ WorkLifeBalance         : num [1:1470] 1 3 3 3 3 2 2 3 3 2 ...
##  $ YearsAtCompany          : num [1:1470] 6 10 0 8 2 7 1 1 9 7 ...
##  $ YearsInCurrentRole      : num [1:1470] 4 7 0 7 2 7 0 0 7 7 ...
##  $ YearsSinceLastPromotion : num [1:1470] 0 1 0 3 2 3 0 0 1 7 ...
##  $ YearsWithCurrManager    : num [1:1470] 5 7 0 0 2 6 0 0 8 7 ...
```

``` r
# Identify numeric columns
numeric_columns <- sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, is.numeric)

# Extract only numeric columns
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, numeric_columns]

STREAMLINING_PROCESSES_AT_KINYANJUI_FARM<- sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, as.numeric)

# Set up the layout for multiple histograms
par(mfrow = c(1,1))

# Plot histograms for numeric columns


hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 1], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[1])
```

![](Acers_Project_files/figure-gfm/Your%20tenth%20Code%20Chunk-1.png)<!-- -->

``` r
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 4], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[4])
```

![](Acers_Project_files/figure-gfm/Your%20tenth%20Code%20Chunk-2.png)<!-- -->

``` r
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 6], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[6])
```

![](Acers_Project_files/figure-gfm/Your%20tenth%20Code%20Chunk-3.png)<!-- -->

``` r
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 7], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[7])
```

![](Acers_Project_files/figure-gfm/Your%20tenth%20Code%20Chunk-4.png)<!-- -->

``` r
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 9], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[9])
```

![](Acers_Project_files/figure-gfm/Your%20tenth%20Code%20Chunk-5.png)<!-- -->

``` r
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 10], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[10])
```

![](Acers_Project_files/figure-gfm/Your%20tenth%20Code%20Chunk-6.png)<!-- -->

``` r
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 11], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[11])
```

![](Acers_Project_files/figure-gfm/Your%20tenth%20Code%20Chunk-7.png)<!-- -->

``` r
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 13], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[13])
```

![](Acers_Project_files/figure-gfm/Your%20tenth%20Code%20Chunk-8.png)<!-- -->

``` r
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 14], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[14])
```

![](Acers_Project_files/figure-gfm/Your%20tenth%20Code%20Chunk-9.png)<!-- -->

##### Box and Whisker Plots for Each Numeric Attribute

``` r
# Set up the layout for multiple histograms
# Plot histograms for numeric columns
for (i in 1:ncol(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)) {
  jpeg("boxplot.jpg", width = 800, height = 600)
  boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 1], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[1])
  dev.off()
  
}

boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 1], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[1])
```

![](Acers_Project_files/figure-gfm/Your%20eleventh%20Code%20Chunk-1.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 4], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[4])
```

![](Acers_Project_files/figure-gfm/Your%20eleventh%20Code%20Chunk-2.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 6], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[6])
```

![](Acers_Project_files/figure-gfm/Your%20eleventh%20Code%20Chunk-3.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 7], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[7])
```

![](Acers_Project_files/figure-gfm/Your%20eleventh%20Code%20Chunk-4.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 9], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[9])
```

![](Acers_Project_files/figure-gfm/Your%20eleventh%20Code%20Chunk-5.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 10], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[10])
```

![](Acers_Project_files/figure-gfm/Your%20eleventh%20Code%20Chunk-6.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 11], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[11])
```

![](Acers_Project_files/figure-gfm/Your%20eleventh%20Code%20Chunk-7.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 13], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[13])
```

![](Acers_Project_files/figure-gfm/Your%20eleventh%20Code%20Chunk-8.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 14], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[14])
```

![](Acers_Project_files/figure-gfm/Your%20eleventh%20Code%20Chunk-9.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 15], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[15])
```

![](Acers_Project_files/figure-gfm/Your%20eleventh%20Code%20Chunk-10.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 17], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[17])
```

![](Acers_Project_files/figure-gfm/Your%20eleventh%20Code%20Chunk-11.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 19], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[19])
```

![](Acers_Project_files/figure-gfm/Your%20eleventh%20Code%20Chunk-12.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 20], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[20])
```

![](Acers_Project_files/figure-gfm/Your%20eleventh%20Code%20Chunk-13.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 21], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[21])
```

![](Acers_Project_files/figure-gfm/Your%20eleventh%20Code%20Chunk-14.png)<!-- -->

##### Bar Plots for Each Categorical Attribute Gender

``` r
library(readr)
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- read_csv("data/STREAMLINING PROCESSES AT KINYANJUI FARM.csv")
```

```         
## Rows: 1470 Columns: 35
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr  (9): Attrition, BusinessTravel, Department, EducationField, Gender, Job...
## dbl (26): Age, DailyRate, DistanceFromHome, Education, EmployeeCount, Employ...
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

``` r
# Drop specified columns
columns_to_drop <- c('EmployeeCount', 'EmployeeNumber', 'Over18', 'StandardHours')
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, !(names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM) %in% columns_to_drop)]

barplot(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 2]), main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[2])
```

![](Acers_Project_files/figure-gfm/Your%20twelveth%20Code%20Chunk-1.png)<!-- -->

##### Missingness Map to Identify Missing Data

``` r
missmap(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, col = c("red", "grey"), legend = TRUE)
```

![](Acers_Project_files/figure-gfm/Your%20thirteenth%20Code%20Chunk-1.png)<!-- -->

#### Multivariate Plots {#multivariate-plots}

Multivariate Plots involve visualizations that simultaneously represent and explore the relationships between two or more variables in a dataset. Unlike univariate plots that focus on a single variable, multivariate plots provide insights into the interactions and patterns between multiple variables. Examples of multivariate plots include scatter plots, bubble charts, heatmaps, and 3D plots. These visualizations are essential for identifying correlations, trends, and dependencies between variables, aiding in a more comprehensive understanding of the overall dataset structure. They are particularly useful for uncovering complex relationships and patterns in multidimensional data

##### Correlation Plot

``` r
corrplot(cor(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 11, 12, 13, 15 , 17 , 18, 19,  21, 22, 23,24, 25, 26, 27, 28 ,29, 30, 31   )]), method = "circle")
```

![](Acers_Project_files/figure-gfm/Your%20acers%20Code%20Chunk-1.png)<!-- -->

``` r
ggcorrplot(cor(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 11, 12, 13, 15 , 17 , 18, 19,  21, 22, 23,24, 25, 26, 27, 28 ,29, 30, 31   )]))
```

![](Acers_Project_files/figure-gfm/Your%20acers%20Code%20Chunk-2.png)<!-- -->

##### Scatter Plot

``` r
# Select only numeric columns
numeric_columns <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, is.numeric)]

# Create scatterplot matrix
pairs(numeric_columns, col = STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$Age)
```

![](Acers_Project_files/figure-gfm/Your%20acers1%20Code%20Chunk-1.png)<!-- -->

##### Multivariate Box and Whisker Plots by Class

``` r
library(readr)
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- read_csv("data/STREAMLINING PROCESSES AT KINYANJUI FARM.csv")
```

```         
## Rows: 1470 Columns: 35
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr  (9): Attrition, BusinessTravel, Department, EducationField, Gender, Job...
## dbl (26): Age, DailyRate, DistanceFromHome, Education, EmployeeCount, Employ...
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

``` r
# Drop specified columns
columns_to_drop <- c('EmployeeCount', 'EmployeeNumber', 'Over18', 'StandardHours')
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, !(names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM) %in% columns_to_drop)]
featurePlot(x = STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 11, 12, 13, 15 , 17 , 18, 19,  21, 22, 23,24, 25, 26, 27, 28 ,29, 30, 31   )], y = STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 2],
            plot = "box")
```

```         
## NULL
```

# Preprocessing and Data Transformation {#preprocessing-and-data-transformation}

Preprocessing and Data Transformation" refer to the steps taken to prepare raw data for analysis. This involves cleaning, organizing, and modifying the data to improve its quality and make it suitable for modeling. Common preprocessing tasks include handling `missing values`, `removing outliers`, `scaling or normalizing numerical features`, `encoding categorical variables`, and `splitting the data into training and testing sets`. Data transformation may also involve creating new features or aggregating existing ones. These processes are crucial for enhancing the accuracy and effectiveness of machine learning models

``` r
## Confirm the "missingness" in the Initial Dataset ----

# Are there missing values in the dataset?
any_na(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)
```

```         
## [1] FALSE
```

``` r
# How many?
n_miss(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)
```

```         
## [1] 0
```

``` r
# What is the percentage of missing data in the entire dataset?
prop_miss(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)
```

```         
## [1] 0
```

``` r
# How many missing values does each variable have?
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM %>% is.na() %>% colSums()
```

```         
##                      Age                Attrition           BusinessTravel 
##                        0                        0                        0 
##                DailyRate               Department         DistanceFromHome 
##                        0                        0                        0 
##                Education           EducationField  EnvironmentSatisfaction 
##                        0                        0                        0 
##                   Gender               HourlyRate           JobInvolvement 
##                        0                        0                        0 
##                 JobLevel                  JobRole          JobSatisfaction 
##                        0                        0                        0 
##            MaritalStatus            MonthlyIncome              MonthlyRate 
##                        0                        0                        0 
##       NumCompaniesWorked                 OverTime        PercentSalaryHike 
##                        0                        0                        0 
##        PerformanceRating RelationshipSatisfaction         StockOptionLevel 
##                        0                        0                        0 
##        TotalWorkingYears    TrainingTimesLastYear          WorkLifeBalance 
##                        0                        0                        0 
##           YearsAtCompany       YearsInCurrentRole  YearsSinceLastPromotion 
##                        0                        0                        0 
##     YearsWithCurrManager 
##                        0
```

``` r
# What is the number and percentage of missing values grouped by
# each variable?
miss_var_summary(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)
```

```         
## # A tibble: 31 × 3
##    variable                n_miss pct_miss
##    <chr>                    <int>    <dbl>
##  1 Age                          0        0
##  2 Attrition                    0        0
##  3 BusinessTravel               0        0
##  4 DailyRate                    0        0
##  5 Department                   0        0
##  6 DistanceFromHome             0        0
##  7 Education                    0        0
##  8 EducationField               0        0
##  9 EnvironmentSatisfaction      0        0
## 10 Gender                       0        0
## # ℹ 21 more rows
```

``` r
# What is the number and percentage of missing values grouped by
# each observation?
miss_case_summary(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)
```

```         
## # A tibble: 1,470 × 3
##     case n_miss pct_miss
##    <int>  <int>    <dbl>
##  1     1      0        0
##  2     2      0        0
##  3     3      0        0
##  4     4      0        0
##  5     5      0        0
##  6     6      0        0
##  7     7      0        0
##  8     8      0        0
##  9     9      0        0
## 10    10      0        0
## # ℹ 1,460 more rows
```

``` r
# Which variables contain the most missing values?
#gg_miss_var(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)

# Where are missing values located (the shaded regions in the plot)?
vis_miss(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM) + theme(axis.text.x = element_text(angle = 80))
```

![](Acers_Project_files/figure-gfm/Your%20fifteenth%20Code%20Chunk-1.png)<!-- -->

``` r
# Which combinations of variables are missing together?
#gg_miss_upset(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)
```

#### Heatmap of "missingness" broken down by "Age" {#heatmap-of-missingness-broken-down-by-age}

``` r
# First, confirm that the "AgeDecade" variable is a categorical variable
is.factor(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$Age)
```

```         
## [1] FALSE
```

``` r
# Second, create the visualization
gg_miss_fct(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, fct = Age)
```

![](Acers_Project_files/figure-gfm/Your%20sixteenth%20Code%20Chunk-1.png)<!-- -->

``` r
# We can also create a heatmap of "missingness" broken down by "Depressed"
# First, confirm that the "Depressed" variable is a categorical variable
is.factor(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$Attrition)
```

```         
## [1] FALSE
```

``` r
# Second, create the visualization
gg_miss_fct(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, fct = Attrition)
```

![](Acers_Project_files/figure-gfm/Your%20sixteenth%20Code%20Chunk-2.png)<!-- -->

## Data Transformation {#data-transformation}

#### Scale Data Transform {#scale-data-transform}

``` r
# Scale Data Transform 
# BEFORE
# Identify numeric columns

library(readr)
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- read_csv("data/STREAMLINING PROCESSES AT KINYANJUI FARM.csv")
```

```         
## Rows: 1470 Columns: 35
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr  (9): Attrition, BusinessTravel, Department, EducationField, Gender, Job...
## dbl (26): Age, DailyRate, DistanceFromHome, Education, EmployeeCount, Employ...
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

``` r
# Drop specified columns
columns_to_drop <- c('EmployeeCount', 'EmployeeNumber', 'Over18', 'StandardHours')
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, !(names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM) %in% columns_to_drop)]
numeric_columns <- sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, is.numeric)

# Extract only numeric columns
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, numeric_columns]

STREAMLINING_PROCESSES_AT_KINYANJUI_FARM<- sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, as.numeric)

# Set up the layout for multiple histograms
par(mfrow = c(1, 1))

summary(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)
```

```         
##       Age          DailyRate      DistanceFromHome   Education    
##  Min.   :18.00   Min.   : 102.0   Min.   : 1.000   Min.   :1.000  
##  1st Qu.:30.00   1st Qu.: 465.0   1st Qu.: 2.000   1st Qu.:2.000  
##  Median :36.00   Median : 802.0   Median : 7.000   Median :3.000  
##  Mean   :36.92   Mean   : 802.5   Mean   : 9.193   Mean   :2.913  
##  3rd Qu.:43.00   3rd Qu.:1157.0   3rd Qu.:14.000   3rd Qu.:4.000  
##  Max.   :60.00   Max.   :1499.0   Max.   :29.000   Max.   :5.000  
##  EnvironmentSatisfaction   HourlyRate     JobInvolvement    JobLevel    
##  Min.   :1.000           Min.   : 30.00   Min.   :1.00   Min.   :1.000  
##  1st Qu.:2.000           1st Qu.: 48.00   1st Qu.:2.00   1st Qu.:1.000  
##  Median :3.000           Median : 66.00   Median :3.00   Median :2.000  
##  Mean   :2.722           Mean   : 65.89   Mean   :2.73   Mean   :2.064  
##  3rd Qu.:4.000           3rd Qu.: 83.75   3rd Qu.:3.00   3rd Qu.:3.000  
##  Max.   :4.000           Max.   :100.00   Max.   :4.00   Max.   :5.000  
##  JobSatisfaction MonthlyIncome    MonthlyRate    NumCompaniesWorked
##  Min.   :1.000   Min.   : 1009   Min.   : 2094   Min.   :0.000     
##  1st Qu.:2.000   1st Qu.: 2911   1st Qu.: 8047   1st Qu.:1.000     
##  Median :3.000   Median : 4919   Median :14236   Median :2.000     
##  Mean   :2.729   Mean   : 6503   Mean   :14313   Mean   :2.693     
##  3rd Qu.:4.000   3rd Qu.: 8379   3rd Qu.:20462   3rd Qu.:4.000     
##  Max.   :4.000   Max.   :19999   Max.   :26999   Max.   :9.000     
##  PercentSalaryHike PerformanceRating RelationshipSatisfaction StockOptionLevel
##  Min.   :11.00     Min.   :3.000     Min.   :1.000            Min.   :0.0000  
##  1st Qu.:12.00     1st Qu.:3.000     1st Qu.:2.000            1st Qu.:0.0000  
##  Median :14.00     Median :3.000     Median :3.000            Median :1.0000  
##  Mean   :15.21     Mean   :3.154     Mean   :2.712            Mean   :0.7939  
##  3rd Qu.:18.00     3rd Qu.:3.000     3rd Qu.:4.000            3rd Qu.:1.0000  
##  Max.   :25.00     Max.   :4.000     Max.   :4.000            Max.   :3.0000  
##  TotalWorkingYears TrainingTimesLastYear WorkLifeBalance YearsAtCompany  
##  Min.   : 0.00     Min.   :0.000         Min.   :1.000   Min.   : 0.000  
##  1st Qu.: 6.00     1st Qu.:2.000         1st Qu.:2.000   1st Qu.: 3.000  
##  Median :10.00     Median :3.000         Median :3.000   Median : 5.000  
##  Mean   :11.28     Mean   :2.799         Mean   :2.761   Mean   : 7.008  
##  3rd Qu.:15.00     3rd Qu.:3.000         3rd Qu.:3.000   3rd Qu.: 9.000  
##  Max.   :40.00     Max.   :6.000         Max.   :4.000   Max.   :40.000  
##  YearsInCurrentRole YearsSinceLastPromotion YearsWithCurrManager
##  Min.   : 0.000     Min.   : 0.000          Min.   : 0.000      
##  1st Qu.: 2.000     1st Qu.: 0.000          1st Qu.: 2.000      
##  Median : 3.000     Median : 1.000          Median : 3.000      
##  Mean   : 4.229     Mean   : 2.188          Mean   : 4.123      
##  3rd Qu.: 7.000     3rd Qu.: 3.000          3rd Qu.: 7.000      
##  Max.   :18.000     Max.   :15.000          Max.   :17.000
```

``` r
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 1], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[1])
```

![](Acers_Project_files/figure-gfm/Your%20seventeenth%20Code%20Chunk-1.png)<!-- -->

``` r
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 4], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[4])
```

![](Acers_Project_files/figure-gfm/Your%20seventeenth%20Code%20Chunk-2.png)<!-- -->

``` r
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 6], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[6])
```

![](Acers_Project_files/figure-gfm/Your%20seventeenth%20Code%20Chunk-3.png)<!-- -->

``` r
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 7], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[7])
```

![](Acers_Project_files/figure-gfm/Your%20seventeenth%20Code%20Chunk-4.png)<!-- -->

``` r
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 9], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[9])
```

![](Acers_Project_files/figure-gfm/Your%20seventeenth%20Code%20Chunk-5.png)<!-- -->

``` r
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 10], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[10])
```

![](Acers_Project_files/figure-gfm/Your%20seventeenth%20Code%20Chunk-6.png)<!-- -->

``` r
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 11], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[11])
```

![](Acers_Project_files/figure-gfm/Your%20seventeenth%20Code%20Chunk-7.png)<!-- -->

``` r
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 13], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[13])
```

![](Acers_Project_files/figure-gfm/Your%20seventeenth%20Code%20Chunk-8.png)<!-- -->

``` r
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 14], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[14])
```

![](Acers_Project_files/figure-gfm/Your%20seventeenth%20Code%20Chunk-9.png)<!-- -->

``` r
model_of_the_transform <- preProcess(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, method = c("scale"))
print(model_of_the_transform)
```

```         
## Created from 1470 samples and 23 variables
## 
## Pre-processing:
##   - ignored (0)
##   - scaled (23)
```

``` r
streamling_processes_scale_transform <- predict(model_of_the_transform,
                                          STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)

#After
summary(streamling_processes_scale_transform)
```

```         
##       Age          DailyRate      DistanceFromHome   Education     
##  Min.   :1.970   Min.   :0.2528   Min.   :0.1234   Min.   :0.9764  
##  1st Qu.:3.284   1st Qu.:1.1524   1st Qu.:0.2467   1st Qu.:1.9528  
##  Median :3.941   Median :1.9876   Median :0.8635   Median :2.9292  
##  Mean   :4.042   Mean   :1.9888   Mean   :1.1339   Mean   :2.8442  
##  3rd Qu.:4.707   3rd Qu.:2.8673   3rd Qu.:1.7269   3rd Qu.:3.9056  
##  Max.   :6.568   Max.   :3.7149   Max.   :3.5772   Max.   :4.8820  
##  EnvironmentSatisfaction   HourlyRate    JobInvolvement     JobLevel     
##  Min.   :0.9148          Min.   :1.476   Min.   :1.405   Min.   :0.9034  
##  1st Qu.:1.8297          1st Qu.:2.361   1st Qu.:2.811   1st Qu.:0.9034  
##  Median :2.7445          Median :3.247   Median :4.216   Median :1.8068  
##  Mean   :2.4900          Mean   :3.241   Mean   :3.837   Mean   :1.8646  
##  3rd Qu.:3.6594          3rd Qu.:4.120   3rd Qu.:4.216   3rd Qu.:2.7102  
##  Max.   :3.6594          Max.   :4.919   Max.   :5.621   Max.   :4.5170  
##  JobSatisfaction  MonthlyIncome     MonthlyRate     NumCompaniesWorked
##  Min.   :0.9067   Min.   :0.2143   Min.   :0.2942   Min.   :0.0000    
##  1st Qu.:1.8135   1st Qu.:0.6183   1st Qu.:1.1305   1st Qu.:0.4003    
##  Median :2.7202   Median :1.0448   Median :2.0000   Median :0.8006    
##  Mean   :2.4741   Mean   :1.3813   Mean   :2.0109   Mean   :1.0781    
##  3rd Qu.:3.6270   3rd Qu.:1.7798   3rd Qu.:2.8747   3rd Qu.:1.6013    
##  Max.   :3.6270   Max.   :4.2479   Max.   :3.7932   Max.   :3.6029    
##  PercentSalaryHike PerformanceRating RelationshipSatisfaction StockOptionLevel
##  Min.   :3.006     Min.   : 8.314    Min.   :0.9249           Min.   :0.0000  
##  1st Qu.:3.279     1st Qu.: 8.314    1st Qu.:1.8498           1st Qu.:0.0000  
##  Median :3.825     Median : 8.314    Median :2.7747           Median :1.1736  
##  Mean   :4.156     Mean   : 8.740    Mean   :2.5085           Mean   :0.9317  
##  3rd Qu.:4.918     3rd Qu.: 8.314    3rd Qu.:3.6996           3rd Qu.:1.1736  
##  Max.   :6.831     Max.   :11.086    Max.   :3.6996           Max.   :3.5208  
##  TotalWorkingYears TrainingTimesLastYear WorkLifeBalance YearsAtCompany  
##  Min.   :0.0000    Min.   :0.000         Min.   :1.415   Min.   :0.0000  
##  1st Qu.:0.7711    1st Qu.:1.551         1st Qu.:2.831   1st Qu.:0.4897  
##  Median :1.2852    Median :2.327         Median :4.246   Median :0.8161  
##  Mean   :1.4497    Mean   :2.171         Mean   :3.908   Mean   :1.1439  
##  3rd Qu.:1.9278    3rd Qu.:2.327         3rd Qu.:4.246   3rd Qu.:1.4690  
##  Max.   :5.1409    Max.   :4.654         Max.   :5.662   Max.   :6.5290  
##  YearsInCurrentRole YearsSinceLastPromotion YearsWithCurrManager
##  Min.   :0.000      Min.   :0.0000          Min.   :0.0000      
##  1st Qu.:0.552      1st Qu.:0.0000          1st Qu.:0.5605      
##  Median :0.828      Median :0.3103          Median :0.8408      
##  Mean   :1.167      Mean   :0.6789          Mean   :1.1555      
##  3rd Qu.:1.932      3rd Qu.:0.9310          3rd Qu.:1.9618      
##  Max.   :4.968      Max.   :4.6549          Max.   :4.7644
```

``` r
hist(streamling_processes_scale_transform[, 1], main = names(streamling_processes_scale_transform)[1])
```

![](Acers_Project_files/figure-gfm/Your%20seventeenth%20Code%20Chunk-10.png)<!-- -->

``` r
hist(streamling_processes_scale_transform[, 4], main = names(streamling_processes_scale_transform)[4])
```

![](Acers_Project_files/figure-gfm/Your%20seventeenth%20Code%20Chunk-11.png)<!-- -->

``` r
hist(streamling_processes_scale_transform[, 6], main = names(streamling_processes_scale_transform)[6])
```

![](Acers_Project_files/figure-gfm/Your%20seventeenth%20Code%20Chunk-12.png)<!-- -->

``` r
hist(streamling_processes_scale_transform[, 7], main = names(streamling_processes_scale_transform)[7])
```

![](Acers_Project_files/figure-gfm/Your%20seventeenth%20Code%20Chunk-13.png)<!-- -->

``` r
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 9], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[9])
```

![](Acers_Project_files/figure-gfm/Your%20seventeenth%20Code%20Chunk-14.png)<!-- -->

``` r
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 10], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[10])
```

![](Acers_Project_files/figure-gfm/Your%20seventeenth%20Code%20Chunk-15.png)<!-- -->

``` r
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 11], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[11])
```

![](Acers_Project_files/figure-gfm/Your%20seventeenth%20Code%20Chunk-16.png)<!-- -->

``` r
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 13], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[13])
```

![](Acers_Project_files/figure-gfm/Your%20seventeenth%20Code%20Chunk-17.png)<!-- -->

``` r
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 14], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[14])
```

![](Acers_Project_files/figure-gfm/Your%20seventeenth%20Code%20Chunk-18.png)<!-- -->

#### Center Data Transform {#center-data-transform}

``` r
# BEFORE
summary(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)
```

```         
##       Age          DailyRate      DistanceFromHome   Education    
##  Min.   :18.00   Min.   : 102.0   Min.   : 1.000   Min.   :1.000  
##  1st Qu.:30.00   1st Qu.: 465.0   1st Qu.: 2.000   1st Qu.:2.000  
##  Median :36.00   Median : 802.0   Median : 7.000   Median :3.000  
##  Mean   :36.92   Mean   : 802.5   Mean   : 9.193   Mean   :2.913  
##  3rd Qu.:43.00   3rd Qu.:1157.0   3rd Qu.:14.000   3rd Qu.:4.000  
##  Max.   :60.00   Max.   :1499.0   Max.   :29.000   Max.   :5.000  
##  EnvironmentSatisfaction   HourlyRate     JobInvolvement    JobLevel    
##  Min.   :1.000           Min.   : 30.00   Min.   :1.00   Min.   :1.000  
##  1st Qu.:2.000           1st Qu.: 48.00   1st Qu.:2.00   1st Qu.:1.000  
##  Median :3.000           Median : 66.00   Median :3.00   Median :2.000  
##  Mean   :2.722           Mean   : 65.89   Mean   :2.73   Mean   :2.064  
##  3rd Qu.:4.000           3rd Qu.: 83.75   3rd Qu.:3.00   3rd Qu.:3.000  
##  Max.   :4.000           Max.   :100.00   Max.   :4.00   Max.   :5.000  
##  JobSatisfaction MonthlyIncome    MonthlyRate    NumCompaniesWorked
##  Min.   :1.000   Min.   : 1009   Min.   : 2094   Min.   :0.000     
##  1st Qu.:2.000   1st Qu.: 2911   1st Qu.: 8047   1st Qu.:1.000     
##  Median :3.000   Median : 4919   Median :14236   Median :2.000     
##  Mean   :2.729   Mean   : 6503   Mean   :14313   Mean   :2.693     
##  3rd Qu.:4.000   3rd Qu.: 8379   3rd Qu.:20462   3rd Qu.:4.000     
##  Max.   :4.000   Max.   :19999   Max.   :26999   Max.   :9.000     
##  PercentSalaryHike PerformanceRating RelationshipSatisfaction StockOptionLevel
##  Min.   :11.00     Min.   :3.000     Min.   :1.000            Min.   :0.0000  
##  1st Qu.:12.00     1st Qu.:3.000     1st Qu.:2.000            1st Qu.:0.0000  
##  Median :14.00     Median :3.000     Median :3.000            Median :1.0000  
##  Mean   :15.21     Mean   :3.154     Mean   :2.712            Mean   :0.7939  
##  3rd Qu.:18.00     3rd Qu.:3.000     3rd Qu.:4.000            3rd Qu.:1.0000  
##  Max.   :25.00     Max.   :4.000     Max.   :4.000            Max.   :3.0000  
##  TotalWorkingYears TrainingTimesLastYear WorkLifeBalance YearsAtCompany  
##  Min.   : 0.00     Min.   :0.000         Min.   :1.000   Min.   : 0.000  
##  1st Qu.: 6.00     1st Qu.:2.000         1st Qu.:2.000   1st Qu.: 3.000  
##  Median :10.00     Median :3.000         Median :3.000   Median : 5.000  
##  Mean   :11.28     Mean   :2.799         Mean   :2.761   Mean   : 7.008  
##  3rd Qu.:15.00     3rd Qu.:3.000         3rd Qu.:3.000   3rd Qu.: 9.000  
##  Max.   :40.00     Max.   :6.000         Max.   :4.000   Max.   :40.000  
##  YearsInCurrentRole YearsSinceLastPromotion YearsWithCurrManager
##  Min.   : 0.000     Min.   : 0.000          Min.   : 0.000      
##  1st Qu.: 2.000     1st Qu.: 0.000          1st Qu.: 2.000      
##  Median : 3.000     Median : 1.000          Median : 3.000      
##  Mean   : 4.229     Mean   : 2.188          Mean   : 4.123      
##  3rd Qu.: 7.000     3rd Qu.: 3.000          3rd Qu.: 7.000      
##  Max.   :18.000     Max.   :15.000          Max.   :17.000
```

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 1], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[1])
```

![](Acers_Project_files/figure-gfm/Your%20eighteenth%20Code%20Chunk-1.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 2], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[2])
```

![](Acers_Project_files/figure-gfm/Your%20eighteenth%20Code%20Chunk-2.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 3], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[3])
```

![](Acers_Project_files/figure-gfm/Your%20eighteenth%20Code%20Chunk-3.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 5], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[5])
```

![](Acers_Project_files/figure-gfm/Your%20eighteenth%20Code%20Chunk-4.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 6], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[6])
```

![](Acers_Project_files/figure-gfm/Your%20eighteenth%20Code%20Chunk-5.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 7], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[7])
```

![](Acers_Project_files/figure-gfm/Your%20eighteenth%20Code%20Chunk-6.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 8], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[8])
```

![](Acers_Project_files/figure-gfm/Your%20eighteenth%20Code%20Chunk-7.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 9], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[9])
```

![](Acers_Project_files/figure-gfm/Your%20eighteenth%20Code%20Chunk-8.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 10], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[10])
```

![](Acers_Project_files/figure-gfm/Your%20eighteenth%20Code%20Chunk-9.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 11], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[11])
```

![](Acers_Project_files/figure-gfm/Your%20eighteenth%20Code%20Chunk-10.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 12], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[12])
```

![](Acers_Project_files/figure-gfm/Your%20eighteenth%20Code%20Chunk-11.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 13], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[13])
```

![](Acers_Project_files/figure-gfm/Your%20eighteenth%20Code%20Chunk-12.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 14], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[14])
```

![](Acers_Project_files/figure-gfm/Your%20eighteenth%20Code%20Chunk-13.png)<!-- -->

``` r
model_of_the_transform <- preProcess(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, method = c("center"))
print(model_of_the_transform)
```

```         
## Created from 1470 samples and 23 variables
## 
## Pre-processing:
##   - centered (23)
##   - ignored (0)
```

``` r
streamling_processes_center_transform <- predict(model_of_the_transform, # nolint
                                           STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)

# AFTER

summary(streamling_processes_center_transform)
```

```         
##       Age             DailyRate         DistanceFromHome   Education       
##  Min.   :-18.9238   Min.   :-700.4857   Min.   :-8.193   Min.   :-1.91293  
##  1st Qu.: -6.9238   1st Qu.:-337.4857   1st Qu.:-7.193   1st Qu.:-0.91293  
##  Median : -0.9238   Median :  -0.4857   Median :-2.193   Median : 0.08707  
##  Mean   :  0.0000   Mean   :   0.0000   Mean   : 0.000   Mean   : 0.00000  
##  3rd Qu.:  6.0762   3rd Qu.: 354.5143   3rd Qu.: 4.807   3rd Qu.: 1.08707  
##  Max.   : 23.0762   Max.   : 696.5143   Max.   :19.807   Max.   : 2.08707  
##  EnvironmentSatisfaction   HourlyRate       JobInvolvement   
##  Min.   :-1.7218         Min.   :-35.8912   Min.   :-1.7299  
##  1st Qu.:-0.7218         1st Qu.:-17.8912   1st Qu.:-0.7299  
##  Median : 0.2782         Median :  0.1088   Median : 0.2701  
##  Mean   : 0.0000         Mean   :  0.0000   Mean   : 0.0000  
##  3rd Qu.: 1.2782         3rd Qu.: 17.8588   3rd Qu.: 0.2701  
##  Max.   : 1.2782         Max.   : 34.1088   Max.   : 1.2701  
##     JobLevel        JobSatisfaction   MonthlyIncome    MonthlyRate      
##  Min.   :-1.06395   Min.   :-1.7286   Min.   :-5494   Min.   :-12219.1  
##  1st Qu.:-1.06395   1st Qu.:-0.7286   1st Qu.:-3592   1st Qu.: -6266.1  
##  Median :-0.06395   Median : 0.2714   Median :-1584   Median :   -77.6  
##  Mean   : 0.00000   Mean   : 0.0000   Mean   :    0   Mean   :     0.0  
##  3rd Qu.: 0.93605   3rd Qu.: 1.2714   3rd Qu.: 1876   3rd Qu.:  6148.4  
##  Max.   : 2.93605   Max.   : 1.2714   Max.   :13496   Max.   : 12685.9  
##  NumCompaniesWorked PercentSalaryHike PerformanceRating
##  Min.   :-2.6932    Min.   :-4.21     Min.   :-0.1537  
##  1st Qu.:-1.6932    1st Qu.:-3.21     1st Qu.:-0.1537  
##  Median :-0.6932    Median :-1.21     Median :-0.1537  
##  Mean   : 0.0000    Mean   : 0.00     Mean   : 0.0000  
##  3rd Qu.: 1.3068    3rd Qu.: 2.79     3rd Qu.:-0.1537  
##  Max.   : 6.3068    Max.   : 9.79     Max.   : 0.8463  
##  RelationshipSatisfaction StockOptionLevel  TotalWorkingYears
##  Min.   :-1.7122          Min.   :-0.7939   Min.   :-11.28   
##  1st Qu.:-0.7122          1st Qu.:-0.7939   1st Qu.: -5.28   
##  Median : 0.2878          Median : 0.2061   Median : -1.28   
##  Mean   : 0.0000          Mean   : 0.0000   Mean   :  0.00   
##  3rd Qu.: 1.2878          3rd Qu.: 0.2061   3rd Qu.:  3.72   
##  Max.   : 1.2878          Max.   : 2.2061   Max.   : 28.72   
##  TrainingTimesLastYear WorkLifeBalance   YearsAtCompany   YearsInCurrentRole
##  Min.   :-2.7993       Min.   :-1.7612   Min.   :-7.008   Min.   :-4.229    
##  1st Qu.:-0.7993       1st Qu.:-0.7612   1st Qu.:-4.008   1st Qu.:-2.229    
##  Median : 0.2007       Median : 0.2388   Median :-2.008   Median :-1.229    
##  Mean   : 0.0000       Mean   : 0.0000   Mean   : 0.000   Mean   : 0.000    
##  3rd Qu.: 0.2007       3rd Qu.: 0.2388   3rd Qu.: 1.992   3rd Qu.: 2.771    
##  Max.   : 3.2007       Max.   : 1.2388   Max.   :32.992   Max.   :13.771    
##  YearsSinceLastPromotion YearsWithCurrManager
##  Min.   :-2.1878         Min.   :-4.123      
##  1st Qu.:-2.1878         1st Qu.:-2.123      
##  Median :-1.1878         Median :-1.123      
##  Mean   : 0.0000         Mean   : 0.000      
##  3rd Qu.: 0.8122         3rd Qu.: 2.877      
##  Max.   :12.8122         Max.   :12.877
```

``` r
boxplot(streamling_processes_center_transform[, 1], main = names(streamling_processes_center_transform)[1])
```

![](Acers_Project_files/figure-gfm/Your%20eighteenth%20Code%20Chunk-14.png)<!-- -->

``` r
boxplot(streamling_processes_center_transform[, 2], main = names(streamling_processes_center_transform)[2])
```

![](Acers_Project_files/figure-gfm/Your%20eighteenth%20Code%20Chunk-15.png)<!-- -->

``` r
boxplot(streamling_processes_center_transform[, 3], main = names(streamling_processes_center_transform)[3])
```

![](Acers_Project_files/figure-gfm/Your%20eighteenth%20Code%20Chunk-16.png)<!-- -->

``` r
boxplot(streamling_processes_center_transform[, 5], main = names(streamling_processes_center_transform)[5])
```

![](Acers_Project_files/figure-gfm/Your%20eighteenth%20Code%20Chunk-17.png)<!-- -->

``` r
boxplot(streamling_processes_center_transform[, 6], main = names(streamling_processes_center_transform)[6])
```

![](Acers_Project_files/figure-gfm/Your%20eighteenth%20Code%20Chunk-18.png)<!-- -->

``` r
boxplot(streamling_processes_center_transform[, 7], main = names(streamling_processes_center_transform)[7])
```

![](Acers_Project_files/figure-gfm/Your%20eighteenth%20Code%20Chunk-19.png)<!-- -->

``` r
boxplot(streamling_processes_center_transform[, 8], main = names(streamling_processes_center_transform)[8])
```

![](Acers_Project_files/figure-gfm/Your%20eighteenth%20Code%20Chunk-20.png)<!-- -->

``` r
boxplot(streamling_processes_center_transform[, 9], main = names(streamling_processes_center_transform)[9])
```

![](Acers_Project_files/figure-gfm/Your%20eighteenth%20Code%20Chunk-21.png)<!-- -->

``` r
boxplot(streamling_processes_center_transform[, 10], main = names(streamling_processes_center_transform)[10])
```

![](Acers_Project_files/figure-gfm/Your%20eighteenth%20Code%20Chunk-22.png)<!-- -->

``` r
boxplot(streamling_processes_center_transform[, 11], main = names(streamling_processes_center_transform)[11])
```

![](Acers_Project_files/figure-gfm/Your%20eighteenth%20Code%20Chunk-23.png)<!-- -->

``` r
boxplot(streamling_processes_center_transform[, 12], main = names(streamling_processes_center_transform)[12])
```

![](Acers_Project_files/figure-gfm/Your%20eighteenth%20Code%20Chunk-24.png)<!-- -->

``` r
boxplot(streamling_processes_center_transform[, 13], main = names(streamling_processes_center_transform)[13])
```

![](Acers_Project_files/figure-gfm/Your%20eighteenth%20Code%20Chunk-25.png)<!-- -->

``` r
boxplot(streamling_processes_center_transform[, 14], main = names(streamling_processes_center_transform)[14])
```

![](Acers_Project_files/figure-gfm/Your%20eighteenth%20Code%20Chunk-26.png)<!-- -->

#### Standardize Data Transform to have a std of 1 {#standardize-data-transform-to-have-a-std-of-1}

``` r
### The Standardize Basic Transform on the Boston Housing Dataset ----
# BEFORE

library(readr)
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- read_csv("data/STREAMLINING PROCESSES AT KINYANJUI FARM.csv")
```

```         
## Rows: 1470 Columns: 35
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr  (9): Attrition, BusinessTravel, Department, EducationField, Gender, Job...
## dbl (26): Age, DailyRate, DistanceFromHome, Education, EmployeeCount, Employ...
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

``` r
# Drop specified columns
columns_to_drop <- c('EmployeeCount', 'EmployeeNumber', 'Over18', 'StandardHours')
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, !(names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM) %in% columns_to_drop)]
summary(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)
```

```         
##       Age         Attrition         BusinessTravel       DailyRate     
##  Min.   :18.00   Length:1470        Length:1470        Min.   : 102.0  
##  1st Qu.:30.00   Class :character   Class :character   1st Qu.: 465.0  
##  Median :36.00   Mode  :character   Mode  :character   Median : 802.0  
##  Mean   :36.92                                         Mean   : 802.5  
##  3rd Qu.:43.00                                         3rd Qu.:1157.0  
##  Max.   :60.00                                         Max.   :1499.0  
##   Department        DistanceFromHome   Education     EducationField    
##  Length:1470        Min.   : 1.000   Min.   :1.000   Length:1470       
##  Class :character   1st Qu.: 2.000   1st Qu.:2.000   Class :character  
##  Mode  :character   Median : 7.000   Median :3.000   Mode  :character  
##                     Mean   : 9.193   Mean   :2.913                     
##                     3rd Qu.:14.000   3rd Qu.:4.000                     
##                     Max.   :29.000   Max.   :5.000                     
##  EnvironmentSatisfaction    Gender            HourlyRate     JobInvolvement
##  Min.   :1.000           Length:1470        Min.   : 30.00   Min.   :1.00  
##  1st Qu.:2.000           Class :character   1st Qu.: 48.00   1st Qu.:2.00  
##  Median :3.000           Mode  :character   Median : 66.00   Median :3.00  
##  Mean   :2.722                              Mean   : 65.89   Mean   :2.73  
##  3rd Qu.:4.000                              3rd Qu.: 83.75   3rd Qu.:3.00  
##  Max.   :4.000                              Max.   :100.00   Max.   :4.00  
##     JobLevel       JobRole          JobSatisfaction MaritalStatus     
##  Min.   :1.000   Length:1470        Min.   :1.000   Length:1470       
##  1st Qu.:1.000   Class :character   1st Qu.:2.000   Class :character  
##  Median :2.000   Mode  :character   Median :3.000   Mode  :character  
##  Mean   :2.064                      Mean   :2.729                     
##  3rd Qu.:3.000                      3rd Qu.:4.000                     
##  Max.   :5.000                      Max.   :4.000                     
##  MonthlyIncome    MonthlyRate    NumCompaniesWorked   OverTime        
##  Min.   : 1009   Min.   : 2094   Min.   :0.000      Length:1470       
##  1st Qu.: 2911   1st Qu.: 8047   1st Qu.:1.000      Class :character  
##  Median : 4919   Median :14236   Median :2.000      Mode  :character  
##  Mean   : 6503   Mean   :14313   Mean   :2.693                        
##  3rd Qu.: 8379   3rd Qu.:20462   3rd Qu.:4.000                        
##  Max.   :19999   Max.   :26999   Max.   :9.000                        
##  PercentSalaryHike PerformanceRating RelationshipSatisfaction StockOptionLevel
##  Min.   :11.00     Min.   :3.000     Min.   :1.000            Min.   :0.0000  
##  1st Qu.:12.00     1st Qu.:3.000     1st Qu.:2.000            1st Qu.:0.0000  
##  Median :14.00     Median :3.000     Median :3.000            Median :1.0000  
##  Mean   :15.21     Mean   :3.154     Mean   :2.712            Mean   :0.7939  
##  3rd Qu.:18.00     3rd Qu.:3.000     3rd Qu.:4.000            3rd Qu.:1.0000  
##  Max.   :25.00     Max.   :4.000     Max.   :4.000            Max.   :3.0000  
##  TotalWorkingYears TrainingTimesLastYear WorkLifeBalance YearsAtCompany  
##  Min.   : 0.00     Min.   :0.000         Min.   :1.000   Min.   : 0.000  
##  1st Qu.: 6.00     1st Qu.:2.000         1st Qu.:2.000   1st Qu.: 3.000  
##  Median :10.00     Median :3.000         Median :3.000   Median : 5.000  
##  Mean   :11.28     Mean   :2.799         Mean   :2.761   Mean   : 7.008  
##  3rd Qu.:15.00     3rd Qu.:3.000         3rd Qu.:3.000   3rd Qu.: 9.000  
##  Max.   :40.00     Max.   :6.000         Max.   :4.000   Max.   :40.000  
##  YearsInCurrentRole YearsSinceLastPromotion YearsWithCurrManager
##  Min.   : 0.000     Min.   : 0.000          Min.   : 0.000      
##  1st Qu.: 2.000     1st Qu.: 0.000          1st Qu.: 2.000      
##  Median : 3.000     Median : 1.000          Median : 3.000      
##  Mean   : 4.229     Mean   : 2.188          Mean   : 4.123      
##  3rd Qu.: 7.000     3rd Qu.: 3.000          3rd Qu.: 7.000      
##  Max.   :18.000     Max.   :15.000          Max.   :17.000
```

``` r
sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 11, 12, 13, 15 , 17 , 18, 19,  21, 22, 23,24, 25, 26, 27, 28 ,29, 30, 31   )], sd)
```

```         
##                      Age                DailyRate         DistanceFromHome 
##                9.1353735              403.5090999                8.1068644 
##                Education  EnvironmentSatisfaction               HourlyRate 
##                1.0241649                1.0930822               20.3294276 
##           JobInvolvement                 JobLevel          JobSatisfaction 
##                0.7115611                1.1069399                1.1028461 
##            MonthlyIncome              MonthlyRate       NumCompaniesWorked 
##             4707.9567831             7117.7860441                2.4980090 
##        PercentSalaryHike        PerformanceRating RelationshipSatisfaction 
##                3.6599377                0.3608235                1.0812089 
##         StockOptionLevel        TotalWorkingYears    TrainingTimesLastYear 
##                0.8520767                7.7807817                1.2892706 
##          WorkLifeBalance           YearsAtCompany       YearsInCurrentRole 
##                0.7064758                6.1265252                3.6231370 
##  YearsSinceLastPromotion     YearsWithCurrManager 
##                3.2224303                3.5681361
```

``` r
model_of_the_transform <- preProcess(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM,
                                     method = c("scale", "center"))
print(model_of_the_transform)
```

```         
## Created from 1470 samples and 31 variables
## 
## Pre-processing:
##   - centered (23)
##   - ignored (8)
##   - scaled (23)
```

``` r
streamling_processes_standardize_transform <- predict(model_of_the_transform, # nolint
                                                STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)

# AFTER
summary(streamling_processes_standardize_transform)
```

```         
##       Age           Attrition         BusinessTravel       DailyRate        
##  Min.   :-2.0715   Length:1470        Length:1470        Min.   :-1.735985  
##  1st Qu.:-0.7579   Class :character   Class :character   1st Qu.:-0.836377  
##  Median :-0.1011   Mode  :character   Mode  :character   Median :-0.001204  
##  Mean   : 0.0000                                         Mean   : 0.000000  
##  3rd Qu.: 0.6651                                         3rd Qu.: 0.878578  
##  Max.   : 2.5260                                         Max.   : 1.726143  
##   Department        DistanceFromHome    Education        EducationField    
##  Length:1470        Min.   :-1.0106   Min.   :-1.86779   Length:1470       
##  Class :character   1st Qu.:-0.8872   1st Qu.:-0.89138   Class :character  
##  Mode  :character   Median :-0.2705   Median : 0.08502   Mode  :character  
##                     Mean   : 0.0000   Mean   : 0.00000                     
##                     3rd Qu.: 0.5930   3rd Qu.: 1.06143                     
##                     Max.   : 2.4433   Max.   : 2.03783                     
##  EnvironmentSatisfaction    Gender            HourlyRate       
##  Min.   :-1.5752         Length:1470        Min.   :-1.765478  
##  1st Qu.:-0.6603         Class :character   1st Qu.:-0.880062  
##  Median : 0.2545         Mode  :character   Median : 0.005354  
##  Mean   : 0.0000                            Mean   : 0.000000  
##  3rd Qu.: 1.1694                            3rd Qu.: 0.878472  
##  Max.   : 1.1694                            Max.   : 1.677806  
##  JobInvolvement       JobLevel          JobRole          JobSatisfaction  
##  Min.   :-2.4312   Min.   :-0.96116   Length:1470        Min.   :-1.5674  
##  1st Qu.:-1.0258   1st Qu.:-0.96116   Class :character   1st Qu.:-0.6606  
##  Median : 0.3795   Median :-0.05777   Mode  :character   Median : 0.2461  
##  Mean   : 0.0000   Mean   : 0.00000                      Mean   : 0.0000  
##  3rd Qu.: 0.3795   3rd Qu.: 0.84562                      3rd Qu.: 1.1529  
##  Max.   : 1.7849   Max.   : 2.65241                      Max.   : 1.1529  
##  MaritalStatus      MonthlyIncome      MonthlyRate      NumCompaniesWorked
##  Length:1470        Min.   :-1.1669   Min.   :-1.7167   Min.   :-1.0781   
##  Class :character   1st Qu.:-0.7629   1st Qu.:-0.8803   1st Qu.:-0.6778   
##  Mode  :character   Median :-0.3364   Median :-0.0109   Median :-0.2775   
##                     Mean   : 0.0000   Mean   : 0.0000   Mean   : 0.0000   
##                     3rd Qu.: 0.3985   3rd Qu.: 0.8638   3rd Qu.: 0.5231   
##                     Max.   : 2.8667   Max.   : 1.7823   Max.   : 2.5247   
##    OverTime         PercentSalaryHike PerformanceRating
##  Length:1470        Min.   :-1.1502   Min.   :-0.4261  
##  Class :character   1st Qu.:-0.8769   1st Qu.:-0.4261  
##  Mode  :character   Median :-0.3305   Median :-0.4261  
##                     Mean   : 0.0000   Mean   : 0.0000  
##                     3rd Qu.: 0.7624   3rd Qu.:-0.4261  
##                     Max.   : 2.6750   Max.   : 2.3454  
##  RelationshipSatisfaction StockOptionLevel  TotalWorkingYears
##  Min.   :-1.5836          Min.   :-0.9317   Min.   :-1.4497  
##  1st Qu.:-0.6587          1st Qu.:-0.9317   1st Qu.:-0.6785  
##  Median : 0.2661          Median : 0.2419   Median :-0.1645  
##  Mean   : 0.0000          Mean   : 0.0000   Mean   : 0.0000  
##  3rd Qu.: 1.1910          3rd Qu.: 0.2419   3rd Qu.: 0.4782  
##  Max.   : 1.1910          Max.   : 2.5891   Max.   : 3.6912  
##  TrainingTimesLastYear WorkLifeBalance  YearsAtCompany    YearsInCurrentRole
##  Min.   :-2.1712       Min.   :-2.493   Min.   :-1.1439   Min.   :-1.1673   
##  1st Qu.:-0.6200       1st Qu.:-1.077   1st Qu.:-0.6542   1st Qu.:-0.6153   
##  Median : 0.1557       Median : 0.338   Median :-0.3278   Median :-0.3393   
##  Mean   : 0.0000       Mean   : 0.000   Mean   : 0.0000   Mean   : 0.0000   
##  3rd Qu.: 0.1557       3rd Qu.: 0.338   3rd Qu.: 0.3251   3rd Qu.: 0.7647   
##  Max.   : 2.4826       Max.   : 1.753   Max.   : 5.3851   Max.   : 3.8008   
##  YearsSinceLastPromotion YearsWithCurrManager
##  Min.   :-0.6789         Min.   :-1.1555     
##  1st Qu.:-0.6789         1st Qu.:-0.5950     
##  Median :-0.3686         Median :-0.3148     
##  Mean   : 0.0000         Mean   : 0.0000     
##  3rd Qu.: 0.2521         3rd Qu.: 0.8063     
##  Max.   : 3.9760         Max.   : 3.6089
```

``` r
sapply(streamling_processes_standardize_transform[, c(1,4, 6, 7, 9, 11, 12, 13, 15 , 17 , 18, 19,  21, 22, 23,24, 25, 26, 27, 28 ,29, 30, 31   )], sd)
```

```         
##                      Age                DailyRate         DistanceFromHome 
##                        1                        1                        1 
##                Education  EnvironmentSatisfaction               HourlyRate 
##                        1                        1                        1 
##           JobInvolvement                 JobLevel          JobSatisfaction 
##                        1                        1                        1 
##            MonthlyIncome              MonthlyRate       NumCompaniesWorked 
##                        1                        1                        1 
##        PercentSalaryHike        PerformanceRating RelationshipSatisfaction 
##                        1                        1                        1 
##         StockOptionLevel        TotalWorkingYears    TrainingTimesLastYear 
##                        1                        1                        1 
##          WorkLifeBalance           YearsAtCompany       YearsInCurrentRole 
##                        1                        1                        1 
##  YearsSinceLastPromotion     YearsWithCurrManager 
##                        1                        1
```

# Training Models {#training-models}

`Training Models` refers to the process of building and refining predictive or descriptive models using machine learning algorithms. In this context, "training" involves using a labeled dataset (input data paired with corresponding output labels) to teach the model to make predictions or classifications. The model learns patterns and relationships within the training data, adjusting its internal parameters to optimize its performance. The trained model can then be evaluated on new, unseen data to assess its generalization ability. The goal is to develop a model that accurately captures underlying patterns in the data and can make reliable predictions on new, similar data. Techniques for training models include regression, classification, clustering, and neural networks, among others.

### Split the dataset {#split-the-dataset}

We generate random indices for the training set using sample, and then we use these indices to extract the corresponding rows from the dataset, creating the training and testing datasets (train_streamling_processes_train and test_streamling_processes_test).Now, you have a 75:25 split of theSTREAMLINING_PROCESSES_AT_KINYANJUI_FARM dataset into training and testing sets. We use train_streamling_processes_train for model training and test_streamling_processes_test for model evaluation.

``` r
## 1. Split the dataset
train_index <- createDataPartition(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$Attrition,
                                   p = 0.75,
                                   list = FALSE)
train_streamling_processes_train <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[train_index, ]
test_streamling_processes_test <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[-train_index, ]

# Check the column names of pima_train
colnames(train_streamling_processes_train)
```

```         
##  [1] "Age"                      "Attrition"               
##  [3] "BusinessTravel"           "DailyRate"               
##  [5] "Department"               "DistanceFromHome"        
##  [7] "Education"                "EducationField"          
##  [9] "EnvironmentSatisfaction"  "Gender"                  
## [11] "HourlyRate"               "JobInvolvement"          
## [13] "JobLevel"                 "JobRole"                 
## [15] "JobSatisfaction"          "MaritalStatus"           
## [17] "MonthlyIncome"            "MonthlyRate"             
## [19] "NumCompaniesWorked"       "OverTime"                
## [21] "PercentSalaryHike"        "PerformanceRating"       
## [23] "RelationshipSatisfaction" "StockOptionLevel"        
## [25] "TotalWorkingYears"        "TrainingTimesLastYear"   
## [27] "WorkLifeBalance"          "YearsAtCompany"          
## [29] "YearsInCurrentRole"       "YearsSinceLastPromotion" 
## [31] "YearsWithCurrManager"
```

### NaiveBayes() function in the e1071 package {#naivebayes-function-in-the-e1071-package}

``` r
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
```

```         
## [1] "No"  "Yes"
```

``` r
setdiff(unique_levels_actual, unique_levels_pred)
```

```         
## NULL
```

``` r
# Convert predictions to factor and align levels
predictions_nb_e1071 <- as.factor(predictions_nb_e1071)
#levels(predictions_nb_e1071) <- levels(test_streamling_processes_test$Attrition)

#Update Actual Levels to Match Predicted Levels
test_streamling_processes_test$Attrition <- as.factor(test_streamling_processes_test$Attrition)
levels(test_streamling_processes_test$Attrition) <- levels(predictions_nb_e1071)


# View the Results
print(predictions_nb_e1071)
```

```         
##   [1] Yes No  No  No  Yes No  Yes Yes No  Yes No  Yes No  Yes No  No  No  No 
##  [19] No  No  No  Yes No  No  No  No  No  No  No  No  No  No  No  No  Yes No 
##  [37] No  No  No  Yes No  No  No  No  No  No  No  No  No  No  No  No  Yes No 
##  [55] No  No  No  No  No  No  Yes No  No  No  No  No  No  No  No  Yes No  No 
##  [73] No  No  No  No  No  Yes No  Yes No  Yes Yes No  No  No  No  No  No  No 
##  [91] Yes Yes No  Yes Yes No  No  No  No  No  No  No  No  No  Yes No  Yes No 
## [109] No  Yes No  No  No  No  No  Yes No  Yes Yes No  No  No  No  Yes No  No 
## [127] No  No  No  No  Yes Yes No  No  No  Yes No  No  No  No  No  No  No  No 
## [145] Yes Yes No  No  No  No  Yes Yes No  Yes Yes No  No  No  No  No  Yes No 
## [163] Yes No  No  No  Yes No  No  No  Yes No  Yes No  No  No  Yes No  No  No 
## [181] No  Yes Yes No  No  No  No  No  No  Yes No  Yes No  No  Yes No  No  No 
## [199] No  No  Yes No  Yes No  No  Yes No  Yes No  No  No  No  No  No  No  No 
## [217] No  No  No  No  No  No  No  Yes No  No  No  No  No  Yes No  No  No  No 
## [235] No  No  Yes No  No  No  No  No  No  No  Yes No  No  No  No  No  No  No 
## [253] No  Yes No  No  No  No  Yes No  No  Yes No  No  No  No  No  No  No  Yes
## [271] Yes Yes No  No  No  No  No  No  No  No  No  No  Yes No  No  No  Yes No 
## [289] Yes No  No  No  Yes No  Yes No  No  No  No  No  Yes No  No  Yes No  No 
## [307] No  No  Yes No  Yes No  No  No  No  No  No  No  No  No  No  No  Yes No 
## [325] No  No  No  No  Yes No  Yes No  Yes No  No  No  No  No  No  No  No  Yes
## [343] No  Yes No  No  No  No  No  No  No  No  No  Yes Yes No  Yes No  No  Yes
## [361] No  No  No  No  Yes No  No 
## Levels: No Yes
```

``` r
# Confusion Matrix
conf_matrix <- caret::confusionMatrix(predictions_nb_e1071,
                                      test_streamling_processes_test$Attrition)
print(conf_matrix)
```

```         
## Confusion Matrix and Statistics
## 
##           Reference
## Prediction  No Yes
##        No  261  24
##        Yes  47  35
##                                           
##                Accuracy : 0.8065          
##                  95% CI : (0.7624, 0.8457)
##     No Information Rate : 0.8392          
##     P-Value [Acc > NIR] : 0.95954         
##                                           
##                   Kappa : 0.3806          
##                                           
##  Mcnemar's Test P-Value : 0.00903         
##                                           
##             Sensitivity : 0.8474          
##             Specificity : 0.5932          
##          Pos Pred Value : 0.9158          
##          Neg Pred Value : 0.4268          
##              Prevalence : 0.8392          
##          Detection Rate : 0.7112          
##    Detection Prevalence : 0.7766          
##       Balanced Accuracy : 0.7203          
##                                           
##        'Positive' Class : No              
## 
```

``` r
# The confusion matrix can also be viewed graphically,
# although with less information.
plot(table(predictions_nb_e1071,
           test_streamling_processes_test$`Attrition`))
```

![](Acers_Project_files/figure-gfm/Your%20twenty%20first%20Code%20Chunk-1.png)<!-- -->

``` r
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
```

#### Classification: LDA with k-fold Cross Validation {#classification-lda-with-k-fold-cross-validation}

``` r
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
```

```         
## Linear Discriminant Analysis 
## 
## 1470 samples
##   30 predictor
##    2 classes: 'No', 'Yes' 
## 
## No pre-processing
## Resampling: Cross-Validated (5 fold) 
## Summary of sample sizes: 1176, 1175, 1177, 1175, 1177 
## Resampling results:
## 
##   Accuracy   Kappa   
##   0.8734775  0.436173
## 
## Tuning parameter 'dimen' was held constant at a value of 1
```

``` r
caret::confusionMatrix(predictions_lda, test_streamling_processes_test$Attrition)
```

```         
## Confusion Matrix and Statistics
## 
##           Reference
## Prediction  No Yes
##        No  298  31
##        Yes  10  28
##                                           
##                Accuracy : 0.8883          
##                  95% CI : (0.8515, 0.9186)
##     No Information Rate : 0.8392          
##     P-Value [Acc > NIR] : 0.004869        
##                                           
##                   Kappa : 0.5164          
##                                           
##  Mcnemar's Test P-Value : 0.001787        
##                                           
##             Sensitivity : 0.9675          
##             Specificity : 0.4746          
##          Pos Pred Value : 0.9058          
##          Neg Pred Value : 0.7368          
##              Prevalence : 0.8392          
##          Detection Rate : 0.8120          
##    Detection Prevalence : 0.8965          
##       Balanced Accuracy : 0.7211          
##                                           
##        'Positive' Class : No              
## 
```

``` r
plot(table(predictions_lda, test_streamling_processes_test$Attrition))
```

![](Acers_Project_files/figure-gfm/Your%20twenty%20second%20Code%20Chunk-1.png)<!-- -->

#### Classification: Naive Bayes with Repeated k-fold Cross Validation ---- {#classification-naive-bayes-with-repeated-k-fold-cross-validation--}

``` r
### 4.a. Train an e1071::naive Bayes Attritionifier based on the churn variable
streamling_dateset_model_nb <-
  e1071::naiveBayes(`Attrition` ~ ., data = train_streamling_processes_train)

### 4.b. Test the trained naive Bayes Attritionifier using the testing dataset 
predictions_nb_e1071 <-
  predict(streamling_dateset_model_nb, test_streamling_processes_test[, 1:31])

### 4.c. View a summary of the naive Bayes model and the confusion matrix 
print(streamling_dateset_model_nb)
```

```         
## 
## Naive Bayes Classifier for Discrete Predictors
## 
## Call:
## naiveBayes.default(x = X, y = Y, laplace = laplace)
## 
## A-priori probabilities:
## Y
##        No       Yes 
## 0.8386219 0.1613781 
## 
## Conditional probabilities:
##      Age
## Y         [,1]     [,2]
##   No  37.63892 9.000685
##   Yes 33.25843 9.892676
## 
##      BusinessTravel
## Y     Non-Travel Travel_Frequently Travel_Rarely
##   No  0.10594595        0.16324324    0.73081081
##   Yes 0.05617978        0.28089888    0.66292135
## 
##      DailyRate
## Y         [,1]     [,2]
##   No  814.0259 401.8619
##   Yes 757.4888 400.0808
## 
##      Department
## Y     Human Resources Research & Development      Sales
##   No       0.04108108             0.66918919 0.28972973
##   Yes      0.05617978             0.52808989 0.41573034
## 
##      DistanceFromHome
## Y          [,1]     [,2]
##   No   8.884324 8.035542
##   Yes 10.224719 8.267768
## 
##      Education
## Y         [,1]     [,2]
##   No  2.913514 1.045026
##   Yes 2.808989 1.029249
## 
##      EducationField
## Y     Human Resources Life Sciences  Marketing    Medical      Other
##   No       0.01513514    0.40864865 0.10702703 0.33405405 0.05405405
##   Yes      0.03370787    0.33146067 0.16292135 0.26404494 0.04494382
##      EducationField
## Y     Technical Degree
##   No        0.08108108
##   Yes       0.16292135
## 
##      EnvironmentSatisfaction
## Y        [,1]     [,2]
##   No  2.76000 1.073450
##   Yes 2.52809 1.179772
## 
##      Gender
## Y        Female      Male
##   No  0.4075676 0.5924324
##   Yes 0.3314607 0.6685393
## 
##      HourlyRate
## Y         [,1]     [,2]
##   No  66.70919 20.29076
##   Yes 65.51685 20.49259
## 
##      JobInvolvement
## Y         [,1]      [,2]
##   No  2.770811 0.6911718
##   Yes 2.522472 0.7753625
## 
##      JobLevel
## Y         [,1]      [,2]
##   No  2.138378 1.1244467
##   Yes 1.634831 0.9485762
## 
##      JobRole
## Y     Healthcare Representative Human Resources Laboratory Technician
##   No                0.096216216     0.033513514           0.162162162
##   Yes               0.022471910     0.056179775           0.264044944
##      JobRole
## Y         Manager Manufacturing Director Research Director Research Scientist
##   No  0.082162162            0.116756757       0.057297297        0.193513514
##   Yes 0.022471910            0.044943820       0.005617978        0.179775281
##      JobRole
## Y     Sales Executive Sales Representative
##   No      0.217297297          0.041081081
##   Yes     0.258426966          0.146067416
## 
##      JobSatisfaction
## Y         [,1]     [,2]
##   No  2.771892 1.096467
##   Yes 2.438202 1.109334
## 
##      MaritalStatus
## Y      Divorced   Married    Single
##   No  0.2313514 0.4821622 0.2864865
##   Yes 0.1573034 0.3314607 0.5112360
## 
##      MonthlyIncome
## Y         [,1]     [,2]
##   No  6775.414 4819.691
##   Yes 4750.534 3691.935
## 
##      MonthlyRate
## Y         [,1]     [,2]
##   No  14426.74 7030.436
##   Yes 14726.62 7128.048
## 
##      NumCompaniesWorked
## Y         [,1]     [,2]
##   No  2.725405 2.486817
##   Yes 2.887640 2.640143
## 
##      OverTime
## Y            No       Yes
##   No  0.7740541 0.2259459
##   Yes 0.4887640 0.5112360
## 
##      PercentSalaryHike
## Y         [,1]     [,2]
##   No  15.31243 3.643875
##   Yes 15.02809 3.749847
## 
##      PerformanceRating
## Y         [,1]      [,2]
##   No  3.156757 0.3637680
##   Yes 3.146067 0.3541701
## 
##      RelationshipSatisfaction
## Y         [,1]     [,2]
##   No  2.721081 1.065008
##   Yes 2.606742 1.126145
## 
##      StockOptionLevel
## Y          [,1]      [,2]
##   No  0.8421622 0.8432028
##   Yes 0.5056180 0.8250813
## 
##      TotalWorkingYears
## Y          [,1]     [,2]
##   No  11.871351 7.869037
##   Yes  8.348315 7.463056
## 
##      TrainingTimesLastYear
## Y         [,1]     [,2]
##   No  2.842162 1.298082
##   Yes 2.696629 1.261373
## 
##      WorkLifeBalance
## Y         [,1]      [,2]
##   No  2.787027 0.6702105
##   Yes 2.623596 0.8294743
## 
##      YearsAtCompany
## Y         [,1]     [,2]
##   No  7.172973 6.022354
##   Yes 5.101124 6.168161
## 
##      YearsInCurrentRole
## Y         [,1]     [,2]
##   No  4.411892 3.590522
##   Yes 2.853933 3.233129
## 
##      YearsSinceLastPromotion
## Y         [,1]     [,2]
##   No  2.090811 3.081219
##   Yes 1.955056 3.241364
## 
##      YearsWithCurrManager
## Y         [,1]     [,2]
##   No  4.280000 3.555753
##   Yes 2.724719 3.134924
```

``` r
caret::confusionMatrix(predictions_nb_e1071, test_streamling_processes_test$Attrition)
```

```         
## Confusion Matrix and Statistics
## 
##           Reference
## Prediction  No Yes
##        No  261  24
##        Yes  47  35
##                                           
##                Accuracy : 0.8065          
##                  95% CI : (0.7624, 0.8457)
##     No Information Rate : 0.8392          
##     P-Value [Acc > NIR] : 0.95954         
##                                           
##                   Kappa : 0.3806          
##                                           
##  Mcnemar's Test P-Value : 0.00903         
##                                           
##             Sensitivity : 0.8474          
##             Specificity : 0.5932          
##          Pos Pred Value : 0.9158          
##          Neg Pred Value : 0.4268          
##              Prevalence : 0.8392          
##          Detection Rate : 0.7112          
##    Detection Prevalence : 0.7766          
##       Balanced Accuracy : 0.7203          
##                                           
##        'Positive' Class : No              
## 
```

``` r
plot(table(predictions_nb_e1071, test_streamling_processes_test$Attrition))
```

![](Acers_Project_files/figure-gfm/Your%20twenty%20third%20Code%20Chunk-1.png)<!-- -->

#### Classification: SVM with Repeated k-fold Cross Validation {#classification-svm-with-repeated-k-fold-cross-validation}

``` r
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
```

```         
## L2 Regularized Linear Support Vector Machines with Class Weights 
## 
## 1103 samples
##   30 predictor
##    2 classes: 'No', 'Yes' 
## 
## No pre-processing
## Resampling: Cross-Validated (5 fold, repeated 10 times) 
## Summary of sample sizes: 882, 882, 882, 883, 883, 882, ... 
## Resampling results across tuning parameters:
## 
##   cost  Loss  weight  Accuracy   Kappa       
##   0.25  L1    1       0.7316981  0.0008966698
##   0.25  L1    2       0.7498893  0.0091594654
##   0.25  L1    3       0.6940498  0.0187904658
##   0.25  L2    1       0.8386261  0.0000000000
##   0.25  L2    2       0.8386261  0.0000000000
##   0.25  L2    3       0.8348161  0.0272426179
##   0.50  L1    1       0.7314788  0.0094526012
##   0.50  L1    2       0.7113369  0.0091888134
##   0.50  L1    3       0.7560950  0.0108168897
##   0.50  L2    1       0.8386261  0.0000000000
##   0.50  L2    2       0.8386261  0.0000000000
##   0.50  L2    3       0.8348161  0.0272426179
##   1.00  L1    1       0.7801501  0.0024531820
##   1.00  L1    2       0.7121156  0.0012114600
##   1.00  L1    3       0.7351740  0.0113118554
##   1.00  L2    1       0.8386261  0.0000000000
##   1.00  L2    2       0.8386261  0.0000000000
##   1.00  L2    3       0.8348161  0.0272426179
## 
## Accuracy was used to select the optimal model using the largest value.
## The final values used for the model were cost = 0.25, Loss = L2 and weight = 1.
```

``` r
caret::confusionMatrix(predictions_svm, test_streamling_processes_test$Attrition)
```

```         
## Confusion Matrix and Statistics
## 
##           Reference
## Prediction  No Yes
##        No  308  59
##        Yes   0   0
##                                           
##                Accuracy : 0.8392          
##                  95% CI : (0.7976, 0.8753)
##     No Information Rate : 0.8392          
##     P-Value [Acc > NIR] : 0.5347          
##                                           
##                   Kappa : 0               
##                                           
##  Mcnemar's Test P-Value : 4.321e-14       
##                                           
##             Sensitivity : 1.0000          
##             Specificity : 0.0000          
##          Pos Pred Value : 0.8392          
##          Neg Pred Value :    NaN          
##              Prevalence : 0.8392          
##          Detection Rate : 0.8392          
##    Detection Prevalence : 1.0000          
##       Balanced Accuracy : 0.5000          
##                                           
##        'Positive' Class : No              
## 
```

``` r
plot(table(predictions_svm, test_streamling_processes_test$Attrition))
```

![](Acers_Project_files/figure-gfm/Your%20twenty%20fourth%20Code%20Chunk-1.png)<!-- -->

#### Classification: Naive Bayes with Leave One Out Cross Validation {#classification-naive-bayes-with-leave-one-out-cross-validation}

``` r
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
```

```         
## Naive Bayes 
## 
## 1103 samples
##   30 predictor
##    2 classes: 'No', 'Yes' 
## 
## No pre-processing
## Resampling: Leave-One-Out Cross-Validation 
## Summary of sample sizes: 1102, 1102, 1102, 1102, 1102, 1102, ... 
## Resampling results across tuning parameters:
## 
##   usekernel  Accuracy   Kappa    
##   FALSE      0.6681777  0.2418589
##    TRUE      0.8386219  0.0000000
## 
## Tuning parameter 'laplace' was held constant at a value of 0
## Tuning
##  parameter 'adjust' was held constant at a value of 1
## Accuracy was used to select the optimal model using the largest value.
## The final values used for the model were laplace = 0, usekernel = TRUE
##  and adjust = 1.
```

``` r
caret::confusionMatrix(predictions_nb_loocv, test_streamling_processes_test$Attrition)
```

```         
## Confusion Matrix and Statistics
## 
##           Reference
## Prediction  No Yes
##        No  308  59
##        Yes   0   0
##                                           
##                Accuracy : 0.8392          
##                  95% CI : (0.7976, 0.8753)
##     No Information Rate : 0.8392          
##     P-Value [Acc > NIR] : 0.5347          
##                                           
##                   Kappa : 0               
##                                           
##  Mcnemar's Test P-Value : 4.321e-14       
##                                           
##             Sensitivity : 1.0000          
##             Specificity : 0.0000          
##          Pos Pred Value : 0.8392          
##          Neg Pred Value :    NaN          
##              Prevalence : 0.8392          
##          Detection Rate : 0.8392          
##    Detection Prevalence : 1.0000          
##       Balanced Accuracy : 0.5000          
##                                           
##        'Positive' Class : No              
## 
```

``` r
plot(table(predictions_nb_loocv, test_streamling_processes_test$Attrition))
```

![](Acers_Project_files/figure-gfm/Your%20twenty%20fifth%20Code%20Chunk-1.png)<!-- -->

### Actual Our Model Algorithm {#actual-our-model-algorithm}

The decision to employ a Support Vector Machine (SVM) with a radial basis function (RBF) kernel is justified by its superior accuracy compared to alternatives like Linear Discriminant Analysis (LDA). The SVM-RBF combination excels in capturing complex, non-linear patterns, handles high-dimensional spaces adeptly, exhibits robustness to outliers, and offers flexible parameter tuning. These traits collectively contribute to its efficacy in achieving accurate predictions, especially on unseen data

``` r
### Train the model
set.seed(7)
train_control <- trainControl(method = "cv", number = 5)
streamling_caret_model_svm_radial <- # nolint: object_length_linter.
  train(Attrition ~ ., data = train_streamling_processes_train, method = "svmRadial",
        metric = "Accuracy", trControl = train_control)

#### Display the model's details 
print(streamling_caret_model_svm_radial)
```

```         
## Support Vector Machines with Radial Basis Function Kernel 
## 
## 1103 samples
##   30 predictor
##    2 classes: 'No', 'Yes' 
## 
## No pre-processing
## Resampling: Cross-Validated (5 fold) 
## Summary of sample sizes: 882, 882, 883, 882, 883 
## Resampling results across tuning parameters:
## 
##   C     Accuracy   Kappa     
##   0.25  0.8386261  0.00000000
##   0.50  0.8404401  0.01855692
##   1.00  0.8604072  0.23391160
## 
## Tuning parameter 'sigma' was held constant at a value of 0.01332559
## Accuracy was used to select the optimal model using the largest value.
## The final values used for the model were sigma = 0.01332559 and C = 1.
```

``` r
#### Make predictions 
predictions <- predict(streamling_caret_model_svm_radial,
                       test_streamling_processes_test[, 1:31])

#### Display the model's evaluation metrics   
table(predictions, test_streamling_processes_test$Attrition)
```

```         
##            
## predictions  No Yes
##         No  306  45
##         Yes   2  14
```

``` r
confusion_matrix <-
  caret::confusionMatrix(predictions,
                         test_streamling_processes_test[, 1:31]$Attrition)
print(confusion_matrix)
```

```         
## Confusion Matrix and Statistics
## 
##           Reference
## Prediction  No Yes
##        No  306  45
##        Yes   2  14
##                                           
##                Accuracy : 0.8719          
##                  95% CI : (0.8334, 0.9044)
##     No Information Rate : 0.8392          
##     P-Value [Acc > NIR] : 0.04801         
##                                           
##                   Kappa : 0.3272          
##                                           
##  Mcnemar's Test P-Value : 8.993e-10       
##                                           
##             Sensitivity : 0.9935          
##             Specificity : 0.2373          
##          Pos Pred Value : 0.8718          
##          Neg Pred Value : 0.8750          
##              Prevalence : 0.8392          
##          Detection Rate : 0.8338          
##    Detection Prevalence : 0.9564          
##       Balanced Accuracy : 0.6154          
##                                           
##        'Positive' Class : No              
## 
```

``` r
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
```

![](Acers_Project_files/figure-gfm/Your%20twenty%20sixth%20Code%20Chunk-1.png)<!-- -->

## Model Performance and Comparison {#model-performance-and-comparison}

The code performs model training and comparison for predicting 'Attrition' using different algorithms. It sets up a repeated cross-validation control (train_control), then trains models using Linear Discriminant Analysis (LDA), Classification and Regression Trees (CART), k-Nearest Neighbors (KNN), Support Vector Machine with radial kernel (SVM), and Random Forest. The goal is to evaluate and compare the performance of these models using the specified training control settings.

``` r
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
```

![](Acers_Project_files/figure-gfm/Your%20twenty%20seventh%20Code%20Chunk-1.png)<!-- -->

``` r
scales <- list(x = list(relation = "free"), y = list(relation = "free"))
dotplot(results, scales = scales)
```

![](Acers_Project_files/figure-gfm/Your%20twenty%20seventh%20Code%20Chunk-2.png)<!-- -->

``` r
splom(results)
```

![](Acers_Project_files/figure-gfm/Your%20twenty%20seventh%20Code%20Chunk-3.png)<!-- -->

``` r
# xyplot plots to compare models
xyplot(results, models = c("LDA", "SVM"))
```

![](Acers_Project_files/figure-gfm/Your%20twenty%20seventh%20Code%20Chunk-4.png)<!-- -->

``` r
# or
# xyplot plots to compare models
xyplot(results, models = c("SVM", "CART"))
```

![](Acers_Project_files/figure-gfm/Your%20twenty%20seventh%20Code%20Chunk-5.png)<!-- -->

``` r
diffs <- diff(results)

summary(diffs)
```

```         
## 
## Call:
## summary.diff.resamples(object = diffs)
## 
## p-value adjustment: bonferroni 
## Upper diagonal: estimates of the difference
## Lower diagonal: p-value for H0: difference = 0
## 
## Accuracy 
##      LDA       CART      KNN       SVM       RF       
## LDA             0.033098  0.041479  0.010201  0.017220
## CART 2.309e-08            0.008381 -0.022897 -0.015878
## KNN  2.859e-08 0.836319            -0.031278 -0.024259
## SVM  0.011950  1.216e-05 7.210e-09            0.007019
## RF   0.000505  0.002636  1.744e-05 0.178204           
## 
## Kappa 
##      LDA       CART      KNN       SVM       RF       
## LDA             0.247718  0.380570  0.169228  0.163456
## CART 4.288e-13            0.132852 -0.078490 -0.084262
## KNN  2.745e-15 3.032e-05           -0.211342 -0.217114
## SVM  4.027e-11 0.010489  6.963e-10           -0.005772
## RF   4.040e-09 0.004762  2.889e-10 1.000000
```

# Hyper Parameter Tunning {#hyper-parameter-tunning}

`Hyperparameter Tuning` involves optimizing the hyperparameters of a machine learning algorithm to enhance model performance. Hyperparameters are configuration settings external to the model that influence its learning process. The code likely employs techniques like grid search or random search to systematically explore different hyperparameter combinations for algorithms such as LDA, CART, KNN, SVM, and Random Forest. This process aims to find the optimal set of hyperparameters that yields the best model performance.

#### Grid Search {#grid-search}

``` r
# Apply a "Grid Search" to identify the best parameter value
# Each axis of the grid is an algorithm parameter, and points on the grid are
# specific combinations of parameters.

seed <- 7
metric <- "Accuracy"
train_control <- trainControl(method = "repeatedcv", number = 10, repeats = 3,
                              search = "grid")
set.seed(seed)

getModelInfo("RRFglobal")
```

```         
## $RRFglobal
## $RRFglobal$label
## [1] "Regularized Random Forest"
## 
## $RRFglobal$library
## [1] "RRF"
## 
## $RRFglobal$loop
## NULL
## 
## $RRFglobal$type
## [1] "Regression"     "Classification"
## 
## $RRFglobal$parameters
##   parameter   class                         label
## 1      mtry numeric #Randomly Selected Predictors
## 2   coefReg numeric          Regularization Value
## 
## $RRFglobal$grid
## function (x, y, len = NULL, search = "grid") 
## {
##     if (search == "grid") {
##         out <- expand.grid(mtry = caret::var_seq(p = ncol(x), 
##             classification = is.factor(y), len = len), coefReg = seq(0.01, 
##             1, length = len))
##     }
##     else {
##         out <- data.frame(mtry = sample(1:ncol(x), size = len, 
##             replace = TRUE), coefReg = runif(len, min = 0, max = 1))
##     }
##     out
## }
## 
## $RRFglobal$fit
## function (x, y, wts, param, lev, last, classProbs, ...) 
## {
##     RRF::RRF(x, y, mtry = param$mtry, coefReg = param$coefReg, 
##         ...)
## }
## 
## $RRFglobal$predict
## function (modelFit, newdata, submodels = NULL) 
## predict(modelFit, newdata)
## 
## $RRFglobal$prob
## function (modelFit, newdata, submodels = NULL) 
## predict(modelFit, newdata, type = "prob")
## 
## $RRFglobal$varImp
## function (object, ...) 
## {
##     varImp <- RRF::importance(object, ...)
##     if (object$type == "regression") 
##         varImp <- data.frame(Overall = varImp[, "%IncMSE"])
##     else {
##         retainNames <- levels(object$y)
##         if (all(retainNames %in% colnames(varImp))) {
##             varImp <- varImp[, retainNames]
##         }
##         else {
##             varImp <- data.frame(Overall = varImp[, 1])
##         }
##     }
##     out <- as.data.frame(varImp, stringsAsFactors = TRUE)
##     if (dim(out)[2] == 2) {
##         tmp <- apply(out, 1, mean)
##         out[, 1] <- out[, 2] <- tmp
##     }
##     out
## }
## 
## $RRFglobal$levels
## function (x) 
## x$obsLevels
## 
## $RRFglobal$tags
## [1] "Random Forest"              "Ensemble Model"            
## [3] "Bagging"                    "Implicit Feature Selection"
## [5] "Regularization"            
## 
## $RRFglobal$sort
## function (x) 
## x[order(x$coefReg), ]
```

``` r
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
```

```         
## Regularized Random Forest 
## 
## 1470 samples
##   30 predictor
##    2 classes: 'No', 'Yes' 
## 
## No pre-processing
## Resampling: Cross-Validated (10 fold, repeated 3 times) 
## Summary of sample sizes: 1323, 1323, 1322, 1323, 1323, 1323, ... 
## Resampling results across tuning parameters:
## 
##   mtry  coefReg  Accuracy   Kappa    
##    1    0.1      0.8206506  0.1595824
##    1    0.2      0.8195215  0.1126055
##    1    0.3      0.8176812  0.1142811
##    1    0.4      0.8197033  0.1122957
##    1    0.5      0.8226715  0.1267909
##    1    0.6      0.8256177  0.1316026
##    1    0.7      0.8462778  0.2133087
##    1    0.8      0.8508053  0.2434784
##    1    0.9      0.8551060  0.2726389
##    1    1.0      0.8576112  0.2944384
##    2    0.1      0.8136057  0.1003532
##    2    0.2      0.8188056  0.1416495
##    2    0.3      0.8140269  0.1208266
##    2    0.4      0.8226867  0.1479794
##    2    0.5      0.8186205  0.1191445
##    2    0.6      0.8310648  0.1532200
##    2    0.7      0.8433237  0.2034060
##    2    0.8      0.8566980  0.2780614
##    2    0.9      0.8564682  0.2784487
##    2    1.0      0.8576066  0.2920436
##    3    0.1      0.8188120  0.1456522
##    3    0.2      0.8172370  0.1289569
##    3    0.3      0.8224617  0.1545650
##    3    0.4      0.8113320  0.1075445
##    3    0.5      0.8226792  0.1425047
##    3    0.6      0.8283435  0.1408576
##    3    0.7      0.8505677  0.2497933
##    3    0.8      0.8539923  0.2724134
##    3    0.9      0.8562476  0.2819425
##    3    1.0      0.8564728  0.2857081
##    4    0.1      0.8233610  0.1764235
##    4    0.2      0.8272096  0.1789299
##    4    0.3      0.8152021  0.1341274
##    4    0.4      0.8167912  0.1219350
##    4    0.5      0.8183784  0.1482384
##    4    0.6      0.8385786  0.2076412
##    4    0.7      0.8465029  0.2361529
##    4    0.8      0.8535233  0.2674868
##    4    0.9      0.8571546  0.2855559
##    4    1.0      0.8560301  0.2806241
##    5    0.1      0.8154398  0.1238621
##    5    0.2      0.8147487  0.1077841
##    5    0.3      0.8267455  0.1631013
##    5    0.4      0.8254049  0.1863146
##    5    0.5      0.8190818  0.1207993
##    5    0.6      0.8362896  0.1791708
##    5    0.7      0.8478604  0.2384046
##    5    0.8      0.8539815  0.2680770
##    5    0.9      0.8548931  0.2747854
##    5    1.0      0.8548900  0.2755062
##    6    0.1      0.8193008  0.1377217
##    6    0.2      0.8226699  0.1673286
##    6    0.3      0.8152055  0.1161970
##    6    0.4      0.8217782  0.1441949
##    6    0.5      0.8188428  0.1344704
##    6    0.6      0.8365239  0.2070344
##    6    0.7      0.8517078  0.2540012
##    6    0.8      0.8528569  0.2661296
##    6    0.9      0.8546649  0.2746277
##    6    1.0      0.8557940  0.2748237
##    7    0.1      0.8167819  0.1226699
##    7    0.2      0.8145190  0.1133275
##    7    0.3      0.8138694  0.1273908
##    7    0.4      0.8158871  0.1349048
##    7    0.5      0.8238269  0.1406273
##    7    0.6      0.8346991  0.1742235
##    7    0.7      0.8544380  0.2788625
##    7    0.8      0.8535233  0.2639496
##    7    0.9      0.8587435  0.2923206
##    7    1.0      0.8555642  0.2801702
##    8    0.1      0.8254295  0.1740382
##    8    0.2      0.8186147  0.1513947
##    8    0.3      0.8106378  0.1188940
##    8    0.4      0.8290392  0.1592170
##    8    0.5      0.8213324  0.1612306
##    8    0.6      0.8349290  0.1752814
##    8    0.7      0.8512572  0.2550419
##    8    0.8      0.8564712  0.2842590
##    8    0.9      0.8571531  0.2827742
##    8    1.0      0.8571562  0.2854611
##    9    0.1      0.8172461  0.1329156
##    9    0.2      0.8160954  0.1387811
##    9    0.3      0.8233440  0.1612904
##    9    0.4      0.8195092  0.1566592
##    9    0.5      0.8226807  0.1592357
##    9    0.6      0.8358407  0.1857527
##    9    0.7      0.8521535  0.2575612
##    9    0.8      0.8557940  0.2826399
##    9    0.9      0.8562460  0.2813795
##    9    1.0      0.8580678  0.2959344
##   10    0.1      0.8226792  0.1636577
##   10    0.2      0.8272129  0.1718803
##   10    0.3      0.8172556  0.1552148
##   10    0.4      0.8260589  0.1805620
##   10    0.5      0.8222256  0.1724748
##   10    0.6      0.8354072  0.1738582
##   10    0.7      0.8528477  0.2683606
##   10    0.8      0.8537547  0.2680981
##   10    0.9      0.8557971  0.2807187
##   10    1.0      0.8557971  0.2800267
## 
## Accuracy was used to select the optimal model using the largest value.
## The final values used for the model were mtry = 7 and coefReg = 0.9.
```

``` r
plot(streamling_model_grid_search_rrf_global)
```

![](Acers_Project_files/figure-gfm/Your%20twenty%20eighth%20Code%20Chunk-1.png)<!-- -->

# Ensemble methods {#ensemble-methods}

`Ensemble methods` combine multiple machine learning models to improve overall predictive performance and robustness. These methods leverage the strengths of different models to compensate for individual weaknesses. Common ensemble methods include bagging, boosting, and stacking. `Bagging (Random Forest)` builds multiple models in parallel and averages their predictions, reducing variance. `Boosting (AdaBoost)` focuses on sequentially improving model performance by giving more weight to missclassified instances. Stacking combines predictions from multiple models using another model as a meta-learner. Ensemble methods often outperform individual models, providing more reliable and accurate predictions.

### Boosting {#boosting}

#### GBM {#gbm}

``` r
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
  resamples(list("C5.0 boosting ensemble" =ion_model_c50,
                 "Generalized Boosted Regression Modeling (GBM)" = ion_model_gbm))

summary(boosting_results)
```

```         
## 
## Call:
## summary.resamples(object = boosting_results)
## 
## Models: C5.0 boosting ensemble, Generalized Boosted Regression Modeling (GBM) 
## Number of resamples: 5 
## 
## Accuracy 
##                                                    Min.   1st Qu.    Median
## C5.0 boosting ensemble                        0.8474576 0.8508475 0.8639456
## Generalized Boosted Regression Modeling (GBM) 0.8474576 0.8600683 0.8779661
##                                                    Mean   3rd Qu.     Max. NA's
## C5.0 boosting ensemble                        0.8639860 0.8737201 0.883959    0
## Generalized Boosted Regression Modeling (GBM) 0.8721261 0.8843537 0.890785    0
## 
## Kappa 
##                                                    Min.   1st Qu.   Median
## C5.0 boosting ensemble                        0.2432879 0.3606016 0.379719
## Generalized Boosted Regression Modeling (GBM) 0.2600747 0.3077278 0.461788
##                                                    Mean   3rd Qu.      Max.
## C5.0 boosting ensemble                        0.3633392 0.3880737 0.4450139
## Generalized Boosted Regression Modeling (GBM) 0.3950538 0.4658159 0.4798626
##                                               NA's
## C5.0 boosting ensemble                           0
## Generalized Boosted Regression Modeling (GBM)    0
```

``` r
dotplot(boosting_results)
```

![](Acers_Project_files/figure-gfm/Your%20twenty%20nineth%20Code%20Chunk-1.png)<!-- -->

# Save and Load your Model {#save-and-load-your-model}

``` r
# Saving a model into a file allows you to load it later and use it to make
# predictions. Saved models can be loaded by calling the `readRDS()` function

saveRDS(streamling_caret_model_svm_radial, "./models/saved_streamling_caret_model_svm_radial.rds")
# The saved model can then be loaded later as follows:
loaded_streamling_model_svm <- readRDS("./models/saved_streamling_caret_model_svm_radial.rds")
print(loaded_streamling_model_svm)
```

```         
## Support Vector Machines with Radial Basis Function Kernel 
## 
## 1103 samples
##   30 predictor
##    2 classes: 'No', 'Yes' 
## 
## No pre-processing
## Resampling: Cross-Validated (5 fold) 
## Summary of sample sizes: 882, 882, 883, 882, 883 
## Resampling results across tuning parameters:
## 
##   C     Accuracy   Kappa     
##   0.25  0.8386261  0.00000000
##   0.50  0.8404401  0.01855692
##   1.00  0.8604072  0.23391160
## 
## Tuning parameter 'sigma' was held constant at a value of 0.01332559
## Accuracy was used to select the optimal model using the largest value.
## The final values used for the model were sigma = 0.01332559 and C = 1.
```

``` r
predictions_with_loaded_model <-
  predict(loaded_streamling_model_svm, newdata = test_streamling_processes_test)
confusionMatrix(predictions_with_loaded_model, test_streamling_processes_test$Attrition)
```

```         
## Confusion Matrix and Statistics
## 
##           Reference
## Prediction  No Yes
##        No  306  45
##        Yes   2  14
##                                           
##                Accuracy : 0.8719          
##                  95% CI : (0.8334, 0.9044)
##     No Information Rate : 0.8392          
##     P-Value [Acc > NIR] : 0.04801         
##                                           
##                   Kappa : 0.3272          
##                                           
##  Mcnemar's Test P-Value : 8.993e-10       
##                                           
##             Sensitivity : 0.9935          
##             Specificity : 0.2373          
##          Pos Pred Value : 0.8718          
##          Neg Pred Value : 0.8750          
##              Prevalence : 0.8392          
##          Detection Rate : 0.8338          
##    Detection Prevalence : 0.9564          
##       Balanced Accuracy : 0.6154          
##                                           
##        'Positive' Class : No              
## 
```

#### Making prediction with the model {#making-prediction-with-the-model}

``` r
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
```

```         
## [1] No
## Levels: No Yes
```

#### Make predictions using the model through a function {#make-predictions-using-the-model-through-a-function}

``` r
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
```

```         
## [1] No
## Levels: No Yes
```

# Plumber API {#plumber-api}

Plumber API in R facilitates the creation of web APIs, enabling seamless integration of R code for data processing and analysis. It transforms R scripts into interactive and accessible web services, enhancing collaboration and data-driven decision-making.

`NB` because we we wanted to execute the plumber API in our md we had run the Plumber API in a separate R process, allowing our R Markdown document to continue executing by using the future package.The on.exit() block is used to stop the Plumber API after all the code chunks have been executed

``` r
if (!requireNamespace("future", quietly = TRUE)) install.packages("future")

library(future)
```

```         
## 
## Attaching package: 'future'

## The following object is masked from 'package:caret':
## 
##     cluster

## The following object is masked from 'package:languageserver':
## 
##     run
```

``` r
# Define a function to start the Plumber API in a separate process
start_api <- function() {
  api <- plumber::plumb("PlumberAPI.R")
  api$run(host = "127.0.0.1", port = 5022, swagger = TRUE)
}

# Start the API in a separate process
future::plan("multisession")  # Use multisession backend for parallel processing
future({
  start_api()
})
```

```         
## MultisessionFuture:
## Label: '<none>'
## Expression:
## {
##     start_api()
## }
## Lazy evaluation: FALSE
## Asynchronous evaluation: TRUE
## Local evaluation: TRUE
## Environment: R_GlobalEnv
## Capture standard output: TRUE
## Capture condition classes: 'condition' (excluding 'nothing')
## Globals: 1 objects totaling 6.65 KiB (function 'start_api' of 6.65 KiB)
## Packages: <none>
## L'Ecuyer-CMRG RNG seed: <none> (seed = FALSE)
## Resolved: FALSE
## Value: <not collected>
## Conditions captured: <none>
## Early signaling: FALSE
## Owner process: 1f35b32c-3fd8-aa67-1a03-364646a4c6ac
## Class: 'MultisessionFuture', 'ClusterFuture', 'MultiprocessFuture', 'Future', 'environment'
```

``` r
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
```

```         
## [1] "http://127.0.0.1:5022/Attrition?arg_Age=41&arg_BusinessTravel=Travel_Rarely&arg_DailyRate=1102&arg_Department=Sales&arg_DistanceFromHome=1&arg_Education=2&arg_EducationField=Life%20Sciences&arg_EnvironmentSatisfaction=2&arg_Gender=Female&arg_HourlyRate=94&arg_JobInvolvement=3&arg_JobLevel=2&arg_JobRole=Sales%20Executive&arg_JobSatisfaction=4&arg_MaritalStatus=Single&arg_MonthlyIncome=5993&arg_MonthlyRate=19479&arg_NumCompaniesWorked=8&arg_OverTime=Yes&arg_PercentSalaryHike=11&arg_PerformanceRating=3&arg_RelationshipSatisfaction=1&arg_StockOptionLevel=0&arg_TotalWorkingYears=8&arg_TrainingTimesLastYear=0&arg_WorkLifeBalance=1&arg_YearsAtCompany=6&arg_YearsInCurrentRole=4&arg_YearsSinceLastPromotion=0&arg_YearsWithCurrManager=5"
```

``` r
Sys.sleep(10)  
model_prediction <- GET(query_url)
content(model_prediction)
```

```         
## [[1]]
## [1] "No"
```

``` r
content(model_prediction)[[1]]
```

```         
## [1] "No"
```

``` r
# Parse the response into the right format 
model_prediction_raw <- content(model_prediction, as = "text",
                                encoding = "utf-8")
jsonlite::fromJSON(model_prediction_raw)
```

```         
## [1] "No"
```

``` r
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
```

```         
## [1] "No"
```

# Prediction Web Form And Customer-facing Dashboard {#prediction-web-form-and-customer-facing-dashboard}

The customer facing dashboard is on real-time bases where it visualizes the customer data verses other customer data to show the goal to be attained or to guide for future decisions making.`NB` since the file is to large can be opened when downloaded `.html` and viewed via the Browser

``` r
cat('<iframe src="http://localhost/Good%20Architecture/Attrition%20Prediction.php" width="1000" height="800"></iframe>')
```

<iframe src="http://localhost/Good%20Architecture/Attrition%20Prediction.php" width="1000" height="800">

</iframe>
