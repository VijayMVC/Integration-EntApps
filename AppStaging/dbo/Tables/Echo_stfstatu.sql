CREATE TABLE [dbo].[Echo_stfstatu] (
    [dr_id]      CHAR (12)      CONSTRAINT [DF__TEMP_stfs__dr_id__77AD50C7] DEFAULT ('') NOT NULL,
    [dr_no_ext]  CHAR (12)      CONSTRAINT [DF__TEMP_stfs__dr_no__78A17500] DEFAULT ('') NOT NULL,
    [active123]  CHAR (1)       NOT NULL,
    [staff_cd]   CHAR (3)       CONSTRAINT [DF__TEMP_stfs__staff__79959939] DEFAULT ('') NOT NULL,
    [dte]        DATETIME       NULL,
    [cmt]        CHAR (66)      CONSTRAINT [DF__TEMP_stfsta__cmt__7A89BD72] DEFAULT ('') NOT NULL,
    [cmt2]       CHAR (66)      CONSTRAINT [DF__TEMP_stfst__cmt2__7B7DE1AB] DEFAULT ('') NOT NULL,
    [fac_cd]     CHAR (4)       NOT NULL,
    [sec_cd]     CHAR (5)       CONSTRAINT [DF__TEMP_stfs__sec_c__7C7205E4] DEFAULT ('') NOT NULL,
    [secnum]     SMALLINT       CONSTRAINT [DF__TEMP_stfs__secnu__7D662A1D] DEFAULT (0) NOT NULL,
    [fdate]      DATETIME       NULL,
    [tdate]      DATETIME       NULL,
    [rec_date]   DATETIME       NULL,
    [rea_date]   DATETIME       NULL,
    [a_or_r]     CHAR (1)       CONSTRAINT [DF__TEMP_stfs__a_or___7E5A4E56] DEFAULT ('') NOT NULL,
    [r_complete] BIT            CONSTRAINT [DF__TEMP_stfs__r_com__7F4E728F] DEFAULT (0) NOT NULL,
    [complete_d] DATETIME       NULL,
    [cmt1]       CHAR (60)      CONSTRAINT [DF__TEMP_stfst__cmt1__004296C8] DEFAULT ('') NOT NULL,
    [pos_cd]     CHAR (3)       CONSTRAINT [DF__TEMP_stfs__pos_c__0136BB01] DEFAULT ('') NOT NULL,
    [staff_text] CHAR (20)      CONSTRAINT [DF__TEMP_stfs__staff__022ADF3A] DEFAULT ('') NOT NULL,
    [tre]        CHAR (1)       CONSTRAINT [DF__TEMP_stfsta__tre__031F0373] DEFAULT ('') NOT NULL,
    [notdate]    DATETIME       NULL,
    [inv_no]     CHAR (5)       CONSTRAINT [DF__TEMP_stfs__inv_n__041327AC] DEFAULT ('') NOT NULL,
    [amount]     DECIMAL (6, 2) CONSTRAINT [DF__TEMP_stfs__amoun__05074BE5] DEFAULT (0) NOT NULL,
    [duedate]    DATETIME       NULL,
    [paydate]    DATETIME       NULL,
    [paid]       BIT            CONSTRAINT [DF__TEMP_stfst__paid__05FB701E] DEFAULT (0) NOT NULL,
    [note_date]  DATETIME       NULL,
    [tdu]        CHAR (1)       CONSTRAINT [DF__TEMP_stfsta__tdu__06EF9457] DEFAULT ('') NOT NULL,
    [udf1]       CHAR (5)       CONSTRAINT [DF__TEMP_stfst__udf1__07E3B890] DEFAULT ('') NOT NULL,
    [udf2]       CHAR (5)       CONSTRAINT [DF__TEMP_stfst__udf2__08D7DCC9] DEFAULT ('') NOT NULL,
    [udf3]       CHAR (5)       CONSTRAINT [DF__TEMP_stfst__udf3__09CC0102] DEFAULT ('') NOT NULL,
    [udf4]       CHAR (5)       CONSTRAINT [DF__TEMP_stfst__udf4__0AC0253B] DEFAULT ('') NOT NULL,
    [udf5]       CHAR (5)       CONSTRAINT [DF__TEMP_stfst__udf5__0BB44974] DEFAULT ('') NOT NULL,
    [udf6]       CHAR (5)       CONSTRAINT [DF__TEMP_stfst__udf6__0CA86DAD] DEFAULT ('') NOT NULL,
    [udf1_dt]    DATETIME       NULL,
    [udf2_dt]    DATETIME       NULL,
    [udf3_dt]    DATETIME       NULL,
    [udf4_dt]    DATETIME       NULL,
    [udf5_dt]    DATETIME       NULL,
    [udf6_dt]    DATETIME       NULL,
    [yr_join]    SMALLINT       CONSTRAINT [DF__TEMP_stfs__yr_jo__0D9C91E6] DEFAULT (0) NOT NULL,
    [medicare]   CHAR (14)      CONSTRAINT [DF__TEMP_stfs__medic__0E90B61F] DEFAULT ('') NOT NULL,
    [medicaid]   CHAR (14)      CONSTRAINT [DF__TEMP_stfs__medic__0F84DA58] DEFAULT ('') NOT NULL,
    [cmt3]       CHAR (66)      CONSTRAINT [DF__TEMP_stfst__cmt3__1078FE91] DEFAULT ('') NOT NULL,
    [cmt4]       CHAR (66)      CONSTRAINT [DF__TEMP_stfst__cmt4__116D22CA] DEFAULT ('') NOT NULL,
    [udf7]       CHAR (5)       CONSTRAINT [DF__TEMP_stfst__udf7__12614703] DEFAULT ('') NOT NULL,
    [udf8]       CHAR (5)       CONSTRAINT [DF__TEMP_stfst__udf8__13556B3C] DEFAULT ('') NOT NULL,
    [udf9]       CHAR (60)      CONSTRAINT [DF__TEMP_stfst__udf9__14498F75] DEFAULT ('') NOT NULL,
    [udf10]      CHAR (60)      CONSTRAINT [DF__TEMP_stfs__udf10__153DB3AE] DEFAULT ('') NOT NULL,
    [udf11]      BIT            CONSTRAINT [DF__TEMP_stfs__udf11__1631D7E7] DEFAULT (0) NOT NULL,
    [udf12]      BIT            CONSTRAINT [DF__TEMP_stfs__udf12__1725FC20] DEFAULT (0) NOT NULL,
    [udf7_dt]    DATETIME       NULL,
    [udf8_dt]    DATETIME       NULL,
    [term_code]  CHAR (5)       CONSTRAINT [DF__TEMP_stfs__term___181A2059] DEFAULT ('') NOT NULL,
    [effectdate] DATETIME       NULL,
    [term_date]  DATETIME       NULL,
    [renew_date] DATETIME       NULL,
    [pcp_spec]   CHAR (1)       CONSTRAINT [DF__TEMP_stfs__pcp_s__190E4492] DEFAULT ('') NOT NULL,
    [lap]        CHAR (12)      CONSTRAINT [DF__TEMP_stfsta__lap__1A0268CB] DEFAULT ('') NOT NULL,
    [pin]        CHAR (25)      CONSTRAINT [DF__TEMP_stfsta__pin__1AF68D04] DEFAULT ('') NOT NULL,
    [grp]        CHAR (30)      CONSTRAINT [DF__TEMP_stfsta__grp__1BEAB13D] DEFAULT ('') NOT NULL,
    [link]       INT            IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_stfstatu] PRIMARY KEY NONCLUSTERED ([link] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [Invalid_Section] CHECK ([secnum] >= 0 and [secnum] <= 30)
);


