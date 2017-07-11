CREATE VIEW dbo.vwIPAMngCar
AS
SELECT DISTINCT 
                      TOP 100 PERCENT dbo.tlkpLiv.LivTypName, dbo.tblMngCar.MngCarIPA_CmpID AS IPAID, dbo.tblCtr.CtrSite_CmpID AS SiteID, dbo.tblMngCar.MngCarID, 
                      dbo.tblMngCar.MngCarEffectDate, dbo.tblMngCar.MngCarInactiveYN
FROM         dbo.tblMngCar INNER JOIN
                      dbo.tblCmp ON dbo.tblMngCar.MngCarIPA_CmpID = dbo.tblCmp.CmpID INNER JOIN
                      dbo.tblCtr ON dbo.tblMngCar.MngCar_CtrID = dbo.tblCtr.CtrID INNER JOIN
                      dbo.tblCmp tblCmp_1 ON dbo.tblCtr.CtrSite_CmpID = tblCmp_1.CmpID INNER JOIN
                      dbo.tlkpLiv ON dbo.tblMngCar.MngCar_LivTypID = dbo.tlkpLiv.LivTypID
ORDER BY dbo.tlkpLiv.LivTypName

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
         Configuration = "(H (1[56] 4[18] 2) )"
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
         Begin Table = "tblMngCar (dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 273
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp (dbo)"
            Begin Extent = 
               Top = 6
               Left = 311
               Bottom = 114
               Right = 474
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCtr (dbo)"
            Begin Extent = 
               Top = 114
               Left = 38
               Bottom = 222
               Right = 262
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp_1"
            Begin Extent = 
               Top = 114
               Left = 300
               Bottom = 222
               Right = 463
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tlkpLiv (dbo)"
            Begin Extent = 
               Top = 222
               Left = 38
               Bottom = 315
               Right = 194
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
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filte', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwIPAMngCar';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'r = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwIPAMngCar';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwIPAMngCar';

