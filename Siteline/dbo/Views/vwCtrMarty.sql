CREATE VIEW dbo.vwCtrMarty
AS
SELECT      tblSiteCompanyName.CmpName, tblSiteCompanyName.CmpAddress1, tblSiteCompanyName.CmpAddress2, tblSiteCompanyName.CmpState, 
                        tblSiteCompanyName.CmpCity, tblSiteCompanyName.CmpZip, tblRegionName.RgnName, tblHealthSystemName.CmpName AS tblCmpSystem, 
                        tblBillimgCompanyName.CmpName AS tblCmpBillingAgent, tblPhysicianGroupName.CmpName AS tblCmpPhysicianGroup, 
                        tblMPCompanyName.CmpName AS tblCmpMalpracticeCompany, tblMDName.CntNameFirst + ' ' + tblMDName.CntNameLast AS tblCntMD, 
                        tblRDName.CntNameFirst + ' ' + tblRDName.CntNameLast AS tblCntRD, dbo.tblCtr.CtrMisc1YN AS tblCtrMisc1, dbo.tblCtr.CtrMisc2YN AS tblCtrMisc2, 
                        dbo.tblCtr.CtrMisc3YN AS tblCtrMisc3, dbo.tblCtr.CtrMisc4YN AS tblCtrMisc4, dbo.tblCtr.CtrMisc5YN AS tblCtrMisc5, 
                        dbo.tblCtr.CtrDivision AS tblCtrDivision, dbo.tblCtr.CtrTIN AS [tblCtrLawsonID(TIN)], dbo.tblBdg.*, dbo.tblCtr.CtrID AS Expr1, 
                        dbo.tblCtr.CtrSite_CmpID AS Expr2, dbo.tblCtr.CtrSys_CmpID AS Expr3, dbo.tblCtr.CtrBillAgt_CmpID AS Expr4, dbo.tblCtr.CtrPhyGrp_CmpID AS Expr5, 
                        dbo.tblCtr.CtrMlp_CmpID AS Expr6, dbo.tblCtr.CtrBillCmpIDNum AS Expr7, dbo.tblCtr.CtrMedDir_CntID AS Expr8, 
                        dbo.tblCtr.CtrCamAssigned_CntID AS Expr9, dbo.tblCtr.Ctr_CtrTypID AS Expr10, dbo.tblCtr.Ctr_RgnID AS Expr11, dbo.tblCtr.Ctr_MlpRgnID AS Expr12, 
                        dbo.tblCtr.CtrKey AS Expr13, dbo.tblCtr.CtrHPID AS Expr14, dbo.tblCtr.CtrPlatinumID AS Expr15, dbo.tblCtr.CtrDateStart AS Expr16, 
                        dbo.tblCtr.CtrDateEffect AS Expr17, dbo.tblCtr.CtrDateEnd AS Expr18, dbo.tblCtr.CtrSameStoreYN AS Expr19, dbo.tblCtr.CtrInactiveYn AS Expr20, 
                        tblRegionName.RgnDir_CntID AS tblRgnRDCntID, dbo.tblCtr.*
FROM          dbo.tblBdg RIGHT OUTER JOIN
                        dbo.tblCmp tblSiteCompanyName INNER JOIN
                        dbo.tblCtr ON tblSiteCompanyName.CmpID = dbo.tblCtr.CtrSite_CmpID ON dbo.tblBdg.Bdg_CtrID = dbo.tblCtr.CtrID LEFT OUTER JOIN
                        dbo.tblRgn tblRegionName LEFT OUTER JOIN
                        dbo.tblCnt tblRDName ON tblRegionName.RgnDir_CntID = tblRDName.CntID ON dbo.tblCtr.Ctr_RgnID = tblRegionName.RgnID LEFT OUTER JOIN
                        dbo.tblCnt tblMDName ON dbo.tblCtr.CtrMedDir_CntID = tblMDName.CntID LEFT OUTER JOIN
                        dbo.tblCmp tblMPCompanyName ON dbo.tblCtr.CtrMlp_CmpID = tblMPCompanyName.CmpID LEFT OUTER JOIN
                        dbo.tblCmp tblPhysicianGroupName ON dbo.tblCtr.CtrPhyGrp_CmpID = tblPhysicianGroupName.CmpID LEFT OUTER JOIN
                        dbo.tblCmp tblBillimgCompanyName ON dbo.tblCtr.CtrBillAgt_CmpID = tblBillimgCompanyName.CmpID LEFT OUTER JOIN
                        dbo.tblCmp tblHealthSystemName ON dbo.tblCtr.CtrSys_CmpID = tblHealthSystemName.CmpID

GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Query of the Contract Table', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwCtrMarty';


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
         Begin Table = "tblBdg (dbo)"
            Begin Extent = 
               Top = 2
               Left = 8
               Bottom = 111
               Right = 270
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblSiteCompanyName"
            Begin Extent = 
               Top = 112
               Left = 91
               Bottom = 259
               Right = 269
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCtr (dbo)"
            Begin Extent = 
               Top = 13
               Left = 424
               Bottom = 596
               Right = 648
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblRegionName"
            Begin Extent = 
               Top = 320
               Left = 210
               Bottom = 520
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblRDName"
            Begin Extent = 
               Top = 397
               Left = 8
               Bottom = 505
               Right = 184
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblMDName"
            Begin Extent = 
               Top = 259
               Left = 5
               Bottom = 371
               Right = 181
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblMPCompanyName"
            Begin Extent = 
               Top = 256
               Left = 728
               Bottom = 364
               Right = 891
            ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwCtrMarty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblPhysicianGroupName"
            Begin Extent = 
               Top = 140
               Left = 791
               Bottom = 248
               Right = 954
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblBillimgCompanyName"
            Begin Extent = 
               Top = 61
               Left = 965
               Bottom = 211
               Right = 1128
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblHealthSystemName"
            Begin Extent = 
               Top = 0
               Left = 780
               Bottom = 108
               Right = 943
            End
            DisplayFlags = 280
            TopColumn = 1
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
         Column = 3435
         Alias = 2085
         Table = 2280
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1905
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwCtrMarty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwCtrMarty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwCtrMarty';

