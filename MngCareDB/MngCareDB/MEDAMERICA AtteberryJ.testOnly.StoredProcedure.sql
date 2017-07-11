USE [MngCarDB]
GO
/****** Object:  StoredProcedure [MEDAMERICA\AtteberryJ].[testOnly]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [MEDAMERICA\AtteberryJ].[testOnly]
AS
	/* SET NOCOUNT ON */


;with LastCommentDates
as
(
	select max(MngCarJrnDate) MngCarJrnDate, MngCarJrn_MngCarID
	from dbo.tblMngCarJrn 
	where MngCarJrnSubject ='Billing Issue'
	group by MngCarJrn_MngCarID


)
, LastBillingComments
as 
(
	SELECT J.MngCarJrn_MngCarID, J.MngCarJrnDate, J.MngCarJrnComment
	
	FROM dbo.tblMngCarJrn J
	Inner join LastCommentDates D on D.MngCarJrn_MngCarID = J.MngCarJrn_MngCarID 
		and D.MngCarJrnDate = J.MngCarJrnDate
), BillingRates
as
(
	SELECT      R1.MngCarRatID, R1.MngCarRat_MngCarID, R1.MngCarRat_RatTypID, R1.MngCarRatRate, 
                                                      R1.MngCarRatRateType, R1.MngCarRatComment, R1.MngCarRatLesserBilledYN, 
                                                      R1.MngCarRatFeeScheduleFileYN, R1.MngCarRatConversionFactorYN, R1.MngCarRatStartDate, 
                                                      R1.MngCarRatEndDate
                              FROM           dbo.tblMngCarRat AS R1 LEFT OUTER JOIN
                                                      dbo.tblMngCarRat AS R2 ON R1.MngCarRat_MngCarID = R2.MngCarRat_MngCarID AND 
                                                      R1.MngCarRatStartDate < R2.MngCarRatStartDate
                              WHERE       (R2.MngCarRatID IS NULL)

)
SELECT      Rates.MngCarRatID, Rates.MngCarRat_MngCarID, Rates.MngCarRat_RatTypID, Rates.MngCarRatRate, 
                        Rates.MngCarRatRateType, Rates.MngCarRatComment, Rates.MngCarRatLesserBilledYN, 
                        Rates.MngCarRatFeeScheduleFileYN, Rates.MngCarRatConversionFactorYN, Rates.MngCarRatStartDate, 
                        Rates.MngCarRatEndDate, Rates.MngCarRatRate AS Expr1, Rates.MngCarRatRateType AS Expr2, 
                        Rates.MngCarRatComment AS Expr3, Rates.MngCarRatLesserBilledYN AS Expr4, 
                        Rates.MngCarRatFeeScheduleFileYN AS Expr5, Rates.MngCarRatConversionFactorYN AS Expr6, 
                        Rates.MngCarRatStartDate AS Expr7, Rates.MngCarRatEndDate AS Expr8, M.MngCarID, M.MngCarKey, 
                        M.MngCar_CtrID, M.MngCarIPA_CmpID, M.MngCarBill_CmpID, M.MngCar_CntID, 
                        M.MngCar_RatTypID, M.MngCar_LivTypID, M.MngCar_McCtrTypID, M.MngCar_FeeSchRgnID, 
                        M.MngCar_FeeSchYrID, M.MngCar_MngCarRgnID, M.MngCarPayer_CmpID, 
                        M.MngCarOther_CmpID, M.MngCarAppealPDR_CmpID, M.MngCarContracting_CmpID, 
                        M.MngCarBilling_CmpID, M.MngCarOvPayRfnd_CmpID, M.MngCarAlternativeName, 
                        M.MngCarContractType, M.MngCarPHO_CmpID, M.MngCarMSO_CmpID, M.MngCarEffectDate, 
                        M.MngCarUnsignedYN, M.MngCarClientSignDate, M.MngCarIPASignDate, M.MngCarAutoRenewYN, 
                        M.MngCarTerminateDate, M.MngCarRateExpireDate, M.MngCarRenewNoteDaysQty, 
                        M.MngCarTermNoCauseDaysQt, M.MngCarTermWithCauseDaysQty, M.MngCarComment, 
                        M.MngCarInactiveYN, M.MngCarFlagYN, M.MngCarCaseRateLesserYN, 
                        M.MngCarPctChargeLesserYN, M.MngCarHoldHarmlessYN, M.MngCarCMSYN, M.MngCarCPTYN, 
                        M.MngCarReimbGuideOtherYN, M.MngCarInPatientRateYN, M.MngCarUCRateYN, 
                        M.MngCarContractURL, M.MngCarAnniversaryDate, M.MngCarCID, M.MngCarTIN, 
                        M.MngCarInPatientRateDesc, M.MngCarUCRateDesc, M.MngCarReciprocityYN, 
                        M.MngCarTerminatedYN, M.MngCarClmSubDayQty, M.MngCarNoticeDate, M.MngCarReviewDate, 
                        M.MngCarMedicaidMedicalYN, M.MngCarAmmendmentDaysQty, M.MngCarMBSIContractID, 
                        M.MngCarOvrPay, M.MngCarPymnt, M.MngCarCoPayYN, M.MngCarPrAthYN, 
                        M.MngCarCrdReqYN, M.MngCarDlgCrdYN, M.MngCarBillingProblemYN, M.MngCarPayerName, 
                        M.MngCarPayerEmail, M.MngCarOtherName, M.MngCarOtherEmail, M.MngCarAppealPDRName, 
            M.MngCarAppealPDREmail, M.MngCarContractingName, M.MngCarContractingEmail, 
                        M.MngCarBillingName, M.MngCarBillingEmail, M.MngCarOvPayRfndName, 
                        M.MngCarOvPayRfndEmail, M.MngCarCntNegDateRange, M.MngCarCntNegAnnualVisits, 
                        M.MngCarCntNegAvgAcuity, M.MngCarCntNegAvgAllowable, M.MngCarCntNegAvgCharges, 
                        M.MngCarCntNegExpReimb, M.MngCarCntNegFinImpact, M.MngCarCntNegLstReviewed, 
                        M.MngCarPAReductionYN, M.MngCarExecutedOnFileYN, M.MngCarContractedYN, 
                        M.MngCarApplDsptDays, M.MngCarPayerCmpAddress1, M.MngCarPayerCmpAddress2, 
                        M.MngCarPayerCmpCity, M.MngCarPayerCmpState, M.MngCarPayerCmpZip, 
                        M.MngCarPayerCmpPhone, M.MngCarPayerCmpFax, M.MngCarPayerCntPhone, 
                        M.MngCarOtherCmpAddress1, M.MngCarOtherCmpCity, M.MngCarOtherCmpState, 
                        M.MngCarOtherCmpZip, M.MngCarOtherCmpPhone, M.MngCarOtherCmpFax, 
                        M.MngCarOtherCntPhone, M.MngCarAppealPDRCmpAddress1, M.MngCarAppealPDRCmpCity, 
                        M.MngCarAppealPDRCmpState, M.MngCarAppealPDRCmpZip, M.MngCarAppealPDRCmpPhone, 
      M.MngCarAppealPDRCmpFax, M.MngCarAppealPDRCntPhone, M.MngCarContractingCmpAddress1, 
                        M.MngCarContractingCmpCity, M.MngCarContractingCmpState, M.MngCarContractingCmpZip, 
                        M.MngCarContractingCmpPhone, M.MngCarContractingCmpFax, M.MngCarContractingCntPhone, 
                        M.MngCarBillingCmpAddress1, M.MngCarBillingCmpCity, M.MngCarBillingCmpState, 
                        M.MngCarBillingCmpZip, M.MngCarBillingCmpPhone, M.MngCarBillingCmpFax, 
                        M.MngCarBillingCntPhone, M.MngCarOvPayRfndCmpAddress1, M.MngCarOvPayRfndCmpCity, 
                        M.MngCarOvPayRfndCmpState, M.MngCarOvPayRfndCmpZip, M.MngCarOvPayRfndCmpPhone, 
                        M.MngCarOvPayRfndCmpFax, M.MngCarOvPayRfndCntPhone, M.MngCarSpecialty, 
                        M.MngCarSpecialty2, M.MngCarDBA AS LivTypName, dbo.tlkpLiv.LivTypName AS Expr9, 
                        M.MngCarKey AS Expr10
	     ,   C.MngCarJrnComment LastBillingComments
	  FROM         ( dbo.tblMngCar M 
		INNER JOIN BillingRates AS Rates ON M.MngCarID = Rates.MngCarRat_MngCarID
		 INNER JOIN dbo.tlkpLiv ON M.MngCar_LivTypID = dbo.tlkpLiv.LivTypID)
	left join LastBillingComments C on C.MngCarJrn_MngCarID = M.MngCarID
