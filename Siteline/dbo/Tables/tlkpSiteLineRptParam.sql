CREATE TABLE [dbo].[tlkpSiteLineRptParam] (
    [Id]        INT      IDENTITY (1, 1) NOT NULL,
    [StartDate] DATETIME NULL,
    [EndDate]   DATETIME NULL,
    CONSTRAINT [PK_tlkpRptParam] PRIMARY KEY CLUSTERED ([Id] ASC)
);

