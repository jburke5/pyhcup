DATA OR_SIDC_1999_CORE; 
INFILE EBCORE LRECL = 344; 

LENGTH 
       KEY                 8
       AGE                 3
       AGEDAY              3
       AGEMONTH            3
       AMONTH              3
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
       DX11                $5
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
       FEMALE              3
       HOSPST              $2
       LOS                 4
       LOS_X               4
       MDC                 3
       MDC10               3
       MDC18               3
       NDX                 3
       NEOMAT              3
       NPR                 3
       PAY1                3
       PAY2                3
       PAY1_X              $1
       PAY2_X              $1
       PAY3_X              $1
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
       PRDAY2              4
       PRDAY3              4
       PRDAY4              4
       PRDAY5              4
       PRDAY6              4
       RDRG                $4
       TOTCHG              6
       TOTCHG_X            7
       YEAR                3
       ZIP                 $5
       AYEAR               3
       DMONTH              3
       BMONTH              3
       BYEAR               3
       PRMONTH1            3
       PRMONTH2            3
       PRMONTH3            3
       PRMONTH4            3
       PRMONTH5            3
       PRMONTH6            3
       PRYEAR1             3
       PRYEAR2             3
       PRYEAR3             3
       PRYEAR4             3
       PRYEAR5             3
       PRYEAR6             3
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
      DX11                ='Diagnosis 11'
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
      FEMALE              ='Indicator of sex'
      HOSPST              ='Hospital state postal code'
      LOS                 ='Length of stay (cleaned)'
      LOS_X               ='Length of stay (uncleaned)'
      MDC                 ='MDC in effect on discharge date'
      MDC10               ='MDC, version 10'
      MDC18               ='MDC, version 18'
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
      PRDAY2              ='Number of days from admission to PR2'
      PRDAY3              ='Number of days from admission to PR3'
      PRDAY4              ='Number of days from admission to PR4'
      PRDAY5              ='Number of days from admission to PR5'
      PRDAY6              ='Number of days from admission to PR6'
      RDRG                ='Refined DRG'
      TOTCHG              ='Total charges (cleaned)'
      TOTCHG_X            ='Total charges (as received from source)'
      YEAR                ='Calendar year'
      ZIP                 ='Patient zip code'
      AYEAR               ='Admission year'
      DMONTH              ='Discharge month'
      BMONTH              ='Birth month'
      BYEAR               ='Birth year'
      PRMONTH1            ='Month of procedure 1'
      PRMONTH2            ='Month of procedure 2'
      PRMONTH3            ='Month of procedure 3'
      PRMONTH4            ='Month of procedure 4'
      PRMONTH5            ='Month of procedure 5'
      PRMONTH6            ='Month of procedure 6'
      PRYEAR1             ='Year of procedure 1'
      PRYEAR2             ='Year of procedure 2'
      PRYEAR3             ='Year of procedure 3'
      PRYEAR4             ='Year of procedure 4'
      PRYEAR5             ='Year of procedure 5'
      PRYEAR6             ='Year of procedure 6'
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
      @28     ASOURCE_X           $CHAR2.
      @30     ATYPE               N2PF.
      @32     AWEEKEND            N2PF.
      @34     DIED                N2PF.
      @36     DISPUB92            N2PF.
      @38     DISPUNIFORM         N2PF.
      @40     DISP_X              $CHAR2.
      @42     DQTR                1.
      @43     DRG                 N3PF.
      @46     DRG10               N3PF.
      @49     DRG18               N3PF.
      @52     DRGVER              N2PF.
      @54     DSHOSPID            $CHAR13.
      @67     DX1                 $CHAR5.
      @72     DX2                 $CHAR5.
      @77     DX3                 $CHAR5.
      @82     DX4                 $CHAR5.
      @87     DX5                 $CHAR5.
      @92     DX6                 $CHAR5.
      @97     DX7                 $CHAR5.
      @102    DX8                 $CHAR5.
      @107    DX9                 $CHAR5.
      @112    DX10                $CHAR5.
      @117    DX11                $CHAR5.
      @122    DXCCS1              N4PF.
      @126    DXCCS2              N4PF.
      @130    DXCCS3              N4PF.
      @134    DXCCS4              N4PF.
      @138    DXCCS5              N4PF.
      @142    DXCCS6              N4PF.
      @146    DXCCS7              N4PF.
      @150    DXCCS8              N4PF.
      @154    DXCCS9              N4PF.
      @158    DXCCS10             N4PF.
      @162    DXCCS11             N4PF.
      @166    FEMALE              N2PF.
      @168    HOSPST              $CHAR2.
      @170    LOS                 N5PF.
      @175    LOS_X               N6PF.
      @181    MDC                 N2PF.
      @183    MDC10               N2PF.
      @185    MDC18               N2PF.
      @187    NDX                 N2PF.
      @189    NEOMAT              1.
      @190    NPR                 N2PF.
      @192    PAY1                N2PF.
      @194    PAY2                N2PF.
      @196    PAY1_X              $CHAR1.
      @197    PAY2_X              $CHAR1.
      @198    PAY3_X              $CHAR1.
      @199    PR1                 $CHAR4.
      @203    PR2                 $CHAR4.
      @207    PR3                 $CHAR4.
      @211    PR4                 $CHAR4.
      @215    PR5                 $CHAR4.
      @219    PR6                 $CHAR4.
      @223    PRCCS1              N3PF.
      @226    PRCCS2              N3PF.
      @229    PRCCS3              N3PF.
      @232    PRCCS4              N3PF.
      @235    PRCCS5              N3PF.
      @238    PRCCS6              N3PF.
      @241    PRDAY1              N3PF.
      @244    PRDAY2              N3PF.
      @247    PRDAY3              N3PF.
      @250    PRDAY4              N3PF.
      @253    PRDAY5              N3PF.
      @256    PRDAY6              N3PF.
      @259    RDRG                $CHAR4.
      @263    TOTCHG              N10PF.
      @273    TOTCHG_X            N15P2F.
      @288    YEAR                N4PF.
      @292    ZIP                 $CHAR5.
      @297    AYEAR               N4PF.
      @301    DMONTH              N2PF.
      @303    BMONTH              N2PF.
      @305    BYEAR               N4PF.
      @309    PRMONTH1            N2PF.
      @311    PRMONTH2            N2PF.
      @313    PRMONTH3            N2PF.
      @315    PRMONTH4            N2PF.
      @317    PRMONTH5            N2PF.
      @319    PRMONTH6            N2PF.
      @321    PRYEAR1             N4PF.
      @325    PRYEAR2             N4PF.
      @329    PRYEAR3             N4PF.
      @333    PRYEAR4             N4PF.
      @337    PRYEAR5             N4PF.
      @341    PRYEAR6             N4PF.
;


