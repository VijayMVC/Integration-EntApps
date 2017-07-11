CREATE TABLE [dbo].[BSCObjectives] (
    [BSCO_ID]         INT           NOT NULL,
    [BSCAL_ID]        INT           NULL,
    [StaffGroup]      VARCHAR (50)  NULL,
    [ObjectivesCode]  CHAR (4)      NULL,
    [ObjectivesDescr] VARCHAR (100) NULL,
    [ActiveFlag]      CHAR (1)      NULL,
    [CreDate]         DATETIME      CONSTRAINT [DF_BSC_Objectives_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]         DATETIME      CONSTRAINT [DF_BSC_Objectives_UpdDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_BSC_Objectives] PRIMARY KEY CLUSTERED ([BSCO_ID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_BSC_Objectives_BSC_AreaLookup] FOREIGN KEY ([BSCAL_ID]) REFERENCES [dbo].[BSCCategoryLookup] ([BSCAL_ID])
);


GO
CREATE NONCLUSTERED INDEX [BSCO_Code_idx]
    ON [dbo].[BSCObjectives]([ObjectivesCode] ASC, [ActiveFlag] ASC) WITH (FILLFACTOR = 90);

