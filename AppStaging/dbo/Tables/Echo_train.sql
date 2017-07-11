CREATE TABLE [dbo].[Echo_train] (
    [dr_id]      CHAR (12)  NOT NULL,
    [sch_type]   CHAR (5)   NOT NULL,
    [cd]         CHAR (6)   CONSTRAINT [DF__TEMP_train__cd__78B68399] DEFAULT ('') NOT NULL,
    [fdate]      DATETIME   NULL,
    [tdate]      DATETIME   NULL,
    [cmt1]       CHAR (40)  CONSTRAINT [DF__TEMP_train__cmt1__79AAA7D2] DEFAULT ('') NOT NULL,
    [position]   CHAR (3)   CONSTRAINT [DF__TEMP_trai__posit__7A9ECC0B] DEFAULT ('') NOT NULL,
    [udf1]       BIT        CONSTRAINT [DF__TEMP_train__udf1__7B92F044] DEFAULT (0) NOT NULL,
    [udf2]       BIT        CONSTRAINT [DF__TEMP_train__udf2__7C87147D] DEFAULT (0) NOT NULL,
    [udf3]       INT        CONSTRAINT [DF__TEMP_train__udf3__7D7B38B6] DEFAULT (0) NOT NULL,
    [udf4]       INT        CONSTRAINT [DF__TEMP_train__udf4__7E6F5CEF] DEFAULT (0) NOT NULL,
    [udf5]       CHAR (5)   CONSTRAINT [DF__TEMP_train__udf5__7F638128] DEFAULT ('') NOT NULL,
    [udf6]       CHAR (5)   CONSTRAINT [DF__TEMP_train__udf6__0057A561] DEFAULT ('') NOT NULL,
    [dir_first]  CHAR (15)  CONSTRAINT [DF__TEMP_trai__dir_f__014BC99A] DEFAULT ('') NOT NULL,
    [dir_last]   CHAR (20)  CONSTRAINT [DF__TEMP_trai__dir_l__023FEDD3] DEFAULT ('') NOT NULL,
    [dir_title]  CHAR (7)   CONSTRAINT [DF__TEMP_trai__dir_t__0334120C] DEFAULT ('') NOT NULL,
    [dir_suffix] CHAR (3)   CONSTRAINT [DF__TEMP_trai__dir_s__04283645] DEFAULT ('') NOT NULL,
    [lap]        CHAR (12)  CONSTRAINT [DF__TEMP_train__lap__051C5A7E] DEFAULT ('') NOT NULL,
    [pict1]      CHAR (100) CONSTRAINT [DF__TEMP_trai__pict1__06107EB7] DEFAULT ('') NOT NULL,
    [link]       INT        IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_train] PRIMARY KEY NONCLUSTERED ([link] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [FDATE]
    ON [dbo].[Echo_train]([fdate] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [link]
    ON [dbo].[Echo_train]([link] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [TDATE]
    ON [dbo].[Echo_train]([tdate] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [drname]
    ON [dbo].[Echo_train]([dr_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [apos_tab]
    ON [dbo].[Echo_train]([position] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [affi_5]
    ON [dbo].[Echo_train]([udf5] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [affi_6]
    ON [dbo].[Echo_train]([udf6] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [affi_arr]
    ON [dbo].[Echo_train]([sch_type] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [hospital]
    ON [dbo].[Echo_train]([cd] ASC) WITH (FILLFACTOR = 90);


GO
/*  Insert Trigger 'T_I_U_D_train' for Table 'train'  */
CREATE TRIGGER T_I_U_D_train ON [dbo].[Echo_train] FOR insert, update, delete AS
BEGIN
    DECLARE
           @row_count       INT
    SELECT @row_count = @@rowcount
    IF @row_count = 0
       RETURN
SET NOCOUNT ON
/*  When inserting, updating, or deleting a row in child 'train' ,the LST_MD_DT must be updated in 'drname'.*/
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
/*  Update Trigger 'T_U_train' for Table 'train'  */
CREATE TRIGGER T_U_train ON [dbo].[Echo_train] FOR UPDATE AS
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
/*  When updating a row in child 'train' ,the Foreign Key must be Null or exist in Parent 'drname'  */
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
                          @error_message='Cannot update child in "train" as its Foreign Key does not exist in "drname".'
                   GOTO error
              END
   END
/*  When updating a row in child 'train' ,the Foreign Key must be Blank or exist in Parent 'apos_tab'  */
IF UPDATE(position)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  position = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   apos_tab p, inserted i
               WHERE  p.cd = i.position
              )
              != @row_count - @blank_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "train" as its Foreign Key does not exist in "apos_tab".'
                   GOTO error
              END
   END
/*  When updating a row in child 'train' ,the Foreign Key must be Blank or exist in Parent 'affi_5'  */
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
               FROM   affi_5 p, inserted i
               WHERE  p.cd = i.udf5
              )
              != @row_count - @blank_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "train" as its Foreign Key does not exist in "affi_5".'
                   GOTO error
              END
   END
/*  When updating a row in child 'train' ,the Foreign Key must be Blank or exist in Parent 'affi_6'  */
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
               FROM   affi_6 p, inserted i
               WHERE  p.cd = i.udf6
              )
              != @row_count - @blank_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "train" as its Foreign Key does not exist in "affi_6".'
                   GOTO error
              END
   END
/*  When updating a row in child 'train' ,the Foreign Key must be Null or exist in Parent 'affi_arr'  */
IF UPDATE(sch_type)
   BEGIN
        SELECT @null_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  sch_type is null
              )
        IF @null_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   affi_arr p, inserted i
               WHERE  p.cd = i.sch_type
              )
              != @row_count - @null_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "train" as its Foreign Key does not exist in "affi_arr".'
                   GOTO error
              END
   END
/*  When updating a row in child 'train' ,the Foreign Key must be Blank or exist in Parent 'hospital'  */
IF UPDATE(cd)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  cd = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   hospital p, inserted i
               WHERE  p.cd = i.cd
              )
              != @row_count - @blank_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "train" as its Foreign Key does not exist in "hospital".'
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
CREATE TRIGGER T_D_train ON [dbo].[Echo_train] FOR delete AS
BEGIN
    DECLARE
           @row_count       INT
    SELECT @row_count = @@rowcount
    IF @row_count = 0
       RETURN
  SET NOCOUNT ON
/*  When Deleting a row in 'train', set the Foreign Key to Null for all its children in 'ticlet'  */
UPDATE ticlet
SET    l_file_dbf = NULL
FROM   ticlet c, deleted d
WHERE  c.l_file_dbf = d.link
AND c.file_dbf = 'TRAIN'
/*  When Deleting a row in 'train', set the Foreign Key to Null for all its children in 'applet'  */
UPDATE applet
SET    l_file_dbf = NULL
FROM   applet c, deleted d
WHERE  c.l_file_dbf = d.link
AND c.file_dbf = 'TRAIN'
END

GO
/*  Insert Trigger 'T_I_train' for Table 'train'  */
CREATE TRIGGER T_I_train ON [dbo].[Echo_train] FOR INSERT AS
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
/*  When inserting a row in child 'train' ,the Foreign Key must be Null or exist in Parent 'drname' */
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
                          @error_message='Cannot insert child in "train" as its Foreign Key does not exist in "drname".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'train' ,the Foreign Key must be Blank or exist in Parent 'apos_tab' */
IF UPDATE(position)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE position = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   apos_tab p, inserted i
               WHERE  p.cd = i.position
              )
               != @row_count - @blank_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "train" as its Foreign Key does not exist in "apos_tab".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'train' ,the Foreign Key must be Blank or exist in Parent 'affi_5' */
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
               FROM   affi_5 p, inserted i
               WHERE  p.cd = i.udf5
              )
               != @row_count - @blank_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "train" as its Foreign Key does not exist in "affi_5".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'train' ,the Foreign Key must be Blank or exist in Parent 'affi_6' */
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
               FROM   affi_6 p, inserted i
               WHERE  p.cd = i.udf6
              )
               != @row_count - @blank_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "train" as its Foreign Key does not exist in "affi_6".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'train' ,the Foreign Key must be Null or exist in Parent 'affi_arr' */
IF UPDATE(sch_type)
   BEGIN
        SELECT @null_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE sch_type is null
              )
        IF @null_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   affi_arr p, inserted i
               WHERE  p.cd = i.sch_type
              )
               != @row_count - @null_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "train" as its Foreign Key does not exist in "affi_arr".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'train' ,the Foreign Key must be Blank or exist in Parent 'hospital' */
IF UPDATE(cd)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE cd = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   hospital p, inserted i
               WHERE  p.cd = i.cd
              )
               != @row_count - @blank_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "train" as its Foreign Key does not exist in "hospital".'
                   GOTO error
              END
   END
RETURN
/*  Error Handling  */
error:
      RAISERROR @error_number @error_message
      ROLLBACK TRANSACTION
END
