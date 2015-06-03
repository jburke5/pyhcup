DATA FL_SIDC_1999_CORE; 
INFILE EBCORE LRECL = 319; 

LENGTH 
       KEY                 8
       AGE                 3
       ASOURCE             3
       ASOURCE_X           $2
       ATYPE               3
       AWEEKEND            3
       DIED                3
       DISPUB92            3
       DISPUNIFORM         3
       DISP_X              $2
       DQTR                3
       DRG                 3
       DRG10               3
       DRG18               3
       DRGVER              3
       DSHOSPID            $13
       DX1                 $5
       DX2                 $5
       DX3                 $5
       DX4                 $5
       DX5                 $5
       DX6                 $5
       DX7                 $5
       DX8                 $5
       DX9                 $5
       DX10                $5
       DXCCS1              4
       DXCCS2              4
       DXCCS3              4
       DXCCS4              4
       DXCCS5              4
       DXCCS6              4
       DXCCS7              4
       DXCCS8              4
       DXCCS9              4
       DXCCS10             4
       FEMALE              3
       HOSPST              $2
       LOS                 4
       LOS_X               4
       MDC                 3
       MDC10               3
       MDC18               3
       MDID_S              $16
       NDX                 3
       NEOMAT              3
       NPR                 3
       PAY1                3
       PAY1_X              $1
       PR1                 $4
       PR2                 $4
       PR3                 $4
       PR4                 $4
       PR5                 $4
       PR6                 $4
       PR7                 $4
       PR8                 $4
       PR9                 $4
       PR10                $4
       PRCCS1              3
       PRCCS2              3
       PRCCS3              3
       PRCCS4              3
       PRCCS5              3
       PRCCS6              3
       PRCCS7              3
       PRCCS8              3
       PRCCS9              3
       PRCCS10             3
       PRDAY1              4
       RACE                3
       RACE_X              $1
       SURGID_S            $16
       TOTCHG              6
       TOTCHG_X            7
       YEAR                3
       ZIP                 $5
;


LABEL 
      KEY                 ='HCUP record identifier'
      AGE                 ='Age in years at admission'
      ASOURCE             ='Admission source (uniform)'
      ASOURCE_X           ='Admission source (as received from source)'
      ATYPE               ='Admission type'
      AWEEKEND            ='Admission day is a weekend'
      DIED                ='Died during hospitalization'
      DISPUB92            ='Disposition of patient (UB-92 standard coding)'
      DISPUNIFORM         ='Disposition of patient (uniform)'
      DISP_X              ='Disposition of patient (as received from source)'
      DQTR                ='Discharge quarter'
      DRG                 ='DRG in effect on discharge date'
      DRG10               ='DRG, version 10'
      DRG18               ='DRG, version 18'
      DRGVER              ='DRG grouper version used on discharge date'
      DSHOSPID            ='Data source hospital identifier'
      DX1                 ='Principal diagnosis'
      DX2                 ='Diagnosis 2'
      DX3                 ='Diagnosis 3'
      DX4                 ='Diagnosis 4'
      DX5                 ='Diagnosis 5'
      DX6                 ='Diagnosis 6'
      DX7                 ='Diagnosis 7'
      DX8                 ='Diagnosis 8'
      DX9                 ='Diagnosis 9'
      DX10                ='Diagnosis 10'
      DXCCS1              ='CCS: principal diagnosis'
      DXCCS2              ='CCS: diagnosis 2'
      DXCCS3              ='CCS: diagnosis 3'
      DXCCS4              ='CCS: diagnosis 4'
      DXCCS5              ='CCS: diagnosis 5'
      DXCCS6              ='CCS: diagnosis 6'
      DXCCS7              ='CCS: diagnosis 7'
      DXCCS8              ='CCS: diagnosis 8'
      DXCCS9              ='CCS: diagnosis 9'
      DXCCS10             ='CCS: diagnosis 10'
      FEMALE              ='Indicator of sex'
      HOSPST              ='Hospital state postal code'
      LOS                 ='Length of stay (cleaned)'
      LOS_X               ='Length of stay (uncleaned)'
      MDC                 ='MDC in effect on discharge date'
      MDC10               ='MDC, version 10'
      MDC18               ='MDC, version 18'
      MDID_S              ='Attending physician number (synthetic)'
      NDX                 ='Number of diagnoses on this record'
      NEOMAT              ='Neonatal and/or maternal DX and/or PR'
      NPR                 ='Number of procedures on this record'
      PAY1                ='Primary expected payer (uniform)'
      PAY1_X              ='Primary expected payer (as received from source)'
      PR1                 ='Principal procedure'
      PR2                 ='Procedure 2'
      PR3                 ='Procedure 3'
      PR4                 ='Procedure 4'
      PR5                 ='Procedure 5'
      PR6                 ='Procedure 6'
      PR7                 ='Procedure 7'
      PR8                 ='Procedure 8'
      PR9                 ='Procedure 9'
      PR10                ='Procedure 10'
      PRCCS1              ='CCS: principal procedure'
      PRCCS2              ='CCS: procedure 2'
      PRCCS3              ='CCS: procedure 3'
      PRCCS4              ='CCS: procedure 4'
      PRCCS5              ='CCS: procedure 5'
      PRCCS6              ='CCS: procedure 6'
      PRCCS7              ='CCS: procedure 7'
      PRCCS8              ='CCS: procedure 8'
      PRCCS9              ='CCS: procedure 9'
      PRCCS10             ='CCS: procedure 10'
      PRDAY1              ='Number of days from admission to PR1'
      RACE                ='Race (uniform)'
      RACE_X              ='Race (as received from source)'
      SURGID_S            ='Primary surgeon number (synthetic)'
      TOTCHG              ='Total charges (cleaned)'
      TOTCHG_X            ='Total charges (as received from source)'
      YEAR                ='Calendar year'
      ZIP                 ='Patient zip code'
