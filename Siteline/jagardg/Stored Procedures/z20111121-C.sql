CREATE PROCEDURE jagardg.[z20111121-C](@MthYrID nvarchar(50))
AS SELECT      dbo.tblCtr.CtrID, dbo.tblCnt.CntID, @MthYrID AS strPayMonth, CONVERT(money, ISNULL(dbo.tblPR197.[DIST-AMT], 0)) AS Expr10, 
                        ISNULL(dbo.tblPR197.[DIST-HOURS], 0) AS Expr9, 
                        CASE PayCodeName WHEN 'OVD' THEN 'O' WHEN 'OVT' THEN 'O' WHEN 'OV7' THEN 'O' ELSE 'R' END AS Expr1, dbo.tblPR197.[PAY-CODE], 
                        dbo.tlkpPayCode.PayCodeDesc, dbo.tblPR197.[JOB-CODE], dbo.tlkpJobCode.JobCodeJBCDescription, 
                        CASE WHEN [PAY-CODE] = '87A' THEN [PayCodeSitelineClass] WHEN LEFT([JobCodeID], 1) 
                        = 'P' THEN [PayCodeSitelineClass] ELSE [JobCodeSitelineClass] END AS Expr2, dbo.tblPR197.[FULL-NAME-2], 
                        CAST(dbo.tblPR197.[POSTING-DATE-2] AS DateTime) AS Expr3, CAST(dbo.tblPR197.[PAYMENT-DATE-3] AS DateTime) AS Expr7, 
                        dbo.tblPR197.[DIST-PROC-LEV], 'Lawson' AS Expr4, dbo.tblPR197.PR197FileName, GETDATE() AS Expr5, dbo.tblPR197.[DIST-COMPANY-5], 
                        dbo.tblPR197.[ACCOUNT-3], dbo.tblPR197.[ACCT-UNIT-3]
FROM          dbo.tblPR197 LEFT OUTER JOIN
                        dbo.tlkpJobCode ON dbo.tblPR197.[JOB-CODE] = dbo.tlkpJobCode.JobCodeID LEFT OUTER JOIN
                        dbo.tblCnt ON dbo.tblPR197.[EMPLOYEE-2] = dbo.tblCnt.CntLawsonNumber LEFT OUTER JOIN
                        dbo.tlkpPayCode ON dbo.tblPR197.[PAY-CODE] = dbo.tlkpPayCode.PayCodeName LEFT OUTER JOIN
                        dbo.tblCtr ON dbo.tblPR197.[ACCT-UNIT-3] = dbo.tblCtr.CtrTIN
WHERE      (dbo.tblPR197.[JOB-CODE] IS NOT NULL)
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
         Configuration = "(H (1[43] 4[31] 2) )"
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
         Begin Table = "tblPR197 (dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 113
               Right = 204
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tlkpJobCode (dbo)"
            Begin Extent = 
               Top = 1
               Left = 259
               Bottom = 108
               Right = 459
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCnt (dbo)"
            Begin Extent = 
               Top = 7
               Left = 572
               Bottom = 114
               Right = 751
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tlkpPayCode (dbo)"
            Begin Extent = 
               Top = 222
               Left = 93
               Bottom = 329
               Right = 367
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCtr (dbo)"
            Begin Extent = 
               Top = 181
               Left = 486
               Bottom = 288
               Right = 718
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
   ', @level0type = N'SCHEMA', @level0name = N'jagardg', @level1type = N'PROCEDURE', @level1name = N'z20111121-C';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'      Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'jagardg', @level1type = N'PROCEDURE', @level1name = N'z20111121-C';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'jagardg', @level1type = N'PROCEDURE', @level1name = N'z20111121-C';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'jagardg', @level1type = N'PROCEDURE', @level1name = N'z20111121-C';

