CREATE TABLE [dbo].[TempEchoMissingFromPMDB] (
    [Echo_Dr_ID]             CHAR (12)     NULL,
    [Echo_Dr_no_Ext]         CHAR (12)     NULL,
    [StaffGroup]             VARCHAR (50)  NULL,
    [Echo_Fac_Cd]            CHAR (4)      NULL,
    [LastName]               VARCHAR (50)  NULL,
    [FirstName]              VARCHAR (50)  NULL,
    [Title]                  VARCHAR (50)  NULL,
    [Echo_Org_Name]          VARCHAR (100) NULL,
    [StaffStatus]            VARCHAR (100) NULL,
    [PartnerShipLevelCode]   CHAR (10)     NULL,
    [PartnershipLevel]       VARCHAR (100) NULL,
    [IncompleteSSNFlag]      CHAR (1)      CONSTRAINT [DF_TempEchoMssingFromPMDB_IncompleteSSNFlag] DEFAULT ('N') NULL,
    [NoAddressFlag]          CHAR (1)      CONSTRAINT [DF_TempEchoMssingFromPMDB_NoAddressFlag] DEFAULT ('N') NULL,
    [NoAffiliationFlag]      CHAR (1)      CONSTRAINT [DF_TempEchoMssingFromPMDB_NoAffiliationFlag] DEFAULT ('N') NULL,
    [NoPartnerShipLevelFlag] CHAR (1)      CONSTRAINT [DF_TempEchoMssingFromPMDB_NoPartnerShipLevelFlag] DEFAULT ('N') NULL,
    [NoFacilityStatusFlag]   CHAR (1)      CONSTRAINT [DF_TempEchoMssingFromPMDB_NoFacilityStatysFlag] DEFAULT ('N') NULL,
    [LessThan7DaysFlag]      CHAR (1)      CONSTRAINT [DF_TempEchoMssingFromPMDB_LessThan7DaysFlag] DEFAULT ('N') NULL,
    [CreDate]                DATETIME      CONSTRAINT [DF_TempEchoMssingFromPMDB_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]                DATETIME      CONSTRAINT [DF_TempEchoMssingFromPMDB_UpdDate] DEFAULT (getdate()) NULL
);

