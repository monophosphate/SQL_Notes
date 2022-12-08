/*

This is an example of a Stored Procedure. It can be found by navgating to '/Programmability/Stored Procedures/..' and selecting "Modify" on the stored procedure file.

*/


USE [SQL Tutorial]
GO
/****** Object:  StoredProcedure [dbo].[Temp_Employee]    Script Date: 12/7/2022 9:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[Temp_Employee] -- ALTER PROCEDURE allows us to alter the stored procedure.
@JobTitle nvarchar(100) -- INPUT: Add a variable to the procedure.
AS
CREATE TABLE #temp_employee (
	JobTitle varchar(100),
	EmployeesPerJob int,
	AvgAge int,
	AvgSalary int
)

INSERT INTO #temp_employee
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(Salary)
FROM EmployeeDemographics Emp
JOIN EmployeeSalary Sal
	ON Emp.EmployeeID = Sal.EmployeeID
WHERE JobTitle = @JobTitle -- INPUT: This allows us to use the input created above.
GROUP BY JobTitle

SELECT *
FROM #temp_employee