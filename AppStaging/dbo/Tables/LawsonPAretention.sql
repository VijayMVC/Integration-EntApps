CREATE TABLE [dbo].[LawsonPAretention] (
    [employee]           INT          NOT NULL,
    [emp_name]           VARCHAR (46) NULL,
    [date_hired]         VARCHAR (30) NULL,
    [term_date]          VARCHAR (30) NULL,
    [hire_status]        VARCHAR (3)  NOT NULL,
    [cur_status]         VARCHAR (3)  NOT NULL,
    [hire_process_level] VARCHAR (4)  NOT NULL,
    [hire_site]          VARCHAR (31) NOT NULL,
    [cur_process_level]  VARCHAR (4)  NOT NULL,
    [cur_site]           VARCHAR (31) NOT NULL,
    [reason_01]          VARCHAR (16) NOT NULL,
    [reason_02]          VARCHAR (16) NOT NULL,
    [effect_date]        VARCHAR (30) NULL,
    [hire_process_date]  VARCHAR (10) NOT NULL,
    [cur_process_date]   VARCHAR (10) NOT NULL
);

