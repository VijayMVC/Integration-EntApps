CREATE TABLE [dbo].[SiteUpdates_12202013] (
    [ProviderMasterID] INT          NULL,
    [WebID]            INT          NULL,
    [WebCode]          VARCHAR (5)  NULL,
    [PrimarySite]      CHAR (10)    NOT NULL,
    [TimeStmp]         DATETIME     NULL,
    [Author]           VARCHAR (60) NULL,
    [Status]           CHAR (1)     NULL
);

