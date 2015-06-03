DATA AZ_SIDC_96_CORE; 
INFILE EBCORE LRECL = 338; 

LENGTH 
       SEQ_SID  7
       AGE      3
       AGEDAY   3
       SEX      3
       RACE     3
       DQTR     3
       LOS      4
       DISP     3
       DIED     3
       ATYPE    3
       ASOURCE  3
       NDX      3
       DX1      $5
       DXV1     3
       DCCHPR1  3
       NPR      3
       PR1      $4
       PRV1     3
       PCCHPR1  3
       DRG      3
       MDC      3
       DRGVER   3
       DRG10    3
       MDC10    3
       PAY1     3
       TOTCHG   6
       PROCESS  6
       YEAR     3
       DSHOSPID $13
       DSNUM    3
       DSTYPE   3
       HOSPST   $2
       MDID_S   $16
       SURGID_S $16
       ADAYWK   3
       AMONTH   3
       LOS_X    4
       NEOMAT   3
       DXSYS    3
       DSNDX    3
       PRSYS    3
       DSNPR    3
       PRDAY1   4
       PAY1_N   3
       TOTCHG_X 7
       DX2      $5
       DX3      $5
       DX4      $5
       DX5      $5
       DX6      $5
       DX7      $5
       DX8      $5
       DX9      $5
       DX10     $5
       DX11     $5
       DXV2     3
       DXV3     3
       DXV4     3
       DXV5     3
       DXV6     3
       DXV7     3
       DXV8     3
       DXV9     3
       DXV10    3
       DXV11    3
       DCCHPR2  3
       DCCHPR3  3
       DCCHPR4  3
       DCCHPR5  3
       DCCHPR6  3
       DCCHPR7  3
       DCCHPR8  3
       DCCHPR9  3
       DCCHPR10 3
       DCCHPR11 3
       PR2      $4
       PR3      $4
       PR4      $4
       PR5      $4
       PR6      $4
       PRV2     3
       PRV3     3
       PRV4     3
       PRV5     3
       PRV6     3
       PCCHPR2  3
       PCCHPR3  3
       PCCHPR4  3
       PCCHPR5  3
       PCCHPR6  3
       HOSPID   4
;


LABEL 
      SEQ_SID ='I:HCUP SID record sequence number'
      AGE     ='I:Age in years at admission'
      AGEDAY  ='I:Age in days (when < 1 year)'
      SEX     ='I:Sex'
      RACE    ='I:Race'
      DQTR    ='I:Discharge quarter'
      LOS     ='I:Length of stay (cleaned)'
      DISP    ='I:Disposition of patient'
      DIED    ='I:Died during hospitalization'
      ATYPE   ='I:Admission type'
      ASOURCE ='I:Admission source'
      NDX     ='I:Number of diagnoses on this discharge'
      DX1     ='I:Principal diagnosis'
      DXV1    ='I:Validity flag: principal diagnosis'
      DCCHPR1 ='I:CCHPR: principal diagnosis'
      NPR     ='I:Number of procedures on this discharge'
      PR1     ='I:Principal procedure'
      PRV1    ='I:Validity flag: principal procedure'
      PCCHPR1 ='I:CCHPR: principal procedure'
      DRG     ='I:DRG in effect on discharge date'
      MDC     ='I:MDC in effect on discharge date'
      DRGVER  ='I:DRG grouper version used on disch date'
      DRG10   ='I:DRG, Version 10'
      MDC10   ='I:MDC, Version 10'
      PAY1    ='I:Primary expected payer, uniform'
      TOTCHG  ='I:Total charges (cleaned)'
      PROCESS ='I:HCUP discharge processing ID number'
      YEAR    ='Calendar year'
      DSHOSPID='I:Data source hospital ID number'
      DSNUM   ='I:Data source ID number'
      DSTYPE  ='I:Data source type'
      HOSPST  ='Hospital state postal code'
      MDID_S  ='I:Attending physician number (synthetic)'
      SURGID_S='I:Primary surgeon number (synthetic)'
      ADAYWK  ='I:Admission day of week'
      AMONTH  ='I:Admission month'
      LOS_X   ='I:Length of stay (uncleaned)'
      NEOMAT  ='I:Neonatal and/or maternal DX and/or PR'
      DXSYS   ='I:Diagnosis coding system'
      DSNDX   ='I:Max number of diagnoses from source'
      PRSYS   ='I:Procedure coding system'
      DSNPR   ='I:Max number of procedures from source'
      PRDAY1  ='I:No. of days from admission to PR1'
      PAY1_N  ='I:Primary expected payer, nonuniform'
      TOTCHG_X='I:Total charges (from data source)'
      DX2     ='I:Diagnosis 2'
      DX3     ='I:Diagnosis 3'
      DX4     ='I:Diagnosis 4'
      DX5     ='I:Diagnosis 5'
      DX6     ='I:Diagnosis 6'
      DX7     ='I:Diagnosis 7'
      DX8     ='I:Diagnosis 8'
      DX9     ='I:Diagnosis 9'
      DX10    ='I:Diagnosis 10'
      DX11    ='I:Diagnosis 11'
      DXV2    ='I:Validity flag: diagnosis 2'
      DXV3    ='I:Validity flag: diagnosis 3'
      DXV4    ='I:Validity flag: diagnosis 4'
      DXV5    ='I:Validity flag: diagnosis 5'
      DXV6    ='I:Validity flag: diagnosis 6'
      DXV7    ='I:Validity flag: diagnosis 7'
      DXV8    ='I:Validity flag: diagnosis 8'
      DXV9    ='I:Validity flag: diagnosis 9'
      DXV10   ='I:Validity flag: diagnosis 10'
      DXV11   ='I:Validity flag: diagnosis 11'
      DCCHPR2 ='I:CCHPR: diagnosis 2'
      DCCHPR3 ='I:CCHPR: diagnosis 3'
      DCCHPR4 ='I:CCHPR: diagnosis 4'
      DCCHPR5 ='I:CCHPR: diagnosis 5'
      DCCHPR6 ='I:CCHPR: diagnosis 6'
      DCCHPR7 ='I:CCHPR: diagnosis 7'
      DCCHPR8 ='I:CCHPR: diagnosis 8'
      DCCHPR9 ='I:CCHPR: diagnosis 9'
      DCCHPR10='I:CCHPR: diagnosis 10'
      DCCHPR11='I:CCHPR: diagnosis 11'
      PR2     ='I:Procedure 2'
      PR3     ='I:Procedure 3'
      PR4     ='I:Procedure 4'
      PR5     ='I:Procedure 5'
      PR6     ='I:Procedure 6'
      PRV2    ='I:Validity flag: procedure 2'
      PRV3    ='I:Validity flag: procedure 3'
      PRV4    ='I:Validity flag: procedure 4'
      PRV5    ='I:Validity flag: procedure 5'
      PRV6    ='I:Validity flag: procedure 6'
      PCCHPR2 ='I:CCHPR: procedure 2'
      PCCHPR3 ='I:CCHPR: procedure 3'
      PCCHPR4 ='I:CCHPR: procedure 4'
      PCCHPR5 ='I:CCHPR: procedure 5'
      PCCHPR6 ='I:CCHPR: procedure 6'
      HOSPID  ='HCUP hospital ID number (SSHHH)'
