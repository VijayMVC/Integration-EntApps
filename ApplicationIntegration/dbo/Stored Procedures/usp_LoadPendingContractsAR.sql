
CREATE PROCEDURE [dbo].[usp_LoadPendingContractsAR] AS

/*  Stored Procedure created to Load Pending Contracts AR 
	amounts per insurance plan from MARS*/


BEGIN

TRUNCATE TABLE ApplicationIntegration..PendingContractsAR

INSERT INTO ApplicationIntegration..PendingContractsAR
SELECT 'Blue Shield' AS Category,
	ProviderMasterID,
	SUM(CurrentBalance) AS CurrentBalance 
FROM
(
SELECT currentbalance,
	PC.ProviderMasterID
FROM (SELECT DISTINCT ProviderMasterID,LastName,Firstname 
	FROM ApplicationIntegration..PendingContracts 
	WHERE InsurancePlanName LIKE 'Blue%'
	) PC
INNER JOIN MARSStaging..ProviderCrossMapMARS PCM
	ON PCM.ProviderMasterID = PC.ProviderMasterID
INNER JOIN MARS..EncounterMaster E
	ON E.docCode = PCM.MARSproviderCode
		AND E.Practice = PCM.MARSPractice
INNER JOIN MARS..Billing B
	ON B.MARSKey = E.MARSkey
INNER JOIN MARS..Payers P
	ON P.MARSKey = B.MARSKey
INNER JOIN MARS..PracticeLookup PL
	ON PL.Practice = E.Practice
INNER JOIN MARS..PendingLocationLookup PLL
	ON PLL.Practice=E.Practice 
		AND PLL.Location=E.Location
INNER JOIN MARS..vw_PendingProviderLookup  PendingProviderLookupByDocCode 
	ON PendingProviderLookupByDocCode.Practice=E.Practice 
		AND PendingProviderLookupByDocCode.DocCode=E.DocCode
INNER JOIN MARS..vw_PendingProviderLookup vPPL
	ON vPPL.Practice=E.Practice 
		AND vPPL.DocCode=E.ProviderCode
WHERE 
	 ( 
		(
		contractid in  ('BSP','BSUHC')
		AND E.Practice NOT IN ('G01','G02','Z01','Z02')
		  AND  (PendingProviderLookupByDocCode.IndProvBS  IN  (' ', 'HOLD')
		  OR   PLL.GroupProvBS  IN  (' ', 'HOLD'))
		)
		OR
		(
		contractid in  ('BCBS','BSP','BCTPA','BSUHC')
		AND E.Practice IN ('G01','G02','Z01','Z02')
		  AND  ((E.Practice  NOT IN  ('G01', 'G02')
		  AND  PLL.GroupProvBS  IN  (' ', 'HOLD'))
		  OR   (E.Practice  IN  ('Z01', 'Z02')
		  AND  vPPL.IndProvBS  IN  (' ', 'HOLD'))
		  OR   PendingProviderLookupByDocCode.IndProvBS  IN  (' ', 'HOLD'))	
		)
	)
	AND PLL.TaxID = '94-2494000'
	AND E.PatientAccountFlag = 'Y'
	AND B.InsuranceBalance <> 0 
	AND CurrentBalance <> 0
	AND E.Practice NOT LIKE 'T%'
	AND B.TotalPayments  + B.TotalRefunds = 0
	AND E.practice IN ('A04','A05','A06','A08','A09','A88','A92','E01','E03','E08','E09','E10',
		'E15','E18','E20','E21','E47','E48','E53','E57','E58','E59','E60','E67','E78','E86',
		'E87','E94','E96','I77','W72','X01','G01','G02','Z01','Z02')
) T 
GROUP BY ProviderMasterID
UNION
-- UC Sites
SELECT 'Blue Shield' AS Category,
	ProviderMasterID,
	SUM(CurrentBalance) AS CurrentBalance 
