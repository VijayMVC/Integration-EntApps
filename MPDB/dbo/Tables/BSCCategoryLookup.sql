CREATE TABLE [dbo].[BSCCategoryLookup] (
    [BSCAL_ID]      INT           NOT NULL,
    [StaffGroup]    VARCHAR (50)  NULL,
    [CurrentYear]   CHAR (4)      NULL,
    [PriorYear]     CHAR (4)      NULL,
    [CategoryCode]  CHAR (4)      NULL,
    [CategoryDescr] VARCHAR (100) NULL,
    [ActiveFlag]    CHAR (1)      NULL,
    [CreDate]       DATETIME      CONSTRAINT [DF_BSC_AreaLookup_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]       DATETIME      CONSTRAINT [DF_BSC_AreaLookup_UpdDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_BSC_AreaLookup] PRIMARY KEY CLUSTERED ([BSCAL_ID] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [BSC_AL_Code]
    ON [dbo].[BSCCategoryLookup]([CategoryCode] ASC, [ActiveFlag] ASC) WITH (FILLFACTOR = 90);

