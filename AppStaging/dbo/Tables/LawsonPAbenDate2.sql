CREATE TABLE [dbo].[LawsonPAbenDate2] (
    [changeType]      VARCHAR (13) NOT NULL,
    [begin_date]      VARCHAR (30) NULL,
    [empName]         VARCHAR (47) NULL,
    [employee]        INT          NOT NULL,
    [job_description] CHAR (30)    NOT NULL,
    [site_name]       CHAR (30)    NOT NULL,
    [pos_level]       SMALLINT     NOT NULL,
    [process_level]   CHAR (5)     NOT NULL,
    [emp_status]      CHAR (2)     NOT NULL,
    [hire_date]       VARCHAR (30) NULL,
    [ben_date2]       VARCHAR (30) NULL,
    [prev_ben_date2]  VARCHAR (30) NULL,
    [processed_date]  VARCHAR (30) NULL
);

