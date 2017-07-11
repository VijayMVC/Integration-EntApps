CREATE TABLE [dbo].[LawsonPAnewHire] (
    [changeType]      VARCHAR (8)     NOT NULL,
    [begin_date]      VARCHAR (30)    NULL,
    [empName]         VARCHAR (47)    NULL,
    [employee]        INT             NOT NULL,
    [job_description] CHAR (30)       NOT NULL,
    [site_name]       CHAR (30)       NOT NULL,
    [process_level]   CHAR (5)        NOT NULL,
    [pay_rate]        DECIMAL (13, 4) NOT NULL,
    [fte]             DECIMAL (11, 6) NOT NULL,
    [emp_status]      CHAR (2)        NOT NULL,
    [hire_date]       VARCHAR (30)    NULL,
    [ben_date2]       VARCHAR (30)    NULL,
    [processed_date]  VARCHAR (30)    NULL
);

