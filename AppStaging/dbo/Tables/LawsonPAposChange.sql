CREATE TABLE [dbo].[LawsonPAposChange] (
    [changeType]     VARCHAR (15)    NOT NULL,
    [begin_date]     VARCHAR (30)    NULL,
    [empName]        VARCHAR (47)    NULL,
    [employee]       INT             NOT NULL,
    [site_name]      CHAR (30)       NOT NULL,
    [process_level]  CHAR (5)        NOT NULL,
    [pos_level]      SMALLINT        NOT NULL,
    [position]       CHAR (30)       NOT NULL,
    [old_position]   CHAR (30)       NOT NULL,
    [fte]            DECIMAL (11, 6) NOT NULL,
    [emp_status]     CHAR (2)        NOT NULL,
    [hire_date]      VARCHAR (30)    NULL,
    [ben_date2]      VARCHAR (30)    NULL,
    [processed_date] VARCHAR (30)    NULL
);

