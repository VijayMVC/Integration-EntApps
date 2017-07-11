CREATE TABLE [dbo].[SFDCPicklistStaging] (
    [ObjectName]     NVARCHAR (128) NOT NULL,
    [FieldName]      NVARCHAR (128) NOT NULL,
    [PickListValue]  NVARCHAR (256) NOT NULL,
    [PickListLabel]  NVARCHAR (256) NOT NULL,
    [Active]         VARCHAR (5)    NOT NULL,
    [IsDefaultValue] VARCHAR (5)    NOT NULL,
    [ControllerName] NVARCHAR (128) NOT NULL
);

