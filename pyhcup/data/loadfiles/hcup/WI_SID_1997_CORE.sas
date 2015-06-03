DATA WI97CORE; 
INFILE EBCORE LRECL = 300; 

LENGTH 
       SEQ_SID  7
       PROCESS  6
       YEAR     3
       DSHOSPID $13
       DSNUM    3
       DSTYPE   3
       HOSPST   $2
       AGE      3
       AGEDAY   3
       SEX      3
       RACE     3
       ADAYWK   3
       AMONTH   3
       DQTR     3
       LOS      4
       LOS_X    4
       DISP     3
       DIED     3
       NEOMAT   3
       ATYPE    3
       ASOURCE  3
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
       DX10     $5
       DXV1     3
       DXV2     3
       DXV3     3
       DXV4     3
       DXV5     3
       DXV6     3
       DXV7     3
       DXV8     3
       DXV9     3
       DXV10    3
       DCCHPR1  3
       DCCHPR2  3
       DCCHPR3  3
       DCCHPR4  3
       DCCHPR5  3
       DCCHPR6  3
       DCCHPR7  3
       DCCHPR8  3
       DCCHPR9  3
       DCCHPR10 3
       PRSYS    3
       DSNPR    3
       NPR      3
       PR1      $4
       PR2      $4
       PR3      $4
       PR4      $4
       PR5      $4
       PR6      $4
       PRV1     3
       PRV2     3
       PRV3     3
       PRV4     3
       PRV5     3
       PRV6     3
       PCCHPR1  3
       PCCHPR2  3
       PCCHPR3  3
       PCCHPR4  3
       PCCHPR5  3
       PCCHPR6  3
       PRDAY1   4
       DRG      3
       MDC      3
       DRGVER   3
       DRG10    3
       MDC10    3
       PAY1     3
       PAY1_N   3
       PAY2     3
       PAY2_N   3
       TOTCHG   6
       TOTCHG_X 7
       HOSPID   4
;


LABEL 
      SEQ_SID ='I:HCUP SID record sequence number'
      PROCESS ='I:HCUP discharge processing ID number'
      YEAR    ='Calendar year'
      DSHOSPID='I:Data source hospital ID number'
      DSNUM   ='I:Data source ID number'
      DSTYPE  ='I:Data source type'
      HOSPST  ='Hospital state postal code'
      AGE     ='I:Age in years at admission'
      AGEDAY  ='I:Age in days (when < 1 year)'
      SEX     ='I:Sex'
      RACE    ='I:Race'
      ADAYWK  ='I:Admission day of week'
      AMONTH  ='I:Admission month'
      DQTR    ='I:Discharge quarter'
      LOS     ='I:Length of stay (cleaned)'
      LOS_X   ='I:Length of stay (uncleaned)'
      DISP    ='I:Disposition of patient'
      DIED    ='I:Died during hospitalization'
      NEOMAT  ='I:Neonatal and/or maternal DX and/or PR'
      ATYPE   ='I:Admission type'
      ASOURCE ='I:Admission source'
      DXSYS   ='I:Diagnosis coding system'
      DSNDX   ='I:Max number of diagnoses from source'
      NDX     ='I:Number of diagnoses on this discharge'
      DX1     ='I:Principal diagnosis'
      DX2     ='I:Diagnosis 2'
      DX3     ='I:Diagnosis 3'
      DX4     ='I:Diagnosis 4'
      DX5     ='I:Diagnosis 5'
      DX6     ='I:Diagnosis 6'
      DX7     ='I:Diagnosis 7'
      DX8     ='I:Diagnosis 8'
      DX9     ='I:Diagnosis 9'
      DX10    ='I:Diagnosis 10'
      DXV1    ='I:Validity flag: principal diagnosis'
      DXV2    ='I:Validity flag: diagnosis 2'
      DXV3    ='I:Validity flag: diagnosis 3'
      DXV4    ='I:Validity flag: diagnosis 4'
      DXV5    ='I:Validity flag: diagnosis 5'
      DXV6    ='I:Validity flag: diagnosis 6'
      DXV7    ='I:Validity flag: diagnosis 7'
      DXV8    ='I:Validity flag: diagnosis 8'
      DXV9    ='I:Validity flag: diagnosis 9'
      DXV10   ='I:Validity flag: diagnosis 10'
      DCCHPR1 ='I:CCHPR: principal diagnosis'
      DCCHPR2 ='I:CCHPR: diagnosis 2'
      DCCHPR3 ='I:CCHPR: diagnosis 3'
      DCCHPR4 ='I:CCHPR: diagnosis 4'
      DCCHPR5 ='I:CCHPR: diagnosis 5'
      DCCHPR6 ='I:CCHPR: diagnosis 6'
      DCCHPR7 ='I:CCHPR: diagnosis 7'
      DCCHPR8 ='I:CCHPR: diagnosis 8'
      DCCHPR9 ='I:CCHPR: diagnosis 9'
      DCCHPR10='I:CCHPR: diagnosis 10'
      PRSYS   ='I:Procedure coding system'
      DSNPR   ='I:Max number of procedures from source'
      NPR     ='I:Number of procedures on this discharge'
      PR1     ='I:Principal procedure'
      PR2     ='I:Procedure 2'
      PR3     ='I:Procedure 3'
      PR4     ='I:Procedure 4'
      PR5     ='I:Procedure 5'
      PR6     ='I:Procedure 6'
      PRV1    ='I:Validity flag: principal procedure'
      PRV2    ='I:Validity flag: procedure 2'
      PRV3    ='I:Validity flag: procedure 3'
      PRV4    ='I:Validity flag: procedure 4'
      PRV5    ='I:Validity flag: procedure 5'
      PRV6    ='I:Validity flag: procedure 6'
      PCCHPR1 ='I:CCHPR: principal procedure'
      PCCHPR2 ='I:CCHPR: procedure 2'
      PCCHPR3 ='I:CCHPR: procedure 3'
      PCCHPR4 ='I:CCHPR: procedure 4'
      PCCHPR5 ='I:CCHPR: procedure 5'
      PCCHPR6 ='I:CCHPR: procedure 6'
      PRDAY1  ='I:No. of days from admission to PR1'
      DRG     ='I:DRG in effect on discharge date'
      MDC     ='I:MDC in effect on discharge date'
      DRGVER  ='I:DRG grouper version used on disch date'
      DRG10   ='I:DRG, Version 10'
      MDC10   ='I:MDC, Version 10'
      PAY1    ='I:Primary expected payer, uniform'
      PAY1_N  ='I:Primary expected payer, nonuniform'
      PAY2    ='I:Secondary expected payer, uniform'
      PAY2_N  ='I:Secondary expected payer, nonuniform'
      TOTCHG  ='I:Total charges (cleaned)'
      TOTCHG_X='I:Total charges (from data source)'
      HOSPID  ='HCUP hospital ID number (SSHHH)'