GO
CREATE CLUSTERED INDEX [stfstatu1]
    ON [dbo].[Echo_stfstatu]([active123] ASC, [dr_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [COMPLETE_D]
    ON [dbo].[Echo_stfstatu]([complete_d] ASC, [dr_id] ASC, [active123] ASC, [fac_cd] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [DTE]
    ON [dbo].[Echo_stfstatu]([dte] ASC, [dr_id] ASC, [active123] ASC, [fac_cd] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [DUEDATE]
    ON [dbo].[Echo_stfstatu]([duedate] ASC, [dr_id] ASC, [active123] ASC, [fac_cd] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [EFFECTDATE]
    ON [dbo].[Echo_stfstatu]([effectdate] ASC, [dr_id] ASC, [active123] ASC, [fac_cd] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [FDATE]
    ON [dbo].[Echo_stfstatu]([fdate] ASC, [dr_id] ASC, [active123] ASC, [fac_cd] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [NOTDATE]
    ON [dbo].[Echo_stfstatu]([notdate] ASC, [dr_id] ASC, [active123] ASC, [fac_cd] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [NOTE_DATE]
    ON [dbo].[Echo_stfstatu]([note_date] ASC, [dr_id] ASC, [active123] ASC, [fac_cd] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [PAYDATE]
    ON [dbo].[Echo_stfstatu]([paydate] ASC, [dr_id] ASC, [active123] ASC, [fac_cd] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [REA_DATE]
    ON [dbo].[Echo_stfstatu]([rea_date] ASC, [dr_id] ASC, [active123] ASC, [fac_cd] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [REC_DATE]
    ON [dbo].[Echo_stfstatu]([rec_date] ASC, [dr_id] ASC, [active123] ASC, [fac_cd] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [RENEW_DATE]
    ON [dbo].[Echo_stfstatu]([renew_date] ASC, [dr_id] ASC, [active123] ASC, [fac_cd] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [TDATE]
    ON [dbo].[Echo_stfstatu]([tdate] ASC, [dr_id] ASC, [active123] ASC, [fac_cd] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [TERM_DATE]
    ON [dbo].[Echo_stfstatu]([term_date] ASC, [dr_id] ASC, [active123] ASC, [fac_cd] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [UDF1_DT]
    ON [dbo].[Echo_stfstatu]([udf1_dt] ASC, [dr_id] ASC, [active123] ASC, [fac_cd] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [UDF2_DT]
    ON [dbo].[Echo_stfstatu]([udf2_dt] ASC, [dr_id] ASC, [active123] ASC, [fac_cd] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [UDF3_DT]
    ON [dbo].[Echo_stfstatu]([udf3_dt] ASC, [dr_id] ASC, [active123] ASC, [fac_cd] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [UDF4_DT]
    ON [dbo].[Echo_stfstatu]([udf4_dt] ASC, [dr_id] ASC, [active123] ASC, [fac_cd] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [UDF5_DT]
    ON [dbo].[Echo_stfstatu]([udf5_dt] ASC, [dr_id] ASC, [active123] ASC, [fac_cd] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [UDF6_DT]
    ON [dbo].[Echo_stfstatu]([udf6_dt] ASC, [dr_id] ASC, [active123] ASC, [fac_cd] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [UDF7_DT]
    ON [dbo].[Echo_stfstatu]([udf7_dt] ASC, [dr_id] ASC, [active123] ASC, [fac_cd] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [UDF8_DT]
    ON [dbo].[Echo_stfstatu]([udf8_dt] ASC, [dr_id] ASC, [active123] ASC, [fac_cd] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [stfstatu_drid]
    ON [dbo].[Echo_stfstatu]([dr_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [facility]
    ON [dbo].[Echo_stfstatu]([fac_cd] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [rec_arr]
    ON [dbo].[Echo_stfstatu]([active123] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [secfile]
    ON [dbo].[Echo_stfstatu]([sec_cd] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [pos_tab]
    ON [dbo].[Echo_stfstatu]([pos_cd] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sta_tab]
    ON [dbo].[Echo_stfstatu]([staff_cd] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [fac_udfs1]
    ON [dbo].[Echo_stfstatu]([udf1] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [fac_udfs2]
    ON [dbo].[Echo_stfstatu]([udf2] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [fac_udfs3]
    ON [dbo].[Echo_stfstatu]([udf3] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [fac_udfs4]
    ON [dbo].[Echo_stfstatu]([udf4] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [fac_udf1]
    ON [dbo].[Echo_stfstatu]([udf5] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [fac_udf2]
    ON [dbo].[Echo_stfstatu]([udf6] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [facgudf1]
    ON [dbo].[Echo_stfstatu]([udf7] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [facgudf2]
    ON [dbo].[Echo_stfstatu]([udf8] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [tic_tab]
    ON [dbo].[Echo_stfstatu]([tre] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [tic_tab0]
    ON [dbo].[Echo_stfstatu]([tdu] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [rec_arr_fac_link]
    ON [dbo].[Echo_stfstatu]([fac_cd] ASC, [active123] ASC, [link] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [termcode]
    ON [dbo].[Echo_stfstatu]([term_code] ASC) WITH (FILLFACTOR = 90);


GO
CREATE TRIGGER T_I_U_STFSTATU ON [dbo].[Echo_stfstatu] 
 FOR INSERT, UPDATE
 AS
 BEGIN
  DECLARE
    @row_count INT,
    @error_number    INT,
    @error_message VARCHAR(255),
    @id char(12),
    @fac char(4),
    @facility varchar(40),
    @link INT
  SELECT @row_count = @@rowcount
    IF @row_count = 0
      RETURN
    IF UPDATE(dr_no_ext) OR UPDATE(fac_cd)
      BEGIN
        Declare ids Cursor for 
          Select dr_no_ext, fac_cd, link From inserted
        Open ids
        Fetch Next From ids Into @id, @fac, @link
        WHILE @@FETCH_STATUS = 0
        Begin
        IF  (
              SELECT COUNT(*)
              FROM STFSTATU t, inserted i
              WHERE t.dr_no_ext = @id AND t.fac_cd = @fac  AND @id > '' AND t.link <> @link
             )
              !=0
        BEGIN
             Select @facility=rtrim(full_name) from  facility  where fac_cd=@fac
             SELECT @error_number=50006,
                     @error_message = 'The ID Number ' + @id + ' is already assigned to a Provider in this ' + rtrim(@facility) + ' facility.'
             GOTO error
        END
        IF @id like '%[''"]%'
        BEGIN
                SELECT @error_number=50007,
                     @error_message = 'The ID Number ' + @id + ' is invalid.  Quotes are not allowed.'
                GoTo Error
        END
        Fetch Next From ids Into @id, @fac, @link
        End
        CLOSE ids
        DEALLOCATE ids
    END
  RETURN
  /*  Error Handling  */
  error:
        CLOSE ids
        DEALLOCATE ids
        RAISERROR @error_number @error_message
        ROLLBACK TRANSACTION
  END

GO
CREATE TRIGGER T_CVO_former_clients ON [dbo].[Echo_stfstatu] FOR UPDATE AS
BEGIN
    DECLARE
           @row_count       INT,
           @error_number    INT,
           @error_message   VARCHAR(255)
    SELECT @row_count = @@rowcount
    IF @row_count = 0
       RETURN
 If Exists ( Select 1 From SysMSL2 Where HLS_Reserved01 = 'HLS_CVO')
  Begin
     IF Exists(   select link from Inserted i Where (i.dte is not null or i.fdate is not null) and fac_cd in (select fac_cd from facility where org_type = 'F')     )
        BEGIN
        SELECT @error_number=60000, @error_message='Cannot Activate...   This Facility Has Been Inactivated.'
        GOTO error
        END
  End
RETURN
/*  Error Handling  */
error:
   RAISERROR @error_number @error_message
   ROLLBACK TRANSACTION
END

GO
/*   Trigger 'T_I_U_D_stfstatu' for Table 'stfstatu'  */
CREATE TRIGGER T_I_U_D_stfstatu ON [dbo].[Echo_stfstatu] FOR insert, update, delete AS
BEGIN
    DECLARE
           @row_count       INT
    SELECT @row_count = @@rowcount
    IF @row_count = 0
       RETURN
SET NOCOUNT ON
/*  When inserting, updating, or deleting a row in child 'stfstatu' ,the LST_MD_DT must be updated in 'drname'.*/
IF (SELECT COUNT(*) FROM inserted) > 0
   BEGIN
    -- Insert or an Update
       UPDATE drname
           SET lst_md_dt = GETDATE()
           FROM inserted i
           WHERE drname.dr_id = i.dr_id 
   END
ELSE
   BEGIN
    -- Delete
       UPDATE drname
           SET lst_md_dt = GETDATE()
           FROM deleted d
           WHERE drname.dr_id = d.dr_id
   END
RETURN
END

GO
/*  Delete Trigger 'T_D_stfstatu' for Table 'stfstatu'  */
CREATE TRIGGER T_D_stfstatu ON [dbo].[Echo_stfstatu] FOR DELETE AS
BEGIN
    DECLARE
           @row_count       INT,
           @dr_id                CHAR(12),
           @lname              VARCHAR(60),
           @fname              VARCHAR(16),
           @dr_no_ext        CHAR(12),
           @error_number    INT,
           @error_message   VARCHAR(255)
    SELECT @row_count = @@rowcount
    IF @row_count = 0
       RETURN
    Set NoCount On
    DECLARE dr_ids CURSOR
        FOR SELECT DISTINCT deleted.dr_id
                   FROM deleted  left join drname on drname.dr_id = deleted.dr_id
                   WHERE  drname.link is  not null
/*  User can not delete the last facility record for a doctor unless the doctor is being deleted.' */
    OPEN dr_ids
    FETCH NEXT FROM dr_ids INTO @dr_id
    WHILE @@FETCH_STATUS = 0
        BEGIN
            SELECT @row_count =
                (
                 SELECT COUNT(*)
                   FROM  stfstatu
                   WHERE @dr_id = stfstatu.dr_id 
                )
            IF @row_count = 0
                BEGIN
                    SELECT @lname = dr_lname, @fname = dr_fname, @dr_no_ext = dr_no_ext
                       FROM drname
                       WHERE dr_id = @dr_id
                     SET @error_number =  50002
                     SET @error_message= 'This deletion would have resulted in the last facility record being deleted for '
                                                           + RTRIM(@fname) + ' ' + RTRIM(@lname) + ' ID = ' + @dr_no_ext
                     BREAK
                 END
             FETCH NEXT FROM dr_ids INTO @dr_id
         END
    CLOSE dr_ids
    DEALLOCATE dr_ids
     IF @row_count = 0
          GOTO error
RETURN
/*  Error Handling  */
error:
      RAISERROR @error_number @error_message
      ROLLBACK TRANSACTION
END

GO
/*  Insert Trigger 'T_I_stfstatu' for Table 'stfstatu'  */
CREATE TRIGGER T_I_stfstatu ON [dbo].[Echo_stfstatu] FOR INSERT AS
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
/*  When inserting a row in child 'stfstatu' ,the Foreign Key must be Null or exist in Parent 'drname' */
IF UPDATE(dr_id)
   BEGIN
        SELECT @null_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE dr_id is null
              )
        IF @null_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   drname p, inserted i
               WHERE  p.dr_id = i.dr_id
              )
               != @row_count - @null_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "stfstatu" as its Foreign Key does not exist in "drname".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'stfstatu' ,the Foreign Key must be Null or exist in Parent 'facility' */
IF UPDATE(fac_cd)
   BEGIN
        SELECT @null_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE fac_cd is null
              )
        IF @null_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   facility p, inserted i
               WHERE  p.fac_cd = i.fac_cd
              )
               != @row_count - @null_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "stfstatu" as its Foreign Key does not exist in "facility".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'stfstatu' ,the Foreign Key must be Null or exist in Parent 'rec_arr' */
IF UPDATE(active123)
   BEGIN
        SELECT @null_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE active123 is null
              )
        IF @null_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   rec_arr p, inserted i
               WHERE  p.cd = i.active123
              )
               != @row_count - @null_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "stfstatu" as its Foreign Key does not exist in "rec_arr".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'stfstatu' ,the Foreign Key must be Blank or exist in Parent 'secfile' */
IF UPDATE(sec_cd)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE sec_cd = ''
              )
/* If the department is blank then the section number should be 0.  */
        If @blank_row_count > 0
            Update stfstatu Set secnum = 0
            From Inserted i
            Where i.sec_cd = '' and stfstatu.link = i.link
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   secfile p, inserted i
               WHERE  p.sec_cd = i.sec_cd
              )
               != @row_count - @blank_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "stfstatu" as its Foreign Key does not exist in "secfile".'
                   GOTO error
              END
   END
/*  If SecNum is inserted the Department cannot be blank..  */
 If Update(secnum)
  Begin
    If Exists (
      Select 1
      From Inserted
      Where secnum > 0 and sec_cd = '')
       Begin
           Select @error_number = 30002,
                      @error_message = 'There is a Section  with a blank Department code.  The record cannot be inserted.'
           GoTo error
       End
/*  If SecNum is inserted it cannot point to a blank section.  */
    If Exists (
      Select 1
         From inserted i join secfile p on  i.sec_cd = p.sec_cd
         Where secnum <> 0 and 
            Case secnum
               When 1 Then p.s01
               When 2 Then p.s02
               When 3 Then p.s03
               When 4 Then p.s04
               When 5 Then p.s05
               When 6 Then p.s06
               When 7 Then p.s07
               When 8 Then p.s08
               When 9 Then p.s09
               When 10 Then p.s10
               When 11 Then p.s11
               When 12 Then p.s12
               When 13 Then p.s13
               When 14 Then p.s14
               When 15 Then p.s15
               When 16 Then p.s16
               When 17 Then p.s17
               When 18 Then p.s18
               When 19 Then p.s19
               When 20 Then p.s20
               When 21 Then p.s21
               When 22 Then p.s22
               When 23 Then p.s23
               When 24 Then p.s24
               When 25 Then p.s25
               When 26 Then p.s26
               When 27 Then p.s27
               When 28 Then p.s28
               When 29 Then p.s29
               When 30 Then p.s30
            End = '')
       Begin
           Select @error_number = 30002,
                      @error_message = 'There is an invalid section.  The record cannot be inserted.'
           GoTo error
       End
  End
/*  When inserting a row in child 'stfstatu' ,the Foreign Key must be Blank or exist in Parent 'pos_tab' */
IF UPDATE(pos_cd)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE pos_cd = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   pos_tab p, inserted i
               WHERE  p.cd = i.pos_cd
              )
               != @row_count - @blank_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "stfstatu" as its Foreign Key does not exist in "pos_tab".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'stfstatu' ,the Foreign Key must be Blank or exist in Parent 'sta_tab' */
IF UPDATE(staff_cd)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE staff_cd = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   sta_tab p, inserted i
               WHERE  p.cd = i.staff_cd
              )
               != @row_count - @blank_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "stfstatu" as its Foreign Key does not exist in "sta_tab".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'stfstatu' ,the Foreign Key must be Blank or exist in Parent 'fac_udfs1' */
IF UPDATE(udf1)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE udf1 = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   fac_udfs1 p, inserted i
               WHERE  p.cd = i.udf1
               AND p.fac_cd = i.Fac_cd
              )
               != @row_count - @blank_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "stfstatu" as its Code + Facility does not exist in "fac_udfs1".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'stfstatu' ,the Foreign Key must be Blank or exist in Parent 'fac_udfs2' */
IF UPDATE(udf2)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE udf2 = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   fac_udfs2 p, inserted i
               WHERE  p.cd = i.udf2
               AND p.fac_cd = i.Fac_cd
              )
               != @row_count - @blank_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "stfstatu" as its Code + Facility does not exist in "fac_udfs2".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'stfstatu' ,the Foreign Key must be Blank or exist in Parent 'fac_udfs3' */
IF UPDATE(udf3)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE udf3 = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   fac_udfs3 p, inserted i
               WHERE  p.cd = i.udf3
               AND p.fac_cd = i.Fac_cd
              )
               != @row_count - @blank_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "stfstatu" as its Code + Facility does not exist in "fac_udfs3".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'stfstatu' ,the Foreign Key must be Blank or exist in Parent 'fac_udfs4' */
IF UPDATE(udf4)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE udf4 = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   fac_udfs4 p, inserted i
               WHERE  p.cd = i.udf4
               AND p.fac_cd = i.Fac_cd
              )
               != @row_count - @blank_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "stfstatu" as its Code + Facility does not exist in "fac_udfs4".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'stfstatu' ,the Foreign Key must be Blank or exist in Parent 'fac_udf1' */
IF UPDATE(udf5)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE udf5 = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   fac_udf1 p, inserted i
               WHERE  p.cd = i.udf5
              )
               != @row_count - @blank_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "stfstatu" as its Foreign Key does not exist in "fac_udf1".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'stfstatu' ,the Foreign Key must be Blank or exist in Parent 'fac_udf2' */
IF UPDATE(udf6)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE udf6 = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   fac_udf2 p, inserted i
               WHERE  p.cd = i.udf6
              )
               != @row_count - @blank_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "stfstatu" as its Foreign Key does not exist in "fac_udf2".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'stfstatu' ,the Foreign Key must be Blank or exist in Parent 'facgudf1' */
IF UPDATE(udf7)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE udf7 = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   facgudf1 p, inserted i
               WHERE  p.cd = i.udf7
              )
               != @row_count - @blank_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "stfstatu" as its Foreign Key does not exist in "facgudf1".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'stfstatu' ,the Foreign Key must be Blank or exist in Parent 'facgudf2' */
IF UPDATE(udf8)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE udf8 = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   facgudf2 p, inserted i
               WHERE  p.cd = i.udf8
              )
               != @row_count - @blank_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "stfstatu" as its Foreign Key does not exist in "facgudf2".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'stfstatu' ,the Foreign Key must be Blank or exist in Parent 'tic_tab' */
IF UPDATE(tre)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE tre = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   tic_tab p, inserted i
               WHERE  p.cd = i.tre
              )
               != @row_count - @blank_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "stfstatu" as its Foreign Key does not exist in "tic_tab".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'stfstatu' ,the Foreign Key must be Blank or exist in Parent 'tic_tab' */
IF UPDATE(tdu)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE tdu = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   tic_tab p, inserted i
               WHERE  p.cd = i.tdu
              )
               != @row_count - @blank_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "stfstatu" as its Foreign Key does not exist in "tic_tab".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'stfstatu' ,the Foreign Key must be Blank or exist in Parent 'termcode' */
IF UPDATE(term_code)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE term_code = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   termcode p, inserted i
               WHERE  p.cd = i.term_code
              )
               != @row_count - @blank_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "stfstatu" as its Foreign Key does not exist in "termcode".'
                   GOTO error
              END
   END
RETURN
/*  Error Handling  */
error:
      RAISERROR @error_number @error_message
      ROLLBACK TRANSACTION
END

GO
/*  Update Trigger 'T_U_stfstatu' for Table 'stfstatu'  */
CREATE TRIGGER T_U_stfstatu ON [dbo].[Echo_stfstatu] FOR UPDATE AS
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
/*  When updating a row in child 'stfstatu' ,the Foreign Key must be Null or exist in Parent 'drname'  */
IF UPDATE(dr_id)
   BEGIN
        SELECT @null_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  dr_id is null
              )
        IF @null_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   drname p, inserted i
               WHERE  p.dr_id = i.dr_id
              )
              != @row_count - @null_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "stfstatu" as its Foreign Key does not exist in "drname".'
                   GOTO error
              END
   END
/*  When updating a row in child 'stfstatu' ,the Foreign Key must be Null or exist in Parent 'facility'  */
IF UPDATE(fac_cd)
   BEGIN
        SELECT @null_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  fac_cd is null
              )
        IF @null_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   facility p, inserted i
               WHERE  p.fac_cd = i.fac_cd
              )
              != @row_count - @null_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "stfstatu" as its Foreign Key does not exist in "facility".'
                   GOTO error
              END
   END
/*  When updating a row in child 'stfstatu' ,the Foreign Key must be Null or exist in Parent 'rec_arr'  */
IF UPDATE(active123)
   BEGIN
        SELECT @null_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  active123 is null
              )
        IF @null_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   rec_arr p, inserted i
               WHERE  p.cd = i.active123
              )
              != @row_count - @null_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "stfstatu" as its Foreign Key does not exist in "rec_arr".'
                   GOTO error
              END
   END
/*  When updating a row in child 'stfstatu' ,the Foreign Key must be Blank or exist in Parent 'secfile'  */
IF UPDATE(sec_cd)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  sec_cd = ''
              )
/* If the department is blank then the section number should be 0.  */
        If @blank_row_count > 0
            Update stfstatu Set secnum = 0
            From Inserted i
            Where i.sec_cd = '' and stfstatu.link = i.link
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   secfile p, inserted i
               WHERE  p.sec_cd = i.sec_cd
              )
              != @row_count - @blank_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "stfstatu".'
                   GOTO error
              END
   END
/*  If SecNum is updated the department cannot be blank.  */
 If Update(secnum)
  Begin
    If Exists (
      Select 1
      From Inserted
      Where secnum > 0 and sec_cd = ''
                 )
       Begin
           Select @error_number = 30002,
                      @error_message = 'There is a Section  with a blank Department code.  The record cannot be updated.'
           GoTo error
       End
/*  If SecNum is updated it cannot point to a blank section..  */
    If Exists (
      Select 1
      From
        inserted i Join secfile p
        On i.sec_cd = p.sec_cd
      Where secnum <> 0 and 
            Case secnum
               When 1 Then p.s01
               When 2 Then p.s02
               When 3 Then p.s03
               When 4 Then p.s04
               When 5 Then p.s05
               When 6 Then p.s06
               When 7 Then p.s07
               When 8 Then p.s08
               When 9 Then p.s09
               When 10 Then p.s10
               When 11 Then p.s11
               When 12 Then p.s12
               When 13 Then p.s13
               When 14 Then p.s14
               When 15 Then p.s15
               When 16 Then p.s16
               When 17 Then p.s17
               When 18 Then p.s18
               When 19 Then p.s19
               When 20 Then p.s20
               When 21 Then p.s21
               When 22 Then p.s22
               When 23 Then p.s23
               When 24 Then p.s24
               When 25 Then p.s25
               When 26 Then p.s26
               When 27 Then p.s27
               When 28 Then p.s28
               When 29 Then p.s29
               When 30 Then p.s30
               Else ''
            End = ''
                    )
       Begin
           Select @error_number = 30002,
                      @error_message = 'There is an invalid section.  The record cannot be updated.'
           GoTo error
       End
  End
/*  When updating a row in child 'stfstatu' ,the Foreign Key must be Blank or exist in Parent 'pos_tab'  */
IF UPDATE(pos_cd)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  pos_cd = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   pos_tab p, inserted i
               WHERE  p.cd = i.pos_cd
              )
              != @row_count - @blank_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "stfstatu" as its Foreign Key does not exist in "pos_tab".'
                   GOTO error
              END
   END
/*  When updating a row in child 'stfstatu' ,the Foreign Key must be Blank or exist in Parent 'sta_tab'  */
IF UPDATE(staff_cd)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  staff_cd = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   sta_tab p, inserted i
               WHERE  p.cd = i.staff_cd
              )
              != @row_count - @blank_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "stfstatu" as its Foreign Key does not exist in "sta_tab".'
                   GOTO error
              END
   END
/*  When updating a row in child 'stfstatu' ,the Foreign Key must be Blank or exist in Parent 'fac_udfs1'  */
IF UPDATE(udf1)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  udf1 = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   fac_udfs1 p, inserted i
               WHERE  p.cd = i.udf1
               AND p.fac_cd = i.fac_cd
              )
              != @row_count - @blank_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "stfstatu".  The Code +  Facility are not in "fac_udfs1".'
                   GOTO error
              END
   END
/*  When updating a row in child 'stfstatu' ,the Foreign Key must be Blank or exist in Parent 'fac_udfs2'  */
IF UPDATE(udf2)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  udf2 = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   fac_udfs2 p, inserted i
               WHERE  p.cd = i.udf2
               AND p.fac_cd = i.fac_cd
              )
              != @row_count - @blank_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "stfstatu".  The Code +  Facility are not in "fac_udfs2".'
                   GOTO error
              END
   END
/*  When updating a row in child 'stfstatu' ,the Foreign Key must be Blank or exist in Parent 'fac_udfs3'  */
IF UPDATE(udf3)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  udf3 = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   fac_udfs3 p, inserted i
               WHERE  p.cd = i.udf3
               AND p.fac_cd = i.fac_cd
              )
              != @row_count - @blank_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "stfstatu".  The Code +  Facility are not in "fac_udfs3".'
                   GOTO error
              END
   END
/*  When updating a row in child 'stfstatu' ,the Foreign Key must be Blank or exist in Parent 'fac_udfs4'  */
IF UPDATE(udf4)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  udf4 = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   fac_udfs4 p, inserted i
               WHERE  p.cd = i.udf4
               AND p.fac_cd = i.fac_cd
              )
              != @row_count - @blank_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "stfstatu".  The Code +  Facility are not in "fac_udfs4".'
                   GOTO error
              END
   END
/*  When updating a row in child 'stfstatu' ,the Foreign Key must be Blank or exist in Parent 'fac_udf1'  */
IF UPDATE(udf5)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  udf5 = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   fac_udf1 p, inserted i
               WHERE  p.cd = i.udf5
              )
              != @row_count - @blank_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "stfstatu" as its Foreign Key does not exist in "fac_udf1".'
                   GOTO error
              END
   END
/*  When updating a row in child 'stfstatu' ,the Foreign Key must be Blank or exist in Parent 'fac_udf2'  */
IF UPDATE(udf6)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  udf6 = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   fac_udf2 p, inserted i
               WHERE  p.cd = i.udf6
              )
              != @row_count - @blank_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "stfstatu" as its Foreign Key does not exist in "fac_udf2".'
                   GOTO error
              END
   END
/*  When updating a row in child 'stfstatu' ,the Foreign Key must be Blank or exist in Parent 'facgudf1'  */
IF UPDATE(udf7)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  udf7 = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   facgudf1 p, inserted i
               WHERE  p.cd = i.udf7
              )
              != @row_count - @blank_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "stfstatu" as its Foreign Key does not exist in "facgudf1".'
                   GOTO error
              END
   END
/*  When updating a row in child 'stfstatu' ,the Foreign Key must be Blank or exist in Parent 'facgudf2'  */
IF UPDATE(udf8)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  udf8 = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   facgudf2 p, inserted i
               WHERE  p.cd = i.udf8
              )
              != @row_count - @blank_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "stfstatu" as its Foreign Key does not exist in "facgudf2".'
                   GOTO error
              END
   END
/*  When updating a row in child 'stfstatu' ,the Foreign Key must be Blank or exist in Parent 'tic_tab'  */
IF UPDATE(tre)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  tre = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   tic_tab p, inserted i
               WHERE  p.cd = i.tre
              )
              != @row_count - @blank_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "stfstatu" as its Foreign Key does not exist in "tic_tab".'
                   GOTO error
              END
   END
