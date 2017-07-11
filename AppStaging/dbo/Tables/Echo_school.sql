CREATE TABLE [dbo].[Echo_school] (
    [cd]        CHAR (6)       NOT NULL,
    [txt]       CHAR (50)      CONSTRAINT [DF__TEMP_school__txt__70E057A7] DEFAULT ('') NOT NULL,
    [subname]   CHAR (50)      CONSTRAINT [DF__TEMP_scho__subna__71D47BE0] DEFAULT ('') NOT NULL,
    [addr]      CHAR (30)      CONSTRAINT [DF__TEMP_schoo__addr__72C8A019] DEFAULT ('') NOT NULL,
    [addr2]     CHAR (30)      CONSTRAINT [DF__TEMP_scho__addr2__73BCC452] DEFAULT ('') NOT NULL,
    [city]      CHAR (20)      CONSTRAINT [DF__TEMP_schoo__city__74B0E88B] DEFAULT ('') NOT NULL,
    [state]     CHAR (2)       CONSTRAINT [DF__TEMP_scho__state__75A50CC4] DEFAULT ('') NOT NULL,
    [zip]       CHAR (10)      CONSTRAINT [DF__TEMP_school__zip__769930FD] DEFAULT ('') NOT NULL,
    [nation]    CHAR (30)      CONSTRAINT [DF__TEMP_scho__natio__778D5536] DEFAULT ('') NOT NULL,
    [phone]     CHAR (14)      CONSTRAINT [DF__TEMP_scho__phone__7881796F] DEFAULT ('') NOT NULL,
    [contact1]  CHAR (40)      CONSTRAINT [DF__TEMP_scho__conta__79759DA8] DEFAULT ('') NOT NULL,
    [contact2]  CHAR (40)      CONSTRAINT [DF__TEMP_scho__conta__7A69C1E1] DEFAULT ('') NOT NULL,
    [fax]       CHAR (14)      CONSTRAINT [DF__TEMP_school__fax__7B5DE61A] DEFAULT ('') NOT NULL,
    [cvo_type]  CHAR (3)       CONSTRAINT [DF__TEMP_scho__cvo_t__7C520A53] DEFAULT ('') NOT NULL,
    [homehtml]  CHAR (100)     CONSTRAINT [DF__TEMP_scho__homeh__7D462E8C] DEFAULT ('') NOT NULL,
    [ver_elec]  BIT            CONSTRAINT [DF__TEMP_scho__ver_e__7E3A52C5] DEFAULT (0) NOT NULL,
    [email]     CHAR (100)     CONSTRAINT [DF__TEMP_scho__email__7F2E76FE] DEFAULT ('') NOT NULL,
    [payfee]    DECIMAL (9, 2) CONSTRAINT [DF__TEMP_scho__payfe__00229B37] DEFAULT (0) NOT NULL,
    [link]      INT            IDENTITY (1, 1) NOT NULL,
    [autofax]   BIT            CONSTRAINT [DF__TEMP_scho__autof__0116BF70] DEFAULT (1) NOT NULL,
    [autoemail] BIT            CONSTRAINT [DF__TEMP_scho__autoe__020AE3A9] DEFAULT (1) NOT NULL,
    CONSTRAINT [PK_school] PRIMARY KEY NONCLUSTERED ([cd] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [No_blank_School_codes] CHECK ([cd] <> '')
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [school_link]
    ON [dbo].[Echo_school]([link] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [staname]
    ON [dbo].[Echo_school]([state] ASC) WITH (FILLFACTOR = 90);


GO
/*  Insert Trigger 'T_I_school' for Table 'school'  */
CREATE TRIGGER T_I_school ON [dbo].[Echo_school] FOR INSERT AS
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
/*  When inserting a row in child 'school' ,the Foreign Key must be Blank or exist in Parent 'staname' */
IF UPDATE(state)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE state = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   staname p, inserted i
               WHERE  p.cd = i.state
              )
               != @row_count - @blank_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "school" as its Foreign Key does not exist in "staname".'
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
/*  Delete Trigger 'T_D_school' for Table 'school'  */
CREATE TRIGGER T_D_school ON [dbo].[Echo_school] FOR DELETE AS
BEGIN
    DECLARE
           @row_count       INT,
           @error_number    INT,
           @error_message   VARCHAR(255)
    SELECT @row_count = @@rowcount
    IF @row_count = 0
       RETURN
  SET NOCOUNT ON
   IF 'school' = 'DRNAME'
       Delete DR_PLAN2 Where L_ADDRESS in
          (Select LINK from ADDRESS Where DR_ID in
          (Select DR_ID from DELETED))
/*  Parent in 'school' cannot be deleted if children exist in 'educate'  */
IF EXISTS (
           SELECT 1
           FROM   educate c, deleted d
           WHERE  c.cd = d.cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This  is used in Education records. Cannot delete this  until the Education records are deleted.'
        GOTO error
   END
RETURN
/*  Error Handling  */
error:
      RAISERROR @error_number @error_message
      ROLLBACK TRANSACTION
END

GO
/*  Update Trigger 'T_U_school' for Table 'school'  */
CREATE TRIGGER T_U_school ON [dbo].[Echo_school] FOR UPDATE AS
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
/*  When updating a row in child 'school' ,the Foreign Key must be Blank or exist in Parent 'staname'  */
IF UPDATE(state)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  state = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   staname p, inserted i
               WHERE  p.cd = i.state
              )
              != @row_count - @blank_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "school" as its Foreign Key does not exist in "staname".'
                   GOTO error
              END
   END
/*  Cascade the Update of the Primary Key of 'school' into its children in 'educate'  */
IF UPDATE(cd)
   BEGIN
        UPDATE educate
        SET    cd = i.cd
        FROM   educate c, inserted i join deleted d on i.link = d.link
        WHERE  c.cd = d.cd
        AND    (i.cd != d.cd)
   END
RETURN
/*  Error Handling  */
error:
      RAISERROR @error_number @error_message
      ROLLBACK TRANSACTION
END
