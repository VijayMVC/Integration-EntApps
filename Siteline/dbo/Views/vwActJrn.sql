CREATE VIEW dbo.vwActJrn
AS
SELECT     tblCnt3.CntID AS Expr3, dbo.tblCtr.*, tblCmp6.CmpName AS Expr1, tblCmp1.CmpName AS Site, tblCmp2.CmpName AS System, 
                      tblCmp3.CmpName AS TranscriptCompany, tblCmp4.CmpName AS BillingAgent, tblCmp5.CmpName AS PhysicianGroup, 
                      tblCmp6.CmpName AS MalpracticeCompany, tblCnt4.CntKey AS Expr2, tblCnt1.CntKey AS MedicalDirector, tblCnt2.CntKey AS CAM, 
                      tblCnt3.CntKey AS RegionalDirector, tblCnt4.CntKey AS AssistantDirector, tblCmp1.CmpCity AS SiteCity, tblCmp1.CmpState AS SiteState, 
                      tblCmp1.CmpZip AS SiteZip, dbo.tblRgn.RgnName AS RgnName, tblCnt2.CntTitle AS CAMTitle, tblCnt2.CntPhonePref AS CAMPhone, dbo.tblAct.*, 
                      DATEDIFF(y, dbo.tblActJrn.ActJrnDate, dbo.tblActJrn.ActJrnDateComplete) AS DaysOpen, dbo.tblActJrn.*, 
                      tblCnt5.CntMAMarketingYN AS CntMAMarketingYN, tblCnt5.CntCAMYN AS CntCAMYN
FROM         dbo.tblCnt tblCnt3 RIGHT OUTER JOIN
                      dbo.tblCnt tblCnt4 RIGHT OUTER JOIN
                      dbo.tblAct INNER JOIN
                      dbo.tblActJrn INNER JOIN
                      dbo.tblCtr ON dbo.tblActJrn.ActJrn_CtrID = dbo.tblCtr.CtrID ON dbo.tblAct.Act_ActJrnID = dbo.tblActJrn.ActJrnID LEFT OUTER JOIN
                      dbo.tblCnt tblCnt5 ON dbo.tblActJrn.ActJrn_CntID = tblCnt5.CntID LEFT OUTER JOIN
                      dbo.tblRgn ON dbo.tblCtr.Ctr_RgnID = dbo.tblRgn.RgnID LEFT OUTER JOIN
                      dbo.tblCnt tblCnt2 ON dbo.tblCtr.CtrCamAssigned_CntID = tblCnt2.CntID ON tblCnt4.CntID = dbo.tblRgn.RgnDirAss_CntID ON 
                      tblCnt3.CntID = dbo.tblRgn.RgnDir_CntID LEFT OUTER JOIN
                      dbo.tblCnt tblCnt1 ON dbo.tblCtr.CtrMedDir_CntID = tblCnt1.CntID LEFT OUTER JOIN
                      dbo.tblCmp tblCmp6 ON dbo.tblCtr.CtrMlp_CmpID = tblCmp6.CmpID LEFT OUTER JOIN
                      dbo.tblCmp tblCmp5 ON dbo.tblCtr.CtrPhyGrp_CmpID = tblCmp5.CmpID LEFT OUTER JOIN
                      dbo.tblCmp tblCmp4 ON dbo.tblCtr.CtrBillAgt_CmpID = tblCmp4.CmpID LEFT OUTER JOIN
                      dbo.tblCmp tblCmp3 ON dbo.tblCtr.CtrTranscript_CmpID = tblCmp3.CmpID LEFT OUTER JOIN
                      dbo.tblCmp tblCmp2 ON dbo.tblCtr.CtrSys_CmpID = tblCmp2.CmpID LEFT OUTER JOIN
                      dbo.tblCmp tblCmp1 ON dbo.tblCtr.CtrSite_CmpID = tblCmp1.CmpID

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
         Begin Table = "tblCnt3"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCnt4"
            Begin Extent = 
               Top = 6
               Left = 252
               Bottom = 114
               Right = 428
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblAct (dbo)"
            Begin Extent = 
               Top = 114
               Left = 38
               Bottom = 222
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblActJrn (dbo)"
            Begin Extent = 
               Top = 114
               Left = 227
               Bottom = 222
               Right = 414
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCtr (dbo)"
            Begin Extent = 
               Top = 222
               Left = 38
               Bottom = 330
               Right = 262
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCnt5"
            Begin Extent = 
               Top = 222
               Left = 300
               Bottom = 330
               Right = 476
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblRgn (dbo)"
            Begin Extent = 
               Top = 330
               Left = 38
               Bottom = 438
               Right = 201
            End
          ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwActJrn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'  DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCnt2"
            Begin Extent = 
               Top = 330
               Left = 239
               Bottom = 438
               Right = 415
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCnt1"
            Begin Extent = 
               Top = 438
               Left = 38
               Bottom = 546
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp6"
            Begin Extent = 
               Top = 373
               Left = 605
               Bottom = 481
               Right = 768
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp5"
            Begin Extent = 
               Top = 546
               Left = 38
               Bottom = 654
               Right = 201
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp4"
            Begin Extent = 
               Top = 546
               Left = 239
               Bottom = 654
               Right = 402
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp3"
            Begin Extent = 
               Top = 654
               Left = 38
               Bottom = 762
               Right = 201
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp2"
            Begin Extent = 
               Top = 654
               Left = 239
               Bottom = 762
               Right = 402
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp1"
            Begin Extent = 
               Top = 762
               Left = 38
               Bottom = 870
               Right = 201
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwActJrn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwActJrn';

