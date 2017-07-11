CREATE TABLE [dbo].[PayrollScheduleCeridian] (
    [PayrollScheduleID] INT          IDENTITY (1, 1) NOT NULL,
    [StaffGroup]        VARCHAR (50) NULL,
    [PrpFlxID]          INT          NULL,
    [PrpPayPeriod]      VARCHAR (10) NULL,
    [PrpPSID]           VARCHAR (8)  NULL,
    [PrpStartDate]      DATETIME     NULL,
    [PrpEndDate]        DATETIME     NULL,
    [CreDate]           DATETIME     CONSTRAINT [DF_PayrollScheduleCeridian_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]           DATETIME     CONSTRAINT [DF_PayrollScheduleCeridian_UpdDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_PayrollScheduleCeridian] PRIMARY KEY CLUSTERED ([PayrollScheduleID] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [PSC_PayPeriod_PSID_idx]
    ON [dbo].[PayrollScheduleCeridian]([PrpPayPeriod] ASC, [PrpPSID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [PSC_PrpFlxID_idx]
    ON [dbo].[PayrollScheduleCeridian]([PrpFlxID] ASC) WITH (FILLFACTOR = 90);

