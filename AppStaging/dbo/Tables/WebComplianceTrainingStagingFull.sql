CREATE TABLE [dbo].[WebComplianceTrainingStagingFull] (
    [WCTSF_ID]          INT          IDENTITY (1, 1) NOT NULL,
    [ProviderLastName]  VARCHAR (50) NULL,
    [ProviderFirstName] VARCHAR (50) NULL,
    [Last4DigitSSN]     VARCHAR (10) NULL,
    [Completion_Dt]     VARCHAR (50) NULL,
    [Completion_Time]   VARCHAR (50) NULL,
    [ProviderMasterID]  INT          NULL,
    [Completion_Date]   DATETIME     NULL,
    [StaffGroup]        VARCHAR (50) NULL,
    [CreDate]           DATETIME     CONSTRAINT [DF_WebComplianceTrainingStagingFull_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]           DATETIME     CONSTRAINT [DF_WebComplianceTrainingStagingFull_UpdDate] DEFAULT (getdate()) NULL
);


GO
CREATE CLUSTERED INDEX [WCTSF_ID_idx]
    ON [dbo].[WebComplianceTrainingStagingFull]([WCTSF_ID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [WCTSF_ProviderMasterID_idx]
    ON [dbo].[WebComplianceTrainingStagingFull]([StaffGroup] ASC, [ProviderMasterID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [WCTSF_LastFirstName_idx]
    ON [dbo].[WebComplianceTrainingStagingFull]([ProviderLastName] ASC, [ProviderFirstName] ASC) WITH (FILLFACTOR = 90);

