﻿CREATE TABLE [dbo].[WebK1Staging] (
    [ID1]               INT             NULL,
    [ProviderMasterID]  INT             NULL,
    [DOCNAME]           VARCHAR (100)   NULL,
    [CLKNUM]            VARCHAR (10)    NULL,
    [STAT]              VARCHAR (10)    NULL,
    [TYPE]              VARCHAR (10)    NULL,
    [ERDDRGSTIP]        MONEY           NULL,
    [SABBAT]            MONEY           NULL,
    [RECERT]            MONEY           NULL,
    [VALPOUT]           MONEY           NULL,
    [MVPOUT]            MONEY           NULL,
    [GUARPYMNT]         MONEY           NULL,
    [QEEARN02]          MONEY           NULL,
    [SELFEMPINC]        MONEY           NULL,
    [CAPCONT02]         MONEY           NULL,
    [CAPPOUT]           MONEY           NULL,
    [CAPCONT03]         MONEY           NULL,
    [RETEARN02]         MONEY           NULL,
    [RETPOUT]           MONEY           NULL,
    [REINTBAS]          MONEY           NULL,
    [PREFBUP02]         MONEY           NULL,
    [PREFBUPCONT]       MONEY           NULL,
    [PREFBUPPOUT]       MONEY           NULL,
    [PREFBUP03]         MONEY           NULL,
    [INT50PERCENT]      MONEY           NULL,
    [PREFBUPINT]        MONEY           NULL,
    [REINT]             MONEY           NULL,
    [INTEREST]          MONEY           NULL,
    [QEALLOC]           MONEY           NULL,
    [TOTINC]            MONEY           NULL,
    [PORTINC]           MONEY           NULL,
    [NONDEDEXP]         MONEY           NULL,
    [CHARCONT]          MONEY           NULL,
    [ENDCAP02]          MONEY           NULL,
    [DIST02]            MONEY           NULL,
    [CATBUP02]          MONEY           NULL,
    [CATCONT03]         MONEY           NULL,
    [CATBUPPOUT]        MONEY           NULL,
    [CATBUP03]          MONEY           NULL,
    [ENDCAP03]          MONEY           NULL,
    [DEPRADJ]           MONEY           NULL,
    [DEPCARE]           MONEY           NULL,
    [ADDRESS1]          VARCHAR (200)   NULL,
    [ADDRESS2]          VARCHAR (200)   NULL,
    [ADDRESS3]          VARCHAR (10)    NULL,
    [ZIP]               VARCHAR (11)    NULL,
    [TAXID]             VARCHAR (11)    NULL,
    [LOANS]             MONEY           NULL,
    [Bonus50Percent]    MONEY           NULL,
    [BonusPaid]         MONEY           NULL,
    [DEFBENEFITS]       MONEY           NULL,
    [ADVANCES]          MONEY           NULL,
    [CityStateZip]      VARCHAR (200)   NULL,
    [EntityType]        VARCHAR (20)    NULL,
    [ProfitSharing]     DECIMAL (14, 6) NULL,
    [LossSharing]       DECIMAL (14, 6) NULL,
    [OwnerofCap]        DECIMAL (14, 6) NULL,
    [PartnersLiabOther] DECIMAL (10, 2) NULL,
    [CapAcctBeg]        DECIMAL (10, 2) NULL,
    [CapContributed]    DECIMAL (10, 2) NULL,
    [PartnersShare]     DECIMAL (10, 2) NULL,
    [WithdrAndDistr]    DECIMAL (10, 2) NULL,
    [CapAcctEnd]        DECIMAL (10, 2) NULL,
    [OrdIncome]         DECIMAL (10, 2) NULL,
    [PortInterest]      DECIMAL (10, 2) NULL,
    [GuarPay]           DECIMAL (10, 2) NULL,
    [CharitableContr]   DECIMAL (10, 2) NULL,
    [OtherDedDep]       DECIMAL (10, 2) NULL,
    [InvestIncome]      DECIMAL (10, 2) NULL,
    [NetEarnings]       DECIMAL (10, 2) NULL,
    [DistrOfMoney]      DECIMAL (10, 2) NULL,
    [NonDedExpense]     DECIMAL (10, 2) NULL,
    [DeprAdjust]        DECIMAL (10, 2) NULL,
    [Credate]           DATETIME        NULL
);
