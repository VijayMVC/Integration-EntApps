CREATE VIEW dbo.vwDocPayAll
AS
SELECT     dbo.tblCtr.CtrKey, dbo.tlkpPayCode.PayCodeID, dbo.tlkpPayDate.PayDateChgMonth, 
                      dbo.tlkpPayCode.PayCodeSummaryPaycode AS SummaryPayCode, dbo.tlkpPayDate.PayCodePayYear AS PayYear, dbo.tblCnt.CntNameFirst, 
                      dbo.tblCnt.CntNameLast, dbo.tblCnt.CntNameLast + ', ' + dbo.tblCnt.CntNameFirst AS CntDocName, 
                      dbo.ProviderMaster.LastName + ', ' + dbo.ProviderMaster.FirstName AS MPDbDocName, dbo.tblCnt.CntCorpLbrFlxIDEb, 
                      dbo.tlkpPayCode.PayCodeDesc AS PayDescription, dbo.ProviderMaster.LastName, dbo.ProviderMaster.FirstName, dbo.ProviderMaster.CeridianFlxID, 
                      dbo.ProviderMaster.PartnershipLevel, dbo.ProviderMaster.SSNUnformatted, dbo.ProviderMaster.TaxIDIncorporated, 
                      dbo.ProviderMaster.PartnershipLevelCode, dbo.ProviderMaster.PartnershipLevelDate, dbo.ProviderMaster.EchoPartnershipLevelCode, 
                      dbo.ProviderMaster.DateOfHire, dbo.tblCnt.CntSSN, dbo.tblCnt.CntCorpTaxID, dbo.tblCnt.CntLbrFlxIDEb, dbo.tblDocPay.DocPayLbrFlxIDEb, 
                      dbo.tblDocPay.DocPayLbrPayPeriod, dbo.tblDocPay.DocPayLbrTotalHours, dbo.tblDocPay.DocPayLbrTotalEarnings, 
                      dbo.tblDocPay.DocPayLbrSocNumber, dbo.tblDocPay.DocPayLbrEmpName, dbo.tblDocPay.DocPayPaytype, dbo.tblDocPay.DocPayPaycode, 
                      dbo.tblDocPay.DocPaySite, dbo.tblDocPay.DocPayLbrChrgDept, dbo.tlkpPayDate.PayCodeTaxYear, dbo.ProviderMaster.CEPPartnerFlag, 
                      dbo.ProviderMaster.DateOfBirth, dbo.ProviderMaster.ProviderMasterID, dbo.ProviderMaster.Gender, dbo.tblCnt.CntID, dbo.tblCtr.CtrID, 
                      dbo.tblDocPay.DocPayLbrChrgDiv, dbo.tblDocPay.DocPayLbrDateAdd, dbo.tlkpPayDate.PayDatePayDate
FROM         dbo.tlkpPayCode RIGHT OUTER JOIN
                      dbo.tblCtr RIGHT OUTER JOIN
                      dbo.tblDocPay ON dbo.tblCtr.CtrPlatinumID = dbo.tblDocPay.DocPayLbrChrgDept LEFT OUTER JOIN
                      dbo.tlkpPayDate ON dbo.tblDocPay.DocPayLbrPayPeriod = dbo.tlkpPayDate.PayDatePeriod ON 
                      dbo.tlkpPayCode.PayCodeName = dbo.tblDocPay.DocPayPaycode LEFT OUTER JOIN
                      dbo.tblCnt INNER JOIN
                      dbo.wvCntLbrFlxIDebwithCorp ON dbo.tblCnt.CntID = dbo.wvCntLbrFlxIDebwithCorp.CntID LEFT OUTER JOIN
                      dbo.ProviderMaster ON dbo.tblCnt.CntID = dbo.ProviderMaster.SiteLineCntID ON 
                      dbo.tblDocPay.DocPayLbrFlxIDEb = dbo.wvCntLbrFlxIDebwithCorp.FlxID

GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'old Query of DocPay plus linked tables, no longer used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwDocPayAll';


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
         Configuration = "(H (1[75] 4[18] 2) )"
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
         Begin Table = "tlkpPayCode (dbo)"
            Begin Extent = 
               Top = 323
               Left = 1045
               Bottom = 526
               Right = 1253
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCtr (dbo)"
            Begin Extent = 
               Top = 130
               Left = 1011
               Bottom = 238
               Right = 1235
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblDocPay (dbo)"
            Begin Extent = 
               Top = 51
               Left = 756
               Bottom = 614
               Right = 952
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "tlkpPayDate (dbo)"
            Begin Extent = 
               Top = 277
               Left = 513
               Bottom = 495
               Right = 683
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCnt (dbo)"
            Begin Extent = 
               Top = 47
               Left = 289
               Bottom = 518
               Right = 465
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "wvCntLbrFlxIDebwithCorp (dbo)"
            Begin Extent = 
               Top = 24
               Left = 485
               Bottom = 141
               Right = 681
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProviderMaster (dbo)"
            Begin Extent = 
               Top = 12
               Left = 12
               Bottom = 562', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwDocPayAll';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 13
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
         Column = 5130
         Alias = 1920
         Table = 1455
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwDocPayAll';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwDocPayAll';

