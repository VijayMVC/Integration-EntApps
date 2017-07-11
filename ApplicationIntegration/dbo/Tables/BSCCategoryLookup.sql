CREATE TABLE [dbo].[BSCCategoryLookup] (
    [BSCAL_ID]      INT           NOT NULL,
    [StaffGroup]    VARCHAR (50)  NULL,
    [CurrentYear]   CHAR (4)      NULL,
    [PriorYear]     CHAR (4)      NULL,
    [CategoryCode]  CHAR (4)      NULL,
    [CategoryDescr] VARCHAR (100) NULL,
    [ActiveFlag]    CHAR (1)      NULL,
    [CreDate]       DATETIME      NULL,
    [UpdDate]       DATETIME      NULL
);

