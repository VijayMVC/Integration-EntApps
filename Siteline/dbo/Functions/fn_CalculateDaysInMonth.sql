-- =============================================
-- Author:		Owen Kennedy
-- Create date: 2016-02-10
-- Description:	calulate number of days in month
-- =============================================
CREATE FUNCTION dbo.fn_CalculateDaysInMonth(@InputDate datetime)

RETURNS   int
AS
BEGIN
	return  DAY(DATEADD(ms,-2,DATEADD(MONTH, DATEDIFF(MONTH,0,@InputDate)+1,0)))

END
