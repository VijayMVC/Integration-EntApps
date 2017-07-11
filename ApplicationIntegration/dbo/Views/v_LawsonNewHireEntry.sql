
CREATE VIEW [dbo].[v_LawsonNewHireEntry]
AS


SELECT DISTINCT  100 As Company, ProviderMasterID, LastName, FirstName, 
	MiddleInit, MiddleNameOrInitial, Title, PreferredName, 
	PhoneNbr1, Email, Address1, City1, State1, ZipCode1, 
	Country, Ethnicity, Gender, PayRate, AutoDeposit, DateOfBirth, 
	SSNFormatted, ProcessLevel, 
	MIN(DateOfHire) AS DateOfHire , 
	MIN(BenefitDate1) AS BenefitDate1, Min(BenefitDate2) AS BenefitDate2, 
	BenefitSalary1, BenefitSalary2, Pos, PosPL, Status, FTE, 
	MIN(FirstWorkDate) AS FirstWorkDate, MIN(EffectiveDate) AS EffectiveDate, 
	Benefits, AbMgmnt, ReqDeds, 
	PreAssignEmpNo, ApplicantNo, AutoTimeRcd, 
	FLD_NBR_01, FLD_NBR_02, FLD_NBR_03, FLD_NBR_04, FLD_NBR_05, 
	FLD_NBR_06, FLD_NBR_07, FLD_NBR_08, FLD_NBR_09, FLD_NBR_10, 
	FLD_NBR_11, FLD_NBR_12, FLD_NBR_13, FLD_NBR_14, FLD_NBR_15, 
	FLD_NBR_16, FLD_NBR_17, FLD_NBR_18, FLD_NBR_19, FLD_NBR_20, 
	FLD_NBR_21, FLD_NBR_22, FLD_NBR_23, FLD_NBR_24, FLD_NBR_25, 
	FLD_NBR_26, FLD_NBR_27, FLD_NBR_28, FLD_NBR_29, FLD_NBR_30, 
	FLD_NBR_31, FLD_NBR_32, FLD_NBR_33, FLD_NBR_34, FLD_NBR_35, 
	FLD_NBR_36, [_f296:_HK]
FROM         LawsonNewHireEntry
GROUP BY ProviderMasterID, LastName, FirstName, 
	MiddleInit, MiddleNameOrInitial, Title, PreferredName, 
	PhoneNbr1, Email, Address1, City1, State1, ZipCode1, 
	Country, Ethnicity, Gender, PayRate, AutoDeposit, DateOfBirth, 
	SSNFormatted, ProcessLevel, 
	BenefitSalary1, BenefitSalary2, Pos, PosPL, Status, FTE, 
	Benefits, AbMgmnt, ReqDeds, 
	PreAssignEmpNo, ApplicantNo, AutoTimeRcd, 
	FLD_NBR_01, FLD_NBR_02, FLD_NBR_03, FLD_NBR_04, FLD_NBR_05, 
	FLD_NBR_06, FLD_NBR_07, FLD_NBR_08, FLD_NBR_09, FLD_NBR_10, 
	FLD_NBR_11, FLD_NBR_12, FLD_NBR_13, FLD_NBR_14, FLD_NBR_15, 
	FLD_NBR_16, FLD_NBR_17, FLD_NBR_18, FLD_NBR_19, FLD_NBR_20, 
	FLD_NBR_21, FLD_NBR_22, FLD_NBR_23, FLD_NBR_24, FLD_NBR_25, 
	FLD_NBR_26, FLD_NBR_27, FLD_NBR_28, FLD_NBR_29, FLD_NBR_30, 
	FLD_NBR_31, FLD_NBR_32, FLD_NBR_33, FLD_NBR_34, FLD_NBR_35, 
	FLD_NBR_36, [_f296:_HK]

