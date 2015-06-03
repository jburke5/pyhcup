DATA FL_SASDC_1998_CORE; 
INFILE EBCORE LRECL = 234; 

LENGTH 
       KEY                 8
       AGE                 3
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
       DQTR                3
       DSHOSPID            $13
       DX1                 $5
       DX2                 $5
       DX3                 $5
       DX4                 $5
       DX5                 $5
       DXCCS1              4
       DXCCS2              4
       DXCCS3              4
       DXCCS4              4
       DXCCS5              4
       FEMALE              3
       HOSPST              $2
       MDID_S              $16
       NCPT                3
       NDX                 3
       NEOMAT              3
       PAY1                3
       PAY1_X              $1
       PROFEE              3
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
      DQTR                ='Discharge quarter'
      DSHOSPID            ='Data source hospital identifier'
      DX1                 ='Principal diagnosis'
      DX2                 ='Diagnosis 2'
      DX3                 ='Diagnosis 3'
      DX4                 ='Diagnosis 4'
      DX5                 ='Diagnosis 5'
      DXCCS1              ='CCS: principal diagnosis'
      DXCCS2              ='CCS: diagnosis 2'
      DXCCS3              ='CCS: diagnosis 3'
      DXCCS4              ='CCS: diagnosis 4'
      DXCCS5              ='CCS: diagnosis 5'
      FEMALE              ='Indicator of sex'
      HOSPST              ='Hospital state postal code'
      MDID_S              ='Attending physician number (synthetic)'
      NCPT                ='Number of CPT/HCPCS procedures on this record'
      NDX                 ='Number of diagnoses on this record'
      NEOMAT              ='Neonatal and/or maternal DX and/or PR'
      PAY1                ='Primary expected payer (uniform)'
      PAY1_X              ='Primary expected payer (as received from source)'
      PROFEE              ='Professional fees included in total charges'
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
      @18     CPT1                $CHAR5.
      @23     CPT2                $CHAR5.
      @28     CPT3                $CHAR5.
      @33     CPT4                $CHAR5.
      @38     CPT5                $CHAR5.
      @43     CPT6                $CHAR5.
      @48     CPT7                $CHAR5.
      @53     CPT8                $CHAR5.
      @58     CPT9                $CHAR5.
      @63     CPT10               $CHAR5.
      @68     CPT11               $CHAR5.
      @73     CPT12               $CHAR5.
      @78     CPT13               $CHAR5.
      @83     CPT14               $CHAR5.
      @88     CPT15               $CHAR5.
      @93     DQTR                1.
      @94     DSHOSPID            $CHAR13.
      @107    DX1                 $CHAR5.
      @112    DX2                 $CHAR5.
      @117    DX3                 $CHAR5.
      @122    DX4                 $CHAR5.
      @127    DX5                 $CHAR5.
      @132    DXCCS1              N4PF.
      @136    DXCCS2              N4PF.
      @140    DXCCS3              N4PF.
      @144    DXCCS4              N4PF.
      @148    DXCCS5              N4PF.
      @152    FEMALE              N2PF.
      @154    HOSPST              $CHAR2.
      @156    MDID_S              $CHAR16.
      @172    NCPT                N2PF.
      @174    NDX                 N2PF.
      @176    NEOMAT              1.
      @177    PAY1                N2PF.
      @179    PAY1_X              $CHAR1.
      @180    PROFEE              N2PF.
      @182    RACE                N2PF.
      @184    RACE_X              $CHAR1.
      @185    SURGID_S            $CHAR16.
      @201    TOTCHG              N10PF.
      @211    TOTCHG_X            N15P2F.
      @226    YEAR                N4PF.
      @230    ZIP                 $CHAR5.
;


