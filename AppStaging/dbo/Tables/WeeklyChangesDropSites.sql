CREATE TABLE [dbo].[WeeklyChangesDropSites] (
    [ProviderMasterID]   INT           NULL,
    [Sites]              VARCHAR (500) NULL,
    [WebCode1]           VARCHAR (10)  NULL,
    [WebCode2]           VARCHAR (10)  NULL,
    [WebCode3]           VARCHAR (10)  NULL,
    [WebCode4]           VARCHAR (10)  NULL,
    [Site1]              VARCHAR (100) NULL,
    [Site2]              VARCHAR (100) NULL,
    [Site3]              VARCHAR (100) NULL,
    [Site4]              VARCHAR (100) NULL,
    [Site1EffectiveDate] VARCHAR (50)  NULL,
    [Site2EffectiveDate] VARCHAR (50)  NULL,
    [Site3EffectiveDate] VARCHAR (50)  NULL,
    [Site4EffectiveDate] VARCHAR (50)  NULL,
    [Credate]            DATETIME      CONSTRAINT [DF_WeeklyChangesDropSites_Credate] DEFAULT (getdate()) NULL
);