/*  When updating a row in child 'stfstatu' ,the Foreign Key must be Blank or exist in Parent 'tic_tab'  */
IF UPDATE(tdu)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  tdu = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   tic_tab p, inserted i
               WHERE  p.cd = i.tdu
              )
              != @row_count - @blank_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "stfstatu" as its Foreign Key does not exist in "tic_tab".'
                   GOTO error
              END
   END
/*  When updating a row in child 'stfstatu' ,the Foreign Key must be Blank or exist in Parent 'termcode'  */
IF UPDATE(term_code)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  term_code = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   termcode p, inserted i
               WHERE  p.cd = i.term_code
              )
              != @row_count - @blank_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "stfstatu" as its Foreign Key does not exist in "termcode".'
                   GOTO error
              END
   END
RETURN
/*  Error Handling  */
error:
      RAISERROR @error_number @error_message
      ROLLBACK TRANSACTION
END

GO
CREATE TRIGGER T_CVO_checks ON [dbo].[Echo_stfstatu] FOR UPDATE AS
BEGIN
    DECLARE
           @row_count       INT,
           @error_number    INT,
           @error_message   VARCHAR(255)
    SELECT @row_count = @@rowcount
    IF @row_count = 0
       RETURN
If Exists ( Select 1 From SysMSL2 Where HLS_Reserved01 = 'HLS_CVO')
  Begin