FROM
(
SELECT currentbalance,
	PC.ProviderMasterID
FROM (SELECT DISTINCT ProviderMasterID,LastName,Firstname 
	FROM ApplicationIntegration..PendingContracts 
	WHERE InsurancePlanName LIKE 'Blue%'
	) PC
INNER JOIN MARSStaging..ProviderCrossMapMARS PCM
	ON PCM.ProviderMasterID = PC.ProviderMasterID
INNER JOIN MARS..EncounterMaster E
	ON E.docCode = PCM.MARSproviderCode
		AND E.Practice = PCM.MARSPractice
INNER JOIN MARS..Billing B
	ON B.MARSKey = E.MARSkey
INNER JOIN MARS..Payers P
	ON P.MARSKey = B.MARSKey
INNER JOIN MARS..PracticeLookup PL
	ON PL.Practice = E.Practice
INNER JOIN MARS..PendingLocationLookup PLL
	ON PLL.Practice=E.Practice 
		AND PLL.Location=E.Location
INNER JOIN MARS..vw_PendingProviderLookup  PendingProviderLookupByDocCode 
	ON PendingProviderLookupByDocCode.Practice=E.Practice 
		AND PendingProviderLookupByDocCode.DocCode=E.DocCode
INNER JOIN MARS..vw_PendingProviderLookup vPPL
	ON vPPL.Practice=E.Practice 
		AND vPPL.DocCode=E.ProviderCode
INNER JOIN MARS..PendingProviderLookup  PendingProviderLookup4doc 
	ON (E.Practice=PendingProviderLookup4doc.Practice 
		and E.Location=PendingProviderLookup4doc.Location 
		and E.DocCode=PendingProviderLookup4doc.DocCode)
WHERE 
	contractid in  ('BSP','BSUHC')
	  AND  (PendingProviderLookup4doc.IndProvBS  IN  (' ', 'HOLD')
		  OR   PLL.GroupProvBS  IN  (' ', 'HOLD'))
	AND PLL.TaxID = '94-2494000'
	AND E.PatientAccountFlag = 'Y'
	AND B.InsuranceBalance <> 0 
	AND CurrentBalance <> 0
	AND B.TotalPayments  + B.TotalRefunds = 0
	AND E.practice IN ('E46','E54')
) T 
GROUP BY ProviderMasterID
UNION
-- Galen
SELECT 'Blue Shield' AS Category,
	ProviderMasterID,
	SUM(TotalChargesByPhysician) AS CurrentBalance 
FROM
(
SELECT MAP.TotalChargesByPhysician,
	PC1.ProviderMasterID
FROM MARS..CONTRACTIDLOOKUP CIDL
INNER JOIN MARS..Payers P
	ON CIDL.Practice=P.Practice 
		and CIDL.ContractID=P.ContractID
INNER JOIN MARS..EncounterMaster E
	ON E.MARSKey = P.MARSKey
INNER JOIN MARS..Billing B
	ON B.MARSKey = E.MARSkey
INNER JOIN MARS..PracticeLookup PL
	ON PL.Practice = E.Practice
INNER JOIN MARS..PendingLocationLookup PLL
	ON PLL.Practice=E.Practice 
		AND PLL.Location=E.Location
INNER JOIN MARS..vw_PendingProviderLookup  PendingProviderLookupByDocCode 
	ON PendingProviderLookupByDocCode.Practice=E.Practice 
		AND PendingProviderLookupByDocCode.DocCode=E.DocCode
INNER JOIN MARS..vw_PendingProviderLookup vPPL
	ON vPPL.Practice=E.Practice 
		AND vPPL.DocCode=E.ProviderCode
INNER JOIN MARS..MAPSSummaryTable 
	ON E.MARSKEY=MARS..MAPSSummaryTable.MARSKey
INNER JOIN MARS..MAPDetail MAP
	ON MAP.MARSKey=MARS..MAPSSummaryTable.MARSKey
INNER JOIN 
	(SELECT MARSPractice, MARSProviderCode, PCM.ProviderMasterID 
		FROM (SELECT DISTINCT ProviderMasterID,LastName,Firstname 
		FROM ApplicationIntegration..PendingContracts 
		WHERE InsurancePlanName LIKE 'Blue%'
		) PC
		INNER JOIN MARSStaging..ProviderCrossMapMARS PCM
		ON PCM.ProviderMasterID = PC.ProviderMasterID
	) PC1	
	ON MAP.Practice = PC1.MARSPractice
		and MAP.AttendingDocCode = PC1.MARSproviderCode
WHERE 
	P.contractid in  ('HMSA','BSP','BSUHC')
	AND   (PLL.GroupProvBS  =  '  '
	  OR   vPPL.IndProvBS  IN  (' ', 'HOLD'))
	AND E.PatientAccountFlag = 'Y'
	AND E.practice LIKE 'A%'
	AND CurrentBalance <> 0
	AND MAP.TotalChargesByPhysician  IS NOT NULL  
) T 
GROUP BY ProviderMasterID


