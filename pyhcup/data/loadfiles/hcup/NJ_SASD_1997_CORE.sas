DATA NJ97ACOR; 
INFILE EBACOR LRECL = 366; 

LENGTH 
       SEQ_ASD  7
       PROCESS  6
       YEAR     3
       DSHOSPID $13
       DSNUM    3
       DSTYPE   3
       HOSPST   $2
       MDID_S   $16
       SURGID_S $16
       AGE      3
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
       PRDAY1   4
       PRDAY2   4
       PRDAY3   4
       PRDAY4   4
       PRDAY5   4
       PRDAY6   4
       PRDAY7   4
       PRDAY8   4
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
      MDID_S  ='S:Attending physician number (synthetic)'
      SURGID_S='S:Primary surgeon number (synthetic)'
      AGE     ='S:Age in years at admission'
      SEX     ='S:Sex'
      RACE    ='S:Race'
      ADAYWK  ='S:Admission day of week'
      AMONTH  ='S:Admission month'
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
      DX10    ='S:Diagnosis 10'
      DXV1    ='S:Validity flag: principal diagnosis'
      DXV2    ='S:Validity flag: diagnosis 2'
      DXV3    ='S:Validity flag: diagnosis 3'
      DXV4    ='S:Validity flag: diagnosis 4'
      DXV5    ='S:Validity flag: diagnosis 5'
      DXV6    ='S:Validity flag: diagnosis 6'
      DXV7    ='S:Validity flag: diagnosis 7'
      DXV8    ='S:Validity flag: diagnosis 8'
      DXV9    ='S:Validity flag: diagnosis 9'
      DXV10   ='S:Validity flag: diagnosis 10'
      DCCHPR1 ='S:CCHPR: principal diagnosis'
      DCCHPR2 ='S:CCHPR: diagnosis 2'
      DCCHPR3 ='S:CCHPR: diagnosis 3'
      DCCHPR4 ='S:CCHPR: diagnosis 4'
      DCCHPR5 ='S:CCHPR: diagnosis 5'
      DCCHPR6 ='S:CCHPR: diagnosis 6'
      DCCHPR7 ='S:CCHPR: diagnosis 7'
      DCCHPR8 ='S:CCHPR: diagnosis 8'
      DCCHPR9 ='S:CCHPR: diagnosis 9'
      DCCHPR10='S:CCHPR: diagnosis 10'
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
      PRDAY1  ='S:No. of days from admission to PR1'
      PRDAY2  ='S:No. of days from admission to PR2'
      PRDAY3  ='S:No. of days from admission to PR3'
      PRDAY4  ='S:No. of days from admission to PR4'
      PRDAY5  ='S:No. of days from admission to PR5'
      PRDAY6  ='S:No. of days from admission to PR6'
      PRDAY7  ='S:No. of days from admission to PR7'
      PRDAY8  ='S:No. of days from admission to PR8'
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
      @45     MDID_S    $CHAR16.
      @61     SURGID_S  $CHAR16.
      @77     AGE       N3PF.
      @80     SEX       N2PF.
      @82     RACE      N2PF.
      @84     ADAYWK    N2PF.
      @86     AMONTH    N2PF.
      @88     DQTR      1.
      @89     LOS       N5PF.
      @94     LOS_X     N6PF.
      @100    DISP      N2PF.
      @102    DIED      N2PF.
      @104    NEOMAT    1.
      @105    DXSYS     N2PF.
      @107    DSNDX     N2PF.
      @109    NDX       N2PF.
      @111    DX1       $CHAR5.
      @116    DX2       $CHAR5.
      @121    DX3       $CHAR5.
      @126    DX4       $CHAR5.
      @131    DX5       $CHAR5.
      @136    DX6       $CHAR5.
      @141    DX7       $CHAR5.
      @146    DX8       $CHAR5.
      @151    DX9       $CHAR5.
      @156    DX10      $CHAR5.
      @161    DXV1      N2PF.
      @163    DXV2      N2PF.
      @165    DXV3      N2PF.
      @167    DXV4      N2PF.
      @169    DXV5      N2PF.
      @171    DXV6      N2PF.
      @173    DXV7      N2PF.
      @175    DXV8      N2PF.
      @177    DXV9      N2PF.
      @179    DXV10     N2PF.
      @181    DCCHPR1   N3PF.
      @184    DCCHPR2   N3PF.
      @187    DCCHPR3   N3PF.
      @190    DCCHPR4   N3PF.
      @193    DCCHPR5   N3PF.
      @196    DCCHPR6   N3PF.
      @199    DCCHPR7   N3PF.
      @202    DCCHPR8   N3PF.
      @205    DCCHPR9   N3PF.
      @208    DCCHPR10  N3PF.
      @211    PRSYS     N2PF.
      @213    DSNPR     N2PF.
      @215    NPR       N2PF.
      @217    PR1       $CHAR4.
      @221    PR2       $CHAR4.
      @225    PR3       $CHAR4.
      @229    PR4       $CHAR4.
      @233    PR5       $CHAR4.
      @237    PR6       $CHAR4.
      @241    PR7       $CHAR4.
      @245    PR8       $CHAR4.
      @249    PRV1      N2PF.
      @251    PRV2      N2PF.
      @253    PRV3      N2PF.
      @255    PRV4      N2PF.
      @257    PRV5      N2PF.
      @259    PRV6      N2PF.
      @261    PRV7      N2PF.
      @263    PRV8      N2PF.
      @265    PCCHPR1   N3PF.
      @268    PCCHPR2   N3PF.
      @271    PCCHPR3   N3PF.
      @274    PCCHPR4   N3PF.
      @277    PCCHPR5   N3PF.
      @280    PCCHPR6   N3PF.
      @283    PCCHPR7   N3PF.
      @286    PCCHPR8   N3PF.
      @289    PRDAY1    N5PF.
      @294    PRDAY2    N5PF.
      @299    PRDAY3    N5PF.
      @304    PRDAY4    N5PF.
      @309    PRDAY5    N5PF.
      @314    PRDAY6    N5PF.
      @319    PRDAY7    N5PF.
      @324    PRDAY8    N5PF.
      @329    PAY1      N2PF.
      @331    PAY1_N    N2PF.
      @333    PAY2      N2PF.
      @335    PAY2_N    N2PF.
      @337    TOTCHG    N10PF.
      @347    TOTCHG_X  N15P2F.
      @362    HOSPID    N5PF.
;


