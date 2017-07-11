CREATE VIEW dbo.[zvwBdg_160217]
AS
SELECT      tblCnt3.CntID AS Expr3, dbo.tblCtr.*, tblCmp6.CmpName AS Expr1, tblCmp1.CmpName AS Site, tblCmp2.CmpName AS System, 
                        tblCmp3.CmpName AS TranscriptCompany, tblCmp4.CmpName AS BillingAgent, tblCmp5.CmpName AS PhysicianGroup, 
                        tblCmp6.CmpName AS MalpracticeCompany, tblCnt4.CntKey AS Expr2, tblCnt1.CntKey AS MedicalDirector, tblCnt2.CntKey AS CAM, 
                        tblCnt3.CntKey AS RegionalDirector, tblCnt4.CntKey AS AssistantDirector, tblCmp1.CmpCity AS SiteCity, tblCmp1.CmpState AS SiteState, 
                        tblCmp1.CmpZip AS SiteZip, dbo.tblRgn.RgnName AS RgnName, tblCnt2.CntTitle AS CAMTitle, tblCnt2.CntPhonePref AS CAMPhone, dbo.tblBdg.*
FROM          dbo.tblBdg LEFT OUTER JOIN
                        dbo.tblCmp tblCmp1 INNER JOIN
                        dbo.tblCtr ON tblCmp1.CmpID = dbo.tblCtr.CtrSite_CmpID ON dbo.tblBdg.Bdg_CtrID = dbo.tblCtr.CtrID LEFT OUTER JOIN
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
         Configuration = "(H (1[47] 4) )"
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
               Top = 6
               Left = 38
               Bottom = 114
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp1"
            Begin Extent = 
               Top = 3
               Left = 583
               Bottom = 170
               Right = 760
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCtr (dbo)"
            Begin Extent = 
               Top = 14
               Left = 327
               Bottom = 381
               Right = 579
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCnt2"
            Begin Extent = 
               Top = 170
               Left = 715
               Bottom = 278
               Right = 891
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCnt4"
            Begin Extent = 
               Top = 395
               Left = 897
               Bottom = 503
               Right = 1073
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblRgn (dbo)"
            Begin Extent = 
               Top = 288
               Left = 616
               Bottom = 396
               Right = 779
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCnt3"
            Begin Extent = 
               Top = 273
               Left = 912
               Bottom = 381
               Right = 1088
            End
            Di', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'zvwBdg_160217';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'splayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCnt1"
            Begin Extent = 
               Top = 142
               Left = 909
               Bottom = 250
               Right = 1085
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp6"
            Begin Extent = 
               Top = 573
               Left = 130
               Bottom = 681
               Right = 293
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp5"
            Begin Extent = 
               Top = 22
               Left = 909
               Bottom = 130
               Right = 1072
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp4"
            Begin Extent = 
               Top = 448
               Left = 44
               Bottom = 556
               Right = 207
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp3"
            Begin Extent = 
               Top = 278
               Left = 35
               Bottom = 444
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp2"
            Begin Extent = 
               Top = 145
               Left = 45
               Bottom = 253
               Right = 208
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'zvwBdg_160217';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'zvwBdg_160217';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'zvwBdg_160217';

