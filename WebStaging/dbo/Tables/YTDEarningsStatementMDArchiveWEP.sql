﻿CREATE TABLE [dbo].[YTDEarningsStatementMDArchiveWEP] (
    [CsuFlxID]                 INT             NULL,
    [CsuFlxIDeb]               INT             NULL,
    [CseFlxIDCsu]              INT             NULL,
    [CsdFlxIDCsu]              INT             NULL,
    [CstFlxIDCsu]              INT             NULL,
    [CsdFlxID]                 INT             NULL,
    [ProviderMasterID]         INT             NULL,
    [CheckDate]                DATETIME        NULL,
    [PayPeriod]                VARCHAR (10)    NULL,
    [CsuPSID]                  VARCHAR (10)    NULL,
    [CheckNo]                  VARCHAR (10)    NULL,
    [ClockNo]                  VARCHAR (6)     NULL,
    [LastName]                 VARCHAR (50)    NULL,
    [FirstName]                VARCHAR (30)    NULL,
    [MiddleName]               VARCHAR (30)    NULL,
    [FullName]                 VARCHAR (100)   NULL,
    [CheckAmt]                 DECIMAL (10, 2) NULL,
    [CurrentGrossPay]          DECIMAL (10, 2) NULL,
    [CurrentNetPay]            DECIMAL (10, 2) NULL,
    [YTDHours]                 DECIMAL (10, 2) NULL,
    [CurrentHours]             DECIMAL (10, 2) NULL,
    [SumOfYTDHours]            DECIMAL (10, 2) NULL,
    [SumOfCurrentHours]        DECIMAL (10, 2) NULL,
    [YTDNetPay]                DECIMAL (10, 2) NULL,
    [YTDGrossPay]              DECIMAL (10, 2) NULL,
    [LbrFlxIDeb]               INT             NULL,
    [LbrPayPeriod]             VARCHAR (10)    NULL,
    [PayCode]                  VARCHAR (3)     NULL,
    [PayCodeDescr]             VARCHAR (30)    NULL,
    [TotalHoursbyPayCode]      DECIMAL (10, 2) NULL,
    [TotalEarnings]            MONEY           NULL,
    [HourlyRate]               DECIMAL (16, 2) NULL,
    [Dept]                     VARCHAR (6)     NULL,
    [DeptDescr]                VARCHAR (50)    NULL,
    [LbrPSID]                  VARCHAR (10)    NULL,
    [SumOfTotalHours]          DECIMAL (10, 2) NULL,
    [SumOfTotalEarnings]       MONEY           NULL,
    [DeductDescr]              VARCHAR (13)    NULL,
    [CurrDeductAmt]            DECIMAL (10, 2) NULL,
    [YTDDeductAmt]             DECIMAL (10, 2) NULL,
    [BankAcctNo]               VARCHAR (17)    NULL,
    [ABARoutingNo]             INT             NULL,
    [EFTAmount]                DECIMAL (10, 2) NULL,
    [AccountType]              VARCHAR (1)     NULL,
    [ActivityIn]               VARCHAR (8)     NULL,
    [EarningsStatmentCategory] VARCHAR (50)    NULL,
    [CategoryFlag]             VARCHAR (6)     NULL,
    [CalendarYear]             VARCHAR (4)     NULL,
    [Credate]                  DATETIME        NULL
);

