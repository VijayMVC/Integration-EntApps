CREATE TABLE [dbo].[tlkpFeeSchRgn] (
    [FeeSchRgnID]   INT          IDENTITY (1, 1) NOT NULL,
    [FeeSchRgnName] VARCHAR (25) NOT NULL,
    CONSTRAINT [PK__tlkpFeeSchRgn__7AC1C32E] PRIMARY KEY NONCLUSTERED ([FeeSchRgnID] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE CLUSTERED INDEX [IX_tlkpFeeSchRgn]
    ON [dbo].[tlkpFeeSchRgn]([FeeSchRgnName] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_DefaultView', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpFeeSchRgn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Filter', @value = NULL, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpFeeSchRgn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderBy', @value = N'tlkpFeeSchRgn.FeeSchRgnName', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpFeeSchRgn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderByOn', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpFeeSchRgn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpFeeSchRgn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TableMaxRecords', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpFeeSchRgn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpFeeSchRgn', @level2type = N'COLUMN', @level2name = N'FeeSchRgnID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpFeeSchRgn', @level2type = N'COLUMN', @level2name = N'FeeSchRgnID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpFeeSchRgn', @level2type = N'COLUMN', @level2name = N'FeeSchRgnID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpFeeSchRgn', @level2type = N'COLUMN', @level2name = N'FeeSchRgnName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpFeeSchRgn', @level2type = N'COLUMN', @level2name = N'FeeSchRgnName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 2115, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpFeeSchRgn', @level2type = N'COLUMN', @level2name = N'FeeSchRgnName';

