CREATE TABLE [dbo].[WebComplianceTrainingStagingLog] (
    [WCTSL_ID]          INT          IDENTITY (1, 1) NOT NULL,
    [ProviderLastName]  VARCHAR (50) NULL,
    [ProviderFirstName] VARCHAR (50) NULL,
    [Last4DigitSSN]     VARCHAR (10) NULL,
    [Completion_Dt]     VARCHAR (50) NULL,
    [Completion_Time]   VARCHAR (50) NULL,
    [ProviderMasterID]  INT          NULL,
    [Completion_Date]   DATETIME     NULL,
    [StaffGroup]        VARCHAR (50) NULL,
    [CreDate]           DATETIME     CONSTRAINT [DF_WebComplianceTrainingStagingLog_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]           DATETIME     CONSTRAINT [DF_WebComplianceTrainingStagingLog_UpdDate] DEFAULT (getdate()) NULL
);

