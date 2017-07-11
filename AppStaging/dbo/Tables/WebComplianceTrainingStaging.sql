CREATE TABLE [dbo].[WebComplianceTrainingStaging] (
    [ProviderLastName]  VARCHAR (50) NULL,
    [ProviderFirstName] VARCHAR (50) NULL,
    [Last4DigitSSN]     VARCHAR (10) NULL,
    [Completion_Dt]     VARCHAR (50) NULL,
    [Completion_Time]   VARCHAR (50) NULL,
    [ProviderMasterID]  INT          NULL,
    [Completion_Date]   DATETIME     NULL,
    [StaffGroup]        VARCHAR (50) NULL
);


GO
CREATE CLUSTERED INDEX [WCTS_ProviderMasterID_idx]
    ON [dbo].[WebComplianceTrainingStaging]([StaffGroup] ASC, [ProviderMasterID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [WCTS_LastFirstName_idx]
    ON [dbo].[WebComplianceTrainingStaging]([ProviderLastName] ASC, [ProviderFirstName] ASC) WITH (FILLFACTOR = 90);