INSERT INTO ApplicationIntegration..PendingContractsAR
SELECT Category,
	ProviderMasterID,
--	LastName,Firstname,
	SUM(CurrentBalance) AS CurrentBalance 
FROM
(
SELECT currentbalance,
	PC.ProviderMasterID,
	'Category' = CASE 
		WHEN ContractID IN ('CALOP') THEN 'CALOPTIMA'
		WHEN ContractID IN ('MCAL') THEN 'MediCal'
		WHEN ContractID IN ('MCLMC', 'PEACH', 'WELLC', 'MCAID', 'AMERG') THEN 'MediCaid' END
	,LastName,Firstname 
FROM (SELECT DISTINCT ProviderMasterID
	,LastName,Firstname 
	FROM ApplicationIntegration..PendingContracts 
	WHERE InsurancePlanName LIKE 'MediCaid%'
		OR InsurancePlanName LIKE 'MediCal%'
		OR InsurancePlanName LIKE 'Medi-Cal%'
		OR InsurancePlanName LIKE 'CalOptima%'
	) PC
INNER JOIN MARSStaging..ProviderCrossMapMARS PCM
	ON PCM.ProviderMasterID = PC.ProviderMasterID
INNER JOIN MARS..EncounterMaster E
	ON E.DocCode = PCM.MARSproviderCode
		AND E.Practice = PCM.MARSPractice
INNER JOIN MARS..Billing B
	ON B.MARSKey = E.MARSkey
INNER JOIN MARS..Payers P
	ON P.MARSKey = B.MARSKey
INNER JOIN MARS..PracticeLookup PL
	ON PL.Practice = E.Practice
INNER JOIN MARS..PendingLocationLookup PLL
	ON PLL.Practice=E.Practice 
		AND PLL.Location=E.Location
INNER JOIN MARS..vw_PendingProviderLookup  PendingProviderLookupByDocCode 
	ON PendingProviderLookupByDocCode.Practice=E.Practice 
		AND PendingProviderLookupByDocCode.DocCode=E.DocCode
INNER JOIN MARS..vw_PendingProviderLookup vPPL
	ON vPPL.Practice=E.Practice 
		AND vPPL.DocCode=E.ProviderCode
WHERE 
	 ( 
		(
		(ContractID  =  'MCAL' 	AND PL.AreaGrouping = 'CEP ED & UC')
		 OR   (E.Practice  IN  ('G01', 'G02', 'Z01', 'Z02')
			 AND  ContractID  IN  ('MCLMC', 'PEACH', 'WELLC', 'MCAID', 'AMERG'))
		)
		AND  
		(
			(E.Practice  NOT IN  ('G01', 'G02')
				 AND  PLL.GroupProvMCAL  IN  (' ', 'HOLD'))
			 OR   PendingProviderLookupByDocCode.IndProvMCAL  IN  (' ', 'HOLD')
			 OR   (E.Practice  IN  ('G01', 'G02', 'Z01', 'Z02')
				 AND  vPPL.IndProvMCAL  IN  (' ', 'HOLD'))
		)
		OR
		(
		contractid in  ('CALOP')
			AND  PendingProviderLookupByDocCode.IndProvCAL  IN  (' ', 'HOLD')
			AND P.PrimaryFinancialPayerClassCode <> 97
			AND PL.AreaGrouping = 'CEP ED & UC'
		)
	)
	AND PLL.TaxID = '94-2494000'
	AND E.PatientAccountFlag = 'Y'
	AND B.InsuranceBalance <> 0 
	AND CurrentBalance <> 0
	AND E.practice IN ('E01','E06','E08','E09','E10','E14','E15','E16','E20','E21','E23','E26','E27','E28',
			'E38','E40','E44','E48','E49','E50','E53','E55','E57','E58','E59','E60','E73','E77','E78','E86',
			'E87','E89','E94','E96','G01','G02','Z01','Z02')
) T 
GROUP BY Category,ProviderMasterID
--,LastName,Firstname 
UNION
-- UC Sites
SELECT Category,
	ProviderMasterID,
