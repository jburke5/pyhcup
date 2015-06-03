DATA NY_SASDC_1999_CORE; 
INFILE EBCORE LRECL = 218; 

LENGTH 
       KEY                 8
       AGE                 3
       AGEDAY              3
       AGEMONTH            3
       AMONTH              3
       ANESTH              3
       AWEEKEND            3
       DIED                3
       DISPUB92            3
       DISPUNIFORM         3
       DISP_X              $2
       DQTR                3
       DSHOSPID            $13
       DX1                 $5
       DX2                 $5
       DX3                 $5
       DX4                 $5
       DX5                 $5
       DX6                 $5
       DXCCS1              4
       DXCCS2              4
       DXCCS3              4
       DXCCS4              4
       DXCCS5              4
       DXCCS6              4
       FEMALE              3
       HOSPST              $2
       LOS                 4
       LOS_X               4
       NDX                 3
       NEOMAT              3
       NPR                 3
       ORTIME              4
       PAY1                3
       PAY1_X              $2
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
       PSTCO               4
       SURGID_S            $16
       YEAR                3
       ZIP                 $5
       AYEAR               3
       DMONTH              3
       BMONTH              3
       BYEAR               3
;


LABEL 
      KEY                 ='HCUP record identifier'
      AGE                 ='Age in years at admission'
      AGEDAY              ='Age in days (when age < 1 year)'
      AGEMONTH            ='Age in months (when age < 11 years)'
      AMONTH              ='Admission month'
      ANESTH              ='Method of anesthesia'
      AWEEKEND            ='Admission day is a weekend'
      DIED                ='Died during hospitalization'
      DISPUB92            ='Disposition of patient (UB-92 standard coding)'
      DISPUNIFORM         ='Disposition of patient (uniform)'
      DISP_X              ='Disposition of patient (as received from source)'
      DQTR                ='Discharge quarter'
      DSHOSPID            ='Data source hospital identifier'
      DX1                 ='Principal diagnosis'
      DX2                 ='Diagnosis 2'
      DX3                 ='Diagnosis 3'
      DX4                 ='Diagnosis 4'
      DX5                 ='Diagnosis 5'
      DX6                 ='Diagnosis 6'
      DXCCS1              ='CCS: principal diagnosis'
      DXCCS2              ='CCS: diagnosis 2'
      DXCCS3              ='CCS: diagnosis 3'
      DXCCS4              ='CCS: diagnosis 4'
      DXCCS5              ='CCS: diagnosis 5'
      DXCCS6              ='CCS: diagnosis 6'
      FEMALE              ='Indicator of sex'
      HOSPST              ='Hospital state postal code'
      LOS                 ='Length of stay (cleaned)'
      LOS_X               ='Length of stay (uncleaned)'
      NDX                 ='Number of diagnoses on this record'
      NEOMAT              ='Neonatal and/or maternal DX and/or PR'
      NPR                 ='Number of procedures on this record'
      ORTIME              ='Operating room time'
      PAY1                ='Primary expected payer (uniform)'
      PAY1_X              ='Primary expected payer (as received from source)'
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
      PSTCO               ='Patient state/county FIPS code'
      SURGID_S            ='Primary surgeon number (synthetic)'
      YEAR                ='Calendar year'
      ZIP                 ='Patient zip code'
      AYEAR               ='Admission year'
      DMONTH              ='Discharge month'
      BMONTH              ='Birth month'
      BYEAR               ='Birth year'
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
      @26     ANESTH              N3PF.
      @29     AWEEKEND            N2PF.
      @31     DIED                N2PF.
      @33     DISPUB92            N2PF.
      @35     DISPUNIFORM         N2PF.
      @37     DISP_X              $CHAR2.
      @39     DQTR                1.
      @40     DSHOSPID            $CHAR13.
      @53     DX1                 $CHAR5.
      @58     DX2                 $CHAR5.
      @63     DX3                 $CHAR5.
      @68     DX4                 $CHAR5.
      @73     DX5                 $CHAR5.
      @78     DX6                 $CHAR5.
      @83     DXCCS1              N4PF.
      @87     DXCCS2              N4PF.
      @91     DXCCS3              N4PF.
      @95     DXCCS4              N4PF.
      @99     DXCCS5              N4PF.
      @103    DXCCS6              N4PF.
      @107    FEMALE              N2PF.
      @109    HOSPST              $CHAR2.
      @111    LOS                 N5PF.
      @116    LOS_X               N6PF.
      @122    NDX                 N2PF.
      @124    NEOMAT              1.
      @125    NPR                 N2PF.
      @127    ORTIME              N4PF.
      @131    PAY1                N2PF.
      @133    PAY1_X              $CHAR2.
      @135    PR1                 $CHAR4.
      @139    PR2                 $CHAR4.
      @143    PR3                 $CHAR4.
      @147    PR4                 $CHAR4.
      @151    PR5                 $CHAR4.
      @155    PR6                 $CHAR4.
      @159    PRCCS1              N3PF.
      @162    PRCCS2              N3PF.
      @165    PRCCS3              N3PF.
      @168    PRCCS4              N3PF.
      @171    PRCCS5              N3PF.
      @174    PRCCS6              N3PF.
      @177    PSTCO               N5PF.
      @182    SURGID_S            $CHAR16.
      @198    YEAR                N4PF.
      @202    ZIP                 $CHAR5.
      @207    AYEAR               N4PF.
      @211    DMONTH              N2PF.
      @213    BMONTH              N2PF.
      @215    BYEAR               N4PF.
;


