USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[stpfrmCtr_Address]    Script Date: 09/08/2016 10:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[stpfrmCtr_Address] (@CmpID int)

as



SELECT     CmpAddress1, CmpAddress2, CmpCity, CmpState, CmpZip, CmpCountry, CmpPhone, 
	CmpFax, CmpWeb, CmpCounty, CmpName, CmpDBAName, CmpZipPlus4
FROM         tblSitelineCmp
WHERE     (CmpID = @CmpID)


/* Changed 120911

SELECT     CmpAddress1, CmpAddress2, CmpCity, CmpState, CmpZip, CmpCountry, CmpPhone, CmpFax, CmpWeb, CmpCounty
FROM         tblSitelineCmp
WHERE     (CmpID = @CmpID)

*/
GO
