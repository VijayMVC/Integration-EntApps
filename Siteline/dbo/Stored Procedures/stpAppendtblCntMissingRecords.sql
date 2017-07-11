CREATE Procedure [dbo].[stpAppendtblCntMissingRecords]

As

--Updates tblCnt and imports mssing doctors identified by having SitelineLawsoneID = null


 insert into tblCnt (CntNameFirst, CntNameLast,CntLawsonNumber, Cntkey )
    select [LawsonFirstName] , [LawsonLastName],[LawsonEmpNo] ,ltrim(rtrim([LawsonLastName])) + ', '+ltrim(rtrim([LawsonFirstName]))
  from [SiteLineLawsonID] left OUTER JOIN tblCnt on cntLawsonNumber = [LawsonEmpNo]
  where   cntLawsonNumber is null
  	
  	


/*

 insert into tblCnt (CntNameFirst, CntNameLast,CntLawsonNumber, Cntkey )
    select [LawsonFirstName] , [LawsonLastName],[LawsonEmpNo] ,ltrim(rtrim([LawsonLastName])) + ', '+ltrim(rtrim([LawsonFirstName]))
  from [SiteLineLawsonID] left OUTER JOIN tblCnt on cntLawsonNumber = [LawsonEmpNo]
  where   /*(SiteLineCntID is null OR SiteLineCntID = '') and */ cntLawsonNumber is null
  	
  	
*/
  	/*
  	
 insert into tblCnt (CntNameFirst, CntNameLast,CntLawsonNumber, Cntkey )
    select [LawsonFirstName] , [LawsonLastName],[LawsonEmpNo] ,ltrim(rtrim([LawsonLastName])) + ', '+ltrim(rtrim([LawsonFirstName]))
  from [SiteLineLawsonID] 
  where   SiteLineCntID is null
  	and [LawsonEmpNo] not in (select distinct cntLawsonNumber  from tblCnt)
  	*/

  





