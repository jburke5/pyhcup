DATA FL_SASDC_1999_CORE; 
INFILE EBCORE LRECL = 251; 

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
       NPR                 3
       PAY1                3
       PAY1_X              $1
       PR1                 $4
       PRCCS1              3
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
      NPR                 ='Number of procedures on this record'
      PAY1                ='Primary expected payer (uniform)'
      PAY1_X              ='Primary expected payer (as received from source)'
      PR1                 ='Principal procedure'
      PRCCS1              ='CCS: principal procedure'
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
      @93     DIED                N2PF.
      @95     DISPUB92            N2PF.
      @97     DISPUNIFORM         N2PF.
      @99     DISP_X              $CHAR2.
      @101    DQTR                1.
      @102    DSHOSPID            $CHAR13.
      @115    DX1                 $CHAR5.
      @120    DX2                 $CHAR5.
      @125    DX3                 $CHAR5.
      @130    DX4                 $CHAR5.
      @135    DX5                 $CHAR5.
      @140    DXCCS1              N4PF.
      @144    DXCCS2              N4PF.
      @148    DXCCS3              N4PF.
      @152    DXCCS4              N4PF.
      @156    DXCCS5              N4PF.
      @160    FEMALE              N2PF.
      @162    HOSPST              $CHAR2.
      @164    MDID_S              $CHAR16.
      @180    NCPT                N2PF.
      @182    NDX                 N2PF.
      @184    NEOMAT              1.
      @185    NPR                 N2PF.
      @187    PAY1                N2PF.
      @189    PAY1_X              $CHAR1.
      @190    PR1                 $CHAR4.
      @194    PRCCS1              N3PF.
      @197    PROFEE              N2PF.
      @199    RACE                N2PF.
      @201    RACE_X              $CHAR1.
      @202    SURGID_S            $CHAR16.
      @218    TOTCHG              N10PF.
      @228    TOTCHG_X            N15P2F.
      @243    YEAR                N4PF.
      @247    ZIP                 $CHAR5.
;


