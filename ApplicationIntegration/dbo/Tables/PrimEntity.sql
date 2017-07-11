CREATE TABLE [dbo].[PrimEntity] (
    [FacilityId]                    NVARCHAR (255) NULL,
    [Name]                          NVARCHAR (255) NULL,
    [Record_Status__c]              NVARCHAR (255) NULL,
    [Staff_Status1__c]              NVARCHAR (255) NULL,
    [Facility__c]                   NVARCHAR (255) NULL,
    [Title__c]                      NVARCHAR (255) NULL,
    [CreatedDate]                   DATETIME       NULL,
    [Primary_Entity__c(TRUE/FALSE)] BIT            NOT NULL
);

