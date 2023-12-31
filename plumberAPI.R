# *****************************************************************************
# Lab 11: Plumber API ----
#
# Course Code: BBT4206
# Course Name: Business Intelligence II
# Semester Duration: 21st August 2023 to 28th November 2023
#
# Lecturer: Allan Omondi
# Contact: aomondi [at] strathmore.edu
#
# Note: The lecture contains both theory and practice. This file forms part of
#       the practice. It has required lab work submissions that are graded for
#       coursework marks.
#
# License: GNU GPL-3.0-or-later
# See LICENSE file for licensing information.
# *****************************************************************************

# **[OPTIONAL] Initialization: Install and use renv ----
# The R Environment ("renv") package helps you create reproducible environments
# for your R projects. This is helpful when working in teams because it makes
# your R projects more isolated, portable and reproducible.

# Further reading:
#   Summary: https://rstudio.github.io/renv/
#   More detailed article: https://rstudio.github.io/renv/articles/renv.html

# "renv" It can be installed as follows:
# if (!is.element("renv", installed.packages()[, 1])) {
# install.packages("renv", dependencies = TRUE,
# repos = "https://cloud.r-project.org") # nolint
# }
# require("renv") # nolint

# Once installed, you can then use renv::init() to initialize renv in a new
# project.

# The prompt received after executing renv::init() is as shown below:
# This project already has a lockfile. What would you like to do?

# 1: Restore the project from the lockfile.
# 2: Discard the lockfile and re-initialize the project.
# 3: Activate the project without snapshotting or installing any packages.
# 4: Abort project initialization.

# Select option 1 to restore the project from the lockfile
# renv::init() # nolint

# This will set up a project library, containing all the packages you are
# currently using. The packages (and all the metadata needed to reinstall
# them) are recorded into a lockfile, renv.lock, and a .Rprofile ensures that
# the library is used every time you open the project.

# Consider a library as the location where packages are stored.
# Execute the following command to list all the libraries available in your
# computer:
.libPaths()

# One of the libraries should be a folder inside the project if you are using
# renv

# Then execute the following command to see which packages are available in
# each library:
lapply(.libPaths(), list.files)

# This can also be configured using the RStudio GUI when you click the project
# file, e.g., "BBT4206-R.Rproj" in the case of this project. Then
# navigate to the "Environments" tab and select "Use renv with this project".

# As you continue to work on your project, you can install and upgrade
# packages, using either:
# install.packages() and update.packages or
# renv::install() and renv::update()

# You can also clean up a project by removing unused packages using the
# following command: renv::clean()

# After you have confirmed that your code works as expected, use
# renv::snapshot(), AT THE END, to record the packages and their
# sources in the lockfile.

# Later, if you need to share your code with someone else or run your code on
# a new machine, your collaborator (or you) can call renv::restore() to
# reinstall the specific package versions recorded in the lockfile.

# [OPTIONAL]
# Execute the following code to reinstall the specific package versions
# recorded in the lockfile (restart R after executing the command):
# renv::restore() # nolint

# [OPTIONAL]
# If you get several errors setting up renv and you prefer not to use it, then
# you can deactivate it using the following command (restart R after executing
# the command):
# renv::deactivate() # nolint

# If renv::restore() did not install the "languageserver" package (required to
# use R for VS Code), then it can be installed manually as follows (restart R
# after executing the command):

