CREATE TABLE [dbo].[SiteBase] (
    [SFID]             NCHAR (18)    NULL,
    [ProviderMasterID] INT           NULL,
    [WebID]            INT           NULL,
    [HospitalSFID]     NCHAR (18)    NULL,
    [WebCode]          VARCHAR (50)  NULL,
    [HospitalName]     VARCHAR (255) NULL,
    [PrimarySite]      CHAR (10)     NOT NULL
);

