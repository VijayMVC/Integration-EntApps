CREATE TABLE [dbo].[TestDates] (
    [ProviderMasterID]  INT          NULL,
    [WebID]             INT          NULL,
    [LastName]          VARCHAR (50) NULL,
    [FirstName]         VARCHAR (50) NULL,
    [LawsonHireDate]    DATETIME     NULL,
    [LawsonAdjHireDate] DATETIME     NULL,
    [TimeCardDate]      DATETIME     NULL,
    [LawsonID]          INT          NOT NULL
);

