CREATE TABLE [dbo].[LawsonPAterm_hist] (
    [changeType]      VARCHAR (4)     NOT NULL,
    [term_date]       VARCHAR (30)    NULL,
    [empName]         VARCHAR (47)    NULL,
    [employee]        INT             NOT NULL,
    [job_description] CHAR (30)       NOT NULL,
    [site_name]       CHAR (30)       NOT NULL,
    [process_level]   CHAR (5)        NOT NULL,
    [pos_level]       SMALLINT        NOT NULL,
    [fte]             DECIMAL (11, 6) NOT NULL,
    [emp_status]      CHAR (2)        NOT NULL,
    [reason_01]       CHAR (10)       NULL,
    [reason_02]       CHAR (10)       NULL,
    [hire_date]       VARCHAR (30)    NULL,
    [ben_date2]       VARCHAR (30)    NULL,
    [processed_date]  VARCHAR (30)    NULL
);

