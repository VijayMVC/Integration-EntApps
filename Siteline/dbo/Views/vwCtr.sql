CREATE VIEW dbo.vwCtr
AS
SELECT     tblCnt3.CntID AS Expr3, dbo.tblCtr.*, tblCmp6.CmpName AS Expr1, tblCmp1.CmpName AS Site, tblCmp2.CmpName AS System, 
                      tblCmp3.CmpName AS TranscriptCompany, tblCmp4.CmpName AS BillingAgent, tblCmp5.CmpName AS PhysicianGroup, 
                      tblCmp6.CmpName AS MalpracticeCompany, tblCnt4.CntKey AS Expr2, tblCnt1.CntKey AS MedicalDirector, tblCnt2.CntKey AS CAM, 
                      tblCnt3.CntKey AS RegionalDirector, tblCnt4.CntKey AS AssistantDirector, tblCmp1.CmpCity AS SiteCity, tblCmp1.CmpState AS SiteState, 
                      tblCmp1.CmpZip AS SiteZip, dbo.tblRgn.RgnName AS RgnName, tblCnt2.CntTitle AS CAMTitle, tblCnt2.CntPhonePref AS CAMPhone, 
                      tblCmp1.CmpAddress1 AS SiteAddress1, tblCmp1.CmpAddress2 AS SiteAddress2, tblCmp1.CmpPhone AS SitePhone, tblCmp1.CmpFax AS SiteFax, 
                      dbo.tlkpMlpRgn.MlpRgnID AS MlpRgnID, dbo.tlkpMlpRgn.MlpRgnRate AS MlpRgnRate
FROM         dbo.tlkpMlpRgn RIGHT OUTER JOIN
                      dbo.tblCmp tblCmp1 INNER JOIN
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
                      dbo.tblCmp tblCmp2 ON dbo.tblCtr.CtrSys_CmpID = tblCmp2.CmpID

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
         Begin Table = "tlkpMlpRgn (dbo)"
            Begin Extent = 
               Top = 335
               Left = 889
               Bottom = 432
               Right = 1067
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp1"
            Begin Extent = 
               Top = 0
               Left = 267
               Bottom = 108
               Right = 430
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCtr (dbo)"
            Begin Extent = 
               Top = 115
               Left = 614
               Bottom = 525
               Right = 838
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCnt2"
            Begin Extent = 
               Top = 208
               Left = 890
               Bottom = 316
               Right = 1066
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCnt4"
            Begin Extent = 
               Top = 497
               Left = 23
               Bottom = 605
               Right = 199
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblRgn (dbo)"
            Begin Extent = 
               Top = 463
               Left = 256
               Bottom = 571
               Right = 419
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCnt3"
            Begin Extent = 
               Top = 369
               Left = 1
               Bottom = 477
               Right = 177
            End
         ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwCtr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'   DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCnt1"
            Begin Extent = 
               Top = 331
               Left = 301
               Bottom = 439
               Right = 477
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp6"
            Begin Extent = 
               Top = 25
               Left = 887
               Bottom = 206
               Right = 1066
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp5"
            Begin Extent = 
               Top = 237
               Left = 48
               Bottom = 345
               Right = 211
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp4"
            Begin Extent = 
               Top = 121
               Left = 0
               Bottom = 229
               Right = 163
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp3"
            Begin Extent = 
               Top = 116
               Left = 173
               Bottom = 224
               Right = 336
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp2"
            Begin Extent = 
               Top = 0
               Left = 92
               Bottom = 108
               Right = 255
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
         Alias = 2145
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwCtr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwCtr';

