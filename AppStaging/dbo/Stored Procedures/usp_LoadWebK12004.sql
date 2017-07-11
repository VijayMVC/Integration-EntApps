CREATE PROCEDURE [dbo].[usp_LoadWebK12004] AS

/*Load web source data for K1s 2004*/


DECLARE
	@SUMQEEARN04 money,
	@SUMENDCAP04 money,
	@TOTINC		money

	SET	@SUMQEEARN04 = (SELECT SUM(QEEARN04)FROM WebK1Staging2004)
	SET	@SUMENDCAP04 = (SELECT SUM(ENDCAP04)FROM WebK1Staging2004)
	SET	@TOTINC = (SELECT SUM(TOTINC) FROM WebK1Staging2004)
	UPDATE WebK1Staging2004
		SET
			CityStateZip		= 	Address2 + ', ' + Address3 + ' ' + Zip, --ok
			EntityType 		= 		CASE	WHEN Type = 'N' 
										THEN 'INDIVIDUAL'
									WHEN Type = 'Y'
										THEN 'CORPORATION'
									WHEN Type = 'X'
										THEN 'UNKNOWN'
											ELSE 'UNKNOWN' END, --ok
			ProfitSharing 		= 	CAST((QEEARN04) AS NUMERIC (14,6))/@SUMQEEARN04,
			LossSharing		=	CAST((QEEARN04) AS NUMERIC (14,6))/@SUMQEEARN04,
			OwnerOfCap		=	CAST((ENDCAP04) AS NUMERIC (14,6))/@SUMENDCAP04,
			PartnersLiabOther	=	1214971.32*CAST((QEEARN04) AS NUMERIC (10,2))/@SUMQEEARN04,
			CapAcctBeg		=	ENDCAP03,
			CapContributed		=	CATCONT04,--PREFBUPCONT+CATCONT03,
			PartnersShare		=	TOTINC+PORTINC+NONDEDEXP+CHARCONT,
			WithdrAndDistr		=	DIST03-RETPOUT-PREFBUPPOUT-CAPPOUT+BONUS50,--DIST02+RETPOUT+PREFBUPPOUT+CAPPOUT+CATBUPPOUT+BONUSPAID,
			CapAcctEnd		=	ENDCAP03-DIST03+TOTINC+PORTINC+NONDEDEXP+CHARCONT+RETPOUT+CAPPOUT+PREFBUPPOUT+CATCONT04-BONUS50,--ENDCAP03,
			OrdIncome		=	TOTINC,
			PortInterest		=	PORTINC,
			GuarPay			=	GUARPYMNT,
			CharitableContr		=	-(CHARCONT),
			OtherDedDep		=	DEPCARE,
			InvestIncome		=	PORTINC,
			NetEarnings		=	SELFEMPINC,
			DistrOfMoney		=	DIST03-RETPOUT-PREFBUPPOUT-CAPPOUT+BONUS50,--DIST02+RETPOUT+PREFBUPPOUT+CAPPOUT+CATBUPPOUT+BONUSPAID,
			NonDedExpense		=	-(NONDEDEXP),
			DeprAdjust		=	DEPRADJ,
			NewFormField2004	=	214752847.7*CAST((TOTINC) AS NUMERIC (10,4))/@TOTINC


	UPDATE WebK1Staging2004
		SET ProviderMasterID = p.ProviderMasterID
			FROM AppStaging.dbo.WebK1Staging2004 s, PMDBStaging.dbo.ProviderMaster p
				WHERE s.CLKNUM = 
					p.CeridianClockNbr

	UPDATE WebK1Staging2004
		SET ProviderMasterID = p.ProviderMasterID
			FROM AppStaging.dbo.WebK1Staging2004 s, PMDBStaging.dbo.CeridianAlternateMatches p
				WHERE s.CLKNUM = 
					p.CeridianClockNbr and s.ProviderMasterID is null

	Update WebK1Staging2004
		SET TAXID = NULL
