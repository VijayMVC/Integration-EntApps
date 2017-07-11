USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[stpfrmCtr_Box33]    Script Date: 09/08/2016 10:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[stpfrmCtr_Box33] @CtrID int

as

SELECT     Box33ID, Box33_CtrID, Box33Name, Box33Address1, Box33Address2, Box33City, Box33State, Box33Zip, Box33NPI, Box33EffectiveDate, Box33ExpirationDate, 
                      Box33Comment, Box33TaxID, Box33Phone, Box33ZipPlus4
FROM         tblBox33
WHERE     (Box33_CtrID = @CtrID)
ORDER BY Box33EffectiveDate DESC

/*
SELECT     BllCmpID, BllCmpName, BllCmpIRSName, BllCmpAddress1, BllCmpAddress2, BllCmpCity, BllCmpState, BllCmpZip, BllCmpZipExt, BllCmpTaxID, BllCmpNPI, 
                      BllCmpExpirationDate, BllCmpEffectiveDate, BllCmp_CtrID
FROM         tblBllCmp
WHERE     (BllCmpID = @CtrID)
ORDER BY BllCmpName DESC
*/
GO
