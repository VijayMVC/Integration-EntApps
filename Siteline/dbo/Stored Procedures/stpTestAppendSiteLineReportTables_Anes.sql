
-- =============================================
-- Author:		Owen Kennedy
-- Create date: 2011-11-30
-- Description:	For 
-- =============================================
CREATE PROCEDURE [dbo].[stpTestAppendSiteLineReportTables_Anes]
As
Declare @rptStartDate as varchar(30)
Declare @rptEndDate as varchar(30)
Declare @SQL1 as varchar(500)

-- Set Date Intervals using Dat parameters
set @rptStartDate = (select startDate from tlkpSiteLineRptParam)
set @rptEndDate = (select EndDate from tlkpSiteLineRptParam)

truncate table tblStandard_Anes_SiteLine_Report
truncate table   tblAnes_Annual_Budget_Report


--  Get 1 - month Intervals of from start to end date 
set @SQL1 = 'make_date_intervals '+char(39)+@rptStartDate+char(39)+','+char(39)+@rptEndDate+char(39)
Exec (@SQL1)


-- Run Report for each month in interval table
DECLARE interval_list CURSOR FOR
	SELECT IntervalStartDate FROM tmpDateInterval
DECLARE @interval_item varchar(100)
declare @SQL2 varchar(500)
					



/* Append Standard Siteline reports */
OPEN interval_list 
FETCH NEXT FROM interval_list INTO @interval_item
WHILE @@FETCH_STATUS = 0
BEGIN
	
	
	set @SQL2 = 'stpAppendStandard_Anes_SiteLine_Report '+char(39)+@interval_item+char(39)
	print @SQL2
	exec (@SQL2) 
	
	FETCH NEXT FROM interval_list INTO @interval_item
END
 

/* Append Annual Budget reports */
exec stpAppendAnes_Annual_Budget_Report 


close interval_list
Deallocate interval_list




