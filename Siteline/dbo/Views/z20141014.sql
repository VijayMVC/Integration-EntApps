CREATE VIEW dbo.z20141014
AS
SELECT      jagardg.z2015BudgetImport.Doc, dbo.tblBdg.BdgDocHours, jagardg.z2015BudgetImport.PAs, dbo.tblBdg.BdgPAHours, 
                        jagardg.z2015BudgetImport.[PA Cost Hr], dbo.tblBdg.BdgPACostHr, jagardg.z2015BudgetImport.[Admin Cost], dbo.tblBdg.BdgBillSpec, 
                        jagardg.z2015BudgetImport.Local, dbo.tblBdg.BdgLclExp, jagardg.z2015BudgetImport.Stipends, dbo.tblBdg.BdgStipendsRcvd, 
                        jagardg.z2015BudgetImport.[Other Receipts], dbo.tblBdg.BdgOthRcpts, jagardg.z2015BudgetImport.Donations, dbo.tblBdg.BdgDonations, 
                        jagardg.z2015BudgetImport.OTT, dbo.tblBdg.BdgOffTop, jagardg.z2015BudgetImport.[Avg Charge], dbo.tblBdg.BdgAvgChgPt, 
                        jagardg.z2015BudgetImport.[Coll Rate], dbo.tblBdg.BdgTargetRate, jagardg.z2015BudgetImport.Volume, dbo.tblBdg.BdgPatients, 
                        jagardg.z2015BudgetImport.Encounters, dbo.tblBdg.BdgEncounters, jagardg.z2015BudgetImport.MDpct, dbo.tblBdg.BdgMDpct, 
                        jagardg.z2015BudgetImport.BillRate, dbo.tblBdg.BdgBillRate, jagardg.z2015BudgetImport.PITpct, dbo.tblBdg.BdgPITpct, 
                        jagardg.z2015BudgetImport.RDpct, dbo.tblBdg.BdgRDpct, jagardg.z2015BudgetImport.MPRate, dbo.tblBdg.BdgMPRate, 
                        jagardg.z2015BudgetImport.ContribPct, dbo.tblBdg.BdgContribPct, jagardg.z2015BudgetImport.IntRate, dbo.tblBdg.BdgInterestRate, 
                        jagardg.z2015BudgetImport.CEPSurchargeRetention, dbo.tblBdg.BdgCEPRetentionPct, jagardg.z2015BudgetImport.[MP Flat Fee Annual amount], 
                        dbo.tblBdg.BdgMPFlatFeeAmt
FROM          dbo.tblBdg INNER JOIN
                        dbo.tblCtr ON dbo.tblBdg.Bdg_CtrID = dbo.tblCtr.CtrID INNER JOIN
                        jagardg.z2015BudgetImport ON dbo.tblCtr.CtrTIN = jagardg.z2015BudgetImport.CtrTIN
WHERE      (dbo.tblBdg.BdgYear = 2015)

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
         Configuration = "(H (1 [56] 4 [18] 2))"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[63] 4) )"
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
      ActivePaneConfig = 9
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblBdg (dbo)"
            Begin Extent = 
               Top = 7
               Left = 328
               Bottom = 246
               Right = 534
            End
            DisplayFlags = 280
            TopColumn = 22
         End
         Begin Table = "tblCtr (dbo)"
            Begin Extent = 
               Top = 68
               Left = 803
               Bottom = 306
               Right = 1044
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "z2015BudgetImport"
            Begin Extent = 
               Top = 0
               Left = 47
               Bottom = 335
               Right = 276
            End
            DisplayFlags = 280
            TopColumn = 7
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      RowHeights = 220
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'z20141014';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'z20141014';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'z20141014';