--	LastName,Firstname,
	SUM(CurrentBalance) AS CurrentBalance 
FROM
(
SELECT currentbalance,
	PC.ProviderMasterID,
	'Category' = CASE 
		WHEN ContractID IN ('CALOP') THEN 'CALOPTIMA'
		WHEN ContractID IN ('MCAL') THEN 'MediCal'
		WHEN ContractID IN ('MCLMC', 'PEACH', 'WELLC', 'MCAID', 'AMERG') THEN 'MediCaid' END
	,LastName,Firstname 
FROM (SELECT DISTINCT ProviderMasterID,LastName,Firstname 
	FROM ApplicationIntegration..PendingContracts 
	WHERE InsurancePlanName LIKE 'MediCaid%'
		OR InsurancePlanName LIKE 'MediCal%'
		OR InsurancePlanName LIKE 'Medi-Cal%'
		OR InsurancePlanName LIKE 'CalOptima%'
	) PC
INNER JOIN MARSStaging..ProviderCrossMapMARS PCM
	ON PCM.ProviderMasterID = PC.ProviderMasterID
INNER JOIN MARS..EncounterMaster E
	ON E.DocCode = PCM.MARSproviderCode
		AND E.Practice = PCM.MARSPractice
INNER JOIN MARS..Billing B
	ON B.MARSKey = E.MARSkey
INNER JOIN MARS..Payers P
	ON P.MARSKey = B.MARSKey
INNER JOIN MARS..PracticeLookup PL
	ON PL.Practice = E.Practice
INNER JOIN MARS..PendingLocationLookup PLL
	ON PLL.Practice=E.Practice 
		AND PLL.Location=E.Location
INNER JOIN MARS..vw_PendingProviderLookup  PendingProviderLookupByDocCode 
	ON PendingProviderLookupByDocCode.Practice=E.Practice 
		AND PendingProviderLookupByDocCode.DocCode=E.DocCode
INNER JOIN MARS..vw_PendingProviderLookup vPPL
	ON vPPL.Practice=E.Practice 
		AND vPPL.DocCode=E.ProviderCode
WHERE 
	 ( 
		(
		contractid in  ('MCAL')
		AND  (PendingProviderLookupByDocCode.IndProvMCAL  IN  (' ', 'HOLD')
			  OR   PLL.GroupProvMCAL  IN  (' ', 'HOLD'))
		)
		OR
		(
		contractid in  ('CALOP')
			AND  PendingProviderLookupByDocCode.IndProvCAL  IN  (' ', 'HOLD','CALOP')		
		AND P.PrimaryFinancialPayerClassCode <> 97
		)
	)
	AND PLL.TaxID = '94-2494000'
	AND E.PatientAccountFlag = 'Y'
	AND B.InsuranceBalance <> 0 
	AND CurrentBalance <> 0
	AND E.practice IN ('E46','E54')
) T 
GROUP BY Category,ProviderMasterID--,LastName,Firstname 
UNION 
-- Galen
SELECT Category,
	ProviderMasterID,
--	DocName,
	SUM(TotalChargesByPhysician) AS CurrentBalance 
