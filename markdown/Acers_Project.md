Business Intelligence Lab Submission Markdown
================
Acers Team
16th November 2023

- [Student Details](#student-details)
- [Setup Chunk](#setup-chunk)
- [Understanding the Dataset (Exploratory Data Analysis
  (EDA))](#understanding-the-dataset-exploratory-data-analysis-eda)
  - [Downloading the Dataset](#downloading-the-dataset)
    - [Source:](#source)
    - [Reference:](#reference)
- [Install and load all the
  packages](#install-and-load-all-the-packages)
- [Loading the Dataset](#loading-the-dataset)
- [Exploratory Data Analysis](#exploratory-data-analysis)
  - [STEP 1: Descriptive Statistics](#step-1-descriptive-statistics)
    - [Measures of Frequency](#measures-of-frequency)
  - [Measures of Central Tendency](#measures-of-central-tendency)
    - [Mode](#mode)
  - [Measures of
    Distribution/Dispersion/Spread/Scatter/Variability](#measures-of-distributiondispersionspreadscattervariability)
  - [Measures of Relationship](#measures-of-relationship)
    - [Measure the correlation between
      variables](#measure-the-correlation-between-variables)
    - [Measure the covariance between
      variables](#measure-the-covariance-between-variables)
- [STEP 4. Inferential Statistics](#step-4-inferential-statistics)
- [Basic Visualization](#basic-visualization)
  - [Univariate Plots](#univariate-plots)
- [Identify numeric columns](#identify-numeric-columns)
- [Extract only numeric columns](#extract-only-numeric-columns)
- [Set up the layout for multiple
  histograms](#set-up-the-layout-for-multiple-histograms)
- [Plot histograms for numeric
  columns](#plot-histograms-for-numeric-columns)
- [Preprocessing and Data
  Transformation](#preprocessing-and-data-transformation)
- [Create a heatmap of “missingness” broken down by
  “Age”](#create-a-heatmap-of-missingness-broken-down-by-age)
- [Data Transformation](#data-transformation)
- [Scale Data Transform](#scale-data-transform)
- [BEFORE](#before)
- [Extract only numeric columns](#extract-only-numeric-columns-1)
- [Set up the layout for multiple
  histograms](#set-up-the-layout-for-multiple-histograms-1)
- [Plot histograms for numeric
  columns](#plot-histograms-for-numeric-columns-1)
- [Standardize Data Transform to have a std of
  1](#standardize-data-transform-to-have-a-std-of-1)
  - [The Standardize Basic Transform on the Boston Housing
    Dataset](#the-standardize-basic-transform-on-the-boston-housing-dataset)
- [Training Model —-](#training-model--)

------------------------------------------------------------------------

# Student Details

<table style="width:96%;">
<colgroup>
<col style="width: 31%" />
<col style="width: 63%" />
</colgroup>
<tbody>
<tr class="odd">
<td><strong>Student ID Numbers and Names of Group Members</strong></td>
<td><p><em>&lt;list one student name, group, and ID per line; you should
be between 2 and 5 members per group&gt;</em></p>
<ol type="1">
<li><p>122790 - C - Bwalley Nicholas</p></li>
<li><p>133834 - C - Mongare Sarah</p></li>
<li><p>133928 - C - Cheptoi Millicent</p></li>
<li><p>134879 - C - Tulienge Lesley</p></li>
<li><p>124461 - C - Kinya Angela</p></li>
</ol></td>
</tr>
<tr class="even">
<td><strong>GitHub Classroom Group Name</strong></td>
<td>Acers Team</td>
</tr>
<tr class="odd">
<td><strong>Course Code</strong></td>
<td>BBT4206</td>
</tr>
<tr class="even">
<td><strong>Course Name</strong></td>
<td>Business Intelligence II</td>
</tr>
<tr class="odd">
<td><strong>Program</strong></td>
<td>Bachelor of Business Information Technology</td>
</tr>
<tr class="even">
<td><strong>Semester Duration</strong></td>
<td>21<sup>st</sup> August 2023 to 28<sup>th</sup> November 2023</td>
</tr>
</tbody>
</table>

# Setup Chunk

**Note:** the following KnitR options have been set as the global
defaults: <BR>
`knitr::opts_chunk$set(echo = TRUE, warning = FALSE, eval = TRUE, collapse = FALSE, tidy = TRUE)`.

More KnitR options are documented here
<https://bookdown.org/yihui/rmarkdown-cookbook/chunk-options.html> and
here <https://yihui.org/knitr/options/>.

# Understanding the Dataset (Exploratory Data Analysis (EDA))

## Downloading the Dataset

### Source:

The dataset that was used can be downloaded here:
*\<<https://drive.google.com/drive/folders/1-BGEhfOwquXF6KKXwcvrx7WuZXuqmW9q?usp=sharing>\>*

### Reference:

*\<Cite the dataset here using APA\>  
Refer to the APA 7th edition manual for rules on how to cite datasets:
<https://apastyle.apa.org/style-grammar-guidelines/references/examples/data-set-references>*

# Install and load all the packages

We installed all the packages that will enable us execute this lab.

``` r
if (!is.element("languageserver", installed.packages()[, 1])) {
  install.packages("languageserver", dependencies = TRUE)
}
require("languageserver")
```

    ## Loading required package: languageserver

``` r
if (!is.element("e1071", installed.packages()[, 1])) {
  install.packages("e1071", dependencies = TRUE)
}
require("e1071")
```

    ## Loading required package: e1071

``` r
if (!is.element("Amelia", installed.packages()[, 1])) {
  install.packages("Amelia", dependencies = TRUE)
}
require("Amelia")
```

    ## Loading required package: Amelia

    ## Loading required package: Rcpp

    ## ## 
    ## ## Amelia II: Multiple Imputation
    ## ## (Version 1.8.1, built: 2022-11-18)
    ## ## Copyright (C) 2005-2023 James Honaker, Gary King and Matthew Blackwell
    ## ## Refer to http://gking.harvard.edu/amelia/ for more information
    ## ##

``` r
if (!is.element("corrplot", installed.packages()[, 1])) {
  install.packages("corrplot", dependencies = TRUE)
}
require("corrplot")
```

    ## Loading required package: corrplot

    ## corrplot 0.92 loaded

``` r
if (!is.element("ggcorrplot", installed.packages()[, 1])) {
  install.packages("ggcorrplot", dependencies = TRUE)
}
require("ggcorrplot")
```

    ## Loading required package: ggcorrplot

    ## Loading required package: ggplot2

``` r
if (!is.element("readr", installed.packages()[, 1])) {
  install.packages("readr", dependencies = TRUE)
}
require("readr")
```

    ## Loading required package: readr

``` r
if (!is.element("caret", installed.packages()[, 1])) {
  install.packages("caret", dependencies = TRUE)
}
require("caret")
```

    ## Loading required package: caret

    ## Loading required package: lattice

``` r
if (!is.element("naniar", installed.packages()[, 1])) {
  install.packages("naniar", dependencies = TRUE)
}
require("naniar")
```

    ## Loading required package: naniar

``` r
if (!is.element("dplyr", installed.packages()[, 1])) {
  install.packages("dplyr", dependencies = TRUE)
}
require("dplyr")
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

    ## Loading required package: mice

    ## 
    ## Attaching package: 'mice'

    ## The following object is masked from 'package:stats':
    ## 
    ##     filter

    ## The following objects are masked from 'package:base':
    ## 
    ##     cbind, rbind

# Loading the Dataset

``` r
library(readr)
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- read_csv("data/STREAMLINING PROCESSES AT KINYANJUI FARM.csv")
```

    ## Rows: 1470 Columns: 35
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr  (9): Attrition, BusinessTravel, Department, EducationField, Gender, Job...
    ## dbl (26): Age, DailyRate, DistanceFromHome, Education, EmployeeCount, Employ...
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
View(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)
```

# Exploratory Data Analysis

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

    ## [1] 1470   35

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

## STEP 1: Descriptive Statistics

### Measures of Frequency

``` r
#### Identify the number of instances that belong to Gender ----
# It is more sensible to count categorical variables (factors or dimensions)
# than numeric variables, e.g., counting the number of male and female

streamlining_processes_freq <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$Gender
cbind(frequency = table(streamlining_processes_freq),
      percentage = prop.table(table(streamlining_processes_freq)) * 100)
```

    ##        frequency percentage
    ## Female       588         40
    ## Male         882         60

``` r
streamlining_processes_freq <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$JobRole
cbind(frequency = table(streamlining_processes_freq),
      percentage = prop.table(table(streamlining_processes_freq)) * 100)
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

``` r
streamlining_processes_freq <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$BusinessTravel
cbind(frequency = table(streamlining_processes_freq),
      percentage = prop.table(table(streamlining_processes_freq)) * 100)
```

    ##                   frequency percentage
    ## Non-Travel              150   10.20408
    ## Travel_Frequently       277   18.84354
    ## Travel_Rarely          1043   70.95238

## Measures of Central Tendency

### Mode

``` r
streamlining_processes_gender_mode <- names(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$Gender))[
  which(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$Gender) == max(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$Gender)))
]
print(streamlining_processes_gender_mode)
```

    ## [1] "Male"

``` r
streamlining_processes_jobRole_mode <- names(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$JobRole))[
  which(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$JobRole) == max(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$JobRole)))
]
print(streamlining_processes_jobRole_mode)
```

    ## [1] "Sales Executive"

``` r
streamlining_processes_businessRole_mode <- names(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$BusinessTravel))[
  which(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$BusinessTravel) == max(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$BusinessTravel)))
]
print(streamlining_processes_businessRole_mode)
```

    ## [1] "Travel_Rarely"

## Measures of Distribution/Dispersion/Spread/Scatter/Variability

``` r
summary(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)
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

``` r
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- na.omit(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)

#### Measure the standard deviation ----

sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 10, 11, 13,14, 15 , 17 , 19, 20 , 21,  25, 26, 27 , 28 ,29, 30, 31 , 32 , 33 , 34 ,35  )], sd)
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

``` r
#### Measure the variance of each variable ----
  
sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 10, 11, 13,14, 15 , 17 , 19, 20 , 21,  25, 26, 27 , 28 ,29, 30, 31 , 32 , 33 , 34 ,35  )], var)
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

``` r
#### Measure the kurtosis of each variable ---- 

sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[,c(1,4, 6, 7, 9, 10, 11, 13,14, 15 , 17 , 19, 20 , 21,  25, 26, 27 , 28 ,29, 30, 31 , 32 , 33 , 34 ,35  )], kurtosis, type = 2)
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

``` r
#### Measure the skewness of each variable ----

sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 10, 11, 13,14, 15 , 17 , 19, 20 , 21,  25, 26, 27 , 28 ,29, 30, 31 , 32 , 33 , 34 ,35  )],  skewness, type = 2)
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

## Measures of Relationship

### Measure the correlation between variables

``` r
streamlining_processes_cov <- cov(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(1,4, 6, 7, 9, 10, 11, 13,14, 15 , 17 , 19, 20 , 21,  25, 26, 27 , 28 ,29, 30, 31 , 32 , 33 , 34 ,35  )])
View(streamlining_processes_cov)
```

### Measure the covariance between variables

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

    ##               Df Sum Sq Mean Sq F value   Pr(>F)    
    ## Attrition      1   3107  3107.3   38.18 8.36e-10 ***
    ## Residuals   1468 119488    81.4                     
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
streamlining_processes_two_way_anova <- aov(Age  ~ Attrition + Gender, data = STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)
summary(streamlining_processes_two_way_anova)
```

    ##               Df Sum Sq Mean Sq F value  Pr(>F)    
    ## Attrition      1   3107  3107.3  38.189 8.3e-10 ***
    ## Gender         1    123   122.7   1.508    0.22    
    ## Residuals   1467 119365    81.4                    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

# Basic Visualization

## Univariate Plots

\`\`\`{r Your ten Code Chunk}# \### Create Histograms for Each Numeric
Attribute str(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)

# Identify numeric columns

numeric_columns \<- sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM,
is.numeric)

# Extract only numeric columns

STREAMLINING_PROCESSES_AT_KINYANJUI_FARM \<-
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, numeric_columns\]

STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\<-
sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, as.numeric)

# Set up the layout for multiple histograms

par(mfrow = c(1, sum(numeric_columns)))

# Plot histograms for numeric columns

for (i in 1:ncol(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)) {
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, i\], main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)\[i\]) }

hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, 1\], main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)\[1\])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, 4\], main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)\[4\])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, 6\], main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)\[6\])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, 7\], main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)\[7\])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, 9\], main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)\[9\])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, 10\], main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)\[10\])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, 11\], main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)\[11\])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, 13\], main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)\[13\])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, 14\], main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)\[14\])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, 15\], main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)\[15\])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, 17\], main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)\[17\])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, 19\], main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)\[19\])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, 20\], main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)\[20\])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, 21\], main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)\[21\])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, 25\], main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)\[25\])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, 26\], main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)\[26\])


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

![](Acers_Project_files/figure-gfm/Your%20eleven%20Code%20Chunk-1.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 4], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[4])
```

![](Acers_Project_files/figure-gfm/Your%20eleven%20Code%20Chunk-2.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 6], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[6])
```

![](Acers_Project_files/figure-gfm/Your%20eleven%20Code%20Chunk-3.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 7], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[7])
```

![](Acers_Project_files/figure-gfm/Your%20eleven%20Code%20Chunk-4.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 9], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[9])
```

![](Acers_Project_files/figure-gfm/Your%20eleven%20Code%20Chunk-5.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 10], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[10])
```

![](Acers_Project_files/figure-gfm/Your%20eleven%20Code%20Chunk-6.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 11], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[11])
```

![](Acers_Project_files/figure-gfm/Your%20eleven%20Code%20Chunk-7.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 13], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[13])
```

![](Acers_Project_files/figure-gfm/Your%20eleven%20Code%20Chunk-8.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 14], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[14])
```

![](Acers_Project_files/figure-gfm/Your%20eleven%20Code%20Chunk-9.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 15], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[15])
```

![](Acers_Project_files/figure-gfm/Your%20eleven%20Code%20Chunk-10.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 17], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[17])
```

![](Acers_Project_files/figure-gfm/Your%20eleven%20Code%20Chunk-11.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 19], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[19])
```

![](Acers_Project_files/figure-gfm/Your%20eleven%20Code%20Chunk-12.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 20], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[20])
```

![](Acers_Project_files/figure-gfm/Your%20eleven%20Code%20Chunk-13.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 21], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[21])
```

![](Acers_Project_files/figure-gfm/Your%20eleven%20Code%20Chunk-14.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 25], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[25])
```

![](Acers_Project_files/figure-gfm/Your%20eleven%20Code%20Chunk-15.png)<!-- -->

``` r
boxplot(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 26], main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[26])
```

![](Acers_Project_files/figure-gfm/Your%20eleven%20Code%20Chunk-16.png)<!-- -->
\### Create Bar Plots for Each Categorical Attribute Gender

``` r
library(readr)
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- read_csv("data/STREAMLINING PROCESSES AT KINYANJUI FARM.csv")
```

    ## Rows: 1470 Columns: 35
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr  (9): Attrition, BusinessTravel, Department, EducationField, Gender, Job...
    ## dbl (26): Age, DailyRate, DistanceFromHome, Education, EmployeeCount, Employ...
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
barplot(table(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 2]), main = names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)[2])
```

![](Acers_Project_files/figure-gfm/Your%20twelveth%20Code%20Chunk-1.png)<!-- -->
\### Create a Missingness Map to Identify Missing Data

``` r
missmap(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, col = c("red", "grey"), legend = TRUE)
```

![](Acers_Project_files/figure-gfm/Your%20thirteen%20Code%20Chunk-1.png)<!-- -->

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

![](Acers_Project_files/figure-gfm/Your%20thirteen%20Code%20Chunk-2.png)<!-- -->
\### Create Multivariate Box and Whisker Plots by Class

``` r
library(readr)
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- read_csv("data/STREAMLINING PROCESSES AT KINYANJUI FARM.csv")
```

    ## Rows: 1470 Columns: 35
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr  (9): Attrition, BusinessTravel, Department, EducationField, Gender, Job...
    ## dbl (26): Age, DailyRate, DistanceFromHome, Education, EmployeeCount, Employ...
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
featurePlot(x = STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 1:8], y = STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, 9],
            plot = "box")
```

    ## NULL

# Preprocessing and Data Transformation

``` r
## Confirm the "missingness" in the Initial Dataset
# Are there missing values in the dataset?
any_na(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)
```

    ## [1] FALSE

``` r
# How many?
n_miss(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)
```

    ## [1] 0

``` r
# What is the percentage of missing data in the entire dataset?
prop_miss(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)
```

    ## [1] 0

``` r
# How many missing values does each variable have?
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM %>% is.na() %>% colSums()
```

    ##                      Age                Attrition           BusinessTravel 
    ##                        0                        0                        0 
    ##                DailyRate               Department         DistanceFromHome 
    ##                        0                        0                        0 
    ##                Education           EducationField            EmployeeCount 
    ##                        0                        0                        0 
    ##           EmployeeNumber  EnvironmentSatisfaction                   Gender 
    ##                        0                        0                        0 
    ##               HourlyRate           JobInvolvement                 JobLevel 
    ##                        0                        0                        0 
    ##                  JobRole          JobSatisfaction            MaritalStatus 
    ##                        0                        0                        0 
    ##            MonthlyIncome              MonthlyRate       NumCompaniesWorked 
    ##                        0                        0                        0 
    ##                   Over18                 OverTime        PercentSalaryHike 
    ##                        0                        0                        0 
    ##        PerformanceRating RelationshipSatisfaction            StandardHours 
    ##                        0                        0                        0 
    ##         StockOptionLevel        TotalWorkingYears    TrainingTimesLastYear 
    ##                        0                        0                        0 
    ##          WorkLifeBalance           YearsAtCompany       YearsInCurrentRole 
    ##                        0                        0                        0 
    ##  YearsSinceLastPromotion     YearsWithCurrManager 
    ##                        0                        0

``` r
# What is the number and percentage of missing values grouped by
# each variable?
miss_var_summary(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)
```

    ## # A tibble: 35 × 3
    ##    variable         n_miss pct_miss
    ##    <chr>             <int>    <dbl>
    ##  1 Age                   0        0
    ##  2 Attrition             0        0
    ##  3 BusinessTravel        0        0
    ##  4 DailyRate             0        0
    ##  5 Department            0        0
    ##  6 DistanceFromHome      0        0
    ##  7 Education             0        0
    ##  8 EducationField        0        0
    ##  9 EmployeeCount         0        0
    ## 10 EmployeeNumber        0        0
    ## # ℹ 25 more rows

``` r
# What is the number and percentage of missing values grouped by
# each observation?
miss_case_summary(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)
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

``` r
# Which variables contain the most missing values?
gg_miss_var(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)
```

![](Acers_Project_files/figure-gfm/Your%20fifteen%20Code%20Chunk-1.png)<!-- -->

``` r
# Where are missing values located (the shaded regions in the plot)?
vis_miss(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM) + theme(axis.text.x = element_text(angle = 80))
```

![](Acers_Project_files/figure-gfm/Your%20fifteen%20Code%20Chunk-2.png)<!-- -->

``` r
# Which combinations of variables are missing together?
#gg_miss_upset(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)
```

# Create a heatmap of “missingness” broken down by “Age”

``` r
# First, confirm that the "AgeDecade" variable is a categorical variable
is.factor(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$Age)
```

    ## [1] FALSE

``` r
# Second, create the visualization
gg_miss_fct(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, fct = Age)
```

![](Acers_Project_files/figure-gfm/Your%20sixteen%20Code%20Chunk-1.png)<!-- -->

``` r
# We can also create a heatmap of "missingness" broken down by "Depressed"
# First, confirm that the "Depressed" variable is a categorical variable
is.factor(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$Attrition)
```

    ## [1] FALSE

``` r
# Second, create the visualization
gg_miss_fct(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, fct = Attrition)
```

![](Acers_Project_files/figure-gfm/Your%20sixteen%20Code%20Chunk-2.png)<!-- -->

# Data Transformation

# Scale Data Transform

# BEFORE

\`\`\`{r Your seventeen Code Chunk}# \# Identify numeric columns

library(readr) STREAMLINING_PROCESSES_AT_KINYANJUI_FARM \<-
read_csv(“data/STREAMLINING PROCESSES AT KINYANJUI FARM.csv”)
numeric_columns \<- sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM,
is.numeric)

# Extract only numeric columns

STREAMLINING_PROCESSES_AT_KINYANJUI_FARM \<-
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, numeric_columns\]

STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\<-
sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, as.numeric)

# Set up the layout for multiple histograms

par(mfrow = c(1, sum(numeric_columns)))

# Plot histograms for numeric columns

for (i in 1:ncol(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)) {
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, i\], main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)\[i\]) }
summary(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)

hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, 1\], main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)\[1\])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, 4\], main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)\[4\])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, 6\], main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)\[6\])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, 7\], main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)\[7\])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, 9\], main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)\[9\])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, 10\], main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)\[10\])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, 11\], main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)\[11\])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, 13\], main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)\[13\])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, 14\], main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)\[14\])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, 15\], main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)\[15\])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, 17\], main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)\[17\])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, 19\], main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)\[19\])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, 20\], main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)\[20\])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, 21\], main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)\[21\])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, 25\], main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)\[25\])
hist(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM\[, 26\], main =
names(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)\[26\])

model_of_the_transform \<-
preProcess(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM, method =
c(“scale”)) print(model_of_the_transform)
streamling_processes_scale_transform \<- predict(model_of_the_transform,
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)

\#After summary(streamling_processes_scale_transform)
hist(streamling_processes_scale_transform\[, 1\], main =
names(streamling_processes_scale_transform)\[1\])
hist(streamling_processes_scale_transform\[, 4\], main =
names(streamling_processes_scale_transform)\[4\])
hist(streamling_processes_scale_transform\[, 6\], main =
names(streamling_processes_scale_transform)\[6\])
hist(streamling_processes_scale_transform\[, 7\], main =
names(streamling_processes_scale_transform)\[7\])
hist(streamling_processes_scale_transform\[, 9\], main =
names(streamling_processes_scale_transform)\[9\])
hist(streamling_processes_scale_transform\[, 10\], main =
names(streamling_processes_scale_transform)\[10\])
hist(streamling_processes_scale_transform\[, 11\], main =
names(streamling_processes_scale_transform)\[11\])
hist(streamling_processes_scale_transform\[, 13\], main =
names(streamling_processes_scale_transform)\[13\])
hist(streamling_processes_scale_transform\[, 14\], main =
names(streamling_processes_scale_transform)\[14\])
hist(streamling_processes_scale_transform\[, 15\], main =
names(streamling_processes_scale_transform)\[15\])
hist(streamling_processes_scale_transform\[, 17\], main =
names(streamling_processes_scale_transform)\[17\])
hist(streamling_processes_scale_transform\[, 19\], main =
names(streamling_processes_scale_transform)\[19\])
hist(streamling_processes_scale_transform\[, 20\], main =
names(streamling_processes_scale_transform)\[20\])
hist(streamling_processes_scale_transform\[, 21\], main =
names(streamling_processes_scale_transform)\[21\])
hist(streamling_processes_scale_transform\[, 25\], main =
names(streamling_processes_scale_transform)\[25\])
hist(streamling_processes_scale_transform\[, 26\], main =
names(streamling_processes_scale_transform)\[26\])



    # Center Data Transform ----
    ```{r Your eighteen Code Chunk}#
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

# Standardize Data Transform to have a std of 1

### The Standardize Basic Transform on the Boston Housing Dataset

``` r
# BEFORE

library(readr)
STREAMLINING_PROCESSES_AT_KINYANJUI_FARM <- read_csv("data/STREAMLINING PROCESSES AT KINYANJUI FARM.csv")
```

    ## Rows: 1470 Columns: 35
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr  (9): Attrition, BusinessTravel, Department, EducationField, Gender, Job...
    ## dbl (26): Age, DailyRate, DistanceFromHome, Education, EmployeeCount, Employ...
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
summary(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)
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

``` r
sapply(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[, c(4, 6, 7, 9, 10, 11, 13,14, 15 , 17 , 19, 20 , 21,  25, 26, 27 , 28 ,29, 30, 31 , 32 , 33 , 34 ,35  )], sd)
```

    ##                DailyRate         DistanceFromHome                Education 
    ##              403.5090999                8.1068644                1.0241649 
    ##            EmployeeCount           EmployeeNumber  EnvironmentSatisfaction 
    ##                0.0000000              602.0243348                1.0930822 
    ##               HourlyRate           JobInvolvement                 JobLevel 
    ##               20.3294276                0.7115611                1.1069399 
    ##          JobSatisfaction            MonthlyIncome              MonthlyRate 
    ##                1.1028461             4707.9567831             7117.7860441 
    ##       NumCompaniesWorked        PerformanceRating RelationshipSatisfaction 
    ##                2.4980090                0.3608235                1.0812089 
    ##            StandardHours         StockOptionLevel        TotalWorkingYears 
    ##                0.0000000                0.8520767                7.7807817 
    ##    TrainingTimesLastYear          WorkLifeBalance           YearsAtCompany 
    ##                1.2892706                0.7064758                6.1265252 
    ##       YearsInCurrentRole  YearsSinceLastPromotion     YearsWithCurrManager 
    ##                3.6231370                3.2224303                3.5681361

``` r
model_of_the_transform <- preProcess(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM,
                                     method = c("scale", "center"))
print(model_of_the_transform)
```

    ## Created from 1470 samples and 35 variables
    ## 
    ## Pre-processing:
    ##   - centered (26)
    ##   - ignored (9)
    ##   - scaled (26)

``` r
streamling_processes_standardize_transform <- predict(model_of_the_transform, # nolint
                                                STREAMLINING_PROCESSES_AT_KINYANJUI_FARM)

# AFTER
summary(streamling_processes_standardize_transform)
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
    ##  EmployeeCount EmployeeNumber      EnvironmentSatisfaction    Gender         
    ##  Min.   :0     Min.   :-1.700704   Min.   :-1.5752         Length:1470       
    ##  1st Qu.:0     1st Qu.:-0.886368   1st Qu.:-0.6603         Class :character  
    ##  Median :0     Median :-0.007251   Median : 0.2545         Mode  :character  
    ##  Mean   :0     Mean   : 0.000000   Mean   : 0.0000                           
    ##  3rd Qu.:0     3rd Qu.: 0.881833   3rd Qu.: 1.1694                           
    ##  Max.   :0     Max.   : 1.732712   Max.   : 1.1694                           
    ##    HourlyRate        JobInvolvement       JobLevel          JobRole         
    ##  Min.   :-1.765478   Min.   :-2.4312   Min.   :-0.96116   Length:1470       
    ##  1st Qu.:-0.880062   1st Qu.:-1.0258   1st Qu.:-0.96116   Class :character  
    ##  Median : 0.005354   Median : 0.3795   Median :-0.05777   Mode  :character  
    ##  Mean   : 0.000000   Mean   : 0.0000   Mean   : 0.00000                     
    ##  3rd Qu.: 0.878472   3rd Qu.: 0.3795   3rd Qu.: 0.84562                     
    ##  Max.   : 1.677806   Max.   : 1.7849   Max.   : 2.65241                     
    ##  JobSatisfaction   MaritalStatus      MonthlyIncome      MonthlyRate     
    ##  Min.   :-1.5674   Length:1470        Min.   :-1.1669   Min.   :-1.7167  
    ##  1st Qu.:-0.6606   Class :character   1st Qu.:-0.7629   1st Qu.:-0.8803  
    ##  Median : 0.2461   Mode  :character   Median :-0.3364   Median :-0.0109  
    ##  Mean   : 0.0000                      Mean   : 0.0000   Mean   : 0.0000  
    ##  3rd Qu.: 1.1529                      3rd Qu.: 0.3985   3rd Qu.: 0.8638  
    ##  Max.   : 1.1529                      Max.   : 2.8667   Max.   : 1.7823  
    ##  NumCompaniesWorked    Over18            OverTime         PercentSalaryHike
    ##  Min.   :-1.0781    Length:1470        Length:1470        Min.   :-1.1502  
    ##  1st Qu.:-0.6778    Class :character   Class :character   1st Qu.:-0.8769  
    ##  Median :-0.2775    Mode  :character   Mode  :character   Median :-0.3305  
    ##  Mean   : 0.0000                                          Mean   : 0.0000  
    ##  3rd Qu.: 0.5231                                          3rd Qu.: 0.7624  
    ##  Max.   : 2.5247                                          Max.   : 2.6750  
    ##  PerformanceRating RelationshipSatisfaction StandardHours StockOptionLevel 
    ##  Min.   :-0.4261   Min.   :-1.5836          Min.   :0     Min.   :-0.9317  
    ##  1st Qu.:-0.4261   1st Qu.:-0.6587          1st Qu.:0     1st Qu.:-0.9317  
    ##  Median :-0.4261   Median : 0.2661          Median :0     Median : 0.2419  
    ##  Mean   : 0.0000   Mean   : 0.0000          Mean   :0     Mean   : 0.0000  
    ##  3rd Qu.:-0.4261   3rd Qu.: 1.1910          3rd Qu.:0     3rd Qu.: 0.2419  
    ##  Max.   : 2.3454   Max.   : 1.1910          Max.   :0     Max.   : 2.5891  
    ##  TotalWorkingYears TrainingTimesLastYear WorkLifeBalance  YearsAtCompany   
    ##  Min.   :-1.4497   Min.   :-2.1712       Min.   :-2.493   Min.   :-1.1439  
    ##  1st Qu.:-0.6785   1st Qu.:-0.6200       1st Qu.:-1.077   1st Qu.:-0.6542  
    ##  Median :-0.1645   Median : 0.1557       Median : 0.338   Median :-0.3278  
    ##  Mean   : 0.0000   Mean   : 0.0000       Mean   : 0.000   Mean   : 0.0000  
    ##  3rd Qu.: 0.4782   3rd Qu.: 0.1557       3rd Qu.: 0.338   3rd Qu.: 0.3251  
    ##  Max.   : 3.6912   Max.   : 2.4826       Max.   : 1.753   Max.   : 5.3851  
    ##  YearsInCurrentRole YearsSinceLastPromotion YearsWithCurrManager
    ##  Min.   :-1.1673    Min.   :-0.6789         Min.   :-1.1555     
    ##  1st Qu.:-0.6153    1st Qu.:-0.6789         1st Qu.:-0.5950     
    ##  Median :-0.3393    Median :-0.3686         Median :-0.3148     
    ##  Mean   : 0.0000    Mean   : 0.0000         Mean   : 0.0000     
    ##  3rd Qu.: 0.7647    3rd Qu.: 0.2521         3rd Qu.: 0.8063     
    ##  Max.   : 3.8008    Max.   : 3.9760         Max.   : 3.6089

``` r
sapply(streamling_processes_standardize_transform[, c(4, 6, 7, 9, 10, 11, 13,14, 15 , 17 , 19, 20 , 21,  25, 26, 27 , 28 ,29, 30, 31 , 32 , 33 , 34 ,35  )], sd)
```

    ##                DailyRate         DistanceFromHome                Education 
    ##                        1                        1                        1 
    ##            EmployeeCount           EmployeeNumber  EnvironmentSatisfaction 
    ##                        0                        1                        1 
    ##               HourlyRate           JobInvolvement                 JobLevel 
    ##                        1                        1                        1 
    ##          JobSatisfaction            MonthlyIncome              MonthlyRate 
    ##                        1                        1                        1 
    ##       NumCompaniesWorked        PerformanceRating RelationshipSatisfaction 
    ##                        1                        1                        1 
    ##            StandardHours         StockOptionLevel        TotalWorkingYears 
    ##                        0                        1                        1 
    ##    TrainingTimesLastYear          WorkLifeBalance           YearsAtCompany 
    ##                        1                        1                        1 
    ##       YearsInCurrentRole  YearsSinceLastPromotion     YearsWithCurrManager 
    ##                        1                        1                        1

# Training Model —-

``` r
## 1. Split the dataset
train_index <- createDataPartition(STREAMLINING_PROCESSES_AT_KINYANJUI_FARM$Attrition,
                                   p = 0.75,
                                   list = FALSE)
streamling_processes_train <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[train_index, ]
streamling_processes_test <- STREAMLINING_PROCESSES_AT_KINYANJUI_FARM[-train_index, ]
```
