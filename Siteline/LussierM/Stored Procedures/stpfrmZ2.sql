CREATE PROCEDURE LussierM.stpfrmZ2(@CmpID int)
AS SELECT     dbo.tblMngCar.MngCar_LivTypID, dbo.tlkpLiv.LivTypName, dbo.tblMngCar.MngCarEffectDate, dbo.tlkpMcCtrTyp.McCtrTypName, 
                      dbo.tblMngCar.MngCarIPA_CmpID, dbo.tblMngCar.MngCarTerminateDate, dbo.tblMngCar.MngCarRateExpireDate, dbo.tblMngCar.MngCarCID, 
                      dbo.tblMngCar.MngCarID
FROM         dbo.tblMngCar INNER JOIN
                      dbo.tlkpLiv ON dbo.tblMngCar.MngCar_LivTypID = dbo.tlkpLiv.LivTypID INNER JOIN
                      dbo.tlkpMcCtrTyp ON dbo.tblMngCar.MngCar_McCtrTypID = dbo.tlkpMcCtrTyp.McCtrTypID
WHERE     (dbo.tblMngCar.MngCarIPA_CmpID = @CmpID)
ORDER BY dbo.tlkpLiv.LivTypName, dbo.tblMngCar.MngCarEffectDate, dbo.tblMngCar.MngCarRateExpireDate
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
               Bottom = 289
               Right = 273
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tlkpLiv (dbo)"
            Begin Extent = 
               Top = 6
               Left = 311
               Bottom = 99
               Right = 467
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tlkpMcCtrTyp (dbo)"
            Begin Extent = 
               Top = 6
               Left = 505
               Bottom = 99
               Right = 676
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
         Column = 3210
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
', @level0type = N'SCHEMA', @level0name = N'LussierM', @level1type = N'PROCEDURE', @level1name = N'stpfrmZ2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'LussierM', @level1type = N'PROCEDURE', @level1name = N'stpfrmZ2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'LussierM', @level1type = N'PROCEDURE', @level1name = N'stpfrmZ2';