FROM
(
SELECT MAP.TotalChargesByPhysician,
	'Category' = CASE 
		WHEN P.ContractID IN ('CALOP') THEN 'CALOPTIMA'
		WHEN P.ContractID IN ('MCAL') THEN 'MediCal'
		WHEN P.ContractID IN ('MCLMC', 'PEACH', 'WELLC', 'MCAID', 'AMERG') THEN 'MediCaid' END,
	vPPL.DocName,
	PC1.ProviderMasterID
FROM MARS..CONTRACTIDLOOKUP CIDL
INNER JOIN MARS..Payers P
	ON CIDL.Practice=P.Practice 
		and CIDL.ContractID=P.ContractID
INNER JOIN MARS..EncounterMaster E
	ON E.MARSKey = P.MARSKey
INNER JOIN MARS..Billing B
	ON B.MARSKey = E.MARSkey
INNER JOIN MARS..PracticeLookup PL
	ON PL.Practice = E.Practice
INNER JOIN MARS..PendingLocationLookup PLL
	ON PLL.Practice=E.Practice 
		AND PLL.Location=E.Location
INNER JOIN MARS..vw_PendingProviderLookup  PendingProviderLookupByDocCode 
	ON PendingProviderLookupByDocCode.Practice=E.Practice 
		AND PendingProviderLookupByDocCode.DocCode=E.DocCode
INNER JOIN MARS..PendingProviderLookup  PPL
	ON (E.Practice=PPL.Practice 
		and E.Location=PPL.Location 
		and E.DocCode=PPL.DocCode)
INNER JOIN MARS..vw_PendingProviderLookup vPPL
	ON (vPPL.Practice=E.Practice 
		and vPPL.DocCode=E.ProviderCode)
INNER JOIN MARS..MAPSSummaryTable 
	ON E.MARSKEY=MARS..MAPSSummaryTable.MARSKey
INNER JOIN MARS..MAPDetail MAP
	ON MAP.MARSKey=MARS..MAPSSummaryTable.MARSKey
INNER JOIN 
	(SELECT MARSPractice, MARSProviderCode, PCM.ProviderMasterID 
		FROM (SELECT DISTINCT ProviderMasterID,LastName,Firstname 
		FROM ApplicationIntegration..PendingContracts 
		WHERE InsurancePlanName LIKE 'MediCaid%'
			OR InsurancePlanName LIKE 'MediCal%'
			OR InsurancePlanName LIKE 'Medi-Cal%'
			OR InsurancePlanName LIKE 'CalOptima%'
		) PC
		INNER JOIN MARSStaging..ProviderCrossMapMARS PCM
		ON PCM.ProviderMasterID = PC.ProviderMasterID
	) PC1	
	ON MAP.Practice = PC1.MARSPractice
		and MAP.AttendingDocCode = PC1.MARSproviderCode
WHERE 
	P.contractid in  ('CALOP','MCAL')
	AND  (PendingProviderLookupByDocCode.IndProvMCAL  IN  (' ', 'HOLD')
	  OR   PPL.IndProvCAL  IN  (' ', 'HOLD')
	  OR   PLL.GroupProvMCAL  =  ' ')
	AND E.PatientAccountFlag = 'Y'
	AND (E.practice LIKE 'A%' OR E.practice LIKE 'P%')
	AND CurrentBalance <> 0
) T 
GROUP BY Category,ProviderMasterID--,DocName



INSERT INTO ApplicationIntegration..PendingContractsAR
SELECT 'MEDICARE' AS Category,
	ProviderMasterID,
--	LastName + ',' + Firstname,
	SUM(CurrentBalance) AS CurrentBalance 
