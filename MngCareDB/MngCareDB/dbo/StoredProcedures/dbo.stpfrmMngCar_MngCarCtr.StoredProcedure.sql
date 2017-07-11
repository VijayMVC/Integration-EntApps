USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[stpfrmMngCar_MngCarCtr]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stpfrmMngCar_MngCarCtr](@MngCarID int)
AS 



SELECT distinct MngCarCtr_CtrID, MngCarCtr_MngCarID, MngCarCtrStartDate, MngCarCtrEndDate, MngCarCtrComment, 
		(select Distinct CtrKey
		 FROM tblCtr Where MngCarCtr_CtrID = CtrID) as CtrKey,
            MngCarCtrID
FROM  tblMngCarCtr 
WHERE (MngCarCtr_MngCarID = @MngCarID)
ORDER BY CtrKey
                 



/*
Took out CtrBillCmpIDNum because now storing in separate table

SELECT distinct MngCarCtr_CtrID, MngCarCtr_MngCarID, MngCarCtrStartDate, MngCarCtrEndDate, MngCarCtrComment, 
		(select Distinct CtrKey
		 FROM tblCtr Where MngCarCtr_CtrID = CtrID) as CtrKey,/* (select Distinct CtrBillCmpIDNum
		 FROM tblCtr Where MngCarCtr_CtrID = CtrID) as BillCmpIDNum, */
            MngCarCtrID
FROM  tblMngCarCtr 
WHERE (MngCarCtr_MngCarID = @MngCarID)
ORDER BY CtrKey
                 
*/

/*
SELECT distinct MngCarCtr_CtrID, MngCarCtr_MngCarID, MngCarCtrStartDate, MngCarCtrEndDate, MngCarCtrComment, CtrKey, MngCarCtrID
FROM   dbo.tblMngCarCtr
	inner join  tblCtr on CtrID = MngCarCtr_CtrID
WHERE (MngCarCtr_MngCarID = @MngCarID)
ORDER BY CtrKey
                 
                 
   select CtrKey from (     
   select CtrKey
   FROM tblCtr left outer JOIN  
        (select CtrBillingCmpID, CtrBillingCmp_CtrID, max(CtrBillingCmpEffectiveDate) as maxEffectiveDate 
        From tblCtrBillingCmp   
       group by CtrBillingCmpID, CtrBillingCmp_CtrID) tblCtrBillingCmp   
             ON CtrBillingCmp_CtrID = CtrID) as CtrKey
             
             tblCtr where CtrID = MngCarCtr_CtrID 
   
   
   
   
   SELECT DISTINCT CtrID, CtrKey, CtrBillingCmpID, CtrTIN  
     FROM tblCtr left outer JOIN  
        (select CtrBillingCmpID, CtrBillingCmp_CtrID, max(CtrBillingCmpEffectiveDate) as maxEffectiveDate 
        From tblCtrBillingCmp   
       group by CtrBillingCmpID, CtrBillingCmp_CtrID) tblCtrBillingCmp   
             ON CtrBillingCmp_CtrID = CtrID
             where CtrBillingCmpID is not null
   
  */ 
    
    
    /*
    SELECT distinct MngCarCtr_CtrID, MngCarCtr_MngCarID, MngCarCtrStartDate, MngCarCtrEndDate, MngCarCtrComment, CtrKey, MngCarCtrID
FROM   dbo.tblMngCarCtr
	inner join  tblCtr on CtrID = MngCarCtr_CtrID
WHERE (MngCarCtr_MngCarID = @MngCarID)
ORDER BY CtrKey
                 
                 
    */               
     
     
     
--SELECT DISTINCT MngCarCtrID, MngCarCtr_CtrID, MngCarCtr_MngCarID, MngCarCtrStartDate, MngCarCtrEndDate, MngCarCtrComment
--FROM         tblMngCarCtr               
                     
/*
SELECT  dbo.tblMngCarCtr.*
FROM   dbo.tblMngCarCtr
WHERE (MngCarCtr_MngCarID = @MngCarID)
ORDER BY 
                    (SELECT CtrKey
                     FROM    dbo.tblCtr
                     WHERE (CtrID = MngCarCtr_CtrID))
*/
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
         Begin Table = "tblMngCarCtr (dbo)"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 151
               Right = 269
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
         Column = 3324
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'stpfrmMngCar_MngCarCtr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'stpfrmMngCar_MngCarCtr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'stpfrmMngCar_MngCarCtr'
GO
