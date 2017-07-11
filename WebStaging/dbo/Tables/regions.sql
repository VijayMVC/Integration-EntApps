CREATE TABLE [dbo].[regions] (
    [ID]             INT            NOT NULL,
    [RegionName]     VARCHAR (100)  NOT NULL,
    [RegionName_old] NVARCHAR (100) NOT NULL,
    [RegionCode]     CHAR (5)       NOT NULL,
    [Region_Dir]     INT            NOT NULL,
    [AscRegion_Dir]  INT            NULL,
    [division]       CHAR (4)       NULL,
    [state]          CHAR (2)       NOT NULL
);

