CREATE TABLE [dbo].[Echo_depart] (
    [secnum]    SMALLINT  NOT NULL,
    [cmt]       CHAR (66) NOT NULL,
    [fdate]     DATETIME  NULL,
    [tdate]     DATETIME  NULL,
    [pos_cd]    CHAR (3)  NOT NULL,
    [lap]       CHAR (12) NOT NULL,
    [dr_id]     CHAR (12) NOT NULL,
    [fac_cd]    CHAR (4)  NOT NULL,
    [link]      INT       NOT NULL,
    [l_secfile] INT       NULL
);

