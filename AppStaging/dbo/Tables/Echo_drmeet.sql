CREATE TABLE [dbo].[Echo_drmeet] (
    [dr_id]     CHAR (12) NOT NULL,
    [attn]      CHAR (1)  NOT NULL,
    [mtitle]    CHAR (40) NOT NULL,
    [dte]       DATETIME  NULL,
    [mtime]     CHAR (8)  NOT NULL,
    [fac_cd]    CHAR (4)  NOT NULL,
    [lap]       CHAR (12) NOT NULL,
    [dr_name]   CHAR (85) NOT NULL,
    [dr_no_ext] CHAR (12) NOT NULL,
    [link]      INT       NOT NULL,
    [l_mename]  INT       NULL
);

