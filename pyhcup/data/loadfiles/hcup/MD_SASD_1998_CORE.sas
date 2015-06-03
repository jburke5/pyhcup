DATA MD_SASDC_1998_CORE; 
INFILE EBCORE LRECL = 322; 

LENGTH 
       KEY                 8
       AGE                 3
       AGEDAY              3
       AGEMONTH            3
       AWEEKEND            3
       CPT1                $5
       CPT2                $5
       CPT3                $5
       CPT4                $5
       CPT5                $5
       CPT6                $5
       CPT7                $5
       CPT8                $5
       DIED                3
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
       PAY1_X              $2
       PAY2_X              $2
       PAYER1_X            $2
       PAYER2_X            $2
       PR1                 $4
       PR2                 $4
       PR3                 $4
       PR4                 $4
       PR5                 $4
       PR6                 $4
       PR7                 $4
       PR8                 $4
       PRCCS1              3
       PRCCS2              3
       PRCCS3              3
       PRCCS4              3
       PRCCS5              3
       PRCCS6              3
       PRCCS7              3
       PRCCS8              3
       RACE                3
       RACE_X              $1
       SURGID_S            $16
       TOTCHG              6
       TOTCHG_X            7
       YEAR                3
;


LABEL 
      KEY                 ='HCUP record identifier'
      AGE                 ='Age in years at admission'
      AGEDAY              ='Age in days (when age < 1 year)'
      AGEMONTH            ='Age in months (when age < 11 years)'
      AWEEKEND            ='Admission day is a weekend'
      CPT1                ='CPT/HCPCS procedure code 1'
      CPT2                ='CPT/HCPCS procedure code 2'
      CPT3                ='CPT/HCPCS procedure code 3'
      CPT4                ='CPT/HCPCS procedure code 4'
      CPT5                ='CPT/HCPCS procedure code 5'
      CPT6                ='CPT/HCPCS procedure code 6'
      CPT7                ='CPT/HCPCS procedure code 7'
      CPT8                ='CPT/HCPCS procedure code 8'
      DIED                ='Died during hospitalization'
      DISPUNIFORM         ='Disposition of patient, uniform'
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
      PAYER1_X            ='
Primary expected payer plan identifier (as received from source)'
      PAYER2_X            ='
Secondary expected payer plan identifier (as received from source)'
      PR1                 ='Principal procedure'
      PR2                 ='Procedure 2'
      PR3                 ='Procedure 3'
      PR4                 ='Procedure 4'
      PR5                 ='Procedure 5'
      PR6                 ='Procedure 6'
      PR7                 ='Procedure 7'
      PR8                 ='Procedure 8'
      PRCCS1              ='CCS: principal procedure'
      PRCCS2              ='CCS: procedure 2'
      PRCCS3              ='CCS: procedure 3'
      PRCCS4              ='CCS: procedure 4'
      PRCCS5              ='CCS: procedure 5'
      PRCCS6              ='CCS: procedure 6'
      PRCCS7              ='CCS: procedure 7'
      PRCCS8              ='CCS: procedure 8'
      RACE                ='Race (uniform)'
      RACE_X              ='Race (as received from source)'
      SURGID_S            ='Primary surgeon number (synthetic)'
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
      @21     AGEMONTH            N3PF.
      @24     AWEEKEND            N2PF.
      @26     CPT1                $CHAR5.
      @31     CPT2                $CHAR5.
      @36     CPT3                $CHAR5.
      @41     CPT4                $CHAR5.
      @46     CPT5                $CHAR5.
      @51     CPT6                $CHAR5.
      @56     CPT7                $CHAR5.
      @61     CPT8                $CHAR5.
      @66     DIED                N2PF.
      @68     DISPUNIFORM         N2PF.
      @70     DISP_X              $CHAR2.
      @72     DQTR                1.
      @73     DSHOSPID            $CHAR13.
      @86     DX1                 $CHAR5.
      @91     DX2                 $CHAR5.
      @96     DX3                 $CHAR5.
      @101    DX4                 $CHAR5.
      @106    DX5                 $CHAR5.
      @111    DX6                 $CHAR5.
      @116    DX7                 $CHAR5.
      @121    DX8                 $CHAR5.
      @126    DX9                 $CHAR5.
      @131    DXCCS1              N4PF.
      @135    DXCCS2              N4PF.
      @139    DXCCS3              N4PF.
      @143    DXCCS4              N4PF.
      @147    DXCCS5              N4PF.
      @151    DXCCS6              N4PF.
      @155    DXCCS7              N4PF.
      @159    DXCCS8              N4PF.
      @163    DXCCS9              N4PF.
      @167    FEMALE              N2PF.
      @169    HISPANIC_X          $CHAR1.
      @170    HOSPST              $CHAR2.
      @172    LOS                 N5PF.
      @177    LOS_X               N6PF.
      @183    MRN_S               $CHAR17.
      @200    NCPT                N2PF.
      @202    NDX                 N2PF.
      @204    NEOMAT              1.
      @205    NPR                 N2PF.
      @207    PAY1                N2PF.
      @209    PAY2                N2PF.
      @211    PAY1_X              $CHAR2.
      @213    PAY2_X              $CHAR2.
      @215    PAYER1_X            $CHAR2.
      @217    PAYER2_X            $CHAR2.
      @219    PR1                 $CHAR4.
      @223    PR2                 $CHAR4.
      @227    PR3                 $CHAR4.
      @231    PR4                 $CHAR4.
      @235    PR5                 $CHAR4.
      @239    PR6                 $CHAR4.
      @243    PR7                 $CHAR4.
      @247    PR8                 $CHAR4.
      @251    PRCCS1              N3PF.
      @254    PRCCS2              N3PF.
      @257    PRCCS3              N3PF.
      @260    PRCCS4              N3PF.
      @263    PRCCS5              N3PF.
      @266    PRCCS6              N3PF.
      @269    PRCCS7              N3PF.
      @272    PRCCS8              N3PF.
      @275    RACE                N2PF.
      @277    RACE_X              $CHAR1.
      @278    SURGID_S            $CHAR16.
      @294    TOTCHG              N10PF.
      @304    TOTCHG_X            N15P2F.
      @319    YEAR                N4PF.
;


