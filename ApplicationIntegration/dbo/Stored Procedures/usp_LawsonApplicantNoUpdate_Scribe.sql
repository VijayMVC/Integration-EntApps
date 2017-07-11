
CREATE        PROCEDURE [dbo].[usp_LawsonApplicantNoUpdate_Scribe] 
AS

/* 	Author: 	Reetika Singh
	Date:		2/2/2011
	Purpose:	Load new hires into Lawson using PA31
	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN

	UPDATE dbo.LawsonNewHireEntry_Scribe
	SET ApplicantNo = APPLICANT
	FROM LawsonNewApplicant
	WHERE LawsonNewHireEntry_Scribe.SSNFormatted 
			= LawsonNewApplicant.FICA_NBR

--Also update the inquire fields after PA32 HIRE in Lawson

	UPDATE LawsonNewHireEntry_Scribe
	SET LawsonNewHireEntry_Scribe.FLD_NBR_01 = LawsonNewHireInquire.FLD_NBR_01 , 
	LawsonNewHireEntry_Scribe.FLD_NBR_02 = LawsonNewHireInquire.FLD_NBR_02, 
	LawsonNewHireEntry_Scribe.FLD_NBR_03 = LawsonNewHireInquire.FLD_NBR_03, 
	LawsonNewHireEntry_Scribe.FLD_NBR_04 = LawsonNewHireInquire.FLD_NBR_04, 
	LawsonNewHireEntry_Scribe.FLD_NBR_05 = LawsonNewHireInquire.FLD_NBR_05, 
	LawsonNewHireEntry_Scribe.FLD_NBR_06 = LawsonNewHireInquire.FLD_NBR_06, 
	LawsonNewHireEntry_Scribe.FLD_NBR_07 = LawsonNewHireInquire.FLD_NBR_07, 
	LawsonNewHireEntry_Scribe.FLD_NBR_08 = LawsonNewHireInquire.FLD_NBR_08, 
	LawsonNewHireEntry_Scribe.FLD_NBR_09 = LawsonNewHireInquire.FLD_NBR_09, 
	LawsonNewHireEntry_Scribe.FLD_NBR_10 = LawsonNewHireInquire.FLD_NBR_10, 	
	LawsonNewHireEntry_Scribe.FLD_NBR_11 = LawsonNewHireInquire.FLD_NBR_11, 
	LawsonNewHireEntry_Scribe.FLD_NBR_12 = LawsonNewHireInquire.FLD_NBR_12, 
	LawsonNewHireEntry_Scribe.FLD_NBR_13 = LawsonNewHireInquire.FLD_NBR_13, 
	LawsonNewHireEntry_Scribe.FLD_NBR_14 = LawsonNewHireInquire.FLD_NBR_14, 
	LawsonNewHireEntry_Scribe.FLD_NBR_15 = LawsonNewHireInquire.FLD_NBR_15, 
	LawsonNewHireEntry_Scribe.FLD_NBR_16 = LawsonNewHireInquire.FLD_NBR_16, 
	LawsonNewHireEntry_Scribe.FLD_NBR_17 = LawsonNewHireInquire.FLD_NBR_17, 
	LawsonNewHireEntry_Scribe.FLD_NBR_18 = LawsonNewHireInquire.FLD_NBR_18, 
	LawsonNewHireEntry_Scribe.FLD_NBR_19 = LawsonNewHireInquire.FLD_NBR_19, 
	LawsonNewHireEntry_Scribe.FLD_NBR_20 = LawsonNewHireInquire.FLD_NBR_20, 
	LawsonNewHireEntry_Scribe.FLD_NBR_21 = LawsonNewHireInquire.FLD_NBR_21, 
	LawsonNewHireEntry_Scribe.FLD_NBR_22 = LawsonNewHireInquire.FLD_NBR_22, 
	LawsonNewHireEntry_Scribe.FLD_NBR_23 = LawsonNewHireInquire.FLD_NBR_23, 
	LawsonNewHireEntry_Scribe.FLD_NBR_24 = LawsonNewHireInquire.FLD_NBR_24, 
	LawsonNewHireEntry_Scribe.FLD_NBR_25 = LawsonNewHireInquire.FLD_NBR_25, 
	LawsonNewHireEntry_Scribe.FLD_NBR_26 = LawsonNewHireInquire.FLD_NBR_26, 
	LawsonNewHireEntry_Scribe.FLD_NBR_27 = LawsonNewHireInquire.FLD_NBR_27, 
	LawsonNewHireEntry_Scribe.FLD_NBR_28 = LawsonNewHireInquire.FLD_NBR_28, 
	LawsonNewHireEntry_Scribe.FLD_NBR_29 = LawsonNewHireInquire.FLD_NBR_29, 
	LawsonNewHireEntry_Scribe.FLD_NBR_30 = LawsonNewHireInquire.FLD_NBR_30, 
	LawsonNewHireEntry_Scribe.FLD_NBR_31 = LawsonNewHireInquire.FLD_NBR_31, 
	LawsonNewHireEntry_Scribe.FLD_NBR_32 = LawsonNewHireInquire.FLD_NBR_32, 
	LawsonNewHireEntry_Scribe.FLD_NBR_33 = LawsonNewHireInquire.FLD_NBR_33, 
	LawsonNewHireEntry_Scribe.FLD_NBR_34 = LawsonNewHireInquire.FLD_NBR_34, 
	LawsonNewHireEntry_Scribe.FLD_NBR_35 = LawsonNewHireInquire.FLD_NBR_35, 
	LawsonNewHireEntry_Scribe.FLD_NBR_36 = LawsonNewHireInquire.FLD_NBR_36
	FROM dbo.LawsonNewHireInquire





	DECLARE @AppNo VARCHAR(9)


	SET @AppNo = '000000000'


	UPDATE LawsonNewHireEntry_Scribe
	SET [_f296:_HK] = '0100' + 
			  RIGHT(@AppNo + LTRIM(RTRIM([ApplicantNo])), 9) +
			  'HIRE%20%20%20%20%20%20' + EffectiveDate




	
	

END

