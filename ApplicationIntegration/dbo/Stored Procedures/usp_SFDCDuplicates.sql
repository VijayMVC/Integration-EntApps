

CREATE        PROCEDURE [dbo].[usp_SFDCDuplicates] 
AS

/* 	Author: 	Reetika Singh
	Date:	    10/24/2012
	Purpose:	Populates SFDCDupes table with duplicates from Salesforce
	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN




	
		SELECT * INTO #SFDCDupe FROM (
			SELECT L.LastName, L.FirstName, L.Email, L.Title,
						L.Alternate_Email__c, Null As MName, L.Street,
						L.City, L.State, L.PostalCode, L.Phone,L.MobilePhone,
						[User].Name As CreatedBy, L.CreatedDate, 'Lead' As RecType
						FROM Salesforce...Lead L
						join Salesforce...RecordType R
							on R.Id = L.RecordTypeId
						join Salesforce...[User] 
							on L.CreatedById = [User].Id
						WHERE [User].Name = 'Marketo Account'
						AND  L.ConvertedContactId IS NULL
			UNION
			SELECT L.LastName, L.FirstName, L.Email, L.Title,
						L.Alternate_Email__c, Null As MName, L.Street,
						L.City, L.State, L.PostalCode, L.Phone,L.MobilePhone,
						[User].Name As CreatedBy, L.CreatedDate, 'Lead' As RecType
						FROM Salesforce...Lead L
						join Salesforce...RecordType R
							on R.Id = L.RecordTypeId
						join Salesforce...[User] 
							on L.CreatedById = [User].Id
						WHERE R.Name = 'Recruiting'
						AND  L.ConvertedContactId IS NULL
			UNION
			SELECT C1.LastName, C1.FirstName, C1.Email, 
						C1.Title__c, C1.Secondary_Email__c,C1.Middle_Initial__c As MName, 
						C1.MailingStreet,
						C1.MailingCity, C1.MailingState, C1.MailingPostalCode, C1.Phone,C1.MobilePhone,
						U.Name As CreatedBy,  C1.CreatedDate, 'Contact' As RecType
						from SalesForce...Contact C1
						join Salesforce...Account  A	
							on C1.AccountId = A.Id
						join Salesforce...[User] U
							on C1.CreatedById = U.Id
						WHERE A.Name IN ('Candidates', 'CEP America')
			) T

		DELETE FROM #SFDCDupe
		WHERE LastName IN ('???', '[not provided]')


		DROP TABLE SFDCDupe
			
			
		SELECT * INTO SFDCDupe
		FROM #SFDCDupe T1
		WHERE EXISTS (select LastName, FirstName, COUNT(*)
						from #SFDCDupe T2
						where (T1.LastName = T2.LastName
							AND T1.FirstName = T2.FirstName
							AND T1.Title = T2.Title)
							AND( T1.Email = T2.Email
							OR ((T1.Phone = T2.Phone
									OR T1.MobilePhone = T2.MobilePhone)
								OR (T1.Street = T2.Street 
								AND T1.City = T2.City
								AND T1.State = T2.State)))
						GROUP BY LastName, FirstName
						Having COUNT(*) > 1
						)
		order by LastName, FirstName

--select distinct RecType from SFDCdupe
		DROP TABLE #SFDCDupe


	
	

END


