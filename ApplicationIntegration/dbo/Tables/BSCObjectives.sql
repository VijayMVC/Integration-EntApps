CREATE TABLE [dbo].[BSCObjectives] (
    [BSCO_ID]         INT           NOT NULL,
    [BSCAL_ID]        INT           NULL,
    [StaffGroup]      VARCHAR (50)  NULL,
    [ObjectivesCode]  CHAR (4)      NULL,
    [ObjectivesDescr] VARCHAR (100) NULL,
    [ActiveFlag]      CHAR (1)      NULL,
    [CreDate]         DATETIME      NULL,
    [UpdDate]         DATETIME      NULL
);

