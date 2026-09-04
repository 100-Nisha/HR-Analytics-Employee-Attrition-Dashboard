CREATE DATABASE HR_Analytics;

USE HR_Analytics;

SELECT * FROM  `hr dataset`;

-- Total Records
SELECT COUNT(*) AS TotalEmployees FROM `hr dataset`;

-- Duplicate Employees
SELECT EmployeeNumber, COUNT(*) AS EmployeeCount FROM `hr dataset`
GROUP BY EmployeeNumber
HAVING COUNT(*) > 1;

-- Attrition Categories 
SELECT Attrition, COUNT(*) AS Employees FROM `hr dataset`
GROUP BY Attrition;

-- Total Employees
SELECT COUNT(*) AS TotalEmployees FROM `hr dataset`;

-- Employees Left
SELECT COUNT(*) AS EmployeesLeft FROM `hr dataset`
WHERE Attrition = 'Yes';

-- Attrition Rate
SELECT
ROUND(	
SUM(CASE WHEN Attrition = 'YEs' THEN 1 ELSE 0 END)
* 100.0 / COUNT(*), 2
)AS AttritionRate
FROM `hr dataset`;

-- Department Headcount
SELECT Department, COUNT(*) AS Headcount FROM `hr dataset`
GROUP BY Department
ORDER BY Headcount DESC;

-- Department Attrition
SELECT Department, COUNT(*) AS Employess,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesLeft,
ROUND(
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
*100.0/COUNT(*),2
) AS AttritionRate FROM `hr dataset`
GROUP BY Department
ORDER BY AttritionRate DESC;

-- Overtime and Attrition
SELECT OverTime, COUNT(*) AS Employees,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesLeft, 
ROUND(
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
*100.0/COUNT(*),2
) AS AttritionRate FROM `hr dataset`
GROUP BY OverTime;

