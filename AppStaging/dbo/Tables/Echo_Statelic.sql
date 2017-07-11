CREATE TABLE [dbo].[Echo_Statelic] (
    [cd]        CHAR (6)       CONSTRAINT [DF__TEMP_stateli__cd__705647C2] DEFAULT ('') NOT NULL,
    [txt]       CHAR (50)      CONSTRAINT [DF__TEMP_statel__txt__714A6BFB] DEFAULT ('') NOT NULL,
    [addr]      CHAR (30)      CONSTRAINT [DF__TEMP_state__addr__723E9034] DEFAULT ('') NOT NULL,
    [addr2]     CHAR (30)      CONSTRAINT [DF__TEMP_stat__addr2__7332B46D] DEFAULT ('') NOT NULL,
    [city]      CHAR (20)      CONSTRAINT [DF__TEMP_state__city__7426D8A6] DEFAULT ('') NOT NULL,
    [state]     CHAR (2)       CONSTRAINT [DF__TEMP_stat__state__751AFCDF] DEFAULT ('') NOT NULL,
    [zip]       CHAR (10)      CONSTRAINT [DF__TEMP_statel__zip__760F2118] DEFAULT ('') NOT NULL,
    [phone]     CHAR (14)      CONSTRAINT [DF__TEMP_stat__phone__77034551] DEFAULT ('') NOT NULL,
    [contact1]  CHAR (40)      CONSTRAINT [DF__TEMP_stat__conta__77F7698A] DEFAULT ('') NOT NULL,
    [nation]    CHAR (20)      CONSTRAINT [DF__TEMP_stat__natio__78EB8DC3] DEFAULT ('') NOT NULL,
    [fax]       CHAR (14)      CONSTRAINT [DF__TEMP_statel__fax__79DFB1FC] DEFAULT ('') NOT NULL,
    [cvo_type]  CHAR (3)       CONSTRAINT [DF__TEMP_stat__cvo_t__7AD3D635] DEFAULT ('') NOT NULL,
    [homehtml]  CHAR (100)     CONSTRAINT [DF__TEMP_stat__homeh__7BC7FA6E] DEFAULT ('') NOT NULL,
    [ver_elec]  BIT            CONSTRAINT [DF__TEMP_stat__ver_e__7CBC1EA7] DEFAULT (0) NOT NULL,
    [newcd]     CHAR (6)       CONSTRAINT [DF__TEMP_stat__newcd__7DB042E0] DEFAULT ('') NOT NULL,
    [email]     CHAR (100)     CONSTRAINT [DF__TEMP_stat__email__7EA46719] DEFAULT ('') NOT NULL,
    [payfee]    DECIMAL (9, 2) CONSTRAINT [DF__TEMP_stat__payfe__7F988B52] DEFAULT (0) NOT NULL,
    [link]      INT            IDENTITY (1, 1) NOT NULL,
    [autofax]   BIT            CONSTRAINT [DF__TEMP_stat__autof__008CAF8B] DEFAULT (1) NOT NULL,
    [autoemail] BIT            CONSTRAINT [DF__TEMP_stat__autoe__0180D3C4] DEFAULT (1) NOT NULL,
    CONSTRAINT [PK_statelic] PRIMARY KEY NONCLUSTERED ([cd] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [No_blank_State_License_Codes] CHECK ([cd] <> '')
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [statelic_link]
    ON [dbo].[Echo_Statelic]([link] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [staname]
    ON [dbo].[Echo_Statelic]([state] ASC) WITH (FILLFACTOR = 90);


GO
/*  Update Trigger 'T_U_statelic' for Table 'statelic'  */
CREATE TRIGGER T_U_statelic ON [dbo].[Echo_Statelic] FOR UPDATE AS
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
/*  When updating a row in child 'statelic' ,the Foreign Key must be Blank or exist in Parent 'staname'  */
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
                          @error_message='Cannot update child in "statelic" as its Foreign Key does not exist in "staname".'
                   GOTO error
              END
   END
/*  Cascade the Update of the Primary Key of 'statelic' into its children in 'credent'  */
IF UPDATE(cd)
   BEGIN
        UPDATE credent
        SET    cd = i.cd
        FROM   credent c, inserted i join deleted d on i.link = d.link
        WHERE  c.cd = d.cd
        AND    (i.cd != d.cd)
   END
RETURN
/*  Error Handling  */
error:
      RAISERROR @error_number @error_message
      ROLLBACK TRANSACTION
END

GO
/*  Insert Trigger 'T_I_statelic' for Table 'statelic'  */
CREATE TRIGGER T_I_statelic ON [dbo].[Echo_Statelic] FOR INSERT AS
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
/*  When inserting a row in child 'statelic' ,the Foreign Key must be Blank or exist in Parent 'staname' */
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
                          @error_message='Cannot insert child in "statelic" as its Foreign Key does not exist in "staname".'
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
/*  Delete Trigger 'T_D_statelic' for Table 'statelic'  */
CREATE TRIGGER T_D_statelic ON [dbo].[Echo_Statelic] FOR DELETE AS
BEGIN
    DECLARE
           @row_count       INT,
           @error_number    INT,
           @error_message   VARCHAR(255)
    SELECT @row_count = @@rowcount
    IF @row_count = 0
       RETURN
  SET NOCOUNT ON
   IF 'statelic' = 'DRNAME'
       Delete DR_PLAN2 Where L_ADDRESS in
          (Select LINK from ADDRESS Where DR_ID in
          (Select DR_ID from DELETED))
/*  Parent in 'statelic' cannot be deleted if children exist in 'credent'  */
IF EXISTS (
           SELECT 1
           FROM   credent c, deleted d
           WHERE  c.cd = d.cd
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
