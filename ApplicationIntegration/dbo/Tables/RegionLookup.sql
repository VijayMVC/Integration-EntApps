CREATE TABLE [dbo].[RegionLookup] (
    [RegionID]          INT           IDENTITY (1, 1) NOT NULL,
    [StaffGroup]        VARCHAR (50)  NULL,
    [RegionName]        VARCHAR (100) NULL,
    [OutlookRegionName] VARCHAR (100) NULL,
    [WebRegionID]       INT           NULL,
    [WebRegionCode]     VARCHAR (50)  NULL,
    [DummyRegionFlag]   CHAR (1)      NULL,
    [CreDate]           DATETIME      NULL,
    [UpdDate]           DATETIME      NULL
);

