Create Procedure stpSttLst
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
As
	SELECT tblCnt3.CntID AS Expr3, tblCtr.*, 
    tblCmp6.CmpName AS Expr1, tblCmp1.CmpName AS Site, 
    tblCmp2.CmpName AS System, 
    tblCmp3.CmpName AS TranscriptCompany, 
    tblCmp4.CmpName AS BillingAgent, 
    tblCmp5.CmpName AS PhysicianGroup, 
    tblCmp6.CmpName AS MalpracticeCompany, 
    tblCnt4.CntKey AS Expr2, tblCnt1.CntKey AS MedicalDirector, 
    tblCnt2.CntKey AS CAM, tblCnt3.CntKey AS RegionalDirector, 
    tblCnt4.CntKey AS AssistantDirector, 
    tblCmp1.CmpCity AS SiteCity, tblCmp1.CmpState AS SiteState, 
    tblCmp1.CmpZip AS SiteZip, tblRgn.RgnName AS RgnName, 
    tblCnt2.CntTitle AS CAMTitle, 
    tblCnt2.CntPhonePref AS CAMPhone, tblStt.*
FROM tblCnt tblCnt2 RIGHT OUTER JOIN
    tblStt INNER JOIN
    tblCtr ON tblStt.Stt_CtrID = tblCtr.CtrID ON 
    tblCnt2.CntID = tblCtr.CtrCamAssigned_CntID LEFT OUTER JOIN
    tblCnt tblCnt4 RIGHT OUTER JOIN
    tblRgn ON 
    tblCnt4.CntID = tblRgn.RgnDirAss_CntID LEFT OUTER JOIN
    tblCnt tblCnt3 ON tblRgn.RgnDir_CntID = tblCnt3.CntID ON 
    tblCtr.Ctr_RgnID = tblRgn.RgnID LEFT OUTER JOIN
    tblCnt tblCnt1 ON 
    tblCtr.CtrMedDir_CntID = tblCnt1.CntID LEFT OUTER JOIN
    tblCnt ON 
    tblCtr.CtrMedDir_CntID = tblCnt4.CntID LEFT OUTER JOIN
    tblCmp tblCmp6 ON 
    tblCtr.CtrMlp_CmpID = tblCmp6.CmpID LEFT OUTER JOIN
    tblCmp tblCmp5 ON 
    tblCtr.CtrPhyGrp_CmpID = tblCmp5.CmpID LEFT OUTER JOIN
    tblCmp tblCmp4 ON 
    tblCtr.CtrBillAgt_CmpID = tblCmp4.CmpID LEFT OUTER JOIN
    tblCmp tblCmp3 ON 
    tblCtr.CtrTranscript_CmpID = tblCmp3.CmpID LEFT OUTER JOIN
    tblCmp tblCmp2 ON 
    tblCtr.CtrSys_CmpID = tblCmp2.CmpID LEFT OUTER JOIN
    tblCmp tblCmp1 ON 
    tblCtr.CtrSite_CmpID = tblCmp1.CmpID LEFT OUTER JOIN
    tblCmp ON tblCtr.CtrSite_CmpID = tblCmp6.CmpID
	return 