;


FORMAT
       KEY                 Z14.
;


INPUT 
      @1      KEY                 14.
      @15     AGE                 N3PF.
      @18     ASOURCE             N2PF.
      @20     ASOURCE_X           $CHAR2.
      @22     ATYPE               N2PF.
      @24     AWEEKEND            N2PF.
      @26     DIED                N2PF.
      @28     DISPUB92            N2PF.
      @30     DISPUNIFORM         N2PF.
      @32     DISP_X              $CHAR2.
      @34     DQTR                1.
      @35     DRG                 N3PF.
      @38     DRG10               N3PF.
      @41     DRG18               N3PF.
      @44     DRGVER              N2PF.
      @46     DSHOSPID            $CHAR13.
      @59     DX1                 $CHAR5.
      @64     DX2                 $CHAR5.
      @69     DX3                 $CHAR5.
      @74     DX4                 $CHAR5.
      @79     DX5                 $CHAR5.
      @84     DX6                 $CHAR5.
      @89     DX7                 $CHAR5.
      @94     DX8                 $CHAR5.
      @99     DX9                 $CHAR5.
      @104    DX10                $CHAR5.
      @109    DXCCS1              N4PF.
      @113    DXCCS2              N4PF.
      @117    DXCCS3              N4PF.
      @121    DXCCS4              N4PF.
      @125    DXCCS5              N4PF.
      @129    DXCCS6              N4PF.
      @133    DXCCS7              N4PF.
      @137    DXCCS8              N4PF.
      @141    DXCCS9              N4PF.
      @145    DXCCS10             N4PF.
      @149    FEMALE              N2PF.
      @151    HOSPST              $CHAR2.
      @153    LOS                 N5PF.
      @158    LOS_X               N6PF.
      @164    MDC                 N2PF.
      @166    MDC10               N2PF.
      @168    MDC18               N2PF.
      @170    MDID_S              $CHAR16.
      @186    NDX                 N2PF.
      @188    NEOMAT              1.
      @189    NPR                 N2PF.
      @191    PAY1                N2PF.
      @193    PAY1_X              $CHAR1.
      @194    PR1                 $CHAR4.
      @198    PR2                 $CHAR4.
      @202    PR3                 $CHAR4.
      @206    PR4                 $CHAR4.
      @210    PR5                 $CHAR4.
      @214    PR6                 $CHAR4.
      @218    PR7                 $CHAR4.
      @222    PR8                 $CHAR4.
      @226    PR9                 $CHAR4.
      @230    PR10                $CHAR4.
      @234    PRCCS1              N3PF.
      @237    PRCCS2              N3PF.
      @240    PRCCS3              N3PF.
      @243    PRCCS4              N3PF.
      @246    PRCCS5              N3PF.
      @249    PRCCS6              N3PF.
      @252    PRCCS7              N3PF.
      @255    PRCCS8              N3PF.
      @258    PRCCS9              N3PF.
      @261    PRCCS10             N3PF.
      @264    PRDAY1              N3PF.
      @267    RACE                N2PF.
      @269    RACE_X              $CHAR1.
      @270    SURGID_S            $CHAR16.
      @286    TOTCHG              N10PF.
      @296    TOTCHG_X            N15P2F.
      @311    YEAR                N4PF.
      @315    ZIP                 $CHAR5.
;


