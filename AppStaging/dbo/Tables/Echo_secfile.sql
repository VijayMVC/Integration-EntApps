CREATE TABLE [dbo].[Echo_secfile] (
    [sec_cd] CHAR (5)  CONSTRAINT [DF__TEMP_secf__sec_c__536FF051] DEFAULT ('') NOT NULL,
    [otext]  CHAR (50) CONSTRAINT [DF__TEMP_secf__otext__5464148A] DEFAULT ('') NOT NULL,
    [s01]    CHAR (50) CONSTRAINT [DF__TEMP_secfil__s01__555838C3] DEFAULT ('') NOT NULL,
    [s02]    CHAR (50) CONSTRAINT [DF__TEMP_secfil__s02__564C5CFC] DEFAULT ('') NOT NULL,
    [s03]    CHAR (50) CONSTRAINT [DF__TEMP_secfil__s03__57408135] DEFAULT ('') NOT NULL,
    [s04]    CHAR (50) CONSTRAINT [DF__TEMP_secfil__s04__5834A56E] DEFAULT ('') NOT NULL,
    [s05]    CHAR (50) CONSTRAINT [DF__TEMP_secfil__s05__5928C9A7] DEFAULT ('') NOT NULL,
    [s06]    CHAR (50) CONSTRAINT [DF__TEMP_secfil__s06__5A1CEDE0] DEFAULT ('') NOT NULL,
    [s07]    CHAR (50) CONSTRAINT [DF__TEMP_secfil__s07__5B111219] DEFAULT ('') NOT NULL,
    [s08]    CHAR (50) CONSTRAINT [DF__TEMP_secfil__s08__5C053652] DEFAULT ('') NOT NULL,
    [s09]    CHAR (50) CONSTRAINT [DF__TEMP_secfil__s09__5CF95A8B] DEFAULT ('') NOT NULL,
    [s10]    CHAR (50) CONSTRAINT [DF__TEMP_secfil__s10__5DED7EC4] DEFAULT ('') NOT NULL,
    [s11]    CHAR (50) CONSTRAINT [DF__TEMP_secfil__s11__5EE1A2FD] DEFAULT ('') NOT NULL,
    [s12]    CHAR (50) CONSTRAINT [DF__TEMP_secfil__s12__5FD5C736] DEFAULT ('') NOT NULL,
    [s13]    CHAR (50) CONSTRAINT [DF__TEMP_secfil__s13__60C9EB6F] DEFAULT ('') NOT NULL,
    [s14]    CHAR (50) CONSTRAINT [DF__TEMP_secfil__s14__61BE0FA8] DEFAULT ('') NOT NULL,
    [s15]    CHAR (50) CONSTRAINT [DF__TEMP_secfil__s15__62B233E1] DEFAULT ('') NOT NULL,
    [s16]    CHAR (50) CONSTRAINT [DF__TEMP_secfil__s16__63A6581A] DEFAULT ('') NOT NULL,
    [s17]    CHAR (50) CONSTRAINT [DF__TEMP_secfil__s17__649A7C53] DEFAULT ('') NOT NULL,
    [s18]    CHAR (50) CONSTRAINT [DF__TEMP_secfil__s18__658EA08C] DEFAULT ('') NOT NULL,
    [s19]    CHAR (50) CONSTRAINT [DF__TEMP_secfil__s19__6682C4C5] DEFAULT ('') NOT NULL,
    [s20]    CHAR (50) CONSTRAINT [DF__TEMP_secfil__s20__6776E8FE] DEFAULT ('') NOT NULL,
    [s21]    CHAR (50) CONSTRAINT [DF__TEMP_secfil__s21__686B0D37] DEFAULT ('') NOT NULL,
    [s22]    CHAR (50) CONSTRAINT [DF__TEMP_secfil__s22__695F3170] DEFAULT ('') NOT NULL,
    [s23]    CHAR (50) CONSTRAINT [DF__TEMP_secfil__s23__6A5355A9] DEFAULT ('') NOT NULL,
    [s24]    CHAR (50) CONSTRAINT [DF__TEMP_secfil__s24__6B4779E2] DEFAULT ('') NOT NULL,
    [s25]    CHAR (50) CONSTRAINT [DF__TEMP_secfil__s25__6C3B9E1B] DEFAULT ('') NOT NULL,
    [s26]    CHAR (50) CONSTRAINT [DF__TEMP_secfil__s26__6D2FC254] DEFAULT ('') NOT NULL,
    [s27]    CHAR (50) CONSTRAINT [DF__TEMP_secfil__s27__6E23E68D] DEFAULT ('') NOT NULL,
    [s28]    CHAR (50) CONSTRAINT [DF__TEMP_secfil__s28__6F180AC6] DEFAULT ('') NOT NULL,
    [s29]    CHAR (50) CONSTRAINT [DF__TEMP_secfil__s29__700C2EFF] DEFAULT ('') NOT NULL,
    [s30]    CHAR (50) CONSTRAINT [DF__TEMP_secfil__s30__71005338] DEFAULT ('') NOT NULL,
    [note]   TEXT      CONSTRAINT [DF__TEMP_secfi__note__71F47771] DEFAULT ('') NOT NULL,
    [link]   INT       IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_secfile] PRIMARY KEY NONCLUSTERED ([sec_cd] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [No_blank_Department_codes] CHECK ([sec_cd] <> '')
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [secfile_link]
    ON [dbo].[Echo_secfile]([link] ASC) WITH (FILLFACTOR = 90);


GO
/*  Delete Trigger 'T_D_secfile' for Table 'secfile'  */
CREATE TRIGGER T_D_secfile ON [dbo].[Echo_secfile] FOR DELETE AS
BEGIN
    DECLARE
           @row_count       INT,
           @error_number    INT,
           @error_message   VARCHAR(255)
    SELECT @row_count = @@rowcount
    IF @row_count = 0
       RETURN
  SET NOCOUNT ON
   IF 'secfile' = 'DRNAME'
       Delete DR_PLAN2 Where L_ADDRESS in
          (Select LINK from ADDRESS Where DR_ID in
          (Select DR_ID from DELETED))
/*  Parent in 'secfile' cannot be deleted if children exist in 'stfstatu'  */
IF EXISTS (
           SELECT 1
           FROM   stfstatu c, deleted d
           WHERE  c.sec_cd = d.sec_cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Department and Section is used in Provider Facility records. Cannot delete this Department and Section until the Provider Facility records are deleted.'
        GOTO error
   END
/*  Parent in 'secfile' cannot be deleted if children exist in 'depart'  */
IF EXISTS (
           SELECT 1
           FROM   depart c, deleted d
           WHERE  c.sec_cd = d.sec_cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Department and Section is used in Department History records. Cannot delete this Department and Section until the Department History records are deleted.'
        GOTO error
   END
/*  Parent in 'secfile' cannot be deleted if children exist in 'patient'  */
IF EXISTS (
           SELECT 1
           FROM   patient c, deleted d
           WHERE  c.dept = d.sec_cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Department and Section is used in Patient records. Cannot delete this Department and Section until the Patient records are deleted.'
        GOTO error
   END
RETURN
/*  Error Handling  */
error:
      RAISERROR @error_number @error_message
      ROLLBACK TRANSACTION
END

GO
/*  Update Trigger 'T_U_secfile' for Table 'secfile'  */
CREATE TRIGGER T_U_secfile ON [dbo].[Echo_secfile] FOR UPDATE AS
BEGIN
    DECLARE
           @row_count       INT,
           @null_row_count  INT,
           @blank_row_count  INT,
           @error_number    INT,
           @error_message   VARCHAR(255)
    SELECT @row_count = @@rowcount
    IF @row_count = 0
       RETURN
  SET NOCOUNT ON
/*  Cascade the Update of the Primary Key of 'secfile' into its children in 'stfstatu'  */
IF UPDATE(sec_cd)
   BEGIN
        UPDATE stfstatu
        SET    sec_cd = i.sec_cd
        FROM   stfstatu c, inserted i, deleted d
        WHERE  c.sec_cd = d.sec_cd
        AND    (i.sec_cd != d.sec_cd)
   END
/*  Setting a section to blank is the same as deleting it.  Don't allow it if the section is in use. */
If Update(S01)
  Begin
    If exists(
      Select 1
      From stfstatu c, inserted i join deleted d on i.link = d.link
      Where i.s01 = '' and d.s01 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 1 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S02)
  Begin
    If exists(
      Select 1
      From stfstatu c, inserted i join deleted d on i.link = d.link
      Where i.s02 = '' and d.s02 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 2 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S03)
  Begin
    If exists(
      Select 1
      From stfstatu c, inserted i join deleted d on i.link = d.link
      Where i.s03 = '' and d.s03 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 3 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S04)
  Begin
    If exists(
      Select 1
      From stfstatu c, inserted i join deleted d on i.link = d.link
      Where i.s04 = '' and d.s04 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 4 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S05)
  Begin
    If exists(
      Select 1
      From stfstatu c, inserted i join deleted d on i.link = d.link
      Where i.s05 = '' and d.s05 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 5 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S06)
  Begin
    If exists(
      Select 1
      From stfstatu c, inserted i join deleted d on i.link = d.link
      Where i.s06 = '' and d.s06 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 6 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S07)
  Begin
    If exists(
      Select 1
      From stfstatu c, inserted i join deleted d on i.link = d.link
      Where i.s07 = '' and d.s07 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 7 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S08)
  Begin
    If exists(
      Select 1
      From stfstatu c, inserted i join deleted d on i.link = d.link
      Where i.s08 = '' and d.s08 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 8 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S09)
  Begin
    If exists(
      Select 1
      From stfstatu c, inserted i join deleted d on i.link = d.link
      Where i.s09 = '' and d.s09 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 9 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S10)
  Begin
    If exists(
      Select 1
      From stfstatu c, inserted i join deleted d on i.link = d.link
      Where i.s10 = '' and d.s10 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 10 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S11)
  Begin
    If exists(
      Select 1
      From stfstatu c, inserted i join deleted d on i.link = d.link
      Where i.s11 = '' and d.s11 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 11 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S12)
  Begin
    If exists(
      Select 1
      From stfstatu c, inserted i join deleted d on i.link = d.link
      Where i.s12 = '' and d.s12 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 12 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S13)
  Begin
    If exists(
      Select 1
      From stfstatu c, inserted i join deleted d on i.link = d.link
      Where i.s13 = '' and d.s13 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 13 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S14)
  Begin
    If exists(
      Select 1
      From stfstatu c, inserted i join deleted d on i.link = d.link
      Where i.s14 = '' and d.s14 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 14 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S05)
  Begin
    If exists(
      Select 1
      From stfstatu c, inserted i join deleted d on i.link = d.link
      Where i.s15 = '' and d.s15 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 15 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S16)
  Begin
    If exists(
      Select 1
      From stfstatu c, inserted i join deleted d on i.link = d.link
      Where i.s16 = '' and d.s16 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 16 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S17)
  Begin
    If exists(
      Select 1
      From stfstatu c, inserted i join deleted d on i.link = d.link
      Where i.s17 = '' and d.s17 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 17 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S18)
  Begin
    If exists(
      Select 1
      From stfstatu c, inserted i join deleted d on i.link = d.link
      Where i.s18 = '' and d.s18 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 18 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S19)
  Begin
    If exists(
      Select 1
      From stfstatu c, inserted i join deleted d on i.link = d.link
      Where i.s19 = '' and d.s19 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 19 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S20)
  Begin
    If exists(
      Select 1
      From stfstatu c, inserted i join deleted d on i.link = d.link
      Where i.s20 = '' and d.s20 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 20 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S21)
  Begin
    If exists(
      Select 1
      From stfstatu c, inserted i join deleted d on i.link = d.link
      Where i.s21 = '' and d.s21 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 21 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S22)
  Begin
    If exists(
      Select 1
      From stfstatu c, inserted i join deleted d on i.link = d.link
      Where i.s22 = '' and d.s22 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 22 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S23)
  Begin
    If exists(
      Select 1
      From stfstatu c, inserted i join deleted d on i.link = d.link
      Where i.s23 = '' and d.s23 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 23 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S24)
  Begin
    If exists(
      Select 1
      From stfstatu c, inserted i join deleted d on i.link = d.link
      Where i.s24 = '' and d.s24 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 24 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S25)
  Begin
    If exists(
      Select 1
      From stfstatu c, inserted i join deleted d on i.link = d.link
      Where i.s25 = '' and d.s25 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 25 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S26)
  Begin
    If exists(
      Select 1
      From stfstatu c, inserted i join deleted d on i.link = d.link
      Where i.s26 = '' and d.s26 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 26 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S27)
  Begin
    If exists(
      Select 1
      From stfstatu c, inserted i join deleted d on i.link = d.link
      Where i.s27 = '' and d.s27 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 27 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S28)
  Begin
    If exists(
      Select 1
      From stfstatu c, inserted i join deleted d on i.link = d.link
      Where i.s28 = '' and d.s28 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 28 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S29)
  Begin
    If exists(
      Select 1
      From stfstatu c, inserted i join deleted d on i.link = d.link
      Where i.s29 = '' and d.s29 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 29 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S30)
  Begin
    If exists(
      Select 1
      From stfstatu c, inserted i join deleted d on i.link = d.link
      Where i.s30 = '' and d.s30 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 30 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
/*  Cascade the Update of the Primary Key of 'secfile' into its children in 'depart'  */
IF UPDATE(sec_cd)
   BEGIN
        UPDATE depart
        SET    sec_cd = i.sec_cd
        FROM   depart c, inserted i, deleted d
        WHERE  c.sec_cd = d.sec_cd
        AND    (i.sec_cd != d.sec_cd)
   END
/*  Setting a section to blank is the same as deleting it.  Don't allow it if the section is in use. */
If Update(S01)
  Begin
    If exists(
      Select 1
      From depart c, inserted i join deleted d on i.link = d.link
      Where i.s01 = '' and d.s01 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 1 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S02)
  Begin
    If exists(
      Select 1
      From depart c, inserted i join deleted d on i.link = d.link
      Where i.s02 = '' and d.s02 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 2 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S03)
  Begin
    If exists(
      Select 1
      From depart c, inserted i join deleted d on i.link = d.link
      Where i.s03 = '' and d.s03 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 3 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S04)
  Begin
    If exists(
      Select 1
      From depart c, inserted i join deleted d on i.link = d.link
      Where i.s04 = '' and d.s04 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 4 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S05)
  Begin
    If exists(
      Select 1
      From depart c, inserted i join deleted d on i.link = d.link
      Where i.s05 = '' and d.s05 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 5 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S06)
  Begin
    If exists(
      Select 1
      From depart c, inserted i join deleted d on i.link = d.link
      Where i.s06 = '' and d.s06 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 6 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S07)
  Begin
    If exists(
      Select 1
      From depart c, inserted i join deleted d on i.link = d.link
      Where i.s07 = '' and d.s07 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 7 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S08)
  Begin
    If exists(
      Select 1
      From depart c, inserted i join deleted d on i.link = d.link
      Where i.s08 = '' and d.s08 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 8 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S09)
  Begin
    If exists(
      Select 1
      From depart c, inserted i join deleted d on i.link = d.link
      Where i.s09 = '' and d.s09 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 9 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S10)
  Begin
    If exists(
      Select 1
      From depart c, inserted i join deleted d on i.link = d.link
      Where i.s10 = '' and d.s10 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 10 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S11)
  Begin
    If exists(
      Select 1
      From depart c, inserted i join deleted d on i.link = d.link
      Where i.s11 = '' and d.s11 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 11 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S12)
  Begin
    If exists(
      Select 1
      From depart c, inserted i join deleted d on i.link = d.link
      Where i.s12 = '' and d.s12 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 12 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S13)
  Begin
    If exists(
      Select 1
      From depart c, inserted i join deleted d on i.link = d.link
      Where i.s13 = '' and d.s13 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 13 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S14)
  Begin
    If exists(
      Select 1
      From depart c, inserted i join deleted d on i.link = d.link
      Where i.s14 = '' and d.s14 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 14 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S05)
  Begin
    If exists(
      Select 1
      From depart c, inserted i join deleted d on i.link = d.link
      Where i.s15 = '' and d.s15 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 15 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S16)
  Begin
    If exists(
      Select 1
      From depart c, inserted i join deleted d on i.link = d.link
      Where i.s16 = '' and d.s16 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 16 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S17)
  Begin
    If exists(
      Select 1
      From depart c, inserted i join deleted d on i.link = d.link
      Where i.s17 = '' and d.s17 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 17 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S18)
  Begin
    If exists(
      Select 1
      From depart c, inserted i join deleted d on i.link = d.link
      Where i.s18 = '' and d.s18 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 18 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S19)
  Begin
    If exists(
      Select 1
      From depart c, inserted i join deleted d on i.link = d.link
      Where i.s19 = '' and d.s19 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 19 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S20)
  Begin
    If exists(
      Select 1
      From depart c, inserted i join deleted d on i.link = d.link
      Where i.s20 = '' and d.s20 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 20 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S21)
  Begin
    If exists(
      Select 1
      From depart c, inserted i join deleted d on i.link = d.link
      Where i.s21 = '' and d.s21 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 21 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S22)
  Begin
    If exists(
      Select 1
      From depart c, inserted i join deleted d on i.link = d.link
      Where i.s22 = '' and d.s22 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 22 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S23)
  Begin
    If exists(
      Select 1
      From depart c, inserted i join deleted d on i.link = d.link
      Where i.s23 = '' and d.s23 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 23 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S24)
  Begin
    If exists(
      Select 1
      From depart c, inserted i join deleted d on i.link = d.link
      Where i.s24 = '' and d.s24 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 24 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S25)
  Begin
    If exists(
      Select 1
      From depart c, inserted i join deleted d on i.link = d.link
      Where i.s25 = '' and d.s25 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 25 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S26)
  Begin
    If exists(
      Select 1
      From depart c, inserted i join deleted d on i.link = d.link
      Where i.s26 = '' and d.s26 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 26 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S27)
  Begin
    If exists(
      Select 1
      From depart c, inserted i join deleted d on i.link = d.link
      Where i.s27 = '' and d.s27 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 27 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S28)
  Begin
    If exists(
      Select 1
      From depart c, inserted i join deleted d on i.link = d.link
      Where i.s28 = '' and d.s28 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 28 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S29)
  Begin
    If exists(
      Select 1
      From depart c, inserted i join deleted d on i.link = d.link
      Where i.s29 = '' and d.s29 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 29 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
If Update(S30)
  Begin
    If exists(
      Select 1
      From depart c, inserted i join deleted d on i.link = d.link
      Where i.s30 = '' and d.s30 <> '' and
          ( c.sec_cd = i.sec_cd and c.secnum = 1)
                 )
        Begin
          Select @error_number = 30004,
                      @error_message  = 'Section 30 is used in providers records.  Cannot blank out.'
          GoTo error
        End
  End
/*  Cascade the Update of the Primary Key of 'secfile' into its children in 'patient'  */
IF UPDATE(sec_cd)
   BEGIN
        UPDATE patient
        SET    dept = i.sec_cd
        FROM   patient c, inserted i join deleted d on i.link = d.link
        WHERE  c.dept = d.sec_cd
        AND    (i.sec_cd != d.sec_cd)
   END
RETURN
/*  Error Handling  */
error:
      RAISERROR @error_number @error_message
      ROLLBACK TRANSACTION
END
