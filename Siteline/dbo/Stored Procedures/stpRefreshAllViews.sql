CREATE PROCEDURE dbo.stpRefreshAllViews
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
AS

--SELECT DISTINCT 'EXEC sp_refreshview ''' + name + '''' FROM   dbo.sysobjects  WHERE type = 'V' 

DECLARE @DatabaseObject varchar(255)DECLARE ObjectCursor CURSORFOR SELECT table_name FROM information_schema.tables WHERE table_type ='view'OPEN ObjectCursorFETCH NEXT FROM ObjectCursor INTO @DatabaseObjectWHILE @@FETCH_STATUS = 0BEGINEXEC sp_refreshview @DatabaseObjectPrint @DatabaseObject + ' was successfully refreshed.'FETCH NEXT FROM ObjectCursor INTO @DatabaseObjectENDCLOSE ObjectCursorDEALLOCATE ObjectCursor--GO


	/* SET NOCOUNT ON */
	RETURN 





