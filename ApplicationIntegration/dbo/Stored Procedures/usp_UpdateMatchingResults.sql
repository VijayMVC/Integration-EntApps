
CREATE PROCEDURE [dbo].[usp_UpdateMatchingResults] 
AS

/* 	Purpose:	Update Matching Results Records for records no longer used (before
			Jan 1, 2002).
	Revision:	Reetika Singh - 06/21/2010 - Added update statement to update the ProviderMasterID for 3252 for N32

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

begin
  /* Part 6 - Update the unused records with flags */

	update MARSProviderMasterCurrent
		set CurrentlyNotUsedFlag = 'Y'
		where ProviderLast in ('SUSPENSE ACCOUNT DOCTOR', 'UNKNOWN')
		or exists 
		(select 1 from MARSMatchingResults A
		where (latestdate is null or latestdate < '1/1/2002'or latestdate = '2010-04-16')
		and MARSProviderMasterCurrent.Practice = A.Practice
		and MARSProviderMasterCurrent.ProviderCode = A.ProviderCode)

	delete from MARSMatchingResults
		where latestdate is null or latestdate < '1/1/2002'
		or latestdate = '2010-04-16'

	insert into ProviderCrossMapMARS
		(ProviderMasterID,MARSPractice,MARSProviderCode)
		select distinct ProviderMasterID,Practice,ProviderCode
			from MARSProviderMasterCurrent A
			where ProviderMasterID is not null
			and not exists (select 1 from ProviderCrossMapMARS B
			where 	A.practice = B.MARSpractice and 
				A.ProviderMasterID = B.ProviderMasterID and
				A.ProviderCode = B.MARSProviderCode)


	/*Update ProviderMasterID for ProviderCode = 3252. This Provider has a duplicate ID for 'N32'
		This update makes sure the correct id is in the table */

	update [ApplicationIntegration].[dbo].[ProviderCrossMapMARS]
	set ProviderMasterID = 3252
	where MARSPractice = 'N32'
		and MARSProviderCode = 3252

end

