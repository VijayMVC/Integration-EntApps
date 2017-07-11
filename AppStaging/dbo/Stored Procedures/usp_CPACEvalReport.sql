CREATE PROCEDURE [dbo].[usp_CPACEvalReport] AS

/*Still under development.
Still need to address how to handle this if physician works at more than 1 site.  MD
will have only 1 eval if works at more then 1 site in region, is this correct?
What if work at more than 1 site but there are 2 different Medical Directors?  What about
if they work in >1 region
Also, what to do when comments are entered as NA.  Anything or nothing

George- how can I tell if the evaluation is for the current CPAC meeting, rather than the past?
Answer:  Need to create a timestamp when I load the data so I know which batch is which. (duh!)
For now, Just added this at the end of the first query to exlude the test surveys. AND Len(EvalBatchID) > 4
		*/

	/*Partner Evaluation Questionnaire - Extract Data from completed web-based questionnaires*/

	INSERT INTO WebCPACEvaluStaging
		(EvaluationID,
		ProviderMasterID,
		MDProviderMasterID,
		RDProviderMasterID,
		SelfCompleteDate,
		MDCompleteDate,
		RDCompleteDate,
		MDCommentsbyEvaluee)

		SELECT 	[id],
			evalee,
			medDir,	
			regDir,
			CASE	WHEN isdate(status_self) = 1
				THEN status_self
				ELSE NULL END,
			CASE	WHEN isdate(status_MD) = 1
				THEN status_MD
				ELSE NULL END,
			CASE	WHEN isdate(status_RD) = 1
				THEN status_RD
				ELSE NULL END,
			SelfCommentonMD
				FROM CPAC_Lookup
					WHERE Len(EvalBatchID) > 4

	UPDATE WebCPACEvaluStaging
		SET SelfPeriod =	CASE	WHEN PERIOD LIKE ('%1%')
						THEN 'Questionnaire period:  During the past 1 year'
						WHEN PERIOD LIKE ('%2%')
						THEN 'Questionnaire period:  During the past 2 years'
						ELSE NULL END,
		SelfHospPriv = 		CASE	WHEN HOSPITALS LIKE ('%1%')
						THEN 'Have your hospital privileges been restricted, suspended, revoked or declined, or has any hospital notified you of its intent to pursue such action?'
						ELSE NULL END,
		SelfHospDiscip =	CASE	WHEN HOSPITALS LIKE ('%3%')
						THEN 'Have you been under punitive or disciplinary observation, preceptorship or sponsorship in a hospital, or has any hospital notified you of its intent to pursue such action?'
						ELSE NULL END,
		SelfHospModPriv =	CASE	WHEN HOSPITALS LIKE ('%5%')  --confirm with George
						THEN 'Have you voluntarily agreed to a modification of hospital privileges?'
						ELSE NULL END,
		SelfSocComplaint =	CASE	WHEN SOCIETIES LIKE ('%1%')
						THEN 'Has any physician or patient filed a complaint against you with your medical society or with any other professional society?'
						ELSE NULL END,
		SelfSocDiscip 	=	CASE	WHEN SOCIETIES LIKE ('%3%')
						THEN 'Have you been subject to medical or professional society disciplinary proceedings or review?'
						ELSE NULL END,
		SelfSocDeny 	=	CASE	WHEN SOCIETIES LIKE ('%5%')
						THEN 'Have you been denied certification/recertification by a specialty board?'
						ELSE NULL END,
		SelfConductDiscip = 	CASE	WHEN CONDUCT LIKE ('%1%')
						THEN 'Have you been subject to disciplinary proceedings or to a review affecting your participation with a foundation, HMO, PPO or IPA, or have you been notified of an intent to pursue such action?'
						ELSE NULL END,
		SelfDatabank 	=	CASE	WHEN DATABANK LIKE ('%1%')
						THEN 'Have you been reported to the Databank regarding malpractice activity or disciplinary proceedings?'
						ELSE NULL END,
		SelfGovInvestig =	CASE	WHEN GOV_ACTION LIKE ('%1%')
						THEN 'Has any government agency (e.g. Medical Board of CA, HCFA, etc…) investigated you or suspended, Confidential Page 1 6/13/2004 revoked or taken any other action against your Medical License or your Narcotics License?'
						ELSE NULL END,
		SelfGovFelony 	=	CASE	WHEN GOV_ACTION LIKE ('%3%')
						THEN 'Have you been charged with, or convicted of, a felony?'
						ELSE NULL END,
		SelfGovDUI	=	CASE	WHEN GOV_ACTION LIKE ('%5%')
						THEN 'Have you been arrested and formally charged with driving under the influence (DUI) illegal possession of drugs, illegal sale or attempted sale of drugs?'
						ELSE NULL END,
		SelfHealthDiag =	CASE	WHEN HEALTH LIKE ('%1%')
						THEN 'Since you have been associated with CEP, have you been diagnosed and/or treated for substance abuse, mental illness or emotional impairment?'
						ELSE NULL END,
		SelfHealthDrugs =	CASE	WHEN HEALTH LIKE ('%3%')
						THEN 'Do you presently use any drugs illegally?'
						ELSE NULL END,
		SelfHealthPhys =	CASE	WHEN HEALTH LIKE ('%5%')
						THEN 'Do you have an existing physical limitation that does or may affect your ability to meet the hours and work requirements of the Partnership?'
						ELSE NULL END,
		SelfHealthImpair = 	CASE	WHEN HEALTH LIKE ('%7%')
						THEN 'If the answer to a., b. and or c. in HEALTH section is yes, did you participate, or are you currently participating, in CEP’s Impairment Program? Answer = YES'
						WHEN HEALTH LIKE ('%8%')
						THEN 'If the answer to a., b. and or c. in HEALTH section is yes, did you participate, or are you currently participating, in CEP’s Impairment Program? Answer = NO'
						ELSE NULL END,  --George, Jen, this is silly.  Everyone answers it unnecessarily.
		SelfInsCov =		CASE	WHEN INSURANCE LIKE ('%1%')
						THEN 'Has any liability insurer cancelled, declined or modified coverage (e.g., reduced limits, assigned a deductible, restricted coverage, surcharged rates) or refused renewal of your insurance?'
						ELSE NULL END,
		SelfClaimInCEP =	CASE	WHEN CLAIMS LIKE ('%1%')
						THEN 'Have you been notified of your involvement in a new malpractice claim, suit or incident, either directly or indirectly within CEP?'
						ELSE NULL END,
		SelfClaimOutCEP = 	CASE	WHEN CLAIMS LIKE ('%3%')
						THEN 'Have you been notified of your involvement in a malpractice claim, suit or incident, either directly or indirectly outside of CEP?'
						ELSE NULL END,
		SelfActPlaintiff = 	CASE	WHEN OUT_ACTIVITIES LIKE ('%1%')
						THEN 'Do you perform Plaintiff Expert Witness Work?'
						ELSE NULL END,
		SelfActDef =		CASE	WHEN OUT_ACTIVITIES LIKE ('%3%')
						THEN 'Do you perform Defense Expert Witness Work?'
						ELSE NULL END,
		SelfActOther = 		CASE	WHEN OUT_ACTIVITIES LIKE ('%5%')
						THEN 'Do you perform any other medical activity?'
						ELSE NULL END,
		SelfActOtherCEP =	CASE	WHEN OUT_ACTIVITIES LIKE ('%7%')
						THEN 'Do you perform clinical work for organizations other than CEP?'
						ELSE NULL END
			FROM CPAC_QUESTIONNAIRE Q, WEBCPACEVALUSTAGING S 
				WHERE Q.[evalID] = S.EvaluationID

	UPDATE WebCPACEvaluStaging
		SET	SelfHealthImpair = null 
			WHERE (SelfHealthDiag IS NULL
			AND SelfHealthDrugs IS NULL
			AND SelfHealthPhys IS NULL)

	
	UPDATE WebCPACEvaluStaging
		SET 	SelfExplanation  = explanation,
			SelfClaimExplanation  = claiminfo
				FROM CPAC_q_comments C, WebCPACEvaluStaging S
					WHERE C.evalID = S.EvaluationID


	UPDATE WebCPACEvaluStaging
		SET 	SelfEMSWork  = 
			CASE	WHEN OUTINFO LIKE ('%1%')
				THEN 'County EMS Work'
				ELSE NULL END
					FROM CPAC_q_outsideactivities O, WebCPACEvaluStaging S
						WHERE O.evalID = S.EvaluationID


	UPDATE WebCPACEvaluStaging
		SET SelfGovAppointee =  
			CASE 	WHEN OUTINFO LIKE ('%2%')
				THEN 'Govt./Agency Appointee or Delegate'
				ELSE NULL END
					FROM CPAC_q_outsideactivities O, WebCPACEvaluStaging S
						WHERE O.evalID = S.EvaluationID
					

	UPDATE WebCPACEvaluStaging
		SET SelfQIRM =  
			CASE 	WHEN OUTINFO LIKE ('%3%')
				THEN 'QI/RM Consulting'
				ELSE NULL END
					FROM CPAC_q_outsideactivities O, WebCPACEvaluStaging S
						WHERE O.evalID = S.EvaluationID


	UPDATE WebCPACEvaluStaging
		SET SelfAmbFire =  
			CASE 	WHEN OUTINFO LIKE ('%4%')
				THEN 'Ambulance/Fire Department Med Dir'
				ELSE NULL END
					FROM CPAC_q_outsideactivities O, WebCPACEvaluStaging S
						WHERE O.evalID = S.EvaluationID

	UPDATE WebCPACEvaluStaging
		SET SelfMedSoc = 
			CASE	WHEN OUTINFO LIKE ('%5%')
				THEN 'Medical Society/CMRI/MBC Med Reviewer'
				ELSE NULL END
					FROM CPAC_q_outsideactivities O, WebCPACEvaluStaging S
						WHERE O.evalID = S.EvaluationID

	UPDATE WebCPACEvaluStaging
		SET SelfSports = 
			CASE	WHEN OUTINFO LIKE ('%6%')
				THEN 'Sports Team Physician'
				ELSE NULL END
					FROM CPAC_q_outsideactivities O, WebCPACEvaluStaging S
						WHERE O.evalID = S.EvaluationID
	UPDATE WebCPACEvaluStaging
		SET SelfPlaintiffExpert =  
			CASE	WHEN OUTINFO LIKE ('%7%')
				THEN 'Expert Witness Work (Plaintiff)'
				ELSE NULL END
					FROM CPAC_q_outsideactivities O, WebCPACEvaluStaging S
						WHERE O.evalID = S.EvaluationID

	UPDATE WebCPACEvaluStaging
		SET SelfBoardMember = 
			CASE	WHEN OUTINFO LIKE ('%8%')
				THEN 'Board Member for Med-Related Org.'
				ELSE NULL END
					FROM CPAC_q_outsideactivities O, WebCPACEvaluStaging S
						WHERE O.evalID = S.EvaluationID

	UPDATE WebCPACEvaluStaging
		SET SelfOther =
			CASE	WHEN OUTINFO LIKE ('%9%')
				THEN 'Other (describe)'
				ELSE NULL END
					FROM CPAC_q_outsideactivities O, WebCPACEvaluStaging S
						WHERE O.evalID = S.EvaluationID

	UPDATE WebCPACEvaluStaging
		SET SelfDefenseExpert = 
			CASE	WHEN OUTINFO LIKE ('%10%')
				THEN 'Expert Witness Work (Defense)'
				ELSE NULL END
					FROM CPAC_q_outsideactivities O, WebCPACEvaluStaging S
						WHERE O.evalID = S.EvaluationID
	UPDATE WebCPACEvaluStaging
		SET SelfVolunteer = 
			CASE	WHEN OUTINFO LIKE ('%11%')
				THEN 'Volunteer Work'
				ELSE NULL END
					FROM CPAC_q_outsideactivities O, WebCPACEvaluStaging S
						WHERE O.evalID = S.EvaluationID


	UPDATE WebCPACEvaluStaging
		SET 	SelfOtherDesc =  Other,
			SelfVolunteerDesc = Volunteer
				FROM CPAC_q_outsideactivities O, WebCPACEvaluStaging S
						WHERE O.evalID = S.EvaluationID

