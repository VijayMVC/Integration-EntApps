CREATE TABLE [dbo].[Echo_educ_arr] (
    [cd]       CHAR (5)  CONSTRAINT [DF__TEMP_educ_ar__cd__6756ED6D] DEFAULT ('') NOT NULL,
    [txt]      CHAR (25) CONSTRAINT [DF__TEMP_educ_a__txt__684B11A6] DEFAULT ('') NOT NULL,
    [cvo_type] CHAR (3)  CONSTRAINT [DF__TEMP_educ__cvo_t__693F35DF] DEFAULT ('') NOT NULL,
    [link]     INT       IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_educ_arr] PRIMARY KEY NONCLUSTERED ([cd] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [No_blank_Education_Type_codes] CHECK ([cd] <> '')
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [educ_arr_link]
    ON [dbo].[Echo_educ_arr]([link] ASC) WITH (FILLFACTOR = 90);


GO
/*  Delete Trigger 'T_D_educ_arr' for Table 'educ_arr'  */
CREATE TRIGGER T_D_educ_arr ON [dbo].[Echo_educ_arr] FOR DELETE AS
BEGIN
    DECLARE
           @row_count       INT,
           @error_number    INT,
           @error_message   VARCHAR(255)
    SELECT @row_count = @@rowcount
    IF @row_count = 0
       RETURN
  SET NOCOUNT ON
   IF 'educ_arr' = 'DRNAME'
       Delete DR_PLAN2 Where L_ADDRESS in
          (Select LINK from ADDRESS Where DR_ID in
          (Select DR_ID from DELETED))
/*  Parent in 'educ_arr' cannot be deleted if children exist in 'educate'  */
IF EXISTS (
           SELECT 1
           FROM   educate c, deleted d
           WHERE  c.sch_type = d.cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Education Type is used in Education records. Cannot delete this Education Type until the Education records are deleted.'
        GOTO error
   END
/*  Parent in 'educ_arr' cannot be deleted if children exist in 'facility'  */
IF EXISTS (
           SELECT 1
           FROM   facility c, deleted d
                WHERE charindex('|' + LTrim(RTrim(Cast(d.link as char(3)))) + '|', 
                    link_educ) > 0 
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Education Type is used in Facility records. Cannot delete this Education Type until the Facility records are deleted.'
        GOTO error
   END
RETURN
/*  Error Handling  */
error:
      RAISERROR @error_number @error_message
      ROLLBACK TRANSACTION
END

GO
/*  Update Trigger 'T_U_educ_arr' for Table 'educ_arr'  */
CREATE TRIGGER T_U_educ_arr ON [dbo].[Echo_educ_arr] FOR UPDATE AS
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
/*  The Primary Key of 'educ_arr' cannot be modified if children exist in 'facility'  */
IF UPDATE(Link)
BEGIN
     IF EXISTS(
                SELECT 1
                FROM   facility c, inserted i, deleted d
                WHERE charindex('|' + LTrim(RTrim(Cast(i.link as char(3)))) + '|', 
                    link_educ) > 0 
                AND   (i.link != d.link)
                      )
        BEGIN
             SELECT @error_number=30004,
                    @error_message='Children exist in "facility". Cannot modify Link in "educ_arr".'
             GOTO error
        END
END
/*  Cascade the Update of the Primary Key of 'educ_arr' into its children in 'educate'  */
IF UPDATE(cd)
   BEGIN
        UPDATE educate
        SET    sch_type = i.cd
        FROM   educate c, inserted i join deleted d on i.link = d.link
        WHERE  c.sch_type = d.cd
        AND    (i.cd != d.cd)
   END
RETURN
/*  Error Handling  */
error:
      RAISERROR @error_number @error_message
      ROLLBACK TRANSACTION
END
