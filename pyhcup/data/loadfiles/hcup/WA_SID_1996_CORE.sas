DATA WA96CORE; 
INFILE EBCORE LRECL = 325; 

LENGTH 
       SEQ_SID  7
       PROCESS  6
       YEAR     3
       DSHOSPID $13
       DSNUM    3
       DSTYPE   3
       HOSPST   $2
       MDID_S   $16
       SURGID_S $16
       AGE      3
       AGEDAY   3
       SEX      3
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
      MDID_S  ='I:Attending physician number (synthetic)'
      SURGID_S='I:Primary surgeon number (synthetic)'
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
      @45     MDID_S    $CHAR16.
      @61     SURGID_S  $CHAR16.
      @77     AGE       N3PF.
      @80     AGEDAY    N3PF.
      @83     SEX       N2PF.
      @85     ADAYWK    N2PF.
      @87     AMONTH    N2PF.
      @89     DQTR      1.
      @90     LOS       N5PF.
      @95     LOS_X     N6PF.
      @101    DISP      N2PF.
      @103    DIED      N2PF.
      @105    NEOMAT    1.
      @106    ATYPE     N2PF.
      @108    ASOURCE   N2PF.
      @110    DXSYS     N2PF.
      @112    DSNDX     N2PF.
      @114    NDX       N2PF.
      @116    DX1       $CHAR5.
      @121    DX2       $CHAR5.
      @126    DX3       $CHAR5.
      @131    DX4       $CHAR5.
      @136    DX5       $CHAR5.
      @141    DX6       $CHAR5.
      @146    DX7       $CHAR5.
      @151    DX8       $CHAR5.
      @156    DX9       $CHAR5.
      @161    DX10      $CHAR5.
      @166    DXV1      N2PF.
      @168    DXV2      N2PF.
      @170    DXV3      N2PF.
      @172    DXV4      N2PF.
      @174    DXV5      N2PF.
      @176    DXV6      N2PF.
      @178    DXV7      N2PF.
      @180    DXV8      N2PF.
      @182    DXV9      N2PF.
      @184    DXV10     N2PF.
      @186    DCCHPR1   N3PF.
      @189    DCCHPR2   N3PF.
      @192    DCCHPR3   N3PF.
      @195    DCCHPR4   N3PF.
      @198    DCCHPR5   N3PF.
      @201    DCCHPR6   N3PF.
      @204    DCCHPR7   N3PF.
      @207    DCCHPR8   N3PF.
      @210    DCCHPR9   N3PF.
      @213    DCCHPR10  N3PF.
      @216    PRSYS     N2PF.
      @218    DSNPR     N2PF.
      @220    NPR       N2PF.
      @222    PR1       $CHAR4.
      @226    PR2       $CHAR4.
      @230    PR3       $CHAR4.
      @234    PR4       $CHAR4.
      @238    PR5       $CHAR4.
      @242    PR6       $CHAR4.
      @246    PRV1      N2PF.
      @248    PRV2      N2PF.
      @250    PRV3      N2PF.
      @252    PRV4      N2PF.
      @254    PRV5      N2PF.
      @256    PRV6      N2PF.
      @258    PCCHPR1   N3PF.
      @261    PCCHPR2   N3PF.
      @264    PCCHPR3   N3PF.
      @267    PCCHPR4   N3PF.
      @270    PCCHPR5   N3PF.
      @273    PCCHPR6   N3PF.
      @276    DRG       N3PF.
      @279    MDC       N2PF.
      @281    DRGVER    N2PF.
      @283    DRG10     N3PF.
      @286    MDC10     N2PF.
      @288    PAY1      N2PF.
      @290    PAY1_N    N2PF.
      @292    PAY2      N2PF.
      @294    PAY2_N    N2PF.
      @296    TOTCHG    N10PF.
      @306    TOTCHG_X  N15P2F.
      @321    HOSPID    N5PF.
;


