USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[stpCtr]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[stpCtr]
/*
	(
Stored Procedure for frmCtr
	)
*/
@CtrID int
As

If @CtrID =1
	Select tblCtr.* , (select CtrBillingCmpID  from tblCtrBillingCmp where   CtrID = CtrBillingCmp_CtrID and CtrBillingCmpExpirationDate is  null) as  CtrBillingCmpID
	from tblCt
	Where CtrInactiveYN = 0 
	Order By CtrKey	
Else
	Select tblCtr.* , (select CtrBillingCmpID  from tblCtrBillingCmp where   CtrID = CtrBillingCmp_CtrID and CtrBillingCmpExpirationDate is  null) as  CtrBillingCmpID
	from tblCtr
	Where CtrID = @CtrID
	Order By CtrKey	
return 


/*

If @CtrID =1
	Select tblCtr.* ,   CtrBillingCmpID  
	from tblCtr inner join tblCtrBillingCmp 
		on  CtrID = CtrBillingCmp_CtrID and CtrBillingCmpExpirationDate is  null
	Where CtrInactiveYN = 0 
	Order By CtrKey	
Else
	Select tblCtr.* , CtrBillingCmpID 
	from tblCtr inner join tblCtrBillingCmp 
		on  CtrID = CtrBillingCmp_CtrID and CtrBillingCmpExpirationDate is  null 
	Where CtrID = @CtrID
	Order By CtrKey	
return 


*/


/*

If @CtrID = -1
	Select tblCtr.* from tblCtr Where CtrInactiveYN = 0 
	Order By CtrKey	
Else
	Select tblCtr.* from tblCtr Where CtrID = @CtrID
	Order By CtrKey	
return 

*/
GO
