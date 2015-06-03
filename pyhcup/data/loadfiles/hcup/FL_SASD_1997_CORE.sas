DATA FL97ACOR; 
INFILE EBACOR LRECL = 243; 

LENGTH 
       SEQ_ASD  7
       YEAR     3
       DSHOSPID $13
       DSTYPE   3
       HOSPST   $2
       MDID_S   $16
       SURGID_S $16
       AGE      3
       SEX      3
       RACE     3
       DQTR     3
       NEOMAT   3
       DXSYS    3
       DSNDX    3
       NDX      3
       DX1      $5
       DX2      $5
       DX3      $5
       DX4      $5
       DX5      $5
       DXV1     3
       DXV2     3
       DXV3     3
       DXV4     3
       DXV5     3
       DCCHPR1  3
       DCCHPR2  3
       DCCHPR3  3
       DCCHPR4  3
       DCCHPR5  3
       PRSYS    3
       CPT1     $5
       CPT2     $5
       CPT3     $5
       CPT4     $5
       CPT5     $5
       CPT6     $5
       CPT7     $5
       CPT8     $5
       CPT9     $5
       CPT10    $5
       CPT11    $5
       CPT12    $5
       CPT13    $5
       CPT14    $5
       CPT15    $5
       NCPT     3
       DSNCPT   3
       PAY1     3
       PAY1_N   3
       TOTCHG   6
       TOTCHG_X 7
       HOSPID   4
;


LABEL 
      SEQ_ASD ='S:HCUP AS record sequence number'
      YEAR    ='Calendar year'
      DSHOSPID='S:Data source hospital ID number'
      DSTYPE  ='S:Data source type'
      HOSPST  ='Hospital state postal code'
      MDID_S  ='S:Attending physician number (synthetic)'
      SURGID_S='S:Primary surgeon number (synthetic)'
      AGE     ='S:Age in years at admission'
      SEX     ='S:Sex'
      RACE    ='S:Race'
      DQTR    ='S:Discharge quarter'
      NEOMAT  ='S:Neonatal and/or maternal DX and/or PR'
      DXSYS   ='S:Diagnosis coding system'
      DSNDX   ='S:Max number of diagnoses from source'
      NDX     ='S:Number of diagnoses on this discharge'
      DX1     ='S:Principal diagnosis'
      DX2     ='S:Diagnosis 2'
      DX3     ='S:Diagnosis 3'
      DX4     ='S:Diagnosis 4'
      DX5     ='S:Diagnosis 5'
      DXV1    ='S:Validity flag: principal diagnosis'
      DXV2    ='S:Validity flag: diagnosis 2'
      DXV3    ='S:Validity flag: diagnosis 3'
      DXV4    ='S:Validity flag: diagnosis 4'
      DXV5    ='S:Validity flag: diagnosis 5'
      DCCHPR1 ='S:CCHPR: principal diagnosis'
      DCCHPR2 ='S:CCHPR: diagnosis 2'
      DCCHPR3 ='S:CCHPR: diagnosis 3'
      DCCHPR4 ='S:CCHPR: diagnosis 4'
      DCCHPR5 ='S:CCHPR: diagnosis 5'
      PRSYS   ='S:Procedure coding system'
      CPT1    ='S:CPT/HCP procedure code (1)'
      CPT2    ='S:CPT/HCP procedure code (2)'
      CPT3    ='S:CPT/HCP procedure code (3)'
      CPT4    ='S:CPT/HCP procedure code (4)'
      CPT5    ='S:CPT/HCP procedure code (5)'
      CPT6    ='S:CPT/HCP procedure code (6)'
      CPT7    ='S:CPT/HCP procedure code (7)'
      CPT8    ='S:CPT/HCP procedure code (8)'
      CPT9    ='S:CPT/HCP procedure code (9)'
      CPT10   ='S:CPT/HCP procedure code (10)'
      CPT11   ='S:CPT/HCP procedure code (11)'
      CPT12   ='S:CPT/HCP procedure code (12)'
      CPT13   ='S:CPT/HCP procedure code (13)'
      CPT14   ='S:CPT/HCP procedure code (14)'
      CPT15   ='S:CPT/HCP procedure code (15)'
      NCPT    ='S:Number of CPT/HCP procedure codes'
      DSNCPT  ='S:Max number of CPT/HCP codes provided'
      PAY1    ='S:Primary expected payer, uniform'
      PAY1_N  ='S:Primary expected payer, nonuniform'
      TOTCHG  ='S:Total charges (cleaned)'
      TOTCHG_X='S:Total charges (from data source)'
      HOSPID  ='HCUP hospital ID number (SSHHH)'
;


FORMAT
       SEQ_ASD   Z13.
       HOSPID    Z5.
;


INPUT 
      @1      SEQ_ASD   13.
      @14     YEAR      N2PF.
      @16     DSHOSPID  $CHAR13.
      @29     DSTYPE    1.
      @30     HOSPST    $CHAR2.
      @32     MDID_S    $CHAR16.
      @48     SURGID_S  $CHAR16.
      @64     AGE       N3PF.
      @67     SEX       N2PF.
      @69     RACE      N2PF.
      @71     DQTR      1.
      @72     NEOMAT    1.
      @73     DXSYS     N2PF.
      @75     DSNDX     N2PF.
      @77     NDX       N2PF.
      @79     DX1       $CHAR5.
      @84     DX2       $CHAR5.
      @89     DX3       $CHAR5.
      @94     DX4       $CHAR5.
      @99     DX5       $CHAR5.
      @104    DXV1      N2PF.
      @106    DXV2      N2PF.
      @108    DXV3      N2PF.
      @110    DXV4      N2PF.
      @112    DXV5      N2PF.
      @114    DCCHPR1   N3PF.
      @117    DCCHPR2   N3PF.
      @120    DCCHPR3   N3PF.
      @123    DCCHPR4   N3PF.
      @126    DCCHPR5   N3PF.
      @129    PRSYS     N2PF.
      @131    CPT1      $CHAR5.
      @136    CPT2      $CHAR5.
      @141    CPT3      $CHAR5.
      @146    CPT4      $CHAR5.
      @151    CPT5      $CHAR5.
      @156    CPT6      $CHAR5.
      @161    CPT7      $CHAR5.
      @166    CPT8      $CHAR5.
      @171    CPT9      $CHAR5.
      @176    CPT10     $CHAR5.
      @181    CPT11     $CHAR5.
      @186    CPT12     $CHAR5.
      @191    CPT13     $CHAR5.
      @196    CPT14     $CHAR5.
      @201    CPT15     $CHAR5.
      @206    NCPT      N2PF.
      @208    DSNCPT    N2PF.
      @210    PAY1      N2PF.
      @212    PAY1_N    N2PF.
      @214    TOTCHG    N10PF.
      @224    TOTCHG_X  N15P2F.
      @239    HOSPID    N5PF.
;


