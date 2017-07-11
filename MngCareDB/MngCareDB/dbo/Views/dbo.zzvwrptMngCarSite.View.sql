USE [MngCarDB]
GO
/****** Object:  View [dbo].[zzvwrptMngCarSite]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[zzvwrptMngCarSite]
AS
SELECT DISTINCT 
                        dbo.tlkpLiv.LivTypName, dbo.tblCtr.CtrKey, dbo.tblCtr.CtrID, dbo.tblMngCar.MngCarKey, dbo.tblMngCar.MngCarEffectDate, 
                        dbo.tblMngCar.MngCarTerminateDate, dbo.tblMngCar.MngCarRateExpireDate, dbo.tblMngCar.MngCarAnniversaryDate, dbo.tblMngCar.MngCarCID, 
                        dbo.tblMngCar.MngCarSpecialty, dbo.tblMngCar.MngCar_LivTypID, dbo.tblMngCar.MngCarNoticeDate, dbo.tblMngCar.MngCarReviewDate, 
                        dbo.tblMngCar.MngCarAlternativeName, dbo.tblMngCar.MngCar_MngCarRgnID
FROM          dbo.tblMngCar INNER JOIN
                        dbo.tlkpLiv ON dbo.tblMngCar.MngCar_LivTypID = dbo.tlkpLiv.LivTypID INNER JOIN
                        dbo.tblMngCarCtr ON dbo.tblMngCar.MngCarID = dbo.tblMngCarCtr.MngCarCtr_MngCarID INNER JOIN
                        dbo.tblCtr ON dbo.tblMngCarCtr.MngCarCtr_CtrID = dbo.tblCtr.CtrID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
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
      ActivePaneConfig = 9
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblMngCar"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 254
               Right = 289
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tlkpLiv"
            Begin Extent = 
               Top = 7
               Left = 441
               Bottom = 101
               Right = 599
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblMngCarCtr"
            Begin Extent = 
               Top = 102
               Left = 515
               Bottom = 211
               Right = 707
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "tblCtr"
            Begin Extent = 
               Top = 348
               Left = 38
               Bottom = 457
               Right = 271
            End
            DisplayFlags = 280
            TopColumn = 0
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'zzvwrptMngCarSite'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'zzvwrptMngCarSite'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'zzvwrptMngCarSite'
GO
