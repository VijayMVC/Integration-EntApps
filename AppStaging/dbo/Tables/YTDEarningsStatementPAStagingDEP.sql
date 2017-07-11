﻿CREATE TABLE [dbo].[YTDEarningsStatementPAStagingDEP] (
    [CsuFlxID]                 INT             NULL,
    [CsuFlxIDeb]               INT             NULL,
    [CseFlxIDCsu]              INT             NULL,
    [CsdFlxIDCsu]              INT             NULL,
    [CstFlxIDCsu]              INT             NULL,
    [CsdFlxID]                 INT             NULL,
    [CsxFlxID]                 INT             NULL,
    [CsxFlxIDCsu]              INT             NULL,
    [CssFlxIDCsu]              INT             NULL,
    [ProviderMasterID]         INT             NULL,
    [CheckDate]                DATETIME        NULL,
    [PeriodEnding]             DATETIME        NULL,
    [PayPeriod]                VARCHAR (10)    NULL,
    [CsuPSID]                  VARCHAR (10)    NULL,
    [CheckNo]                  VARCHAR (10)    NULL,
    [CsuEmpNumber]             VARCHAR (10)    NULL,
    [LastName]                 VARCHAR (50)    NULL,
    [FirstName]                VARCHAR (30)    NULL,
    [MiddleName]               VARCHAR (30)    NULL,
    [FullName]                 VARCHAR (100)   NULL,
    [Suffix]                   VARCHAR (4)     NULL,
    [SSN]                      VARCHAR (9)     NULL,
    [BaseRate]                 MONEY           NULL,
    [CheckAmt]                 DECIMAL (10, 2) NULL,
    [CurrentGrossPay]          DECIMAL (10, 2) NULL,
    [CurrTax]                  DECIMAL (10, 2) NULL,
    [CurrPreTax]               DECIMAL (10, 2) NULL,
    [YTDPreTax]                DECIMAL (10, 2) NULL,
    [CurrTaxWage]              DECIMAL (10, 2) NULL,
    [YTDTaxWage]               DECIMAL (10, 2) NULL,
    [YTDTax]                   DECIMAL (10, 2) NULL,
    [FICAExempt]               VARCHAR (1)     NULL,
    [TaxStatus]                VARCHAR (1)     NULL,
    [FedExempt]                INT             NULL,
    [StateExempt]              INT             NULL,
    [StateTaxAdj]              VARCHAR (4)     NULL,
    [PriStateCode]             VARCHAR (2)     NULL,
    [StStatus1]                VARCHAR (2)     NULL,
    [FedAdjValue]              VARCHAR (8)     NULL,
    [SdiAdjValue]              VARCHAR (8)     NULL,
    [CurrDed]                  DECIMAL (10, 2) NULL,
    [YTDDed]                   DECIMAL (10, 2) NULL,
    [CurrentNetPay]            DECIMAL (10, 2) NULL,
    [CurrHours]                DECIMAL (7, 2)  NULL,
    [CurrEarnings]             DECIMAL (10, 2) NULL,
    [YTDEarnings]              DECIMAL (10, 2) NULL,
    [YTDHours]                 DECIMAL (10, 2) NULL,
    [SumOfYTDHours]            DECIMAL (10, 2) NULL,
    [YTDNetPay]                DECIMAL (10, 2) NULL,
    [YTDGrossPay]              DECIMAL (10, 2) NULL,
    [CsxShortDesc]             VARCHAR (5)     NULL,
    [CsxCurrTax]               DECIMAL (10, 2) NULL,
    [CsxYTDTax]                DECIMAL (10, 2) NULL,
    [SumOfCurrTax]             DECIMAL (10, 2) NULL,
    [SumOfYTDTax]              DECIMAL (10, 2) NULL,
    [LbrPayPeriod]             VARCHAR (10)    NULL,
    [PayCode]                  VARCHAR (50)    NULL,
    [PayCodeDescr]             VARCHAR (30)    NULL,
    [TotalHoursbyPayCode]      DECIMAL (10, 2) NULL,
    [TotalEarnings]            MONEY           NULL,
    [HourlyRate]               DECIMAL (16, 2) NULL,
    [Dept]                     VARCHAR (6)     NULL,
    [Site]                     VARCHAR (50)    NULL,
    [LbrSecPayCode]            VARCHAR (2)     NULL,
    [LbrPayClass]              VARCHAR (1)     NULL,
    [LbrPSID]                  VARCHAR (10)    NULL,
    [SumOfCurrentHours]        DECIMAL (10, 2) NULL,
    [SumOfCurrentEarnings]     MONEY           NULL,
    [DeductCode]               VARCHAR (5)     NULL,
    [CsdDedS2Code]             VARCHAR (1)     NULL,
    [CurrDeductAmt]            DECIMAL (10, 2) NULL,
    [YTDDeductAmt]             DECIMAL (10, 2) NULL,
    [DedPreTax]                VARCHAR (1)     NULL,
    [SpecialItem]              VARCHAR (20)    NULL,
    [SpecialItemAmount]        VARCHAR (10)    NULL,
    [BankAcctNo]               VARCHAR (17)    NULL,
    [EFTAmount]                DECIMAL (10, 2) NULL,
    [AccountType]              VARCHAR (1)     NULL,
    [AccountTypeLong]          VARCHAR (20)    NULL,
    [EarningsStatmentCategory] VARCHAR (50)    NULL,
    [CategoryFlag]             VARCHAR (6)     NULL,
    [CalendarYear]             VARCHAR (4)     NULL,
    [HourlyOrExempt]           VARCHAR (6)     NULL,
    [ELaborCustCode]           VARCHAR (10)    NULL,
    [LbrCustPayCode]           VARCHAR (10)    NULL,
    [YTDEarningsBySite]        DECIMAL (10, 2) NULL,
    [YTDHoursBySite]           DECIMAL (10, 2) NULL,
    [SumOfYTDEarnings]         DECIMAL (10, 2) NULL
);

