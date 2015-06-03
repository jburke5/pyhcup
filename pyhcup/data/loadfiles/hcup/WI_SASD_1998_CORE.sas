DATA WI_SASDC_1998_CORE; 
INFILE EBCORE LRECL = 311; 

LENGTH 
       KEY                 8
       AGE                 3
       AGEDAY              3
       AGEMONTH            3
       AMONTH              3
       ATYPE               3
       AWEEKEND            3
       CPT1                $5
       CPT2                $5
       CPT3                $5
       CPT4                $5
       CPT5                $5
       CPT6                $5
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
       HISPANIC_X          $1
       HOSPST              $2
       LOS                 4
       LOS_X               4
       MRN_S               $17
       NCPT                3
       NDX                 3
       NEOMAT              3
       NPR                 3
       PAY1                3
       PAY2                3
       PAY1_X              $5
       PAY2_X              $5
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
       RACE                3
       RACE_X              $1
       TOTCHG              6
       TOTCHG_X            7
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
      ATYPE               ='Admission type'
      AWEEKEND            ='Admission day is a weekend'
      CPT1                ='CPT/HCPCS procedure code 1'
      CPT2                ='CPT/HCPCS procedure code 2'
      CPT3                ='CPT/HCPCS procedure code 3'
      CPT4                ='CPT/HCPCS procedure code 4'
      CPT5                ='CPT/HCPCS procedure code 5'
      CPT6                ='CPT/HCPCS procedure code 6'
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
      HISPANIC_X          ='Hispanic ethnicity (as received from source)'
      HOSPST              ='Hospital state postal code'
      LOS                 ='Length of stay (cleaned)'
      LOS_X               ='Length of stay (uncleaned)'
      MRN_S               ='Medical record number (synthetic)'
      NCPT                ='Number of CPT/HCPCS procedures on this record'
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
      PRCCS1              ='CCS: principal procedure'
      PRCCS2              ='CCS: procedure 2'
      PRCCS3              ='CCS: procedure 3'
      PRCCS4              ='CCS: procedure 4'
      PRCCS5              ='CCS: procedure 5'
      PRCCS6              ='CCS: procedure 6'
      PRDAY1              ='Number of days from admission to PR1'
      RACE                ='Race (uniform)'
      RACE_X              ='Race (as received from source)'
      TOTCHG              ='Total charges (cleaned)'
      TOTCHG_X            ='Total charges (as received from source)'
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
      @26     ATYPE               N2PF.
      @28     AWEEKEND            N2PF.
      @30     CPT1                $CHAR5.
      @35     CPT2                $CHAR5.
      @40     CPT3                $CHAR5.
      @45     CPT4                $CHAR5.
      @50     CPT5                $CHAR5.
      @55     CPT6                $CHAR5.
      @60     DQTR                1.
      @61     DSHOSPID            $CHAR13.
      @74     DX1                 $CHAR5.
      @79     DX2                 $CHAR5.
      @84     DX3                 $CHAR5.
      @89     DX4                 $CHAR5.
      @94     DX5                 $CHAR5.
      @99     DX6                 $CHAR5.
      @104    DX7                 $CHAR5.
      @109    DX8                 $CHAR5.
      @114    DX9                 $CHAR5.
      @119    DX10                $CHAR5.
      @124    DXCCS1              N4PF.
      @128    DXCCS2              N4PF.
      @132    DXCCS3              N4PF.
      @136    DXCCS4              N4PF.
      @140    DXCCS5              N4PF.
      @144    DXCCS6              N4PF.
      @148    DXCCS7              N4PF.
      @152    DXCCS8              N4PF.
      @156    DXCCS9              N4PF.
      @160    DXCCS10             N4PF.
      @164    FEMALE              N2PF.
      @166    HISPANIC_X          $CHAR1.
      @167    HOSPST              $CHAR2.
      @169    LOS                 N5PF.
      @174    LOS_X               N6PF.
      @180    MRN_S               $CHAR17.
      @197    NCPT                N2PF.
      @199    NDX                 N2PF.
      @201    NEOMAT              1.
      @202    NPR                 N2PF.
      @204    PAY1                N2PF.
      @206    PAY2                N2PF.
      @208    PAY1_X              $CHAR5.
      @213    PAY2_X              $CHAR5.
      @218    PR1                 $CHAR4.
      @222    PR2                 $CHAR4.
      @226    PR3                 $CHAR4.
      @230    PR4                 $CHAR4.
      @234    PR5                 $CHAR4.
      @238    PR6                 $CHAR4.
      @242    PRCCS1              N3PF.
      @245    PRCCS2              N3PF.
      @248    PRCCS3              N3PF.
      @251    PRCCS4              N3PF.
      @254    PRCCS5              N3PF.
      @257    PRCCS6              N3PF.
      @260    PRDAY1              N3PF.
      @263    RACE                N2PF.
      @265    RACE_X              $CHAR1.
      @266    TOTCHG              N10PF.
      @276    TOTCHG_X            N15P2F.
      @291    YEAR                N4PF.
      @295    ZIP                 $CHAR5.
      @300    AYEAR               N4PF.
      @304    DMONTH              N2PF.
      @306    BMONTH              N2PF.
      @308    BYEAR               N4PF.
;


