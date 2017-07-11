CREATE TABLE [dbo].[WebPartnershipLevelStaging] (
    [ProviderMasterID] INT             NULL,
    [ClockNo]          VARCHAR (10)    NULL,
    [Name]             VARCHAR (100)   NULL,
    [Title]            VARCHAR (50)    NULL,
    [CurrentLevel]     VARCHAR (20)    NULL,
    [EffectiveDate]    DATETIME        NULL,
    [HoursAccrued]     NUMERIC (10, 2) NULL,
    [FullSeniorFlag]   CHAR (1)        NULL,
    [echo_dr_no_ext]   VARCHAR (30)    NULL,
    [Credate]          DATETIME        CONSTRAINT [DF_WebPartnershipLevelStaging_Credate] DEFAULT (getdate()) NULL
);