;


FORMAT
       SEQ_SID   Z13.
       HOSPID    Z5.
;


INPUT 
      @1      SEQ_SID   13.
      @14     AGE       N3PF.
      @17     AGEDAY    N3PF.
      @20     SEX       N2PF.
      @22     RACE      N2PF.
      @24     DQTR      1.
      @25     LOS       N5PF.
      @30     DISP      N2PF.
      @32     DIED      N2PF.
      @34     ATYPE     N2PF.
      @36     ASOURCE   N2PF.
      @38     NDX       N2PF.
      @40     DX1       $CHAR5.
      @45     DXV1      N2PF.
      @47     DCCHPR1   N3PF.
      @50     NPR       N2PF.
      @52     PR1       $CHAR4.
      @56     PRV1      N2PF.
      @58     PCCHPR1   N3PF.
      @61     DRG       N3PF.
      @64     MDC       N2PF.
      @66     DRGVER    N2PF.
      @68     DRG10     N3PF.
      @71     MDC10     N2PF.
      @73     PAY1      N2PF.
      @75     TOTCHG    N10PF.
      @85     PROCESS   11.
      @96     YEAR      N2PF.
      @98     DSHOSPID  $CHAR13.
      @111    DSNUM     N2PF.
      @113    DSTYPE    1.
      @114    HOSPST    $CHAR2.
      @116    MDID_S    $CHAR16.
      @132    SURGID_S  $CHAR16.
      @148    ADAYWK    N2PF.
      @150    AMONTH    N2PF.
      @152    LOS_X     N6PF.
      @158    NEOMAT    1.
      @159    DXSYS     N2PF.
      @161    DSNDX     N2PF.
      @163    PRSYS     N2PF.
      @165    DSNPR     N2PF.
      @167    PRDAY1    N5PF.
      @172    PAY1_N    N2PF.
      @174    TOTCHG_X  N15P2F.
      @189    DX2       $CHAR5.
      @194    DX3       $CHAR5.
      @199    DX4       $CHAR5.
      @204    DX5       $CHAR5.
      @209    DX6       $CHAR5.
      @214    DX7       $CHAR5.
      @219    DX8       $CHAR5.
      @224    DX9       $CHAR5.
      @229    DX10      $CHAR5.
      @234    DX11      $CHAR5.
      @239    DXV2      N2PF.
      @241    DXV3      N2PF.
      @243    DXV4      N2PF.
      @245    DXV5      N2PF.
      @247    DXV6      N2PF.
      @249    DXV7      N2PF.
      @251    DXV8      N2PF.
      @253    DXV9      N2PF.
      @255    DXV10     N2PF.
      @257    DXV11     N2PF.
      @259    DCCHPR2   N3PF.
      @262    DCCHPR3   N3PF.
      @265    DCCHPR4   N3PF.
      @268    DCCHPR5   N3PF.
      @271    DCCHPR6   N3PF.
      @274    DCCHPR7   N3PF.
      @277    DCCHPR8   N3PF.
      @280    DCCHPR9   N3PF.
      @283    DCCHPR10  N3PF.
      @286    DCCHPR11  N3PF.
      @289    PR2       $CHAR4.
      @293    PR3       $CHAR4.
      @297    PR4       $CHAR4.
      @301    PR5       $CHAR4.
      @305    PR6       $CHAR4.
      @309    PRV2      N2PF.
      @311    PRV3      N2PF.
      @313    PRV4      N2PF.
      @315    PRV5      N2PF.
      @317    PRV6      N2PF.
      @319    PCCHPR2   N3PF.
      @322    PCCHPR3   N3PF.
      @325    PCCHPR4   N3PF.
      @328    PCCHPR5   N3PF.
      @331    PCCHPR6   N3PF.
      @334    HOSPID    N5PF.
;


