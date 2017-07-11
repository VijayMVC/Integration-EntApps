CREATE VIEW dbo.vwCtrMarty2
AS
SELECT      tblCmp1.CmpName AS LocationName, tblCmp1.CmpAddress1 AS LocationAddress1, tblCmp1.CmpAddress2 AS LocationAddress2, 
                        tblCmp1.CmpState AS LocationState, tblCmp1.CmpCity AS LocationCity, tblCmp1.CmpZip AS LocationZip, dbo.tblRgn.RgnName AS Region, 
                        tblCmp2.CmpName AS System, tblCmp3.CmpName AS TranscriptCompany, tblCmp4.CmpName AS BillingAgent, 
                        tblCmp5.CmpName AS PhysicianGroup, tblCmp6.CmpName AS MalpracticeCompany, tblCmp1.CmpPhone AS LocationPhone, 
                        tblCmp1.CmpFax AS LocationFax, tblCnt2.CntNameFirst + ' ' + tblCnt2.CntNameLast AS PLDir, 
                        tblCnt1.CntNameFirst + ' ' + tblCnt1.CntNameLast AS MDir, tblCnt3.CntNameFirst + ' ' + tblCnt3.CntNameLast AS RDir, 
                        dbo.tblCtr.CtrTrmCtrYN AS TraumaCenterFlag, dbo.tblCtr.CtrSameStoreYN AS SameStoreFlag, dbo.tblCtr.CtrBedQty AS Beds, 
                        dbo.tblCtr.CtrInactiveYn AS ActiveContractYN, dbo.tblCtr.CtrTraumaDesignation AS TraumaDesignation, dbo.tblCtr.CtrMisc1YN AS Misc1, 
                        dbo.tblCtr.CtrMisc2YN AS Misc2, dbo.tblCtr.CtrMisc3YN AS Misc3, dbo.tblCtr.CtrMisc4YN AS Misc4, dbo.tblCtr.CtrMisc5YN AS Misc5, 
                        dbo.tblCtr.CtrSysCtrYN AS CurrentContractYN, dbo.tblCtr.CtrDivision AS Expr1, dbo.tblCtr.CtrTIN AS Expr2, dbo.tblCtr.CtrHPID AS Expr3, 
                        dbo.tblCtr.CtrPlatinumID AS Expr4, dbo.tblCtr.CtrDateStart AS Expr5, dbo.tblCtr.CtrDateEffect AS Expr6, dbo.tblCtr.Ctr_CtrTypID AS Expr7, dbo.tblBdg.*, 
                        dbo.tblCtr.*, tblCmp1.CmpID AS LocationID, dbo.SiteIntegration.*
FROM          dbo.tlkpMlpRgn RIGHT OUTER JOIN
                        dbo.tblCmp tblCmp1 RIGHT OUTER JOIN
                        dbo.tblCtr ON tblCmp1.CmpID = dbo.tblCtr.CtrSite_CmpID ON dbo.tlkpMlpRgn.MlpRgnID = dbo.tblCtr.Ctr_MlpRgnID LEFT OUTER JOIN
                        dbo.tblCnt tblCnt2 ON dbo.tblCtr.CtrCamAssigned_CntID = tblCnt2.CntID LEFT OUTER JOIN
                        dbo.tblCnt tblCnt4 RIGHT OUTER JOIN
                        dbo.tblRgn ON tblCnt4.CntID = dbo.tblRgn.RgnDirAss_CntID LEFT OUTER JOIN
                        dbo.tblCnt tblCnt3 ON dbo.tblRgn.RgnDir_CntID = tblCnt3.CntID ON dbo.tblCtr.Ctr_RgnID = dbo.tblRgn.RgnID LEFT OUTER JOIN
                        dbo.tblCnt tblCnt1 ON dbo.tblCtr.CtrMedDir_CntID = tblCnt1.CntID LEFT OUTER JOIN
                        dbo.tblCmp tblCmp6 ON dbo.tblCtr.CtrMlp_CmpID = tblCmp6.CmpID LEFT OUTER JOIN
                        dbo.tblCmp tblCmp5 ON dbo.tblCtr.CtrPhyGrp_CmpID = tblCmp5.CmpID LEFT OUTER JOIN
                        dbo.tblCmp tblCmp4 ON dbo.tblCtr.CtrBillAgt_CmpID = tblCmp4.CmpID LEFT OUTER JOIN
                        dbo.tblCmp tblCmp3 ON dbo.tblCtr.CtrTranscript_CmpID = tblCmp3.CmpID LEFT OUTER JOIN
                        dbo.tblCmp tblCmp2 ON dbo.tblCtr.CtrSys_CmpID = tblCmp2.CmpID LEFT OUTER JOIN
                        dbo.SiteIntegration ON dbo.tblCtr.CtrID = dbo.SiteIntegration.SiteLineID LEFT OUTER JOIN
                        dbo.tblBdg ON dbo.tblCtr.CtrID = dbo.tblBdg.Bdg_CtrID

