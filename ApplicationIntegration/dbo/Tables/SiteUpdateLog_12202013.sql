CREATE TABLE [dbo].[SiteUpdateLog_12202013] (
    [ProviderMasterID] INT           NULL,
    [WebID]            INT           NULL,
    [SiteAction]       VARCHAR (20)  NULL,
    [WebCode]          VARCHAR (5)   NULL,
    [PrimarySite]      CHAR (1)      NULL,
    [Author]           VARCHAR (255) NULL,
    [TimeStmp]         DATETIME      NULL,
    [SentFlag]         CHAR (1)      NULL,
    [SentDate]         DATETIME      NULL
);

