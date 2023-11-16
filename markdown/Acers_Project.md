---
editor_options: 
  markdown: 
    wrap: 72
---

# Business Intelligence Lab Submission Markdown

Acers Team 16th November 2023

-   [Student Details](#student-details)
-   [Setup Chunk](#setup-chunk)
-   [Understanding the Dataset (Exploratory Data Analysis
    (EDA))](#understanding-the-dataset-exploratory-data-analysis-eda)
    -   [Downloading the Dataset](#downloading-the-dataset)
        -   [Source:](#source)
        -   [Reference:](#reference)
-   [Install and load all the
    packages](#install-and-load-all-the-packages)
-   [Loading the Dataset](#loading-the-dataset)
-   [Exploratory Data Analysis](#exploratory-data-analysis)
    -   [STEP 1: Descriptive Statistics](#step-1-descriptive-statistics)
        -   [Measures of Frequency](#measures-of-frequency)
    -   [Measures of Central Tendency](#measures-of-central-tendency)
        -   [Mode](#mode)
    -   [Measures of
        Distribution/Dispersion/Spread/Scatter/Variability](#measures-of-distributiondispersionspreadscattervariability)
    -   [Measures of Relationship](#measures-of-relationship)
        -   [Measure the correlation between
            variables](#measure-the-correlation-between-variables)
        -   [Measure the covariance between
            variables](#measure-the-covariance-between-variables)
-   [STEP 4. Inferential Statistics](#step-4-inferential-statistics)
-   [Basic Visualization](#basic-visualization)
    -   [Univariate Plots](#univariate-plots)
-   [Identify numeric columns](#identify-numeric-columns)
-   [Extract only numeric columns](#extract-only-numeric-columns)
-   [Set up the layout for multiple
    histograms](#set-up-the-layout-for-multiple-histograms)
-   [Plot histograms for numeric
    columns](#plot-histograms-for-numeric-columns)

------------------------------------------------------------------------

# Student Details {#student-details}

+---------------------+--------------------------------------------+
| **Student ID        | *\<list one student name, group, and ID    |
| Numbers and Names   | per line; you should be between 2 and 5    |
| of Group Members**  | members per group\>*                       |
|                     |                                            |
|                     | 1.  122790 - C - Bwalley Nicholas          |
|                     |                                            |
|                     | 2.  133834 - C - Mongare Sarah             |
|                     |                                            |
|                     | 3.  133928 - C - Cheptoi Millicent         |
|                     |                                            |
|                     | 4.  134879 - C - Tulienge Lesley           |
|                     |                                            |
|                     | 5.  124461 - C - Kinya Angela              |
+---------------------+--------------------------------------------+
| **GitHub Classroom  | Acers Team                                 |
| Group Name**        |                                            |
+---------------------+--------------------------------------------+
| **Course Code**     | BBT4206                                    |
+---------------------+--------------------------------------------+
| **Course Name**     | Business Intelligence II                   |
+---------------------+--------------------------------------------+
| **Program**         | Bachelor of Business Information           |
|                     | Technology                                 |
+---------------------+--------------------------------------------+
| **Semester          | 21^st^ August 2023 to 28^th^ November 2023 |
| Duration**          |                                            |
+---------------------+--------------------------------------------+

# Setup Chunk {#setup-chunk}

**Note:** the following KnitR options have been set as the global
defaults: <BR>
`knitr::opts_chunk$set(echo = TRUE, warning = FALSE, eval = TRUE, collapse = FALSE, tidy = TRUE)`.

More KnitR options are documented here
<https://bookdown.org/yihui/rmarkdown-cookbook/chunk-options.html> and
here <https://yihui.org/knitr/options/>.

# Understanding the Dataset (Exploratory Data Analysis (EDA)) {#understanding-the-dataset-exploratory-data-analysis-eda}

## Downloading the Dataset {#downloading-the-dataset}

### Source: {#source}

The dataset that was used can be downloaded here:
*\<<https://drive.google.com/drive/folders/1-BGEhfOwquXF6KKXwcvrx7WuZXuqmW9q?usp=sharing>\>*

### Reference: {#reference}

*\<Cite the dataset here using APA\>\
Refer to the APA 7th edition manual for rules on how to cite datasets:
<https://apastyle.apa.org/style-grammar-guidelines/references/examples/data-set-references>*

# Install and load all the packages {#install-and-load-all-the-packages}

We installed all the packages that will enable us execute this lab.

``` r
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

# Loading the Dataset {#loading-the-dataset}

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

We created a subset of the variables to be included in the new dataset.
We 14 features and 80 random observations to be included in the dataset.

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

## STEP 1: Descriptive Statistics {#step-1-descriptive-statistics}

### Measures of Frequency {#measures-of-frequency}

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

## Measures of Central Tendency {#measures-of-central-tendency}

### Mode {#mode}

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

## Measures of Distribution/Dispersion/Spread/Scatter/Variability {#measures-of-distributiondispersionspreadscattervariability}

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
##  EmployeeCount EmployeeNumber   EnvironmentSatisfaction    Gender         
##  Min.   :1     Min.   :   1.0   Min.   :1.000           Length:1470       
##  1st Qu.:1     1st Qu.: 491.2   1st Qu.:2.000           Class :character  
##  Median :1     Median :1020.5   Median :3.000           Mode  :character  
##  Mean   :1     Mean   :1024.9   Mean   :2.722                             
##  3rd Qu.:1     3rd Qu.:1555.8   3rd Qu.:4.000                             
##  Max.   :1     Max.   :2068.0   Max.   :4.000                             
##    HourlyRate     JobInvolvement    JobLevel       JobRole         
##  Min.   : 30.00   Min.   :1.00   Min.   :1.000   Length:1470       
##  1st Qu.: 48.00   1st Qu.:2.00   1st Qu.:1.000   Class :character  
##  Median : 66.00   Median :3.00   Median :2.000   Mode  :character  
##  Mean   : 65.89   Mean   :2.73   Mean   :2.064                     
##  3rd Qu.: 83.75   3rd Qu.:3.00   3rd Qu.:3.000                     
##  Max.   :100.00   Max.   :4.00   Max.   :5.000                     
##  JobSatisfaction MaritalStatus      MonthlyIncome    MonthlyRate   
##  Min.   :1.000   Length:1470        Min.   : 1009   Min.   : 2094  
##  1st Qu.:2.000   Class :character   1st Qu.: 2911   1st Qu.: 8047  
##  Median :3.000   Mode  :character   Median : 4919   Median :14236  
##  Mean   :2.729                      Mean   : 6503   Mean   :14313  
##  3rd Qu.:4.000                      3rd Qu.: 8379   3rd Qu.:20462  
##  Max.   :4.000                      Max.   :19999   Max.   :26999  
##  NumCompaniesWorked    Over18            OverTime         PercentSalaryHike
##  Min.   :0.000      Length:1470        Length:1470        Min.   :11.00    
##  1st Qu.:1.000      Class :character   Class :character   1st Qu.:12.00    
##  Median :2.000      Mode  :character   Mode  :character   Median :14.00    
##  Mean   :2.693                                            Mean   :15.21    
##  3rd Qu.:4.000                                            3rd Qu.:18.00    
##  Max.   :9.000                                            Max.   :25.00    
##  PerformanceRating RelationshipSatisfaction StandardHours StockOptionLevel
##  Min.   :3.000     Min.   :1.000            Min.   :80    Min.   :0.0000  
##  1st Qu.:3.000     1st Qu.:2.000            1st Qu.:80    1st Qu.:0.0000  
##  Median :3.000     Median :3.000            Median :80    Median :1.0000  
##  Mean   :3.154     Mean   :2.712            Mean   :80    Mean   :0.7939  
##  3rd Qu.:3.000     3rd Qu.:4.000            3rd Qu.:80    3rd Qu.:1.0000  
##  Max.   :4.000     Max.   :4.000            Max.   :80    Max.   :3.0000  
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

sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 10, 11, 13,14, 15 , 17 , 19, 20 , 21,  25, 26, 27 , 28 ,29, 30, 31 , 32 , 33 , 34 ,35  )], sd)
```

```         
##                      Age                DailyRate         DistanceFromHome 
##                9.1353735              403.5090999                8.1068644 
##                Education            EmployeeCount           EmployeeNumber 
##                1.0241649                0.0000000              602.0243348 
##  EnvironmentSatisfaction               HourlyRate           JobInvolvement 
##                1.0930822               20.3294276                0.7115611 
##                 JobLevel          JobSatisfaction            MonthlyIncome 
##                1.1069399                1.1028461             4707.9567831 
##              MonthlyRate       NumCompaniesWorked        PerformanceRating 
##             7117.7860441                2.4980090                0.3608235 
## RelationshipSatisfaction            StandardHours         StockOptionLevel 
##                1.0812089                0.0000000                0.8520767 
##        TotalWorkingYears    TrainingTimesLastYear          WorkLifeBalance 
##                7.7807817                1.2892706                0.7064758 
##           YearsAtCompany       YearsInCurrentRole  YearsSinceLastPromotion 
##                6.1265252                3.6231370                3.2224303 
##     YearsWithCurrManager 
##                3.5681361
```

``` r
#### Measure the variance of each variable ----
  
sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 10, 11, 13,14, 15 , 17 , 19, 20 , 21,  25, 26, 27 , 28 ,29, 30, 31 , 32 , 33 , 34 ,35  )], var)
```

```         
##                      Age                DailyRate         DistanceFromHome 
##             8.345505e+01             1.628196e+05             6.572125e+01 
##                Education            EmployeeCount           EmployeeNumber 
##             1.048914e+00             0.000000e+00             3.624333e+05 
##  EnvironmentSatisfaction               HourlyRate           JobInvolvement 
##             1.194829e+00             4.132856e+02             5.063193e-01 
##                 JobLevel          JobSatisfaction            MonthlyIncome 
##             1.225316e+00             1.216270e+00             2.216486e+07 
##              MonthlyRate       NumCompaniesWorked        PerformanceRating 
##             5.066288e+07             6.240049e+00             1.301936e-01 
## RelationshipSatisfaction            StandardHours         StockOptionLevel 
##             1.169013e+00             0.000000e+00             7.260346e-01 
##        TotalWorkingYears    TrainingTimesLastYear          WorkLifeBalance 
##             6.054056e+01             1.662219e+00             4.991081e-01 
##           YearsAtCompany       YearsInCurrentRole  YearsSinceLastPromotion 
##             3.753431e+01             1.312712e+01             1.038406e+01 
##     YearsWithCurrManager 
##             1.273160e+01
```

``` r
#### Measure the kurtosis of each variable ---- 

sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[,c(1,4, 6, 7, 9, 10, 11, 13,14, 15 , 17 , 19, 20 , 21,  25, 26, 27 , 28 ,29, 30, 31 , 32 , 33 , 34 ,35  )], kurtosis, type = 2)
```

```         
##                      Age                DailyRate         DistanceFromHome 
##              -0.40414514              -1.20382281              -0.22483340 
##                Education            EmployeeCount           EmployeeNumber 
##              -0.55911497                      NaN              -1.22317891 
##  EnvironmentSatisfaction               HourlyRate           JobInvolvement 
##              -1.20252052              -1.19639846               0.27099877 
##                 JobLevel          JobSatisfaction            MonthlyIncome 
##               0.39915206              -1.22219257               1.00523269 
##              MonthlyRate       NumCompaniesWorked        PerformanceRating 
##              -1.21495610               0.01021382               1.69593867 
## RelationshipSatisfaction            StandardHours         StockOptionLevel 
##              -1.18481398                      NaN               0.36463433 
##        TotalWorkingYears    TrainingTimesLastYear          WorkLifeBalance 
##               0.91826954               0.49499299               0.41946050 
##           YearsAtCompany       YearsInCurrentRole  YearsSinceLastPromotion 
##               3.93550876               0.47742077               3.61267311 
##     YearsWithCurrManager 
##               0.17105808
```

``` r
#### Measure the skewness of each variable ----

sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 10, 11, 13,14, 15 , 17 , 19, 20 , 21,  25, 26, 27 , 28 ,29, 30, 31 , 32 , 33 , 34 ,35  )],  skewness, type = 2)
```

```         
##                      Age                DailyRate         DistanceFromHome 
##              0.413286302             -0.003518568              0.958117996 
##                Education            EmployeeCount           EmployeeNumber 
##             -0.289681082                      NaN              0.016574020 
##  EnvironmentSatisfaction               HourlyRate           JobInvolvement 
##             -0.321654448             -0.032310953             -0.498419364 
##                 JobLevel          JobSatisfaction            MonthlyIncome 
##              1.025401283             -0.329671959              1.369816681 
##              MonthlyRate       NumCompaniesWorked        PerformanceRating 
##              0.018577808              1.026471112              1.921882702 
## RelationshipSatisfaction            StandardHours         StockOptionLevel 
##             -0.302827565                      NaN              0.968980317 
##        TotalWorkingYears    TrainingTimesLastYear          WorkLifeBalance 
##              1.117171853              0.553124171             -0.552480299 
##           YearsAtCompany       YearsInCurrentRole  YearsSinceLastPromotion 
##              1.764529454              0.917363156              1.984289983 
##     YearsWithCurrManager 
##              0.833450992
```

## Measures of Relationship {#measures-of-relationship}

### Measure the correlation between variables {#measure-the-correlation-between-variables}

``` r
streamlining_processes_cov <- cov(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 10, 11, 13,14, 15 , 17 , 19, 20 , 21,  25, 26, 27 , 28 ,29, 30, 31 , 32 , 33 , 34 ,35  )])
View(streamlining_processes_cov)
```

### Measure the covariance between variables {#measure-the-covariance-between-variables}

``` r
streamlining_processes_cor <- cor(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 10, 11, 13,14, 15 , 17 , 19, 20 , 21,  25, 26, 27 , 28 ,29, 30, 31 , 32 , 33 , 34 ,35  )])
View(streamlining_processes_cor)
```

# STEP 4. Inferential Statistics

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

# Basic Visualization {#basic-visualization}

## Univariate Plots {#univariate-plots}

\`\`\`{r Your tenth Code Chunk, message=FALSE, warning=FALSE}# \###
Create Histograms for Each Numeric Attribute
str(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)

# Identify numeric columns {#identify-numeric-columns}

numeric_columns \<- sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM,
is.numeric)

# Extract only numeric columns {#extract-only-numeric-columns}

STREAMLINING_PROCESSES_AT_KINYANJUI_FARM \<-
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$$, numeric_columns$$

STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\<-
sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, as.numeric)

# Set up the layout for multiple histograms {#set-up-the-layout-for-multiple-histograms}

par(mfrow = c(1, sum(numeric_columns)))

# Plot histograms for numeric columns {#plot-histograms-for-numeric-columns}

for (i in 1:ncol(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)) {
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$$, i$$, main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)$$i$$) }

hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$$, 1$$, main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)$$1$$)
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$$, 4$$, main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)$$4$$)
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$$, 6$$, main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)$$6$$)
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$$, 7$$, main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)$$7$$)
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$$, 9$$, main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)$$9$$)
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$$, 10$$, main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)$$10$$)
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$$, 11$$, main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)$$11$$)
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$$, 13$$, main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)$$13$$)
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$$, 14$$, main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)$$14$$)
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$$, 15$$, main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)$$15$$)
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$$, 17$$, main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)$$17$$)
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$$, 19$$, main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)$$19$$)
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$$, 20$$, main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)$$20$$)
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$$, 21$$, main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)$$21$$)
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$$, 25$$, main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)$$25$$)
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$$, 26$$, main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)$$26$$)

``` #

### Create Box and Whisker Plots for Each Numeric Attribute 

# Set up the layout for multiple histograms

```r
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

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 25], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[25])
```

![](Acers_Project_files/figure-gfm/Your%20eleventh%20Code%20Chunk-15.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 26], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[26])
```

![](Acers_Project_files/figure-gfm/Your%20eleventh%20Code%20Chunk-16.png)<!-- -->
\### Create Bar Plots for Each Categorical Attribute Gender

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
barplot(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 2]), main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[2])
```

![](Acers_Project_files/figure-gfm/Your%20twelveth%20Code%20Chunk-1.png)<!-- -->
\### Create a Missingness Map to Identify Missing Data

``` r
missmap(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, col = c("red", "grey"), legend = TRUE)
```

![](Acers_Project_files/figure-gfm/Your%20thirtenth%20Code%20Chunk-1.png)<!-- -->

``` r
## Multivariate Plots 

### Create a Correlation Plot 

corrplot(cor(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 10, 11, 13,14, 15 , 17 , 19, 20 , 21,  25, 26, 27 , 28 ,29, 30, 31 , 32 , 33 , 34 ,35  )]), method = "circle")

ggcorrplot(cor(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 10, 11, 13,14, 15 , 17 , 19, 20 , 21,  25, 26, 27 , 28 ,29, 30, 31 , 32 , 33 , 34 ,35  )]))

### Create a Scatter Plot 

# Select only numeric columns
#numeric_columns <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, is.numeric)]

# Create scatterplot matrix
#pairs(numeric_columns, col = STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$Attrition)
```

![](Acers_Project_files/figure-gfm/Your%20thirtenth%20Code%20Chunk-2.png)<!-- -->
\### Create Multivariate Box and Whisker Plots by Class

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
featurePlot(x = STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 1:8], y = STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 9],
            plot = "box")
```

```         
## NULL
```