FROM
(
SELECT currentbalance,
	PC.ProviderMasterID
	,LastName,Firstname 
FROM (SELECT DISTINCT ProviderMasterID,LastName,Firstname 
	FROM ApplicationIntegration..PendingContracts 
	WHERE InsurancePlanName LIKE 'MediCare%'
	) PC
INNER JOIN MARSStaging..ProviderCrossMapMARS PCM
	ON PCM.ProviderMasterID = PC.ProviderMasterID
INNER JOIN MARS..EncounterMaster E
	ON E.ProviderCode = PCM.MARSproviderCode
		AND E.Practice = PCM.MARSPractice
INNER JOIN MARS..Billing B
	ON B.MARSKey = E.MARSkey
INNER JOIN MARS..Payers P
	ON P.MARSKey = B.MARSKey
INNER JOIN MARS..PracticeLookup PL
	ON PL.Practice = E.Practice
INNER JOIN MARS..PendingLocationLookup PLL
	ON PLL.Practice=E.Practice 
		AND PLL.Location=E.Location
INNER JOIN MARS..vw_PendingProviderLookup  PendingProviderLookupByDocCode 
	ON PendingProviderLookupByDocCode.Practice=E.Practice 
		AND PendingProviderLookupByDocCode.DocCode=E.DocCode
INNER JOIN MARS..vw_PendingProviderLookup vPPL
	ON vPPL.Practice=E.Practice 
		AND vPPL.DocCode=E.ProviderCode
WHERE 
	 ( 
		(
		contractid in  ('MCARE','MCRMC')
		  AND  (vPPL.IndProvUPIN  IN  ('  ')
			  OR   vPPL.IndProvMCARE  IN  ('HOLD', '  ')
			  OR   PLL.GroupProvMCARE  IN  (' ', 'HOLD')))
		OR
		(
		contractid in  ('MCRRR')
			AND  vPPL.IndProvRR  IN  (' ', 'HOLD')		
			AND E.Practice NOT LIKE 'W%'
		)
	)
	AND PLL.TaxID = '94-2494000'
	AND E.PatientAccountFlag = 'Y'
	AND B.InsuranceBalance <> 0 
	AND CurrentBalance <> 0
	AND E.Practice NOT LIKE 'T%'
	AND E.Practice NOT LIKE 'I%'
	AND E.Practice NOT LIKE 'P%'
	AND E.Practice NOT LIKE 'A%'
	AND B.TotalPayments  + B.TotalRefunds = 0
	AND E.practice IN ('E01','E06','E08','E09','E10','E12','E14','E15','E17','E18','E21','E26','E27',
			'E38','E44','E47','E53','E55','E57','E58','E59','E60','E67','E73','E77','E78','E86',
			'E89','E94','E96','W72','G01','G02','Z01','Z02')
) T 
GROUP BY ProviderMasterID--,LastName,Firstname 
UNION
-- UC Sites
SELECT 'MEDICARE' AS Category,
	ProviderMasterID,
--	LastName + ',' + Firstname,
	SUM(CurrentBalance) AS CurrentBalance 
FROM
(
SELECT currentbalance,
	PC.ProviderMasterID,
	LastName,Firstname 
FROM (SELECT DISTINCT ProviderMasterID,LastName,Firstname 
	FROM ApplicationIntegration..PendingContracts 
	WHERE InsurancePlanName LIKE 'MediCare%'
	) PC
INNER JOIN MARSStaging..ProviderCrossMapMARS PCM
	ON PCM.ProviderMasterID = PC.ProviderMasterID
INNER JOIN MARS..EncounterMaster E
	ON E.DocCode = PCM.MARSproviderCode
		AND E.Practice = PCM.MARSPractice
INNER JOIN MARS..Billing B
	ON B.MARSKey = E.MARSkey
INNER JOIN MARS..Payers P
	ON P.MARSKey = B.MARSKey
INNER JOIN MARS..PracticeLookup PL
	ON PL.Practice = E.Practice
INNER JOIN MARS..PendingLocationLookup PLL
	ON PLL.Practice=E.Practice 
		AND PLL.Location=E.Location
INNER JOIN MARS..vw_PendingProviderLookup  PendingProviderLookupByDocCode 
	ON PendingProviderLookupByDocCode.Practice=E.Practice 
		AND PendingProviderLookupByDocCode.DocCode=E.DocCode
INNER JOIN MARS..vw_PendingProviderLookup vPPL
	ON vPPL.Practice=E.Practice 
		AND vPPL.DocCode=E.ProviderCode
WHERE 
	 ( 
		(
		contractid in  ('MCARE','MCRMC')
		  AND  (vPPL.IndProvUPIN  IN  ('  ')
			  OR   vPPL.IndProvMCARE  IN  ('HOLD', '  ')
			  OR   PLL.GroupProvMCARE  IN  (' ', 'HOLD')))
		OR
		(
		contractid in  ('MCRRR')
			AND  vPPL.IndProvRR  IN  (' ', 'HOLD')		
		)
	)
	AND PLL.TaxID = '94-2494000'
	AND E.PatientAccountFlag = 'Y'
	AND B.InsuranceBalance <> 0 
	AND CurrentBalance <> 0
	AND B.TotalPayments  + B.TotalRefunds = 0
	AND E.practice IN ('E46','E54')
) T 
GROUP BY ProviderMasterID--,LastName,Firstname 
UNION
-- Galen
SELECT 'MEDICARE' AS Category,
	ProviderMasterID,
