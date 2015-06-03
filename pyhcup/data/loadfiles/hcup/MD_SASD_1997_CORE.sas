DATA MD97ACOR; 
INFILE EBACOR LRECL = 342; 

LENGTH 
       SEQ_ASD  7
       PROCESS  6
       YEAR     3
       DSHOSPID $13
       DSNUM    3
       DSTYPE   3
       HOSPST   $2
       SURGID_S $16
       AGE      3
       SEX      3
       RACE     3
       ADAYWK   3
       DQTR     3
       LOS      4
       LOS_X    4
       DISP     3
       DIED     3
       NEOMAT   3
       DXSYS    3
       DSNDX    3
       NDX      3
       DX1      $5
       DX2      $5
       DX3      $5
       DX4      $5
       DX5      $5
       DX6      $5
       DX7      $5
       DX8      $5
       DX9      $5
       DXV1     3
       DXV2     3
       DXV3     3
       DXV4     3
       DXV5     3
       DXV6     3
       DXV7     3
       DXV8     3
       DXV9     3
       DCCHPR1  3
       DCCHPR2  3
       DCCHPR3  3
       DCCHPR4  3
       DCCHPR5  3
       DCCHPR6  3
       DCCHPR7  3
       DCCHPR8  3
       DCCHPR9  3
       PRSYS    3
       DSNPR    3
       NPR      3
       PR1      $4
       PR2      $4
       PR3      $4
       PR4      $4
       PR5      $4
       PR6      $4
       PR7      $4
       PR8      $4
       PRV1     3
       PRV2     3
       PRV3     3
       PRV4     3
       PRV5     3
       PRV6     3
       PRV7     3
       PRV8     3
       PCCHPR1  3
       PCCHPR2  3
       PCCHPR3  3
       PCCHPR4  3
       PCCHPR5  3
       PCCHPR6  3
       PCCHPR7  3
       PCCHPR8  3
       CPT1     $5
       CPT2     $5
       CPT3     $5
       CPT4     $5
       CPT5     $5
       CPT6     $5
       CPT7     $5
       CPT8     $5
       NCPT     3
       DSNCPT   3
       PAY1     3
       PAY1_N   3
       PAY2     3
       PAY2_N   3
       TOTCHG   6
       TOTCHG_X 7
       HOSPID   4
;


