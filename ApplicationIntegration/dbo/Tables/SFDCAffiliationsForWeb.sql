CREATE TABLE [dbo].[SFDCAffiliationsForWeb] (
    [ProviderMasterID] INT           NULL,
    [WebID]            INT           NULL,
    [AffiliationType]  VARCHAR (50)  NULL,
    [Affiliation]      VARCHAR (100) NULL,
    [FromDate]         DATETIME      NULL,
    [ToDate]           DATETIME      NULL,
    [CreDate]          DATETIME      NULL,
    [UpdDate]          DATETIME      NULL
);

