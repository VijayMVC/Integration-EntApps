CREATE TABLE [dbo].[tblDts] (
    [DtsID]      INT           IDENTITY (1, 1) NOT NULL,
    [DtsType]    SMALLINT      NOT NULL,
    [DtsMessage] VARCHAR (255) NOT NULL,
    [DtsDate]    DATETIME      CONSTRAINT [DF_tblDts_DtsDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblDts] PRIMARY KEY NONCLUSTERED ([DtsID] ASC)
);


GO
CREATE CLUSTERED INDEX [IX_DtsDate]
    ON [dbo].[tblDts]([DtsDate] DESC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_DefaultView', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Filter', @value = NULL, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderBy', @value = NULL, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderByOn', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TableMaxRecords', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDts', @level2type = N'COLUMN', @level2name = N'DtsID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDts', @level2type = N'COLUMN', @level2name = N'DtsID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDts', @level2type = N'COLUMN', @level2name = N'DtsID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDts', @level2type = N'COLUMN', @level2name = N'DtsType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDts', @level2type = N'COLUMN', @level2name = N'DtsType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDts', @level2type = N'COLUMN', @level2name = N'DtsType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'0 = start/finish, 1 = success, 2 = failure', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDts', @level2type = N'COLUMN', @level2name = N'DtsType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDts', @level2type = N'COLUMN', @level2name = N'DtsMessage';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDts', @level2type = N'COLUMN', @level2name = N'DtsMessage';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 6405, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDts', @level2type = N'COLUMN', @level2name = N'DtsMessage';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDts', @level2type = N'COLUMN', @level2name = N'DtsDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDts', @level2type = N'COLUMN', @level2name = N'DtsDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 2205, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDts', @level2type = N'COLUMN', @level2name = N'DtsDate';

