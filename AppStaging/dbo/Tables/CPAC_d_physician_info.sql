CREATE TABLE [dbo].[CPAC_d_physician_info] (
    [id]            INT          NOT NULL,
    [evalID]        CHAR (10)    NULL,
    [mdirID]        VARCHAR (50) NOT NULL,
    [hos_clin]      VARCHAR (50) NULL,
    [dept_dir]      VARCHAR (50) NULL,
    [date_emp]      VARCHAR (50) NULL,
    [bd_status]     VARCHAR (50) NULL,
    [cred_cur]      CHAR (10)    NULL,
    [date_levl1]    VARCHAR (50) NULL,
    [cur_levl_date] VARCHAR (50) NULL,
    [adv_levl]      CHAR (10)    NULL,
    [elig_date]     VARCHAR (50) NULL,
    [hrs]           VARCHAR (50) NULL,
    [acc_adv]       CHAR (10)    NULL
);

