CREATE PROCEDURE stpUnionAdminType  AS

SELECT CntNameLast,CntNameFirst,CntTitle,CntEmail,CntPhoneWork FROM tblCnt WHERE tblCnt.CntInactiveYN=0 AND tblCnt.CntAdminYN=-1

UNION 

SELECT CntNameLast,CntNameFirst,CntTitle,CntEmail,CntPhoneWork FROM tblCnt WHERE tblCnt.CntInactiveYN=0 AND tblCnt.CntDirEd=-1

UNION 

SELECT CntNameLast,CntNameFirst,CntTitle,CntEmail,CntPhoneWork FROM tblCnt WHERE tblCnt.CntInactiveYN=0 AND tblCnt.CntQIDirYN=-1

UNION 

SELECT CntNameLast,CntNameFirst,CntTitle,CntEmail,CntPhoneWork FROM tblCnt WHERE tblCnt.CntInactiveYN=0 AND tblCnt.CntQIDirYN=-1

UNION 

SELECT CntNameLast,CntNameFirst,CntTitle,CntEmail,CntPhoneWork FROM tblCnt WHERE tblCnt.CntInactiveYN=0 AND tblCnt.CntRegAssYN=-1
