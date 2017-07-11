USE [ApplicationIntegration]
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateSFDC_New]    Script Date: 11/10/2016 14:21:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[usp_UpdateSFDC_New]
AS

/* 	Purpose:	Update SFDC with the latest changes from the
				Provider Master Database
	Revision:	List of Tables:
				ProviderMaster,
				Hospital_Region
			2/12/20007 - Antonia Miller - Added routine to
					make organization name blank in SFDC if
					Site 1 is blank in MPDB,
					per Angella Bernal/Jen Munkner
    Revision:   Total ReWrite.  10/7/2016 Richard Myers
    Revision:   Bug Fix HCM-1690.  11/3/2016 Richard Myers
    Revision:   Rewrite Update to SFDC using OpenQuery -- 11/10/2016

*/
SET QUOTED_IDENTIFIER OFF
SET ANSI_NULLS OFF
SET DEADLOCK_PRIORITY HIGH
/*
TESTING
exec usp_UpdateSFDC_New
*/

BEGIN
    -- Creating table so that columns will accept null values  
    CREATE TABLE #DIFFS(
        [ID] [NCHAR](18) NULL,
        [ProviderMasterId]  Int NULL,
        [FirstName] [NVARCHAR](50) NULL,
        [MiddleNameOrInitial] [NVARCHAR](64) NULL,
        [LastName] [NVARCHAR](80) NULL,
        [ts2_FirstName] [NVARCHAR](50) NULL,
        [ts2_MiddleNameOrInitial] [NVARCHAR](64) NULL,
        [ts2_LastName] [NVARCHAR](50) NULL,
        [CEPEmailAddress] [NVARCHAR](100) NULL,
        [Title] [NVARCHAR](255) NULL,
        [SpouseName] [NVARCHAR](255) NULL,
        [MaritalStatus] [NVARCHAR](255) NULL,
        [CellPhone] [NVARCHAR](40) NULL,
        [Phone] [NVARCHAR](40) NULL,
        [Fax] [NVARCHAR](40) NULL,
        [Addr] [NVARCHAR](255) NULL,
        [City] [NVARCHAR](40) NULL,
        [State] [NVARCHAR](80) NULL,
        [Zip] [NVARCHAR](20) NULL,
        [Cred_Other_First_Name] [NVARCHAR](255) NULL,
        [HomePhone] [NVARCHAR](40) NULL
    )

    insert into #DIFFS
    select *
    from (
    SELECT
         con.ID                                               AS ID
        ,PMB.ProviderMasterID                                AS ProviderMasterID
        ,isnull(PMB.FirstName                           ,'') AS FirstName
        ,isnull(PMB.MiddleNameOrInitial                 ,'') AS MiddleNameOrInitial
        ,isnull(PMB.LastName                            ,'') AS LastName
        ,isnull(PMB.FirstName                           ,'') AS ts2_FirstName
        ,isnull(PMB.MiddleNameOrInitial                 ,'') AS ts2_MiddleNameOrInitial
        ,isnull(PMB.LastName                            ,'') AS ts2_LastName
        ,isnull(lower(PMB.CEPEmail)                     ,'') AS CEPEmailAddress
        ,isnull(CASE WHEN CHARINDEX(',', LTRIM(RTRIM(PMB.Title))) <> 0
            THEN Left(LTRIM(RTRIM(PMB.Title)), CHARINDEX(',', LTRIM(RTRIM(PMB.Title))) - 1)
            ELSE LTRIM(RTRIM(PMB.Title)) END            ,'') AS Title
        ,isnull(PMB.SpouseName                          ,'') AS SpouseName
        ,isnull(PMB.MaritalStatus                       ,'') AS MaritalStatus
        ,isnull(SUBSTRING(PMB.CellPhoneNbr,1,14)        ,'') AS CellPhone
        ,isnull(SUBSTRING(PMB.PhoneNbr1,1,14)            ,'') As Phone
        ,isnull(SUBSTRING(PMB.FaxNbr1,1,14)              ,'') AS Fax
        ,isnull(PMB.Address2                             ,'') AS Addr
        ,isnull(RTRIM(LTRIM(SUBSTRING(PMB.City2,1,20)))  ,'') AS City
        ,isnull(PMB.State2                               ,'') AS State
        ,isnull(LTRIM(RTRIM(LEFT(PMB.ZipCode2,5)))       ,'') AS Zip
        ,isnull(case when ISNULL(PMB.FirstName,'') <> ISNULL(Con.FirstName,'')
                    then PMB.FirstName
                    else Con.Cred_Other_First_Name__c
                END                                      ,'') AS Cred_Other_First_Name
        ,isnull(SUBSTRING(PMB.PhoneNbr1,1,14)            ,'') As HomePhone
        --,PMB.Status
    FROM ProviderMaster Prov
    JOIN ProviderMasterBase PMB
        ON Prov.ProviderMasterID = PMB.ProviderMasterID
    JOIN AppStaging.dbo.SFDCContactStaging Con
        ON Prov.ProviderMasterID = isnull(Con.Provider_Master_ID__c,-1)
        OR (Con.Provider_Master_ID__c is null and Prov.SFID = Con.Id)
    WHERE Prov.CurrentProviderFlag = 'Y'
		AND Prov.PartnershipLevel NOT LIKE '%LOCUM%'
    EXCEPT
    SELECT
         con.ID                                               AS ID
       ,Con.Provider_Master_ID__c                   AS ProviderMasterID
       ,isnull(Con.FirstName           ,'')         AS FirstName
       ,isnull(Con.Middle_Name__c      ,'')         AS MiddleNameOrInitial
       ,isnull(con.LastName            ,'')         AS LastName
       ,isnull(Con.ts2__Firstname__c   ,'')         AS ts2_FirstName
       ,isnull(Con.ts2__Middlename__c  ,'')         AS ts2_MiddleNameOrInitial
       ,isnull(con.ts2__Lastname__c    ,'')         AS ts2_LastName
       ,isnull(lower(Con.Email)        ,'')         AS CEPEmailAddress
       ,isnull(Con.Title__c            ,'')         AS Title
       ,isnull(Cred_Spouse_Name__c     ,'')         AS SpouseName
       ,isnull(Cred_Marital_Status__c  ,'')         AS MaritalStatus
       ,isnull(MobilePhone             ,'')         AS CellPhone
       ,isnull(Con.Phone               ,'')         As Phone
       ,isnull(con.Fax                 ,'')         AS Fax
       ,isnull(MailingStreet           ,'')         AS Addr
       ,isnull(MailingCity             ,'')         AS City
       ,isnull(MailingState            ,'')         AS State
       ,isnull(MailingPostalCode       ,'')         AS Zip
       ,isnull(Cred_Other_First_Name__c,'')         AS Cred_Other_First_Name
       ,isnull(Con.HomePhone           ,'')         As HomePhone
       --PMB.Status
    FROM ProviderMaster Prov
    JOIN ProviderMasterBase PMB
        ON Prov.ProviderMasterID = PMB.ProviderMasterID
    JOIN AppStaging.dbo.SFDCContactStaging Con
        ON Prov.ProviderMasterID = isnull(Con.Provider_Master_ID__c,-1)
        OR (Con.Provider_Master_ID__c is null and Prov.SFID = Con.Id)
    WHERE Prov.CurrentProviderFlag = 'Y'
		AND Prov.PartnershipLevel NOT LIKE '%LOCUM%'
    ) X

