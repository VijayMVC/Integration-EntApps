﻿CREATE TABLE [dbo].[SFDCReferenceStaging] (
    [Address_Line_1__c]            NVARCHAR (255)  NULL,
    [Address_Line_2__c]            NVARCHAR (255)  NULL,
    [City__c]                      NVARCHAR (100)  NULL,
    [Comment__c]                   NVARCHAR (255)  NULL,
    [ConnectionReceivedId]         NCHAR (18)      NULL,
    [ConnectionSentId]             NCHAR (18)      NULL,
    [Contact__c]                   NCHAR (18)      NULL,
    [Country_1__c]                 NVARCHAR (255)  NULL,
    [Country__c]                   NVARCHAR (255)  NULL,
    [CreatedById]                  NCHAR (18)      NULL,
    [CreatedDate]                  DATETIME2 (7)   NOT NULL,
    [Cred_CR_Address__c]           NVARCHAR (1300) NULL,
    [Date__c]                      DATETIME2 (7)   NULL,
    [Description__c]               NTEXT           NULL,
    [Email__c]                     NVARCHAR (80)   NULL,
    [Fax__c]                       NVARCHAR (40)   NULL,
    [First_Name__c]                NVARCHAR (100)  NULL,
    [Id]                           NCHAR (18)      NOT NULL,
    [IsDeleted]                    VARCHAR (5)     NOT NULL,
    [Last_Name__c]                 NVARCHAR (100)  NULL,
    [LastActivityDate]             DATETIME2 (7)   NULL,
    [LastModifiedById]             NCHAR (18)      NULL,
    [LastModifiedDate]             DATETIME2 (7)   NOT NULL,
    [LastReferencedDate]           DATETIME2 (7)   NULL,
    [LastViewedDate]               DATETIME2 (7)   NULL,
    [Mailing_Date__c]              DATETIME2 (7)   NULL,
    [Middle_Name__c]               NVARCHAR (100)  NULL,
    [Name]                         NVARCHAR (80)   NULL,
    [Name__c]                      NVARCHAR (100)  NULL,
    [Name_DDP__c]                  NVARCHAR (1300) NULL,
    [Organization__c]              NVARCHAR (100)  NULL,
    [OwnerId]                      NCHAR (18)      NOT NULL,
    [Phone__c]                     NVARCHAR (40)   NULL,
    [Provider__c]                  NCHAR (18)      NULL,
    [Provider_Type__c]             NVARCHAR (255)  NULL,
    [Received__c]                  VARCHAR (5)     NULL,
    [Received_Date__c]             DATETIME2 (7)   NULL,
    [Reference_Type__c]            NVARCHAR (255)  NULL,
    [Referral_Source__c]           NVARCHAR (255)  NULL,
    [Related_Id__c]                NVARCHAR (255)  NULL,
    [Salutation__c]                NVARCHAR (40)   NULL,
    [Scanned_Link__c]              NVARCHAR (255)  NULL,
    [State__c]                     NVARCHAR (255)  NULL,
    [Status__c]                    NVARCHAR (255)  NULL,
    [Suffix__c]                    NVARCHAR (255)  NULL,
    [SystemModstamp]               DATETIME2 (7)   NOT NULL,
    [Title__c]                     NVARCHAR (255)  NULL,
    [TriggeredByAnotherTrigger__c] VARCHAR (5)     NULL,
    [Verification__c]              NCHAR (18)      NULL,
    [Years_Known__c]               DECIMAL (18)    NULL,
    [Zip_Code__c]                  NVARCHAR (5)    NULL
);
