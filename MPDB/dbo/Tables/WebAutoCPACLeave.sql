CREATE TABLE [dbo].[WebAutoCPACLeave] (
    [LeaveStatusCode]  CHAR (5)  NOT NULL,
    [Echo_Dr_ID]       CHAR (12) NOT NULL,
    [ProviderMasterID] INT       NULL,
    [FromDate]         DATETIME  NULL,
    [ToDate]           DATETIME  NULL,
    [Comment]          CHAR (66) NOT NULL,
    [LeaveStatus]      CHAR (50) NOT NULL,
    [Credate]          DATETIME  NULL
);

