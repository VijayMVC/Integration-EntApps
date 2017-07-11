CREATE TABLE [dbo].[LawsonIDMatchSFDC] (
    [ProviderMasterID] INT          NULL,
    [SSN]              CHAR (20)    NULL,
    [LawsonEmpNo]      INT          NULL,
    [LawsonLastName]   CHAR (30)    NULL,
    [LawsonFirstName]  CHAR (15)    NULL,
    [LawsonEmpStatus]  CHAR (2)     NULL,
    [LawsonNameSuffix] CHAR (4)     NULL,
    [CEPWebID]         INT          NULL,
    [SFID]             CHAR (18)    NULL,
    [SiteLineCntID]    INT          NULL,
    [NationalID]       VARCHAR (30) NULL,
    [CreDate]          DATETIME     NULL,
    [UpdDate]          DATETIME     NULL
);

