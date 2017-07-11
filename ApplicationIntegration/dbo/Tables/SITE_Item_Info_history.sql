CREATE TABLE [dbo].[SITE_Item_Info_history] (
    [ID_Site]    CHAR (10)      NOT NULL,
    [ID_Item]    INT            NOT NULL,
    [Item_Value] NVARCHAR (200) NULL,
    [Author]     INT            NULL,
    [Timestmp]   SMALLDATETIME  NULL
);

