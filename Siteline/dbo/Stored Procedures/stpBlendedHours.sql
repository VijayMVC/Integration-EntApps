CREATE Procedure stpBlendedHours
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@SttID int

As
Update tblStt
Set SttBlendedHrs = (SttDocHourQty + SttPAHoursQty)
Where SttID = @SttID
	/* set nocount on */
	return 