/*
    -- TESTING
SELECT 'WEBData' AS SRC, X.*
FROM #DIFFS X
    UNION
SELECT 'SFDC' AS SRC, X.*
FROM (
    SELECT
        --Con.Provider_Master_ID__c                   AS ProviderMasterID
         con.ID                                               AS ID
       ,isnull(Con.FirstName           ,'')         AS FirstName
       ,isnull(Con.Middle_Name__c      ,'')         AS MiddleNameOrInitial
       ,isnull(con.LastName            ,'')         AS LastName
       ,isnull(Con.ts2__Firstname__c   ,'')         AS ts2_FirstName
       ,isnull(Con.ts2__Middlename__c  ,'')         AS ts2_MiddleNameOrInitial
       ,isnull(con.ts2__Lastname__c    ,'')         AS ts2_LastName
       ,isnull(lower(Con.Email)        ,'')         AS CEPEmailAddress
       ,isnull(Con.Title__c            ,'')         AS Title
       ,isnull(Cred_Spouse_Name__c     ,'')         AS SpouseName
       ,isnull(Cred_Marital_Status__c  ,'')         AS MaritalStatus
       ,isnull(MobilePhone             ,'')         AS CellPhone
       ,isnull(Con.Phone               ,'')         As Phone
       ,isnull(con.Fax                 ,'')         AS Fax
       ,isnull(MailingStreet           ,'')         AS Addr
       ,isnull(MailingCity             ,'')         AS City
       ,isnull(MailingState            ,'')         AS State
       ,isnull(MailingPostalCode       ,'')         AS Zip
       ,isnull(Cred_Other_First_Name__c,'')         AS Cred_Other_First_Name
    FROM ProviderMaster Prov
    JOIN AppStaging.dbo.SFDCContactStaging Con
        ON Prov.ProviderMasterID = Con.Provider_Master_ID__c
    WHERE Prov.CurrentProviderFlag = 'Y'
    EXCEPT
    SELECT
         --Prov.ProviderMasterID                                AS ProviderMasterID
         con.ID                                               AS ID
        ,isnull(Prov.FirstName                           ,'') AS FirstName
        ,isnull(Prov.MiddleNameOrInitial                 ,'') AS MiddleNameOrInitial
        ,isnull(Prov.LastName                            ,'') AS LastName
        ,isnull(Prov.FirstName                           ,'') AS ts2_FirstName
        ,isnull(Prov.MiddleNameOrInitial                 ,'') AS ts2_MiddleNameOrInitial
        ,isnull(Prov.LastName                            ,'') AS ts2_LastName
        ,isnull(lower(Prov.CEPEmailAddress)              ,'') AS CEPEmailAddress
        ,isnull(CASE WHEN CHARINDEX(',', LTRIM(RTRIM(Prov.Title))) <> 0
            THEN Left(LTRIM(RTRIM(Prov.Title)), CHARINDEX(',', LTRIM(RTRIM(Prov.Title))) - 1)
            ELSE LTRIM(RTRIM(Prov.Title)) END            ,'') AS Title
        ,isnull(Prov.SpouseName                          ,'') AS SpouseName
        ,isnull(Prov.MaritalStatus                       ,'') AS MaritalStatus
        ,isnull(SUBSTRING(Prov.CellPhoneNbr,1,14)        ,'') AS CellPhone
        ,isnull(SUBSTRING(PMB.PhoneNbr1,1,14)            ,'') As Phone
        ,isnull(SUBSTRING(PMB.FaxNbr1,1,14)              ,'') AS Fax
        ,isnull(PMB.Address2                             ,'') AS Addr
        ,isnull(RTRIM(LTRIM(SUBSTRING(PMB.City2,1,20)))  ,'') AS City
        ,isnull(PMB.State2                               ,'') AS State
        ,isnull(LTRIM(RTRIM(LEFT(PMB.ZipCode2,5)))       ,'') AS Zip
        ,isnull(case when ISNULL(Prov.FirstName,'') <> ISNULL(Con.FirstName,'')
                    then Prov.FirstName
                    else Con.Cred_Other_First_Name__c
                END                                      ,'') AS Cred_Other_First_Name
    FROM ProviderMaster Prov
    JOIN AppStaging.dbo.SFDCContactStaging Con
        ON Prov.ProviderMasterID = Con.Provider_Master_ID__c
    left join ProviderMasterBase PMB
        ON Prov.ProviderMasterID = PMB.ProviderMasterID
    WHERE Prov.CurrentProviderFlag = 'Y'
    ) X
ORDER BY  ID, SRC
*/
    UPDATE #DIFFS
    SET
         Cred_Other_First_Name     = CASE WHEN D.Cred_Other_First_Name   = '' then C.Cred_Other_First_Name__c else D.Cred_Other_First_Name    END
       , FirstName                 = CASE WHEN D.FirstName               = '' then C.FirstName                else D.FirstName                END
       , MiddleNameOrInitial       = CASE WHEN D.MiddleNameOrInitial     = '' then C.Middle_Name__c           else D.MiddleNameOrInitial      END
       , LastName                  = CASE WHEN D.LastName                = '' then C.LastName                 else D.LastName                 END
       , ts2_FirstName             = CASE WHEN D.ts2_FirstName           = '' then C.ts2__Firstname__c        else D.ts2_FirstName            END
       , ts2_MiddleNameOrInitial   = CASE WHEN D.ts2_MiddleNameOrInitial = '' then C.ts2__Middlename__c       else D.ts2_MiddleNameOrInitial  END
       , ts2_LastName              = CASE WHEN D.ts2_LastName            = '' then C.ts2__Lastname__c         else D.ts2_LastName             END
       , CEPEmailAddress           = CASE WHEN D.CEPEmailAddress         = '' then C.Email                    else D.CEPEmailAddress          END
       , Title                     = CASE WHEN D.Title                   = '' then C.Title__c                 else D.Title                    END
       , SpouseName                = CASE WHEN D.SpouseName              = '' then C.Cred_Spouse_Name__c      else D.SpouseName               END
       , MaritalStatus             = CASE WHEN D.MaritalStatus           = '' then C.Cred_Marital_Status__c   else D.MaritalStatus            END
       , CellPhone                 = CASE WHEN D.CellPhone               = '' then C.MobilePhone              else D.CellPhone                END
       , Phone                     = CASE WHEN D.Phone                   = '' then COALESCE(C.Phone, c.HomePhone) else D.Phone                    END
       , Fax                       = CASE WHEN D.Fax                     = '' then C.Fax                      else D.Fax                      END
       , Addr                      = CASE WHEN D.Addr                    = '' then C.MailingStreet            else D.Addr                     END
       , City                      = CASE WHEN D.City                    = '' then C.MailingCity              else D.City                     END
       , State                     = CASE WHEN D.State                   = '' then C.MailingState             else D.State                    END
       , Zip                       = CASE WHEN D.Zip                     = '' then C.MailingPostalCode        else D.Zip                      END
       , HomePhone                 = CASE WHEN D.Phone                   = '' then C.HomePhone                else D.Phone                    END

    FROM #DIFFS               D
    JOIN AppStaging.dbo.SFDCContactStaging C ON D.ID = C.ID
