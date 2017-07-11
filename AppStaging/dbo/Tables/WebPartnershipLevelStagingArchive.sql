CREATE TABLE [dbo].[WebPartnershipLevelStagingArchive] (
    [ProviderMasterID]        INT           NULL,
    [ClockNo]                 VARCHAR (10)  NULL,
    [Name]                    VARCHAR (100) NULL,
    [Title]                   VARCHAR (50)  NULL,
    [CurrentLevel]            VARCHAR (20)  NULL,
    [EffectiveDate]           DATETIME      NULL,
    [HoursAccrued]            VARCHAR (20)  NULL,
    [ExpectedAdvancementDate] DATETIME      NULL,
    [AdvanceFlag]             VARCHAR (3)   NULL,
    [FullSeniorFlag]          CHAR (1)      NULL,
    [Credate]                 DATETIME      NULL
);