where m.mngcarid =3197
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AlternateBackThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'MEDAMERICA\AtteberryJ', @level1type=N'PROCEDURE',@level1name=N'testOnly'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DatasheetForeThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'MEDAMERICA\AtteberryJ', @level1type=N'PROCEDURE',@level1name=N'testOnly'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DatasheetGridlinesThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'MEDAMERICA\AtteberryJ', @level1type=N'PROCEDURE',@level1name=N'testOnly'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'MEDAMERICA\AtteberryJ', @level1type=N'PROCEDURE',@level1name=N'testOnly'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=N'([testOnly].[MngCarRat_MngCarID]=3197)' , @level0type=N'SCHEMA',@level0name=N'MEDAMERICA\AtteberryJ', @level1type=N'PROCEDURE',@level1name=N'testOnly'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'MEDAMERICA\AtteberryJ', @level1type=N'PROCEDURE',@level1name=N'testOnly'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'MEDAMERICA\AtteberryJ', @level1type=N'PROCEDURE',@level1name=N'testOnly'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'MEDAMERICA\AtteberryJ', @level1type=N'PROCEDURE',@level1name=N'testOnly'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'MEDAMERICA\AtteberryJ', @level1type=N'PROCEDURE',@level1name=N'testOnly'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'MEDAMERICA\AtteberryJ', @level1type=N'PROCEDURE',@level1name=N'testOnly'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'MEDAMERICA\AtteberryJ', @level1type=N'PROCEDURE',@level1name=N'testOnly'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=0 , @level0type=N'SCHEMA',@level0name=N'MEDAMERICA\AtteberryJ', @level1type=N'PROCEDURE',@level1name=N'testOnly'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ThemeFontIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'MEDAMERICA\AtteberryJ', @level1type=N'PROCEDURE',@level1name=N'testOnly'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'MEDAMERICA\AtteberryJ', @level1type=N'PROCEDURE',@level1name=N'testOnly'
GO
