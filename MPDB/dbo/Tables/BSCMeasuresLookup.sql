CREATE TABLE [dbo].[BSCMeasuresLookup] (
    [BSCML_ID]          INT           NOT NULL,
    [BSCO_ID]           INT           NULL,
    [StaffGroup]        VARCHAR (50)  NULL,
    [MeasuresDescr]     VARCHAR (100) NULL,
    [CurrentYear]       CHAR (4)      NULL,
    [PriorYear]         CHAR (4)      NULL,
    [NbrQuarters]       SMALLINT      CONSTRAINT [DF_BSCLkup_Measures_NbrQuarters] DEFAULT (4) NULL,
    [RequiredFlag]      CHAR (1)      NULL,
    [UpdateableFlag]    CHAR (1)      NULL,
    [ActiveFlag]        CHAR (1)      NULL,
    [CreDate]           DATETIME      CONSTRAINT [DF_BSCMeasuresLkup_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]           DATETIME      CONSTRAINT [DF_BSCMeasuresLkup_UpdDate] DEFAULT (getdate()) NULL,
    [LastUpdatedUserID] VARCHAR (60)  NULL,
    CONSTRAINT [PK_BSCMeasuresLookup] PRIMARY KEY CLUSTERED ([BSCML_ID] ASC) WITH (FILLFACTOR = 90)
);

