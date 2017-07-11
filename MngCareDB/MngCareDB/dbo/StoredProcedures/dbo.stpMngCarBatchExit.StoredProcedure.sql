USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[stpMngCarBatchExit]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stpMngCarBatchExit]
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
AS
--DELETE FROM dbo.tblTmpMngcar
	
	UPDATE    dbo.tblCtr 
	SET              CtrMngCarBatchYN = 0
	WHERE     (CtrMngCarBatchYN = 1)
	RETURN
GO
