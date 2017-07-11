CREATE TABLE [dbo].[YTDProductivityMD] (
    [ProviderMasterID] INT          NULL,
    [MARSVisitsYTD]    INT          NULL,
    [LastName]         VARCHAR (50) NULL,
    [PreferredName]    VARCHAR (50) NULL,
    [Credate]          DATETIME     CONSTRAINT [DF_YTDProductivityMD_Credate] DEFAULT (getdate()) NULL
);