;


FORMAT
       SEQ_SID   Z13.
       HOSPID    Z5.
;


INPUT 
      @1      SEQ_SID   13.
      @14     PROCESS   11.
      @25     YEAR      N2PF.
      @27     DSHOSPID  $CHAR13.
      @40     DSNUM     N2PF.
      @42     DSTYPE    1.
      @43     HOSPST    $CHAR2.
      @45     AGE       N3PF.
      @48     AGEDAY    N3PF.
      @51     SEX       N2PF.
      @53     RACE      N2PF.
      @55     ADAYWK    N2PF.
      @57     AMONTH    N2PF.
      @59     DQTR      1.
      @60     LOS       N5PF.
      @65     LOS_X     N6PF.
      @71     DISP      N2PF.
      @73     DIED      N2PF.
      @75     NEOMAT    1.
      @76     ATYPE     N2PF.
      @78     ASOURCE   N2PF.
      @80     DXSYS     N2PF.
      @82     DSNDX     N2PF.
      @84     NDX       N2PF.
      @86     DX1       $CHAR5.
      @91     DX2       $CHAR5.
      @96     DX3       $CHAR5.
      @101    DX4       $CHAR5.
      @106    DX5       $CHAR5.
      @111    DX6       $CHAR5.
      @116    DX7       $CHAR5.
      @121    DX8       $CHAR5.
      @126    DX9       $CHAR5.
      @131    DX10      $CHAR5.
      @136    DXV1      N2PF.
      @138    DXV2      N2PF.
      @140    DXV3      N2PF.
      @142    DXV4      N2PF.
      @144    DXV5      N2PF.
      @146    DXV6      N2PF.
      @148    DXV7      N2PF.
      @150    DXV8      N2PF.
      @152    DXV9      N2PF.
      @154    DXV10     N2PF.
      @156    DCCHPR1   N3PF.
      @159    DCCHPR2   N3PF.
      @162    DCCHPR3   N3PF.
      @165    DCCHPR4   N3PF.
      @168    DCCHPR5   N3PF.
      @171    DCCHPR6   N3PF.
      @174    DCCHPR7   N3PF.
      @177    DCCHPR8   N3PF.
      @180    DCCHPR9   N3PF.
      @183    DCCHPR10  N3PF.
      @186    PRSYS     N2PF.
      @188    DSNPR     N2PF.
      @190    NPR       N2PF.
      @192    PR1       $CHAR4.
      @196    PR2       $CHAR4.
      @200    PR3       $CHAR4.
      @204    PR4       $CHAR4.
      @208    PR5       $CHAR4.
      @212    PR6       $CHAR4.
      @216    PRV1      N2PF.
      @218    PRV2      N2PF.
      @220    PRV3      N2PF.
      @222    PRV4      N2PF.
      @224    PRV5      N2PF.
      @226    PRV6      N2PF.
      @228    PCCHPR1   N3PF.
      @231    PCCHPR2   N3PF.
      @234    PCCHPR3   N3PF.
      @237    PCCHPR4   N3PF.
      @240    PCCHPR5   N3PF.
      @243    PCCHPR6   N3PF.
      @246    PRDAY1    N5PF.
      @251    DRG       N3PF.
      @254    MDC       N2PF.
      @256    DRGVER    N2PF.
      @258    DRG10     N3PF.
      @261    MDC10     N2PF.
      @263    PAY1      N2PF.
      @265    PAY1_N    N2PF.
      @267    PAY2      N2PF.
      @269    PAY2_N    N2PF.
      @271    TOTCHG    N10PF.
      @281    TOTCHG_X  N15P2F.
      @296    HOSPID    N5PF.
;


