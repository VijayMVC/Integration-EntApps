CREATE Procedure stpChart1
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@StartDate datetime,
@EndDate datetime

As
/*
	SELECT SttDate AS Expr4, SUM(SttCashARAmt) 
    AS SumOfSttCashARAmt, SUM(SttPstChgs) 
    AS SumOfSttPstChgs, STR({ fn MONTH(SttDate) }) 
    + '/' + STR({ fn YEAR(SttDate) }) AS Expr1, Site
FROM dbo.vwStt
WHERE (SttDate >= CONVERT(DATETIME, '2001-01-01 00:00:00', 
    102) AND SttDate <= CONVERT(DATETIME, 
    '2002-01-01 00:00:00', 102))
GROUP BY SttDate, { fn YEAR(SttDate) 
    } * 12 + { fn MONTH(SttDate) } - 1, STR({ fn MONTH(SttDate) }) 
    + '/' + STR({ fn YEAR(SttDate) }), Site*/

SELECT SttDate AS Expr4, SUM(SttCashARAmt) 
    AS SumOfSttCashARAmt, SUM(SttPstChgs) 
    AS SumOfSttPstChgs, STR({ fn MONTH(SttDate) }) 
    + '/' + STR({ fn YEAR(SttDate) }) AS Expr1, Site
FROM dbo.vwStt
WHERE (SttDate >=  @StartDate AND SttDate <= @EndDate)

GROUP BY SttDate, { fn YEAR(SttDate) 
    } * 12 + { fn MONTH(SttDate) } - 1, STR({ fn MONTH(SttDate) }) 
    + '/' + STR({ fn YEAR(SttDate) }), Site

	return 

