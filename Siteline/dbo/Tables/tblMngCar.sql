CREATE TABLE [dbo].[tblMngCar] (
    [MngCarID]                   INT           IDENTITY (1, 1) NOT NULL,
    [MngCarKey]                  VARCHAR (255) NULL,
    [MngCar_CtrID]               INT           NULL,
    [MngCarIPA_CmpID]            INT           NULL,
    [MngCarBill_CmpID]           INT           NULL,
    [MngCar_CntID]               INT           NULL,
    [MngCar_RatTypID]            INT           NULL,
    [MngCar_LivTypID]            INT           NULL,
    [MngCar_McCtrTypID]          INT           NULL,
    [MngCar_FeeSchRgnID]         INT           NULL,
    [MngCar_FeeSchYrID]          INT           NULL,
    [MngCarClientGroup]          VARCHAR (50)  NULL,
    [MngCarEffectDate]           DATETIME      NULL,
    [MngCarUnsignedYN]           BIT           CONSTRAINT [DF_tblMngCar_MngCarUnsignedYN] DEFAULT (0) NULL,
    [MngCarClientSignDate]       DATETIME      NULL,
    [MngCarIPASignDate]          DATETIME      NULL,
    [MngCarAutoRenewYN]          BIT           CONSTRAINT [DF_tblMngCar_MngCarAutoRenewYN] DEFAULT (0) NULL,
    [MngCarTerminateDate]        DATETIME      NULL,
    [MngCarRateExpireDate]       DATETIME      NULL,
    [MngCarRenewNoteDaysQty]     INT           CONSTRAINT [DF_tblMngCar_MngCarRenewNoteDaysQty] DEFAULT (0) NOT NULL,
    [MngCarTermNoCauseDaysQt]    INT           CONSTRAINT [DF_tblMngCar_MngCarTermNoCauseDaysQt] DEFAULT (0) NOT NULL,
    [MngCarTermWithCauseDaysQty] INT           CONSTRAINT [DF_tblMngCar_MngCarTermWithCauseDaysQty] DEFAULT (0) NOT NULL,
    [MngCarComment]              TEXT          NULL,
    [MngCarPMPMCapRateAmt]       MONEY         NULL,
    [MngCarChargePct]            FLOAT (53)    NULL,
    [MngCarCFPrimary]            FLOAT (53)    NULL,
    [MngCarFS1Desc]              VARCHAR (25)  NULL,
    [MngCarCFMedicine]           FLOAT (53)    NULL,
    [MngCarFS2Desc]              VARCHAR (25)  NULL,
    [MngCarCFSurgery]            FLOAT (53)    NULL,
    [MngCarFS3Desc]              VARCHAR (25)  NULL,
    [MngCarMedicarePct]          FLOAT (53)    NULL,
    [MngCarMediCalPct]           FLOAT (53)    NULL,
    [MngCarCaseRate]             FLOAT (53)    NULL,
    [MngCarCEPWideYN]            BIT           CONSTRAINT [DF_tblMngCar_MngCarCEPWideYN] DEFAULT (0) NULL,
    [MngCarInactiveYN]           BIT           CONSTRAINT [DF_tblMngCar_MngCarInactiveYN] DEFAULT (0) NULL,
    [MngCarFlagYN]               BIT           CONSTRAINT [DF_tblMngCar_MngCarFlagYN] DEFAULT (0) NULL,
    [MngCarCaseRateLesserYN]     BIT           NULL,
    [MngCarPctChargeLesserYN]    BIT           NULL,
    [MngCarHoldHarmlessYN]       BIT           NULL,
    [MngCarCMSYN]                BIT           CONSTRAINT [DF_tblMngCar_MngCarCMSYN] DEFAULT (0) NULL,
    [MngCarCPTYN]                BIT           CONSTRAINT [DF_tblMngCar_MngCarCPTYN] DEFAULT (0) NULL,
    [MngCarReimbGuideOtherYN]    BIT           CONSTRAINT [DF_tblMngCar_MngCarReimbGuideOtherYN] DEFAULT (0) NULL,
    [MngCarInPatientRateYN]      BIT           CONSTRAINT [DF_tblMngCar_MngCarInPatientRateYN] DEFAULT (0) NULL,
    [MngCarUCRateYN]             BIT           CONSTRAINT [DF_tblMngCar_MngCarUCRateYN] DEFAULT (0) NULL,
    [MngCarContractURL]          VARCHAR (250) NULL,
    [MngCarAnniversaryDate]      DATETIME      CONSTRAINT [DF_tblMngCar_MngCarAnniversaryDate] DEFAULT (getdate()) NOT NULL,
    [MngCarCID]                  VARCHAR (15)  NULL,
    [MngCarTIN]                  VARCHAR (15)  NULL,
    [MngCarInPatientRateDesc]    VARCHAR (250) NULL,
    [MngCarUCRateDesc]           VARCHAR (250) NULL,
    [MngCarReciprocityYN]        BIT           CONSTRAINT [DF_tblMngCar_MngCarReciprocityYN] DEFAULT (0) NULL,
    [zMngCarRBRVSPct]            FLOAT (53)    NULL,
    [zMngCarBRRNE]               FLOAT (53)    NULL,
    [zMngCarMedicalScreenExam]   FLOAT (53)    NULL,
    [zMngCarEDHospFee]           FLOAT (53)    NULL,
    [zMngCarEDProfFee]           FLOAT (53)    NULL,
    [zMngCarUCHospFee]           FLOAT (53)    NULL,
    [zMngCarUCProfFee]           FLOAT (53)    NULL,
    [zMngCarOldID]               INT           NULL,
    [zMngCarPostSignIssues]      TEXT          NULL,
    [MngCarTerminatedYN]         BIT           CONSTRAINT [DF_tblMngCar_MngCarTerminatedYN] DEFAULT (0) NOT NULL,
    [MngCarMisc1YN]              BIT           CONSTRAINT [DF_tblMngCar_MngCarMisc1YN] DEFAULT (0) NOT NULL,
    [MngCarMisc2YN]              BIT           CONSTRAINT [DF_tblMngCar_MngCarMisc2YN] DEFAULT (0) NOT NULL,
    [MngCarMisc3YN]              BIT           CONSTRAINT [DF_tblMngCar_MngCarMisc3YN] DEFAULT (0) NOT NULL,
    [MngCarClmSubDayQty]         INT           CONSTRAINT [DF_tblMngCar_MngCarClmSubDayQty] DEFAULT (0) NOT NULL,
    [MngCarNoticeDate]           DATETIME      NULL,
    [MngCarReviewDate]           DATETIME      NULL,
    [MngCarMedicaidMedicalYN]    BIT           CONSTRAINT [DF_tblMngCar_MngCarMedicaidMedicalYN] DEFAULT (0) NOT NULL,
    [MngCarFS4Amt]               FLOAT (53)    NULL,
    [MngCarFS4Desc]              VARCHAR (25)  NULL,
    [MngCarFS5Amt]               FLOAT (53)    NULL,
    [MngCarFS5Desc1]             VARCHAR (25)  NULL,
    CONSTRAINT [PK_tblMngCar] PRIMARY KEY NONCLUSTERED ([MngCarID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblMngCar_tblCmp] FOREIGN KEY ([MngCarIPA_CmpID]) REFERENCES [dbo].[tblCmp] ([CmpID]),
    CONSTRAINT [FK_tblMngCar_tblCmp1] FOREIGN KEY ([MngCarBill_CmpID]) REFERENCES [dbo].[tblCmp] ([CmpID]),
    CONSTRAINT [FK_tblMngCar_tblCnt] FOREIGN KEY ([MngCar_CntID]) REFERENCES [dbo].[tblCnt] ([CntID]),
    CONSTRAINT [FK_tblMngCar_tblCtr] FOREIGN KEY ([MngCar_CtrID]) REFERENCES [dbo].[tblCtr] ([CtrID]),
    CONSTRAINT [FK_tblMngCar_tlkpFeeSchRgn] FOREIGN KEY ([MngCar_FeeSchRgnID]) REFERENCES [dbo].[tlkpFeeSchRgn] ([FeeSchRgnID]),
    CONSTRAINT [FK_tblMngCar_tlkpFeeSchYr] FOREIGN KEY ([MngCar_FeeSchYrID]) REFERENCES [dbo].[tlkpFeeSchYr] ([FeeSchYrID]),
    CONSTRAINT [FK_tblMngCar_tlkpLiv] FOREIGN KEY ([MngCar_LivTypID]) REFERENCES [dbo].[tlkpLiv] ([LivTypID]),
    CONSTRAINT [FK_tblMngCar_tlkpMcCtrTyp] FOREIGN KEY ([MngCar_McCtrTypID]) REFERENCES [dbo].[tlkpMcCtrTyp] ([McCtrTypID]),
    CONSTRAINT [FK_tblMngCar_tlkpRatTyp] FOREIGN KEY ([MngCar_RatTypID]) REFERENCES [dbo].[tlkpRatTyp] ([RatTypID]),
    CONSTRAINT [IX_tblMngCar] UNIQUE NONCLUSTERED ([MngCar_CtrID] ASC, [MngCarIPA_CmpID] ASC, [MngCar_LivTypID] ASC, [MngCarEffectDate] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [MngCarKey]
    ON [dbo].[tblMngCar]([MngCarKey] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [MngCar_CtrID]
    ON [dbo].[tblMngCar]([MngCar_CtrID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [MngCarBill_CmpID]
    ON [dbo].[tblMngCar]([MngCarBill_CmpID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [MngCar_RatTypID]
    ON [dbo].[tblMngCar]([MngCar_RatTypID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [MngCar_LivTypID]
    ON [dbo].[tblMngCar]([MngCar_LivTypID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE TRIGGER dbo.tblMngCar_ReviewDate
ON dbo.tblMngCar
FOR  INSERT, UPDATE
AS
Declare @MngCarID int

Select @MngCarID = MngCarID from Inserted

Exec stpUpdateMngCarReviewNotice @MngCarID

	/* IF UPDATE (column_name) ...*/

GO
EXECUTE sp_addextendedproperty @name = N'MS_DefaultView', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Filter', @value = N'((tblMngCar.MngCarIPA_CmpID=1427))', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderBy', @value = N'tblMngCar.MngCarID DESC', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderByOn', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TableMaxRecords', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarKey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarKey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarKey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCar_CtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCar_CtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCar_CtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarIPA_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarIPA_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarIPA_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarBill_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarBill_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarBill_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCar_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCar_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCar_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCar_RatTypID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCar_RatTypID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCar_RatTypID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCar_LivTypID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCar_LivTypID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCar_LivTypID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCar_McCtrTypID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCar_McCtrTypID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCar_McCtrTypID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCar_FeeSchRgnID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCar_FeeSchRgnID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCar_FeeSchRgnID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NEW 6/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCar_FeeSchRgnID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCar_FeeSchYrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCar_FeeSchYrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCar_FeeSchYrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NEW 6/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCar_FeeSchYrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarClientGroup';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarClientGroup';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarClientGroup';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarEffectDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarEffectDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarEffectDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarUnsignedYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarUnsignedYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarUnsignedYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarClientSignDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarClientSignDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarClientSignDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarIPASignDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarIPASignDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarIPASignDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarAutoRenewYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarAutoRenewYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarAutoRenewYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarTerminateDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarTerminateDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarTerminateDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarRateExpireDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarRateExpireDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarRateExpireDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 3/6/2006', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarRateExpireDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarRateExpireDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarRateExpireDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarRateExpireDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarRenewNoteDaysQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarRenewNoteDaysQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarRenewNoteDaysQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarTermNoCauseDaysQt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarTermNoCauseDaysQt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarTermNoCauseDaysQt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarTermWithCauseDaysQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarTermWithCauseDaysQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarTermWithCauseDaysQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarPMPMCapRateAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarPMPMCapRateAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarPMPMCapRateAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarChargePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarChargePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarChargePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCFPrimary';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCFPrimary';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCFPrimary';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'7/2005 treated as FS1 rate', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCFPrimary';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS1Desc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS1Desc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS1Desc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS1Desc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS1Desc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS1Desc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS1Desc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCFMedicine';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCFMedicine';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCFMedicine';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'7/2005 treated as FS2 rate', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCFMedicine';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS2Desc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS2Desc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS2Desc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS2Desc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS2Desc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS2Desc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS2Desc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCFSurgery';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCFSurgery';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCFSurgery';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS3Desc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS3Desc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS3Desc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS3Desc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS3Desc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS3Desc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS3Desc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarMedicarePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarMedicarePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarMedicarePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'7/2005 treated as FS3 rate', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarMedicarePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarMediCalPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarMediCalPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarMediCalPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCaseRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCaseRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCaseRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCEPWideYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCEPWideYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCEPWideYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarInactiveYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarInactiveYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarInactiveYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFlagYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFlagYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFlagYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCaseRateLesserYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCaseRateLesserYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCaseRateLesserYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NEW 6/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCaseRateLesserYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'Yes/No', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCaseRateLesserYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarPctChargeLesserYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarPctChargeLesserYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarPctChargeLesserYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NEW 6/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarPctChargeLesserYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarHoldHarmlessYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarHoldHarmlessYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarHoldHarmlessYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NEW 6/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarHoldHarmlessYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCMSYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCMSYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCMSYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NEW 6/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCMSYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCMSYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCMSYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCMSYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCPTYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCPTYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCPTYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NEW 6/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCPTYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCPTYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCPTYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCPTYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarReimbGuideOtherYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarReimbGuideOtherYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarReimbGuideOtherYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NEW 6/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarReimbGuideOtherYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarReimbGuideOtherYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarReimbGuideOtherYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarReimbGuideOtherYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarInPatientRateYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarInPatientRateYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarInPatientRateYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New 6/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarInPatientRateYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarInPatientRateYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarInPatientRateYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarInPatientRateYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarUCRateYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarUCRateYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarUCRateYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New 6/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarUCRateYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarUCRateYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarUCRateYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarUCRateYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarContractURL';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarContractURL';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarContractURL';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New 6/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarContractURL';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarContractURL';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarContractURL';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarContractURL';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarAnniversaryDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarAnniversaryDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarAnniversaryDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New 6/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarAnniversaryDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarAnniversaryDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarAnniversaryDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarAnniversaryDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarCID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarTIN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarTIN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarTIN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarTIN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarTIN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarTIN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarTIN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarInPatientRateDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarInPatientRateDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarInPatientRateDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarInPatientRateDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarInPatientRateDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarInPatientRateDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarInPatientRateDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarUCRateDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarUCRateDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarUCRateDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarUCRateDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarUCRateDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarUCRateDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarUCRateDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarReciprocityYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarReciprocityYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarReciprocityYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarReciprocityYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarReciprocityYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarReciprocityYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarReciprocityYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'zMngCarRBRVSPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'zMngCarRBRVSPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'zMngCarRBRVSPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'zMngCarBRRNE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'zMngCarBRRNE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'zMngCarBRRNE';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'zMngCarMedicalScreenExam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'zMngCarMedicalScreenExam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'zMngCarMedicalScreenExam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'zMngCarEDHospFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'zMngCarEDHospFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'zMngCarEDHospFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'zMngCarEDProfFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'zMngCarEDProfFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'zMngCarEDProfFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'zMngCarUCHospFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'zMngCarUCHospFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'zMngCarUCHospFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'zMngCarUCProfFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'zMngCarUCProfFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'zMngCarUCProfFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'zMngCarOldID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'zMngCarOldID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'zMngCarOldID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'zMngCarPostSignIssues';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'zMngCarPostSignIssues';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'zMngCarPostSignIssues';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarTerminatedYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarTerminatedYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarTerminatedYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 3/13/2006', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarTerminatedYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarTerminatedYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarTerminatedYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarTerminatedYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarMisc1YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarMisc1YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarMisc1YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 3/13/2006', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarMisc1YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarMisc1YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarMisc1YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarMisc1YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarMisc2YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarMisc2YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarMisc2YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 3/13/2006', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarMisc2YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarMisc2YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarMisc2YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarMisc2YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarMisc3YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarMisc3YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarMisc3YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 3/13/2006', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarMisc3YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarMisc3YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarMisc3YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarClmSubDayQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarClmSubDayQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarClmSubDayQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarClmSubDayQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarClmSubDayQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarClmSubDayQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarNoticeDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarNoticeDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarNoticeDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 5/15/2006', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarNoticeDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarNoticeDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarNoticeDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarNoticeDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarReviewDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarReviewDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarReviewDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 5/15/2006', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarReviewDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarReviewDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarReviewDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarReviewDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarMedicaidMedicalYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarMedicaidMedicalYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarMedicaidMedicalYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 5/15/2006', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarMedicaidMedicalYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarMedicaidMedicalYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarMedicaidMedicalYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarMedicaidMedicalYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS4Amt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS4Amt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS4Amt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 6/12/06', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS4Amt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS4Desc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS4Desc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS4Desc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 6/12/06', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS4Desc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS4Desc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS4Desc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS4Desc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS5Amt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS5Amt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS5Amt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 6/12/06', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS5Amt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS5Desc1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS5Desc1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS5Desc1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 6/12/06', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS5Desc1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS5Desc1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS5Desc1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblMngCar', @level2type = N'COLUMN', @level2name = N'MngCarFS5Desc1';