/*--THIS ONE NOT FINISHED need to break out details, for now, I put it all into 1 field.  data is separated by pipes |*/
	UPDATE WebCPACEvaluStaging
		SET 	SelfUCSite =  Hospital_ACC_details1
				FROM  CPAC_q_ACCdetails O, WebCPACEvaluStaging S
						WHERE O.evalID = S.EvaluationID
	/*Medical Director Evaluation - Extract Data from completed web-based questionnaires*/

	UPDATE WebCPACEvaluStaging
		SET MDProviderMasterID = mdirid
			FROM CPAC_d_eval D, WebCPACEvaluStaging S
				WHERE D.evalID = S.EvaluationID

	UPDATE WebCPACEvaluStaging
		SET MDRecommend = 
		CASE	WHEN recommendation  = 1 
			THEN 'I recommend this physician for advancement at this time'
			WHEN recommendation = 2
			THEN 'I do not recommend this physician for advancement at this time'
		ELSE NULL END
		FROM CPAC_d_eval d, WebCPACEvaluStaging s
		WHERE D.evalID = S.EvaluationID


		UPDATE WebCPACEvaluStaging
			SET MDClinRes = 
			CASE	WHEN clinical_performance LIKE ('%1%')
				THEN 'Improvement Expected: Use of Resources (Clinical Performance)'
				ELSE NULL END
					FROM CPAC_d_eval d, WebCPACEvaluStaging s
						WHERE D.evalID = S.EvaluationID

		UPDATE WebCPACEvaluStaging
			SET MDClinDocum = 
			CASE	WHEN clinical_performance LIKE ('%3%')
				THEN 'Improvement Expected: Thoroughness of Documentation (Clinical Performance)'
				ELSE NULL END
					FROM CPAC_d_eval d, WebCPACEvaluStaging s
						WHERE D.evalID = S.EvaluationID

		UPDATE WebCPACEvaluStaging
			SET MDClinQual = 
			CASE	WHEN clinical_performance LIKE ('%5%')
				THEN 'Improvement Expected: Quality of Care (Clinical Performance)'
				ELSE NULL END
					FROM CPAC_d_eval d, WebCPACEvaluStaging s
						WHERE D.evalID = S.EvaluationID
	
		UPDATE WebCPACEvaluStaging
			SET MDPSScore = 
			CASE	WHEN patient_satisfaction LIKE ('%1%')
				THEN 'Improvement Expected: Scores (Patient Satisfaction)'
				ELSE NULL END
					FROM CPAC_d_eval d, WebCPACEvaluStaging s
						WHERE D.evalID = S.EvaluationID


		UPDATE WebCPACEvaluStaging
			SET MDPSComplaint = 
			CASE	WHEN patient_satisfaction LIKE ('%3%')
				THEN 'Improvement Expected: Patient Complaints (Patient Satisfaction)'
				ELSE NULL END
					FROM CPAC_d_eval d, WebCPACEvaluStaging s
						WHERE D.evalID = S.EvaluationID

		UPDATE WebCPACEvaluStaging
			SET MDRMClaims = 
			CASE	WHEN risk_management LIKE ('%1%')
				THEN 'Improvement Expected: Number of claims, incidents, lawsuits (Risk Management)'
				ELSE NULL END
					FROM CPAC_d_eval d, WebCPACEvaluStaging s
						WHERE D.evalID = S.EvaluationID

		UPDATE WebCPACEvaluStaging
			SET MDRMCobra = 
			CASE	WHEN risk_management LIKE ('%3%')
				THEN 'Improvement Expected: COBRA/EMTALA (Risk Management)'
				ELSE NULL END
					FROM CPAC_d_eval d, WebCPACEvaluStaging s
						WHERE D.evalID = S.EvaluationID

	UPDATE WebCPACEvaluStaging
			SET MDLocal = 
			CASE	WHEN local_facility LIKE ('%1%')
				THEN 'Improvement Expected: Participation at Local Medical Facility/Partnership'
				ELSE NULL END
					FROM CPAC_d_eval d, WebCPACEvaluStaging s
						WHERE D.evalID = S.EvaluationID

	UPDATE WebCPACEvaluStaging
			SET MDFiduEducation = 
			CASE	WHEN fiduciary LIKE ('%1%')
				THEN 'Improvement Expected: Compliance Education (Fiduciary Responsibilities)'
				ELSE NULL END
					FROM CPAC_d_eval d, WebCPACEvaluStaging s
						WHERE D.evalID = S.EvaluationID

	UPDATE WebCPACEvaluStaging
			SET MDFiduEducation = 
			CASE	WHEN fiduciary LIKE ('%3%')
				THEN 'Improvement Expected: Adherence to CEP Code of Conduct (Fiduciary Responsibilities)'
				ELSE NULL END
					FROM CPAC_d_eval d, WebCPACEvaluStaging s
						WHERE D.evalID = S.EvaluationID

	UPDATE WebCPACEvaluStaging
			SET MDClinPerSkills = 
			CASE	WHEN personal_clinical_skills LIKE ('%1%')
				THEN 'Improvement Expected: Clinical Skills (Personal Practice)'
				ELSE NULL END
					FROM CPAC_d_eval d, WebCPACEvaluStaging s
						WHERE D.evalID = S.EvaluationID

	UPDATE WebCPACEvaluStaging
			SET MDTechSkills = 
			CASE	WHEN technical_skills LIKE ('%1%')
				THEN 'Improvement Expected: Technical Skills (Personal Practice)'
				ELSE NULL END
					FROM CPAC_d_eval d, WebCPACEvaluStaging s
						WHERE D.evalID = S.EvaluationID


	UPDATE WebCPACEvaluStaging
			SET MDProComm = 
			CASE	WHEN professional_comm LIKE ('%1%')
				THEN 'Improvement Expected: Professional Communication/Integrity (Personal Practice)'
				ELSE NULL END
					FROM CPAC_d_eval d, WebCPACEvaluStaging s
						WHERE D.evalID = S.EvaluationID

	UPDATE WebCPACEvaluStaging
			SET MDProDemeanor = 
			CASE	WHEN professional_demeanor LIKE ('%1%')
				THEN 'Improvement Expected: Professional Demeanor (Personal Practice)'
				ELSE NULL END
					FROM CPAC_d_eval d, WebCPACEvaluStaging s
						WHERE D.evalID = S.EvaluationID

	UPDATE WebCPACEvaluStaging
			SET MDTeamSkills = 
			CASE	WHEN team_skills LIKE ('%1%')
				THEN 'Improvement Expected: Team Building Skills (Personal Practice)'
				ELSE NULL END
					FROM CPAC_d_eval d, WebCPACEvaluStaging s
						WHERE D.evalID = S.EvaluationID


	UPDATE WebCPACEvaluStaging
			SET MDOverallPerform = 
			CASE	WHEN overall_performance LIKE ('%1%')
				THEN 'Improvement Expected: Overall Performance (Personal Practice)'
				ELSE NULL END
					FROM CPAC_d_eval d, WebCPACEvaluStaging s
						WHERE D.evalID = S.EvaluationID

		UPDATE WebCPACEvaluStaging
			SET	MDAssessment = d.assessment,
				MDSuggestion = d.suggestion
					FROM CPAC_d_eval d, WebCPACEvaluStaging s
						WHERE D.evalID = S.EvaluationID

		

	/* Regional Director Evaluation - Extract Data from completed web-based questionnaires*/

	UPDATE WebCPACEvaluStaging
		SET RDProviderMasterID = regid
		FROM CPAC_r_eval R, WebCPACEvaluStaging S
		WHERE R.evalID = S.EvaluationID

	UPDATE WebCPACEvaluStaging
		SET RDBasedPers = 
		CASE	WHEN eval_based_upon LIKE ('%1%')
			THEN 'Personal Observation or conversation with physician'
			ELSE NULL END
				FROM CPAC_r_eval R, WebCPACEvaluStaging S
					WHERE R.evalID = S.EvaluationID


	UPDATE WebCPACEvaluStaging
		SET RDBasedDir = 
		CASE WHEN eval_based_upon LIKE ('%2%')
		THEN 'Discussion with Department Director'
		ELSE NULL END
			FROM CPAC_r_eval R, WebCPACEvaluStaging S
				WHERE R.evalID = S.EvaluationID

	UPDATE WebCPACEvaluStaging
		SET RDBasedEDPhys = 
		CASE WHEN eval_based_upon LIKE ('%3%')
		THEN 'Discussion with other ED physicians'
		ELSE NULL END
			FROM CPAC_r_eval R, WebCPACEvaluStaging S
				WHERE R.evalID = S.EvaluationID



	UPDATE WebCPACEvaluStaging
		SET RDBasedNursing = 
		CASE	WHEN eval_based_upon LIKE ('%4%')
			THEN 'Discussion with Nursing Staff'
			ELSE NULL END
			FROM CPAC_r_eval R, WebCPACEvaluStaging S
				WHERE R.evalID = S.EvaluationID

	UPDATE WebCPACEvaluStaging
		SET	RDCommentsOverall = comment_overall,
			RDCommentsCEP = comment_CEP_standard,
			RDLeadershipReason = reason_leadership,
			RDPerformanceReason = reason_performance,
			RDRecommendReason = reason_recommend
				FROM CPAC_r_eval R, WebCPACEvaluStaging S
					WHERE R.evalID = S.EvaluationID
	UPDATE WebCPACEvaluStaging
		SET RDLeadership = 
		CASE	WHEN leadership LIKE ('%1%')
			THEN 'I feel that this physician is a candidate for future leadership positions in CEP'
			WHEN leadership LIKE ('%2%')
			THEN 'I do not feel that this physician is a candidate for future leadership positions in CEP'
			ELSE NULL END
				FROM CPAC_r_eval R, WebCPACEvaluStaging S
					WHERE R.evalID = S.EvaluationID


	UPDATE WebCPACEvaluStaging
		SET	RDPerformance = 
		CASE	WHEN performance LIKE ('%1%')
			THEN 'I believe s(he) would perform satisfactorily in other CEP ED and/or ACC facilities'
			WHEN performance LIKE ('%2%')
				THEN 'I do not believe s(he) would perform satisfactorily in other CEP ED and/or ACC facilities'
				ELSE NULL END
			FROM CPAC_r_eval R, WebCPACEvaluStaging S
				WHERE R.evalID = S.EvaluationID


	UPDATE WebCPACEvaluStaging
		SET	RDRecommend = 
			CASE	WHEN recommend LIKE ('%1%')
				THEN 'I recommend this physician for this level of Partnership'
				WHEN recommend LIKE ('%2%')
				THEN 'I recommend this physician for this level of Partnership'
				ELSE NULL END
				FROM CPAC_r_eval R, WebCPACEvaluStaging S
				WHERE R.evalID = S.EvaluationID
	
	UPDATE WEBCPACEvaluStaging
		SET PhysicianName = lastname + ' ' + preferredname + ', ' + title
				FROM CEPIntegratedDB.dbo.Providermaster a, webcpacevalustaging b
					WHERE a.providermasterid = b.providermasterid

	UPDATE WEBCPACEvaluStaging
		SET MedDirName = lastname + ' ' + preferredname + ', ' + title
				FROM CEPIntegratedDB.dbo.Providermaster a, webcpacevalustaging b
					WHERE a.providermasterid = b.mdprovidermasterid

	UPDATE WEBCPACEvaluStaging
		SET RegDirName = lastname + ' ' + preferredname + ', ' + title
				FROM CEPIntegratedDB.dbo.Providermaster a, webcpacevalustaging b
					WHERE a.providermasterid = b.rdprovidermasterid
	
	UPDATE WEBCPACEvaluStaging
		SET HospitalClinic = a.WebName
			FROM CEPIntegratedDB.dbo.SiteLocationLookup a, cpac_lookup b,
				WebCPACEvaluStaging
					WHERE WebCPACEvaluStaging.ProviderMasterid
					= b.evalee and a.webcode = b.sitecode 
					AND A.webcode is not null	


	CREATE TABLE #TEMP7
		(PROVIDERMASTERID int,
		CONVERTDATE varchar (10),
		CONVERTDATEDAY varchar(10),
		CONVERTDATEYEAR varchar (10),
		CONVERTDATEMONTH varchar (10))
		INSERT INTO #TEMP7
			(PROVIDERMASTERID,
			CONVERTDATEMONTH,
			CONVERTDATEDAY,
			CONVERTDATEYEAR)
				SELECT PROVIDERMASTERID, 
				DatePart(m, CurrentLevelDate),
				DatePart(d, CurrentLevelDate),
				DatePart(yy, CurrentLevelDate)
					FROM WEBCPACEvalHeaderStaging

	UPDATE #TEMP7
		SET CONVERTDATE = 
			CONVERTDATEMONTH + '/' + CONVERTDATEDAY + '/' + CONVERTDATEYEAR

	UPDATE WEBCPACEvaluStaging
		SET 	CurrentLevelandDate = 
			CASE	WHEN b.CurrentLevel in (1,2,3,4)
				THEN b.CurrentLevel + '  ' + #Temp7.CONVERTDATE
				WHEN b.CurrentLevel = 'F'
				THEN 'Full Partner' + '  ' + #Temp7.CONVERTDATE
				ELSE NULL END
			FROM WebCPACEvaluStaging, WebCPACEvalHeaderStaging b, #TEMP7
				WHERE WebCPACEvaluStaging.ProviderMasterID = 
					b.ProviderMasterID AND WebCPACEvaluStaging.Providermasterid = 
					#TEMP7.ProviderMasterID

	TRUNCATE TABLE #TEMP7

	
	INSERT INTO #TEMP7
			(PROVIDERMASTERID,
			CONVERTDATEMONTH,
			CONVERTDATEDAY,
			CONVERTDATEYEAR)
				SELECT PROVIDERMASTERID, 
				DatePart(m, BoardCertificationExpDate),
				DatePart(d, BoardCertificationExpDate),
				DatePart(yy, BoardCertificationExpDate)
					FROM WEBCPACEvalHeaderStaging

		UPDATE #TEMP7
		SET CONVERTDATE = 
			CONVERTDATEMONTH + '/' + CONVERTDATEDAY + '/' + CONVERTDATEYEAR

	UPDATE WEBCPACEvaluStaging
		SET 	BoardStatus = b.BoardCertification + ' ' + #Temp7.CONVERTDATE
			FROM WebCPACEvaluStaging, WebCPACEvalHeaderStaging b, #TEMP7
				WHERE WebCPACEvaluStaging.ProviderMasterID = 
					b.ProviderMasterID AND WebCPACEvaluStaging.Providermasterid = 
					#TEMP7.ProviderMasterID

	UPDATE WEBCPACEvaluStaging
		SET 	Hours = TotalHours,
			AcceleratedAdv = b.AcceleratedAdv,
			AdvancementLevel = b.AdvanceLevel,
			DateofEmployment = b.DateofHire
			FROM WebCPACEvaluStaging, WebCPACEvalHeaderStaging b
				WHERE WebCPACEvaluStaging.ProviderMasterID = b.ProviderMasterID
