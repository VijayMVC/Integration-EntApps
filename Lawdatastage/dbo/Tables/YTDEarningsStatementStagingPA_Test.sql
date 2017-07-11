﻿CREATE TABLE [dbo].[YTDEarningsStatementStagingPA_Test] (
    [CsuFlxID]                 INT             NULL,
    [CsuFlxIDeb]               INT             NULL,
    [CseFlxIDCsu]              INT             NULL,
    [CsdFlxIDCsu]              INT             NULL,
    [CstFlxIDCsu]              INT             NULL,
    [CsdFlxID]                 INT             NULL,
    [CsxFlxID]                 INT             NULL,
    [CsxFlxIDCsu]              INT             NULL,
    [CssFlxIDCsu]              DECIMAL (13, 4) NULL,
    [ProviderMasterID]         INT             NULL,
    [CheckDate]                DATETIME        NULL,
    [PeriodEnding]             DATETIME        NULL,
    [PayPeriod]                VARCHAR (10)    NULL,
    [CsuPSID]                  VARCHAR (10)    NULL,
    [CheckNo]                  VARCHAR (20)    NULL,
    [CsuEmpNumber]             VARCHAR (10)    NULL,
    [LastName]                 VARCHAR (50)    NULL,
    [FirstName]                VARCHAR (30)    NULL,
    [MiddleName]               VARCHAR (30)    NULL,
    [FullName]                 VARCHAR (100)   NULL,
    [Suffix]                   VARCHAR (4)     NULL,
    [SSN]                      VARCHAR (20)    NULL,
    [BaseRate]                 DECIMAL (13, 4) NULL,
    [CheckAmt]                 DECIMAL (13, 2) NULL,
    [CurrentGrossPay]          DECIMAL (13, 2) NULL,
    [CurrTax]                  DECIMAL (13, 2) NULL,
    [CurrPreTax]               DECIMAL (13, 2) NULL,
    [YTDPreTax]                DECIMAL (13, 2) NULL,
    [CurrTaxWage]              DECIMAL (13, 2) NULL,
    [YTDTaxWage]               DECIMAL (13, 2) NULL,
    [YTDTax]                   DECIMAL (13, 2) NULL,
    [FICAExempt]               VARCHAR (1)     NULL,
    [TaxStatus]                VARCHAR (10)    NULL,
    [FedExempt]                INT             NULL,
    [StateExempt]              INT             NULL,
    [StateTaxAdj]              VARCHAR (4)     NULL,
    [PriStateCode]             VARCHAR (2)     NULL,
    [StStatus1]                VARCHAR (2)     NULL,
    [FedAdjValue]              VARCHAR (8)     NULL,
    [SdiAdjValue]              VARCHAR (8)     NULL,
    [CurrDed]                  DECIMAL (13, 2) NULL,
    [YTDDed]                   DECIMAL (13, 2) NULL,
    [CurrentNetPay]            DECIMAL (13, 2) NULL,
    [CurrHours]                DECIMAL (7, 2)  NULL,
    [CurrUnits]                DECIMAL (7, 2)  NULL,
    [CurrEarnings]             DECIMAL (13, 2) NULL,
    [YTDEarnings]              DECIMAL (13, 2) NULL,
    [YTDHours]                 DECIMAL (13, 2) NULL,
    [SumOfYTDUnits]            DECIMAL (13, 2) NULL,
    [SumOfYTDHours]            DECIMAL (13, 2) NULL,
    [YTDNetPay]                DECIMAL (13, 2) NULL,
    [YTDGrossPay]              DECIMAL (13, 2) NULL,
    [CsxShortDesc]             VARCHAR (10)    NULL,
    [CsxCurrTax]               DECIMAL (13, 2) NULL,
    [CsxYTDTax]                DECIMAL (13, 2) NULL,
    [SumOfCurrTax]             DECIMAL (13, 2) NULL,
    [SumOfYTDTax]              DECIMAL (13, 2) NULL,
    [LbrPayPeriod]             VARCHAR (10)    NULL,
    [PayCode]                  VARCHAR (5)     NULL,
    [PayCodeDescr]             VARCHAR (30)    NULL,
    [TotalHoursbyPayCode]      DECIMAL (10, 2) NULL,
    [TotalEarnings]            DECIMAL (10, 2) NULL,
    [HourlyRate]               DECIMAL (13, 4) NULL,
    [Dept]                     VARCHAR (6)     NULL,
    [Site]                     VARCHAR (50)    NULL,
    [LbrSecPayCode]            VARCHAR (2)     NULL,
    [LbrPayClass]              VARCHAR (5)     NULL,
    [LbrPSID]                  VARCHAR (10)    NULL,
    [SumOfCurrentHours]        DECIMAL (10, 2) NULL,
    [SumOfCurrentUnits]        DECIMAL (10, 2) NULL,
    [SumOfCurrentEarnings]     DECIMAL (10, 2) NULL,
    [DeductCode]               VARCHAR (8)     NULL,
    [CsdDedS2Code]             VARCHAR (8)     NULL,
    [CurrDeductAmt]            DECIMAL (13, 2) NULL,
    [YTDDeductAmt]             DECIMAL (13, 2) NULL,
    [DedPreTax]                VARCHAR (5)     NULL,
    [SpecialItem]              VARCHAR (10)    NULL,
    [SpecialItemAmount]        DECIMAL (18, 6) NULL,
    [BankAcctNo]               VARCHAR (17)    NULL,
    [EFTAmount]                DECIMAL (13, 2) NULL,
    [AccountType]              VARCHAR (1)     NULL,
    [AccountTypeLong]          VARCHAR (30)    NULL,
    [EarningsStatmentCategory] VARCHAR (50)    NULL,
    [CategoryFlag]             VARCHAR (5)     NULL,
    [CalendarYear]             VARCHAR (4)     NULL,
    [HourlyOrExempt]           VARCHAR (4)     NULL,
    [ELaborCustCode]           VARCHAR (10)    NULL,
    [LbrCustPayCode]           VARCHAR (10)    NULL,
    [YTDEarningsBySite]        DECIMAL (13, 2) NULL,
    [YTDHoursBySite]           DECIMAL (13, 2) NULL,
    [YTDUnitsBySite]           DECIMAL (13, 2) NULL,
    [SumOfYTDEarnings]         DECIMAL (13, 2) NULL
);

