DATA WA_SIDC_1999_CORE; 
INFILE EBCORE LRECL = 331; 

LENGTH 
       KEY                 8
       AGE                 3
       AGEDAY              3
       AGEMONTH            3
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
       PAY2                3
       PAY1_X              $3
       PAY2_X              $3
       PNUM_S              $17
       PR1                 $4
       PR2                 $4
       PR3                 $4
       PR4                 $4
       PR5                 $4
       PR6                 $4
       PRCCS1              3
       PRCCS2              3
       PRCCS3              3
       PRCCS4              3
       PRCCS5              3
       PRCCS6              3
       RDRG                $4
       RDRGWT              5
       SURGID_S            $16
       TOTCHG              6
       TOTCHG_X            7
       YEAR                3
       ZIP                 $5
       AYEAR               3
;


LABEL 
      KEY                 ='HCUP record identifier'
      AGE                 ='Age in years at admission'
      AGEDAY              ='Age in days (when age < 1 year)'
      AGEMONTH            ='Age in months (when age < 11 years)'
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
      PAY2                ='Secondary expected payer (uniform)'
      PAY1_X              ='Primary expected payer (as received from source)'
      PAY2_X              ='Secondary expected payer (as received from source)'
      PNUM_S              ='Person number (synthetic)'
      PR1                 ='Principal procedure'
      PR2                 ='Procedure 2'
      PR3                 ='Procedure 3'
      PR4                 ='Procedure 4'
      PR5                 ='Procedure 5'
      PR6                 ='Procedure 6'
      PRCCS1              ='CCS: principal procedure'
      PRCCS2              ='CCS: procedure 2'
      PRCCS3              ='CCS: procedure 3'
      PRCCS4              ='CCS: procedure 4'
      PRCCS5              ='CCS: procedure 5'
      PRCCS6              ='CCS: procedure 6'
      RDRG                ='Refined DRG'
      RDRGWT              ='Refined DRG weight'
      SURGID_S            ='Primary surgeon number (synthetic)'
      TOTCHG              ='Total charges (cleaned)'
      TOTCHG_X            ='Total charges (as received from source)'
      YEAR                ='Calendar year'
      ZIP                 ='Patient zip code'
      AYEAR               ='Admission year'
;


FORMAT
       KEY                 Z14.
;


INPUT 
      @1      KEY                 14.
      @15     AGE                 N3PF.
      @18     AGEDAY              N3PF.
      @21     AGEMONTH            N3PF.
      @24     AMONTH              N2PF.
      @26     ASOURCE             N2PF.
      @28     ASOURCE_X           $CHAR1.
      @29     ATYPE               N2PF.
      @31     AWEEKEND            N2PF.
      @33     DIED                N2PF.
      @35     DISPUB92            N2PF.
      @37     DISPUNIFORM         N2PF.
      @39     DISP_X              $CHAR2.
      @41     DQTR                1.
      @42     DRG                 N3PF.
      @45     DRG10               N3PF.
      @48     DRG18               N3PF.
      @51     DRGVER              N2PF.
      @53     DSHOSPID            $CHAR13.
      @66     DX1                 $CHAR5.
      @71     DX2                 $CHAR5.
      @76     DX3                 $CHAR5.
      @81     DX4                 $CHAR5.
      @86     DX5                 $CHAR5.
      @91     DX6                 $CHAR5.
      @96     DX7                 $CHAR5.
      @101    DX8                 $CHAR5.
      @106    DX9                 $CHAR5.
      @111    DX10                $CHAR5.
      @116    DXCCS1              N4PF.
      @120    DXCCS2              N4PF.
      @124    DXCCS3              N4PF.
      @128    DXCCS4              N4PF.
      @132    DXCCS5              N4PF.
      @136    DXCCS6              N4PF.
      @140    DXCCS7              N4PF.
      @144    DXCCS8              N4PF.
      @148    DXCCS9              N4PF.
      @152    DXCCS10             N4PF.
      @156    FEMALE              N2PF.
      @158    HOSPST              $CHAR2.
      @160    LOS                 N5PF.
      @165    LOS_X               N6PF.
      @171    MDC                 N2PF.
      @173    MDC10               N2PF.
      @175    MDC18               N2PF.
      @177    MDID_S              $CHAR16.
      @193    NDX                 N2PF.
      @195    NEOMAT              1.
      @196    NPR                 N2PF.
      @198    PAY1                N2PF.
      @200    PAY2                N2PF.
      @202    PAY1_X              $CHAR3.
      @205    PAY2_X              $CHAR3.
      @208    PNUM_S              $CHAR17.
      @225    PR1                 $CHAR4.
      @229    PR2                 $CHAR4.
      @233    PR3                 $CHAR4.
      @237    PR4                 $CHAR4.
      @241    PR5                 $CHAR4.
      @245    PR6                 $CHAR4.
      @249    PRCCS1              N3PF.
      @252    PRCCS2              N3PF.
      @255    PRCCS3              N3PF.
      @258    PRCCS4              N3PF.
      @261    PRCCS5              N3PF.
      @264    PRCCS6              N3PF.
      @267    RDRG                $CHAR4.
      @271    RDRGWT              N7P2F.
      @278    SURGID_S            $CHAR16.
      @294    TOTCHG              N10PF.
      @304    TOTCHG_X            N15P2F.
      @319    YEAR                N4PF.
      @323    ZIP                 $CHAR5.
      @328    AYEAR               N4PF.
;