GO
EXECUTE sp_addextendedproperty @name = N'MS_AlternateBackThemeColorIndex', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwCtrMarty2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DatasheetForeThemeColorIndex', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwCtrMarty2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DatasheetGridlinesThemeColorIndex', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwCtrMarty2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DefaultView', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwCtrMarty2';


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
         Configuration = "(H (1[82] 4) )"
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
         Left = -91
      End
      Begin Tables = 
         Begin Table = "tlkpMlpRgn (dbo)"
            Begin Extent = 
               Top = 422
               Left = 21
               Bottom = 498
               Right = 174
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp1"
            Begin Extent = 
               Top = 493
               Left = 2
               Bottom = 694
               Right = 250
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCtr (dbo)"
            Begin Extent = 
               Top = 35
               Left = 749
               Bottom = 395
               Right = 981
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCnt2"
            Begin Extent = 
               Top = 260
               Left = 983
               Bottom = 813
               Right = 1162
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCnt4"
            Begin Extent = 
               Top = 339
               Left = 1318
               Bottom = 392
               Right = 1497
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblRgn (dbo)"
            Begin Extent = 
               Top = 117
               Left = 1318
               Bottom = 223
               Right = 1483
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCnt3"
            Begin Extent = 
               Top = 400
               Left = 1333
               Bottom = 506
               Right = 1512
            End
 ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwCtrMarty2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'           DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCnt1"
            Begin Extent = 
               Top = 416
               Left = 0
               Bottom = 696
               Right = 179
            End
            DisplayFlags = 280
            TopColumn = 42
         End
         Begin Table = "tblCmp6"
            Begin Extent = 
               Top = 562
               Left = 483
               Bottom = 724
               Right = 722
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp5"
            Begin Extent = 
               Top = 557
               Left = 139
               Bottom = 719
               Right = 378
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp4"
            Begin Extent = 
               Top = 574
               Left = 777
               Bottom = 680
               Right = 1016
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp3"
            Begin Extent = 
               Top = 543
               Left = 1026
               Bottom = 649
               Right = 1265
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp2"
            Begin Extent = 
               Top = 515
               Left = 1271
               Bottom = 621
               Right = 1510
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SiteIntegration (dbo)"
            Begin Extent = 
               Top = 89
               Left = 1150
               Bottom = 587
               Right = 1317
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblBdg (dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 360
               Right = 288
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
         Column = 4845
         Alias = 1725
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwCtrMarty2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwCtrMarty2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Filter', @value = NULL, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwCtrMarty2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_FilterOnLoad', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwCtrMarty2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_HideNewField', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwCtrMarty2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderBy', @value = N'[vwCtrMarty2].[BdgYear] DESC', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwCtrMarty2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderByOn', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwCtrMarty2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderByOnLoad', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwCtrMarty2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwCtrMarty2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TableMaxRecords', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwCtrMarty2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ThemeFontIndex', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwCtrMarty2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TotalsRow', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwCtrMarty2';

