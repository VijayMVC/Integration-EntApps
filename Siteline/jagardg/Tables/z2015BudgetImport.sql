CREATE TABLE [jagardg].[z2015BudgetImport] (
    [Site]                      NVARCHAR (255) NULL,
    [CtrTIN]                    NVARCHAR (255) NULL,
    [CtrDateStart]              DATETIME       NULL,
    [Doc]                       FLOAT (53)     NULL,
    [PAs]                       FLOAT (53)     NULL,
    [PA Cost Hr]                FLOAT (53)     NULL,
    [Admin Cost]                FLOAT (53)     NULL,
    [Local]                     FLOAT (53)     NULL,
    [Stipends]                  FLOAT (53)     NULL,
    [Other Receipts]            FLOAT (53)     NULL,
    [Donations]                 FLOAT (53)     NULL,
    [OTT]                       FLOAT (53)     NULL,
    [Avg Charge]                FLOAT (53)     NULL,
    [Coll Rate]                 FLOAT (53)     NULL,
    [Volume]                    FLOAT (53)     NULL,
    [Encounters]                FLOAT (53)     NULL,
    [MDpct]                     FLOAT (53)     NULL,
    [BillRate]                  FLOAT (53)     NULL,
    [PITpct]                    FLOAT (53)     NULL,
    [RDpct]                     FLOAT (53)     NULL,
    [MPRate]                    FLOAT (53)     NULL,
    [ContribPct]                FLOAT (53)     NULL,
    [IntRate]                   FLOAT (53)     NULL,
    [CEPSurchargeRetention]     FLOAT (53)     NULL,
    [MP Flat Fee Annual amount] MONEY          NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'jagardg', @level1type = N'TABLE', @level1name = N'z2015BudgetImport';

