CREATE TABLE [dbo].[LawsonPAprimaryChange_hist] (
    [changeType]      VARCHAR (19)    NOT NULL,
    [begin_date]      VARCHAR (30)    NULL,
    [empName]         VARCHAR (47)    NULL,
    [employee]        INT             NOT NULL,
    [job_description] CHAR (30)       NOT NULL,
    [new_site]        CHAR (30)       NOT NULL,
    [old_site]        CHAR (30)       NOT NULL,
    [reason_02]       VARCHAR (15)    NOT NULL,
    [fte]             DECIMAL (11, 6) NOT NULL,
    [emp_status]      CHAR (2)        NOT NULL,
    [date_hired]      VARCHAR (30)    NULL,
    [benDate1]        VARCHAR (30)    NULL,
    [benDate2]        VARCHAR (30)    NULL,
    [processed_date]  VARCHAR (30)    NULL
);