if (require("languageserver")) {
  require("languageserver")
} else {
  install.packages("languageserver", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

# Introduction ----

# We can create an API to access the model from outside R using a package
# called Plumber.

# STEP 1. Install and Load the Required Packages ----
## plumber ----
if (require("plumber")) {
  require("plumber")
} else {
  install.packages("plumber", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## caret ----
if (require("caret")) {
  require("caret")
} else {
  install.packages("caret", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

# Create a REST API using Plumber ----
# REST API stands for Representational State Transfer Application Programming
# Interface. It is an architectural style and a set of guidelines for building
# web services that provide interoperability between different systems on the
# internet. RESTful APIs are widely used for creating and consuming web
# services.

## Principles of REST API ----

### 1. Stateless ----
# The server does not store any client state between requests. Each request from
# the client contains all the necessary information for the server to understand
# and process the request.

### 2. Client-Server Architecture ----
# The client and server are separate entities that communicate over the
# Internet. The client sends requests to the server, and the server processes
# those requests and sends back responses.

### 3. Uniform Interface ----
# REST APIs use a uniform and consistent set of interfaces and protocols. The
# most common interfaces are based on the HTTP protocol, such as GET (retrieve
# a resource), POST (create a new resource), PUT (update a resource), DELETE
# (remove a resource), etc.

### 4. Resource-Oriented ----
# REST APIs are based on the concept of resources, which are identified by
# unique URIs (Uniform Resource Identifiers). Clients interact with these
#  resources by sending requests to their corresponding URIs.

### 5. Representation of Resources ----
# Resources in a REST API can be represented in various formats, such as JSON
# (JavaScript Object Notation), XML (eXtensible Markup Language), YAML (YAML
# Ain't Markup Language) or plain text. The server sends the representation of
# a resource in the response to the client.


# REST APIs are widely used for building web services that can be consumed by
# various client applications, such as web browsers, mobile apps, or other
# servers. They provide a scalable and flexible approach to designing APIs that
# can evolve over time. Developers can use RESTful principles to create APIs
# that are easy to understand, use, and integrate into different systems.

# When working with a REST API, clients typically send HTTP requests to
# specific endpoints (URLs) provided by the server, and the server responds
# with the requested data or performs the requested actions. The communication
# between client and server is based on the HTTP protocol, making REST APIs
# widely supported and accessible across different platforms and programming
# languages.

# In summary, a REST API is a set of rules and conventions for building web
# services that follow the principles of REST. It provides a standardized and
# scalable way for systems to communicate and exchange data over the internet.

# This requires the "plumber" package that was installed and loaded earlier in
# STEP 1. The commenting below makes R recognize the code as the definition of
# an API, i.e., #* comments.

loaded_streamling_model_svm <- readRDS("./models/saved_streamling_caret_model_svm_radial.rds")

#* @apiTitle Employee  Attrition  Prediction Model API
#* @apiDescription Used to predict employee attrition.

#* @param arg_Age Age of the employee
#* @param arg_BusinessTravel Business travel frequency ("Travel_Rarely", "Travel_Frequently", "Non-Travel")
#* @param arg_DailyRate Daily rate of the employee
#* @param arg_Department Department in which the employee works ( "Sales" , "Research & Development")
#* @param arg_DistanceFromHome Distance from home to workplace ( 1 - 10)
#* @param arg_Education Employee's education level (1-5)
#* @param arg_EducationField Field of education (Medical, "Life Sciences", "Others", "Marketing " , "Technical Degree" , "Human Resource")
#* @param arg_EnvironmentSatisfaction Employee's satisfaction with the work environment (1-4)
#* @param arg_Gender Employee's gender ("Male", "Female")
#* @param arg_HourlyRate Hourly rate of the employee
#* @param arg_JobInvolvement Employee's job involvement (1-4)
#* @param arg_JobLevel Employee's job level (1-5) 
#* @param arg_JobRole Employee's job role ("Sales Executive", "Laboratory Technician", "Research Scientist", "Sales Representative" , "Manufacturing Director", " Healthcare Representative", "Manager", "Human Resources")
#* @param arg_JobSatisfaction Employee's job Satisfaction (1-5)
#* @param arg_MaritalStatus Employee's marital status ("Single", "Married", "Divorced")
#* @param arg_MonthlyIncome Monthly income of the employee
#* @param arg_MonthlyRate Monthly rate of the employee
#* @param arg_NumCompaniesWorked Number of companies the employee has worked for
#* @param arg_OverTime Whether the employee works overtime ("Yes", "No")
#* @param arg_PercentSalaryHike Percentage increase in salary
#* @param arg_PerformanceRating Employee's performance rating (1-4)
#* @param arg_RelationshipSatisfaction Employee's satisfaction with work relationships (1-4)
#* @param arg_StockOptionLevel Employee's stock option level (0-3)
#* @param arg_TotalWorkingYears Total number of years the employee has worked (1-15)
#* @param arg_TrainingTimesLastYear Number of training times attended last year(1-15)
#* @param arg_WorkLifeBalance Employee's work-life balance satisfaction (1-4)
#* @param arg_YearsAtCompany Number of years the employee has been with the company (1-15)
#* @param arg_YearsInCurrentRole Number of years in the current role (1-15)
#* @param arg_YearsSinceLastPromotion Number of years since the last promotion (1-15)
#* @param arg_YearsWithCurrManager Number of years with the current manager(1-15)

#* @get /Attrition
predict_employee_attrition <- function(arg_Age, arg_BusinessTravel, arg_DailyRate, arg_Department,
                                       arg_DistanceFromHome, arg_Education, arg_EducationField,
                                       arg_EnvironmentSatisfaction, arg_Gender, arg_HourlyRate,
                                       arg_JobInvolvement, arg_JobLevel, arg_JobRole,arg_JobSatisfaction, arg_MaritalStatus,
                                       arg_MonthlyIncome, arg_MonthlyRate, arg_NumCompaniesWorked,
                                       arg_OverTime, arg_PercentSalaryHike, arg_PerformanceRating,
                                       arg_RelationshipSatisfaction, arg_StockOptionLevel,
                                       arg_TotalWorkingYears, arg_TrainingTimesLastYear,
                                       arg_WorkLifeBalance, arg_YearsAtCompany, arg_YearsInCurrentRole,
                                       arg_YearsSinceLastPromotion, arg_YearsWithCurrManager) {
  
  # Create a data frame using the arguments
  to_be_predicted <- data.frame(
    Age = as.numeric(arg_Age),
    BusinessTravel = as.factor(arg_BusinessTravel),
    DailyRate = as.numeric(arg_DailyRate),
    Department = as.factor(arg_Department),
    DistanceFromHome = as.numeric(arg_DistanceFromHome),
    Education = as.numeric(arg_Education),
    EducationField = as.factor(arg_EducationField),
    EnvironmentSatisfaction = as.numeric(arg_EnvironmentSatisfaction),
    Gender = as.factor(arg_Gender),
    HourlyRate = as.numeric(arg_HourlyRate),
    JobInvolvement = as.numeric(arg_JobInvolvement),
    JobLevel = as.numeric(arg_JobLevel),
    JobRole = as.factor(arg_JobRole),
    JobSatisfaction = as.numeric(arg_JobSatisfaction),
    MaritalStatus = as.factor(arg_MaritalStatus),
    MonthlyIncome = as.numeric(arg_MonthlyIncome),
    MonthlyRate = as.numeric(arg_MonthlyRate),
    NumCompaniesWorked = as.numeric(arg_NumCompaniesWorked),
    OverTime = as.factor(arg_OverTime),
    PercentSalaryHike = as.numeric(arg_PercentSalaryHike),
    PerformanceRating = as.numeric(arg_PerformanceRating),
    RelationshipSatisfaction = as.numeric(arg_RelationshipSatisfaction),
    StockOptionLevel = as.numeric(arg_StockOptionLevel),
    TotalWorkingYears = as.numeric(arg_TotalWorkingYears),
    TrainingTimesLastYear = as.numeric(arg_TrainingTimesLastYear),
    WorkLifeBalance = as.numeric(arg_WorkLifeBalance),
    YearsAtCompany = as.numeric(arg_YearsAtCompany),
    YearsInCurrentRole = as.numeric(arg_YearsInCurrentRole),
    YearsSinceLastPromotion = as.numeric(arg_YearsSinceLastPromotion),
    YearsWithCurrManager = as.numeric(arg_YearsWithCurrManager)
  )
  
  # Make a prediction based on the data frame
  predict(loaded_streamling_model_svm, to_be_predicted)
}
  

# [OPTIONAL] **Deinitialization: Create a snapshot of the R environment ----
# Lastly, as a follow-up to the initialization step, record the packages
# installed and their sources in the lockfile so that other team-members can
# use renv::restore() to re-install the same package version in their local
# machine during their initialization step.
# renv::snapshot() # nolint