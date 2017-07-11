CREATE Procedure dbo.stpUpdatePAHoursSiteline
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
As

UPDATE tblStt 
SET  tblStt.SttPAhoursQty = tblPATotalsCtr.SumOfLbrTotalHours
			FROM tblPATotalsCtr INNER JOIN tblStt ON (tblPATotalsCtr.CtrID = tblStt.Stt_CtrID) AND (tblPATotalsCtr.Date =  tblStt.SttDate)
return 

