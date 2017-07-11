
CREATE Procedure dbo.stpUpdatePaHoursSitelineRecalc
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@Dte datetime

As

UPDATE tblStt 
SET  tblStt.SttPAhoursQty = 0
			WHERE tblStt.SttDate = @Dte

UPDATE tblStt 
SET  tblStt.SttPAhoursQty =vwPaData.SumOfLbrTotalHours
			FROM vwPaData INNER JOIN tblStt ON (vwPaData.CtrID = tblStt.Stt_CtrID) AND (vwPaData.Date =  tblStt.SttDate)
			WHERE vwPaData.Date = @Dte
return




