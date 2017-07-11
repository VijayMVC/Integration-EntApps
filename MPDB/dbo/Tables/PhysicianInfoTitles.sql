CREATE TABLE [dbo].[PhysicianInfoTitles] (
    [TitleID]              INT       IDENTITY (1, 1) NOT NULL,
    [PhysicianInfoID]      INT       NULL,
    [TitleCode]            CHAR (4)  NULL,
    [RegionCode]           CHAR (5)  NULL,
    [Hospital_Region_Code] CHAR (20) NULL,
    [StartDate]            DATETIME  CONSTRAINT [DF_Title_StartDate] DEFAULT (getdate()) NULL,
    [EndDate]              DATETIME  NULL,
    [ActiveFlag]           CHAR (1)  CONSTRAINT [DF_Title_ActiveFlag] DEFAULT ('Y') NULL,
    [CreDate]              DATETIME  CONSTRAINT [DF_Title_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]              DATETIME  CONSTRAINT [DF_Title_UpdDate] DEFAULT (getdate()) NULL
);

