CREATE TABLE [dbo].[Echo_lic_arr] (
    [cd]        CHAR (5)  CONSTRAINT [DF__TEMP_lic_arr__cd__62FC4CA4] DEFAULT ('') NOT NULL,
    [txt]       CHAR (25) CONSTRAINT [DF__TEMP_lic_ar__txt__63F070DD] DEFAULT ('') NOT NULL,
    [lic_udf1]  CHAR (25) CONSTRAINT [DF__TEMP_lic___lic_u__64E49516] DEFAULT ('') NOT NULL,
    [cvo_type]  CHAR (3)  CONSTRAINT [DF__TEMP_lic___cvo_t__65D8B94F] DEFAULT ('') NOT NULL,
    [link]      INT       IDENTITY (1, 1) NOT NULL,
    [lic_udf1v] CHAR (10) CONSTRAINT [DF__TEMP_lic___lic_u__66CCDD88] DEFAULT ('') NOT NULL,
    CONSTRAINT [PK_lic_arr] PRIMARY KEY NONCLUSTERED ([cd] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [No_blank_license_Types_codes] CHECK ([cd] <> '')
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [lic_arr_link]
    ON [dbo].[Echo_lic_arr]([link] ASC) WITH (FILLFACTOR = 90);


GO
/*  Update Trigger 'T_U_lic_arr' for Table 'lic_arr'  */
CREATE TRIGGER T_U_lic_arr ON [dbo].[Echo_lic_arr] FOR UPDATE AS
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
/*  The Link of 'lic_arr' cannot be modified if children exist in 'facility'  */
IF UPDATE(Link)
BEGIN
     IF EXISTS (
                SELECT 1
                FROM   facility c, inserted i, deleted d
                WHERE  c.l_lic_dea = d.Link
                AND   (i.Link != d.Link)
               )
        BEGIN
             SELECT @error_number=30004,
                    @error_message='Children exist in "facility". Cannot modify Link in "lic_arr".'
             GOTO error
        END
END
/*  The Link of 'lic_arr' cannot be modified if children exist in 'facility'  */
IF UPDATE(Link)
BEGIN
     IF EXISTS (
                SELECT 1
                FROM   facility c, inserted i, deleted d
                WHERE  c.l_lic_st = d.Link
                AND   (i.Link != d.Link)
               )
        BEGIN
             SELECT @error_number=30004,
                    @error_message='Children exist in "facility". Cannot modify Link in "lic_arr".'
             GOTO error
        END
END
/*  The Link of 'lic_arr' cannot be modified if children exist in 'facility'  */
IF UPDATE(Link)
BEGIN
     IF EXISTS (
                SELECT 1
                FROM   facility c, inserted i, deleted d
                WHERE  c.l_lic_addl = d.Link
                AND   (i.Link != d.Link)
               )
        BEGIN
             SELECT @error_number=30004,
                    @error_message='Children exist in "facility". Cannot modify Link in "lic_arr".'
             GOTO error
        END
END
/*  Cascade the Update of the Primary Key of 'lic_arr' into its children in 'credent'  */
IF UPDATE(cd)
   BEGIN
        UPDATE credent
        SET    sch_type = i.cd
        FROM   credent c, inserted i join deleted d on i.link = d.link
        WHERE  c.sch_type = d.cd
        AND    (i.cd != d.cd)
   END
RETURN
/*  Error Handling  */
error:
      RAISERROR @error_number @error_message
      ROLLBACK TRANSACTION
END

GO
/*  Delete Trigger 'T_D_lic_arr' for Table 'lic_arr'  */
CREATE TRIGGER T_D_lic_arr ON [dbo].[Echo_lic_arr] FOR DELETE AS
BEGIN
    DECLARE
           @row_count       INT,
           @error_number    INT,
           @error_message   VARCHAR(255)
    SELECT @row_count = @@rowcount
    IF @row_count = 0
       RETURN
  SET NOCOUNT ON
   IF 'lic_arr' = 'DRNAME'
       Delete DR_PLAN2 Where L_ADDRESS in
          (Select LINK from ADDRESS Where DR_ID in
          (Select DR_ID from DELETED))
/*  Parent in 'lic_arr' cannot be deleted if children exist in 'credent'  */
IF EXISTS (
           SELECT 1
           FROM   credent c, deleted d
           WHERE  c.sch_type = d.cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This License Type is used in  records. Cannot delete this License Type until the  records are deleted.'
        GOTO error
   END
/*  Parent in 'lic_arr' cannot be deleted if children exist in 'facility'  */
IF EXISTS (
           SELECT 1
           FROM   facility c, deleted d
           WHERE  c.l_lic_dea = d.Link
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This License Type is used in Facility records. Cannot delete this License Type until the Facility records are deleted.'
        GOTO error
   END
/*  Parent in 'lic_arr' cannot be deleted if children exist in 'facility'  */
IF EXISTS (
           SELECT 1
           FROM   facility c, deleted d
           WHERE  c.l_lic_st = d.Link
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This License Type is used in Facility records. Cannot delete this License Type until the Facility records are deleted.'
        GOTO error
   END
/*  Parent in 'lic_arr' cannot be deleted if children exist in 'facility'  */
IF EXISTS (
           SELECT 1
           FROM   facility c, deleted d
           WHERE  c.l_lic_addl = d.Link
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This License Type is used in Facility records. Cannot delete this License Type until the Facility records are deleted.'
        GOTO error
   END
RETURN
/*  Error Handling  */
error:
      RAISERROR @error_number @error_message
      ROLLBACK TRANSACTION
END
