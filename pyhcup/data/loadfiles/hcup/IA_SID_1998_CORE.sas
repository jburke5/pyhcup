DATA IA_SIDC_1998_CORE; 
INFILE EBCORE LRECL = 392; 

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
       DISP_X              $1
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
       MDID_S              $16
       MRN_S               $17
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
      MDID_S              ='Attending physician number (synthetic)'
      MRN_S               ='Medical record number (synthetic)'
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
      @28     ASOURCE_X           $CHAR1.
      @29     ATYPE               N2PF.
      @31     AWEEKEND            N2PF.
      @33     DIED                N2PF.
      @35     DISPUB92            N2PF.
      @37     DISPUNIFORM         N2PF.
      @39     DISP_X              $CHAR1.
      @40     DQTR                1.
      @41     DRG                 N3PF.
      @44     DRG10               N3PF.
      @47     DRG18               N3PF.
      @50     DRGVER              N2PF.
      @52     DSHOSPID            $CHAR13.
      @65     DX1                 $CHAR5.
      @70     DX2                 $CHAR5.
      @75     DX3                 $CHAR5.
      @80     DX4                 $CHAR5.
      @85     DX5                 $CHAR5.
      @90     DX6                 $CHAR5.
      @95     DX7                 $CHAR5.
      @100    DX8                 $CHAR5.
      @105    DX9                 $CHAR5.
      @110    DX10                $CHAR5.
      @115    DX11                $CHAR5.
      @120    DXCCS1              N4PF.
      @124    DXCCS2              N4PF.
      @128    DXCCS3              N4PF.
      @132    DXCCS4              N4PF.
      @136    DXCCS5              N4PF.
      @140    DXCCS6              N4PF.
      @144    DXCCS7              N4PF.
      @148    DXCCS8              N4PF.
      @152    DXCCS9              N4PF.
      @156    DXCCS10             N4PF.
      @160    DXCCS11             N4PF.
      @164    FEMALE              N2PF.
      @166    HOSPST              $CHAR2.
      @168    LOS                 N5PF.
      @173    LOS_X               N6PF.
      @179    MDC                 N2PF.
      @181    MDC10               N2PF.
      @183    MDC18               N2PF.
      @185    MDID_S              $CHAR16.
      @201    MRN_S               $CHAR17.
      @218    NDX                 N2PF.
      @220    NEOMAT              1.
      @221    NPR                 N2PF.
      @223    PAY1                N2PF.
      @225    PAY1_X              $CHAR2.
      @227    PR1                 $CHAR4.
      @231    PR2                 $CHAR4.
      @235    PR3                 $CHAR4.
      @239    PR4                 $CHAR4.
      @243    PR5                 $CHAR4.
      @247    PR6                 $CHAR4.
      @251    PRCCS1              N3PF.
      @254    PRCCS2              N3PF.
      @257    PRCCS3              N3PF.
      @260    PRCCS4              N3PF.
      @263    PRCCS5              N3PF.
      @266    PRCCS6              N3PF.
      @269    PRDAY1              N3PF.
      @272    PRDAY2              N3PF.
      @275    PRDAY3              N3PF.
      @278    PRDAY4              N3PF.
      @281    PRDAY5              N3PF.
      @284    PRDAY6              N3PF.
      @287    PSTCO               N5PF.
      @292    RACE                N2PF.
      @294    RACE_X              $CHAR1.
      @295    SURGID_S            $CHAR16.
      @311    TOTCHG              N10PF.
      @321    TOTCHG_X            N15P2F.
      @336    YEAR                N4PF.
      @340    ZIP                 $CHAR5.
      @345    AYEAR               N4PF.
      @349    DMONTH              N2PF.
      @351    BMONTH              N2PF.
      @353    BYEAR               N4PF.
      @357    PRMONTH1            N2PF.
      @359    PRMONTH2            N2PF.
      @361    PRMONTH3            N2PF.
      @363    PRMONTH4            N2PF.
      @365    PRMONTH5            N2PF.
      @367    PRMONTH6            N2PF.
      @369    PRYEAR1             N4PF.
      @373    PRYEAR2             N4PF.
      @377    PRYEAR3             N4PF.
      @381    PRYEAR4             N4PF.
      @385    PRYEAR5             N4PF.
      @389    PRYEAR6             N4PF.
;


