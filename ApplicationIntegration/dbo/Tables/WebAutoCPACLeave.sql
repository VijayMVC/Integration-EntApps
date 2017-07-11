CREATE TABLE [dbo].[WebAutoCPACLeave] (
    [LeaveType]        VARCHAR (255) NULL,
    [ProviderMasterID] INT           NOT NULL,
    [FromDate]         DATETIME      NULL,
    [ToDate]           DATETIME      NULL,
    [Comment]          TEXT          NULL,
    [CreDate]          DATETIME      NOT NULL
);

