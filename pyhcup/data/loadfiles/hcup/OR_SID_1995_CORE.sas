DATA OR95CORE; 
INFILE EBCORE LRECL = 323; 

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
       ADAYWK   3
       AMONTH   3
       DQTR     3
       LOS      3
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
       PRDAY1   3
       PRDAY2   3
       PRDAY3   3
       PRDAY4   3
       PRDAY5   3
       PRDAY6   3
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
      PRDAY2  ='I:No. of days from admission to PR2'
      PRDAY3  ='I:No. of days from admission to PR3'
      PRDAY4  ='I:No. of days from admission to PR4'
      PRDAY5  ='I:No. of days from admission to PR5'
      PRDAY6  ='I:No. of days from admission to PR6'
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
      @53     ADAYWK    N2PF.
      @55     AMONTH    N2PF.
      @57     DQTR      1.
      @58     LOS       N5PF.
      @63     LOS_X     N6PF.
      @69     DISP      N2PF.
      @71     DIED      N2PF.
      @73     NEOMAT    1.
      @74     ATYPE     N2PF.
      @76     ASOURCE   N2PF.
      @78     DXSYS     N2PF.
      @80     DSNDX     N2PF.
      @82     NDX       N2PF.
      @84     DX1       $CHAR5.
      @89     DX2       $CHAR5.
      @94     DX3       $CHAR5.
      @99     DX4       $CHAR5.
      @104    DX5       $CHAR5.
      @109    DX6       $CHAR5.
      @114    DX7       $CHAR5.
      @119    DX8       $CHAR5.
      @124    DX9       $CHAR5.
      @129    DX10      $CHAR5.
      @134    DXV1      N2PF.
      @136    DXV2      N2PF.
      @138    DXV3      N2PF.
      @140    DXV4      N2PF.
      @142    DXV5      N2PF.
      @144    DXV6      N2PF.
      @146    DXV7      N2PF.
      @148    DXV8      N2PF.
      @150    DXV9      N2PF.
      @152    DXV10     N2PF.
      @154    DCCHPR1   N3PF.
      @157    DCCHPR2   N3PF.
      @160    DCCHPR3   N3PF.
      @163    DCCHPR4   N3PF.
      @166    DCCHPR5   N3PF.
      @169    DCCHPR6   N3PF.
      @172    DCCHPR7   N3PF.
      @175    DCCHPR8   N3PF.
      @178    DCCHPR9   N3PF.
      @181    DCCHPR10  N3PF.
      @184    PRSYS     N2PF.
      @186    DSNPR     N2PF.
      @188    NPR       N2PF.
      @190    PR1       $CHAR4.
      @194    PR2       $CHAR4.
      @198    PR3       $CHAR4.
      @202    PR4       $CHAR4.
      @206    PR5       $CHAR4.
      @210    PR6       $CHAR4.
      @214    PRV1      N2PF.
      @216    PRV2      N2PF.
      @218    PRV3      N2PF.
      @220    PRV4      N2PF.
      @222    PRV5      N2PF.
      @224    PRV6      N2PF.
      @226    PCCHPR1   N3PF.
      @229    PCCHPR2   N3PF.
      @232    PCCHPR3   N3PF.
      @235    PCCHPR4   N3PF.
      @238    PCCHPR5   N3PF.
      @241    PCCHPR6   N3PF.
      @244    PRDAY1    N5PF.
      @249    PRDAY2    N5PF.
      @254    PRDAY3    N5PF.
      @259    PRDAY4    N5PF.
      @264    PRDAY5    N5PF.
      @269    PRDAY6    N5PF.
      @274    DRG       N3PF.
      @277    MDC       N2PF.
      @279    DRGVER    N2PF.
      @281    DRG10     N3PF.
      @284    MDC10     N2PF.
      @286    PAY1      N2PF.
      @288    PAY1_N    N2PF.
      @290    PAY2      N2PF.
      @292    PAY2_N    N2PF.
      @294    TOTCHG    N10PF.
      @304    TOTCHG_X  N15P2F.
      @319    HOSPID    N5PF.
;


