CREATE VIEW dbo.vwTempPaData
AS
SELECT DISTINCT dbo.tlkpPayDatePA.CHGMONTH
FROM         dbo.tblTempPAData INNER JOIN
                      dbo.tlkpPayDatePA ON dbo.tblTempPAData.LbrPayPeriod = dbo.tlkpPayDatePA.LbrPayPeriod
