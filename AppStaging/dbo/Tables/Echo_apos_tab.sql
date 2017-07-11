CREATE TABLE [dbo].[Echo_apos_tab] (
    [cd]   CHAR (3)  CONSTRAINT [DF__TEMP_apos_ta__cd__5FEAD5CF] DEFAULT ('') NOT NULL,
    [txt]  CHAR (30) CONSTRAINT [DF__TEMP_apos_t__txt__60DEFA08] DEFAULT ('') NOT NULL,
    [link] INT       IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_apos_tab] PRIMARY KEY NONCLUSTERED ([cd] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [No_blank_Posistion_codes] CHECK ([cd] <> '')
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [apos_tab_link]
    ON [dbo].[Echo_apos_tab]([link] ASC) WITH (FILLFACTOR = 90);


GO
/*  Delete Trigger 'T_D_apos_tab' for Table 'apos_tab'  */
CREATE TRIGGER T_D_apos_tab ON [dbo].[Echo_apos_tab] FOR DELETE AS
BEGIN
    DECLARE
           @row_count       INT,
           @error_number    INT,
           @error_message   VARCHAR(255)
    SELECT @row_count = @@rowcount
    IF @row_count = 0
       RETURN
  SET NOCOUNT ON
   IF 'apos_tab' = 'DRNAME'
       Delete DR_PLAN2 Where L_ADDRESS in
          (Select LINK from ADDRESS Where DR_ID in
          (Select DR_ID from DELETED))
/*  Parent in 'apos_tab' cannot be deleted if children exist in 'train'  */
IF EXISTS (
           SELECT 1
           FROM   train c, deleted d
           WHERE  c.position = d.cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Position Table is used in Affiliation records. Cannot delete this Position Table until the Affiliation records are deleted.'
        GOTO error
   END
/*  Parent in 'apos_tab' cannot be deleted if children exist in TicLet */
IF EXISTS (
           SELECT 1
           FROM  TicLet c, deleted d
           WHERE  c.position = d.cd
           AND c.file_dbf = 'TRAIN'
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Position Table is used in Tickler Letter records. Cannot delete this Position Table until the Tickler Letter records are deleted.'
        GOTO error
   END
/*  Parent in 'apos_tab' cannot be deleted if children exist in AppLet */
IF EXISTS (
           SELECT 1
           FROM  APPLet c, deleted d
           WHERE  c.position = d.cd
           AND c.file_dbf = 'TRAIN'
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Position Table is used in Verification Letter records. Cannot delete this Position Table until the Veification Letter records are deleted.'
        GOTO error
   END
/*  Parent in 'apos_tab' cannot be deleted if children exist in 'proref'  */
IF EXISTS (
           SELECT 1
           FROM   proref c, deleted d
           WHERE  c.position = d.cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Position Table is used in  records. Cannot delete this Position Table until the  records are deleted.'
        GOTO error
   END
/*  Parent in 'apos_tab' cannot be deleted if children exist in 'workhist'  */
IF EXISTS (
           SELECT 1
           FROM   workhist c, deleted d
           WHERE  c.position = d.cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Position Table is used in  records. Cannot delete this Position Table until the  records are deleted.'
        GOTO error
   END
RETURN
/*  Error Handling  */
error:
      RAISERROR @error_number @error_message
      ROLLBACK TRANSACTION
END

GO
/*  Update Trigger 'T_U_apos_tab' for Table 'apos_tab'  */
CREATE TRIGGER T_U_apos_tab ON [dbo].[Echo_apos_tab] FOR UPDATE AS
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
/*  Cascade the Update of the Primary Key of 'apos_tab' into its children in 'train'  */
IF UPDATE(cd)
   BEGIN
        UPDATE train
        SET    position = i.cd
        FROM   train c, inserted i join deleted d on i.link = d.link
        WHERE  c.position = d.cd
        AND    (i.cd != d.cd)
   END
/*  Cascade the Update of the Primary Key of 'apos_tab' into its children in TicLet */
IF UPDATE(cd)
   BEGIN
        UPDATE TicLet
        SET    TicLet.Position = i.cd
        FROM   TicLet c, inserted i join deleted d on i.link = d.link
        WHERE  c.Position = d.cd
        AND c.file_dbf = 'TRAIN'
        AND    (i.cd != d.cd)
   END
/*  Cascade the Update of the Primary Key of 'apos_tab' into its children in AppLet */
IF UPDATE(cd)
   BEGIN
        UPDATE AppLet
        SET    AppLet.Position = i.cd
        FROM  AppLet c, inserted i join deleted d on i.link = d.link
        WHERE  c.Position = d.cd
        AND c.file_dbf = 'TRAIN'
        AND    (i.cd != d.cd)
   END
/*  Cascade the Update of the Primary Key of 'apos_tab' into its children in 'proref'  */
IF UPDATE(cd)
   BEGIN
        UPDATE proref
        SET    position = i.cd
        FROM   proref c, inserted i join deleted d on i.link = d.link
        WHERE  c.position = d.cd
        AND    (i.cd != d.cd)
   END
/*  Cascade the Update of the Primary Key of 'apos_tab' into its children in 'workhist'  */
IF UPDATE(cd)
   BEGIN
        UPDATE workhist
        SET    position = i.cd
        FROM   workhist c, inserted i join deleted d on i.link = d.link
        WHERE  c.position = d.cd
        AND    (i.cd != d.cd)
   END
RETURN
/*  Error Handling  */
error:
      RAISERROR @error_number @error_message
      ROLLBACK TRANSACTION
END
