CREATE TABLE [dbo].[KenticoSFDCLoad] (
    [AccountId]                       NCHAR (18)     NOT NULL,
    [Name]                            NVARCHAR (255) NOT NULL,
    [BillingCity]                     NVARCHAR (40)  NULL,
    [BillingState]                    NVARCHAR (80)  NULL,
    [BillingStreet]                   NVARCHAR (255) NULL,
    [BillingPostalCode]               NVARCHAR (20)  NULL,
    [StartDate]                       INT            NULL,
    [StaffedBeds]                     DECIMAL (18)   NULL,
    [PracticeLocation]                VARCHAR (255)  NULL,
    [Scribe_Program__c]               NTEXT          NULL,
    [Public_Community_Information__c] NTEXT          NULL,
    [Public_Site_Description__c]      NTEXT          NULL,
    [Visits]                          DECIMAL (18)   NULL,
    [EDMedicalDirector]               NVARCHAR (121) NULL,
    [HMMedicalDirector]               NVARCHAR (121) NULL,
    [TraumaLevel]                     NVARCHAR (255) NULL,
    [HospitalType]                    NVARCHAR (255) NULL,
    [AnesCases]                       DECIMAL (18)   NULL,
    [AnesMedicalDirector]             NVARCHAR (512) NULL
);

