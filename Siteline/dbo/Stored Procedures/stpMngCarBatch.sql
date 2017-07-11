CREATE Procedure dbo.stpMngCarBatch


----New 7/27/2005*********************************************************



(@MngCarIPA_CmpID int,
@MngCar_LivTypID int,
@MngCar_McCtrTypID int,
@MngCarEffectDate datetime,
@MngCarAutoRenewYN bit,
@MngCarRenewNoteDaysQty int,
@MngCarTermNoCauseDaysQt int,
@MngCarTermWithCauseDaysQty int,
@MngCarComment ntext,
@MngCarChargePct float,
@MngCarCFPrimary float,
@MngCarCFMedicine float,
@MngCarCFSurgery float,
@MngCarMedicarePct float,
@MngCarMediCalPct float,
@MngCarCaseRate float,
@MngCar_FeeSchRgnID int,
@MngCar_FeeSchYrID int,
@MngCarFS1Desc nvarchar(25),
@MngCarFS2Desc nvarchar(25),
@MngCarFS3Desc nvarchar(25),
@MngCarCaseRateLesserYN bit,
@MngCarHoldHarmlessYN bit,
@MngCarCMSYN bit,
@MngCarCPTYN bit,
@MngCarReimbGuideOtherYN bit,
@MngCarInPatientRateYN bit,
@MngCarUCRateYN bit,
@MngCarContractURL nvarchar(250),
@MngCarAnniversaryDate datetime,
@MngCarCID varchar(15),
@MngCarInPatientRateDesc nvarchar(250),
@MngCarUCRateDesc nvarchar(250),
@MngCarReciprocityYN Bit,
@MngCarPMPMCapRateAmt Money, 
@MngCarTerminateDate datetime,
@MngCarRateExpireDate datetime,
@MngCarInactiveYN bit,
@MngCarTerminatedYN bit,
@MngCarReviewDate datetime,
@MngCarNoticeDate datetime,
@MngCarMedicaidMedicalYN bit,
@MngCarMisc1YN bit,
@MngCarMisc2YN bit,
@MngCarMisc3YN bit,
@MngCarClmSubDayQty int,
@MngCarFS4Amt float,	
@MngCarFS4Desc varchar(25),	
@MngCarFS5Amt float,	
@MngCarFS5Desc1 varchar(25))

AS 


--Append records to the temporary table revised per La Tasha 4/17/02

INSERT INTO dbo.tblTmpMngcar (tmpMngCar_CtrID)
	SELECT     CtrID
	FROM         dbo.tblCtr
	WHERE     (CtrMngCarBatchYN = 1)


INSERT INTO dbo.tblMngCar
                      (MngCar_CtrID, MngCarIPA_CmpID, MngCar_LivTypID, MngCar_McCtrTypID, MngCarEffectDate, 
                      MngCarAutoRenewYN, MngCarRenewNoteDaysQty, MngCarTermNoCauseDaysQt, 
                      MngCarTermWithCauseDaysQty, MngCarComment, MngCarChargePct, MngCarCFPrimary, MngCarCFMedicine, MngCarCFSurgery, MngCarMedicarePct,
                       MngCarMediCalPct, MngCarCaseRate, MngCarKey, MngCar_FeeSchRgnID, MngCar_FeeSchYrID, MngCarFS1Desc, MngCarFS2Desc, MngCarFS3Desc, 
                      MngCarCaseRateLesserYN,  MngCarHoldHarmlessYN, MngCarCMSYN, MngCarCPTYN, MngCarReimbGuideOtherYN, 
                      MngCarInPatientRateYN, MngCarUCRateYN, MngCarContractURL, MngCarAnniversaryDate, MngCarCID, MngCarInPatientRateDesc, 
                      MngCarUCRateDesc, MngCarReciprocityYN, MngCarPMPMCapRateAmt, MngCarTerminateDate, MngCarRateExpireDate, MngCarInactiveYN, MngCarTerminatedYN, MngCarReviewDate, MngCarNoticeDate, MngCarMedicaidMedicalYN, MngCarMisc1YN, MngCarMisc2YN, MngCarMisc3YN, MngCarClmSubDayQty,
	     MngCarFS4Amt, MngCarFS4Desc, MngCarFS5Amt, MngCarFS5Desc1)
SELECT     tmpMngCar_CtrID, @MngCarIPA_CmpID AS Expr1,  @MngCar_LivTypID AS Expr4, 
                      @MngCar_McCtrTypID AS Expr5, @MngCarEffectDate AS Expr6,  
                      @MngCarAutoRenewYN AS Expr10, @MngCarRenewNoteDaysQty AS Expr11, 
                      @MngCarTermNoCauseDaysQt AS Expr12, @MngCarTermWithCauseDaysQty AS Expr13, @MngCarComment AS Expr14, 
                      @MngCarChargePct AS Expr16, @MngCarCFPrimary AS Expr17, @MngCarCFMedicine AS Expr18, @MngCarCFSurgery AS Expr19, 
                      @MngCarMedicarePct AS Expr20, @MngCarMediCalPct AS Expr21, @MngCarCaseRate AS Expr22, 'temp' AS Expr23, 
                      @MngCar_FeeSchRgnID AS Expr24, @MngCar_FeeSchYrID AS Expr25, @MngCarFS1Desc AS Expr26, @MngCarFS2Desc AS Expr27, 
                      @MngCarFS3Desc AS Expr28, @MngCarCaseRateLesserYN AS Expr29,  
                      @MngCarHoldHarmlessYN AS Expr31, @MngCarCMSYN AS Expr32, @MngCarCPTYN AS Expr33, @MngCarReimbGuideOtherYN AS Expr34, 
                      @MngCarInPatientRateYN AS Expr35, @MngCarUCRateYN AS Expr36, @MngCarContractURL AS Expr37, @MngCarAnniversaryDate AS Expr38, 
                      @MngCarCID AS Expr39, @MngCarInPatientRateDesc AS Expr40, @MngCarUCRateDesc AS Expr41, @MngCarReciprocityYN AS Expr42, 
                      @MngCarPMPMCapRateAmt AS Expr15, @MngCarTerminateDate as ExprXXX, @MngCarRateExpireDate as ab, @MngCarInactiveYN as ac, @MngCarTerminatedYN as ad, @MngCarReviewDate as ae, @MngCarNoticeDate as af, @MngCarMedicaidMedicalYN as aal, @MngCarMisc1YN as ag, @MngCarMisc2YN as ak, @MngCarMisc3YN as al, @MngCarClmSubDayQty as dcf,
  	      @MngCarFS4Amt as wqa, @MngCarFS4Desc as wsd, @MngCarFS5Amt as twd, @MngCarFS5Desc1 as pli
FROM         dbo.tblTmpMngcar





UPDATE dbo.vwMngCar
SET MngCarKey = Site + '/' + IPACmp + '/' + LivTypName + '(' + CAST(DATEPART(m, MngCarEffectDate) AS varchar) + '/' + CAST(DATEPART(d, 
       MngCarEffectDate) AS varchar) + '/' + RIGHT(CAST(DATEPART(yy, MngCarEffectDate) AS varchar), 2) + ' )'
WHERE(MngCarKey LIKE 'temp%')


--Delete tblTmpMngcar
DELETE FROM dbo.tblTmpMngcar

----delete records from temporary table
---taken out 3/6/2006
/*	



	


	UPDATE    dbo.tblCtr 
	SET              CtrMngCarBatchYN = 0
	WHERE     (CtrMngCarBatchYN = 1)
*/

	return 




















