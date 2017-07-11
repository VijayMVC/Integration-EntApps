CREATE TABLE [dbo].[Echo_Address2] (
    [l_address]  INT       NOT NULL,
    [Link]       INT       NOT NULL,
    [tax_id]     CHAR (15) NOT NULL,
    [sub_tax_id] CHAR (8)  NOT NULL,
    [isTaxID]    BIT       NOT NULL
);


GO
CREATE CLUSTERED INDEX [Echo_Address2_l_address_idx]
    ON [dbo].[Echo_Address2]([l_address] ASC) WITH (FILLFACTOR = 90);

