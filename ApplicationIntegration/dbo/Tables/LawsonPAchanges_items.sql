CREATE TABLE [dbo].[LawsonPAchanges_items] (
    [beg_date]        DATETIME       NOT NULL,
    [item_name]       CHAR (20)      NOT NULL,
    [job_code]        CHAR (9)       NOT NULL,
    [change_value]    VARCHAR (30)   NULL,
    [prev_value]      VARCHAR (30)   NULL,
    [employee]        INT            NOT NULL,
    [pos_level]       SMALLINT       NOT NULL,
    [date_stamp]      DATETIME       NOT NULL,
    [date_time_stamp] VARCHAR (8000) NULL,
    [time_stamp]      DECIMAL (6)    NOT NULL,
    [rehire_flag]     VARCHAR (10)   NULL
);