LABEL 
      SEQ_ASD ='S:HCUP AS record sequence number'
      PROCESS ='S:HCUP discharge processing ID number'
      YEAR    ='Calendar year'
      DSHOSPID='S:Data source hospital ID number'
      DSNUM   ='S:Data source ID number'
      DSTYPE  ='S:Data source type'
      HOSPST  ='Hospital state postal code'
      SURGID_S='S:Primary surgeon number (synthetic)'
      AGE     ='S:Age in years at admission'
      SEX     ='S:Sex'
      RACE    ='S:Race'
      ADAYWK  ='S:Admission day of week'
      DQTR    ='S:Discharge quarter'
      LOS     ='S:Length of stay (cleaned)'
      LOS_X   ='S:Length of stay (uncleaned)'
      DISP    ='S:Disposition of patient'
      DIED    ='S:Died during hospitalization'
      NEOMAT  ='S:Neonatal and/or maternal DX and/or PR'
      DXSYS   ='S:Diagnosis coding system'
      DSNDX   ='S:Max number of diagnoses from source'
      NDX     ='S:Number of diagnoses on this discharge'
      DX1     ='S:Principal diagnosis'
      DX2     ='S:Diagnosis 2'
      DX3     ='S:Diagnosis 3'
      DX4     ='S:Diagnosis 4'
      DX5     ='S:Diagnosis 5'
      DX6     ='S:Diagnosis 6'
      DX7     ='S:Diagnosis 7'
      DX8     ='S:Diagnosis 8'
      DX9     ='S:Diagnosis 9'
      DXV1    ='S:Validity flag: principal diagnosis'
      DXV2    ='S:Validity flag: diagnosis 2'
      DXV3    ='S:Validity flag: diagnosis 3'
      DXV4    ='S:Validity flag: diagnosis 4'
      DXV5    ='S:Validity flag: diagnosis 5'
      DXV6    ='S:Validity flag: diagnosis 6'
      DXV7    ='S:Validity flag: diagnosis 7'
      DXV8    ='S:Validity flag: diagnosis 8'
      DXV9    ='S:Validity flag: diagnosis 9'
      DCCHPR1 ='S:CCHPR: principal diagnosis'
      DCCHPR2 ='S:CCHPR: diagnosis 2'
      DCCHPR3 ='S:CCHPR: diagnosis 3'
      DCCHPR4 ='S:CCHPR: diagnosis 4'
      DCCHPR5 ='S:CCHPR: diagnosis 5'
      DCCHPR6 ='S:CCHPR: diagnosis 6'
      DCCHPR7 ='S:CCHPR: diagnosis 7'
      DCCHPR8 ='S:CCHPR: diagnosis 8'
      DCCHPR9 ='S:CCHPR: diagnosis 9'
      PRSYS   ='S:Procedure coding system'
      DSNPR   ='S:Max number of procedures from source'
      NPR     ='S:Number of procedures on this discharge'
      PR1     ='S:Principal procedure'
      PR2     ='S:Procedure 2'
      PR3     ='S:Procedure 3'
      PR4     ='S:Procedure 4'
      PR5     ='S:Procedure 5'
      PR6     ='S:Procedure 6'
      PR7     ='S:Procedure 7'
      PR8     ='S:Procedure 8'
      PRV1    ='S:Validity flag: principal procedure'
      PRV2    ='S:Validity flag: procedure 2'
      PRV3    ='S:Validity flag: procedure 3'
      PRV4    ='S:Validity flag: procedure 4'
      PRV5    ='S:Validity flag: procedure 5'
      PRV6    ='S:Validity flag: procedure 6'
      PRV7    ='S:Validity flag: procedure 7'
      PRV8    ='S:Validity flag: procedure 8'
      PCCHPR1 ='S:CCHPR: principal procedure'
      PCCHPR2 ='S:CCHPR: procedure 2'
      PCCHPR3 ='S:CCHPR: procedure 3'
      PCCHPR4 ='S:CCHPR: procedure 4'
      PCCHPR5 ='S:CCHPR: procedure 5'
      PCCHPR6 ='S:CCHPR: procedure 6'
      PCCHPR7 ='S:CCHPR: procedure 7'
      PCCHPR8 ='S:CCHPR: procedure 8'
      CPT1    ='S:CPT/HCP procedure code (1)'
      CPT2    ='S:CPT/HCP procedure code (2)'
      CPT3    ='S:CPT/HCP procedure code (3)'
      CPT4    ='S:CPT/HCP procedure code (4)'
      CPT5    ='S:CPT/HCP procedure code (5)'
      CPT6    ='S:CPT/HCP procedure code (6)'
      CPT7    ='S:CPT/HCP procedure code (7)'
      CPT8    ='S:CPT/HCP procedure code (8)'
      NCPT    ='S:Number of CPT/HCP procedure codes'
      DSNCPT  ='S:Max number of CPT/HCP codes provided'
      PAY1    ='S:Primary expected payer, uniform'
      PAY1_N  ='S:Primary expected payer, nonuniform'
      PAY2    ='S:Secondary expected payer, uniform'
      PAY2_N  ='S:Secondary expected payer, nonuniform'
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
      @14     PROCESS   11.
      @25     YEAR      N2PF.
      @27     DSHOSPID  $CHAR13.
      @40     DSNUM     N2PF.
      @42     DSTYPE    1.
      @43     HOSPST    $CHAR2.
      @45     SURGID_S  $CHAR16.
      @61     AGE       N3PF.
      @64     SEX       N2PF.
      @66     RACE      N2PF.
      @68     ADAYWK    N2PF.
      @70     DQTR      1.
      @71     LOS       N5PF.
      @76     LOS_X     N6PF.
      @82     DISP      N2PF.
      @84     DIED      N2PF.
      @86     NEOMAT    1.
      @87     DXSYS     N2PF.
      @89     DSNDX     N2PF.
      @91     NDX       N2PF.
      @93     DX1       $CHAR5.
      @98     DX2       $CHAR5.
      @103    DX3       $CHAR5.
      @108    DX4       $CHAR5.
      @113    DX5       $CHAR5.
      @118    DX6       $CHAR5.
      @123    DX7       $CHAR5.
      @128    DX8       $CHAR5.
      @133    DX9       $CHAR5.
      @138    DXV1      N2PF.
      @140    DXV2      N2PF.
      @142    DXV3      N2PF.
      @144    DXV4      N2PF.
      @146    DXV5      N2PF.
      @148    DXV6      N2PF.
      @150    DXV7      N2PF.
      @152    DXV8      N2PF.
      @154    DXV9      N2PF.
      @156    DCCHPR1   N3PF.
      @159    DCCHPR2   N3PF.
      @162    DCCHPR3   N3PF.
      @165    DCCHPR4   N3PF.
      @168    DCCHPR5   N3PF.
      @171    DCCHPR6   N3PF.
      @174    DCCHPR7   N3PF.
      @177    DCCHPR8   N3PF.
      @180    DCCHPR9   N3PF.
      @183    PRSYS     N2PF.
      @185    DSNPR     N2PF.
      @187    NPR       N2PF.
      @189    PR1       $CHAR4.
      @193    PR2       $CHAR4.
      @197    PR3       $CHAR4.
      @201    PR4       $CHAR4.
      @205    PR5       $CHAR4.
      @209    PR6       $CHAR4.
      @213    PR7       $CHAR4.
      @217    PR8       $CHAR4.
      @221    PRV1      N2PF.
      @223    PRV2      N2PF.
      @225    PRV3      N2PF.
      @227    PRV4      N2PF.
      @229    PRV5      N2PF.
      @231    PRV6      N2PF.
      @233    PRV7      N2PF.
      @235    PRV8      N2PF.
      @237    PCCHPR1   N3PF.
      @240    PCCHPR2   N3PF.
      @243    PCCHPR3   N3PF.
      @246    PCCHPR4   N3PF.
      @249    PCCHPR5   N3PF.
      @252    PCCHPR6   N3PF.
      @255    PCCHPR7   N3PF.
      @258    PCCHPR8   N3PF.
      @261    CPT1      $CHAR5.
      @266    CPT2      $CHAR5.
      @271    CPT3      $CHAR5.
      @276    CPT4      $CHAR5.
      @281    CPT5      $CHAR5.
      @286    CPT6      $CHAR5.
      @291    CPT7      $CHAR5.
      @296    CPT8      $CHAR5.
      @301    NCPT      N2PF.
      @303    DSNCPT    N2PF.
      @305    PAY1      N2PF.
      @307    PAY1_N    N2PF.
      @309    PAY2      N2PF.
      @311    PAY2_N    N2PF.
      @313    TOTCHG    N10PF.
      @323    TOTCHG_X  N15P2F.
      @338    HOSPID    N5PF.
;


