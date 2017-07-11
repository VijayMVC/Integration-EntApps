



CREATE        PROCEDURE [dbo].[usp_SFDCHospitalDataLoadForMARS] 
AS

					 
	

SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN
	
TRUNCATE TABLE SFDCHospitalDataForMARS

INSERT INTO SFDCHospitalDataForMARS
select Distinct A.Name AS AccountName, HR.Code As WebCode ,
P.Name ParentAccount, A.Admit_Rate__c AdmitRate, 
A.CEP_Division__c CEPDivision, A.CEP_Region__c CEPRegion, 
A.BillingState, HospCont.Name HospitalistContractHolder, 
A.bsc__c BedSizeRange, A.ED_Admissions__c EDAdmissions,
A.Edbed__c AS EDBed, EDCont.Name EDContractHolder, A.vem__c AS EDVists, 
A.hospbd__c AS LicensedBeds, A.emdephos__c AS EmergencyDept, A.Emergency_Medicine__c EmergencyMedicine,
A.serv__c PrimaryService, A.trauml90__c AS TraumaLevel, A.Medicare_ID__c  MedicareID,
CASE WHEN A.Medicare_ID__c IS NOT NULL
THEN RIGHT('000000'+ISNULL(A.Medicare_ID__c,''),6)
ELSE A.Medicare_ID__c END AS MedicareID2
from Salesforce.dbo.Account A
left outer join salesforce.dbo.Account P
	on P.Id = A.ParentId
left outer join salesforce.dbo.Account HospCont
	on HospCont.Id = A.ParentId
left outer join salesforce.dbo.Account EDCont
	on EDCont.Id = A.ParentId
left outer join salesforce.dbo.Contract C
	on C.AccountId = A.Id
left outer join ApplicationIntegration.dbo.Hospital_region HR
	on HR.TCstruct = C.Id
where A.Name not like '%closed%'
AND A.Name not like '%not%provided%'
order by A.Name



END


