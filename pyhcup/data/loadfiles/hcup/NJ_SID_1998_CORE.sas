DATA NJ_SIDC_1998_CORE; 
INFILE EBCORE LRECL = 375; 

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
       BWT                 4
       DIED                3
       DISPUB92            3
       DISPUNIFORM         3
       DISP_X              $2
       DNR                 3
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
       HISPANIC_X          $1
       HOSPST              $2
       LOS                 4
       LOS_X               4
       MDC                 3
       MDC10               3
       MDC18               3
       MDID_S              $16
       MDSPEC              $1
       MRN_S               $17
       NDX                 3
       NEOMAT              3
       NPR                 3
       PAY1                3
       PAY2                3
       PAY1_X              $3
       PAY2_X              $3
       PAY3_X              $3
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
       PRDAY1              4
       PRDAY2              4
       PRDAY3              4
       PRDAY4              4
       PRDAY5              4
       PRDAY6              4
       PRDAY7              4
       PRDAY8              4
       PSTCO               4
       RACE                3
       RACE_X              $1
       READMIT             3
       SURGID_S            $16
       TOTCHG              6
       TOTCHG_X            7
       YEAR                3
       ZIP                 $5
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
      BWT                 ='Birth weight in grams'
      DIED                ='Died during hospitalization'
      DISPUB92            ='Disposition of patient (UB-92 standard coding)'
      DISPUNIFORM         ='Disposition of patient (uniform)'
      DISP_X              ='Disposition of patient (as received from source)'
      DNR                 ='Do not resuscitate indicator'
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
      HISPANIC_X          ='Hispanic ethnicity (as received from source)'
      HOSPST              ='Hospital state postal code'
      LOS                 ='Length of stay (cleaned)'
      LOS_X               ='Length of stay (uncleaned)'
      MDC                 ='MDC in effect on discharge date'
      MDC10               ='MDC, version 10'
      MDC18               ='MDC, version 18'
      MDID_S              ='Attending physician number (synthetic)'
      MDSPEC              ='Physician specialty (as received from source)'
      MRN_S               ='Medical record number (synthetic)'
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
      PRDAY1              ='Number of days from admission to PR1'
      PRDAY2              ='Number of days from admission to PR2'
      PRDAY3              ='Number of days from admission to PR3'
      PRDAY4              ='Number of days from admission to PR4'
      PRDAY5              ='Number of days from admission to PR5'
      PRDAY6              ='Number of days from admission to PR6'
      PRDAY7              ='Number of days from admission to PR7'
      PRDAY8              ='Number of days from admission to PR8'
      PSTCO               ='Patient state/county FIPS code'
      RACE                ='Race (uniform)'
      RACE_X              ='Race (as received from source)'
      READMIT             ='Readmission'
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
      @18     AGEDAY              N3PF.
      @21     AGEMONTH            N3PF.
      @24     AMONTH              N2PF.
      @26     ASOURCE             N2PF.
      @28     ASOURCE_X           $CHAR1.
      @29     ATYPE               N2PF.
      @31     AWEEKEND            N2PF.
      @33     BWT                 N4PF.
      @37     DIED                N2PF.
      @39     DISPUB92            N2PF.
      @41     DISPUNIFORM         N2PF.
      @43     DISP_X              $CHAR2.
      @45     DNR                 N2PF.
      @47     DQTR                1.
      @48     DRG                 N3PF.
      @51     DRG10               N3PF.
      @54     DRG18               N3PF.
      @57     DRGVER              N2PF.
      @59     DSHOSPID            $CHAR13.
      @72     DX1                 $CHAR5.
      @77     DX2                 $CHAR5.
      @82     DX3                 $CHAR5.
      @87     DX4                 $CHAR5.
      @92     DX5                 $CHAR5.
      @97     DX6                 $CHAR5.
      @102    DX7                 $CHAR5.
      @107    DX8                 $CHAR5.
      @112    DX9                 $CHAR5.
      @117    DX10                $CHAR5.
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
      @162    FEMALE              N2PF.
      @164    HISPANIC_X          $CHAR1.
      @165    HOSPST              $CHAR2.
      @167    LOS                 N5PF.
      @172    LOS_X               N6PF.
      @178    MDC                 N2PF.
      @180    MDC10               N2PF.
      @182    MDC18               N2PF.
      @184    MDID_S              $CHAR16.
      @200    MDSPEC              $CHAR1.
      @201    MRN_S               $CHAR17.
      @218    NDX                 N2PF.
      @220    NEOMAT              1.
      @221    NPR                 N2PF.
      @223    PAY1                N2PF.
      @225    PAY2                N2PF.
      @227    PAY1_X              $CHAR3.
      @230    PAY2_X              $CHAR3.
      @233    PAY3_X              $CHAR3.
      @236    PR1                 $CHAR4.
      @240    PR2                 $CHAR4.
      @244    PR3                 $CHAR4.
      @248    PR4                 $CHAR4.
      @252    PR5                 $CHAR4.
      @256    PR6                 $CHAR4.
      @260    PR7                 $CHAR4.
      @264    PR8                 $CHAR4.
      @268    PRCCS1              N3PF.
      @271    PRCCS2              N3PF.
      @274    PRCCS3              N3PF.
      @277    PRCCS4              N3PF.
      @280    PRCCS5              N3PF.
      @283    PRCCS6              N3PF.
      @286    PRCCS7              N3PF.
      @289    PRCCS8              N3PF.
      @292    PRDAY1              N3PF.
      @295    PRDAY2              N3PF.
      @298    PRDAY3              N3PF.
      @301    PRDAY4              N3PF.
      @304    PRDAY5              N3PF.
      @307    PRDAY6              N3PF.
      @310    PRDAY7              N3PF.
      @313    PRDAY8              N3PF.
      @316    PSTCO               N5PF.
      @321    RACE                N2PF.
      @323    RACE_X              $CHAR1.
      @324    READMIT             N2PF.
      @326    SURGID_S            $CHAR16.
      @342    TOTCHG              N10PF.
      @352    TOTCHG_X            N15P2F.
      @367    YEAR                N4PF.
      @371    ZIP                 $CHAR5.
;


