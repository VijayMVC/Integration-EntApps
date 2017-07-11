CREATE TABLE [dbo].[PhysicianInfoCodeChangesOriginal] (
    [ProviderMasterID] INT           NULL,
    [WebID]            INT           NULL,
    [Code]             NVARCHAR (50) NULL
);


GO
CREATE CLUSTERED INDEX [PICCO_idx]
    ON [dbo].[PhysicianInfoCodeChangesOriginal]([ProviderMasterID] ASC, [WebID] ASC) WITH (FILLFACTOR = 90);