/*   PRH  */
IF UPDATE(complete_d)
     BEGIN
     IF Exists(   select link from Inserted i Where i.udf7= ' ' and i.a_or_r in ('A','R','O','C') and i.complete_d is not null   )
        BEGIN
        SELECT @error_number=60000, @error_message='You must enter your initials.'
        GOTO error
        END
     IF Exists(   select link from Inserted i Where  i.a_or_r in ('A','R','O') and i.dr_id not in (select dr_id from applet where dr_id = i.dr_id and file_kind like 'QP%' and fac_cd = i.fac_cd and recv_date >getdate()-120)  and i.fac_cd in (select fac_cd from facility where facgudfc1 > ' ')    )
        BEGIN
        SELECT @error_number=60000, @error_message='There is no NPDB verification!!!'
        GOTO error
        END
    END
IF UPDATE(rea_date) or UPDATE(rec_date) or UPDATE(fdate)
     BEGIN
     IF Exists(   select link from Inserted i Where i.a_or_r=' ' )
        BEGIN
        SELECT @error_number=60000, @error_message='You must enter an ARO value.'
        GOTO error
        END
    END
End
/*   PRH  */ 
RETURN
/*  Error Handling  */
error:
      RAISERROR @error_number @error_message
      ROLLBACK TRANSACTION
END
