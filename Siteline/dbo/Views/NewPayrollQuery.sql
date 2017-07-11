CREATE VIEW dbo.NewPayrollQuery
AS
SELECT DISTINCT 
                        dbo.tblCnt.CntNameLast + ', ' + dbo.tblCnt.CntNameFirst AS CntDocName, 
                        dbo.ProviderMaster.LastName + ', ' + dbo.ProviderMaster.FirstName AS [mpdb-DocName], dbo.tblCnt.CntLawsonNumber AS LawsonID, 
                        dbo.tblCnt.CntSSN, dbo.tblCmp.CmpName AS CmpSiteName, dbo.ProviderMaster.PartnershipLevel AS [mpdb-PartnershipLevel], 
                        dbo.ProviderMaster.EchoPartnershipLevelCode AS [mpbd-EchoPartnershipLevelCode], 
                        dbo.ProviderMaster.PartnershipLevelDate AS [mpbd-PartnershipLevelDate], 
                        dbo.ProviderMaster.PartnershipLevelCode AS [mpbd-PartnershipLevelCode], dbo.ProviderMaster.DateOfBirth AS [mpbd-DateOfBirth], 
                        dbo.ProviderMaster.DateOfHire AS [mpbd-DateOfHire], dbo.ProviderMaster.WebID AS [mpbd-WebID], 
                        dbo.ProviderMaster.CeridianFlxID AS [mpbd-CeridianFlxID], dbo.ProviderMaster.CeridianClockNbr AS [mpbd-CeridianClockNbr], 
                        dbo.ProviderMaster.ProviderMasterID AS [mpbd-ProviderMasterID], dbo.ProviderMaster.SSNFormatted AS [mpbd-SSNFormatted], 
                        dbo.ProviderMaster.SiteLineCntID AS [mpbd-SiteLineCntID], dbo.tblCtr.Ctr_CtrTypID, dbo.tblCtr.Ctr_RgnID, dbo.tblCtr.CtrPhyGrp_CmpID, 
                        dbo.tblCtr.CtrSameStoreYN, dbo.tblCtr.CtrDivision, dbo.tblCtr.CtrTIN AS [CtrLawsonAcctUnit(TIN)], dbo.tblCtr.CtrPASupportCostPct, 
                        dbo.tblCtr.CtrMisc5YN, dbo.tblCtr.CtrMisc4YN, dbo.tblCtr.CtrMisc3YN, dbo.tblCtr.CtrMisc2YN, dbo.tblCtr.CtrMisc1YN, dbo.tblRgn.RgnName, 
                        dbo.tblCtr.CtrSite_CmpID, tblCmp_2.CmpName AS PhysicianGroup, dbo.tblCnt.CntNameLast, dbo.tblTempPay.*, YEAR(dbo.tblTempPay.PayMonth) 
                        AS PayYear, dbo.tblCnt.CntID, dbo.ProviderMaster.Gender AS [mpdb-Gender], dbo.tlkpPayCode.PayCodeName AS [Name(PayCode)], 
                        dbo.tlkpPayCode.PayCodeDesc AS [Desc(PayCode)], dbo.tlkpPayCode.PayCodeSitelineClass AS [SiteLineClass(PayCode)], 
                        dbo.tlkpPayCode.PayCodeCompany AS [Company(PayCode)], dbo.tlkpPayCode.PayCodeFinStmnt AS [FinStmnt(PayCode)], 
                        dbo.tlkpPayCode.PayCodeLawsonGLDept AS [LawsonGLDept(PayCode)], 
                        dbo.tlkpPayCode.PayCodeLawsonDeptName AS [LawsonDeptName(PayCode)], dbo.tlkpPayCode.PayCodeSummaryPayType AS [Summary(PayCode)], 
                        dbo.tlkpLawsonGLCOA.LawsonGLActDesc AS [LawsonGLActDescrip(Account3)], 
                        dbo.tlkpLawsonGLCOA.SummaryGLClass AS [LawsonGLActSummaryGroup(Account3)], dbo.tblCnt.CntCorpName, 
                        dbo.ProviderMaster.LastName AS [mpbd-LastName], dbo.ProviderMaster.FirstName AS [mpbd-FirstName], dbo.ProviderMaster.Title AS [mpbd-Title], 
                        dbo.ProviderMaster.CEPEmailAddress AS [mpbd-CEPEmailAddress]
FROM          dbo.ProviderMaster RIGHT OUTER JOIN
                        dbo.tblCnt RIGHT OUTER JOIN
                        dbo.tlkpPayCode RIGHT OUTER JOIN
                        dbo.tblRgn RIGHT OUTER JOIN
                        dbo.tblCmp tblCmp_2 RIGHT OUTER JOIN
                        dbo.tblCmp RIGHT OUTER JOIN
                        dbo.tblCtr RIGHT OUTER JOIN
                        dbo.tblTempPay ON dbo.tblCtr.CtrTIN = dbo.tblTempPay.PayAccountUnit ON dbo.tblCmp.CmpID = dbo.tblCtr.CtrSite_CmpID ON 
                        tblCmp_2.CmpID = dbo.tblCtr.CtrPhyGrp_CmpID ON dbo.tblRgn.RgnID = dbo.tblCtr.Ctr_RgnID LEFT OUTER JOIN
                        dbo.tlkpLawsonGLCOA ON dbo.tblTempPay.PayAccount3 = dbo.tlkpLawsonGLCOA.LawsonGLAct ON 
                        dbo.tlkpPayCode.PayCodeName = dbo.tblTempPay.PayPayCode ON dbo.tblCnt.CntID = dbo.tblTempPay.Pay_CntID ON 
                        dbo.ProviderMaster.SiteLineCntID = dbo.tblCnt.CntID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[70] 4[30] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[75] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 8
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -9
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ProviderMaster (dbo)"
            Begin Extent = 
               Top = 48
               Left = 1101
               Bottom = 652
               Right = 1409
            End
            DisplayFlags = 280
            TopColumn = 21
         End
         Begin Table = "tblCnt (dbo)"
            Begin Extent = 
               Top = 32
               Left = 907
               Bottom = 529
               Right = 1068
            End
            DisplayFlags = 280
            TopColumn = 28
         End
         Begin Table = "tlkpPayCode (dbo)"
            Begin Extent = 
               Top = 33
               Left = 446
               Bottom = 263
               Right = 655
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblRgn (dbo)"
            Begin Extent = 
               Top = 440
               Left = 13
               Bottom = 607
               Right = 168
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp_2"
            Begin Extent = 
               Top = 264
               Left = 10
               Bottom = 415
               Right = 166
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "tblCmp (dbo)"
            Begin Extent = 
               Top = 84
               Left = 20
               Bottom = 245
               Right = 174
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCtr (dbo)"
            Begin Extent = 
               Top = 75
               Left = 231
               Bottom = 606
               Right = 439
 ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'NewPayrollQuery';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'           End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "tblTempPay (dbo)"
            Begin Extent = 
               Top = 3
               Left = 684
               Bottom = 461
               Right = 869
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "tlkpLawsonGLCOA (dbo)"
            Begin Extent = 
               Top = 277
               Left = 450
               Bottom = 392
               Right = 631
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      RowHeights = 220
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 4125
         Alias = 3480
         Table = 2445
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'NewPayrollQuery';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'NewPayrollQuery';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'NewPayrollQuery';

