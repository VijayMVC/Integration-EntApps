﻿CREATE TABLE [dbo].[tblTmpMngcar] (
    [tmpId]                         INT          IDENTITY (1, 1) NOT NULL,
    [tmpMngCar_CtrID]               INT          NULL,
    [tmpMngCarIPA_CmpID]            INT          NULL,
    [tmpMngCar_CntID]               INT          NULL,
    [tmpMngCar_RatTypID]            INT          NULL,
    [tmpMngCar_LivTypID]            INT          NULL,
    [tmpMngCar_McCtrTypID]          INT          NULL,
    [tmpMngCarClientGroup]          VARCHAR (50) NULL,
    [tmpMngCarEffectDate]           DATETIME     NULL,
    [tmpMngCarUnsignedYN]           BIT          NULL,
    [tmpMngCarClientSignDate]       DATETIME     NULL,
    [tmpMngCarIPASignDate]          DATETIME     NULL,
    [tmpMngCarAutoRenewYN]          BIT          NULL,
    [tmpMngCarTerminateDate]        DATETIME     NULL,
    [tmpMngCarRenewNoteDaysQty]     INT          NULL,
    [tmpMngCarTermNoCauseDaysQt]    INT          NULL,
    [tmpMngCarTermWithCauseDaysQty] INT          NULL,
    [tmpMngCarComment]              TEXT         NULL,
    [tmpMngCarPMPMCapRateAmt]       MONEY        NULL,
    [tmpMngCarChargePct]            FLOAT (53)   NULL,
    [tmpMngCarCFPrimary]            FLOAT (53)   NULL,
    [tmpMngCarCFMedicine]           FLOAT (53)   NULL,
    [tmpMngCarCFSurgery]            FLOAT (53)   NULL,
    [tmpMngCarMedicarePct]          FLOAT (53)   NULL,
    [tmpMngCarMediCalPct]           FLOAT (53)   NULL,
    [tmpMngCarCaseRate]             FLOAT (53)   NULL,
    CONSTRAINT [PK_tblTmpMngcar] PRIMARY KEY NONCLUSTERED ([tmpId] ASC) WITH (FILLFACTOR = 90)
);

