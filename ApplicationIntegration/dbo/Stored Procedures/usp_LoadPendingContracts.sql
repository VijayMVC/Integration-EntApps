
CREATE PROCEDURE [dbo].[usp_LoadPendingContracts] AS

/*  Antonia Miller  -- 12/11/2006
	Stored Procedure created to Load Pending Contracts and populate first scheduled work date.
	Clearly, the nature of the report isn't conducive with logically adding Site1-8 first work date due to
	the way the data was originally stored in the report (it should be in a separate report).  
	As such, Site1-8 in this report will have repeating values in some cases and will be displayed 
	somewhat illogically.  It was agreed upon by the credentialing/provider enrollment director, 
	analyst requesting this report and provider enrollment team that they wanted the information in this same 
	report anyway and would like to receive it as is. 

	Revision:  8/13/2007 - Antonia Miller --Added TXP
			9/19/2007 - Antonia Miller - changed followup dates for FollowupWithPayor column
					Added ProviderStatus
			10/11/2007 - Mohamed Mahmoud - Modified to archive previous week report in order to use
					to identify new providers on current report
			2/12/2009 - Antonia Miller --Added ILP
			2/24/2009 - Mohamed Mahmoud - Added INTERPLAN for MacNeal (as per Jennifer Browne)
			5/14/2009 - Antonia Miller --Added WAP
			7/31/2009 - Reetika Singh - Added Labor & Industries, Tricare, Section 1011 and Re-Act (As per Otilia)
			3/31/2010 - Reetika Singh - Added new field "Comments" to PendingContracts table and report
			4/27/2010 - Brett Staib - Added more contracts Regence, CCS, Sherman Choice, MHN (As per Otilia)
			9/23/2010 - Reetika Singh - Modified code to include all cases where Provider is inactive CEP and 
					Active in 'WEP', 'TXP', 'WAP', 'ILP', 'AEP', 'DEP'
			9/30/2010 - For the above case using TempStaffhistory instead of StaffHistory
			5/11/2011 - Reetika singh - Added KYP
			6/28/2011 - Added new column - InsurancePlanIDNumber to the PendingContracts table as per Otilia

*/


BEGIN

TRUNCATE TABLE PendingContractsArchive

INSERT INTO PendingContractsArchive
SELECT * FROM PendingContracts

TRUNCATE TABLE PendingContracts

INSERT INTO PendingContracts
	(LastName ,
	FirstName ,
	Title,
	RecordStatus,
	FromDate,
	PayerName ,
	SiteName ,
	PracticeLocation,
	MailedToProvider,
	ReceivedFromProvider,
	MailedToPayer ,
	PayerReferenceNumber,
	FollowUpDate,
	FirstDateWorked,
	ProviderMasterID,
	PESpecialist,
	Status)

	SELECT DISTINCT 
		Prov.LastName,
		Prov.FirstName,
		Prov.Title,
		PS.RecordStatus,
		PS.[From],
		SC.PayerName,
		SC.SiteName,
		SC.PracticeLocation,
		Convert(DateTime, SC.MailedToProvider) AS MailedToProvider,
		Convert(DateTime, SC.RecFromProvider)	AS ReceivedFromProvider,
		Convert(Datetime, SC.MailedToPayer)	AS MailedToPayer,
		SC.PayerRefNo,
		SC.FollowUpDate,
		Convert(Datetime,SC.FirstWorkedDate),
		Prov.ProviderMasterID, 
		SC.PESpecialist,
		SC.[Status]
		FROM ProviderStatusStaging PS
		INNER JOIN ProviderMasterBase Prov
			 ON PS.ProviderMasterID = Prov.ProviderMasterID
		INNER JOIN SFDCContracts SC
			 ON PS.ProviderMasterID = SC.ProviderMasterID
		WHERE 		(RTRIM(LTRIM(SC.PayerName))	LIKE 'Medi%'
			OR  	 RTRIM(LTRIM(SC.PayerName))	LIKE '%Blue Shield%'
			OR  	 RTRIM(LTRIM(SC.PayerName))	LIKE '%CalOptima%'
			OR  	 RTRIM(LTRIM(SC.PayerName))	LIKE '%HFN%'
			OR  	 RTRIM(LTRIM(SC.PayerName))	LIKE '%Credentialing Application%'
			OR  	 RTRIM(LTRIM(SC.PayerName))	LIKE '%INTERPLAN%'
			OR  	 RTRIM(LTRIM(SC.PayerName))	LIKE '%Section 1011%'
			OR  	 RTRIM(LTRIM(SC.PayerName))	LIKE '%Tricare%'
			OR  	 RTRIM(LTRIM(SC.PayerName))	LIKE '%Re-Act%'
			OR  	 RTRIM(LTRIM(SC.PayerName))	LIKE '%Labor%Industries%'
			OR  	 RTRIM(LTRIM(SC.PayerName))	LIKE '%Regence%'
			OR  	 RTRIM(LTRIM(SC.PayerName))	LIKE '%CCS%'
			OR  	 RTRIM(LTRIM(SC.PayerName))	LIKE '%Sherman Choice%'
			OR  	 RTRIM(LTRIM(SC.PayerName))	LIKE '%MHN%')
 		  AND Prov.Status = 0
