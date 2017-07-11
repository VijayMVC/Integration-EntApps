﻿CREATE TABLE [dbo].[SFDCCredentialsStaging] (
    [Cert_Lic_Number__c]           NVARCHAR (50)  NULL,
    [Comments__c]                  NTEXT          NULL,
    [ConnectionReceivedId]         NCHAR (18)     NULL,
    [ConnectionSentId]             NCHAR (18)     NULL,
    [Contact__c]                   NCHAR (18)     NULL,
    [Copy_on_File__c]              VARCHAR (5)    NULL,
    [CreatedById]                  NCHAR (18)     NULL,
    [CreatedDate]                  DATETIME2 (7)  NOT NULL,
    [DEA_State_of_Registration__c] NVARCHAR (255) NULL,
    [Expiration_Date__c]           DATETIME2 (7)  NULL,
    [Fee_Exempt__c]                VARCHAR (5)    NULL,
    [Id]                           NCHAR (18)     NOT NULL,
    [IsDeleted]                    VARCHAR (5)    NOT NULL,
    [Issue_Date__c]                DATETIME2 (7)  NULL,
    [Issuer_1__c]                  NCHAR (18)     NULL,
    [LastActivityDate]             DATETIME2 (7)  NULL,
    [LastModifiedById]             NCHAR (18)     NULL,
    [LastModifiedDate]             DATETIME2 (7)  NOT NULL,
    [LastReferencedDate]           DATETIME2 (7)  NULL,
    [LastViewedDate]               DATETIME2 (7)  NULL,
    [Name]                         NVARCHAR (80)  NULL,
    [OwnerId]                      NCHAR (18)     NOT NULL,
    [RecordTypeId]                 NCHAR (18)     NULL,
    [Related_Id__c]                NVARCHAR (255) NULL,
    [Renewed__c]                   DATETIME2 (7)  NULL,
    [SystemModstamp]               DATETIME2 (7)  NOT NULL,
    [Type__c]                      NVARCHAR (255) NULL,
    [Verifications__c]             NCHAR (18)     NULL
);

