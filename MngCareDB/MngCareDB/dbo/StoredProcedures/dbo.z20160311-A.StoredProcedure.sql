USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[z20160311-A]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[z20160311-A]
AS SELECT DISTINCT 
                        '94-2494000' AS TIN, dbo.tblMngCar.MngCarKey AS ContractName, dbo.tblMngCar.MngCarID AS RecordNo, dbo.tblCmp.CmpName AS PHO, 
                        tblCmp_1.CmpName AS MSO, dbo.tblMngCar.MngCarContractType AS Scope, dbo.tblMngCar.MngCarSpecialty AS Type, 
                        dbo.tblMngCar.MngCarSpecialty2 AS Specialty, dbo.tlkpLiv.LivTypName AS LOB, dbo.tblMngCar.MngCarEffectDate AS Effective, 
                        dbo.tblMngCar.MngCarTerminateDate AS Terminate
FROM          dbo.tblCmp RIGHT OUTER JOIN
                        dbo.tblCmp tblCmp_2 RIGHT OUTER JOIN
                        dbo.tblCtr INNER JOIN
                        dbo.tblMngCarCtr ON dbo.tblCtr.CtrID = dbo.tblMngCarCtr.MngCarCtr_CtrID INNER JOIN
                        dbo.tblMngCar ON dbo.tblMngCarCtr.MngCarCtr_MngCarID = dbo.tblMngCar.MngCarID ON tblCmp_2.CmpID = dbo.tblMngCar.MngCarIPA_CmpID ON 
                        dbo.tblCmp.CmpID = dbo.tblMngCar.MngCarPHO_CmpID AND dbo.tblCmp.CmpID = dbo.tblMngCar.MngCarPHO_CmpID LEFT OUTER JOIN
                        dbo.tblCmp tblCmp_1 ON dbo.tblMngCar.MngCarMSO_CmpID = tblCmp_1.CmpID LEFT OUTER JOIN
                        dbo.tlkpLiv ON dbo.tblMngCar.MngCar_LivTypID = dbo.tlkpLiv.LivTypID
WHERE      (dbo.tblCtr.CtrID IN
                            (SELECT DISTINCT Box33_CtrID
                              FROM           dbo.tblBox33
                              WHERE       (Box33TaxID = '94-2494000'))) AND (dbo.tblMngCar.MngCarContractedYN = 1)
ORDER BY dbo.tblMngCar.MngCarKey
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AlternateBackThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'z20160311-A'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DatasheetForeThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'z20160311-A'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DatasheetGridlinesThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'z20160311-A'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'z20160311-A'
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
         Begin Table = "tblCmp"
            Begin Extent = 
               Top = 273
               Left = 305
               Bottom = 379
               Right = 544
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp_2"
            Begin Extent = 
               Top = 12
               Left = 1125
               Bottom = 282
               Right = 1364
            End
            DisplayFlags = 280
            TopColumn = 73
         End
         Begin Table = "tblCtr"
            Begin Extent = 
               Top = 8
               Left = 415
               Bottom = 268
               Right = 647
            End
            DisplayFlags = 280
            TopColumn = 81
         End
         Begin Table = "tblMngCarCtr"
            Begin Extent = 
               Top = 14
               Left = 77
               Bottom = 225
               Right = 268
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblMngCar"
            Begin Extent = 
               Top = 14
               Left = 711
               Bottom = 291
               Right = 961
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp_1"
            Begin Extent = 
               Top = 364
               Left = 912
               Bottom = 470
               Right = 1151
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tlkpLiv"
            Begin Extent = 
               Top = 88
               Left = 1154
               Bottom = 179
               Right = 1311
            End
            Display' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'z20160311-A'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'Flags = 280
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
         Column = 3390
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'z20160311-A'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'z20160311-A'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'z20160311-A'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'z20160311-A'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'z20160311-A'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'z20160311-A'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'z20160311-A'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'z20160311-A'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'z20160311-A'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'z20160311-A'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ThemeFontIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'z20160311-A'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'z20160311-A'
GO
