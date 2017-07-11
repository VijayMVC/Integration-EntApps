--Alter Tables.sql
Use MARSStaging
go

Alter table CME_Course ADD [accreditedBy] [VARCHAR](50) NULL
go
Alter table CME_Course ADD [formatOfActivity] [VARCHAR](50) NULL
go
Alter table CME_Course ADD [city] [VARCHAR](50) NULL
go


Alter table CME_SiteCourse ADD [accreditedBy] [VARCHAR](50) NULL
go
Alter table CME_SiteCourse ADD [formatOfActivity] [VARCHAR](50) NULL
go
Alter table CME_SiteCourse ADD [city] [VARCHAR](50) NULL
go
/*
for testing

TRUNCATE TABLE CME_siteCourse;

TRUNCATE TABLE CME_course

SELECT COUNT(*) FROM dbo.CME_course
SELECT * FROM dbo.CME_course
SELECT COUNT(*) FROM dbo.CME_sitecourse
SELECT * FROM dbo.CME_sitecourse
*/

