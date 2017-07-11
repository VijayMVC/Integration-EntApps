CREATE TABLE [dbo].[SFDCVisaProvidersForWeb] (
    [SFID]                             NCHAR (18)     NOT NULL,
    [ProviderMasterID]                 NVARCHAR (10)  NULL,
    [WebID]                            NVARCHAR (10)  NULL,
    [LastName]                         NVARCHAR (80)  NOT NULL,
    [FirstName]                        NVARCHAR (40)  NULL,
    [Partnership_History__c]           NVARCHAR (255) NULL,
    [Partnership_History_Details_1__c] NVARCHAR (255) NULL,
    [From__c]                          DATETIME2 (7)  NULL,
    [To__c]                            DATETIME2 (7)  NULL,
    [Department__c]                    NVARCHAR (255) NULL
);

