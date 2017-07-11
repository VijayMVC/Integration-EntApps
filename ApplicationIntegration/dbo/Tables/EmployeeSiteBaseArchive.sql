CREATE TABLE [dbo].[EmployeeSiteBaseArchive] (
    [SFID]             NCHAR (18)    NULL,
    [ProviderMasterID] INT           NULL,
    [WebID]            INT           NULL,
    [HospitalSFID]     NCHAR (18)    NULL,
    [WebCode]          VARCHAR (10)  NULL,
    [HospitalName]     VARCHAR (255) NULL,
    [PrimarySite]      CHAR (10)     NULL,
    [LoadDate]         DATETIME      NOT NULL
);

