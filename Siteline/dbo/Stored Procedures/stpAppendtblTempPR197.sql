CREATE PROCEDURE dbo.stpAppendtblTempPR197(@COMPANY4 nvarchar(50),
@DISTCOMPANY4 nvarchar(50),
@PAYMENTDATE3 datetime,
@DISTCOMPANY5 nvarchar(50),
@ACCTUNIT3 nvarchar(50),
@ACCOUNT3 nvarchar(50),
@SUBACCT3 nvarchar(255),
@POSTINGDATE2 datetime,
@DESCRIPTION3 nvarchar(255),
@CONTINUED2 nvarchar(255),
@EMPLOYEE2 nvarchar(50),
@FULLNAME2 nvarchar(255),
@DISTUNITS nvarchar(50),
@DISTHOURS float,
@DISTAMT float,
@CHECKNBR nvarchar(53),
@TEMPSTAR nvarchar(50),
@GLDATE2 datetime,
@CHECKTYPE nvarchar(50),
@PAYCODE nvarchar(50),
@DEDCODE nvarchar(50),
@JOBCODE nvarchar(50),
@DISTPROCLEV nvarchar(50),
@DEPARTMENT3 nvarchar(50),
@DISTUNITS2 nvarchar(50),
@DISTHOURS2 float,
@DISTAMT2 float,
@ACTIVITY nvarchar(50),
@POSITION nvarchar(50),
@ACCTCATEGORY nvarchar(255),
@DataSetDate datetime,
@FileName nvarchar(200))
AS TRUNCATE TABLE dbo.tblTempPR197 INSERT INTO dbo.tblTempPR197
                                                                                                           ([COMPANY-4], [DIST-COMPANY-4], [PAYMENT-DATE-3], [DIST-COMPANY-5], [ACCT-UNIT-3], [ACCOUNT-3], 
                                                                                                           [SUB-ACCT-3], [POSTING-DATE-2], [DESCRIPTION-3], [CONTINUED-2], [EMPLOYEE-2], [FULL-NAME-2], 
                                                                                                           [DIST-UNITS], [DIST-HOURS], [DIST-AMT], [CHECK-NBR], [TEMP-STAR], [GL-DATE-2], [CHECK-TYPE], 
                                                                                                           [PAY-CODE], [DED-CODE], [JOB-CODE], [DIST-PROC-LEV], [DEPARTMENT-3], [DIST-UNITS-2], [DIST-HOURS-2], 
                                                                                                           [DIST-AMT-2], ACTIVITY, [ACCT-CATEGORY], POSITION, DataSetDate, FileName)
                                                                                   VALUES       (@COMPANY4, @DISTCOMPANY4, @PAYMENTDATE3, @DISTCOMPANY5, @ACCTUNIT3, @ACCOUNT3, 
                                                                                                           @SUBACCT3, @POSTINGDATE2, @DESCRIPTION3, @CONTINUED2, @EMPLOYEE2, @FULLNAME2, 
                                                                                                           @DISTUNITS, @DISTHOURS, @DISTAMT, @CHECKNBR, @TEMPSTAR, @GLDATE2, @CHECKTYPE, 
                                                                                                           @PAYCODE, @DEDCODE, @JOBCODE, @DISTPROCLEV, @DEPARTMENT3, @DISTUNITS2, @DISTHOURS2, 
                                                                                                           @DISTAMT2, @ACTIVITY, @ACCTCATEGORY, @POSITION, @DataSetDate, @FileName)
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
         Configuration = "(H (1[27] 4[48] 2) )"
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
         Begin Table = "tblTempPR197 (dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 243
               Right = 374
            End
            DisplayFlags = 280
            TopColumn = 24
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
      Begin ColumnWidths = 3
         Column = 2025
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'PROCEDURE', @level1name = N'stpAppendtblTempPR197';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'PROCEDURE', @level1name = N'stpAppendtblTempPR197';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'PROCEDURE', @level1name = N'stpAppendtblTempPR197';