--SELECT * FROM #DIFFS

    --UPDATE Salesforce...Contact
    --SET
    --     Provider_Master_ID__c     = D.ProviderMasterID
    --   , Cred_Other_First_Name__c  = D.Cred_Other_First_Name
    --   , FirstName                 = D.FirstName
    --   , Middle_Name__c            = D.MiddleNameOrInitial
    --   , LastName                  = D.LastName
    --   , ts2__Firstname__c         = D.ts2_FirstName
    --   , ts2__Middlename__c        = D.ts2_MiddleNameOrInitial
    --   , ts2__Lastname__c          = D.ts2_LastName
    --   , Secondary_Email__c		   = CASE WHEN (C.Email LIKE '%@cep.com%'
				--								or C.Email LIKE '%@galen.com%')
				--						 THEN C.Secondary_Email__c
				--						 ELSE Contact.Email END
    --   , Email                    = D.CEPEmailAddress
    --   , Title__c                 = D.Title
    --   , Cred_Spouse_Name__c      = D.SpouseName
    --   , Cred_Marital_Status__c   = D.MaritalStatus
    --   , MobilePhone              = D.CellPhone
    --   , Phone                    = D.Phone
    --   , Fax                      = D.Fax
    --   , MailingStreet            = D.Addr
    --   , MailingCity              = D.City
    --   , MailingState             = D.State
    --   , MailingPostalCode        = D.Zip
    --   , HomePhone                = D.HomePhone
    --FROM Salesforce...Contact C
    --JOIN #DIFFS               D     ON D.ID = C.ID
    
    
    
    
    UPDATE C
	SET
			 C.Provider_Master_ID__c     = D.ProviderMasterID
		   , C.Cred_Other_First_Name__c  = D.Cred_Other_First_Name
		   , C.FirstName                 = D.FirstName
		   , C.Middle_Name__c            = D.MiddleNameOrInitial
		   , C.LastName                  = D.LastName
		   , C.ts2__Firstname__c         = D.ts2_FirstName
		   , C.ts2__Middlename__c        = D.ts2_MiddleNameOrInitial
		   , C.ts2__Lastname__c          = D.ts2_LastName
		   , C.Secondary_Email__c		   = CASE WHEN (C.Email LIKE '%@cep.com%'
													or C.Email LIKE '%@galen.com%')
											 THEN C.Secondary_Email__c
											 ELSE C.Email END
		   , C.Email                    = D.CEPEmailAddress
		   , C.Title__c                 = D.Title
		   , C.Cred_Spouse_Name__c      = D.SpouseName
		   , C.Cred_Marital_Status__c   = D.MaritalStatus
		   , C.MobilePhone              = D.CellPhone
		   , C.Phone                    = D.Phone
		   , C.Fax                      = D.Fax
		   , C.MailingStreet            = D.Addr
		   , C.MailingCity              = D.City
		   , C.MailingState             = D.State
		   , C.MailingPostalCode        = D.Zip
		   , C.HomePhone                = D.HomePhone
	FROM
     (SELECT * FROM OPENQUERY(SALESFORCE,
							'Select Id
								   , Provider_Master_ID__c 
								   , Cred_Other_First_Name__c 
								   , FirstName              
								   , Middle_Name__c          
								   , LastName                
								   , ts2__Firstname__c      
								   , ts2__Middlename__c        
								   , ts2__Lastname__c          
								   , Secondary_Email__c		   
								   , Email                    
								   , Title__c                
								   , Cred_Spouse_Name__c      
								   , Cred_Marital_Status__c   
								   , MobilePhone              
								   , Phone                    
								   , Fax                     
								   , MailingStreet            
								   , MailingCity              
								   , MailingState            
								   , MailingPostalCode        
								   , HomePhone  
							FROM Contact   '))C
	JOIN #DIFFS D ON C.Id = D.ID
	
 

END
