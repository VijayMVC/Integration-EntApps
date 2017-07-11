CREATE TABLE [dbo].[Echo_educate] (
    [dr_id]      CHAR (12)  NOT NULL,
    [sch_type]   CHAR (5)   NOT NULL,
    [cd]         CHAR (6)   CONSTRAINT [DF__TEMP_educate__cd__5CD95EFA] DEFAULT ('') NOT NULL,
    [fdate]      DATETIME   NULL,
    [tdate]      DATETIME   NULL,
    [cmt1]       CHAR (40)  CONSTRAINT [DF__TEMP_educa__cmt1__5DCD8333] DEFAULT ('') NOT NULL,
    [degree]     CHAR (7)   CONSTRAINT [DF__TEMP_educ__degre__5EC1A76C] DEFAULT ('') NOT NULL,
    [lap]        CHAR (12)  CONSTRAINT [DF__TEMP_educat__lap__5FB5CBA5] DEFAULT ('') NOT NULL,
    [dir_first]  CHAR (15)  CONSTRAINT [DF__TEMP_educ__dir_f__60A9EFDE] DEFAULT ('') NOT NULL,
    [dir_last]   CHAR (20)  CONSTRAINT [DF__TEMP_educ__dir_l__619E1417] DEFAULT ('') NOT NULL,
    [dir_title]  CHAR (7)   CONSTRAINT [DF__TEMP_educ__dir_t__62923850] DEFAULT ('') NOT NULL,
    [dir_suffix] CHAR (3)   CONSTRAINT [DF__TEMP_educ__dir_s__63865C89] DEFAULT ('') NOT NULL,
    [pict1]      CHAR (100) CONSTRAINT [DF__TEMP_educ__pict1__647A80C2] DEFAULT ('') NOT NULL,
    [link]       INT        IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_educate] PRIMARY KEY NONCLUSTERED ([link] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [FDATE]
    ON [dbo].[Echo_educate]([fdate] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [link]
    ON [dbo].[Echo_educate]([link] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [TDATE]
    ON [dbo].[Echo_educate]([tdate] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [drname]
    ON [dbo].[Echo_educate]([dr_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [educ_arr]
    ON [dbo].[Echo_educate]([sch_type] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [educ_tab]
    ON [dbo].[Echo_educate]([degree] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [school]
    ON [dbo].[Echo_educate]([cd] ASC) WITH (FILLFACTOR = 90);


GO
/*  Insert Trigger 'T_I_U_D_educate' for Table 'educate'  */
CREATE TRIGGER T_I_U_D_educate ON [dbo].[Echo_educate] FOR insert, update, delete AS
BEGIN
    DECLARE
           @row_count       INT
    SELECT @row_count = @@rowcount
    IF @row_count = 0
       RETURN
SET NOCOUNT ON
/*  When inserting, updating, or deleting a row in child 'educate' ,the LST_MD_DT must be updated in 'drname'.*/
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
/*  Update Trigger 'T_U_educate' for Table 'educate'  */
CREATE TRIGGER T_U_educate ON [dbo].[Echo_educate] FOR UPDATE AS
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
/*  When updating a row in child 'educate' ,the Foreign Key must be Null or exist in Parent 'drname'  */
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
                          @error_message='Cannot update child in "educate" as its Foreign Key does not exist in "drname".'
                   GOTO error
              END
   END
/*  When updating a row in child 'educate' ,the Foreign Key must be Null or exist in Parent 'educ_arr'  */
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
               FROM   educ_arr p, inserted i
               WHERE  p.cd = i.sch_type
              )
              != @row_count - @null_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "educate" as its Foreign Key does not exist in "educ_arr".'
                   GOTO error
              END
   END
/*  When updating a row in child 'educate' ,the Foreign Key must be Blank or exist in Parent 'educ_tab'  */
IF UPDATE(degree)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  degree = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   educ_tab p, inserted i
               WHERE  p.cd = i.degree
              )
              != @row_count - @blank_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "educate" as its Foreign Key does not exist in "educ_tab".'
                   GOTO error
              END
   END
/*  When updating a row in child 'educate' ,the Foreign Key must be Blank or exist in Parent 'school'  */
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
               FROM   school p, inserted i
               WHERE  p.cd = i.cd
              )
              != @row_count - @blank_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "educate" as its Foreign Key does not exist in "school".'
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
CREATE TRIGGER T_D_educate ON [dbo].[Echo_educate] FOR delete AS
BEGIN
    DECLARE
           @row_count       INT
    SELECT @row_count = @@rowcount
    IF @row_count = 0
       RETURN
  SET NOCOUNT ON
/*  When Deleting a row in 'educate', set the Foreign Key to Null for all its children in 'ticlet'  */
UPDATE ticlet
SET    l_file_dbf = NULL
FROM   ticlet c, deleted d
WHERE  c.l_file_dbf = d.link
AND c.file_dbf = 'EDUCATE'
/*  When Deleting a row in 'educate', set the Foreign Key to Null for all its children in 'applet'  */
UPDATE applet
SET    l_file_dbf = NULL
FROM   applet c, deleted d
WHERE  c.l_file_dbf = d.link
AND c.file_dbf = 'educate'
END

GO
/*  Insert Trigger 'T_I_educate' for Table 'educate'  */
CREATE TRIGGER T_I_educate ON [dbo].[Echo_educate] FOR INSERT AS
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
/*  When inserting a row in child 'educate' ,the Foreign Key must be Null or exist in Parent 'drname' */
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
                          @error_message='Cannot insert child in "educate" as its Foreign Key does not exist in "drname".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'educate' ,the Foreign Key must be Null or exist in Parent 'educ_arr' */
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
               FROM   educ_arr p, inserted i
               WHERE  p.cd = i.sch_type
              )
               != @row_count - @null_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "educate" as its Foreign Key does not exist in "educ_arr".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'educate' ,the Foreign Key must be Blank or exist in Parent 'educ_tab' */
IF UPDATE(degree)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE degree = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   educ_tab p, inserted i
               WHERE  p.cd = i.degree
              )
               != @row_count - @blank_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "educate" as its Foreign Key does not exist in "educ_tab".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'educate' ,the Foreign Key must be Blank or exist in Parent 'school' */
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
               FROM   school p, inserted i
               WHERE  p.cd = i.cd
              )
               != @row_count - @blank_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "educate" as its Foreign Key does not exist in "school".'
                   GOTO error
              END
   END
RETURN
/*  Error Handling  */
error:
      RAISERROR @error_number @error_message
      ROLLBACK TRANSACTION
END