-- 		  AND SH.StaffGroup IN ('CEP', 'GALEN', 'PARAGON')  --CEP ok for AEP, DEP, WEP, TXP, ILP, WAP or will get dups
			AND PS.STAFFGROUP IN ('CEP','GALEN')
		  AND 		(SC.[Status]	= ' '
			OR	 SC.[Status] 		LIKE '%Pending%')	
			AND SC.SITENAME NOT IN('California Hospital Medical Center', 'California Hospital Urgent Care Center')			
			AND PS.RecordStatus IN ('Applicant', 'Current Medical Staff', 'Suspended')
		ORDER BY SC.SiteName,
			Convert(Datetime, SC.MailedToProvider),
			Prov.LastName,
			 SC.PayerName



/*Populate the Work Dates Temp Table*/
	SELECT Providermasterid, Lastname, Firstname, Site, Sitename, MIN(dateofservice)AS MINDOS
		INTO #TEMPDATES
		FROM ProviderHoursDetail
		GROUP BY Lastname, Firstname, Sitename, Site, Providermasterid

/*Set the Site Code For Matching for Site 1 - Site 8*/
	UPDATE PendingContracts
		SET SITE1FirstWorked
		= #TEMPDATES.site
		FROM #TEMPDATES, PendingContracts
		WHERE #TEMPDATES.Providermasterid = PendingContracts.ProviderMasterID

	UPDATE PendingContracts
		SET SITE2FirstWorked
		= #TEMPDATES.site
		FROM #TEMPDATES, PendingContracts
		WHERE (#TEMPDATES.Providermasterid = PendingContracts.ProviderMasterID
		AND #TEMPDATES.site <> PendingContracts.Site1FirstWorked)

	UPDATE PendingContracts
		SET SITE3FirstWorked
		= #TEMPDATES.site
		FROM #TEMPDATES, PendingContracts
		WHERE (#TEMPDATES.Providermasterid = PendingContracts.ProviderMasterID
		AND #TEMPDATES.site <> PendingContracts.Site1FirstWorked
		AND #TEMPDATES.site <> PendingContracts.Site2FirstWorked)

	UPDATE PendingContracts
		SET SITE4FirstWorked
		= #TEMPDATES.site
		FROM #TEMPDATES, PendingContracts
		WHERE (#TEMPDATES.Providermasterid = PendingContracts.ProviderMasterID
		AND #TEMPDATES.site <> PendingContracts.Site1FirstWorked
		AND #TEMPDATES.site <> PendingContracts.Site2FirstWorked
		AND #TEMPDATES.site <> PendingContracts.Site3FirstWorked)

	UPDATE PendingContracts
		SET SITE5FirstWorked
		= #TEMPDATES.site
		FROM #TEMPDATES, PendingContracts
		WHERE (#TEMPDATES.Providermasterid = PendingContracts.ProviderMasterID
		AND #TEMPDATES.site <> PendingContracts.Site1FirstWorked
		AND #TEMPDATES.site <> PendingContracts.Site2FirstWorked
		AND #TEMPDATES.site <> PendingContracts.Site3FirstWorked
		AND #TEMPDATES.site <> PendingContracts.Site4FirstWorked)

	UPDATE PendingContracts
		SET SITE6FirstWorked
		= #TEMPDATES.site
		FROM #TEMPDATES, PendingContracts
		WHERE (#TEMPDATES.Providermasterid = PendingContracts.ProviderMasterID
		AND #TEMPDATES.site <> PendingContracts.Site1FirstWorked
		AND #TEMPDATES.site <> PendingContracts.Site2FirstWorked
		AND #TEMPDATES.site <> PendingContracts.Site3FirstWorked
		AND #TEMPDATES.site <> PendingContracts.Site4FirstWorked
		AND #TEMPDATES.site <> PendingContracts.Site5FirstWorked)


	UPDATE PendingContracts
		SET SITE7FirstWorked
		= #TEMPDATES.site
		FROM #TEMPDATES, PendingContracts
		WHERE (#TEMPDATES.Providermasterid = PendingContracts.ProviderMasterID
		AND #TEMPDATES.site <> PendingContracts.Site1FirstWorked
		AND #TEMPDATES.site <> PendingContracts.Site2FirstWorked
		AND #TEMPDATES.site <> PendingContracts.Site3FirstWorked
		AND #TEMPDATES.site <> PendingContracts.Site4FirstWorked
		AND #TEMPDATES.site <> PendingContracts.Site5FirstWorked
		AND #TEMPDATES.site <> PendingContracts.Site6FirstWorked)


	UPDATE PendingContracts
		SET SITE8FirstWorked
		= #TEMPDATES.site
		FROM #TEMPDATES, PendingContracts
		WHERE (#TEMPDATES.Providermasterid = PendingContracts.ProviderMasterID
		AND #TEMPDATES.site <> PendingContracts.Site1FirstWorked
		AND #TEMPDATES.site <> PendingContracts.Site2FirstWorked
		AND #TEMPDATES.site <> PendingContracts.Site3FirstWorked
		AND #TEMPDATES.site <> PendingContracts.Site4FirstWorked
		AND #TEMPDATES.site <> PendingContracts.Site5FirstWorked
		AND #TEMPDATES.site <> PendingContracts.Site6FirstWorked
		AND #TEMPDATES.site <> PendingContracts.Site7FirstWorked)


/*Populate the First Work Date and SiteName*/
	UPDATE PendingContracts
		SET SITE1FirstWorked
		= CAST(#TEMPDATES.MinDOS AS varchar(40)) + '- ' + #TEMPDATES.sitename
		FROM #TEMPDATES, PendingContracts
		WHERE #TEMPDATES.Providermasterid = PendingContracts.ProviderMasterID
		AND #TEMPDATES.Site = PendingContracts.Site1FirstWorked
		AND PendingContracts.Site1FirstWorked IS NOT NULL


	UPDATE PendingContracts
		SET SITE2FirstWorked
		= CAST(#TEMPDATES.MinDOS AS varchar(40)) + '- ' + #TEMPDATES.sitename
		FROM #TEMPDATES, PendingContracts
		WHERE (#TEMPDATES.Providermasterid = PendingContracts.ProviderMasterID
		AND #TEMPDATES.Site = pendingContracts.Site2FirstWorked
		AND PendingContracts.Site2FirstWorked IS NOT NULL)

	UPDATE PendingContracts
		SET SITE3FirstWorked
		= CAST(#TEMPDATES.MinDOS AS varchar(40)) + '- ' + #TEMPDATES.sitename
		FROM #TEMPDATES, PendingContracts
		WHERE (#TEMPDATES.Providermasterid = PendingContracts.ProviderMasterID
		AND #TEMPDATES.Site = PendingContracts.Site3FirstWorked
		AND PendingContracts.Site3FirstWorked IS NOT NULL)

	UPDATE PendingContracts
		SET SITE4FirstWorked
		= CAST(#TEMPDATES.MinDOS AS varchar(40)) + '- ' + #TEMPDATES.sitename
		FROM #TEMPDATES, PendingContracts
		WHERE (#TEMPDATES.Providermasterid = PendingContracts.ProviderMasterID
		AND #TEMPDATES.Site = PendingContracts.Site4FirstWorked
		AND PendingContracts.Site4FirstWorked IS NOT NULL)

	
	UPDATE PendingContracts
		SET SITE5FirstWorked
		= CAST(#TEMPDATES.MinDOS AS varchar(40)) + '- ' + #TEMPDATES.sitename
		FROM #TEMPDATES, PendingContracts
		WHERE (#TEMPDATES.Providermasterid = PendingContracts.ProviderMasterID
		AND #TEMPDATES.Site = PendingContracts.Site5FirstWorked
		AND PendingContracts.Site5FirstWorked IS NOT NULL)


	UPDATE PendingContracts
		SET SITE6FirstWorked
		= CAST(#TEMPDATES.MinDOS AS varchar(40)) + '- ' + #TEMPDATES.sitename
		FROM #TEMPDATES, PendingContracts
		WHERE (#TEMPDATES.Providermasterid = PendingContracts.ProviderMasterID
		AND #TEMPDATES.Site = PendingContracts.Site6FirstWorked
		AND PendingContracts.Site6FirstWorked IS NOT NULL)


	UPDATE PendingContracts
		SET SITE7FirstWorked
		= CAST(#TEMPDATES.MinDOS AS varchar(40)) + '- ' + #TEMPDATES.sitename
		FROM #TEMPDATES, PendingContracts
		WHERE (#TEMPDATES.Providermasterid = PendingContracts.ProviderMasterID
		AND #TEMPDATES.Site = PendingContracts.Site7FirstWorked
		AND PendingContracts.Site7FirstWorked IS NOT NULL)


	UPDATE PendingContracts
		SET SITE8FirstWorked
		= CAST(#TEMPDATES.MinDOS AS varchar(40)) + '- ' + #TEMPDATES.sitename
		FROM #TEMPDATES, PendingContracts
		WHERE (#TEMPDATES.Providermasterid = PendingContracts.ProviderMasterID
		AND #TEMPDATES.Site = PendingContracts.Site8FirstWorked
		AND PendingContracts.Site8FirstWorked IS NOT NULL)


	UPDATE PendingContracts
		SET 	SITE1FirstWorked	= REPLACE(Site1Firstworked,'12:00AM',''),
			SITE2FirstWorked	= REPLACE(Site2Firstworked,'12:00AM',''),
			SITE3FirstWorked	= REPLACE(Site3Firstworked,'12:00AM',''),
			SITE4FirstWorked	= REPLACE(Site4Firstworked,'12:00AM',''),
			SITE5FirstWorked	= REPLACE(Site5Firstworked,'12:00AM',''),
			SITE6FirstWorked	= REPLACE(Site6Firstworked,'12:00AM',''),
			SITE7FirstWorked	= REPLACE(Site7Firstworked,'12:00AM',''),
			SITE8FirstWorked	= REPLACE(Site8Firstworked,'12:00AM','')

	UPDATE PendingContracts
		SET Site1FirstWorked  = '**HAS NOT WORKED**'
			WHERE Site1FirstWorked IS NULL 
			AND RecordStatus NOT LIKE ('%GALEN%')
			
	DROP TABLE #TEMPDATES



END

