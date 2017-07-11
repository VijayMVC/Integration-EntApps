CREATE TABLE [dbo].[LawsonPAstatusChange] (
    [changeType]      VARCHAR (10)    NOT NULL,
    [begin_date]      VARCHAR (30)    NULL,
    [empName]         VARCHAR (47)    NULL,
    [employee]        INT             NOT NULL,
    [job_description] CHAR (30)       NOT NULL,
    [site_name]       CHAR (30)       NOT NULL,
    [pos_level]       SMALLINT        NOT NULL,
    [new_fte]         DECIMAL (10, 3) NULL,
    [old_fte]         DECIMAL (10, 3) NULL,
    [reason_02]       CHAR (10)       NULL,
    [emp_status]      CHAR (2)        NOT NULL,
    [hire_date]       VARCHAR (30)    NULL,
    [ben_date1]       VARCHAR (30)    NULL,
    [ben_date2]       VARCHAR (30)    NULL,
    [processed_date]  VARCHAR (30)    NULL
);

