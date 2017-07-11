
CREATE                       PROCEDURE [dbo].[usp_EmployeeDirectoryArchive] AS


--Archives data


INSERT INTO DeptLookupArchive
SELECT *, GETDATE() 
FROM dbo.DeptLookup


INSERT INTO EmployeeBaseArchive 
SELECT * , GETDATE() 
FROM EmployeeBase


INSERT INTO EmployeeSiteBaseArchive
SELECT *, GETDATE()
FROM EmployeeSiteBase







