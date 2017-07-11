CREATE TABLE [dbo].[Ceridian_DummySites] (
    [CIFlxID]   INT          NULL,
    [CIValue]   VARCHAR (30) NULL,
    [CIDescrip] VARCHAR (30) NULL
);


GO
CREATE CLUSTERED INDEX [Cer_Dum_idx]
    ON [dbo].[Ceridian_DummySites]([CIFlxID] ASC) WITH (FILLFACTOR = 90);

