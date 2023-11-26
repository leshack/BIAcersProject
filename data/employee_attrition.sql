-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2023 at 01:04 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `employee_attrition`
--

DELIMITER $$
--
-- Procedures
--

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAgeDistribution` ()   BEGIN
    SELECT
        '18-25' AS `Age Group`,
        COUNT(*) AS `Count`
    FROM
        `employee_customerfacing_data`
    WHERE
        `Age` BETWEEN 18 AND 25

    UNION

    SELECT
        '26-35' AS `Age Group`,
        COUNT(*) AS `Count`
    FROM
        `employee_customerfacing_data`
    WHERE
        `Age` BETWEEN 26 AND 35

    UNION

    SELECT
        '36-45' AS `Age Group`,
        COUNT(*) AS `Count`
    FROM
        `employee_customerfacing_data`
    WHERE
        `Age` BETWEEN 36 AND 45

    UNION

    SELECT
        '46-55' AS `Age Group`,
        COUNT(*) AS `Count`
    FROM
        `employee_customerfacing_data`
    WHERE
        `Age` BETWEEN 46 AND 55

    UNION

    SELECT
        '56+' AS `Age Group`,
        COUNT(*) AS `Count`
    FROM
        `employee_customerfacing_data`
    WHERE
        `Age` >= 56;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetGenderDepartmentData` ()   BEGIN
    SELECT
        `Department` AS `Department`,
        `Gender` AS `Gender`,
        COUNT(*) AS `Count`
    FROM
        `employee_data`
    WHERE
        `Department` IN ('Sales', 'Research & Development')
    GROUP BY
        `Department`, `Gender`;
END$$


CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertRandomData` ()   BEGIN
    DECLARE counter INT DEFAULT 1;

    -- Loop to insert 123 rows
    WHILE counter <= 10 DO
        INSERT INTO employee_customerfacing_data (
            Age, BusinessTravel, DailyRate, Department, DistanceFromHome, Education, 
            EducationField, EnvironmentSatisfaction, Gender, HourlyRate, JobInvolvement, 
            JobLevel, JobRole, JobSatisfaction, MaritalStatus, MonthlyIncome, MonthlyRate, 
            NumCompaniesWorked, OverTime, PercentSalaryHike, PerformanceRating, 
            RelationshipSatisfaction, StockOptionLevel, TotalWorkingYears, 
            TrainingTimesLastYear, WorkLifeBalance, YearsAtCompany, YearsInCurrentRole, 
            YearsSinceLastPromotion, YearsWithCurrManager, PredictedAttrition
        )
        VALUES (
            FLOOR(RAND() * 20) + 20,
            CASE FLOOR(RAND() * 3)
                WHEN 0 THEN 'Travel_Rarely'
                WHEN 1 THEN 'Travel_Frequently'
                ELSE 'Non-Travel'
            END,
            FLOOR(RAND() * 100),
            IF(RAND() > 0.5, 'Research & Development', 'Sales'),
            FLOOR(RAND() * 50),
            FLOOR(RAND() * 5) + 1,
            CASE FLOOR(RAND() * 6)
                WHEN 0 THEN 'Marketing'
                WHEN 1 THEN 'Technical Degree'
                WHEN 2 THEN 'Life Sciences'
                WHEN 3 THEN 'Medical'
                ELSE 'Other'
            END,
            FLOOR(RAND() * 4) + 1,
            IF(RAND() > 0.5, 'Male', 'Female'),
            FLOOR(RAND() * 100),
            FLOOR(RAND() * 4) + 1,
            FLOOR(RAND() * 5) + 1,
            CASE FLOOR(RAND() * 8)
                WHEN 0 THEN 'Manager'
                WHEN 1 THEN 'Research Scientist'
                WHEN 2 THEN 'Laboratory Technician'
                WHEN 3 THEN 'Sales Representative'
                WHEN 4 THEN 'Healthcare Representative'
                WHEN 5 THEN 'Manufacturing Director'
                WHEN 6 THEN 'Human Resources'
                ELSE 'Sales Executive'
            END,
            FLOOR(RAND() * 4) + 1,
            CASE FLOOR(RAND() * 3)
                WHEN 0 THEN 'Single'
                WHEN 1 THEN 'Married'
                ELSE 'Divorced'
            END,
            FLOOR(RAND() * 10000) + 5000,
            FLOOR(RAND() * 20000) + 5000,
            FLOOR(RAND() * 9),
            IF(RAND() > 0.5, 'Yes', 'No'),
            FLOOR(RAND() * 15) + 10,
            FLOOR(RAND() * 1) + 5,
            FLOOR(RAND() * 4) + 1,
            FLOOR(RAND() * 4) + 1,
            FLOOR(RAND() * 40),
            FLOOR(RAND() * 5),
            FLOOR(RAND() * 4) + 1,
            FLOOR(RAND() * 20),
            FLOOR(RAND() * 15),
            FLOOR(RAND() * 15),
            FLOOR(RAND() * 15),
            IF(RAND() > 0.5, 'Yes', 'No')
        );

        SET counter = counter + 1;
    END WHILE;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `employee_customerfacing_data`
--

CREATE TABLE `employee_customerfacing_data` (
  `Age` int(11) DEFAULT NULL,
  `BusinessTravel` varchar(255) DEFAULT NULL,
  `DailyRate` int(11) DEFAULT NULL,
  `Department` varchar(255) DEFAULT NULL,
  `DistanceFromHome` int(11) DEFAULT NULL,
  `Education` int(11) DEFAULT NULL,
  `EducationField` varchar(255) DEFAULT NULL,
  `EnvironmentSatisfaction` int(11) DEFAULT NULL,
  `Gender` varchar(255) DEFAULT NULL,
  `HourlyRate` int(11) DEFAULT NULL,
  `JobInvolvement` int(11) DEFAULT NULL,
  `JobLevel` int(11) DEFAULT NULL,
  `JobRole` varchar(255) DEFAULT NULL,
  `JobSatisfaction` int(11) DEFAULT NULL,
  `MaritalStatus` varchar(255) DEFAULT NULL,
  `MonthlyIncome` int(11) DEFAULT NULL,
  `MonthlyRate` int(11) DEFAULT NULL,
  `NumCompaniesWorked` int(11) DEFAULT NULL,
  `OverTime` varchar(255) DEFAULT NULL,
  `PercentSalaryHike` int(11) DEFAULT NULL,
  `PerformanceRating` int(11) DEFAULT NULL,
  `RelationshipSatisfaction` int(11) DEFAULT NULL,
  `StockOptionLevel` int(11) DEFAULT NULL,
  `TotalWorkingYears` int(11) DEFAULT NULL,
  `TrainingTimesLastYear` int(11) DEFAULT NULL,
  `WorkLifeBalance` int(11) DEFAULT NULL,
  `YearsAtCompany` int(11) DEFAULT NULL,
  `YearsInCurrentRole` int(11) DEFAULT NULL,
  `YearsSinceLastPromotion` int(11) DEFAULT NULL,
  `YearsWithCurrManager` int(11) DEFAULT NULL,
  `PredictedAttrition` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_customerfacing_data`
--

