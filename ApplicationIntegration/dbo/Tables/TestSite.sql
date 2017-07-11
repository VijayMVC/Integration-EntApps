CREATE TABLE [dbo].[TestSite] (
    [SFID]             CHAR (18)     NOT NULL,
    [ProviderMasterID] INT           NOT NULL,
    [WebID]            INT           NULL,
    [SiteSFID]         CHAR (18)     NULL,
    [Code]             CHAR (50)     NULL,
    [SiteName]         VARCHAR (255) NULL,
    [PrimarySite]      VARCHAR (5)   NOT NULL
);