--	DocName,
	SUM(TotalChargesByPhysician) AS CurrentBalance 
FROM
(
SELECT MAP.TotalChargesByPhysician,
	vPPL.DocName,
	PC1.ProviderMasterID
FROM MARS..CONTRACTIDLOOKUP CIDL
INNER JOIN MARS..Payers P
	ON CIDL.Practice=P.Practice 
		and CIDL.ContractID=P.ContractID
INNER JOIN MARS..EncounterMaster E
	ON E.MARSKey = P.MARSKey
INNER JOIN MARS..Billing B
	ON B.MARSKey = E.MARSkey
INNER JOIN MARS..PracticeLookup PL
	ON PL.Practice = E.Practice
INNER JOIN MARS..PendingLocationLookup PLL
	ON PLL.Practice=E.Practice 
		AND PLL.Location=E.Location
INNER JOIN MARS..vw_PendingProviderLookup  PendingProviderLookupByDocCode 
	ON PendingProviderLookupByDocCode.Practice=E.Practice 
		AND PendingProviderLookupByDocCode.DocCode=E.DocCode
INNER JOIN MARS..PendingProviderLookup  PPL
	ON (E.Practice=PPL.Practice 
		and E.Location=PPL.Location 
		and E.DocCode=PPL.DocCode)
INNER JOIN MARS..vw_PendingProviderLookup vPPL
	ON (vPPL.Practice=E.Practice 
		and vPPL.DocCode=E.ProviderCode)
INNER JOIN MARS..MAPSSummaryTable 
	ON E.MARSKEY=MARS..MAPSSummaryTable.MARSKey
INNER JOIN MARS..MAPDetail MAP
	ON MAP.MARSKey=MARS..MAPSSummaryTable.MARSKey
INNER JOIN 
	(SELECT MARSPractice, MARSProviderCode, PCM.ProviderMasterID 
		FROM (SELECT DISTINCT ProviderMasterID,LastName,Firstname 
		FROM ApplicationIntegration..PendingContracts 
		WHERE InsurancePlanName LIKE 'MediCare%'
		) PC
		INNER JOIN MARSStaging..ProviderCrossMapMARS PCM
		ON PCM.ProviderMasterID = PC.ProviderMasterID
	) PC1	
	ON MAP.Practice = PC1.MARSPractice
		and MAP.AttendingDocCode = PC1.MARSproviderCode
WHERE 
	( 
	  P.ContractID  IN  ('MCARE', 'MCRMC')
	  AND  (vPPL.IndProvUPIN  IN  ('  ')
	  OR   vPPL.IndProvMCARE  IN  ('HOLD', ' ')
	  OR   PLL.GroupProvMCARE  =  '  ')
	  OR   P.ContractID  =  'MCRRR'
	  AND  vPPL.IndProvRR  IN  (' ', 'HOLD')
	  )
	AND E.PatientAccountFlag = 'Y'
	AND E.practice LIKE 'A%'
	AND CurrentBalance <> 0
	AND MAP.TotalChargesByPhysician  IS NOT NULL  
) T 
GROUP BY ProviderMasterID--,DocName



END

