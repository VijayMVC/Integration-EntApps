CREATE PROCEDURE [dbo].[usp_LoadWebK1] AS
/*Load web source data for K1s*/


DECLARE
	@SUMQEEARN02 money,
	@SUMENDCAP02 money

	SET	@SUMQEEARN02 = (SELECT SUM(QEEARN02)FROM WebK1Staging)
	SET	@SUMENDCAP02 = (SELECT SUM(ENDCAP02)FROM WebK1Staging)
	
	UPDATE WebK1Staging
		SET
			CityStateZip		= 	Address2 + ', ' + Address3 + ' ' + Zip, --ok
			EntityType 		= 		CASE	WHEN Type = 'N' 
										THEN 'INDIVIDUAL'
									WHEN Type = 'Y'
										THEN 'CORPORATION'
									WHEN Type = 'X'
										THEN 'UNKNOWN'
											ELSE 'UNKNOWN' END, --ok
			ProfitSharing 		= 	CAST((QEEARN02) AS NUMERIC (14,6))/@SUMQEEARN02,
			LossSharing		=	CAST((QEEARN02) AS NUMERIC (14,6))/@SUMQEEARN02,
			OwnerOfCap		=	CAST((ENDCAP02) AS NUMERIC (14,6))/@SUMENDCAP02,
			PartnersLiabOther	=	1017205.00*CAST((QEEARN02) AS NUMERIC (10,2))/@SUMQEEARN02,
			CapAcctBeg		=	ENDCAP02,
			CapContributed		=	PREFBUPCONT+CATCONT03,
			PartnersShare		=	TOTINC+PORTINC+NONDEDEXP+CHARCONT,
			WithdrAndDistr		=	DIST02+RETPOUT+PREFBUPPOUT+CAPPOUT+CATBUPPOUT+BONUSPAID,
			CapAcctEnd		=	ENDCAP03,
			OrdIncome		=	TOTINC,
			PortInterest		=	PORTINC,
			GuarPay			=	GUARPYMNT,
			CharitableContr		=	-(CHARCONT),
			OtherDedDep		=	DEPCARE,
			InvestIncome		=	PORTINC,
			NetEarnings		=	SELFEMPINC,
			DistrOfMoney		=	DIST02+RETPOUT+PREFBUPPOUT+CAPPOUT+CATBUPPOUT+BONUSPAID,
			NonDedExpense	=	-(NONDEDEXP),
			DeprAdjust		=	DEPRADJ

	UPDATE WebK1Staging
		SET ProviderMasterID = p.ProviderMasterID
			FROM AppStaging.dbo.WebK1Staging s, CEPIntegratedDB.dbo.ProviderMaster p
				WHERE s.CLKNUM = 
					p.CeridianClockNbr

	UPDATE WebK1Staging
		SET ProviderMasterID = p.ProviderMasterID
			FROM AppStaging.dbo.WebK1Staging s, CEPIntegratedDB.dbo.CeridianAlternateMatches p
				WHERE s.CLKNUM = 
					p.CeridianClockNbr and s.ProviderMasterID is null
