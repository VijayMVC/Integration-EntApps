CREATE PROCEDURE dbo.make_date_intervals
(@startdate datetime, @enddate datetime)
as 
BEGIN
declare @curStartDate datetime
declare @curEndDate datetime

set @curStartDate = (CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(@startdate)-1),@startdate),101))
set @curEndDate = (SELECT CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(DATEADD(mm,1,@startdate))),
			DATEADD(mm,1,@startdate)),101))

truncate table tmpDateInterval

WHILE datediff(month,@curStartDate, @EndDate) >=0
BEGIN 
INSERT INTO tmpDateInterval(IntervalStartDate, IntervalEndDate) 
	VALUES(@curStartDate, @curEndDate) 
SET @curStartDate = dateAdd(month, 1, @curStartDate) 
SET @curEndDate = dateAdd(month, 1, @curEndDate)
END 

END


