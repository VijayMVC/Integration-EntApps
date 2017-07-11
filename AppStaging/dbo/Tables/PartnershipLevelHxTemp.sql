CREATE TABLE [dbo].[PartnershipLevelHxTemp] (
    [LastName]         CHAR (60)    NOT NULL,
    [FirstName]        CHAR (15)    NOT NULL,
    [FromDate]         DATETIME     NULL,
    [ToDate]           DATETIME     NULL,
    [Comment]          CHAR (66)    NOT NULL,
    [sec_cd]           CHAR (5)     NOT NULL,
    [otext]            CHAR (50)    NOT NULL,
    [note]             TEXT         NOT NULL,
    [ProviderMasterID] INT          NULL,
    [Clock]            INT          NULL,
    [Title]            VARCHAR (50) NULL,
    [Echo_ID]          VARCHAR (20) NULL,
    [PAFlag]           CHAR (1)     NULL
);

