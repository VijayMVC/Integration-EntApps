CREATE TABLE [dbo].[RegionLookup] (
    [RegionID]          INT           NOT NULL,
    [StaffGroup]        VARCHAR (50)  NULL,
    [RegionName]        VARCHAR (100) NULL,
    [OutlookRegionName] VARCHAR (100) NULL,
    [WebRegionID]       INT           NULL,
    [WebRegionCode]     VARCHAR (50)  NULL,
    [DummyRegionFlag]   CHAR (1)      CONSTRAINT [DF_RegionLookup_DummyRegionFlag] DEFAULT ('N') NULL,
    [CreDate]           DATETIME      CONSTRAINT [DF_RegionLookup_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]           DATETIME      CONSTRAINT [DF_RegionLookup_UpdDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_RegionLookup] PRIMARY KEY NONCLUSTERED ([RegionID] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE CLUSTERED INDEX [RegionLookup_Clustered_RegionID_idx]
    ON [dbo].[RegionLookup]([RegionID] ASC) WITH (FILLFACTOR = 90);


GO
GRANT SELECT
    ON OBJECT::[dbo].[RegionLookup] TO [MEDAMERICA\SpearM]
    AS [dbo];

