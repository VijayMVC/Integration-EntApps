CREATE TABLE [dbo].[Echo_Credent] (
    [dr_id]      CHAR (12)  NOT NULL,
    [cd]         CHAR (6)   CONSTRAINT [DF__TEMP_credent__cd__5972E26A] DEFAULT ('') NOT NULL,
    [sch_type]   CHAR (5)   NOT NULL,
    [lic_num]    CHAR (20)  CONSTRAINT [DF__TEMP_cred__lic_n__5A6706A3] DEFAULT ('') NOT NULL,
    [lic_date]   DATETIME   NULL,
    [lic1]       CHAR (40)  CONSTRAINT [DF__TEMP_crede__lic1__5B5B2ADC] DEFAULT ('') NOT NULL,
    [tickerdate] DATETIME   NULL,
    [renew]      CHAR (1)   CONSTRAINT [DF__TEMP_cred__renew__5C4F4F15] DEFAULT ('') NOT NULL,
    [issue_dt]   DATETIME   NULL,
    [last_dt]    DATETIME   NULL,
    [lic_udf1]   CHAR (5)   CONSTRAINT [DF__TEMP_cred__lic_u__5D43734E] DEFAULT ('') NOT NULL,
    [lic2]       CHAR (40)  CONSTRAINT [DF__TEMP_crede__lic2__5E379787] DEFAULT ('') NOT NULL,
    [pict1]      CHAR (100) CONSTRAINT [DF__TEMP_cred__pict1__5F2BBBC0] DEFAULT ('') NOT NULL,
    [lap]        CHAR (12)  CONSTRAINT [DF__TEMP_creden__lap__601FDFF9] DEFAULT ('') NOT NULL,
    [link]       INT        IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_credent] PRIMARY KEY NONCLUSTERED ([link] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [ISSUE_DT]
    ON [dbo].[Echo_Credent]([issue_dt] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [LAST_DT]
    ON [dbo].[Echo_Credent]([last_dt] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [LIC_DATE]
    ON [dbo].[Echo_Credent]([lic_date] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [lic_num]
    ON [dbo].[Echo_Credent]([lic_num] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [link]
    ON [dbo].[Echo_Credent]([link] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [TICKERDATE]
    ON [dbo].[Echo_Credent]([tickerdate] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [statelic]
    ON [dbo].[Echo_Credent]([cd] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [lic_arr]
    ON [dbo].[Echo_Credent]([sch_type] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [lic_udf]
    ON [dbo].[Echo_Credent]([lic_udf1] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [tic_tab]
    ON [dbo].[Echo_Credent]([renew] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [drname]
    ON [dbo].[Echo_Credent]([dr_id] ASC) WITH (FILLFACTOR = 90);


GO
/*  Insert Trigger 'T_I_U_D_credent' for Table 'credent'  */
CREATE TRIGGER T_I_U_D_credent ON [dbo].[Echo_Credent] FOR insert, update, delete AS
BEGIN
    DECLARE
           @row_count       INT
    SELECT @row_count = @@rowcount
    IF @row_count = 0
       RETURN
SET NOCOUNT ON
/*  When inserting, updating, or deleting a row in child 'credent' ,the LST_MD_DT must be updated in 'drname'.*/
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
/*  Update Trigger 'T_U_credent' for Table 'credent'  */
CREATE TRIGGER T_U_credent ON [dbo].[Echo_Credent] FOR UPDATE AS
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
/*  When updating a row in child 'credent' ,the Foreign Key must be Blank or exist in Parent 'statelic'  */
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
               FROM   statelic p, inserted i
               WHERE  p.cd = i.cd
              )
              != @row_count - @blank_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "credent" as its Foreign Key does not exist in "statelic".'
                   GOTO error
              END
   END
/*  When updating a row in child 'credent' ,the Foreign Key must be Null or exist in Parent 'lic_arr'  */
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
               FROM   lic_arr p, inserted i
               WHERE  p.cd = i.sch_type
              )
              != @row_count - @null_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "credent" as its Foreign Key does not exist in "lic_arr".'
                   GOTO error
              END
   END
/*  When updating a row in child 'credent' ,the Foreign Key must be Blank or exist in Parent 'lic_udf'  */
IF UPDATE(lic_udf1)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  lic_udf1 = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   lic_udf p, inserted i
               WHERE  p.cd = i.lic_udf1
              )
              != @row_count - @blank_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "credent" as its Foreign Key does not exist in "lic_udf".'
                   GOTO error
              END
   END
/*  When updating a row in child 'credent' ,the Foreign Key must be Blank or exist in Parent 'tic_tab'  */
IF UPDATE(renew)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  renew = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   tic_tab p, inserted i
               WHERE  p.cd = i.renew
              )
              != @row_count - @blank_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "credent" as its Foreign Key does not exist in "tic_tab".'
                   GOTO error
              END
   END
/*  When updating a row in child 'credent' ,the Foreign Key must be Null or exist in Parent 'drname'  */
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
                          @error_message='Cannot update child in "credent" as its Foreign Key does not exist in "drname".'
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
CREATE TRIGGER T_D_credent ON [dbo].[Echo_Credent] FOR delete AS
BEGIN
    DECLARE
           @row_count       INT
    SELECT @row_count = @@rowcount
    IF @row_count = 0
       RETURN
  SET NOCOUNT ON
/*  When Deleting a row in 'credent', set the Foreign Key to Null for all its children in 'ticlet'  */
UPDATE ticlet
SET    l_file_dbf = NULL
FROM   ticlet c, deleted d
WHERE  c.l_file_dbf = d.link
AND c.file_dbf = 'CREDENT'
/*  When Deleting a row in 'credent', set the Foreign Key to Null for all its children in 'applet'  */
UPDATE applet
SET    l_file_dbf = NULL
FROM   applet c, deleted d
WHERE  c.l_file_dbf = d.link
AND c.file_dbf = 'CREDENT'
END

GO
/*  Insert Trigger 'T_I_credent' for Table 'credent'  */
CREATE TRIGGER T_I_credent ON [dbo].[Echo_Credent] FOR INSERT AS
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
/*  When inserting a row in child 'credent' ,the Foreign Key must be Blank or exist in Parent 'statelic' */
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
               FROM   statelic p, inserted i
               WHERE  p.cd = i.cd
              )
               != @row_count - @blank_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "credent" as its Foreign Key does not exist in "statelic".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'credent' ,the Foreign Key must be Null or exist in Parent 'lic_arr' */
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
               FROM   lic_arr p, inserted i
               WHERE  p.cd = i.sch_type
              )
               != @row_count - @null_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "credent" as its Foreign Key does not exist in "lic_arr".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'credent' ,the Foreign Key must be Blank or exist in Parent 'lic_udf' */
IF UPDATE(lic_udf1)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE lic_udf1 = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   lic_udf p, inserted i
               WHERE  p.cd = i.lic_udf1
              )
               != @row_count - @blank_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "credent" as its Foreign Key does not exist in "lic_udf".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'credent' ,the Foreign Key must be Blank or exist in Parent 'tic_tab' */
IF UPDATE(renew)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE renew = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   tic_tab p, inserted i
               WHERE  p.cd = i.renew
              )
               != @row_count - @blank_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "credent" as its Foreign Key does not exist in "tic_tab".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'credent' ,the Foreign Key must be Null or exist in Parent 'drname' */
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
                          @error_message='Cannot insert child in "credent" as its Foreign Key does not exist in "drname".'
                   GOTO error
              END
   END
RETURN
/*  Error Handling  */
error:
      RAISERROR @error_number @error_message
      ROLLBACK TRANSACTION
END
