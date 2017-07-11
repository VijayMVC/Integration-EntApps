USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[stpfrmCtr_Box32]    Script Date: 09/08/2016 10:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[stpfrmCtr_Box32] (@CtrID int)

as

SELECT     Box32ID, Box32_CtrID, Box32Name, Box32Address, Box32City, Box32State, Box32Zip, Box32ZipPlus4, Box32NPI, Box32EffectiveDate, Box32ExpirationDate, 
                      Box32Comment
FROM         tblBox32
WHERE     (Box32_CtrID = @CtrID)
ORDER BY Box32EffectiveDate DESC
GO
