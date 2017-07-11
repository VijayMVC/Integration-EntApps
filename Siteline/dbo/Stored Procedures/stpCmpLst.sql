CREATE Procedure stpCmpLst
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
    @vCmpKey varchar(200) 
    /*@vCmpID int  = null,
    @vCmpName  varchar(80) = null,
    @vCmpCode varchar(80) = null,
   @vCmpAddress1 varchar(80) = null, 
    @vCmpAddress2 varchar(80) = null, 
    @vCmpState varchar(80) = null,
    @vCmpCity varchar(80) = null,
    @vCmpZip varchar(80) = null, 
    @vCmpCountry varchar(80) = null,
    @vCmpPhone varchar(80) = null, 
    @vCmpFax varchar(80) = null,
    @vCmpWeb varchar(80) = null, 
    @vCmpSiteBedNo int = null, 
    @vCmpPhyGrpYN bit = null, 
    @vCmpSysYN bit = null,
    @vCmpSiteYN bit = null, 
    @vCmpBillAgentYN bit = null, 
    @vCmpMalCarYN bit = null, 
    @vCmpOtherYN bit = null, 
    @vCmpTranscriptYN bit = null, 
    @vCmpComment text = null, 
    @vCmpInactiveYN bit = null, 
   @vCmpFlagYN bit = null */
As
SELECT CmpKey AS CmpKey, CmpID AS CmpID, 
    CmpName AS CmpName, CmpCode AS CmpCode, 
    CmpAddress1 AS CmpAddress1, 
    CmpAddress2 AS CmpAddress2, CmpCity AS CmpCity, 
    CmpState AS CmpState, CmpZip AS CmpZip, 
    CmpCountry AS CmpCountry, CmpPhone AS CmpPhone, 
    CmpFax AS CmpFax, CmpWeb AS CmpWeb, 
    CmpSiteBedNo AS CmpSiteBedNo, 
    CmpPhyGrpYN AS CmpPhyGrpYN, 
    CmpSysYN AS CmpSysYN, CmpSiteYN AS CmpSiteYN, 
    CmpBillAgentYN AS CmpBillAgentYN, 
    CmpMalCarYN AS CmpMalCarYN, 
    CmpOtherYN AS CmpOtherYN, 
    CmpTranscriptYN AS CmpTranscriptYN, 
    CmpComment AS CmpComment, 
    CmpDateCreate AS CmpDateCreate, 
    CmpDateEdit AS CmpDateEdit, 
    CmpDateInactive AS CmpDateInactive, 
    CmpInactiveYN AS CmpInactiveYN, 
    CmpFlagYN AS CmpFlagYN
FROM tblCmp
     WHERE (CmpKey = @vCmpKey) /*AND (CmpID =@vCmpID) AND (CmpName = @CmpName) AND 
    (CmpCode = @CmpCode) AND (CmpAddress1 = @CmpAddress1) AND 
    (CmpAddress2 = @CmpAddress2) AND (CmpCity = @CmpCity) AND (CmpState = @CmpState) 
    AND (CmpZip = @CmpZip) AND (CmpCountry = @CmpCountry) AND 
    (CmpPhone = @CmpPhone) AND (CmpFax =@CmpFax) AND (CmpWeb = @CmpWeb) AND 
    (CmpSiteBedNo = @CmpSiteBedNo) AND (CmpPhyGrpYN =@CmpPhyGrpYN) AND 
    (CmpSysYN = @CmpSysYN) AND (CmpSiteYN = @CmpSiteYN) AND 
    (CmpBillAgentYN = @CmpBillAgentYN ) AND (CmpMalCarYN = @CmpMalCarYN) AND 
    (CmpOtherYN = @CmpOtherYN) AND (CmpTranscriptYN = @CmpTranscriptYN) AND 
    (CmpComment LIKE @CmpComment) AND 
    (CmpInactiveYN = @CmpInactiveYN) AND (CmpFlagYN = @CmpFlagYN)	*/
/* set nocount on */
	return 






