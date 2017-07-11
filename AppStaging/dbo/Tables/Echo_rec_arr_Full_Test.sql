CREATE TABLE [dbo].[Echo_rec_arr_Full_Test] (
    [cd]                CHAR (1)     CONSTRAINT [DF__TEMP_rec_arr__cd2__4F9F5F6D] DEFAULT ('') NOT NULL,
    [txt]               CHAR (25)    CONSTRAINT [DF__TEMP_rec_ar__txt2__509383A6] DEFAULT ('') NOT NULL,
    [StaffGroup]        VARCHAR (50) NULL,
    [ActiveFlag]        CHAR (1)     NULL,
    [CurrentlyUsedFlag] CHAR (1)     NULL,
    [link]              INT          NULL
);

