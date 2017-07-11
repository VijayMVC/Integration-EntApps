CREATE TABLE [dbo].[Echo_facility] (
    [fac_cd]         CHAR (4)       CONSTRAINT [DF__TEMP_faci__fac_c__22D93C9C] DEFAULT ('') NOT NULL,
    [full_name]      CHAR (40)      CONSTRAINT [DF__TEMP_faci__full___23CD60D5] DEFAULT ('') NOT NULL,
    [zip_def]        CHAR (10)      CONSTRAINT [DF__TEMP_faci__zip_d__24C1850E] DEFAULT ('') NOT NULL,
    [hospname2]      CHAR (40)      CONSTRAINT [DF__TEMP_faci__hospn__25B5A947] DEFAULT ('') NOT NULL,
    [ims_siteid]     INT            CONSTRAINT [DF__TEMP_faci__ims_s__26A9CD80] DEFAULT (0) NOT NULL,
    [meet]           CHAR (1)       CONSTRAINT [DF__TEMP_facil__meet__279DF1B9] DEFAULT ('') NOT NULL,
    [sal]            CHAR (5)       CONSTRAINT [DF__TEMP_facili__sal__289215F2] DEFAULT ('') NOT NULL,
    [addr]           CHAR (30)      CONSTRAINT [DF__TEMP_facil__addr__29863A2B] DEFAULT ('') NOT NULL,
    [patient_id]     CHAR (12)      CONSTRAINT [DF__TEMP_faci__patie__2A7A5E64] DEFAULT ('') NOT NULL,
    [addr2]          CHAR (30)      CONSTRAINT [DF__TEMP_faci__addr2__2B6E829D] DEFAULT ('') NOT NULL,
    [city]           CHAR (20)      CONSTRAINT [DF__TEMP_facil__city__2C62A6D6] DEFAULT ('') NOT NULL,
    [vistor_id]      CHAR (12)      CONSTRAINT [DF__TEMP_faci__visto__2D56CB0F] DEFAULT ('') NOT NULL,
    [state]          CHAR (2)       CONSTRAINT [DF__TEMP_faci__state__2E4AEF48] DEFAULT ('') NOT NULL,
    [zip]            CHAR (10)      CONSTRAINT [DF__TEMP_facili__zip__2F3F1381] DEFAULT ('') NOT NULL,
    [phone]          CHAR (14)      CONSTRAINT [DF__TEMP_faci__phone__303337BA] DEFAULT ('') NOT NULL,
    [contact1]       CHAR (40)      CONSTRAINT [DF__TEMP_faci__conta__31275BF3] DEFAULT ('') NOT NULL,
    [title1]         CHAR (20)      CONSTRAINT [DF__TEMP_faci__title__321B802C] DEFAULT ('') NOT NULL,
    [phone1]         CHAR (14)      CONSTRAINT [DF__TEMP_faci__phone__330FA465] DEFAULT ('') NOT NULL,
    [ext1]           CHAR (4)       CONSTRAINT [DF__TEMP_facil__ext1__3403C89E] DEFAULT ('') NOT NULL,
    [contact2]       CHAR (40)      CONSTRAINT [DF__TEMP_faci__conta__34F7ECD7] DEFAULT ('') NOT NULL,
    [title2]         CHAR (20)      CONSTRAINT [DF__TEMP_faci__title__35EC1110] DEFAULT ('') NOT NULL,
    [phone2]         CHAR (14)      CONSTRAINT [DF__TEMP_faci__phone__36E03549] DEFAULT ('') NOT NULL,
    [ext2]           CHAR (4)       CONSTRAINT [DF__TEMP_facil__ext2__37D45982] DEFAULT ('') NOT NULL,
    [contact3]       CHAR (40)      CONSTRAINT [DF__TEMP_faci__conta__38C87DBB] DEFAULT ('') NOT NULL,
    [title3]         CHAR (20)      CONSTRAINT [DF__TEMP_faci__title__39BCA1F4] DEFAULT ('') NOT NULL,
    [phone3]         CHAR (14)      CONSTRAINT [DF__TEMP_faci__phone__3AB0C62D] DEFAULT ('') NOT NULL,
    [ext3]           CHAR (4)       CONSTRAINT [DF__TEMP_facil__ext3__3BA4EA66] DEFAULT ('') NOT NULL,
    [nation]         CHAR (30)      CONSTRAINT [DF__TEMP_faci__natio__3C990E9F] DEFAULT ('') NOT NULL,
    [beds]           SMALLINT       CONSTRAINT [DF__TEMP_facil__beds__3D8D32D8] DEFAULT (0) NOT NULL,
    [staff]          SMALLINT       CONSTRAINT [DF__TEMP_faci__staff__3E815711] DEFAULT (0) NOT NULL,
    [ytd_tot]        DECIMAL (9, 2) CONSTRAINT [DF__TEMP_faci__ytd_t__3F757B4A] DEFAULT (0) NOT NULL,
    [ytd_pay]        DECIMAL (9, 2) CONSTRAINT [DF__TEMP_faci__ytd_p__40699F83] DEFAULT (0) NOT NULL,
    [proc_fee]       DECIMAL (8, 2) CONSTRAINT [DF__TEMP_faci__proc___415DC3BC] DEFAULT (0) NOT NULL,
    [appt_fee]       DECIMAL (8, 2) CONSTRAINT [DF__TEMP_faci__appt___4251E7F5] DEFAULT (0) NOT NULL,
    [sign_fee]       DECIMAL (8, 2) CONSTRAINT [DF__TEMP_faci__sign___43460C2E] DEFAULT (0) NOT NULL,
    [pro_fee]        DECIMAL (8, 2) CONSTRAINT [DF__TEMP_faci__pro_f__443A3067] DEFAULT (0) NOT NULL,
    [soc_fee]        DECIMAL (8, 2) CONSTRAINT [DF__TEMP_faci__soc_f__452E54A0] DEFAULT (0) NOT NULL,
    [papp_fee]       DECIMAL (8, 2) CONSTRAINT [DF__TEMP_faci__papp___462278D9] DEFAULT (0) NOT NULL,
    [soc_dues]       DECIMAL (8, 2) CONSTRAINT [DF__TEMP_faci__soc_d__47169D12] DEFAULT (0) NOT NULL,
    [billdoctor]     BIT            CONSTRAINT [DF__TEMP_faci__billd__480AC14B] DEFAULT (0) NOT NULL,
    [ins_name]       CHAR (50)      CONSTRAINT [DF__TEMP_faci__ins_n__48FEE584] DEFAULT ('') NOT NULL,
    [ins_addr]       CHAR (40)      CONSTRAINT [DF__TEMP_faci__ins_a__49F309BD] DEFAULT ('') NOT NULL,
    [ins_city]       CHAR (28)      CONSTRAINT [DF__TEMP_faci__ins_c__4AE72DF6] DEFAULT ('') NOT NULL,
    [ins_dea]        CHAR (25)      CONSTRAINT [DF__TEMP_faci__ins_d__4BDB522F] DEFAULT ('') NOT NULL,
    [ins_home]       CHAR (25)      CONSTRAINT [DF__TEMP_faci__ins_h__4CCF7668] DEFAULT ('') NOT NULL,
    [addline1]       TINYINT        CONSTRAINT [DF__TEMP_faci__addli__4DC39AA1] DEFAULT (0) NOT NULL,
    [ins_id]         CHAR (15)      CONSTRAINT [DF__TEMP_faci__ins_i__4EB7BEDA] DEFAULT ('') NOT NULL,
    [ins_med]        CHAR (25)      CONSTRAINT [DF__TEMP_faci__ins_m__4FABE313] DEFAULT ('') NOT NULL,
    [ins_phone]      CHAR (15)      CONSTRAINT [DF__TEMP_faci__ins_p__50A0074C] DEFAULT ('') NOT NULL,
    [ins_pract]      INT            CONSTRAINT [DF__TEMP_faci__ins_p__51942B85] DEFAULT (0) NOT NULL,
    [ins_rep]        CHAR (40)      CONSTRAINT [DF__TEMP_faci__ins_r__52884FBE] DEFAULT ('') NOT NULL,
    [ins_rep_t]      CHAR (40)      CONSTRAINT [DF__TEMP_faci__ins_r__537C73F7] DEFAULT ('') NOT NULL,
    [ins_ssn]        BIT            CONSTRAINT [DF__TEMP_faci__ins_s__54709830] DEFAULT (0) NOT NULL,
    [ins_st]         CHAR (2)       CONSTRAINT [DF__TEMP_faci__ins_s__5564BC69] DEFAULT ('') NOT NULL,
    [pagetext]       CHAR (20)      CONSTRAINT [DF__TEMP_faci__paget__5658E0A2] DEFAULT ('') NOT NULL,
    [ins_type]       TINYINT        CONSTRAINT [DF__TEMP_faci__ins_t__574D04DB] DEFAULT (0) NOT NULL,
    [ins_work]       CHAR (25)      CONSTRAINT [DF__TEMP_faci__ins_w__58412914] DEFAULT ('') NOT NULL,
    [addline2]       TINYINT        CONSTRAINT [DF__TEMP_faci__addli__59354D4D] DEFAULT (0) NOT NULL,
    [ins_zip]        CHAR (10)      CONSTRAINT [DF__TEMP_faci__ins_z__5A297186] DEFAULT ('') NOT NULL,
    [ins_state]      CHAR (25)      CONSTRAINT [DF__TEMP_faci__ins_s__5B1D95BF] DEFAULT ('') NOT NULL,
    [ins_state2]     CHAR (25)      CONSTRAINT [DF__TEMP_faci__ins_s__5C11B9F8] DEFAULT ('') NOT NULL,
    [scanned]        BIT            CONSTRAINT [DF__TEMP_faci__scann__5D05DE31] DEFAULT (0) NOT NULL,
    [ins_a_stat]     CHAR (25)      CONSTRAINT [DF__TEMP_faci__ins_a__5DFA026A] DEFAULT ('') NOT NULL,
    [ins_a_e1]       BIT            CONSTRAINT [DF__TEMP_faci__ins_a__5EEE26A3] DEFAULT (0) NOT NULL,
    [ins_a_e2]       BIT            CONSTRAINT [DF__TEMP_faci__ins_a__5FE24ADC] DEFAULT (0) NOT NULL,
    [ins_a_e3]       BIT            CONSTRAINT [DF__TEMP_faci__ins_a__60D66F15] DEFAULT (0) NOT NULL,
    [ins_a_e4]       BIT            CONSTRAINT [DF__TEMP_faci__ins_a__61CA934E] DEFAULT (0) NOT NULL,
    [ins_a_e5]       BIT            CONSTRAINT [DF__TEMP_faci__ins_a__62BEB787] DEFAULT (0) NOT NULL,
    [ins_a_e6]       BIT            CONSTRAINT [DF__TEMP_faci__ins_a__63B2DBC0] DEFAULT (0) NOT NULL,
    [ins_a_e7]       BIT            CONSTRAINT [DF__TEMP_faci__ins_a__64A6FFF9] DEFAULT (0) NOT NULL,
    [ins_a_e8]       BIT            CONSTRAINT [DF__TEMP_faci__ins_a__659B2432] DEFAULT (0) NOT NULL,
    [ins_a_e9]       BIT            CONSTRAINT [DF__TEMP_faci__ins_a__668F486B] DEFAULT (0) NOT NULL,
    [ins_a_a1]       BIT            CONSTRAINT [DF__TEMP_faci__ins_a__67836CA4] DEFAULT (0) NOT NULL,
    [ins_a_a2]       BIT            CONSTRAINT [DF__TEMP_faci__ins_a__687790DD] DEFAULT (0) NOT NULL,
    [ins_a_a3]       BIT            CONSTRAINT [DF__TEMP_faci__ins_a__696BB516] DEFAULT (0) NOT NULL,
    [ins_a_a4]       BIT            CONSTRAINT [DF__TEMP_faci__ins_a__6A5FD94F] DEFAULT (0) NOT NULL,
    [ins_a_a5]       BIT            CONSTRAINT [DF__TEMP_faci__ins_a__6B53FD88] DEFAULT (0) NOT NULL,
    [ins_a_a6]       BIT            CONSTRAINT [DF__TEMP_faci__ins_a__6C4821C1] DEFAULT (0) NOT NULL,
    [ins_a_a7]       BIT            CONSTRAINT [DF__TEMP_faci__ins_a__6D3C45FA] DEFAULT (0) NOT NULL,
    [ins_a_a8]       BIT            CONSTRAINT [DF__TEMP_faci__ins_a__6E306A33] DEFAULT (0) NOT NULL,
    [ins_a_a9]       BIT            CONSTRAINT [DF__TEMP_faci__ins_a__6F248E6C] DEFAULT (0) NOT NULL,
    [ins_a_a10]      BIT            CONSTRAINT [DF__TEMP_faci__ins_a__7018B2A5] DEFAULT (0) NOT NULL,
    [ins_a_a11]      BIT            CONSTRAINT [DF__TEMP_faci__ins_a__710CD6DE] DEFAULT (0) NOT NULL,
    [ins_a_a12]      BIT            CONSTRAINT [DF__TEMP_faci__ins_a__7200FB17] DEFAULT (0) NOT NULL,
    [use_head]       TINYINT        CONSTRAINT [DF__TEMP_faci__use_h__72F51F50] DEFAULT (0) NOT NULL,
    [ins_a_a13]      BIT            CONSTRAINT [DF__TEMP_faci__ins_a__73E94389] DEFAULT (0) NOT NULL,
    [ins_a_a14]      BIT            CONSTRAINT [DF__TEMP_faci__ins_a__74DD67C2] DEFAULT (0) NOT NULL,
    [ins_a_a15]      BIT            CONSTRAINT [DF__TEMP_faci__ins_a__75D18BFB] DEFAULT (0) NOT NULL,
    [ins_a_a16]      BIT            CONSTRAINT [DF__TEMP_faci__ins_a__76C5B034] DEFAULT (0) NOT NULL,
    [ins_a_a17]      BIT            CONSTRAINT [DF__TEMP_faci__ins_a__77B9D46D] DEFAULT (0) NOT NULL,
    [ins_a_a18]      BIT            CONSTRAINT [DF__TEMP_faci__ins_a__78ADF8A6] DEFAULT (0) NOT NULL,
    [ins_a_a19]      BIT            CONSTRAINT [DF__TEMP_faci__ins_a__79A21CDF] DEFAULT (0) NOT NULL,
    [ins_a_a20]      BIT            CONSTRAINT [DF__TEMP_faci__ins_a__7A964118] DEFAULT (0) NOT NULL,
    [int6]           SMALLINT       CONSTRAINT [DF__TEMP_facil__int6__7B8A6551] DEFAULT (0) NOT NULL,
    [dfdate]         DATETIME       NULL,
    [fr_date]        DATETIME       NULL,
    [to_date]        DATETIME       NULL,
    [dfphone]        CHAR (14)      CONSTRAINT [DF__TEMP_faci__dfpho__7C7E898A] DEFAULT ('') NOT NULL,
    [dfcity]         CHAR (15)      CONSTRAINT [DF__TEMP_faci__dfcit__7D72ADC3] DEFAULT ('') NOT NULL,
    [dfstate]        CHAR (2)       CONSTRAINT [DF__TEMP_faci__dfsta__7E66D1FC] DEFAULT ('') NOT NULL,
    [dfsal]          CHAR (4)       CONSTRAINT [DF__TEMP_faci__dfsal__7F5AF635] DEFAULT ('') NOT NULL,
    [dftitle]        CHAR (7)       CONSTRAINT [DF__TEMP_faci__dftit__004F1A6E] DEFAULT ('') NOT NULL,
    [qalinepath]     CHAR (25)      CONSTRAINT [DF__TEMP_faci__qalin__01433EA7] DEFAULT ('') NOT NULL,
    [udf1]           CHAR (25)      CONSTRAINT [DF__TEMP_facil__udf1__023762E0] DEFAULT ('') NOT NULL,
    [udf2]           CHAR (25)      CONSTRAINT [DF__TEMP_facil__udf2__032B8719] DEFAULT ('') NOT NULL,
    [notes]          TEXT           CONSTRAINT [DF__TEMP_faci__notes__041FAB52] DEFAULT ('') NOT NULL,
    [homehtml]       CHAR (100)     CONSTRAINT [DF__TEMP_faci__homeh__0513CF8B] DEFAULT ('') NOT NULL,
    [udf3]           CHAR (25)      CONSTRAINT [DF__TEMP_facil__udf3__0607F3C4] DEFAULT ('') NOT NULL,
    [udf4]           CHAR (25)      CONSTRAINT [DF__TEMP_facil__udf4__06FC17FD] DEFAULT ('') NOT NULL,
    [d_override]     BIT            CONSTRAINT [DF__TEMP_faci__d_ove__07F03C36] DEFAULT (0) NOT NULL,
    [d_drdis]        BIT            CONSTRAINT [DF__TEMP_faci__d_drd__08E4606F] DEFAULT (0) NOT NULL,
    [d_elg]          BIT            CONSTRAINT [DF__TEMP_faci__d_elg__09D884A8] DEFAULT (0) NOT NULL,
    [age_fmt]        CHAR (1)       CONSTRAINT [DF__TEMP_faci__age_f__0ACCA8E1] DEFAULT ('') NOT NULL,
    [age_limit]      SMALLINT       CONSTRAINT [DF__TEMP_faci__age_l__0BC0CD1A] DEFAULT (0) NOT NULL,
    [hp_code]        CHAR (4)       CONSTRAINT [DF__TEMP_faci__hp_co__0CB4F153] DEFAULT ('') NOT NULL,
    [cp_desc]        CHAR (20)      CONSTRAINT [DF__TEMP_faci__cp_de__0DA9158C] DEFAULT ('') NOT NULL,
    [qpracfile]      CHAR (100)     CONSTRAINT [DF__TEMP_faci__qprac__0E9D39C5] DEFAULT ('') NOT NULL,
    [drheading1]     CHAR (80)      CONSTRAINT [DF__TEMP_faci__drhea__0F915DFE] DEFAULT ('') NOT NULL,
    [drheading2]     CHAR (80)      CONSTRAINT [DF__TEMP_faci__drhea__10858237] DEFAULT ('') NOT NULL,
    [drheading3]     CHAR (80)      CONSTRAINT [DF__TEMP_faci__drhea__1179A670] DEFAULT ('') NOT NULL,
    [drheading4]     CHAR (80)      CONSTRAINT [DF__TEMP_faci__drhea__126DCAA9] DEFAULT ('') NOT NULL,
    [drheading5]     CHAR (80)      CONSTRAINT [DF__TEMP_faci__drhea__1361EEE2] DEFAULT ('') NOT NULL,
    [drprtd0]        DATETIME       NULL,
    [drprtd9]        DATETIME       NULL,
    [drprttitle]     CHAR (70)      CONSTRAINT [DF__TEMP_faci__drprt__1456131B] DEFAULT ('') NOT NULL,
    [drprtcrl]       CHAR (39)      CONSTRAINT [DF__TEMP_faci__drprt__154A3754] DEFAULT ('') NOT NULL,
    [p1_cd]          CHAR (3)       CONSTRAINT [DF__TEMP_faci__p1_cd__163E5B8D] DEFAULT ('') NOT NULL,
    [p1_text]        CHAR (35)      CONSTRAINT [DF__TEMP_faci__p1_te__17327FC6] DEFAULT ('') NOT NULL,
    [next_inv]       INT            CONSTRAINT [DF__TEMP_faci__next___1826A3FF] DEFAULT (0) NOT NULL,
    [ppo]            BIT            CONSTRAINT [DF__TEMP_facili__ppo__191AC838] DEFAULT (0) NOT NULL,
    [hotletter]      CHAR (100)     CONSTRAINT [DF__TEMP_faci__hotle__1A0EEC71] DEFAULT ('') NOT NULL,
    [clist_cd]       CHAR (3)       CONSTRAINT [DF__TEMP_faci__clist__1B0310AA] DEFAULT ('') NOT NULL,
    [fax]            CHAR (14)      CONSTRAINT [DF__TEMP_facili__fax__1BF734E3] DEFAULT ('') NOT NULL,
    [hourslots]      BIT            CONSTRAINT [DF__TEMP_faci__hours__1CEB591C] DEFAULT (0) NOT NULL,
    [ins_a_e10]      BIT            CONSTRAINT [DF__TEMP_faci__ins_a__1DDF7D55] DEFAULT (0) NOT NULL,
    [ins_a_e11]      BIT            CONSTRAINT [DF__TEMP_faci__ins_a__1ED3A18E] DEFAULT (0) NOT NULL,
    [ins_a_e12]      BIT            CONSTRAINT [DF__TEMP_faci__ins_a__1FC7C5C7] DEFAULT (0) NOT NULL,
    [ins_a_e13]      BIT            CONSTRAINT [DF__TEMP_faci__ins_a__20BBEA00] DEFAULT (0) NOT NULL,
    [ins_a_e14]      BIT            CONSTRAINT [DF__TEMP_faci__ins_a__21B00E39] DEFAULT (0) NOT NULL,
    [ins_a_e15]      BIT            CONSTRAINT [DF__TEMP_faci__ins_a__22A43272] DEFAULT (0) NOT NULL,
    [ins_a_e16]      BIT            CONSTRAINT [DF__TEMP_faci__ins_a__239856AB] DEFAULT (0) NOT NULL,
    [ins_a_e17]      BIT            CONSTRAINT [DF__TEMP_faci__ins_a__248C7AE4] DEFAULT (0) NOT NULL,
    [ins_a_e18]      BIT            CONSTRAINT [DF__TEMP_faci__ins_a__25809F1D] DEFAULT (0) NOT NULL,
    [ins_a_e19]      BIT            CONSTRAINT [DF__TEMP_faci__ins_a__2674C356] DEFAULT (0) NOT NULL,
    [ins_a_e20]      BIT            CONSTRAINT [DF__TEMP_faci__ins_a__2768E78F] DEFAULT (0) NOT NULL,
    [ccno]           CHAR (16)      CONSTRAINT [DF__TEMP_facil__ccno__285D0BC8] DEFAULT ('') NOT NULL,
    [ccexp]          DATETIME       NULL,
    [qpracloc]       CHAR (150)     CONSTRAINT [DF__TEMP_faci__qprac__29513001] DEFAULT ('') NOT NULL,
    [patletter]      CHAR (100)     CONSTRAINT [DF__TEMP_faci__patle__2A45543A] DEFAULT ('') NOT NULL,
    [ins_a_zip]      CHAR (10)      CONSTRAINT [DF__TEMP_faci__ins_a__2B397873] DEFAULT ('') NOT NULL,
    [udfgudf1]       CHAR (5)       CONSTRAINT [DF__TEMP_faci__udfgu__2C2D9CAC] DEFAULT ('') NOT NULL,
    [udfgudf2]       CHAR (5)       CONSTRAINT [DF__TEMP_faci__udfgu__2D21C0E5] DEFAULT ('') NOT NULL,
    [tax_stat]       CHAR (5)       CONSTRAINT [DF__TEMP_faci__tax_s__2E15E51E] DEFAULT ('') NOT NULL,
    [udfgudf1dt]     DATETIME       NULL,
    [udfgudf2dt]     DATETIME       NULL,
    [udfgudfc1]      CHAR (60)      CONSTRAINT [DF__TEMP_faci__udfgu__2F0A0957] DEFAULT ('') NOT NULL,
    [udfgudfc2]      CHAR (60)      CONSTRAINT [DF__TEMP_faci__udfgu__2FFE2D90] DEFAULT ('') NOT NULL,
    [udfgudfl1]      BIT            CONSTRAINT [DF__TEMP_faci__udfgu__30F251C9] DEFAULT (0) NOT NULL,
    [udfgudfl2]      BIT            CONSTRAINT [DF__TEMP_faci__udfgu__31E67602] DEFAULT (0) NOT NULL,
    [new_fac]        BIT            CONSTRAINT [DF__TEMP_faci__new_f__32DA9A3B] DEFAULT (0) NOT NULL,
    [facgudf1]       CHAR (5)       CONSTRAINT [DF__TEMP_faci__facgu__33CEBE74] DEFAULT ('') NOT NULL,
    [facgudf2]       CHAR (5)       CONSTRAINT [DF__TEMP_faci__facgu__34C2E2AD] DEFAULT ('') NOT NULL,
    [facgudf1d1]     DATETIME       NULL,
    [facgudf1d2]     DATETIME       NULL,
    [facgudfc1]      CHAR (60)      CONSTRAINT [DF__TEMP_faci__facgu__35B706E6] DEFAULT ('') NOT NULL,
    [facgudfc2]      CHAR (60)      CONSTRAINT [DF__TEMP_faci__facgu__36AB2B1F] DEFAULT ('') NOT NULL,
    [facgudfl1]      BIT            CONSTRAINT [DF__TEMP_faci__facgu__379F4F58] DEFAULT (0) NOT NULL,
    [facgudfl2]      BIT            CONSTRAINT [DF__TEMP_faci__facgu__38937391] DEFAULT (0) NOT NULL,
    [patlist]        CHAR (30)      CONSTRAINT [DF__TEMP_faci__patli__398797CA] DEFAULT ('') NOT NULL,
    [uer_rls_cd]     CHAR (12)      CONSTRAINT [DF__TEMP_faci__uer_r__3A7BBC03] DEFAULT ('') NOT NULL,
    [closeport]      CHAR (2)       CONSTRAINT [DF__TEMP_faci__close__3B6FE03C] DEFAULT ('') NOT NULL,
    [verify_ap]      CHAR (10)      CONSTRAINT [DF__TEMP_faci__verif__3C640475] DEFAULT ('') NOT NULL,
    [verify_re]      CHAR (10)      CONSTRAINT [DF__TEMP_faci__verif__3D5828AE] DEFAULT ('') NOT NULL,
    [q_f_let]        CHAR (100)     CONSTRAINT [DF__TEMP_faci__q_f_l__3E4C4CE7] DEFAULT ('') NOT NULL,
    [quicklist]      CHAR (30)      CONSTRAINT [DF__TEMP_faci__quick__3F407120] DEFAULT ('') NOT NULL,
    [org_type]       CHAR (3)       CONSTRAINT [DF__TEMP_faci__org_t__40349559] DEFAULT ('') NOT NULL,
    [specdept]       BIT            CONSTRAINT [DF__TEMP_faci__specd__4128B992] DEFAULT (0) NOT NULL,
    [link]           INT            IDENTITY (1, 1) NOT NULL,
    [NPDBFolder]     VARCHAR (100)  CONSTRAINT [DF__TEMP_faci__NPDBF__421CDDCB] DEFAULT ('') NOT NULL,
    [NPDBHTTPFolder] VARCHAR (100)  CONSTRAINT [DF__TEMP_faci__NPDBH__43110204] DEFAULT ('') NOT NULL,
    [FSMBFolder]     VARCHAR (100)  CONSTRAINT [DF__TEMP_faci__FSMBF__4405263D] DEFAULT ('') NOT NULL,
    [FSMBHTTPFolder] VARCHAR (100)  CONSTRAINT [DF__TEMP_faci__FSMBH__44F94A76] DEFAULT ('') NOT NULL,
    [ins_a_ed1]      CHAR (25)      CONSTRAINT [DF__TEMP_faci__ins_a__45ED6EAF] DEFAULT ('') NOT NULL,
    [ins_a_ed2]      CHAR (25)      CONSTRAINT [DF__TEMP_faci__ins_a__46E192E8] DEFAULT ('') NOT NULL,
    [ins_a_ed3]      CHAR (25)      CONSTRAINT [DF__TEMP_faci__ins_a__47D5B721] DEFAULT ('') NOT NULL,
    [l_lic_dea]      INT            NULL,
    [l_addr_hm]      INT            NULL,
    [l_addr_wk]      INT            NULL,
    [l_lic_st]       INT            NULL,
    [l_lic_addl]     INT            NULL,
    [link_educ]      TEXT           CONSTRAINT [DF__TEMP_faci__link___48C9DB5A] DEFAULT ('') NOT NULL,
    [EmailSubj]      VARCHAR (100)  CONSTRAINT [DF__TEMP_faci__Email__49BDFF93] DEFAULT ('') NOT NULL,
    [EmailMess]      VARCHAR (200)  CONSTRAINT [DF__TEMP_faci__Email__4AB223CC] DEFAULT ('') NOT NULL,
    CONSTRAINT [PK_facility] PRIMARY KEY NONCLUSTERED ([fac_cd] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [CCEXP]
    ON [dbo].[Echo_facility]([ccexp] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [DFDATE]
    ON [dbo].[Echo_facility]([dfdate] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [DRPRTD0]
    ON [dbo].[Echo_facility]([drprtd0] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [DRPRTD9]
    ON [dbo].[Echo_facility]([drprtd9] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [FACGUDF1D1]
    ON [dbo].[Echo_facility]([facgudf1d1] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [FACGUDF1D2]
    ON [dbo].[Echo_facility]([facgudf1d2] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [FR_DATE]
    ON [dbo].[Echo_facility]([fr_date] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [TO_DATE]
    ON [dbo].[Echo_facility]([to_date] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [UDFGUDF1DT]
    ON [dbo].[Echo_facility]([udfgudf1dt] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [UDFGUDF2DT]
    ON [dbo].[Echo_facility]([udfgudf2dt] ASC) WITH (FILLFACTOR = 90);


GO
CREATE UNIQUE NONCLUSTERED INDEX [facility_link]
    ON [dbo].[Echo_facility]([link] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [org_type]
    ON [dbo].[Echo_facility]([org_type] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [staname]
    ON [dbo].[Echo_facility]([state] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [tax_stat]
    ON [dbo].[Echo_facility]([tax_stat] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [facgudf3]
    ON [dbo].[Echo_facility]([facgudf1] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [facgudf4]
    ON [dbo].[Echo_facility]([facgudf2] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [addr_arr]
    ON [dbo].[Echo_facility]([l_addr_hm] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [addr_arr0]
    ON [dbo].[Echo_facility]([l_addr_wk] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [lic_arr]
    ON [dbo].[Echo_facility]([l_lic_dea] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [lic_arr0]
    ON [dbo].[Echo_facility]([l_lic_st] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [lic_arr1]
    ON [dbo].[Echo_facility]([l_lic_addl] ASC) WITH (FILLFACTOR = 90);


GO
/*  Delete Trigger 'T_D_facility' for Table 'facility'  */
CREATE TRIGGER T_D_facility ON [dbo].[Echo_facility] FOR DELETE AS
BEGIN
    DECLARE
           @row_count       INT,
           @error_number    INT,
           @error_message   VARCHAR(255)
    SELECT @row_count = @@rowcount
    IF @row_count = 0
       RETURN
  SET NOCOUNT ON
   IF 'facility' = 'DRNAME'
       Delete DR_PLAN2 Where L_ADDRESS in
          (Select LINK from ADDRESS Where DR_ID in
          (Select DR_ID from DELETED))
/*  Parent in 'facility' cannot be deleted if children exist in 'stfstatu'  */
IF EXISTS (
           SELECT 1
           FROM   stfstatu c, deleted d
           WHERE  c.fac_cd = d.fac_cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Facility is used in Provider Facility records. Cannot delete this Facility until the Provider Facility records are deleted.'
        GOTO error
   END
/*  Parent in 'facility' cannot be deleted if children exist in 'dr_plan1'  */
IF EXISTS (
           SELECT 1
           FROM   dr_plan1 c, deleted d
           WHERE  c.fac_cd = d.fac_cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Facility is used in  records. Cannot delete this Facility until the  records are deleted.'
        GOTO error
   END
/*  Parent in 'facility' cannot be deleted if children exist in 'dr_chk'  */
IF EXISTS (
           SELECT 1
           FROM   dr_chk c, deleted d
           WHERE  c.fac_cd = d.fac_cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Facility is used in Check List Data records. Cannot delete this Facility until the Check List Data records are deleted.'
        GOTO error
   END
/*  Parent in 'facility' cannot be deleted if children exist in 'fac_udfs1'  */
IF EXISTS (
           SELECT 1
           FROM   fac_udfs1 c, deleted d
           WHERE  c.fac_cd = d.fac_cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Facility is used in Facility Specific UDF1 records. Cannot delete this Facility until the Facility Specific UDF1 records are deleted.'
        GOTO error
   END
/*  Parent in 'facility' cannot be deleted if children exist in 'fac_udfs2'  */
IF EXISTS (
           SELECT 1
           FROM   fac_udfs2 c, deleted d
           WHERE  c.fac_cd = d.fac_cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Facility is used in Facility Specific UDF2 records. Cannot delete this Facility until the Facility Specific UDF2 records are deleted.'
        GOTO error
   END
/*  Parent in 'facility' cannot be deleted if children exist in 'fac_udfs3'  */
IF EXISTS (
           SELECT 1
           FROM   fac_udfs3 c, deleted d
           WHERE  c.fac_cd = d.fac_cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Facility is used in Facility Specific UDF3 records. Cannot delete this Facility until the Facility Specific UDF3 records are deleted.'
        GOTO error
   END
/*  Parent in 'facility' cannot be deleted if children exist in 'fac_udfs4'  */
IF EXISTS (
           SELECT 1
           FROM   fac_udfs4 c, deleted d
           WHERE  c.fac_cd = d.fac_cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Facility is used in Facility Specific UDF4 records. Cannot delete this Facility until the Facility Specific UDF4 records are deleted.'
        GOTO error
   END
/*  Parent in 'facility' cannot be deleted if children exist in 'proctor'  */
IF EXISTS (
           SELECT 1
           FROM   proctor c, deleted d
           WHERE  c.fac_cd = d.fac_cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Facility is used in Proctors records. Cannot delete this Facility until the Proctors records are deleted.'
        GOTO error
   END
/*  Parent in 'facility' cannot be deleted if children exist in 'comte'  */
IF EXISTS (
           SELECT 1
           FROM   comte c, deleted d
           WHERE  c.fac_cd = d.fac_cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Facility is used in Provider Committees records. Cannot delete this Facility until the Provider Committees records are deleted.'
        GOTO error
   END
/*  Parent in 'facility' cannot be deleted if children exist in 'comfile'  */
IF EXISTS (
           SELECT 1
           FROM   comfile c, deleted d
           WHERE  c.fac_cd = d.fac_cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Facility is used in Committees records. Cannot delete this Facility until the Committees records are deleted.'
        GOTO error
   END
/*  Parent in 'facility' cannot be deleted if children exist in 'staffs'  */
IF EXISTS (
           SELECT 1
           FROM   staffs c, deleted d
           WHERE  c.fac_cd = d.fac_cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Facility is used in Staff Status History records. Cannot delete this Facility until the Staff Status History records are deleted.'
        GOTO error
   END
/*  Parent in 'facility' cannot be deleted if children exist in 'depart'  */
IF EXISTS (
           SELECT 1
           FROM   depart c, deleted d
           WHERE  c.fac_cd = d.fac_cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Facility is used in Department History records. Cannot delete this Facility until the Department History records are deleted.'
        GOTO error
   END
/*  Parent in 'facility' cannot be deleted if children exist in 'quahis'  */
IF EXISTS (
           SELECT 1
           FROM   quahis c, deleted d
           WHERE  c.fac_cd = d.fac_cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Facility is used in Quality Assurance History & Insurance Accepted records. Cannot delete this Facility until the Quality Assurance History & Insurance Accepted records are deleted.'
        GOTO error
   END
/*  Parent in 'facility' cannot be deleted if children exist in 'quality'  */
IF EXISTS (
           SELECT 1
           FROM   quality c, deleted d
           WHERE  c.fac_cd = d.fac_cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Facility is used in Quality Assurance Review records. Cannot delete this Facility until the Quality Assurance Review records are deleted.'
        GOTO error
   END
/*  Parent in 'facility' cannot be deleted if children exist in 'aihis'  */
IF EXISTS (
           SELECT 1
           FROM   aihis c, deleted d
           WHERE  c.fac_cd = d.fac_cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Facility is used in Utilization History records. Cannot delete this Facility until the Utilization History records are deleted.'
        GOTO error
   END
/*  Parent in 'facility' cannot be deleted if children exist in 'insrev'  */
IF EXISTS (
           SELECT 1
           FROM   insrev c, deleted d
           WHERE  c.fac_cd = d.fac_cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Facility is used in Insurance Review records. Cannot delete this Facility until the Insurance Review records are deleted.'
        GOTO error
   END
/*  Parent in 'facility' cannot be deleted if children exist in 'supproc'  */
IF EXISTS (
           SELECT 1
           FROM   supproc c, deleted d
           WHERE  c.fac_cd = d.fac_cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Facility is used in Provider Procedures records. Cannot delete this Facility until the Provider Procedures records are deleted.'
        GOTO error
   END
/*  Parent in 'facility' cannot be deleted if children exist in 'mrecst'  */
IF EXISTS (
           SELECT 1
           FROM   mrecst c, deleted d
           WHERE  c.fac_cd = d.fac_cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Facility is used in Provider Medical Record Status records. Cannot delete this Facility until the Provider Medical Record Status records are deleted.'
        GOTO error
   END
/*  Parent in 'facility' cannot be deleted if children exist in 'hrecst'  */
IF EXISTS (
           SELECT 1
           FROM   hrecst c, deleted d
           WHERE  c.fac_cd = d.fac_cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Facility is used in Provider Health Status records. Cannot delete this Facility until the Provider Health Status records are deleted.'
        GOTO error
   END
/*  Parent in 'facility' cannot be deleted if children exist in 'drmeet'  */
IF EXISTS (
           SELECT 1
           FROM   drmeet c, deleted d
           WHERE  c.fac_cd = d.fac_cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Facility is used in Provider Meetings records. Cannot delete this Facility until the Provider Meetings records are deleted.'
        GOTO error
   END
/*  Parent in 'facility' cannot be deleted if children exist in 'ticlet'  */
IF EXISTS (
           SELECT 1
           FROM   ticlet c, deleted d
           WHERE  c.fac_cd = d.fac_cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Facility is used in Provider Letters Sent records. Cannot delete this Facility until the Provider Letters Sent records are deleted.'
        GOTO error
   END
/*  Parent in 'facility' cannot be deleted if children exist in 'applet'  */
IF EXISTS (
           SELECT 1
           FROM   applet c, deleted d
           WHERE  c.fac_cd = d.fac_cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Facility is used in Verification Letters Sent records. Cannot delete this Facility until the Verification Letters Sent records are deleted.'
        GOTO error
   END
/*  Parent in 'facility' cannot be deleted if children exist in 'rs_real'  */
IF EXISTS (
           SELECT 1
           FROM   rs_real c, deleted d
           WHERE  c.fac_cd = d.fac_cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Facility is used in Filter Name records. Cannot delete this Facility until the Filter Name records are deleted.'
        GOTO error
   END
/*  Parent in 'facility' cannot be deleted if children exist in 'er_group'  */
IF EXISTS (
           SELECT 1
           FROM   er_group c, deleted d
           WHERE  c.fac_cd = d.fac_cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Facility is used in  records. Cannot delete this Facility until the  records are deleted.'
        GOTO error
   END
/*  Parent in 'facility' cannot be deleted if children exist in 'ersched'  */
IF EXISTS (
           SELECT 1
           FROM   ersched c, deleted d
           WHERE  c.fac_cd = d.fac_cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Facility is used in ER Schedule records. Cannot delete this Facility until the ER Schedule records are deleted.'
        GOTO error
   END
/*  Parent in 'facility' cannot be deleted if children exist in 'pvfile'  */
IF EXISTS (
           SELECT 1
           FROM   pvfile c, deleted d
           WHERE  c.fac_cd = d.fac_cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Facility is used in Privilege Form records. Cannot delete this Facility until the Privilege Form records are deleted.'
        GOTO error
   END
/*  Parent in 'facility' cannot be deleted if children exist in 'patient'  */
IF EXISTS (
           SELECT 1
           FROM   patient c, deleted d
           WHERE  c.fac_cd = d.fac_cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Facility is used in Patient records. Cannot delete this Facility until the Patient records are deleted.'
        GOTO error
   END
/*  Parent in 'facility' cannot be deleted if children exist in 'Complaint'  */
IF EXISTS (
           SELECT 1
           FROM   Complaint c, deleted d
           WHERE  c.fac_cd = d.fac_cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Facility is used in Complaint records. Cannot delete this Facility until the Complaint records are deleted.'
        GOTO error
   END
/*  Parent in 'facility' cannot be deleted if children exist in 'pattick'  */
IF EXISTS (
           SELECT 1
           FROM   pattick c, deleted d
           WHERE  c.fac_cd = d.fac_cd
          )
   BEGIN
        SELECT @error_number=30005,
               @error_message='This Facility is used in Patient Letter records. Cannot delete this Facility until the Patient Letter records are deleted.'
        GOTO error
   END
/*  Delete all children in 'schedule' of parent 'facility'  */
DELETE schedule
FROM   schedule c, deleted d
WHERE  c.fac_cd = d.fac_cd
/*  Delete all children in 'FacAccess' of parent 'facility'  */
DELETE FacAccess
FROM   FacAccess c, deleted d
WHERE  c.fac_cd = d.fac_cd
RETURN
/*  Error Handling  */
error:
      RAISERROR @error_number @error_message
      ROLLBACK TRANSACTION
END

GO
/*  Update Trigger 'T_U_facility' for Table 'facility'  */
CREATE TRIGGER T_U_facility ON [dbo].[Echo_facility] FOR UPDATE AS
BEGIN
    DECLARE
           @row_count       INT,
           @null_row_count  INT,
           @blank_row_count  INT,
           @error_number    INT,
           @error_message   VARCHAR(255)
    SELECT @row_count = @@rowcount
    IF @row_count = 0
       RETURN
  SET NOCOUNT ON
/*  When updating a row in child 'facility' ,the Foreign Key must be Blank or exist in Parent 'org_type'  */
IF UPDATE(org_type)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  org_type = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   org_type p, inserted i
               WHERE  p.cd = i.org_type
              )
              != @row_count - @blank_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "facility" as its Foreign Key does not exist in "org_type".'
                   GOTO error
              END
   END
/*  When updating a row in child 'facility' ,the Foreign Key must be Blank or exist in Parent 'staname'  */
IF UPDATE(state)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  state = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   staname p, inserted i
               WHERE  p.cd = i.state
              )
              != @row_count - @blank_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "facility" as its Foreign Key does not exist in "staname".'
                   GOTO error
              END
   END
/*  When updating a row in child 'facility' ,the Foreign Key must be Blank or exist in Parent 'tax_stat'  */
IF UPDATE(tax_stat)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  tax_stat = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   tax_stat p, inserted i
               WHERE  p.cd = i.tax_stat
              )
              != @row_count - @blank_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "facility" as its Foreign Key does not exist in "tax_stat".'
                   GOTO error
              END
   END
/*  When updating a row in child 'facility' ,the Foreign Key must be Blank or exist in Parent 'facgudf3'  */
IF UPDATE(facgudf1)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  facgudf1 = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   facgudf3 p, inserted i
               WHERE  p.cd = i.facgudf1
              )
              != @row_count - @blank_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "facility" as its Foreign Key does not exist in "facgudf3".'
                   GOTO error
              END
   END
/*  When updating a row in child 'facility' ,the Foreign Key must be Blank or exist in Parent 'facgudf4'  */
IF UPDATE(facgudf2)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  facgudf2 = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   facgudf4 p, inserted i
               WHERE  p.cd = i.facgudf2
              )
              != @row_count - @blank_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "facility" as its Foreign Key does not exist in "facgudf4".'
                   GOTO error
              END
   END
/*  When updating a row in child 'facility' ,the Foreign Key must be Null or exist in Parent 'addr_arr'  */
IF UPDATE(l_addr_hm)
   BEGIN
        SELECT @null_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  l_addr_hm is null
              )
        IF @null_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   addr_arr p, inserted i
               WHERE  p.Link = i.l_addr_hm
              )
              != @row_count - @null_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "facility".'
                   GOTO error
              END
   END
/*  When updating a row in child 'facility' ,the Foreign Key must be Null or exist in Parent 'addr_arr'  */
IF UPDATE(l_addr_wk)
   BEGIN
        SELECT @null_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  l_addr_wk is null
              )
        IF @null_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   addr_arr p, inserted i
               WHERE  p.Link = i.l_addr_wk
              )
              != @row_count - @null_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "facility".'
                   GOTO error
              END
   END
/*  When updating a row in child 'facility' ,the Foreign Key must be Null or exist in Parent 'lic_arr'  */
IF UPDATE(l_lic_dea)
   BEGIN
        SELECT @null_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  l_lic_dea is null
              )
        IF @null_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   lic_arr p, inserted i
               WHERE  p.Link = i.l_lic_dea
              )
              != @row_count - @null_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "facility".'
                   GOTO error
              END
   END
/*  When updating a row in child 'facility' ,the Foreign Key must be Null or exist in Parent 'lic_arr'  */
IF UPDATE(l_lic_st)
   BEGIN
        SELECT @null_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  l_lic_st is null
              )
        IF @null_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   lic_arr p, inserted i
               WHERE  p.Link = i.l_lic_st
              )
              != @row_count - @null_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "facility".'
                   GOTO error
              END
   END
/*  When updating a row in child 'facility' ,the Foreign Key must be Null or exist in Parent 'lic_arr'  */
IF UPDATE(l_lic_addl)
   BEGIN
        SELECT @null_row_count =
              (
               SELECT COUNT(*)
               FROM   inserted
               WHERE  l_lic_addl is null
              )
        IF @null_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   lic_arr p, inserted i
               WHERE  p.Link = i.l_lic_addl
              )
              != @row_count - @null_row_count
              BEGIN
                   SELECT @error_number=30002,
                          @error_message='Cannot update child in "facility".'
                   GOTO error
              END
   END
/*  When updating a row in child 'facility' ,the Foreign Key must be Blank or exist in Parent 'educ_arr'  */
IF UPDATE(link_educ)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted i join facility c on i.link = c.link
               WHERE c.link_educ like ''
              )
        IF @blank_row_count != @row_count
          BEGIN
            Declare @educ int, @begin int, @len int, @total int,@line varchar(8000)
            Declare EducationLinks Cursor For
              Select c.link_educ From Inserted i join facility c on i.link = c.link
            Open EducationLinks
            Fetch Next From EducationLinks into @line
            While @@Fetch_Status = 0
              Begin 
                Set @total = Len(@line)
                Set @begin = 1
                While @begin < @total
                  Begin
                    Set @begin = @begin + 1
                    Set @len = CharIndex ('|',@line, @begin) - @begin
                    Set @educ = SubString(@line,@begin,@len)
                    If  (
                         Select Count(*) 
                         From educ_arr p 
                         Where p.link = @educ
                         )
                         = 0
                     BEGIN
                       SELECT @error_number=30001,
                          @error_message='Cannot update child in "facility" as its Education Link does not exist in "educ_arr".'
                       Close EducationLinks
                       Deallocate EducationLinks
                       GOTO error
                     END
                    Set @begin = @begin + @len + 1
                End
                Fetch Next From EducationLinks into @line
              End
              Close EducationLinks
              Deallocate EducationLinks
         END
   END
/*  Cascade the Update of the Primary Key of 'facility' into its children in 'stfstatu'  */
IF UPDATE(fac_cd)
   BEGIN
        UPDATE stfstatu
        SET    fac_cd = i.fac_cd
        FROM   stfstatu c, inserted i join deleted d on i.link = d.link
        WHERE  c.fac_cd = d.fac_cd
        AND    (i.fac_cd != d.fac_cd)
   END
/*  Cascade the Update of the Primary Key of 'facility' into its children in 'dr_plan1'  */
IF UPDATE(fac_cd)
   BEGIN
        UPDATE dr_plan1
        SET    fac_cd = i.fac_cd
        FROM   dr_plan1 c, inserted i join deleted d on i.link = d.link
        WHERE  c.fac_cd = d.fac_cd
        AND    (i.fac_cd != d.fac_cd)
   END
/*  Cascade the Update of the Primary Key of 'facility' into its children in 'dr_chk'  */
IF UPDATE(fac_cd)
   BEGIN
        UPDATE dr_chk
        SET    fac_cd = i.fac_cd
        FROM   dr_chk c, inserted i join deleted d on i.link = d.link
        WHERE  c.fac_cd = d.fac_cd
        AND    (i.fac_cd != d.fac_cd)
   END
/*  Cascade the Update of the Primary Key of 'facility' into its children in 'fac_udfs1'  */
IF UPDATE(fac_cd)
   BEGIN
        UPDATE fac_udfs1
        SET    fac_cd = i.fac_cd
        FROM   fac_udfs1 c, inserted i join deleted d on i.link = d.link
        WHERE  c.fac_cd = d.fac_cd
        AND    (i.fac_cd != d.fac_cd)
   END
/*  Cascade the Update of the Primary Key of 'facility' into its children in 'fac_udfs2'  */
IF UPDATE(fac_cd)
   BEGIN
        UPDATE fac_udfs2
        SET    fac_cd = i.fac_cd
        FROM   fac_udfs2 c, inserted i join deleted d on i.link = d.link
        WHERE  c.fac_cd = d.fac_cd
        AND    (i.fac_cd != d.fac_cd)
   END
/*  Cascade the Update of the Primary Key of 'facility' into its children in 'fac_udfs3'  */
IF UPDATE(fac_cd)
   BEGIN
        UPDATE fac_udfs3
        SET    fac_cd = i.fac_cd
        FROM   fac_udfs3 c, inserted i join deleted d on i.link = d.link
        WHERE  c.fac_cd = d.fac_cd
        AND    (i.fac_cd != d.fac_cd)
   END
/*  Cascade the Update of the Primary Key of 'facility' into its children in 'fac_udfs4'  */
IF UPDATE(fac_cd)
   BEGIN
        UPDATE fac_udfs4
        SET    fac_cd = i.fac_cd
        FROM   fac_udfs4 c, inserted i join deleted d on i.link = d.link
        WHERE  c.fac_cd = d.fac_cd
        AND    (i.fac_cd != d.fac_cd)
   END
/*  Cascade the Update of the Primary Key of 'facility' into its children in 'proctor'  */
IF UPDATE(fac_cd)
   BEGIN
        UPDATE proctor
        SET    fac_cd = i.fac_cd
        FROM   proctor c, inserted i join deleted d on i.link = d.link
        WHERE  c.fac_cd = d.fac_cd
        AND    (i.fac_cd != d.fac_cd)
   END
/*  Cascade the Update of the Primary Key of 'facility' into its children in 'comte'  */
IF UPDATE(fac_cd)
   BEGIN
        UPDATE comte
        SET    fac_cd = i.fac_cd
        FROM   comte c, inserted i join deleted d on i.link = d.link
        WHERE  c.fac_cd = d.fac_cd
        AND    (i.fac_cd != d.fac_cd)
   END
/*  Cascade the Update of the Primary Key of 'facility' into its children in 'comfile'  */
IF UPDATE(fac_cd)
   BEGIN
        UPDATE comfile
        SET    fac_cd = i.fac_cd
        FROM   comfile c, inserted i join deleted d on i.link = d.link
        WHERE  c.fac_cd = d.fac_cd
        AND    (i.fac_cd != d.fac_cd)
   END
/*  Cascade the Update of the Primary Key of 'facility' into its children in 'staffs'  */
IF UPDATE(fac_cd)
   BEGIN
        UPDATE staffs
        SET    fac_cd = i.fac_cd
        FROM   staffs c, inserted i join deleted d on i.link = d.link
        WHERE  c.fac_cd = d.fac_cd
        AND    (i.fac_cd != d.fac_cd)
   END
/*  Cascade the Update of the Primary Key of 'facility' into its children in 'depart'  */
IF UPDATE(fac_cd)
   BEGIN
        UPDATE depart
        SET    fac_cd = i.fac_cd
        FROM   depart c, inserted i join deleted d on i.link = d.link
        WHERE  c.fac_cd = d.fac_cd
        AND    (i.fac_cd != d.fac_cd)
   END
/*  Cascade the Update of the Primary Key of 'facility' into its children in 'quahis'  */
IF UPDATE(fac_cd)
   BEGIN
        UPDATE quahis
        SET    fac_cd = i.fac_cd
        FROM   quahis c, inserted i join deleted d on i.link = d.link
        WHERE  c.fac_cd = d.fac_cd
        AND    (i.fac_cd != d.fac_cd)
   END
/*  Cascade the Update of the Primary Key of 'facility' into its children in 'quality'  */
IF UPDATE(fac_cd)
   BEGIN
        UPDATE quality
        SET    fac_cd = i.fac_cd
        FROM   quality c, inserted i join deleted d on i.link = d.link
        WHERE  c.fac_cd = d.fac_cd
        AND    (i.fac_cd != d.fac_cd)
   END
/*  Cascade the Update of the Primary Key of 'facility' into its children in 'aihis'  */
IF UPDATE(fac_cd)
   BEGIN
        UPDATE aihis
        SET    fac_cd = i.fac_cd
        FROM   aihis c, inserted i join deleted d on i.link = d.link
        WHERE  c.fac_cd = d.fac_cd
        AND    (i.fac_cd != d.fac_cd)
   END
/*  Cascade the Update of the Primary Key of 'facility' into its children in 'insrev'  */
IF UPDATE(fac_cd)
   BEGIN
        UPDATE insrev
        SET    fac_cd = i.fac_cd
        FROM   insrev c, inserted i join deleted d on i.link = d.link
        WHERE  c.fac_cd = d.fac_cd
        AND    (i.fac_cd != d.fac_cd)
   END
/*  Cascade the Update of the Primary Key of 'facility' into its children in 'supproc'  */
IF UPDATE(fac_cd)
   BEGIN
        UPDATE supproc
        SET    fac_cd = i.fac_cd
        FROM   supproc c, inserted i join deleted d on i.link = d.link
        WHERE  c.fac_cd = d.fac_cd
        AND    (i.fac_cd != d.fac_cd)
   END
/*  Cascade the Update of the Primary Key of 'facility' into its children in 'mrecst'  */
IF UPDATE(fac_cd)
   BEGIN
        UPDATE mrecst
        SET    fac_cd = i.fac_cd
        FROM   mrecst c, inserted i join deleted d on i.link = d.link
        WHERE  c.fac_cd = d.fac_cd
        AND    (i.fac_cd != d.fac_cd)
   END
/*  Cascade the Update of the Primary Key of 'facility' into its children in 'hrecst'  */
IF UPDATE(fac_cd)
   BEGIN
        UPDATE hrecst
        SET    fac_cd = i.fac_cd
        FROM   hrecst c, inserted i join deleted d on i.link = d.link
        WHERE  c.fac_cd = d.fac_cd
        AND    (i.fac_cd != d.fac_cd)
   END
/*  Cascade the Update of the Primary Key of 'facility' into its children in 'drmeet'  */
IF UPDATE(fac_cd)
   BEGIN
        UPDATE drmeet
        SET    fac_cd = i.fac_cd
        FROM   drmeet c, inserted i join deleted d on i.link = d.link
        WHERE  c.fac_cd = d.fac_cd
        AND    (i.fac_cd != d.fac_cd)
   END
/*  Cascade the Update of the Primary Key of 'facility' into its children in 'ticlet'  */
IF UPDATE(fac_cd)
   BEGIN
        UPDATE ticlet
        SET    fac_cd = i.fac_cd
        FROM   ticlet c, inserted i join deleted d on i.link = d.link
        WHERE  c.fac_cd = d.fac_cd
        AND    (i.fac_cd != d.fac_cd)
   END
/*  Cascade the Update of the Primary Key of 'facility' into its children in 'applet'  */
IF UPDATE(fac_cd)
   BEGIN
        UPDATE applet
        SET    fac_cd = i.fac_cd
        FROM   applet c, inserted i join deleted d on i.link = d.link
        WHERE  c.fac_cd = d.fac_cd
        AND    (i.fac_cd != d.fac_cd)
   END
/*  Cascade the Update of the Primary Key of 'facility' into its children in 'rs_real'  */
IF UPDATE(fac_cd)
   BEGIN
        UPDATE rs_real
        SET    fac_cd = i.fac_cd
        FROM   rs_real c, inserted i join deleted d on i.link = d.link
        WHERE  c.fac_cd = d.fac_cd
        AND    (i.fac_cd != d.fac_cd)
   END
/*  Cascade the Update of the Primary Key of 'facility' into its children in 'er_group'  */
IF UPDATE(fac_cd)
   BEGIN
        UPDATE er_group
        SET    fac_cd = i.fac_cd
        FROM   er_group c, inserted i join deleted d on i.link = d.link
        WHERE  c.fac_cd = d.fac_cd
        AND    (i.fac_cd != d.fac_cd)
   END
/*  Cascade the Update of the Primary Key of 'facility' into its children in 'ersched'  */
IF UPDATE(fac_cd)
   BEGIN
        UPDATE ersched
        SET    fac_cd = i.fac_cd
        FROM   ersched c, inserted i join deleted d on i.link = d.link
        WHERE  c.fac_cd = d.fac_cd
        AND    (i.fac_cd != d.fac_cd)
   END
/*  Cascade the Update of the Primary Key of 'facility' into its children in 'pvfile'  */
IF UPDATE(fac_cd)
   BEGIN
        UPDATE pvfile
        SET    fac_cd = i.fac_cd
        FROM   pvfile c, inserted i join deleted d on i.link = d.link
        WHERE  c.fac_cd = d.fac_cd
        AND    (i.fac_cd != d.fac_cd)
   END
/*  Cascade the Update of the Primary Key of 'facility' into its children in 'schedule'  */
IF UPDATE(fac_cd)
   BEGIN
        UPDATE schedule
        SET    fac_cd = i.fac_cd
        FROM   schedule c, inserted i join deleted d on i.link = d.link
        WHERE  c.fac_cd = d.fac_cd
        AND    (i.fac_cd != d.fac_cd)
   END
/*  Cascade the Update of the Primary Key of 'facility' into its children in 'FacAccess'  */
IF UPDATE(fac_cd)
   BEGIN
        UPDATE FacAccess
        SET    fac_cd = i.fac_cd
        FROM   FacAccess c, inserted i join deleted d on i.link = d.link
        WHERE  c.fac_cd = d.fac_cd
        AND    (i.fac_cd != d.fac_cd)
   END
/*  Cascade the Update of the Primary Key of 'facility' into its children in 'patient'  */
IF UPDATE(fac_cd)
   BEGIN
        UPDATE patient
        SET    fac_cd = i.fac_cd
        FROM   patient c, inserted i join deleted d on i.link = d.link
        WHERE  c.fac_cd = d.fac_cd
        AND    (i.fac_cd != d.fac_cd)
   END
/*  Cascade the Update of the Primary Key of 'facility' into its children in 'Complaint'  */
IF UPDATE(fac_cd)
   BEGIN
        UPDATE Complaint
        SET    fac_cd = i.fac_cd
        FROM   Complaint c, inserted i join deleted d on i.link = d.link
        WHERE  c.fac_cd = d.fac_cd
        AND    (i.fac_cd != d.fac_cd)
   END
/*  Cascade the Update of the Primary Key of 'facility' into its children in 'pattick'  */
IF UPDATE(fac_cd)
   BEGIN
        UPDATE pattick
        SET    fac_cd = i.fac_cd
        FROM   pattick c, inserted i join deleted d on i.link = d.link
        WHERE  c.fac_cd = d.fac_cd
        AND    (i.fac_cd != d.fac_cd)
   END
RETURN
/*  Error Handling  */
error:
      RAISERROR @error_number @error_message
      ROLLBACK TRANSACTION
END

GO
CREATE TRIGGER T_D_SysLogin_facility ON [dbo].[Echo_facility] FOR DELETE AS
BEGIN
/*  Delete Trigger 'T_D_SysLogin_facility' for Table 'facility'  */
    DECLARE
      @row_count   INT,
      @fac         VARCHAR (4),
      @right       VARCHAR (6),  -- String being deleted from level_acc2
      @qright      VARCHAR (5),  -- String being deleted from qalfac_cd
      @x           INT,  -- Length of data string in text field
      @y           INT,  -- Length of string being deleted from level_acc2
      @q           INT,  -- Length of string being deleted from qalfac_cd
      @z           INT,  -- Position of first character of string to be deleted in the text string
      @link        INT
    SELECT @row_count = @@rowcount
    IF @row_count = 0
       RETURN
    SET NOCOUNT ON
/*  Remove deleted facility from SysLogin Level_Acc2 and  QALFac_cd */
    DECLARE fac_codes CURSOR
      LOCAL
      FOR SELECT LTRIM(RTRIM(fac_cd)) FROM deleted
    OPEN fac_codes
    DECLARE logins CURSOR
      LOCAL
      STATIC
      FOR SELECT link FROM syslogin
    OPEN logins
    FETCH NEXT FROM fac_codes INTO @fac
    WHILE @@FETCH_STATUS = 0
      BEGIN
        SET @qright = ',' +@fac
        SET @right = @qright + '%'
        SET @q = LEN(@fac) + 2
        SET @y = @q + 1
        FETCH FIRST FROM logins INTO @link
        WHILE @@FETCH_STATUS = 0
          BEGIN
          /*  Clean up level_acc2 */
            SELECT @x = DATALENGTH(level_acc2), @z = CHARINDEX(@right,level_acc2)
              FROM syslogin
              WHERE link = @link
            WHILE @z > 0
              BEGIN
                UPDATE syslogin
                  SET level_acc2 = SUBSTRING(level_acc2,1,@z-1)
                    + SUBSTRING(level_acc2,@z + @y,@x - @y)
                  WHERE link = @link
                SELECT @x = DATALENGTH(level_acc2), @z = CHARINDEX(@right,level_acc2)
                  FROM syslogin
                  WHERE link = @link
              END
          /* Clean up qalfac_cd */
            SELECT @x = DATALENGTH(qalfac_cd), @z = CHARINDEX(@qright, qalfac_cd)
              FROM syslogin
              WHERE link = @link
            WHILE @z > 0
              BEGIN
                UPDATE syslogin
                  SET qalfac_cd = SUBSTRING(qalfac_cd,1,@z-1)
                    + SUBSTRING(qalfac_cd,@z + @y,@x - @q)
                  WHERE link = @link
                SELECT @x = DATALENGTH(qalfac_cd), @z = CHARINDEX(@qright, qalfac_cd)
                  FROM syslogin
                  WHERE link = @link
              END
            FETCH NEXT FROM logins INTO @link
          END
        FETCH NEXT FROM fac_codes INTO @fac
      END
    CLOSE logins
    DEALLOCATE logins
    CLOSE fac_codes
    DEALLOCATE fac_codes
END

GO
/*  Insert Trigger 'T_I_facility' for Table 'facility'  */
CREATE TRIGGER T_I_facility ON [dbo].[Echo_facility] FOR INSERT AS
BEGIN
    DECLARE
           @row_count       INT,
           @null_row_count  INT,
           @blank_row_count  INT,
           @error_number    INT,
           @error_message   VARCHAR(255)
    SELECT @row_count = @@rowcount
    IF @row_count = 0
       RETURN
/*  When inserting a row in child 'facility' ,the Foreign Key must be Blank or exist in Parent 'org_type' */
IF UPDATE(org_type)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE org_type = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   org_type p, inserted i
               WHERE  p.cd = i.org_type
              )
               != @row_count - @blank_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "facility" as its Foreign Key does not exist in "org_type".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'facility' ,the Foreign Key must be Blank or exist in Parent 'staname' */
IF UPDATE(state)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE state = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   staname p, inserted i
               WHERE  p.cd = i.state
              )
               != @row_count - @blank_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "facility" as its Foreign Key does not exist in "staname".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'facility' ,the Foreign Key must be Blank or exist in Parent 'tax_stat' */
IF UPDATE(tax_stat)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE tax_stat = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   tax_stat p, inserted i
               WHERE  p.cd = i.tax_stat
              )
               != @row_count - @blank_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "facility" as its Foreign Key does not exist in "tax_stat".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'facility' ,the Foreign Key must be Blank or exist in Parent 'facgudf3' */
IF UPDATE(facgudf1)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE facgudf1 = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   facgudf3 p, inserted i
               WHERE  p.cd = i.facgudf1
              )
               != @row_count - @blank_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "facility" as its Foreign Key does not exist in "facgudf3".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'facility' ,the Foreign Key must be Blank or exist in Parent 'facgudf4' */
IF UPDATE(facgudf2)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE facgudf2 = ''
              )
        IF @blank_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   facgudf4 p, inserted i
               WHERE  p.cd = i.facgudf2
              )
               != @row_count - @blank_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "facility" as its Foreign Key does not exist in "facgudf4".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'facility' ,the Foreign Key must be Null or exist in Parent 'addr_arr' */
IF UPDATE(Link)
   BEGIN
        SELECT @null_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE l_addr_hm is null
              )
        IF @null_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   addr_arr p, inserted i
               WHERE  p.Link = i.l_addr_hm
              )
               != @row_count - @null_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "facility" as its Foreign Key does not exist in "addr_arr".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'facility' ,the Foreign Key must be Null or exist in Parent 'addr_arr' */
IF UPDATE(Link)
   BEGIN
        SELECT @null_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE l_addr_wk is null
              )
        IF @null_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   addr_arr p, inserted i
               WHERE  p.Link = i.l_addr_wk
              )
               != @row_count - @null_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "facility" as its Foreign Key does not exist in "addr_arr".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'facility' ,the Foreign Key must be Null or exist in Parent 'lic_arr' */
IF UPDATE(Link)
   BEGIN
        SELECT @null_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE l_lic_dea is null
              )
        IF @null_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   lic_arr p, inserted i
               WHERE  p.Link = i.l_lic_dea
              )
               != @row_count - @null_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "facility" as its Foreign Key does not exist in "lic_arr".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'facility' ,the Foreign Key must be Null or exist in Parent 'lic_arr' */
IF UPDATE(Link)
   BEGIN
        SELECT @null_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE l_lic_st is null
              )
        IF @null_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   lic_arr p, inserted i
               WHERE  p.Link = i.l_lic_st
              )
               != @row_count - @null_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "facility" as its Foreign Key does not exist in "lic_arr".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'facility' ,the Foreign Key must be Null or exist in Parent 'lic_arr' */
IF UPDATE(Link)
   BEGIN
        SELECT @null_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted
               WHERE l_lic_addl is null
              )
        IF @null_row_count != @row_count
           IF (
               SELECT COUNT(*)
               FROM   lic_arr p, inserted i
               WHERE  p.Link = i.l_lic_addl
              )
               != @row_count - @null_row_count
               BEGIN
                   SELECT @error_number=30001,
                          @error_message='Cannot insert child in "facility" as its Foreign Key does not exist in "lic_arr".'
                   GOTO error
              END
   END
/*  When inserting a row in child 'facility' ,the Foreign Key must be Blank or exist in Parent 'educ_arr' */
IF UPDATE(link_educ)
   BEGIN
        SELECT @blank_row_count =
              (
               SELECT COUNT(*)
               FROM  inserted i join facility c on i.link = c.link
               WHERE c.link_educ like ''
              )
        IF @blank_row_count != @row_count
          BEGIN
            Declare @educ int, @begin int, @len int, @total int,@line varchar(8000)
            Declare EducationLinks Cursor For
              Select c.link_educ From Inserted i join facility c on i.link = c.link 
            Open EducationLinks
            Fetch Next From EducationLinks into @line
            While @@Fetch_Status = 0
              Begin 
                Set @total = Len(@line)
                Set @begin = 1
                While @begin < @total
                  Begin
                    Set @begin = @begin + 1
                    Set @len = CharIndex ('|',@line, @begin) - @begin
                    Set @educ = SubString(@line,@begin,@len)
                    If  (
                         Select Count(*) 
                         From educ_arr p 
                         Where p.link = @educ
                         )
                         = 0
                     BEGIN
                       SELECT @error_number=30001,
                          @error_message='Cannot insert child in "facility" as its Foreign Key does not exist in "educ_arr".'
                       Close EducationLinks
                       Deallocate EducationLinks
                       GOTO error
                     END
                    Set @begin = @begin + @len + 1
                End
                Fetch Next From EducationLinks into @line
              End
              Close EducationLinks
              Deallocate EducationLinks
         END
   END
RETURN
/*  Error Handling  */
error:
      RAISERROR @error_number @error_message
      ROLLBACK TRANSACTION
END

GO
CREATE TRIGGER T_I_U_facility ON [dbo].[Echo_facility]
 FOR INSERT, UPDATE
 AS
/* This trigger 
1) makes sure the new facility code is not a duplicate after trimming it 
2) makes sure the new facility code does not contain space or special character only 0-9 and a-z are allowed.
*/
 BEGIN
  DECLARE
    @i INT,
    @link INT,
    @row_count INT,
    @error_number INT,
    @id CHAR(4),
    @char CHAR(1),
    @error_message VARCHAR(255)
  SELECT @row_count = @@rowcount
    IF @row_count = 0
      RETURN
    IF UPDATE(fac_cd)
      BEGIN
        Declare cds Cursor for Select fac_cd, link From inserted
        Open cds
        Fetch Next From cds Into @id, @link
        WHILE @@FETCH_STATUS = 0
        Begin
        IF  (
              SELECT COUNT(*)
              FROM facility t
              WHERE LTRIM(RTRIM(t.fac_cd)) = LTRIM(RTRIM(@id)) AND  t.link <> @link
             )
              !=0
        BEGIN
             SELECT @error_number = 50003, 
               @error_message = 'The Facility Code  ' + @id + '  is already assigned to a Facility.'
             GOTO error
        END
        IF  LEN(@id) <> LEN(REPLACE(@id,' ',''))
        BEGIN
             SELECT @error_number = 50004, 
               @error_message = 'The Facility Code  ' + @id + '  is invalid.  Spaces are not allowed in the Code.'
             GOTO error
        END
        Set @i = 1
        While @i < 5
        Begin
          Set @char = SubString(@id,@i,1)
          If @char > ' '
          Begin
            If @char like '[^0-9]'
            Begin
              If @char like '[^a-z]'
              Begin
                SELECT @error_number = 50005, 
                 @error_message = 'The Facility Code  ' + @id + '  is invalid.  Special characters are not allowed in the Code.'
                GoTo Error
              End
             End
          End
          Set @i = @i + 1
        End
        Fetch Next From cds Into @id, @link
        End
        CLOSE cds
        DEALLOCATE cds
    END
    RETURN
/*  Error Handling  */
error:
      CLOSE cds
      DEALLOCATE cds
      RAISERROR @error_number @error_message
      ROLLBACK TRANSACTION
END

GO
CREATE TRIGGER T_U_SysLogin_facility ON [dbo].[Echo_facility] FOR UPDATE AS
BEGIN
/*  Update Trigger 'T_U_SysLogin_facility' for Table 'facility'  */
/* If the FAC_CD is updated update SYSLOGIN.LEVEL_ACC2 */
    DECLARE
      @row_count   INT,
      @fac_out         VARCHAR (4),  -- Old facility code
      @fac_in           VARCHAR (4),  -- New facility code
      @fac_old         VARCHAR (6),  -- String being replaced in level_acc2
      @fac_new       VARCHAR (6),  -- Replacor string in level_acc2
      @fac_old_q     VARCHAR (5),  -- String being replaced in QALfac_cd
      @fac_new_q   VARCHAR (5),  --  Replacor string in QALfac_cd
      @qalfac_cd     VARCHAR(8000),   --  Original QalFac_CD
      @link               INT,                   --  Link of SysLogin record being worked on
      @len                INT,                   --  Length of facility code being inserted
      @pos               INT,                   --  Position of character string being replaced
      @tot                 INT                    --  Position after the string being replaced
    SELECT @row_count = @@rowcount
    IF @row_count = 0
       RETURN
    SET NOCOUNT ON
/*  Update changed facility in SYSLOGIN Level_Acc2 and  QALFac_cd */
    IF UPDATE (fac_cd)
      BEGIN
        DECLARE fac_codes CURSOR
          LOCAL
          FOR SELECT LTRIM(RTRIM(d.fac_cd)),  LTRIM(RTRIM(i.fac_cd)) FROM deleted d join inserted i on d.link = i.link
        OPEN fac_codes
        FETCH NEXT FROM fac_codes INTO @fac_out, @fac_in
        WHILE @@FETCH_STATUS = 0
          BEGIN
            SET @fac_old_q = ',' + @fac_out 
            SET @fac_new_q = ',' + @fac_in
            SET @fac_old = @fac_old_q + '%'
            SET @fac_new = @fac_new_q + '%' 
            SET @len = LEN (@fac_old_q)
          /*  Clean up SysLogin.level_acc2 */
            UPDATE SysLogin SET level_acc2 = REPLACE (CAST(level_acc2 AS VARCHAR(8000)), @fac_old, @fac_new)
               WHERE level_acc2 LIKE '%' + @fac_old + '%'
          /*  Clean up SysLogin.qalfac_cd */
           DECLARE qal_codes CURSOR
             LOCAL
             FOR SELECT link, qalfac_cd FROM syslogin where qalfac_cd like '%,' + @fac_out + '%'
           OPEN qal_codes
           FETCH NEXT FROM qal_codes INTO @link,@qalfac_cd
           WHILE @@FETCH_STATUS = 0
              BEGIN
                SET @pos = CharIndex(@fac_old_q, @qalfac_cd)
                SET @tot = @pos + @len
                IF @pos > 0 AND (@tot = LEN (@qalfac_cd) + 1 OR SUBSTRING (@qalfac_cd,@tot,1) = ',')
                  UPDATE SysLogin SET qalfac_cd = STUFF (@qalfac_cd,@pos,@len,@fac_new_q) WHERE link = @link
               FETCH NEXT FROM qal_codes INTO @link, @qalfac_cd
             END
            CLOSE qal_codes
            DEALLOCATE qal_codes
            FETCH NEXT FROM fac_codes INTO @fac_out, @fac_in
          END
        CLOSE fac_codes
        DEALLOCATE fac_codes
      END
END
