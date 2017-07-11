CREATE VIEW [dbo].[v_capaccr2]
AS
SELECT     ID1, DOCNAME, CLKNUM, CapMD1, AccrMD1, PeMD1, CapAOP1, AccrAOP1, PeAOP1, CapTAP1, AccrTAP1, PeTAP1, CapMD2, AccrMD2, PeMD2, 
                      CapAOP2, AccrAOP2, PeAOP2, CapTAP2, AccrTAP2, PeTAP2, CapMD3, AccrMD3, PeMD3, CapAOP3, AccrAOP3, PeAOP3, CapTAP3, AccrTAP3, PeTAP3, 
                      CapMD4, AccrMD4, PeMD4, CapAOP4, PeAOP4, AccrAOP4, CapTAP4, AccrTAP4, PeTAP4, CapMD5, AccrMD5, PeMD5, CapAOP5, AccrAOP5, PeAOP5, 
                      CapTAP5, AccrTAP5, PeTAP5, CapMD6, AccrMD6, PeMD6, CapAOP6, AccrAOP6, PeAOP6, CapTAP6, AccrTAP6, PeTAP6, CapMD7, AccrMD7, PeMD7, 
                      CapAOP7, AccrAOP7, PeAOP7, CapTAP7, AccrTAP7, PeTAP7, AccrMD8, CapMD8, PeMD8, CapAOP8, AccrAOP8, PeAOP8, CapTAP8, AccrTAP8, PeTAP8, 
                      CapMD9, AccrMD9, PeMD9, CapAOP9, AccrAOP9, PeAOP9, CapTAP9, AccrTAP9, PeTAP9
FROM         dbo.WebCapitalAndAccrualStaging
WHERE     (DOCNAME LIKE 'neill%')
