CREATE TABLE [dbo].[tblCtrDiv] (
    [CtrDivID]           INT          IDENTITY (1, 1) NOT NULL,
    [CtrDiv_CtrID]       INT          NOT NULL,
    [CtrDiv_DivID]       VARCHAR (15) NOT NULL,
    [CtrDivDir_CntID]    INT          NULL,
    [CtrDivAssDir_CntID] INT          NULL,
    CONSTRAINT [PK_tblCtrDiv] PRIMARY KEY CLUSTERED ([CtrDivID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtrDiv', @level2type = N'COLUMN', @level2name = N'CtrDivID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtrDiv', @level2type = N'COLUMN', @level2name = N'CtrDivID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtrDiv', @level2type = N'COLUMN', @level2name = N'CtrDivID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtrDiv', @level2type = N'COLUMN', @level2name = N'CtrDiv_CtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtrDiv', @level2type = N'COLUMN', @level2name = N'CtrDiv_CtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtrDiv', @level2type = N'COLUMN', @level2name = N'CtrDiv_CtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtrDiv', @level2type = N'COLUMN', @level2name = N'CtrDiv_DivID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtrDiv', @level2type = N'COLUMN', @level2name = N'CtrDiv_DivID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtrDiv', @level2type = N'COLUMN', @level2name = N'CtrDiv_DivID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtrDiv', @level2type = N'COLUMN', @level2name = N'CtrDivDir_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtrDiv', @level2type = N'COLUMN', @level2name = N'CtrDivDir_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtrDiv', @level2type = N'COLUMN', @level2name = N'CtrDivDir_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtrDiv', @level2type = N'COLUMN', @level2name = N'CtrDivAssDir_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtrDiv', @level2type = N'COLUMN', @level2name = N'CtrDivAssDir_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtrDiv', @level2type = N'COLUMN', @level2name = N'CtrDivAssDir_CntID';

