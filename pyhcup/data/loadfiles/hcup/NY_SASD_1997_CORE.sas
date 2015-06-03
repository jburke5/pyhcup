DATA NY97ACOR; 
INFILE EBACOR LRECL = 208; 

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
       ADAYWK   3
       DQTR     3
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
       DXV1     3
       DXV2     3
       DXV3     3
       DXV4     3
       DXV5     3
       DXV6     3
       DCCHPR1  3
       DCCHPR2  3
       DCCHPR3  3
       DCCHPR4  3
       DCCHPR5  3
       DCCHPR6  3
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
       PAY1     3
       PAY1_N   3
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
      ADAYWK  ='S:Admission day of week'
      DQTR    ='S:Discharge quarter'
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
      DXV1    ='S:Validity flag: principal diagnosis'
      DXV2    ='S:Validity flag: diagnosis 2'
      DXV3    ='S:Validity flag: diagnosis 3'
      DXV4    ='S:Validity flag: diagnosis 4'
      DXV5    ='S:Validity flag: diagnosis 5'
      DXV6    ='S:Validity flag: diagnosis 6'
      DCCHPR1 ='S:CCHPR: principal diagnosis'
      DCCHPR2 ='S:CCHPR: diagnosis 2'
      DCCHPR3 ='S:CCHPR: diagnosis 3'
      DCCHPR4 ='S:CCHPR: diagnosis 4'
      DCCHPR5 ='S:CCHPR: diagnosis 5'
      DCCHPR6 ='S:CCHPR: diagnosis 6'
      PRSYS   ='S:Procedure coding system'
      DSNPR   ='S:Max number of procedures from source'
      NPR     ='S:Number of procedures on this discharge'
      PR1     ='S:Principal procedure'
      PR2     ='S:Procedure 2'
      PR3     ='S:Procedure 3'
      PR4     ='S:Procedure 4'
      PR5     ='S:Procedure 5'
      PR6     ='S:Procedure 6'
      PRV1    ='S:Validity flag: principal procedure'
      PRV2    ='S:Validity flag: procedure 2'
      PRV3    ='S:Validity flag: procedure 3'
      PRV4    ='S:Validity flag: procedure 4'
      PRV5    ='S:Validity flag: procedure 5'
      PRV6    ='S:Validity flag: procedure 6'
      PCCHPR1 ='S:CCHPR: principal procedure'
      PCCHPR2 ='S:CCHPR: procedure 2'
      PCCHPR3 ='S:CCHPR: procedure 3'
      PCCHPR4 ='S:CCHPR: procedure 4'
      PCCHPR5 ='S:CCHPR: procedure 5'
      PCCHPR6 ='S:CCHPR: procedure 6'
      PAY1    ='S:Primary expected payer, uniform'
      PAY1_N  ='S:Primary expected payer, nonuniform'
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
      @66     ADAYWK    N2PF.
      @68     DQTR      1.
      @69     DISP      N2PF.
      @71     DIED      N2PF.
      @73     NEOMAT    1.
      @74     DXSYS     N2PF.
      @76     DSNDX     N2PF.
      @78     NDX       N2PF.
      @80     DX1       $CHAR5.
      @85     DX2       $CHAR5.
      @90     DX3       $CHAR5.
      @95     DX4       $CHAR5.
      @100    DX5       $CHAR5.
      @105    DX6       $CHAR5.
      @110    DXV1      N2PF.
      @112    DXV2      N2PF.
      @114    DXV3      N2PF.
      @116    DXV4      N2PF.
      @118    DXV5      N2PF.
      @120    DXV6      N2PF.
      @122    DCCHPR1   N3PF.
      @125    DCCHPR2   N3PF.
      @128    DCCHPR3   N3PF.
      @131    DCCHPR4   N3PF.
      @134    DCCHPR5   N3PF.
      @137    DCCHPR6   N3PF.
      @140    PRSYS     N2PF.
      @142    DSNPR     N2PF.
      @144    NPR       N2PF.
      @146    PR1       $CHAR4.
      @150    PR2       $CHAR4.
      @154    PR3       $CHAR4.
      @158    PR4       $CHAR4.
      @162    PR5       $CHAR4.
      @166    PR6       $CHAR4.
      @170    PRV1      N2PF.
      @172    PRV2      N2PF.
      @174    PRV3      N2PF.
      @176    PRV4      N2PF.
      @178    PRV5      N2PF.
      @180    PRV6      N2PF.
      @182    PCCHPR1   N3PF.
      @185    PCCHPR2   N3PF.
      @188    PCCHPR3   N3PF.
      @191    PCCHPR4   N3PF.
      @194    PCCHPR5   N3PF.
      @197    PCCHPR6   N3PF.
      @200    PAY1      N2PF.
      @202    PAY1_N    N2PF.
      @204    HOSPID    N5PF.
;


