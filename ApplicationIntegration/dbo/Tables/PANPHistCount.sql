CREATE TABLE [dbo].[PANPHistCount] (
    [provider]         VARCHAR (46)  NULL,
    [employee]         INT           NOT NULL,
    [site]             VARCHAR (30)  NULL,
    [process_level]    CHAR (5)      NOT NULL,
    [ca_flag]          VARCHAR (6)   NOT NULL,
    [position]         CHAR (30)     NOT NULL,
    [pa_np]            VARCHAR (50)  NOT NULL,
    [emp_status]       VARCHAR (9)   NOT NULL,
    [date_hired]       DATETIME2 (7) NULL,
    [address1]         VARCHAR (100) NULL,
    [city1]            VARCHAR (50)  NULL,
    [state1]           VARCHAR (50)  NULL,
    [zipCode1]         VARCHAR (50)  NULL,
    [phoneNbr]         VARCHAR (50)  NULL,
    [CellPhoneNbr]     VARCHAR (50)  NULL,
    [CEPEmail]         VARCHAR (100) NULL,
    [providerMasterID] INT           NULL
);

