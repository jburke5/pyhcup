DATA CO_SASDC_1998_CORE; 
INFILE EBCORE LRECL = 499; 

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
       CPT7                $5
       CPT8                $5
       CPT9                $5
       CPT10               $5
       CPT11               $5
       CPT12               $5
       CPT13               $5
       CPT14               $5
       CPT15               $5
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
       DX10                $5
       DX11                $5
       DX12                $5
       DX13                $5
       DX14                $5
       DX15                $5
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
       DXCCS11             4
       DXCCS12             4
       DXCCS13             4
       DXCCS14             4
       DXCCS15             4
       FEMALE              3
       HOSPST              $2
       LOS                 4
       LOS_X               4
       MDID_S              $16
       MRN_S               $17
       NCPT                3
       NDX                 3
       NEOMAT              3
       NPR                 3
       PAY1                3
       PAY1_X              $2
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
       PR11                $4
       PR12                $4
       PR13                $4
       PR14                $4
       PR15                $4
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
       PRCCS11             3
       PRCCS12             3
       PRCCS13             3
       PRCCS14             3
       PRCCS15             3
       PRDAY1              4
       PSTCO               4
       RACE                3
       RACE_X              $1
       SURGID_S            $16
       TOTCHG              6
       TOTCHG_X            7
       YEAR                3
       ZIP                 $5
       AYEAR               3
       DMONTH              3
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
      CPT7                ='CPT/HCPCS procedure code 7'
      CPT8                ='CPT/HCPCS procedure code 8'
      CPT9                ='CPT/HCPCS procedure code 9'
      CPT10               ='CPT/HCPCS procedure code 10'
      CPT11               ='CPT/HCPCS procedure code 11'
      CPT12               ='CPT/HCPCS procedure code 12'
      CPT13               ='CPT/HCPCS procedure code 13'
      CPT14               ='CPT/HCPCS procedure code 14'
      CPT15               ='CPT/HCPCS procedure code 15'
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
      DX10                ='Diagnosis 10'
      DX11                ='Diagnosis 11'
      DX12                ='Diagnosis 12'
      DX13                ='Diagnosis 13'
      DX14                ='Diagnosis 14'
      DX15                ='Diagnosis 15'
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
      DXCCS11             ='CCS: diagnosis 11'
      DXCCS12             ='CCS: diagnosis 12'
      DXCCS13             ='CCS: diagnosis 13'
      DXCCS14             ='CCS: diagnosis 14'
      DXCCS15             ='CCS: diagnosis 15'
      FEMALE              ='Indicator of sex'
      HOSPST              ='Hospital state postal code'
      LOS                 ='Length of stay (cleaned)'
      LOS_X               ='Length of stay (uncleaned)'
      MDID_S              ='Attending physician number (synthetic)'
      MRN_S               ='Medical record number (synthetic)'
      NCPT                ='Number of CPT/HCPCS procedures on this record'
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
      PR11                ='Procedure 11'
      PR12                ='Procedure 12'
      PR13                ='Procedure 13'
      PR14                ='Procedure 14'
      PR15                ='Procedure 15'
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
      PRCCS11             ='CCS: procedure 11'
      PRCCS12             ='CCS: procedure 12'
      PRCCS13             ='CCS: procedure 13'
      PRCCS14             ='CCS: procedure 14'
      PRCCS15             ='CCS: procedure 15'
      PRDAY1              ='Number of days from admission to PR1'
      PSTCO               ='Patient state/county FIPS code'
      RACE                ='Race (uniform)'
      RACE_X              ='Race (as received from source)'
      SURGID_S            ='Primary surgeon number (synthetic)'
      TOTCHG              ='Total charges (cleaned)'
      TOTCHG_X            ='Total charges (as received from source)'
      YEAR                ='Calendar year'
      ZIP                 ='Patient zip code'
      AYEAR               ='Admission year'
      DMONTH              ='Discharge month'
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
      @61     CPT7                $CHAR5.
      @66     CPT8                $CHAR5.
      @71     CPT9                $CHAR5.
      @76     CPT10               $CHAR5.
      @81     CPT11               $CHAR5.
      @86     CPT12               $CHAR5.
      @91     CPT13               $CHAR5.
      @96     CPT14               $CHAR5.
      @101    CPT15               $CHAR5.
      @106    DIED                N2PF.
      @108    DISPUB92            N2PF.
      @110    DISPUNIFORM         N2PF.
      @112    DISP_X              $CHAR2.
      @114    DQTR                1.
      @115    DSHOSPID            $CHAR13.
      @128    DX1                 $CHAR5.
      @133    DX2                 $CHAR5.
      @138    DX3                 $CHAR5.
      @143    DX4                 $CHAR5.
      @148    DX5                 $CHAR5.
      @153    DX6                 $CHAR5.
      @158    DX7                 $CHAR5.
      @163    DX8                 $CHAR5.
      @168    DX9                 $CHAR5.
      @173    DX10                $CHAR5.
      @178    DX11                $CHAR5.
      @183    DX12                $CHAR5.
      @188    DX13                $CHAR5.
      @193    DX14                $CHAR5.
      @198    DX15                $CHAR5.
      @203    DXCCS1              N4PF.
      @207    DXCCS2              N4PF.
      @211    DXCCS3              N4PF.
      @215    DXCCS4              N4PF.
      @219    DXCCS5              N4PF.
      @223    DXCCS6              N4PF.
      @227    DXCCS7              N4PF.
      @231    DXCCS8              N4PF.
      @235    DXCCS9              N4PF.
      @239    DXCCS10             N4PF.
      @243    DXCCS11             N4PF.
      @247    DXCCS12             N4PF.
      @251    DXCCS13             N4PF.
      @255    DXCCS14             N4PF.
      @259    DXCCS15             N4PF.
      @263    FEMALE              N2PF.
      @265    HOSPST              $CHAR2.
      @267    LOS                 N5PF.
      @272    LOS_X               N6PF.
      @278    MDID_S              $CHAR16.
      @294    MRN_S               $CHAR17.
      @311    NCPT                N2PF.
      @313    NDX                 N2PF.
      @315    NEOMAT              1.
      @316    NPR                 N2PF.
      @318    PAY1                N2PF.
      @320    PAY1_X              $CHAR2.
      @322    PR1                 $CHAR4.
      @326    PR2                 $CHAR4.
      @330    PR3                 $CHAR4.
      @334    PR4                 $CHAR4.
      @338    PR5                 $CHAR4.
      @342    PR6                 $CHAR4.
      @346    PR7                 $CHAR4.
      @350    PR8                 $CHAR4.
      @354    PR9                 $CHAR4.
      @358    PR10                $CHAR4.
      @362    PR11                $CHAR4.
      @366    PR12                $CHAR4.
      @370    PR13                $CHAR4.
      @374    PR14                $CHAR4.
      @378    PR15                $CHAR4.
      @382    PRCCS1              N3PF.
      @385    PRCCS2              N3PF.
      @388    PRCCS3              N3PF.
      @391    PRCCS4              N3PF.
      @394    PRCCS5              N3PF.
      @397    PRCCS6              N3PF.
      @400    PRCCS7              N3PF.
      @403    PRCCS8              N3PF.
      @406    PRCCS9              N3PF.
      @409    PRCCS10             N3PF.
      @412    PRCCS11             N3PF.
      @415    PRCCS12             N3PF.
      @418    PRCCS13             N3PF.
      @421    PRCCS14             N3PF.
      @424    PRCCS15             N3PF.
      @427    PRDAY1              N3PF.
      @430    PSTCO               N5PF.
      @435    RACE                N2PF.
      @437    RACE_X              $CHAR1.
      @438    SURGID_S            $CHAR16.
      @454    TOTCHG              N10PF.
      @464    TOTCHG_X            N15P2F.
      @479    YEAR                N4PF.
      @483    ZIP                 $CHAR5.
      @488    AYEAR               N4PF.
      @492    DMONTH              N2PF.
      @494    PRMONTH1            N2PF.
      @496    PRYEAR1             N4PF.
;


