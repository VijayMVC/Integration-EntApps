USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[stpAppendMngCar]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[stpAppendMngCar]
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@MngCarPMPMCapRateAmt money,
@MngCarRenewNoteDaysQty int,
@MngCarMediCalPct float,
@MngCarIPA_CmpID int,
@MngCar_CntID int,
@MngCarTermNoCauseDaysQt int,
@MngCarTermWithCauseDaysQty int,
@MngCar_RatTypID int,
@MngCar_LivTypID int,
@MngCar_McCtrTypID int,
@MngCarUnsignedYN bit,
@MngCarClientSignDate datetime,
@MngCarIPASignDate datetime,
@MngCarAutoRenewYN bit,
@MngCarTerminateDate datetime,
@MngCarComment text,
@MngCarCFPrimary float,
@MngCarCFMedicine float,
@MngCarCFSurgery float,
@MngCarMedicarePct float,
@MngCarEffectDate datetime,
@MngCarChargePct float,
@MngCarCaseRate float
As
--Append records to the temporary table revised per La Tasha 4/17/02
INSERT INTO dbo.tblTmpMngcar (tmpMngCar_CtrID)
	SELECT     CtrID
	FROM         dbo.tblCtr
	WHERE     (CtrMngCarBatchYN = 1)
--Per gaby 1/15/2003  allow to have terminate date = null
If  @MngCarTerminateDate = '1/1/1899'
	INSERT INTO [tblMngCar]
    		(MngCar_CtrID, MngCarIPA_CmpID, MngCar_CntID, 
   		 MngCar_RatTypID, MngCar_LivTypID, MngCar_McCtrTypID, 
    		MngCarEffectDate, MngCarUnsignedYN, 
    		MngCarClientSignDate, MngCarIPASignDate, 
    		MngCarAutoRenewYN, 
    		MngCarRenewNoteDaysQty, MngCarTermNoCauseDaysQt, 
    		MngCarTermWithCauseDaysQty, MngCarComment, 
    		MngCarPMPMCapRateAmt, MngCarChargePct, 
    		MngCarCFPrimary, MngCarCFMedicine, MngCarCFSurgery, 
    		MngCarMedicarePct, MngCarMediCalPct, MngCarCaseRate,
    		MngCarKey)
	SELECT tmpMngCar_CtrID, @MngCarIPA_CmpID, 
    		@MngCar_CntID, @MngCar_RatTypID, 
    		@MngCar_LivTypID, @MngCar_McCtrTypID, 
    		@MngCarEffectDate, @MngCarUnsignedYN, 
   		@MngCarClientSignDate, @MngCarIPASignDate, 
    		@MngCarAutoRenewYN, 
    		@MngCarRenewNoteDaysQty, 
   		@MngCarTermNoCauseDaysQt, 
   		@MngCarTermWithCauseDaysQty, @MngCarComment, 
   		@MngCarPMPMCapRateAmt, @MngCarChargePct, 
    		@MngCarCFPrimary, @MngCarCFMedicine, 
    		@MngCarCFSurgery, @MngCarMedicarePct, 
    		@MngCarMediCalPct, @MngCarCaseRate, 'temp' 
	FROM tblTmpMngcar
Else
	INSERT INTO [tblMngCar]
    		(MngCar_CtrID, MngCarIPA_CmpID, MngCar_CntID, 
    		MngCar_RatTypID, MngCar_LivTypID, MngCar_McCtrTypID, 
    		MngCarEffectDate, MngCarUnsignedYN, 
    		MngCarClientSignDate, MngCarIPASignDate, 
    		MngCarAutoRenewYN, MngCarTerminateDate, 
    		MngCarRenewNoteDaysQty, MngCarTermNoCauseDaysQt, 
    		MngCarTermWithCauseDaysQty, MngCarComment, 
    		MngCarPMPMCapRateAmt, MngCarChargePct, 
    		MngCarCFPrimary, MngCarCFMedicine, MngCarCFSurgery, 
    		MngCarMedicarePct, MngCarMediCalPct, MngCarCaseRate,
    		MngCarKey)
	SELECT tmpMngCar_CtrID, @MngCarIPA_CmpID, 
    		@MngCar_CntID, @MngCar_RatTypID, 
    		@MngCar_LivTypID, @MngCar_McCtrTypID, 
    		@MngCarEffectDate, @MngCarUnsignedYN, 
    		@MngCarClientSignDate, @MngCarIPASignDate, 
    		@MngCarAutoRenewYN, @MngCarTerminateDate, 
    		@MngCarRenewNoteDaysQty, 
   		@MngCarTermNoCauseDaysQt, 
   		@MngCarTermWithCauseDaysQty, @MngCarComment, 
   		@MngCarPMPMCapRateAmt, @MngCarChargePct, 
    		@MngCarCFPrimary, @MngCarCFMedicine, 
    		@MngCarCFSurgery, @MngCarMedicarePct, 
    		@MngCarMediCalPct, @MngCarCaseRate, 'temp' 
	FROM tblTmpMngcar
Delete tblTmpMngcar
UPDATE dbo.vwMngCar
SET MngCarKey = Site + '/' + IPACmp + '/' + LivTypName + '(' + CAST(DATEPART(m, MngCarEffectDate) AS varchar) + '/' + CAST(DATEPART(d, 
       MngCarEffectDate) AS varchar) + '/' + RIGHT(CAST(DATEPART(yy, MngCarEffectDate) AS varchar), 2) + ' )'
WHERE(MngCarKey LIKE 'temp%')
----delete records from temporary table
	DELETE FROM dbo.tblTmpMngcar
	
	UPDATE    dbo.tblCtr 
	SET              CtrMngCarBatchYN = 0
	WHERE     (CtrMngCarBatchYN = 1)
	return
GO
