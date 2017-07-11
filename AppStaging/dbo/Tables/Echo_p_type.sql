CREATE TABLE [dbo].[Echo_p_type] (
    [cd]   CHAR (5)  NOT NULL,
    [txt]  CHAR (30) CONSTRAINT [DF__TEMP_p_type__txt__542E3F09] DEFAULT ('') NOT NULL,
    [link] INT       IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_p_type] PRIMARY KEY NONCLUSTERED ([cd] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [No_blank_P_TYPE_codes] CHECK ([cd] <> '')
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [p_type_link]
    ON [dbo].[Echo_p_type]([link] ASC) WITH (FILLFACTOR = 90);


GO
/*  Update Trigger 'T_U_p_type' for Table 'p_type'  */
CREATE TRIGGER T_U_p_type ON [dbo].[Echo_p_type] FOR UPDATE AS
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
/*  Cascade the Update of the Primary Key of 'p_type' into its children in 'pgroups'  */
IF UPDATE(cd)
   BEGIN
        UPDATE pgroups
        SET    l_p_type = i.cd
        FROM   pgroups c, inserted i join deleted d on i.link = d.link
        WHERE  c.l_p_type = d.cd
        AND    (i.cd != d.cd)
   END
/*  Cascade the Update of the Primary Key of 'p_type' into its children in 'address'  */
IF UPDATE(cd)
   BEGIN
        UPDATE address
        SET    p_type = i.cd
        FROM   address c, inserted i join deleted d on i.link = d.link
        WHERE  c.p_type = d.cd
        AND    (i.cd != d.cd)
   END
RETURN
/*  Error Handling  */
error:
      RAISERROR @error_number @error_message
      ROLLBACK TRANSACTION
END

GO
/*  Delete Trigger 'T_D_p_type' for Table 'p_type'  */
CREATE TRIGGER T_D_p_type ON [dbo].[Echo_p_type] FOR DELETE AS
BEGIN
    DECLARE
           @row_count       INT,
           @error_number    INT,
           @error_message   VARCHAR(255)
    SELECT @row_count = @@rowcount
    IF @row_count = 0
       RETURN
  SET NOCOUNT ON
   IF 'p_type' = 'DRNAME'
       Delete DR_PLAN2 Where L_ADDRESS in
          (Select LINK from ADDRESS Where DR_ID in
          (Select DR_ID from DELETED))
/*  Parent in 'p_type' cannot be deleted if children exist in 'pgroups'  */
IF EXISTS (
           SELECT 1
           FROM   pgroups c, deleted d
           WHERE  c.l_p_type = d.cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This  is used in  records. Cannot delete this  until the  records are deleted.'
        GOTO error
   END
/*  Parent in 'p_type' cannot be deleted if children exist in 'address'  */
IF EXISTS (
           SELECT 1
           FROM   address c, deleted d
           WHERE  c.p_type = d.cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This  is used in  records. Cannot delete this  until the  records are deleted.'
        GOTO error
   END
RETURN
/*  Error Handling  */
error:
      RAISERROR @error_number @error_message
      ROLLBACK TRANSACTION
END
