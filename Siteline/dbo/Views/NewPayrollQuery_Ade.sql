CREATE VIEW dbo.NewPayrollQuery_Ade
AS
SELECT DISTINCT 
                        dbo.tblCnt.CntNameLast + ', ' + dbo.tblCnt.CntNameFirst AS CntDocName, 
                        dbo.ProviderMaster.LastName + ', ' + dbo.ProviderMaster.FirstName AS mpdbDocName, dbo.tblCnt.CntLbrFlxIDEb, dbo.tblCnt.CntCorpLbrFlxIDEb, 
                        dbo.tblCnt.CntLawsonNumber, dbo.tblCnt.CntSSN, dbo.tblCmp.CmpName AS CmpNameSite, 
                        dbo.ProviderMaster.PartnershipLevel AS mpdbPartnershipLevel, dbo.ProviderMaster.EchoPartnershipLevelCode AS mpbdEchoPartnershipLevelCode, 
                        dbo.ProviderMaster.PartnershipLevelDate AS mpbdPartnershipLevelDate, dbo.ProviderMaster.PartnershipLevelCode AS mpbdPartnershipLevelCode, 
                        dbo.ProviderMaster.DateOfBirth AS mpbdDateOfBirth, dbo.ProviderMaster.DateOfHire AS mpbdDateOfHire, 
                        dbo.ProviderMaster.WebID AS mpbdWebID, dbo.ProviderMaster.CeridianFlxID AS mpbdCeridianFlxID, 
                        dbo.ProviderMaster.CeridianClockNbr AS mpbdCeridianClockNbr, dbo.ProviderMaster.ProviderMasterID AS mpbdProviderMasterID, 
                        dbo.ProviderMaster.SSNFormatted AS mpbdSSNFormatted, dbo.ProviderMaster.SiteLineCntID AS mpbdSiteLineCntID, dbo.tblCtr.Ctr_CtrTypID, 
                        dbo.tblCtr.Ctr_RgnID, dbo.tblCtr.CtrHPID AS CtrMPID, dbo.tblCtr.CtrPlatinumID, dbo.tblCtr.CtrPhyGrp_CmpID, dbo.tblCtr.CtrSameStoreYN, 
                        dbo.tblCtr.CtrDivision, dbo.tblCtr.CtrTIN AS CtrLawsonID, dbo.tblCtr.CtrPASupportCostPct, dbo.tblCtr.CtrMisc5YN, dbo.tblCtr.CtrMisc4YN, 
                        dbo.tblCtr.CtrMisc3YN, dbo.tblCtr.CtrMisc2YN, dbo.tblCtr.CtrMisc1YN, dbo.tblRgn.RgnName, dbo.tblCtr.CtrSite_CmpID, 
                        tblCmp_2.CmpName AS CmpName2PhysGrp, dbo.tblCnt.CntNameLast, dbo.tlkpPayCode.*, dbo.tblTempPay_Ade.*, 
                        YEAR(dbo.tblTempPay_Ade.PayMonth) AS PayYear
FROM          dbo.tblCmp tblCmp_2 RIGHT OUTER JOIN
                        dbo.tblRgn RIGHT OUTER JOIN
                        dbo.tblCnt RIGHT OUTER JOIN
                        dbo.tlkpPayCode RIGHT OUTER JOIN
                        dbo.tblTempPay_Ade ON dbo.tlkpPayCode.PayCodeName = dbo.tblTempPay_Ade.PayPayCode ON 
                        dbo.tblCnt.CntID = dbo.tblTempPay_Ade.Pay_CntID LEFT OUTER JOIN
                        dbo.ProviderMaster ON dbo.tblCnt.CntID = dbo.ProviderMaster.SiteLineCntID LEFT OUTER JOIN
                        dbo.tblCtr ON dbo.tblTempPay_Ade.Pay_CtrID = dbo.tblCtr.CtrID ON dbo.tblRgn.RgnID = dbo.tblCtr.Ctr_RgnID ON 
                        tblCmp_2.CmpID = dbo.tblCtr.CtrPhyGrp_CmpID LEFT OUTER JOIN
                        dbo.tblCmp ON dbo.tblCtr.CtrSite_CmpID = dbo.tblCmp.CmpID

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
         Configuration = "(H (1[44] 4[9] 2) )"
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
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblCmp_2"
            Begin Extent = 
               Top = 173
               Left = 7
               Bottom = 324
               Right = 163
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "tblRgn (dbo)"
            Begin Extent = 
               Top = 327
               Left = 4
               Bottom = 471
               Right = 162
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCnt (dbo)"
            Begin Extent = 
               Top = 6
               Left = 1001
               Bottom = 484
               Right = 1162
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tlkpPayCode (dbo)"
            Begin Extent = 
               Top = 121
               Left = 803
               Bottom = 331
               Right = 968
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblTempPay_Ade (dbo)"
            Begin Extent = 
               Top = 6
               Left = 458
               Bottom = 114
               Right = 680
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProviderMaster (dbo)"
            Begin Extent = 
               Top = 56
               Left = 1272
               Bottom = 466
               Right = 1453
            End
            DisplayFlags = 280
            TopColumn = 28
         End
         Begin Table = "tblCtr (dbo)"
            Begin Extent = 
               Top = 0
               Left = 225
               Bottom = 478
               Right = 420', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'NewPayrollQuery_Ade';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp (dbo)"
            Begin Extent = 
               Top = 10
               Left = 8
               Bottom = 171
               Right = 162
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
         Column = 5445
         Alias = 2010
         Table = 1170
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'NewPayrollQuery_Ade';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'NewPayrollQuery_Ade';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'NewPayrollQuery_Ade';

