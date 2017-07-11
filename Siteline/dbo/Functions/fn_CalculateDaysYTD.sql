-- =============================================
-- Author:		Owen Kennedy
-- Create date: 2016-02-10
-- Description:	calulate number of days YTD from given date
--		select dbo.[fn_CalculateDaysYTD]( '12/1/2014')
-- =============================================
CREATE FUNCTION [dbo].[fn_CalculateDaysYTD](@InputDate datetime)

RETURNS   int
AS
BEGIN
	return datediff(d, DATEADD(yy, DATEDIFF(yy, 0, @InputDate), 0), DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,@InputDate)+1,0)))
	

END


-- Old: return datediff(d, DATEADD(yy, DATEDIFF(yy, 0, @InputDate), 0), @InputDate)