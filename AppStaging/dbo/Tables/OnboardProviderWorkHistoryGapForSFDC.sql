CREATE TABLE [dbo].[OnboardProviderWorkHistoryGapForSFDC] (
    [SFDCName]         VARCHAR (80)   NULL,
    [ProviderMasterID] INT            NOT NULL,
    [WebID]            INT            NOT NULL,
    [SFID]             VARCHAR (50)   NOT NULL,
    [HospitalName]     VARCHAR (100)  NULL,
    [FromDate]         DATETIME       NULL,
    [ToDate]           DATETIME       NULL,
    [Description]      VARCHAR (8000) NULL
);

