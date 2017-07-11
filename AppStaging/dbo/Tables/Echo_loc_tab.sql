CREATE TABLE [dbo].[Echo_loc_tab] (
    [cd]   CHAR (3)  NOT NULL,
    [txt]  CHAR (25) CONSTRAINT [DF__TEMP_loc_ta__txt__3F158897] DEFAULT ('') NOT NULL,
    [link] INT       IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_loc_tab] PRIMARY KEY NONCLUSTERED ([cd] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [No_blank_location_codes] CHECK ([cd] <> '')
);


GO
/*  Delete Trigger 'T_D_loc_tab' for Table 'loc_tab'  */
CREATE TRIGGER T_D_loc_tab ON [dbo].[Echo_loc_tab] FOR DELETE AS
BEGIN
    DECLARE
           @row_count       INT,
           @error_number    INT,
           @error_message   VARCHAR(255)
    SELECT @row_count = @@rowcount
    IF @row_count = 0
       RETURN
  SET NOCOUNT ON
   IF 'loc_tab' = 'DRNAME'
       Delete DR_PLAN2 Where L_ADDRESS in
          (Select LINK from ADDRESS Where DR_ID in
          (Select DR_ID from DELETED))
/*  Parent in 'loc_tab' cannot be deleted if children exist in 'address'  */
IF EXISTS (
           SELECT 1
           FROM   address c, deleted d
           WHERE  c.loc_code = d.cd
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

GO
/*  Update Trigger 'T_U_loc_tab' for Table 'loc_tab'  */
CREATE TRIGGER T_U_loc_tab ON [dbo].[Echo_loc_tab] FOR UPDATE AS
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
/*  Cascade the Update of the Primary Key of 'loc_tab' into its children in 'address'  */
IF UPDATE(cd)
   BEGIN
        UPDATE address
        SET    loc_code = i.cd
        FROM   address c, inserted i join deleted d on i.link = d.link
        WHERE  c.loc_code = d.cd
        AND    (i.cd != d.cd)
   END
RETURN
/*  Error Handling  */
error:
      RAISERROR @error_number @error_message
      ROLLBACK TRANSACTION
END
