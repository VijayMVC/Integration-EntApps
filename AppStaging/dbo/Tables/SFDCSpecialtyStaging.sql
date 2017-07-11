CREATE TABLE [dbo].[SFDCSpecialtyStaging] (
    [Board_Eligible__c]             NVARCHAR (255) NULL,
    [Certified__c]                  NVARCHAR (255) NULL,
    [ConnectionReceivedId]          NCHAR (18)     NULL,
    [ConnectionSentId]              NCHAR (18)     NULL,
    [Contact__c]                    NCHAR (18)     NULL,
    [CreatedById]                   NCHAR (18)     NULL,
    [CreatedDate]                   DATETIME2 (7)  NOT NULL,
    [Expiration_Date__c]            DATETIME2 (7)  NULL,
    [Id]                            NCHAR (18)     NOT NULL,
    [Initial_Certification_Date__c] DATETIME2 (7)  NULL,
    [IsDeleted]                     VARCHAR (5)    NOT NULL,
    [LastActivityDate]              DATETIME2 (7)  NULL,
    [LastModifiedById]              NCHAR (18)     NULL,
    [LastModifiedDate]              DATETIME2 (7)  NOT NULL,
    [LastReferencedDate]            DATETIME2 (7)  NULL,
    [LastViewedDate]                DATETIME2 (7)  NULL,
    [Name]                          NVARCHAR (80)  NULL,
    [OwnerId]                       NCHAR (18)     NOT NULL,
    [Recertification_Date__c]       DATETIME2 (7)  NULL,
    [Specialty__c]                  NVARCHAR (255) NULL,
    [SystemModstamp]                DATETIME2 (7)  NOT NULL
);

