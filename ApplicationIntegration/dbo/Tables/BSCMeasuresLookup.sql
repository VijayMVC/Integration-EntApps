CREATE TABLE [dbo].[BSCMeasuresLookup] (
    [BSCML_ID]          INT           NOT NULL,
    [BSCO_ID]           INT           NULL,
    [StaffGroup]        VARCHAR (50)  NULL,
    [MeasuresDescr]     VARCHAR (100) NULL,
    [CurrentYear]       CHAR (4)      NULL,
    [PriorYear]         CHAR (4)      NULL,
    [NbrQuarters]       SMALLINT      NULL,
    [RequiredFlag]      CHAR (1)      NULL,
    [UpdateableFlag]    CHAR (1)      NULL,
    [ActiveFlag]        CHAR (1)      NULL,
    [CreDate]           DATETIME      NULL,
    [UpdDate]           DATETIME      NULL,
    [LastUpdatedUserID] VARCHAR (60)  NULL
);

