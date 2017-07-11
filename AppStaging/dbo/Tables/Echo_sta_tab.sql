CREATE TABLE [dbo].[Echo_sta_tab] (
    [cd]   CHAR (3)  NOT NULL,
    [txt]  CHAR (30) CONSTRAINT [DF__TEMP_sta_ta__txt__74D0E41C] DEFAULT ('') NOT NULL,
    [link] INT       IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_sta_tab] PRIMARY KEY NONCLUSTERED ([cd] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [No_Blank_Staff_Status_codes] CHECK ([cd] <> '')
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [sta_tab_link]
    ON [dbo].[Echo_sta_tab]([link] ASC) WITH (FILLFACTOR = 90);


GO
/*  Delete Trigger 'T_D_sta_tab' for Table 'sta_tab'  */
CREATE TRIGGER T_D_sta_tab ON [dbo].[Echo_sta_tab] FOR DELETE AS
BEGIN
    DECLARE
           @row_count       INT,
           @error_number    INT,
           @error_message   VARCHAR(255)
    SELECT @row_count = @@rowcount
    IF @row_count = 0
       RETURN
  SET NOCOUNT ON
   IF 'sta_tab' = 'DRNAME'
       Delete DR_PLAN2 Where L_ADDRESS in
          (Select LINK from ADDRESS Where DR_ID in
          (Select DR_ID from DELETED))
/*  Parent in 'sta_tab' cannot be deleted if children exist in 'stfstatu'  */
IF EXISTS (
           SELECT 1
           FROM   stfstatu c, deleted d
           WHERE  c.staff_cd = d.cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Staff Status is used in Provider Facility records. Cannot delete this Staff Status until the Provider Facility records are deleted.'
        GOTO error
   END
/*  Parent in 'sta_tab' cannot be deleted if children exist in 'staffs'  */
IF EXISTS (
           SELECT 1
           FROM   staffs c, deleted d
           WHERE  c.staff_cd = d.cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Staff Status is used in Staff Status History records. Cannot delete this Staff Status until the Staff Status History records are deleted.'
        GOTO error
   END
RETURN
/*  Error Handling  */
error:
      RAISERROR @error_number @error_message
      ROLLBACK TRANSACTION
END

GO
/*  Update Trigger 'T_U_sta_tab' for Table 'sta_tab'  */
CREATE TRIGGER T_U_sta_tab ON [dbo].[Echo_sta_tab] FOR UPDATE AS
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
/*  Cascade the Update of the Primary Key of 'sta_tab' into its children in 'stfstatu'  */
IF UPDATE(cd)
   BEGIN
        UPDATE stfstatu
        SET    staff_cd = i.cd
        FROM   stfstatu c, inserted i join deleted d on i.link = d.link
        WHERE  c.staff_cd = d.cd
        AND    (i.cd != d.cd)
   END
/*  Cascade the Update of the Primary Key of 'sta_tab' into its children in 'staffs'  */
IF UPDATE(cd)
   BEGIN
        UPDATE staffs
        SET    staff_cd = i.cd
        FROM   staffs c, inserted i join deleted d on i.link = d.link
        WHERE  c.staff_cd = d.cd
        AND    (i.cd != d.cd)
   END
RETURN
/*  Error Handling  */
error:
      RAISERROR @error_number @error_message
      ROLLBACK TRANSACTION
END
