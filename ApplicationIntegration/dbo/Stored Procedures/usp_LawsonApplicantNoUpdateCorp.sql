
CREATE        PROCEDURE [dbo].[usp_LawsonApplicantNoUpdateCorp] 
AS

/* 	Author: 	Reetika Singh
	Date:		2/2/2011
	Purpose:	Load new hires into Lawson using PA31 for Corp Populations
	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN

	UPDATE dbo.LawsonNewHireEntryCorporate
	SET ApplicantNo = APPLICANT
	FROM LawsonNewApplicant
	WHERE LawsonNewHireEntryCorporate.SSNFormatted 
			= REPLACE(LawsonNewApplicant.FICA_NBR, '-', '')

--Also update the inquire fields after PA32 HIRE in Lawson

	UPDATE LawsonNewHireEntryCorporate
	SET LawsonNewHireEntryCorporate.FLD_NBR_01 = LawsonNewHireInquire.FLD_NBR_01 , 
	LawsonNewHireEntryCorporate.FLD_NBR_02 = LawsonNewHireInquire.FLD_NBR_02, 
	LawsonNewHireEntryCorporate.FLD_NBR_03 = LawsonNewHireInquire.FLD_NBR_03, 
	LawsonNewHireEntryCorporate.FLD_NBR_04 = LawsonNewHireInquire.FLD_NBR_04, 
	LawsonNewHireEntryCorporate.FLD_NBR_05 = LawsonNewHireInquire.FLD_NBR_05, 
	LawsonNewHireEntryCorporate.FLD_NBR_06 = LawsonNewHireInquire.FLD_NBR_06, 
	LawsonNewHireEntryCorporate.FLD_NBR_07 = LawsonNewHireInquire.FLD_NBR_07, 
	LawsonNewHireEntryCorporate.FLD_NBR_08 = LawsonNewHireInquire.FLD_NBR_08, 
	LawsonNewHireEntryCorporate.FLD_NBR_09 = LawsonNewHireInquire.FLD_NBR_09, 
	LawsonNewHireEntryCorporate.FLD_NBR_10 = LawsonNewHireInquire.FLD_NBR_10, 	
	LawsonNewHireEntryCorporate.FLD_NBR_11 = LawsonNewHireInquire.FLD_NBR_11, 
	LawsonNewHireEntryCorporate.FLD_NBR_12 = LawsonNewHireInquire.FLD_NBR_12, 
	LawsonNewHireEntryCorporate.FLD_NBR_13 = LawsonNewHireInquire.FLD_NBR_13, 
	LawsonNewHireEntryCorporate.FLD_NBR_14 = LawsonNewHireInquire.FLD_NBR_14, 
	LawsonNewHireEntryCorporate.FLD_NBR_15 = LawsonNewHireInquire.FLD_NBR_15, 
	LawsonNewHireEntryCorporate.FLD_NBR_16 = LawsonNewHireInquire.FLD_NBR_16, 
	LawsonNewHireEntryCorporate.FLD_NBR_17 = LawsonNewHireInquire.FLD_NBR_17, 
	LawsonNewHireEntryCorporate.FLD_NBR_18 = LawsonNewHireInquire.FLD_NBR_18, 
	LawsonNewHireEntryCorporate.FLD_NBR_19 = LawsonNewHireInquire.FLD_NBR_19, 
	LawsonNewHireEntryCorporate.FLD_NBR_20 = LawsonNewHireInquire.FLD_NBR_20, 
	LawsonNewHireEntryCorporate.FLD_NBR_21 = LawsonNewHireInquire.FLD_NBR_21, 
	LawsonNewHireEntryCorporate.FLD_NBR_22 = LawsonNewHireInquire.FLD_NBR_22, 
	LawsonNewHireEntryCorporate.FLD_NBR_23 = LawsonNewHireInquire.FLD_NBR_23, 
	LawsonNewHireEntryCorporate.FLD_NBR_24 = LawsonNewHireInquire.FLD_NBR_24, 
	LawsonNewHireEntryCorporate.FLD_NBR_25 = LawsonNewHireInquire.FLD_NBR_25, 
	LawsonNewHireEntryCorporate.FLD_NBR_26 = LawsonNewHireInquire.FLD_NBR_26, 
	LawsonNewHireEntryCorporate.FLD_NBR_27 = LawsonNewHireInquire.FLD_NBR_27, 
	LawsonNewHireEntryCorporate.FLD_NBR_28 = LawsonNewHireInquire.FLD_NBR_28, 
	LawsonNewHireEntryCorporate.FLD_NBR_29 = LawsonNewHireInquire.FLD_NBR_29, 
	LawsonNewHireEntryCorporate.FLD_NBR_30 = LawsonNewHireInquire.FLD_NBR_30, 
	LawsonNewHireEntryCorporate.FLD_NBR_31 = LawsonNewHireInquire.FLD_NBR_31, 
	LawsonNewHireEntryCorporate.FLD_NBR_32 = LawsonNewHireInquire.FLD_NBR_32, 
	LawsonNewHireEntryCorporate.FLD_NBR_33 = LawsonNewHireInquire.FLD_NBR_33, 
	LawsonNewHireEntryCorporate.FLD_NBR_34 = LawsonNewHireInquire.FLD_NBR_34, 
	LawsonNewHireEntryCorporate.FLD_NBR_35 = LawsonNewHireInquire.FLD_NBR_35, 
	LawsonNewHireEntryCorporate.FLD_NBR_36 = LawsonNewHireInquire.FLD_NBR_36
	FROM dbo.LawsonNewHireInquire





	DECLARE @AppNo VARCHAR(9)


	SET @AppNo = '000000000'


	UPDATE LawsonNewHireEntryCorporate
	SET [_f296:_HK] = '0100' + 
			  RIGHT(@AppNo + LTRIM(RTRIM([ApplicantNo])), 9) +
			  'HIRE%20%20%20%20%20%20' + EffectiveDate



	
	----Create DME file for PA52 for upload using PFI
	Exec usp_LawsonNewHireEntry_PA52DMECorp
			  
	
	

END

