CREATE TABLE [dbo].[tlkpMthYr] (
    [MthYrID]                 DATETIME NOT NULL,
    [MthYrSort]               INT      IDENTITY (1, 1) NOT NULL,
    [MthYrLawsonImportDoneYN] BIT      CONSTRAINT [DF_tlkpMthYr_MthYrLawsonImportDoneYN] DEFAULT (0) NOT NULL,
    CONSTRAINT [PK_tlkpMthYr] PRIMARY KEY CLUSTERED ([MthYrID] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpMthYr', @level2type = N'COLUMN', @level2name = N'MthYrLawsonImportDoneYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpMthYr', @level2type = N'COLUMN', @level2name = N'MthYrLawsonImportDoneYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpMthYr', @level2type = N'COLUMN', @level2name = N'MthYrLawsonImportDoneYN';

