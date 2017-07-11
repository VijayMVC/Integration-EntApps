CREATE Procedure [stprptGraphCollectionsEMail]
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@StartDate datetime,
@EndDate datetime
As
	SELECT DISTINCT 
    Site, SttCashARAmt, SttPstChgs, SttRefAR, SttDate, 
    SttPatVisitQty, SttPtsKeyed
FROM dbo.vwStt
	Where SttDate>=@StartDate AND SttDate<=@EndDate
	return 

