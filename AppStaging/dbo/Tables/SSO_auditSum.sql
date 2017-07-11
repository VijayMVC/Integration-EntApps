CREATE TABLE [dbo].[SSO_auditSum] (
    [id]             INT      NOT NULL,
    [webID]          INT      NOT NULL,
    [pass1_hasClick] CHAR (1) NOT NULL,
    [pass2_hasRead]  CHAR (1) NOT NULL,
    [pass3_hasDecr]  CHAR (1) NOT NULL,
    [Date_run]       DATETIME NULL
);

