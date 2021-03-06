﻿CREATE TABLE [dbo].[tblAnes_Annual_Budget_Report] (
    [tblID]                        INT           IDENTITY (1, 1) NOT NULL,
    [Site]                         VARCHAR (100) NULL,
    [BdgYear]                      VARCHAR (50)  NULL,
    [BdgPstChgs]                   VARCHAR (50)  NULL,
    [BdgTargetRate]                VARCHAR (50)  NULL,
    [BdgGrossColl]                 VARCHAR (50)  NULL,
    [BdgStipendsRcvd]              VARCHAR (50)  NULL,
    [BdgOthRcpts]                  VARCHAR (50)  NULL,
    [BdgTotalColl]                 VARCHAR (50)  NULL,
    [BdgMPRate]                    VARCHAR (50)  NULL,
    [BdgMalpractice]               VARCHAR (50)  NULL,
    [BdgBillFee]                   VARCHAR (50)  NULL,
    [BdgInterest]                  VARCHAR (50)  NULL,
    [BdgDonations]                 VARCHAR (50)  NULL,
    [BdgOffTop]                    VARCHAR (50)  NULL,
    [BdgBillSpec]                  VARCHAR (50)  NULL,
    [BdgCEPRetentionAmt]           VARCHAR (50)  NULL,
    [BdgNOR]                       VARCHAR (50)  NULL,
    [calcBdgNOR]                   VARCHAR (50)  NULL,
    [BdgPITearned]                 VARCHAR (50)  NULL,
    [calcBdgPITearned]             VARCHAR (50)  NULL,
    [BdgPTCost]                    VARCHAR (50)  NULL,
    [calcBdgPTCost]                VARCHAR (50)  NULL,
    [BdgPACost]                    VARCHAR (50)  NULL,
    [calcBdgPACost]                VARCHAR (50)  NULL,
    [BdgPITpct]                    VARCHAR (50)  NULL,
    [BdgLclExp]                    VARCHAR (50)  NULL,
    [calcBdgLclExp]                VARCHAR (50)  NULL,
    [BdgMDpct]                     VARCHAR (50)  NULL,
    [BdgMDearned]                  VARCHAR (50)  NULL,
    [calcBdgMDEarned]              VARCHAR (50)  NULL,
    [BdgRDpct]                     VARCHAR (50)  NULL,
    [BdgRDearned]                  VARCHAR (50)  NULL,
    [calcBdgRDearned]              VARCHAR (50)  NULL,
    [BdgContribPct]                VARCHAR (50)  NULL,
    [BdgContribCEP]                VARCHAR (50)  NULL,
    [calcBdgContribCEP]            VARCHAR (50)  NULL,
    [BdgSiteNetInc]                VARCHAR (50)  NULL,
    [calcBdgSiteNetInc]            VARCHAR (50)  NULL,
    [BdgPatients]                  VARCHAR (50)  NULL,
    [BdgEncounters]                VARCHAR (50)  NULL,
    [BdgDocHours]                  VARCHAR (50)  NULL,
    [BdgDocEarnedHrly]             VARCHAR (50)  NULL,
    [BdgPAHours]                   VARCHAR (50)  NULL,
    [BdgPACostHr]                  VARCHAR (50)  NULL,
    [BdgEncountersPerMonth]        VARCHAR (50)  NULL,
    [BdgBlendedEncountersPerMonth] VARCHAR (50)  NULL,
    [BdgAvgChgPtPerCase]           VARCHAR (50)  NULL,
    [BdgAvgChgPtPerBilledUnit]     VARCHAR (50)  NULL,
    [BdgCollPerPtPerCase]          VARCHAR (50)  NULL,
    [BdgCollPerPtPerBilledUnit]    VARCHAR (50)  NULL,
    [BdgTotalColl2PerCase]         VARCHAR (50)  NULL,
    [BdgTotalColl2PerBilledUnit]   VARCHAR (50)  NULL,
    [BdgNetRevPerPtPerCase]        VARCHAR (50)  NULL,
    [BdgNetRevPerPtPerBilledUnit]  VARCHAR (50)  NULL,
    [MedicalDirector]              VARCHAR (255) NULL,
    [SiteLineSiteID]               VARCHAR (50)  NULL,
    [ProcessLevel]                 VARCHAR (50)  NULL,
    CONSTRAINT [PK_tblAnesAnnual_Budget_Report] PRIMARY KEY CLUSTERED ([tblID] ASC)
);

