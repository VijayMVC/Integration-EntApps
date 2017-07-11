CREATE TABLE [dbo].[tblHlp] (
    [Hlp_CtrID]     INT          NOT NULL,
    [Hlp_FldID]     VARCHAR (50) NOT NULL,
    [HlpID]         INT          IDENTITY (1, 1) NOT NULL,
    [HlpRequiredYN] BIT          NULL,
    [HlpText]       TEXT         NULL,
    [HlpHyperlink]  VARCHAR (50) NULL,
    [HlpTimeStamp]  ROWVERSION   NULL,
    CONSTRAINT [PK_tblHlp] PRIMARY KEY CLUSTERED ([Hlp_CtrID] ASC, [Hlp_FldID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblHlp_tlkpFld] FOREIGN KEY ([Hlp_FldID]) REFERENCES [dbo].[tlkpFld] ([FldID])
);

