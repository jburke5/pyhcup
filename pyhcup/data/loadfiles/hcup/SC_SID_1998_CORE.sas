DATA SC_SIDC_1998_CORE; 
INFILE EBCORE LRECL = 333; 

LENGTH 
       KEY                 8
       AGE                 3
       AGEDAY              3
       AMONTH              3
       ASOURCE             3
       ASOURCE_X           $1
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
       MDSPEC              $3
       MRN_S               $17
       NDX                 3
       NEOMAT              3
       NPR                 3
       PAY1                3
       PAY2                3
       PAY1_X              $2
       PAY2_X              $2
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
       PRDAY2              4
       PRDAY3              4
       PRDAY4              4
       PRDAY5              4
       PRDAY6              4
       PRDAY7              4
       PRDAY8              4
       PRDAY9              4
       PRDAY10             4
       PSTCO               4
       RACE                3
       RACE_X              $1
       SURGSPEC            $3
       TOTCHG              6
       TOTCHG_X            7
       YEAR                3
;


LABEL 
      KEY                 ='HCUP record identifier'
      AGE                 ='Age in years at admission'
      AGEDAY              ='Age in days (when age < 1 year)'
      AMONTH              ='Admission month'
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
      MDSPEC              ='Physician specialty (as received from source)'
      MRN_S               ='Medical record number (synthetic)'
      NDX                 ='Number of diagnoses on this record'
      NEOMAT              ='Neonatal and/or maternal DX and/or PR'
      NPR                 ='Number of procedures on this record'
      PAY1                ='Primary expected payer (uniform)'
      PAY2                ='Secondary expected payer (uniform)'
      PAY1_X              ='Primary expected payer (as received from source)'
      PAY2_X              ='Secondary expected payer (as received from source)'
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
      PRDAY2              ='Number of days from admission to PR2'
      PRDAY3              ='Number of days from admission to PR3'
      PRDAY4              ='Number of days from admission to PR4'
      PRDAY5              ='Number of days from admission to PR5'
      PRDAY6              ='Number of days from admission to PR6'
      PRDAY7              ='Number of days from admission to PR7'
      PRDAY8              ='Number of days from admission to PR8'
      PRDAY9              ='Number of days from admission to PR9'
      PRDAY10             ='Number of days from admission to PR10'
      PSTCO               ='Patient state/county FIPS code'
      RACE                ='Race (uniform)'
      RACE_X              ='Race (as received from source)'
      SURGSPEC            ='Primary surgeon specialty code'
      TOTCHG              ='Total charges (cleaned)'
      TOTCHG_X            ='Total charges (as received from source)'
      YEAR                ='Calendar year'
;


FORMAT
       KEY                 Z14.
;


INPUT 
      @1      KEY                 14.
      @15     AGE                 N3PF.
      @18     AGEDAY              N3PF.
      @21     AMONTH              N2PF.
      @23     ASOURCE             N2PF.
      @25     ASOURCE_X           $CHAR1.
      @26     ATYPE               N2PF.
      @28     AWEEKEND            N2PF.
      @30     DIED                N2PF.
      @32     DISPUB92            N2PF.
      @34     DISPUNIFORM         N2PF.
      @36     DISP_X              $CHAR2.
      @38     DQTR                1.
      @39     DRG                 N3PF.
      @42     DRG10               N3PF.
      @45     DRG18               N3PF.
      @48     DRGVER              N2PF.
      @50     DX1                 $CHAR5.
      @55     DX2                 $CHAR5.
      @60     DX3                 $CHAR5.
      @65     DX4                 $CHAR5.
      @70     DX5                 $CHAR5.
      @75     DX6                 $CHAR5.
      @80     DX7                 $CHAR5.
      @85     DX8                 $CHAR5.
      @90     DX9                 $CHAR5.
      @95     DX10                $CHAR5.
      @100    DXCCS1              N4PF.
      @104    DXCCS2              N4PF.
      @108    DXCCS3              N4PF.
      @112    DXCCS4              N4PF.
      @116    DXCCS5              N4PF.
      @120    DXCCS6              N4PF.
      @124    DXCCS7              N4PF.
      @128    DXCCS8              N4PF.
      @132    DXCCS9              N4PF.
      @136    DXCCS10             N4PF.
      @140    FEMALE              N2PF.
      @142    HOSPST              $CHAR2.
      @144    LOS                 N5PF.
      @149    LOS_X               N6PF.
      @155    MDC                 N2PF.
      @157    MDC10               N2PF.
      @159    MDC18               N2PF.
      @161    MDSPEC              $CHAR3.
      @164    MRN_S               $CHAR17.
      @181    NDX                 N2PF.
      @183    NEOMAT              1.
      @184    NPR                 N2PF.
      @186    PAY1                N2PF.
      @188    PAY2                N2PF.
      @190    PAY1_X              $CHAR2.
      @192    PAY2_X              $CHAR2.
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
      @267    PRDAY2              N3PF.
      @270    PRDAY3              N3PF.
      @273    PRDAY4              N3PF.
      @276    PRDAY5              N3PF.
      @279    PRDAY6              N3PF.
      @282    PRDAY7              N3PF.
      @285    PRDAY8              N3PF.
      @288    PRDAY9              N3PF.
      @291    PRDAY10             N3PF.
      @294    PSTCO               N5PF.
      @299    RACE                N2PF.
      @301    RACE_X              $CHAR1.
      @302    SURGSPEC            $CHAR3.
      @305    TOTCHG              N10PF.
      @315    TOTCHG_X            N15P2F.
      @330    YEAR                N4PF.
;