INSERT INTO `employee_customerfacing_data` (`Age`, `BusinessTravel`, `DailyRate`, `Department`, `DistanceFromHome`, `Education`, `EducationField`, `EnvironmentSatisfaction`, `Gender`, `HourlyRate`, `JobInvolvement`, `JobLevel`, `JobRole`, `JobSatisfaction`, `MaritalStatus`, `MonthlyIncome`, `MonthlyRate`, `NumCompaniesWorked`, `OverTime`, `PercentSalaryHike`, `PerformanceRating`, `RelationshipSatisfaction`, `StockOptionLevel`, `TotalWorkingYears`, `TrainingTimesLastYear`, `WorkLifeBalance`, `YearsAtCompany`, `YearsInCurrentRole`, `YearsSinceLastPromotion`, `YearsWithCurrManager`, `PredictedAttrition`) VALUES
(36, 'Travel_Rarely', 95, 'Research & Development', 32, 4, 'Other', 2, 'Female', 6, 1, 3, 'Sales Representative', 3, 'Divorced', 11548, 14005, 2, 'No', 18, 3, 4, 2, 32, 4, 3, 14, 13, 5, 2, 'Yes'),
(35, 'Non-Travel', 32, 'Research & Development', 12, 4, 'Other', 3, 'Female', 86, 1, 2, 'Laboratory Technician', 1, 'Single', 11863, 17858, 1, 'Yes', 21, 3, 2, 3, 25, 0, 1, 9, 0, 10, 6, 'Yes'),
(32, 'Travel_Rarely', 19, 'Sales', 3, 2, 'Life Sciences', 1, 'Male', 25, 3, 2, 'Sales Executive', 2, 'Married', 12807, 18617, 0, 'No', 12, 3, 2, 1, 39, 4, 2, 8, 12, 14, 3, 'No'),
(27, 'Travel_Frequently', 0, 'Sales', 27, 3, 'Medical', 3, 'Male', 28, 2, 3, 'Laboratory Technician', 1, 'Single', 5617, 10285, 1, 'Yes', 10, 3, 2, 2, 10, 4, 2, 17, 12, 9, 8, 'Yes'),
(25, 'Travel_Rarely', 69, 'Research & Development', 46, 5, 'Life Sciences', 4, 'Male', 37, 3, 3, 'Sales Executive', 1, 'Single', 12368, 15671, 4, 'Yes', 10, 3, 4, 1, 12, 2, 2, 9, 2, 8, 4, 'Yes'),
(30, 'Travel_Frequently', 23, 'Research & Development', 43, 5, 'Life Sciences', 4, 'Male', 22, 3, 2, 'Human Resources', 4, 'Single', 7819, 21474, 2, 'Yes', 19, 3, 4, 2, 7, 0, 3, 19, 13, 11, 0, 'Yes'),
(33, 'Travel_Frequently', 10, 'Sales', 48, 1, 'Medical', 2, 'Male', 99, 1, 1, 'Manufacturing Director', 4, 'Divorced', 13556, 5759, 5, 'No', 11, 3, 4, 3, 9, 2, 2, 11, 12, 3, 13, 'Yes'),
(36, 'Non-Travel', 39, 'Sales', 9, 4, 'Marketing', 3, 'Female', 22, 3, 3, 'Sales Executive', 4, 'Single', 6789, 21903, 6, 'Yes', 17, 3, 4, 3, 0, 2, 1, 11, 3, 6, 9, 'Yes'),
(21, 'Travel_Rarely', 5, 'Sales', 8, 4, 'Medical', 1, 'Female', 61, 1, 3, 'Manufacturing Director', 2, 'Married', 13305, 20977, 4, 'No', 11, 3, 4, 3, 34, 3, 4, 9, 9, 12, 3, 'Yes'),
(38, 'Travel_Frequently', 6, 'Sales', 0, 2, 'Other', 4, 'Male', 57, 1, 5, 'Sales Representative', 1, 'Single', 7431, 24706, 1, 'No', 18, 3, 4, 4, 4, 4, 4, 6, 10, 6, 2, 'Yes'),
(29, 'Travel_Frequently', 87, 'Sales', 25, 3, 'Other', 1, 'Male', 54, 2, 4, 'Healthcare Representative', 4, 'Single', 7452, 9668, 3, 'No', 24, 3, 4, 3, 8, 1, 1, 18, 1, 9, 14, 'Yes'),
(33, 'Travel_Frequently', 86, 'Research & Development', 24, 3, 'Technical Degree', 4, 'Male', 18, 2, 5, 'Human Resources', 3, 'Divorced', 5185, 18483, 2, 'Yes', 22, 3, 4, 3, 8, 4, 4, 6, 3, 1, 12, 'Yes'),
(27, 'Travel_Frequently', 62, 'Research & Development', 34, 5, 'Medical', 2, 'Male', 50, 2, 4, 'Healthcare Representative', 2, 'Married', 7192, 16516, 1, 'No', 13, 3, 2, 4, 21, 4, 3, 14, 10, 2, 13, 'No'),
(26, 'Travel_Frequently', 49, 'Sales', 32, 1, 'Marketing', 2, 'Female', 48, 2, 5, 'Healthcare Representative', 1, 'Single', 8975, 13844, 0, 'Yes', 21, 3, 3, 4, 1, 2, 1, 19, 10, 7, 7, 'No'),
(31, 'Non-Travel', 67, 'Research & Development', 23, 2, 'Other', 3, 'Female', 25, 1, 3, 'Sales Executive', 2, 'Single', 14579, 6877, 5, 'Yes', 20, 3, 4, 3, 8, 4, 2, 7, 2, 10, 13, 'No'),
(21, 'Travel_Frequently', 99, 'Research & Development', 46, 5, 'Medical', 3, 'Male', 77, 4, 1, 'Sales Executive', 1, 'Single', 12310, 22214, 0, 'Yes', 17, 3, 4, 3, 30, 1, 1, 10, 7, 14, 3, 'No'),
(23, 'Travel_Frequently', 75, 'Research & Development', 42, 4, 'Life Sciences', 2, 'Male', 62, 4, 4, 'Manufacturing Director', 3, 'Divorced', 9573, 19042, 1, 'Yes', 17, 3, 3, 3, 0, 1, 4, 17, 13, 13, 13, 'Yes'),
(31, 'Travel_Frequently', 95, 'Research & Development', 43, 1, 'Other', 1, 'Male', 72, 4, 3, 'Manufacturing Director', 1, 'Married', 11268, 24009, 7, 'Yes', 23, 3, 3, 4, 38, 4, 3, 9, 6, 9, 13, 'Yes'),
(30, 'Non-Travel', 89, 'Sales', 17, 3, 'Medical', 1, 'Female', 86, 2, 4, 'Manager', 1, 'Single', 12052, 5621, 0, 'No', 16, 3, 2, 3, 33, 2, 1, 13, 4, 7, 8, 'No'),
(36, 'Travel_Rarely', 49, 'Research & Development', 48, 1, 'Other', 4, 'Male', 81, 2, 2, 'Human Resources', 4, 'Single', 11505, 5877, 2, 'No', 13, 3, 4, 2, 14, 0, 1, 0, 2, 9, 8, 'No'),
(21, 'Non-Travel', 92, 'Sales', 48, 2, 'Other', 4, 'Female', 87, 2, 5, 'Sales Executive', 4, 'Married', 6274, 5821, 7, 'Yes', 17, 3, 4, 1, 12, 4, 2, 10, 6, 8, 7, 'Yes'),
(31, 'Travel_Frequently', 49, 'Sales', 12, 5, 'Life Sciences', 1, 'Female', 12, 1, 2, 'Manager', 1, 'Divorced', 14473, 5786, 3, 'Yes', 13, 3, 4, 1, 38, 2, 2, 6, 10, 8, 9, 'No'),
(29, 'Non-Travel', 19, 'Sales', 27, 1, 'Other', 2, 'Male', 30, 4, 5, 'Healthcare Representative', 1, 'Married', 7385, 19823, 8, 'Yes', 20, 3, 4, 3, 31, 4, 2, 16, 2, 3, 13, 'Yes'),
(25, 'Travel_Frequently', 31, 'Research & Development', 29, 5, 'Technical Degree', 4, 'Male', 63, 1, 1, 'Manager', 4, 'Married', 12824, 11641, 2, 'Yes', 23, 3, 2, 1, 18, 0, 4, 15, 12, 13, 13, 'Yes'),
(36, 'Travel_Frequently', 51, 'Sales', 12, 1, 'Marketing', 1, 'Male', 64, 1, 2, 'Research Scientist', 4, 'Single', 13635, 24578, 2, 'Yes', 24, 3, 2, 3, 37, 0, 3, 15, 14, 9, 1, 'Yes'),
(23, 'Non-Travel', 56, 'Sales', 0, 1, 'Technical Degree', 3, 'Female', 74, 1, 3, 'Human Resources', 3, 'Married', 7066, 24050, 1, 'Yes', 22, 3, 4, 1, 38, 2, 4, 2, 9, 14, 13, 'Yes'),
(29, 'Travel_Frequently', 81, 'Research & Development', 5, 2, 'Other', 1, 'Male', 26, 1, 4, 'Research Scientist', 1, 'Married', 11900, 13663, 0, 'No', 19, 3, 3, 4, 2, 4, 2, 11, 5, 0, 3, 'No'),
(27, 'Non-Travel', 30, 'Research & Development', 10, 4, 'Life Sciences', 2, 'Female', 53, 4, 2, 'Laboratory Technician', 2, 'Single', 14472, 19316, 6, 'Yes', 17, 3, 3, 2, 35, 2, 1, 9, 6, 8, 7, 'Yes'),
(27, 'Travel_Frequently', 59, 'Sales', 49, 5, 'Life Sciences', 3, 'Female', 12, 4, 4, 'Manufacturing Director', 2, 'Single', 12447, 6993, 2, 'No', 14, 3, 3, 3, 21, 2, 2, 16, 2, 5, 5, 'Yes'),
(35, 'Travel_Frequently', 28, 'Research & Development', 23, 4, 'Technical Degree', 1, 'Male', 78, 1, 2, 'Human Resources', 2, 'Divorced', 9834, 7223, 0, 'No', 19, 3, 2, 2, 34, 3, 2, 8, 12, 13, 0, 'No'),
(30, 'Travel_Frequently', 50, 'Research & Development', 4, 2, 'Marketing', 2, 'Male', 21, 2, 3, 'Research Scientist', 2, 'Married', 10719, 22127, 5, 'No', 19, 3, 2, 1, 28, 0, 2, 9, 3, 13, 8, 'No'),
(38, 'Travel_Frequently', 86, 'Research & Development', 17, 2, 'Other', 3, 'Female', 58, 3, 1, 'Sales Representative', 2, 'Single', 5398, 16540, 6, 'No', 12, 3, 3, 2, 25, 1, 1, 3, 5, 6, 0, 'Yes'),
(36, 'Non-Travel', 10, 'Sales', 37, 3, 'Life Sciences', 2, 'Female', 86, 2, 4, 'Human Resources', 4, 'Divorced', 6642, 17902, 6, 'Yes', 16, 3, 4, 3, 2, 2, 2, 15, 6, 11, 9, 'Yes'),
(29, 'Non-Travel', 62, 'Research & Development', 16, 4, 'Medical', 4, 'Male', 85, 1, 5, 'Healthcare Representative', 3, 'Divorced', 14736, 14710, 4, 'No', 22, 3, 4, 4, 24, 3, 2, 10, 10, 14, 10, 'Yes'),
(38, 'Non-Travel', 30, 'Sales', 21, 5, 'Medical', 1, 'Female', 84, 4, 2, 'Manufacturing Director', 3, 'Divorced', 12531, 19030, 2, 'No', 24, 3, 3, 4, 39, 0, 4, 2, 10, 5, 7, 'Yes'),
(23, 'Travel_Frequently', 16, 'Research & Development', 18, 3, 'Life Sciences', 4, 'Male', 57, 2, 1, 'Manufacturing Director', 1, 'Divorced', 10579, 6015, 5, 'Yes', 24, 3, 3, 2, 23, 4, 3, 13, 5, 14, 9, 'No'),
(36, 'Non-Travel', 42, 'Research & Development', 32, 5, 'Life Sciences', 1, 'Male', 72, 1, 1, 'Laboratory Technician', 2, 'Single', 12311, 24933, 7, 'Yes', 16, 3, 1, 3, 9, 0, 3, 14, 14, 8, 0, 'Yes'),
(27, 'Travel_Frequently', 2, 'Research & Development', 45, 1, 'Other', 2, 'Female', 25, 1, 2, 'Sales Representative', 1, 'Divorced', 10514, 9644, 4, 'Yes', 20, 3, 1, 1, 2, 0, 1, 12, 8, 13, 13, 'Yes'),
(23, 'Travel_Frequently', 33, 'Research & Development', 39, 1, 'Marketing', 2, 'Male', 7, 2, 4, 'Research Scientist', 4, 'Married', 10055, 20246, 2, 'No', 10, 3, 2, 4, 6, 1, 3, 11, 13, 11, 2, 'Yes'),
(24, 'Travel_Frequently', 57, 'Research & Development', 2, 3, 'Medical', 2, 'Female', 61, 3, 1, 'Human Resources', 2, 'Divorced', 10435, 20763, 2, 'No', 10, 3, 2, 4, 5, 3, 1, 0, 4, 6, 6, 'Yes'),
(36, 'Travel_Frequently', 21, 'Research & Development', 43, 5, 'Other', 4, 'Female', 37, 2, 3, 'Manager', 2, 'Married', 13464, 13255, 4, 'No', 15, 3, 4, 4, 6, 2, 1, 10, 10, 11, 11, 'Yes'),
(32, 'Travel_Frequently', 6, 'Sales', 22, 5, 'Technical Degree', 1, 'Female', 43, 4, 3, 'Sales Executive', 4, 'Single', 7093, 6441, 6, 'No', 10, 3, 4, 2, 21, 0, 1, 6, 1, 6, 14, 'Yes'),
(37, 'Non-Travel', 88, 'Sales', 47, 4, 'Other', 3, 'Female', 43, 1, 5, 'Research Scientist', 3, 'Single', 8832, 9527, 8, 'No', 13, 3, 1, 2, 3, 4, 3, 14, 1, 3, 13, 'Yes'),
(24, 'Non-Travel', 80, 'Research & Development', 22, 2, 'Life Sciences', 4, 'Female', 99, 4, 4, 'Human Resources', 4, 'Single', 6485, 8505, 3, 'Yes', 22, 3, 1, 1, 32, 3, 1, 15, 4, 3, 2, 'No'),
(36, 'Travel_Frequently', 29, 'Sales', 4, 2, 'Marketing', 2, 'Male', 2, 3, 5, 'Sales Executive', 3, 'Divorced', 5944, 23572, 3, 'No', 24, 3, 2, 4, 22, 2, 2, 17, 2, 2, 4, 'No'),
(30, 'Travel_Rarely', 64, 'Research & Development', 37, 1, 'Life Sciences', 3, 'Female', 14, 4, 3, 'Sales Representative', 2, 'Single', 6798, 23103, 8, 'No', 11, 3, 2, 1, 35, 3, 4, 7, 1, 7, 2, 'No'),
(37, 'Travel_Frequently', 31, 'Research & Development', 2, 5, 'Technical Degree', 2, 'Female', 89, 1, 2, 'Research Scientist', 3, 'Single', 12268, 6530, 1, 'Yes', 14, 3, 4, 4, 38, 0, 3, 12, 5, 1, 3, 'No'),
(26, 'Travel_Frequently', 17, 'Research & Development', 14, 3, 'Marketing', 3, 'Male', 94, 1, 1, 'Manager', 1, 'Divorced', 5179, 18162, 2, 'No', 15, 3, 2, 1, 36, 0, 1, 9, 9, 12, 3, 'Yes'),
(32, 'Travel_Rarely', 37, 'Research & Development', 36, 2, 'Medical', 4, 'Female', 27, 2, 5, 'Sales Representative', 3, 'Divorced', 12271, 20631, 6, 'No', 13, 3, 2, 4, 28, 0, 3, 17, 4, 12, 4, 'No'),
(27, 'Travel_Frequently', 17, 'Research & Development', 4, 4, 'Marketing', 3, 'Male', 80, 1, 2, 'Manufacturing Director', 3, 'Divorced', 7972, 12251, 8, 'Yes', 22, 3, 2, 1, 17, 4, 1, 11, 10, 13, 6, 'No'),
(32, 'Travel_Rarely', 40, 'Research & Development', 45, 1, 'Medical', 3, 'Female', 12, 1, 2, 'Research Scientist', 4, 'Married', 5615, 22280, 1, 'No', 10, 3, 1, 3, 14, 4, 3, 9, 4, 2, 13, 'No'),
(27, 'Non-Travel', 35, 'Sales', 11, 5, 'Technical Degree', 1, 'Female', 66, 4, 3, 'Human Resources', 3, 'Single', 13829, 14988, 7, 'Yes', 12, 3, 3, 4, 11, 0, 3, 0, 1, 6, 13, 'No'),
(24, 'Travel_Frequently', 49, 'Research & Development', 7, 1, 'Life Sciences', 3, 'Male', 71, 2, 1, 'Sales Representative', 3, 'Single', 6431, 17735, 6, 'Yes', 10, 3, 1, 2, 9, 3, 3, 4, 3, 5, 5, 'No'),
(27, 'Travel_Frequently', 89, 'Sales', 34, 4, 'Technical Degree', 1, 'Male', 50, 3, 2, 'Research Scientist', 3, 'Single', 12142, 5028, 7, 'No', 24, 3, 1, 2, 39, 2, 4, 5, 0, 4, 4, 'Yes'),
(24, 'Travel_Rarely', 93, 'Research & Development', 30, 1, 'Technical Degree', 2, 'Female', 64, 3, 3, 'Manager', 1, 'Divorced', 14162, 20705, 1, 'Yes', 11, 3, 4, 1, 21, 3, 3, 5, 5, 2, 8, 'No'),
(35, 'Travel_Rarely', 73, 'Research & Development', 7, 4, 'Technical Degree', 4, 'Female', 75, 2, 4, 'Laboratory Technician', 2, 'Divorced', 11188, 10447, 4, 'Yes', 10, 3, 1, 2, 4, 3, 3, 5, 11, 2, 6, 'Yes'),
(35, 'Non-Travel', 66, 'Sales', 36, 4, 'Marketing', 2, 'Female', 51, 3, 1, 'Healthcare Representative', 2, 'Divorced', 14693, 16200, 8, 'Yes', 13, 3, 2, 4, 37, 4, 3, 1, 12, 12, 8, 'No'),
(28, 'Non-Travel', 84, 'Research & Development', 15, 2, 'Life Sciences', 4, 'Male', 64, 1, 4, 'Sales Executive', 4, 'Single', 12216, 22789, 2, 'Yes', 23, 3, 4, 3, 24, 2, 1, 8, 1, 2, 7, 'Yes'),
(21, 'Travel_Frequently', 89, 'Research & Development', 25, 4, 'Other', 4, 'Female', 93, 2, 4, 'Manager', 3, 'Married', 14332, 14302, 4, 'No', 18, 3, 3, 1, 22, 3, 3, 10, 8, 2, 2, 'No'),
(27, 'Non-Travel', 46, 'Sales', 20, 4, 'Other', 1, 'Female', 79, 2, 5, 'Sales Executive', 1, 'Single', 9750, 6689, 8, 'Yes', 20, 3, 4, 2, 3, 4, 2, 15, 14, 8, 13, 'Yes'),
(24, 'Non-Travel', 31, 'Sales', 49, 2, 'Other', 2, 'Male', 46, 2, 3, 'Laboratory Technician', 1, 'Single', 12701, 16806, 5, 'No', 13, 3, 4, 4, 32, 1, 4, 13, 11, 10, 5, 'Yes'),
(21, 'Travel_Frequently', 29, 'Research & Development', 43, 3, 'Other', 4, 'Female', 55, 3, 3, 'Sales Representative', 4, 'Single', 10130, 14461, 7, 'Yes', 11, 3, 1, 4, 30, 1, 1, 16, 12, 8, 5, 'No'),
(26, 'Travel_Frequently', 28, 'Sales', 15, 3, 'Life Sciences', 4, 'Female', 81, 1, 4, 'Human Resources', 3, 'Married', 5843, 19326, 2, 'No', 17, 3, 1, 2, 9, 4, 2, 9, 6, 11, 7, 'No'),
(30, 'Non-Travel', 39, 'Sales', 45, 3, 'Other', 3, 'Male', 96, 2, 3, 'Manufacturing Director', 2, 'Married', 9896, 24145, 2, 'Yes', 19, 3, 4, 4, 31, 0, 1, 5, 1, 7, 5, 'No'),
(24, 'Travel_Frequently', 42, 'Research & Development', 43, 5, 'Medical', 1, 'Female', 67, 2, 5, 'Sales Representative', 2, 'Divorced', 9839, 14904, 0, 'Yes', 11, 3, 3, 3, 12, 2, 3, 17, 4, 12, 4, 'No'),
(30, 'Travel_Frequently', 42, 'Research & Development', 10, 2, 'Other', 4, 'Male', 45, 2, 3, 'Sales Representative', 3, 'Single', 5086, 11860, 6, 'No', 10, 3, 1, 3, 16, 0, 4, 19, 8, 12, 7, 'Yes'),
(20, 'Travel_Frequently', 300, 'Sales', 10, 2, 'Medical', 1, 'Male', 40, 1, 2, 'Laboratory Technician', 4, 'Married', 4, 4000, 2, 'No', 60, 3, 1, 1, 30, 2, 2, 43, 20, 5, 10, 'No'),
(27, 'Non-Travel', 34, 'Research & Development', 48, 1, 'Technical Degree', 1, 'Male', 56, 1, 2, 'Research Scientist', 4, 'Single', 9736, 8960, 5, 'No', 18, 2, 2, 3, 26, 4, 1, 1, 0, 13, 5, 'No'),
(30, 'Travel_Rarely', 58, 'Sales', 29, 1, 'Other', 2, 'Female', 58, 2, 3, 'Research Scientist', 1, 'Divorced', 13454, 21112, 4, 'No', 21, 2, 3, 1, 31, 3, 1, 2, 8, 7, 10, 'Yes'),
(31, 'Travel_Rarely', 56, 'Research & Development', 34, 3, 'Marketing', 2, 'Female', 19, 3, 2, 'Human Resources', 1, 'Single', 13181, 12044, 2, 'No', 16, 2, 1, 3, 31, 0, 2, 12, 11, 1, 2, 'No'),
(31, 'Non-Travel', 77, 'Research & Development', 23, 1, 'Other', 1, 'Female', 70, 3, 2, 'Sales Representative', 1, 'Single', 6545, 21477, 5, 'Yes', 10, 2, 2, 4, 37, 3, 4, 4, 5, 2, 10, 'No'),
(29, 'Non-Travel', 30, 'Research & Development', 29, 5, 'Medical', 2, 'Female', 87, 1, 3, 'Manager', 1, 'Divorced', 8895, 15286, 3, 'No', 12, 1, 1, 4, 35, 4, 3, 5, 9, 6, 2, 'Yes'),
(32, 'Travel_Rarely', 59, 'Sales', 28, 3, 'Technical Degree', 3, 'Female', 22, 4, 2, 'Sales Representative', 1, 'Married', 7877, 19266, 6, 'No', 21, 2, 2, 4, 33, 3, 2, 4, 2, 4, 0, 'No'),
(20, 'Travel_Frequently', 34, 'Sales', 14, 4, 'Technical Degree', 2, 'Female', 52, 1, 3, 'Manager', 4, 'Divorced', 7764, 14493, 4, 'No', 22, 1, 1, 3, 3, 1, 3, 17, 9, 6, 4, 'No'),
(34, 'Non-Travel', 20, 'Research & Development', 7, 5, 'Marketing', 3, 'Female', 47, 1, 1, 'Sales Executive', 2, 'Single', 12454, 9241, 7, 'No', 24, 1, 3, 1, 18, 0, 3, 0, 8, 13, 11, 'No'),
(21, 'Travel_Rarely', 47, 'Research & Development', 17, 5, 'Life Sciences', 1, 'Female', 16, 1, 4, 'Laboratory Technician', 2, 'Divorced', 11633, 8526, 8, 'Yes', 24, 1, 2, 3, 34, 2, 1, 15, 10, 0, 1, 'No'),
(35, 'Travel_Frequently', 85, 'Sales', 10, 5, 'Technical Degree', 1, 'Female', 25, 1, 5, 'Manager', 3, 'Divorced', 11605, 17053, 0, 'No', 19, 1, 1, 2, 15, 3, 2, 8, 4, 0, 6, 'No'),
(34, 'Non-Travel', 23, 'Sales', 40, 4, 'Technical Degree', 3, 'Female', 20, 4, 2, 'Sales Representative', 2, 'Single', 8490, 22924, 3, 'No', 11, 1, 1, 1, 17, 4, 4, 8, 13, 0, 6, 'No'),
(36, 'Travel_Frequently', 92, 'Sales', 45, 1, 'Marketing', 4, 'Male', 7, 3, 4, 'Sales Representative', 2, 'Divorced', 12372, 9802, 8, 'No', 12, 1, 1, 4, 8, 2, 4, 5, 7, 11, 1, 'No'),
(36, 'Non-Travel', 46, 'Research & Development', 25, 3, 'Life Sciences', 1, 'Male', 86, 2, 3, 'Sales Executive', 2, 'Married', 5505, 20464, 6, 'No', 11, 2, 4, 1, 27, 0, 3, 7, 2, 12, 9, 'Yes'),
(35, 'Travel_Frequently', 98, 'Research & Development', 29, 1, 'Technical Degree', 2, 'Male', 83, 2, 4, 'Research Scientist', 2, 'Divorced', 9898, 7862, 2, 'Yes', 14, 2, 4, 4, 19, 4, 3, 15, 13, 3, 8, 'No'),
(32, 'Non-Travel', 79, 'Sales', 19, 3, 'Life Sciences', 2, 'Male', 25, 2, 3, 'Human Resources', 3, 'Married', 7010, 8174, 1, 'No', 22, 2, 3, 3, 0, 1, 4, 7, 12, 1, 13, 'No'),
(32, 'Travel_Frequently', 95, 'Research & Development', 22, 2, 'Other', 1, 'Female', 2, 4, 5, 'Sales Executive', 1, 'Single', 7801, 21919, 3, 'No', 23, 1, 1, 2, 20, 1, 4, 13, 11, 10, 1, 'No'),
(20, 'Non-Travel', 2, 'Research & Development', 49, 1, 'Life Sciences', 1, 'Male', 30, 3, 4, 'Laboratory Technician', 2, 'Divorced', 9334, 6671, 1, 'No', 15, 2, 2, 2, 9, 4, 4, 8, 8, 9, 5, 'Yes'),
(27, 'Travel_Rarely', 19, 'Sales', 12, 4, 'Other', 2, 'Male', 0, 3, 3, 'Sales Representative', 4, 'Divorced', 13470, 16176, 2, 'Yes', 12, 1, 1, 1, 28, 4, 2, 5, 2, 0, 7, 'Yes'),
(26, 'Non-Travel', 20, 'Research & Development', 9, 2, 'Other', 2, 'Female', 18, 1, 2, 'Manager', 1, 'Married', 13007, 6639, 0, 'Yes', 24, 1, 4, 1, 10, 4, 3, 1, 11, 7, 4, 'Yes'),
(21, 'Travel_Rarely', 25, 'Sales', 16, 2, 'Other', 3, 'Male', 13, 2, 1, 'Manufacturing Director', 2, 'Single', 13423, 7692, 1, 'No', 12, 2, 2, 4, 30, 2, 3, 0, 5, 14, 10, 'Yes'),
(34, 'Non-Travel', 58, 'Sales', 23, 2, 'Other', 2, 'Male', 99, 2, 3, 'Research Scientist', 4, 'Divorced', 13988, 12671, 1, 'Yes', 11, 2, 1, 3, 26, 2, 2, 1, 6, 1, 14, 'Yes'),
(36, 'Non-Travel', 68, 'Research & Development', 30, 2, 'Life Sciences', 1, 'Female', 84, 4, 2, 'Research Scientist', 1, 'Married', 11667, 5079, 0, 'No', 15, 2, 4, 4, 18, 3, 2, 8, 1, 3, 13, 'Yes'),
(22, 'Travel_Frequently', 57, 'Research & Development', 30, 1, 'Life Sciences', 1, 'Male', 50, 3, 4, 'Human Resources', 3, 'Divorced', 9445, 17033, 6, 'Yes', 22, 1, 3, 2, 31, 2, 1, 3, 6, 11, 8, 'No'),
(24, 'Non-Travel', 15, 'Research & Development', 2, 3, 'Life Sciences', 4, 'Male', 60, 1, 2, 'Human Resources', 1, 'Divorced', 12922, 22196, 8, 'No', 15, 2, 1, 3, 1, 2, 3, 13, 3, 4, 12, 'No'),
(23, 'Travel_Frequently', 17, 'Sales', 31, 3, 'Life Sciences', 4, 'Male', 57, 1, 5, 'Manager', 2, 'Divorced', 10853, 6451, 5, 'Yes', 13, 2, 3, 1, 33, 4, 1, 11, 11, 0, 12, 'Yes'),
(30, 'Non-Travel', 6, 'Sales', 13, 1, 'Medical', 4, 'Female', 74, 4, 4, 'Human Resources', 3, 'Married', 11406, 21710, 2, 'Yes', 11, 1, 2, 4, 16, 0, 3, 4, 8, 1, 11, 'Yes'),
(34, 'Non-Travel', 63, 'Research & Development', 28, 2, 'Technical Degree', 4, 'Male', 6, 3, 2, 'Sales Executive', 2, 'Divorced', 11870, 9053, 8, 'No', 23, 1, 3, 2, 31, 3, 2, 3, 1, 13, 2, 'No'),
(35, 'Travel_Rarely', 10, 'Sales', 45, 5, 'Life Sciences', 3, 'Female', 6, 3, 4, 'Manager', 2, 'Divorced', 14145, 20109, 0, 'Yes', 16, 1, 3, 4, 2, 0, 1, 0, 0, 0, 2, 'Yes'),
(35, 'Non-Travel', 42, 'Sales', 48, 1, 'Medical', 2, 'Female', 80, 3, 2, 'Manufacturing Director', 4, 'Married', 14734, 21625, 2, 'Yes', 20, 2, 3, 3, 29, 0, 2, 3, 0, 10, 3, 'No'),
(32, 'Travel_Rarely', 39, 'Research & Development', 36, 2, 'Technical Degree', 1, 'Male', 84, 4, 3, 'Manager', 4, 'Divorced', 8995, 20014, 4, 'Yes', 24, 1, 1, 3, 37, 4, 3, 4, 5, 1, 6, 'Yes'),
(30, 'Travel_Frequently', 67, 'Sales', 1, 1, 'Medical', 2, 'Male', 74, 4, 2, 'Manufacturing Director', 3, 'Divorced', 14077, 19275, 7, 'No', 23, 1, 2, 3, 10, 0, 3, 15, 0, 12, 14, 'No'),
(27, 'Travel_Frequently', 46, 'Research & Development', 23, 1, 'Other', 3, 'Female', 33, 2, 3, 'Healthcare Representative', 3, 'Single', 8461, 6719, 3, 'Yes', 14, 2, 3, 2, 13, 2, 1, 11, 4, 10, 8, 'Yes'),
(38, 'Travel_Frequently', 68, 'Research & Development', 36, 4, 'Medical', 1, 'Female', 28, 1, 2, 'Manufacturing Director', 2, 'Married', 5624, 20592, 6, 'No', 24, 1, 3, 2, 20, 1, 4, 11, 4, 9, 4, 'Yes'),
(30, 'Travel_Frequently', 73, 'Sales', 23, 2, 'Life Sciences', 4, 'Male', 21, 4, 2, 'Healthcare Representative', 3, 'Single', 7638, 5768, 3, 'Yes', 13, 2, 4, 3, 19, 3, 4, 10, 14, 4, 7, 'Yes'),
(39, 'Non-Travel', 85, 'Sales', 27, 4, 'Other', 3, 'Male', 22, 3, 5, 'Laboratory Technician', 4, 'Married', 13170, 17035, 5, 'Yes', 13, 1, 3, 4, 39, 1, 1, 13, 2, 13, 13, 'Yes'),
(38, 'Non-Travel', 50, 'Research & Development', 6, 5, 'Marketing', 3, 'Female', 43, 1, 5, 'Healthcare Representative', 1, 'Single', 6042, 9046, 6, 'Yes', 15, 1, 1, 3, 5, 2, 1, 19, 9, 3, 3, 'No'),
(31, 'Travel_Frequently', 97, 'Sales', 14, 4, 'Other', 2, 'Male', 48, 2, 5, 'Manufacturing Director', 2, 'Married', 7569, 18134, 4, 'Yes', 16, 1, 3, 3, 6, 0, 2, 7, 9, 3, 4, 'Yes'),
(22, 'Non-Travel', 51, 'Sales', 40, 2, 'Other', 2, 'Male', 79, 1, 2, 'Manufacturing Director', 4, 'Divorced', 10209, 15861, 1, 'No', 13, 2, 3, 1, 3, 3, 4, 8, 12, 12, 12, 'Yes'),
(28, 'Travel_Frequently', 52, 'Research & Development', 11, 3, 'Other', 1, 'Male', 18, 3, 5, 'Sales Representative', 3, 'Married', 8605, 22818, 3, 'No', 22, 2, 3, 1, 34, 4, 4, 15, 1, 5, 7, 'No'),
(35, 'Travel_Rarely', 71, 'Research & Development', 20, 2, 'Life Sciences', 1, 'Male', 0, 4, 2, 'Manufacturing Director', 2, 'Single', 13365, 15527, 1, 'No', 21, 2, 4, 2, 30, 3, 2, 15, 10, 3, 14, 'No'),
(26, 'Non-Travel', 53, 'Research & Development', 6, 4, 'Medical', 2, 'Female', 19, 4, 4, 'Research Scientist', 2, 'Single', 10453, 19386, 8, 'Yes', 15, 2, 4, 1, 24, 4, 4, 17, 6, 11, 4, 'No'),
(39, 'Travel_Frequently', 93, 'Research & Development', 0, 2, 'Other', 2, 'Male', 41, 2, 2, 'Sales Executive', 4, 'Divorced', 13619, 21521, 4, 'No', 18, 1, 2, 1, 18, 4, 2, 17, 5, 2, 11, 'No'),
(21, 'Travel_Frequently', 85, 'Sales', 23, 1, 'Technical Degree', 3, 'Male', 37, 4, 2, 'Manufacturing Director', 3, 'Divorced', 6696, 16005, 2, 'Yes', 11, 2, 2, 2, 16, 3, 1, 6, 7, 6, 10, 'No'),
(38, 'Travel_Rarely', 53, 'Sales', 39, 3, 'Marketing', 1, 'Male', 61, 4, 4, 'Manager', 4, 'Single', 11038, 24919, 1, 'Yes', 21, 1, 1, 2, 14, 4, 3, 2, 14, 5, 0, 'Yes'),
(20, 'Travel_Frequently', 300, 'Sales', 10, 2, 'Medical', 1, 'Male', 40, 1, 2, 'Laboratory Technician', 4, 'Married', 4, 4000, 2, 'No', 60, 3, 1, 1, 30, 2, 2, 43, 20, 5, 10, 'No'),
(39, 'Travel_Frequently', 18, 'Sales', 42, 2, 'Technical Degree', 2, 'Female', 75, 2, 5, 'Healthcare Representative', 4, 'Married', 5878, 22611, 1, 'No', 22, 1, 4, 2, 7, 3, 1, 1, 1, 7, 1, 'Yes'),
(48, 'Travel_Rarely', 57, 'Research & Development', 30, 1, 'Life Sciences', 4, 'Male', 65, 4, 2, 'Manager', 3, 'Single', 10021, 23116, 0, 'No', 23, 1, 1, 4, 12, 1, 2, 16, 1, 2, 5, 'Yes'),
(54, 'Travel_Frequently', 61, 'Research & Development', 5, 5, 'Other', 1, 'Male', 11, 3, 1, 'Research Scientist', 3, 'Married', 7079, 9498, 4, 'Yes', 19, 2, 3, 2, 2, 4, 3, 6, 10, 5, 13, 'No'),
(46, 'Non-Travel', 0, 'Sales', 20, 1, 'Other', 4, 'Female', 21, 3, 3, 'Manager', 2, 'Divorced', 13428, 21523, 5, 'Yes', 22, 2, 4, 2, 9, 0, 2, 2, 3, 12, 7, 'No'),
(53, 'Travel_Rarely', 30, 'Research & Development', 35, 4, 'Medical', 4, 'Male', 85, 1, 5, 'Manager', 4, 'Single', 10209, 21908, 5, 'Yes', 24, 1, 4, 1, 2, 4, 3, 7, 14, 8, 0, 'Yes'),
(51, 'Non-Travel', 58, 'Research & Development', 7, 5, 'Life Sciences', 1, 'Male', 37, 2, 1, 'Laboratory Technician', 1, 'Single', 11407, 6091, 3, 'Yes', 23, 2, 4, 1, 6, 1, 2, 2, 3, 12, 6, 'Yes'),
(43, 'Travel_Frequently', 2, 'Sales', 9, 1, 'Life Sciences', 1, 'Male', 71, 1, 5, 'Sales Executive', 2, 'Divorced', 10287, 9535, 4, 'No', 19, 1, 2, 2, 30, 3, 3, 4, 12, 9, 11, 'Yes'),
(54, 'Travel_Rarely', 35, 'Research & Development', 30, 5, 'Technical Degree', 4, 'Female', 0, 4, 2, 'Manufacturing Director', 4, 'Divorced', 13845, 22116, 5, 'Yes', 23, 2, 4, 2, 31, 2, 2, 3, 12, 10, 13, 'Yes'),
(39, 'Non-Travel', 5, 'Sales', 32, 4, 'Other', 3, 'Male', 12, 2, 3, 'Laboratory Technician', 1, 'Married', 13366, 10448, 7, 'No', 19, 2, 4, 2, 6, 3, 2, 1, 14, 7, 9, 'Yes'),
(36, 'Travel_Frequently', 92, 'Sales', 23, 1, 'Medical', 4, 'Male', 92, 4, 1, 'Manager', 1, 'Single', 11232, 17422, 2, 'No', 23, 1, 2, 4, 29, 1, 2, 12, 3, 2, 1, 'No'),
(42, 'Travel_Rarely', 50, 'Research & Development', 26, 5, 'Medical', 3, 'Male', 59, 2, 1, 'Sales Executive', 4, 'Single', 13723, 15522, 0, 'No', 16, 2, 3, 2, 36, 2, 4, 7, 9, 14, 0, 'Yes'),
(46, 'Travel_Frequently', 3, 'Research & Development', 6, 4, 'Marketing', 3, 'Male', 82, 1, 3, 'Healthcare Representative', 2, 'Married', 8820, 11269, 3, 'No', 18, 1, 4, 3, 19, 2, 4, 1, 8, 11, 0, 'Yes'),
(43, 'Travel_Rarely', 2, 'Sales', 3, 1, 'Other', 3, 'Female', 46, 1, 5, 'Laboratory Technician', 1, 'Single', 5593, 21946, 0, 'Yes', 18, 2, 2, 2, 18, 1, 4, 5, 1, 6, 0, 'Yes'),
(54, 'Travel_Rarely', 90, 'Sales', 6, 1, 'Technical Degree', 3, 'Male', 13, 4, 4, 'Laboratory Technician', 2, 'Single', 6716, 22818, 8, 'No', 14, 1, 2, 2, 34, 0, 1, 1, 1, 4, 2, 'Yes'),
(38, 'Non-Travel', 75, 'Sales', 11, 2, 'Other', 3, 'Male', 72, 4, 2, 'Laboratory Technician', 1, 'Married', 11392, 14945, 5, 'No', 10, 1, 4, 2, 17, 0, 1, 9, 13, 3, 4, 'Yes'),
(49, 'Travel_Frequently', 68, 'Research & Development', 3, 5, 'Marketing', 1, 'Female', 40, 3, 4, 'Laboratory Technician', 4, 'Divorced', 8190, 21185, 0, 'No', 22, 1, 4, 4, 11, 2, 4, 13, 12, 3, 8, 'No'),
(48, 'Travel_Rarely', 27, 'Sales', 24, 4, 'Other', 1, 'Male', 36, 4, 5, 'Manager', 2, 'Single', 6553, 15350, 1, 'No', 23, 1, 2, 1, 5, 0, 1, 15, 13, 3, 5, 'No'),
(45, 'Travel_Rarely', 64, 'Sales', 49, 3, 'Technical Degree', 3, 'Male', 50, 3, 2, 'Sales Executive', 3, 'Single', 5371, 5611, 0, 'No', 16, 2, 2, 3, 32, 2, 1, 17, 3, 7, 10, 'No'),
(42, 'Travel_Rarely', 40, 'Sales', 48, 1, 'Other', 1, 'Female', 91, 2, 1, 'Healthcare Representative', 1, 'Married', 14109, 5478, 3, 'Yes', 12, 1, 2, 2, 23, 4, 4, 17, 7, 14, 6, 'No'),
(43, 'Travel_Frequently', 67, 'Research & Development', 10, 1, 'Marketing', 4, 'Female', 59, 3, 5, 'Human Resources', 1, 'Married', 5187, 17253, 0, 'No', 24, 1, 2, 4, 36, 1, 4, 2, 4, 14, 1, 'Yes'),
(20, 'Travel_Frequently', 300, 'Sales', 10, 2, 'Medical', 1, 'Male', 40, 1, 2, 'Laboratory Technician', 4, 'Married', 4, 4000, 2, 'No', 60, 3, 1, 1, 30, 2, 2, 43, 20, 5, 10, 'No'),
(53, 'Travel_Frequently', 68, 'Sales', 17, 5, 'Life Sciences', 1, 'Male', 25, 1, 2, 'Sales Representative', 3, 'Married', 6162, 14606, 0, 'Yes', 24, 4, 4, 4, 37, 0, 4, 17, 10, 0, 14, 'Yes'),
(56, 'Travel_Frequently', 30, 'Research & Development', 6, 2, 'Other', 1, 'Female', 66, 4, 5, 'Sales Executive', 2, 'Divorced', 9783, 11313, 1, 'Yes', 16, 4, 3, 1, 39, 0, 1, 10, 9, 6, 6, 'Yes'),
(57, 'Travel_Frequently', 13, 'Research & Development', 15, 4, 'Other', 3, 'Female', 37, 3, 3, 'Sales Executive', 3, 'Divorced', 12409, 6300, 0, 'No', 14, 4, 2, 2, 29, 3, 1, 6, 7, 6, 8, 'Yes'),
(47, 'Non-Travel', 80, 'Sales', 39, 5, 'Other', 3, 'Male', 83, 1, 3, 'Healthcare Representative', 3, 'Divorced', 6257, 5493, 6, 'Yes', 10, 4, 1, 1, 3, 0, 4, 17, 0, 8, 9, 'Yes'),
(61, 'Travel_Rarely', 87, 'Research & Development', 32, 2, 'Life Sciences', 2, 'Female', 97, 3, 3, 'Healthcare Representative', 1, 'Married', 12256, 24145, 5, 'No', 10, 4, 2, 1, 22, 1, 3, 0, 6, 2, 9, 'Yes'),
(59, 'Non-Travel', 65, 'Sales', 12, 5, 'Other', 3, 'Male', 6, 4, 5, 'Manufacturing Director', 1, 'Divorced', 12597, 23600, 3, 'No', 13, 4, 3, 3, 12, 3, 2, 6, 14, 11, 14, 'No'),
(52, 'Travel_Frequently', 96, 'Research & Development', 15, 3, 'Marketing', 3, 'Male', 28, 4, 5, 'Human Resources', 2, 'Married', 10464, 5772, 4, 'Yes', 19, 4, 2, 1, 12, 0, 3, 15, 1, 14, 11, 'Yes'),
(55, 'Travel_Rarely', 75, 'Sales', 39, 5, 'Life Sciences', 1, 'Female', 22, 4, 5, 'Healthcare Representative', 1, 'Married', 14850, 6589, 3, 'Yes', 17, 4, 1, 2, 32, 3, 2, 8, 0, 1, 2, 'Yes'),
(54, 'Travel_Frequently', 86, 'Sales', 24, 3, 'Other', 1, 'Male', 83, 1, 3, 'Sales Executive', 1, 'Single', 10933, 9263, 2, 'Yes', 11, 4, 1, 2, 30, 2, 1, 9, 12, 9, 9, 'No'),
(53, 'Travel_Rarely', 19, 'Research & Development', 29, 3, 'Life Sciences', 4, 'Female', 56, 1, 2, 'Manufacturing Director', 3, 'Divorced', 9910, 22141, 7, 'No', 10, 4, 4, 3, 28, 2, 3, 5, 8, 1, 9, 'No'),
(48, 'Travel_Frequently', 80, 'Sales', 49, 4, 'Medical', 2, 'Male', 60, 3, 2, 'Laboratory Technician', 1, 'Single', 6190, 21128, 6, 'Yes', 21, 4, 1, 2, 21, 1, 1, 7, 10, 4, 6, 'No'),
(57, 'Travel_Frequently', 30, 'Sales', 30, 1, 'Other', 4, 'Female', 60, 4, 3, 'Manager', 4, 'Single', 11595, 7662, 6, 'No', 11, 4, 4, 3, 34, 3, 3, 3, 14, 3, 6, 'Yes'),
(49, 'Travel_Frequently', 40, 'Research & Development', 0, 3, 'Other', 3, 'Male', 2, 1, 5, 'Research Scientist', 4, 'Single', 7046, 13229, 3, 'Yes', 18, 4, 1, 4, 25, 3, 3, 5, 4, 8, 2, 'Yes'),
(46, 'Travel_Frequently', 35, 'Sales', 20, 1, 'Other', 4, 'Male', 68, 2, 2, 'Manager', 1, 'Divorced', 5831, 9517, 7, 'Yes', 24, 4, 3, 4, 17, 3, 4, 7, 3, 2, 0, 'Yes'),
(64, 'Non-Travel', 14, 'Sales', 34, 1, 'Other', 4, 'Male', 31, 4, 3, 'Healthcare Representative', 2, 'Single', 12230, 8096, 5, 'Yes', 24, 4, 2, 1, 3, 1, 1, 0, 8, 13, 11, 'Yes'),
(58, 'Travel_Rarely', 13, 'Sales', 49, 4, 'Life Sciences', 2, 'Female', 7, 3, 3, 'Sales Executive', 3, 'Divorced', 8906, 15908, 4, 'No', 10, 4, 3, 4, 14, 1, 2, 1, 4, 0, 7, 'No'),
(57, 'Travel_Frequently', 0, 'Sales', 48, 4, 'Technical Degree', 2, 'Male', 25, 4, 1, 'Research Scientist', 3, 'Married', 7893, 15320, 6, 'No', 23, 4, 1, 4, 6, 0, 4, 14, 6, 12, 11, 'No'),
(65, 'Travel_Frequently', 45, 'Research & Development', 1, 3, 'Technical Degree', 4, 'Male', 62, 2, 3, 'Human Resources', 4, 'Married', 10655, 5268, 3, 'Yes', 24, 4, 3, 3, 28, 4, 2, 13, 9, 2, 12, 'Yes'),
(46, 'Non-Travel', 88, 'Sales', 28, 3, 'Other', 4, 'Female', 70, 1, 4, 'Research Scientist', 3, 'Single', 5326, 21671, 0, 'Yes', 10, 4, 4, 1, 6, 3, 1, 9, 1, 12, 1, 'No'),
(61, 'Non-Travel', 17, 'Research & Development', 30, 3, 'Marketing', 3, 'Male', 81, 4, 2, 'Human Resources', 4, 'Divorced', 5247, 6872, 3, 'Yes', 13, 4, 2, 1, 6, 3, 1, 15, 4, 4, 7, 'Yes'),
(20, 'Travel_Frequently', 300, 'Sales', 10, 2, 'Medical', 1, 'Male', 40, 1, 2, 'Laboratory Technician', 4, 'Married', 4, 4000, 2, 'No', 60, 3, 1, 1, 30, 2, 2, 43, 20, 5, 10, 'No'),
(20, 'Travel_Frequently', 300, 'Sales', 10, 2, 'Medical', 1, 'Male', 40, 1, 2, 'Laboratory Technician', 4, 'Married', 4, 4000, 2, 'No', 60, 3, 1, 1, 30, 2, 2, 43, 20, 5, 10, 'No'),
(20, 'Travel_Frequently', 300, 'Sales', 10, 2, 'Medical', 1, 'Male', 40, 1, 2, 'Laboratory Technician', 4, 'Married', 4, 4000, 2, 'No', 60, 3, 1, 1, 30, 2, 2, 43, 20, 5, 10, 'No'),
(30, 'Travel_Frequently', 65, 'Research & Development', 44, 3, 'Technical Degree', 1, 'Female', 7, 1, 3, 'Manufacturing Director', 1, 'Single', 10740, 19317, 7, 'No', 11, 5, 3, 1, 14, 1, 1, 10, 7, 0, 8, 'Yes'),
(38, 'Travel_Frequently', 47, 'Sales', 34, 3, 'Other', 3, 'Female', 82, 1, 4, 'Human Resources', 3, 'Divorced', 11222, 5472, 2, 'No', 12, 5, 1, 1, 28, 0, 2, 7, 13, 7, 8, 'No'),
(28, 'Non-Travel', 59, 'Research & Development', 30, 5, 'Marketing', 3, 'Female', 75, 1, 5, 'Manager', 4, 'Married', 6780, 19264, 0, 'No', 10, 5, 4, 2, 26, 4, 2, 10, 4, 0, 1, 'No'),
(21, 'Non-Travel', 51, 'Research & Development', 6, 3, 'Other', 3, 'Female', 55, 2, 3, 'Healthcare Representative', 4, 'Single', 12636, 14216, 0, 'Yes', 15, 5, 1, 3, 2, 2, 1, 17, 2, 5, 5, 'Yes'),
(34, 'Non-Travel', 30, 'Research & Development', 27, 1, 'Other', 2, 'Male', 64, 3, 1, 'Manager', 4, 'Divorced', 5160, 6570, 3, 'No', 16, 5, 3, 1, 33, 4, 4, 12, 8, 14, 1, 'Yes'),
(26, 'Travel_Frequently', 11, 'Sales', 10, 1, 'Other', 1, 'Female', 44, 3, 2, 'Manufacturing Director', 1, 'Divorced', 5918, 12374, 5, 'Yes', 24, 5, 1, 1, 31, 3, 3, 7, 2, 11, 4, 'No'),
(29, 'Travel_Frequently', 93, 'Sales', 26, 5, 'Medical', 1, 'Female', 36, 2, 4, 'Sales Representative', 1, 'Single', 7277, 22065, 5, 'No', 10, 5, 2, 2, 18, 2, 1, 0, 11, 9, 1, 'No'),
(36, 'Non-Travel', 87, 'Research & Development', 16, 2, 'Life Sciences', 4, 'Male', 91, 2, 4, 'Laboratory Technician', 4, 'Divorced', 6681, 7672, 1, 'No', 18, 5, 4, 4, 7, 0, 1, 10, 1, 11, 10, 'No'),
(32, 'Non-Travel', 69, 'Sales', 21, 2, 'Other', 1, 'Female', 80, 4, 4, 'Research Scientist', 4, 'Divorced', 6189, 17690, 7, 'No', 16, 5, 4, 1, 21, 0, 1, 17, 3, 9, 4, 'Yes'),
(35, 'Non-Travel', 2, 'Sales', 21, 5, 'Marketing', 4, 'Female', 28, 4, 1, 'Sales Representative', 2, 'Single', 12953, 9519, 6, 'No', 24, 5, 4, 3, 30, 0, 4, 0, 10, 7, 4, 'No'),
(20, 'Travel_Frequently', 300, 'Sales', 10, 2, 'Medical', 1, 'Male', 40, 1, 2, 'Laboratory Technician', 4, 'Married', 4, 4000, 2, 'No', 60, 3, 1, 1, 30, 2, 2, 43, 20, 5, 10, 'No'),
(20, 'Travel_Rarely', 390, 'Sales', 20, 2, 'Medical', 1, 'Male', 40, 3, 5, 'Sales Executive', 3, 'Married', 4000, 4390, 10, 'Yes', 70, 4, 1, 6000, 45, 5, 1, 20, 30, 10, 20, 'No');

