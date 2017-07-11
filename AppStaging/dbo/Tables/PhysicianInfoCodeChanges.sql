CREATE TABLE [dbo].[PhysicianInfoCodeChanges] (
    [ProviderMasterID] INT           NULL,
    [WebID]            INT           NULL,
    [Code]             NVARCHAR (50) NULL
);


GO
CREATE CLUSTERED INDEX [PICC_idx]
    ON [dbo].[PhysicianInfoCodeChanges]([ProviderMasterID] ASC, [WebID] ASC) WITH (FILLFACTOR = 90);

