CREATE TABLE [dbo].[Echo_staffs] (
    [dr_id]    CHAR (12) NOT NULL,
    [staff_cd] CHAR (3)  NOT NULL,
    [dte]      DATETIME  NULL,
    [fac_cd]   CHAR (4)  NOT NULL,
    [lap]      CHAR (12) CONSTRAINT [DF__TEMP_staffs__lap__12EB56E8] DEFAULT ('') NOT NULL,
    [to_date]  DATETIME  NULL,
    [dte2]     DATETIME  NULL,
    [cmt]      CHAR (66) CONSTRAINT [DF__TEMP_staffs__cmt__13DF7B21] DEFAULT ('') NOT NULL,
    [link]     INT       IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_staffs] PRIMARY KEY NONCLUSTERED ([link] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [DTE]
    ON [dbo].[Echo_staffs]([dte] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [DTE2]
    ON [dbo].[Echo_staffs]([dte2] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [TO_DATE]
    ON [dbo].[Echo_staffs]([to_date] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [drname]
    ON [dbo].[Echo_staffs]([dr_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [facility]
    ON [dbo].[Echo_staffs]([fac_cd] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sta_tab]
    ON [dbo].[Echo_staffs]([staff_cd] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [zdte]
    ON [dbo].[Echo_staffs]([dr_id] ASC, [fac_cd] ASC, [dte] ASC, [staff_cd] ASC) WITH (FILLFACTOR = 90);


GO
/*  Insert Trigger 'T_I_U_D_staffs' for Table 'staffs'  */
CREATE TRIGGER T_I_U_D_staffs ON [dbo].[Echo_staffs] FOR insert, update, delete AS
BEGIN
    DECLARE
           @row_count       INT
    SELECT @row_count = @@rowcount
    IF @row_count = 0
       RETURN
SET NOCOUNT ON
/*  When inserting, updating, or deleting a row in child 'staffs' ,the LST_MD_DT must be updated in 'drname'.*/
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
/*  Insert Trigger 'T_I_staffs' for Table 'staffs'  */
CREATE TRIGGER T_I_staffs ON [dbo].[Echo_staffs] FOR INSERT AS
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
/*  When inserting a row in child 'staffs' ,the Foreign Key must be Null or exist in Parent 'drname' */
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
                          @error_message='Cannot insert child in "staffs" as its Foreign Key does not exist in "drname".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'staffs' ,the Foreign Key must be Null or exist in Parent 'facility' */
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
                          @error_message='Cannot insert child in "staffs" as its Foreign Key does not exist in "facility".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'staffs' ,the Foreign Key must be Null or exist in Parent 'sta_tab' */
IF UPDATE(staff_cd)
   BEGIN
        SELECT @null_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE staff_cd is null
              )
        IF @null_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   sta_tab p, inserted i
               WHERE  p.cd = i.staff_cd
              )
               != @row_count - @null_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "staffs" as its Foreign Key does not exist in "sta_tab".'
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
/*  Update Trigger 'T_U_staffs' for Table 'staffs'  */
CREATE TRIGGER T_U_staffs ON [dbo].[Echo_staffs] FOR UPDATE AS
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
/*  When updating a row in child 'staffs' ,the Foreign Key must be Null or exist in Parent 'drname'  */
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
                          @error_message='Cannot update child in "staffs" as its Foreign Key does not exist in "drname".'
                   GOTO error
              END
   END
/*  When updating a row in child 'staffs' ,the Foreign Key must be Null or exist in Parent 'facility'  */
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
                          @error_message='Cannot update child in "staffs" as its Foreign Key does not exist in "facility".'
                   GOTO error
              END
   END
/*  When updating a row in child 'staffs' ,the Foreign Key must be Null or exist in Parent 'sta_tab'  */
IF UPDATE(staff_cd)
   BEGIN
        SELECT @null_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  staff_cd is null
              )
        IF @null_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   sta_tab p, inserted i
               WHERE  p.cd = i.staff_cd
              )
              != @row_count - @null_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "staffs" as its Foreign Key does not exist in "sta_tab".'
                   GOTO error
              END
   END
RETURN
/*  Error Handling  */
error:
      RAISERROR @error_number @error_message
      ROLLBACK TRANSACTION
END
