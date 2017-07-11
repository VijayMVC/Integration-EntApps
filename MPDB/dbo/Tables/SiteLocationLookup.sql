CREATE TABLE [dbo].[SiteLocationLookup] (
    [SiteLocationID]         INT           NOT NULL,
    [StaffGroup]             VARCHAR (50)  NULL,
    [PayrollDivision]        CHAR (2)      NULL,
    [PayrollDept]            CHAR (3)      NULL,
    [WebID]                  INT           NULL,
    [WebCode]                VARCHAR (20)  NULL,
    [MARSLocationNameProd]   VARCHAR (100) NULL,
    [PayrollName]            VARCHAR (100) NULL,
    [WebName]                VARCHAR (100) NULL,
    [EchoName]               VARCHAR (100) NULL,
    [SiteLocationName]       VARCHAR (100) NULL,
    [SiteName]               VARCHAR (100) NULL,
    [RegionID]               INT           NULL,
    [MedicareGroup]          VARCHAR (30)  NULL,
    [MediCalGroup]           VARCHAR (30)  NULL,
    [MedicaidGroup]          VARCHAR (30)  NULL,
    [NPIGroup]               VARCHAR (30)  NULL,
    [TaxID]                  CHAR (15)     NULL,
    [BlueShieldGroup]        VARCHAR (30)  NULL,
    [ActiveInactive]         VARCHAR (100) NULL,
    [ActiveInactiveMBSI]     VARCHAR (100) NULL,
    [StartDate]              DATETIME      NULL,
    [TermDate]               DATETIME      NULL,
    [DummySiteLocationFlag]  CHAR (1)      CONSTRAINT [DF_SiteLocationLookup_DummySiteLocationFlag] DEFAULT ('N') NULL,
    [WebSchedulingBeginDate] DATETIME      NULL,
    [ContractRostersFlag]    CHAR (1)      CONSTRAINT [DF_SiteLocationLookup_ContractRostersFlag] DEFAULT ('N') NULL,
    [CreDate]                DATETIME      CONSTRAINT [DF_SiteLocationLookup_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]                DATETIME      CONSTRAINT [DF_SiteLocationLookup_UpdDate] DEFAULT (getdate()) NULL
);


GO
CREATE CLUSTERED INDEX [SiteLocationLookup_Clustered_SiteLocationID_idx]
    ON [dbo].[SiteLocationLookup]([SiteLocationID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [SiteLocationLookup_Payroll_idx]
    ON [dbo].[SiteLocationLookup]([PayrollDivision] ASC, [PayrollDept] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [SiteLocationLookup_WebID_idx]
    ON [dbo].[SiteLocationLookup]([WebID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [SiteLocationLookup_StaffGroup_idx]
    ON [dbo].[SiteLocationLookup]([StaffGroup] ASC) WITH (FILLFACTOR = 90);

