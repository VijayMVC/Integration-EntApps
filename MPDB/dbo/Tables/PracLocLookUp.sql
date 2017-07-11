CREATE TABLE [dbo].[PracLocLookUp] (
    [Practice]               CHAR (3)      NOT NULL,
    [Location]               CHAR (3)      NOT NULL,
    [Location2]              CHAR (3)      NULL,
    [Locationname]           VARCHAR (100) NULL,
    [LocationNameProd]       VARCHAR (100) NULL,
    [LocationForAudits]      VARCHAR (100) NULL,
    [SpearName]              VARCHAR (100) NULL,
    [PMRName]                VARCHAR (100) NULL,
    [PMRNameForTimeReports]  VARCHAR (100) NULL,
    [PracOnlyName]           VARCHAR (100) NULL,
    [FullBrkName]            VARCHAR (100) NULL,
    [PayrollName]            VARCHAR (100) NULL,
    [LocationSubgroup]       VARCHAR (30)  NULL,
    [HospitalGroup]          VARCHAR (100) NULL,
    [Area]                   VARCHAR (50)  NULL,
    [AreaGrouping]           VARCHAR (50)  NULL,
    [PayrollActiveInactive]  VARCHAR (15)  NULL,
    [ActiveInactive]         VARCHAR (15)  NULL,
    [Cube]                   VARCHAR (15)  NULL,
    [TaxID]                  VARCHAR (10)  NULL,
    [GroupProvMCARE]         VARCHAR (10)  NULL,
    [GroupProvMCAL]          VARCHAR (10)  NULL,
    [GroupProvBS]            VARCHAR (10)  NULL,
    [StartDate]              DATETIME      NULL,
    [TermDate]               DATETIME      NULL,
    [CEPFlag]                CHAR (1)      NULL,
    [CEPAggregate]           CHAR (1)      NULL,
    [MBSIBilledSiteFlag]     CHAR (1)      NULL,
    [PARPracticeCode]        CHAR (3)      NULL,
    [Division]               CHAR (2)      NULL,
    [Department]             CHAR (3)      NULL,
    [PatSatMonthlyFlag]      CHAR (1)      CONSTRAINT [DF_PracLocLookUp_PatSatMonthlyFlag] DEFAULT ('N') NULL,
    [PatSatQuarterlyFlag]    CHAR (1)      CONSTRAINT [DF_PracLocLookUp_PatSatQuarterlyFlag] DEFAULT ('N') NULL,
    [PatSatSemiAnnuallyFlag] CHAR (1)      CONSTRAINT [DF_PracLocLookUp_PatSatSemiAnnuallyFlag] DEFAULT ('N') NULL,
    [CREDATE]                DATETIME      NULL,
    [UPDDATE]                DATETIME      NULL
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[PracLocLookUp] TO [MEDAMERICA\SpearM]
    AS [dbo];

