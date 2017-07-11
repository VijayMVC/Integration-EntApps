CREATE TABLE [dbo].[PublicInfo] (
    [AccountId]                       NVARCHAR (255) NULL,
    [Name]                            NVARCHAR (255) NULL,
    [BillingCity]                     NVARCHAR (255) NULL,
    [BillingState]                    NVARCHAR (255) NULL,
    [BillingStreet]                   NVARCHAR (255) NULL,
    [BillingPostalCode]               NVARCHAR (255) NULL,
    [StartDate]                       DATETIME       NULL,
    [StaffedBeds]                     FLOAT (53)     NULL,
    [PracticeLocation]                NVARCHAR (255) NULL,
    [Scribe_Program__c]               NVARCHAR (255) NULL,
    [Public_Community_Information__c] NVARCHAR (MAX) NULL,
    [Public_Site_Description__c]      NVARCHAR (MAX) NULL,
    [Visits]                          FLOAT (53)     NULL,
    [EDMedicalDirector]               NVARCHAR (255) NULL,
    [HMMedicalDirector]               NVARCHAR (255) NULL,
    [TraumaLevel]                     FLOAT (53)     NULL,
    [HospitalType]                    NVARCHAR (255) NULL
);

