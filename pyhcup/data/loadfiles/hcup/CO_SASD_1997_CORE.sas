DATA CO97ACOR; 
INFILE EBACOR LRECL = 519; 

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
       DX11     $5
       DX12     $5
       DX13     $5
       DX14     $5
       DX15     $5
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
       DXV11    3
       DXV12    3
       DXV13    3
       DXV14    3
       DXV15    3
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
       DCCHPR11 3
       DCCHPR12 3
       DCCHPR13 3
       DCCHPR14 3
       DCCHPR15 3
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
       PR9      $4
       PR10     $4
       PR11     $4
       PR12     $4
       PR13     $4
       PR14     $4
       PR15     $4
       PRV1     3
       PRV2     3
       PRV3     3
       PRV4     3
       PRV5     3
       PRV6     3
       PRV7     3
       PRV8     3
       PRV9     3
       PRV10    3
       PRV11    3
       PRV12    3
       PRV13    3
       PRV14    3
       PRV15    3
       PCCHPR1  3
       PCCHPR2  3
       PCCHPR3  3
       PCCHPR4  3
       PCCHPR5  3
       PCCHPR6  3
       PCCHPR7  3
       PCCHPR8  3
       PCCHPR9  3
       PCCHPR10 3
       PCCHPR11 3
       PCCHPR12 3
       PCCHPR13 3
       PCCHPR14 3
       PCCHPR15 3
       PRDAY1   4
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
      DX11    ='S:Diagnosis 11'
      DX12    ='S:Diagnosis 12'
      DX13    ='S:Diagnosis 13'
      DX14    ='S:Diagnosis 14'
      DX15    ='S:Diagnosis 15'
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
      DXV11   ='S:Validity flag: diagnosis 11'
      DXV12   ='S:Validity flag: diagnosis 12'
      DXV13   ='S:Validity flag: diagnosis 13'
      DXV14   ='S:Validity flag: diagnosis 14'
      DXV15   ='S:Validity flag: diagnosis 15'
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
      DCCHPR11='S:CCHPR: diagnosis 11'
      DCCHPR12='S:CCHPR: diagnosis 12'
      DCCHPR13='S:CCHPR: diagnosis 13'
      DCCHPR14='S:CCHPR: diagnosis 14'
      DCCHPR15='S:CCHPR: diagnosis 15'
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
      PR9     ='S:Procedure 9'
      PR10    ='S:Procedure 10'
      PR11    ='S:Procedure 11'
      PR12    ='S:Procedure 12'
      PR13    ='S:Procedure 13'
      PR14    ='S:Procedure 14'
      PR15    ='S:Procedure 15'
      PRV1    ='S:Validity flag: principal procedure'
      PRV2    ='S:Validity flag: procedure 2'
      PRV3    ='S:Validity flag: procedure 3'
      PRV4    ='S:Validity flag: procedure 4'
      PRV5    ='S:Validity flag: procedure 5'
      PRV6    ='S:Validity flag: procedure 6'
      PRV7    ='S:Validity flag: procedure 7'
      PRV8    ='S:Validity flag: procedure 8'
      PRV9    ='S:Validity flag: procedure 9'
      PRV10   ='S:Validity flag: procedure 10'
      PRV11   ='S:Validity flag: procedure 11'
      PRV12   ='S:Validity flag: procedure 12'
      PRV13   ='S:Validity flag: procedure 13'
      PRV14   ='S:Validity flag: procedure 14'
      PRV15   ='S:Validity flag: procedure 15'
      PCCHPR1 ='S:CCHPR: principal procedure'
      PCCHPR2 ='S:CCHPR: procedure 2'
      PCCHPR3 ='S:CCHPR: procedure 3'
      PCCHPR4 ='S:CCHPR: procedure 4'
      PCCHPR5 ='S:CCHPR: procedure 5'
      PCCHPR6 ='S:CCHPR: procedure 6'
      PCCHPR7 ='S:CCHPR: procedure 7'
      PCCHPR8 ='S:CCHPR: procedure 8'
      PCCHPR9 ='S:CCHPR: procedure 9'
      PCCHPR10='S:CCHPR: procedure 10'
      PCCHPR11='S:CCHPR: procedure 11'
      PCCHPR12='S:CCHPR: procedure 12'
      PCCHPR13='S:CCHPR: procedure 13'
      PCCHPR14='S:CCHPR: procedure 14'
      PCCHPR15='S:CCHPR: procedure 15'
      PRDAY1  ='S:No. of days from admission to PR1'
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
      @161    DX11      $CHAR5.
      @166    DX12      $CHAR5.
      @171    DX13      $CHAR5.
      @176    DX14      $CHAR5.
      @181    DX15      $CHAR5.
      @186    DXV1      N2PF.
      @188    DXV2      N2PF.
      @190    DXV3      N2PF.
      @192    DXV4      N2PF.
      @194    DXV5      N2PF.
      @196    DXV6      N2PF.
      @198    DXV7      N2PF.
      @200    DXV8      N2PF.
      @202    DXV9      N2PF.
      @204    DXV10     N2PF.
      @206    DXV11     N2PF.
      @208    DXV12     N2PF.
      @210    DXV13     N2PF.
      @212    DXV14     N2PF.
      @214    DXV15     N2PF.
      @216    DCCHPR1   N3PF.
      @219    DCCHPR2   N3PF.
      @222    DCCHPR3   N3PF.
      @225    DCCHPR4   N3PF.
      @228    DCCHPR5   N3PF.
      @231    DCCHPR6   N3PF.
      @234    DCCHPR7   N3PF.
      @237    DCCHPR8   N3PF.
      @240    DCCHPR9   N3PF.
      @243    DCCHPR10  N3PF.
      @246    DCCHPR11  N3PF.
      @249    DCCHPR12  N3PF.
      @252    DCCHPR13  N3PF.
      @255    DCCHPR14  N3PF.
      @258    DCCHPR15  N3PF.
      @261    PRSYS     N2PF.
      @263    DSNPR     N2PF.
      @265    NPR       N2PF.
      @267    PR1       $CHAR4.
      @271    PR2       $CHAR4.
      @275    PR3       $CHAR4.
      @279    PR4       $CHAR4.
      @283    PR5       $CHAR4.
      @287    PR6       $CHAR4.
      @291    PR7       $CHAR4.
      @295    PR8       $CHAR4.
      @299    PR9       $CHAR4.
      @303    PR10      $CHAR4.
      @307    PR11      $CHAR4.
      @311    PR12      $CHAR4.
      @315    PR13      $CHAR4.
      @319    PR14      $CHAR4.
      @323    PR15      $CHAR4.
      @327    PRV1      N2PF.
      @329    PRV2      N2PF.
      @331    PRV3      N2PF.
      @333    PRV4      N2PF.
      @335    PRV5      N2PF.
      @337    PRV6      N2PF.
      @339    PRV7      N2PF.
      @341    PRV8      N2PF.
      @343    PRV9      N2PF.
      @345    PRV10     N2PF.
      @347    PRV11     N2PF.
      @349    PRV12     N2PF.
      @351    PRV13     N2PF.
      @353    PRV14     N2PF.
      @355    PRV15     N2PF.
      @357    PCCHPR1   N3PF.
      @360    PCCHPR2   N3PF.
      @363    PCCHPR3   N3PF.
      @366    PCCHPR4   N3PF.
      @369    PCCHPR5   N3PF.
      @372    PCCHPR6   N3PF.
      @375    PCCHPR7   N3PF.
      @378    PCCHPR8   N3PF.
      @381    PCCHPR9   N3PF.
      @384    PCCHPR10  N3PF.
      @387    PCCHPR11  N3PF.
      @390    PCCHPR12  N3PF.
      @393    PCCHPR13  N3PF.
      @396    PCCHPR14  N3PF.
      @399    PCCHPR15  N3PF.
      @402    PRDAY1    N5PF.
      @407    CPT1      $CHAR5.
      @412    CPT2      $CHAR5.
      @417    CPT3      $CHAR5.
      @422    CPT4      $CHAR5.
      @427    CPT5      $CHAR5.
      @432    CPT6      $CHAR5.
      @437    CPT7      $CHAR5.
      @442    CPT8      $CHAR5.
      @447    CPT9      $CHAR5.
      @452    CPT10     $CHAR5.
      @457    CPT11     $CHAR5.
      @462    CPT12     $CHAR5.
      @467    CPT13     $CHAR5.
      @472    CPT14     $CHAR5.
      @477    CPT15     $CHAR5.
      @482    NCPT      N2PF.
      @484    DSNCPT    N2PF.
      @486    PAY1      N2PF.
      @488    PAY1_N    N2PF.
      @490    TOTCHG    N10PF.
      @500    TOTCHG_X  N15P2F.
      @515    HOSPID    N5PF.
;


