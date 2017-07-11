
CREATE        PROCEDURE [dbo].[usp_SFDCDeptExceptionsReport] 
AS

/* 	Author: 	Reetika Singh
	Date:		6/10/2014
	Purpose:	Compares Department picklist in Contract, Contact and Lead objects and 
				sends out notifications of mismatches
				
	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN

		select * into #TempContract
		from SFDCPicklistStaging
		where ObjectName = 'Contract'
		and FieldName = 'Practice_Location__c'


		select * into #TempCand
		from SFDCPicklistStaging
		where ObjectName = 'Contact'
		and FieldName = 'Department__c'
		and PickListValue NOT IN ('Benefits',
		'Business Development',
		'Finance',
		'Information Services',
		'Leadership Team',
		'Legal & Compliance',
		'Marketing & Communications',
		'None',
		'Operations',
		'Recruiting',
		'Talent Management')



		select * into #TempJob
		from SFDCPicklistStaging
		where ObjectName = 'ts2__Job__c'
		and FieldName = 'ts2__Department__c'
		and PickListValue NOT IN ('Billing', 'Administrative')



		select * into #TempLead
		from SFDCPicklistStaging
		where ObjectName = 'Lead'
		and FieldName = 'Department__c'
		and PickListValue NOT IN ('Benefits',
		'Business Development',
		'Finance',
		'Information Services',
		'Leadership Team',
		'Legal & Compliance',
		'Marketing & Communications',
		'None',
		'Operations',
		'Recruiting',
		'Talent Management')


		--Account Contract vs Contact
		
		TRUNCATE TABLE AccContractvsContact
		
		INSERT INTO AccContractvsContact
		SELECT LTRIM(RTRIM(#TempContract.ObjectName)) SFDCObject1, 
		LTRIM(RTRIM(#TempContract.FieldName)) FldName1, 
		LTRIM(RTRIM(#TempContract.PickListValue)) PickLstValue1,
		LTRIM(RTRIM(#TempCand.ObjectName)) SFDCObject2, 
		LTRIM(RTRIM(#TempCand.FieldName)) FldName2, 
		LTRIM(RTRIM(#TempCand.PickListValue)) PickLstValue2
		FROM #TempContract
			FULL JOIN #TempCand ON (#TempContract.PickListValue = #TempCand.PickListValue)
		WHERE #TempContract.PickListValue IS NULL OR #TempCand.PickListValue IS NULL


		--Account Contract vs Job
		
		TRUNCATE TABLE AccContractvsJob
		
		INSERT INTO AccContractvsJob		
		SELECT LTRIM(RTRIM(#TempContract.ObjectName)) SFDCObject1, 
		LTRIM(RTRIM(#TempContract.FieldName)) FldName1, 
		LTRIM(RTRIM(#TempContract.PickListValue)) PickLstValue1,
		LTRIM(RTRIM(#TempJob.ObjectName)) SFDCObject2, 
		LTRIM(RTRIM(#TempJob.FieldName)) FldName2, 
		LTRIM(RTRIM(#TempJob.PickListValue)) PickLstValue2
		FROM #TempContract
			FULL JOIN #TempJob ON (#TempContract.PickListValue = #TempJob.PickListValue)
		WHERE #TempContract.PickListValue IS NULL OR #TempJob.PickListValue IS NULL


		--Account Contract vs Lead
		
		TRUNCATE TABLE AccContractvsLead
		
		INSERT INTO AccContractvsLead		
		SELECT LTRIM(RTRIM(#TempContract.ObjectName)) SFDCObject1, 
		LTRIM(RTRIM(#TempContract.FieldName)) FldName1, 
		LTRIM(RTRIM(#TempContract.PickListValue)) PickLstValue1,
		LTRIM(RTRIM(#TempLead.ObjectName)) SFDCObject2, 
		LTRIM(RTRIM(#TempLead.FieldName)) FldName2, 
		LTRIM(RTRIM(#TempLead.PickListValue)) PickLstValue2
		FROM #TempContract
			FULL JOIN #TempLead ON (#TempContract.PickListValue = #TempLead.PickListValue)
		WHERE ( #TempContract.PickListValue IS NULL OR #TempLead.PickListValue IS NULL)
		ORDER By #TempContract.ObjectName desc



	

END

