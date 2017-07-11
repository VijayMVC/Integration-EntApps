CREATE TABLE [dbo].[Echo_lic_udf] (
    [cd]   CHAR (5)  CONSTRAINT [DF__TEMP_lic_udf__cd__69A94A33] DEFAULT ('') NOT NULL,
    [txt]  CHAR (30) CONSTRAINT [DF__TEMP_lic_ud__txt__6A9D6E6C] DEFAULT ('') NOT NULL,
    [link] INT       IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_lic_udf] PRIMARY KEY NONCLUSTERED ([cd] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [No_blank_License_UDF_codes] CHECK ([cd] <> '')
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [lic_udf_link]
    ON [dbo].[Echo_lic_udf]([link] ASC) WITH (FILLFACTOR = 90);


GO
/*  Update Trigger 'T_U_lic_udf' for Table 'lic_udf'  */
CREATE TRIGGER T_U_lic_udf ON [dbo].[Echo_lic_udf] FOR UPDATE AS
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
/*  Cascade the Update of the Primary Key of 'lic_udf' into its children in 'credent'  */
IF UPDATE(cd)
   BEGIN
        UPDATE credent
        SET    lic_udf1 = i.cd
        FROM   credent c, inserted i join deleted d on i.link = d.link
        WHERE  c.lic_udf1 = d.cd
        AND    (i.cd != d.cd)
   END
RETURN
/*  Error Handling  */
error:
      RAISERROR @error_number @error_message
      ROLLBACK TRANSACTION
END

GO
/*  Delete Trigger 'T_D_lic_udf' for Table 'lic_udf'  */
CREATE TRIGGER T_D_lic_udf ON [dbo].[Echo_lic_udf] FOR DELETE AS
BEGIN
    DECLARE
           @row_count       INT,
           @error_number    INT,
           @error_message   VARCHAR(255)
    SELECT @row_count = @@rowcount
    IF @row_count = 0
       RETURN
  SET NOCOUNT ON
   IF 'lic_udf' = 'DRNAME'
       Delete DR_PLAN2 Where L_ADDRESS in
          (Select LINK from ADDRESS Where DR_ID in
          (Select DR_ID from DELETED))
/*  Parent in 'lic_udf' cannot be deleted if children exist in 'credent'  */
IF EXISTS (
           SELECT 1
           FROM   credent c, deleted d
           WHERE  c.lic_udf1 = d.cd
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
