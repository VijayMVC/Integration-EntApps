CREATE TABLE [dbo].[Echo_Audit] (
    [dr_id]           CHAR (12)    CONSTRAINT [DF__TEMP_audi__dr_id__64BDA540] DEFAULT ('') NOT NULL,
    [initials]        CHAR (12)    CONSTRAINT [DF__TEMP_audi__initi__65B1C979] DEFAULT ('') NOT NULL,
    [dte]             DATETIME     NULL,
    [change]          TEXT         CONSTRAINT [DF__TEMP_audi__chang__66A5EDB2] DEFAULT ('') NOT NULL,
    [type]            CHAR (1)     CONSTRAINT [DF__TEMP_audit__type__679A11EB] DEFAULT ('') NOT NULL,
    [dbf_name]        VARCHAR (30) CONSTRAINT [DF__TEMP_audi__dbf_n__688E3624] DEFAULT ('') NOT NULL,
    [field_name]      CHAR (20)    CONSTRAINT [DF__TEMP_audi__field__69825A5D] DEFAULT ('') NOT NULL,
    [pat_crypt]       CHAR (24)    CONSTRAINT [DF__TEMP_audi__pat_c__6A767E96] DEFAULT ('') NOT NULL,
    [act]             CHAR (5)     CONSTRAINT [DF__TEMP_audit__act__6B6AA2CF] DEFAULT ('') NOT NULL,
    [trueid]          CHAR (12)    CONSTRAINT [DF__TEMP_audi__truei__6C5EC708] DEFAULT ('') NOT NULL,
    [link]            INT          IDENTITY (1, 1) NOT NULL,
    [L_FromTableLink] INT          NULL,
    [l_patient]       INT          CONSTRAINT [DF__TEMP_audi__l_pat__6D52EB41] DEFAULT ('') NULL,
    CONSTRAINT [PK_audit] PRIMARY KEY NONCLUSTERED ([link] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [DR_ID]
    ON [dbo].[Echo_Audit]([dr_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [DTE]
    ON [dbo].[Echo_Audit]([dte] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [Audit_L_FromTableLink]
    ON [dbo].[Echo_Audit]([L_FromTableLink] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [Audit_Initials]
    ON [dbo].[Echo_Audit]([initials] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [l_patient]
    ON [dbo].[Echo_Audit]([l_patient] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pat_crypt]
    ON [dbo].[Echo_Audit]([pat_crypt] ASC) WITH (FILLFACTOR = 90);

