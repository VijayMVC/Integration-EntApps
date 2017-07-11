CREATE TABLE [dbo].[Echo_addr_arr] (
    [cd]      CHAR (5)  NOT NULL,
    [txt]     CHAR (25) CONSTRAINT [DF__TEMP_addr_a__txt__02D74CB5] DEFAULT ('') NOT NULL,
    [limitit] BIT       CONSTRAINT [DF__TEMP_addr__limit__03CB70EE] DEFAULT (0) NOT NULL,
    [hours]   BIT       CONSTRAINT [DF__TEMP_addr__hours__04BF9527] DEFAULT (0) NOT NULL,
    [mslnet]  BIT       CONSTRAINT [DF__TEMP_addr__mslne__05B3B960] DEFAULT (0) NOT NULL,
    [mslnet2] BIT       CONSTRAINT [DF__TEMP_addr__mslne__06A7DD99] DEFAULT (0) NOT NULL,
    [link]    INT       IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_addr_arr] PRIMARY KEY NONCLUSTERED ([cd] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [No_blank_address_types] CHECK ([cd] <> '')
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [addr_arr_link]
    ON [dbo].[Echo_addr_arr]([link] ASC) WITH (FILLFACTOR = 90);


GO
/*  Delete Trigger 'T_D_addr_arr' for Table 'addr_arr'  */
CREATE TRIGGER T_D_addr_arr ON [dbo].[Echo_addr_arr] FOR DELETE AS
BEGIN
    DECLARE
           @row_count       INT,
           @error_number    INT,
           @error_message   VARCHAR(255)
    SELECT @row_count = @@rowcount
    IF @row_count = 0
       RETURN
  SET NOCOUNT ON
   IF 'addr_arr' = 'DRNAME'
       Delete DR_PLAN2 Where L_ADDRESS in
          (Select LINK from ADDRESS Where DR_ID in
          (Select DR_ID from DELETED))
/*  Parent in 'addr_arr' cannot be deleted if children exist in 'address'  */
IF EXISTS (
           SELECT 1
           FROM   address c, deleted d
           WHERE  c.sch_type = d.cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Provider Address Type is used in  records. Cannot delete this Provider Address Type until the  records are deleted.'
        GOTO error
   END
/*  Parent in 'addr_arr' cannot be deleted if children exist in 'facility'  */
IF EXISTS (
           SELECT 1
           FROM   facility c, deleted d
           WHERE  c.l_addr_hm = d.Link
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Provider Address Type is used in Facility records. Cannot delete this Provider Address Type until the Facility records are deleted.'
        GOTO error
   END
/*  Parent in 'addr_arr' cannot be deleted if children exist in 'facility'  */
IF EXISTS (
           SELECT 1
           FROM   facility c, deleted d
           WHERE  c.l_addr_wk = d.Link
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Provider Address Type is used in Facility records. Cannot delete this Provider Address Type until the Facility records are deleted.'
        GOTO error
   END
RETURN
/*  Error Handling  */
error:
      RAISERROR @error_number @error_message
      ROLLBACK TRANSACTION
END

GO
/*  Update Trigger 'T_U_addr_arr' for Table 'addr_arr'  */
CREATE TRIGGER T_U_addr_arr ON [dbo].[Echo_addr_arr] FOR UPDATE AS
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
/*  The Link of 'addr_arr' cannot be modified if children exist in 'facility'  */
IF UPDATE(Link)
BEGIN
     IF EXISTS (
                SELECT 1
                FROM   facility c, inserted i, deleted d
                WHERE  c.l_addr_hm = d.Link
                AND   (i.Link != d.Link)
               )
        BEGIN
             SELECT @error_number=30004,
                    @error_message='Children exist in "facility". Cannot modify Link in "addr_arr".'
             GOTO error
        END
END
/*  The Link of 'addr_arr' cannot be modified if children exist in 'facility'  */
IF UPDATE(Link)
BEGIN
     IF EXISTS (
                SELECT 1
                FROM   facility c, inserted i, deleted d
                WHERE  c.l_addr_wk = d.Link
                AND   (i.Link != d.Link)
               )
        BEGIN
             SELECT @error_number=30004,
                    @error_message='Children exist in "facility". Cannot modify Link in "addr_arr".'
             GOTO error
        END
END
/*  Cascade the Update of the Primary Key of 'addr_arr' into its children in 'address'  */
IF UPDATE(cd)
   BEGIN
        UPDATE address
        SET    sch_type = i.cd
        FROM   address c, inserted i join deleted d on i.link = d.link
        WHERE  c.sch_type = d.cd
        AND    (i.cd != d.cd)
   END
RETURN
/*  Error Handling  */
error:
      RAISERROR @error_number @error_message
      ROLLBACK TRANSACTION
END
