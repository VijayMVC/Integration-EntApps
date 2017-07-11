CREATE TABLE [dbo].[WorkHistMapping] (
    [Galen_Contracted_Site__c]    BIT            NOT NULL,
    [CEPA_Contracted_Site__c]     BIT            NOT NULL,
    [Other_Contracted_Site__c]    BIT            NOT NULL,
    [Healthcare_Facility_Name__c] NVARCHAR (255) NULL,
    [Health_Care_Facility__c]     NVARCHAR (255) NULL,
    [ContractHolderName]          NVARCHAR (255) NULL,
    [ContractHolderID]            NVARCHAR (255) NULL,
    [Practice Location]           NVARCHAR (255) NULL
);

