DATA UT_SASDC_1999_CORE; 
INFILE EBCORE LRECL = 292; 

LENGTH 
       KEY                 8
       AGE                 3
       AGEDAY              3
       AGEMONTH            3
       AMONTH              3
       ASOURCE             3
       ASOURCE_X           $1
       AWEEKEND            3
       CPT1                $5
       CPT2                $5
       CPT3                $5
       CPT4                $5
       CPT5                $5
       CPT6                $5
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
       DX7                 $5
       DX8                 $5
       DX9                 $5
       DXCCS1              4
       DXCCS2              4
       DXCCS3              4
       DXCCS4              4
       DXCCS5              4
       DXCCS6              4
       DXCCS7              4
       DXCCS8              4
       DXCCS9              4
       FEMALE              3
       HOSPST              $2
       LOS                 4
       LOS_X               4
       NCPT                3
       NDX                 3
       NEOMAT              3
       NPR                 3
       PAY1                3
       PAY2                3
       PAY1_X              $2
       PAY2_X              $2
       PAY3_X              $2
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
       PRDAY1              4
       TOTCHG              6
       TOTCHG_X            7
       YEAR                3
       ZIP_S               $5
       AYEAR               3
       DMONTH              3
       BMONTH              3
       BYEAR               3
       PRMONTH1            3
       PRYEAR1             3
;


LABEL 
      KEY                 ='HCUP record identifier'
      AGE                 ='Age in years at admission'
      AGEDAY              ='Age in days (when age < 1 year)'
      AGEMONTH            ='Age in months (when age < 11 years)'
      AMONTH              ='Admission month'
      ASOURCE             ='Admission source (uniform)'
      ASOURCE_X           ='Admission source (as received from source)'
      AWEEKEND            ='Admission day is a weekend'
      CPT1                ='CPT/HCPCS procedure code 1'
      CPT2                ='CPT/HCPCS procedure code 2'
      CPT3                ='CPT/HCPCS procedure code 3'
      CPT4                ='CPT/HCPCS procedure code 4'
      CPT5                ='CPT/HCPCS procedure code 5'
      CPT6                ='CPT/HCPCS procedure code 6'
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
      DX7                 ='Diagnosis 7'
      DX8                 ='Diagnosis 8'
      DX9                 ='Diagnosis 9'
      DXCCS1              ='CCS: principal diagnosis'
      DXCCS2              ='CCS: diagnosis 2'
      DXCCS3              ='CCS: diagnosis 3'
      DXCCS4              ='CCS: diagnosis 4'
      DXCCS5              ='CCS: diagnosis 5'
      DXCCS6              ='CCS: diagnosis 6'
      DXCCS7              ='CCS: diagnosis 7'
      DXCCS8              ='CCS: diagnosis 8'
      DXCCS9              ='CCS: diagnosis 9'
      FEMALE              ='Indicator of sex'
      HOSPST              ='Hospital state postal code'
      LOS                 ='Length of stay (cleaned)'
      LOS_X               ='Length of stay (uncleaned)'
      NCPT                ='Number of CPT/HCPCS procedures on this record'
      NDX                 ='Number of diagnoses on this record'
      NEOMAT              ='Neonatal and/or maternal DX and/or PR'
      NPR                 ='Number of procedures on this record'
      PAY1                ='Primary expected payer (uniform)'
      PAY2                ='Secondary expected payer (uniform)'
      PAY1_X              ='Primary expected payer (as received from source)'
      PAY2_X              ='Secondary expected payer (as received from source)'
      PAY3_X              ='Tertiary expected payer (as received from source)'
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
      PRDAY1              ='Number of days from admission to PR1'
      TOTCHG              ='Total charges (cleaned)'
      TOTCHG_X            ='Total charges (as received from source)'
      YEAR                ='Calendar year'
      ZIP_S               ='Patient zip code (synthetic)'
      AYEAR               ='Admission year'
      DMONTH              ='Discharge month'
      BMONTH              ='Birth month'
      BYEAR               ='Birth year'
      PRMONTH1            ='Month of procedure 1'
      PRYEAR1             ='Year of procedure 1'
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
      @29     AWEEKEND            N2PF.
      @31     CPT1                $CHAR5.
      @36     CPT2                $CHAR5.
      @41     CPT3                $CHAR5.
      @46     CPT4                $CHAR5.
      @51     CPT5                $CHAR5.
      @56     CPT6                $CHAR5.
      @61     DIED                N2PF.
      @63     DISPUB92            N2PF.
      @65     DISPUNIFORM         N2PF.
      @67     DISP_X              $CHAR2.
      @69     DQTR                1.
      @70     DSHOSPID            $CHAR13.
      @83     DX1                 $CHAR5.
      @88     DX2                 $CHAR5.
      @93     DX3                 $CHAR5.
      @98     DX4                 $CHAR5.
      @103    DX5                 $CHAR5.
      @108    DX6                 $CHAR5.
      @113    DX7                 $CHAR5.
      @118    DX8                 $CHAR5.
      @123    DX9                 $CHAR5.
      @128    DXCCS1              N4PF.
      @132    DXCCS2              N4PF.
      @136    DXCCS3              N4PF.
      @140    DXCCS4              N4PF.
      @144    DXCCS5              N4PF.
      @148    DXCCS6              N4PF.
      @152    DXCCS7              N4PF.
      @156    DXCCS8              N4PF.
      @160    DXCCS9              N4PF.
      @164    FEMALE              N2PF.
      @166    HOSPST              $CHAR2.
      @168    LOS                 N5PF.
      @173    LOS_X               N6PF.
      @179    NCPT                N2PF.
      @181    NDX                 N2PF.
      @183    NEOMAT              1.
      @184    NPR                 N2PF.
      @186    PAY1                N2PF.
      @188    PAY2                N2PF.
      @190    PAY1_X              $CHAR2.
      @192    PAY2_X              $CHAR2.
      @194    PAY3_X              $CHAR2.
      @196    PR1                 $CHAR4.
      @200    PR2                 $CHAR4.
      @204    PR3                 $CHAR4.
      @208    PR4                 $CHAR4.
      @212    PR5                 $CHAR4.
      @216    PR6                 $CHAR4.
      @220    PRCCS1              N3PF.
      @223    PRCCS2              N3PF.
      @226    PRCCS3              N3PF.
      @229    PRCCS4              N3PF.
      @232    PRCCS5              N3PF.
      @235    PRCCS6              N3PF.
      @238    PRDAY1              N3PF.
      @241    TOTCHG              N10PF.
      @251    TOTCHG_X            N15P2F.
      @266    YEAR                N4PF.
      @270    ZIP_S               $CHAR5.
      @275    AYEAR               N4PF.
      @279    DMONTH              N2PF.
      @281    BMONTH              N2PF.
      @283    BYEAR               N4PF.
      @287    PRMONTH1            N2PF.
      @289    PRYEAR1             N4PF.
;


