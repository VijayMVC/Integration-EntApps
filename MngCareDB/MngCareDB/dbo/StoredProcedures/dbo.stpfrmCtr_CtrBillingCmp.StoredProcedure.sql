USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[stpfrmCtr_CtrBillingCmp]    Script Date: 09/08/2016 10:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[stpfrmCtr_CtrBillingCmp] (@CtrID int)

as



SELECT     CtrBillingCmpID, CtrBillingCmp_CtrID, CtrBillingCmpName, CtrBillingCmpEffectiveDate, CtrBillingCmpExpirationDate
FROM         tblCtrBillingCmp
where (CtrBillingCmp_CtrID = @CtrID)
order by CtrBillingCmpEffectiveDate desc
GO
