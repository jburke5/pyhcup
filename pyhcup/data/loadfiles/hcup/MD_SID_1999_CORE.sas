DATA MD_SIDC_1999_CORE; 
INFILE EBCORE LRECL = 486; 

LENGTH 
       KEY                 8
       AGE                 3
       AGEDAY              3
       AGEMONTH            3
       ASOURCE             3
       ASOURCE_X           $2
       ATYPE               3
       AWEEKEND            3
       BWT                 4
       DaysBurnUnit        3
       DaysCCU             3
       DaysICU             3
       DaysNICU            3
       DaysPICU            3
       DaysShockUnit       3
       DIED                3
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
       DX12                $5
       DX13                $5
       DX14                $5
       DX15                $5
       DX16                $5
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
       DXCCS16             4
       FEMALE              3
       HISPANIC_X          $1
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
       PRDAY2              4
       PRDAY3              4
       PRDAY4              4
       PRDAY5              4
       PRDAY6              4
       PRDAY7              4
       PRDAY8              4
       PRDAY9              4
       PRDAY10             4
       PRDAY11             4
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
      ASOURCE             ='Admission source (uniform)'
      ASOURCE_X           ='Admission source (as received from source)'
      ATYPE               ='Admission type'
      AWEEKEND            ='Admission day is a weekend'
      BWT                 ='Birth weight in grams'
      DaysBurnUnit        ='Days in burn care unit (as received from the source)
'
      DaysCCU             ='
Days in coronary care unit (as received from the source)'
      DaysICU             ='
Days in medical/surgical intensive care unit (as received from the source)'
      DaysNICU            ='
Days in neonetal care unit (as received from the source)'
      DaysPICU            ='
Days in pediatric care unit (as received from the source)'
      DaysShockUnit       ='
Days in shock trauma unit (as received from the source)'
      DIED                ='Died during hospitalization'
      DISPUNIFORM         ='Disposition of patient, uniform'
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
      DX12                ='Diagnosis 12'
      DX13                ='Diagnosis 13'
      DX14                ='Diagnosis 14'
      DX15                ='Diagnosis 15'
      DX16                ='Diagnosis 16'
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
      DXCCS16             ='CCS: diagnosis 16'
      FEMALE              ='Indicator of sex'
      HISPANIC_X          ='Hispanic ethnicity (as received from source)'
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
      PRDAY2              ='Number of days from admission to PR2'
      PRDAY3              ='Number of days from admission to PR3'
      PRDAY4              ='Number of days from admission to PR4'
      PRDAY5              ='Number of days from admission to PR5'
      PRDAY6              ='Number of days from admission to PR6'
      PRDAY7              ='Number of days from admission to PR7'
      PRDAY8              ='Number of days from admission to PR8'
      PRDAY9              ='Number of days from admission to PR9'
      PRDAY10             ='Number of days from admission to PR10'
      PRDAY11             ='Number of days from admission to PR11'
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
      @24     ASOURCE             N2PF.
      @26     ASOURCE_X           $CHAR2.
      @28     ATYPE               N2PF.
      @30     AWEEKEND            N2PF.
      @32     BWT                 N4PF.
      @36     DaysBurnUnit        N3PF.
      @39     DaysCCU             N3PF.
      @42     DaysICU             N3PF.
      @45     DaysNICU            N3PF.
      @48     DaysPICU            N3PF.
      @51     DaysShockUnit       N3PF.
      @54     DIED                N2PF.
      @56     DISPUNIFORM         N2PF.
      @58     DISP_X              $CHAR2.
      @60     DQTR                1.
      @61     DRG                 N3PF.
      @64     DRG10               N3PF.
      @67     DRG18               N3PF.
      @70     DRGVER              N2PF.
      @72     DSHOSPID            $CHAR13.
      @85     DX1                 $CHAR5.
      @90     DX2                 $CHAR5.
      @95     DX3                 $CHAR5.
      @100    DX4                 $CHAR5.
      @105    DX5                 $CHAR5.
      @110    DX6                 $CHAR5.
      @115    DX7                 $CHAR5.
      @120    DX8                 $CHAR5.
      @125    DX9                 $CHAR5.
      @130    DX10                $CHAR5.
      @135    DX11                $CHAR5.
      @140    DX12                $CHAR5.
      @145    DX13                $CHAR5.
      @150    DX14                $CHAR5.
      @155    DX15                $CHAR5.
      @160    DX16                $CHAR5.
      @165    DXCCS1              N4PF.
      @169    DXCCS2              N4PF.
      @173    DXCCS3              N4PF.
      @177    DXCCS4              N4PF.
      @181    DXCCS5              N4PF.
      @185    DXCCS6              N4PF.
      @189    DXCCS7              N4PF.
      @193    DXCCS8              N4PF.
      @197    DXCCS9              N4PF.
      @201    DXCCS10             N4PF.
      @205    DXCCS11             N4PF.
      @209    DXCCS12             N4PF.
      @213    DXCCS13             N4PF.
      @217    DXCCS14             N4PF.
      @221    DXCCS15             N4PF.
      @225    DXCCS16             N4PF.
      @229    FEMALE              N2PF.
      @231    HISPANIC_X          $CHAR1.
      @232    HOSPST              $CHAR2.
      @234    LOS                 N5PF.
      @239    LOS_X               N6PF.
      @245    MDC                 N2PF.
      @247    MDC10               N2PF.
      @249    MDC18               N2PF.
      @251    MDID_S              $CHAR16.
      @267    MRN_S               $CHAR17.
      @284    NDX                 N2PF.
      @286    NEOMAT              1.
      @287    NPR                 N2PF.
      @289    PAY1                N2PF.
      @291    PAY2                N2PF.
      @293    PAY1_X              $CHAR2.
      @295    PAY2_X              $CHAR2.
      @297    PAYER1_X            $CHAR2.
      @299    PAYER2_X            $CHAR2.
      @301    PR1                 $CHAR4.
      @305    PR2                 $CHAR4.
      @309    PR3                 $CHAR4.
      @313    PR4                 $CHAR4.
      @317    PR5                 $CHAR4.
      @321    PR6                 $CHAR4.
      @325    PR7                 $CHAR4.
      @329    PR8                 $CHAR4.
      @333    PR9                 $CHAR4.
      @337    PR10                $CHAR4.
      @341    PR11                $CHAR4.
      @345    PR12                $CHAR4.
      @349    PR13                $CHAR4.
      @353    PR14                $CHAR4.
      @357    PR15                $CHAR4.
      @361    PRCCS1              N3PF.
      @364    PRCCS2              N3PF.
      @367    PRCCS3              N3PF.
      @370    PRCCS4              N3PF.
      @373    PRCCS5              N3PF.
      @376    PRCCS6              N3PF.
      @379    PRCCS7              N3PF.
      @382    PRCCS8              N3PF.
      @385    PRCCS9              N3PF.
      @388    PRCCS10             N3PF.
      @391    PRCCS11             N3PF.
      @394    PRCCS12             N3PF.
      @397    PRCCS13             N3PF.
      @400    PRCCS14             N3PF.
      @403    PRCCS15             N3PF.
      @406    PRDAY1              N3PF.
      @409    PRDAY2              N3PF.
      @412    PRDAY3              N3PF.
      @415    PRDAY4              N3PF.
      @418    PRDAY5              N3PF.
      @421    PRDAY6              N3PF.
      @424    PRDAY7              N3PF.
      @427    PRDAY8              N3PF.
      @430    PRDAY9              N3PF.
      @433    PRDAY10             N3PF.
      @436    PRDAY11             N3PF.
      @439    RACE                N2PF.
      @441    RACE_X              $CHAR1.
      @442    SURGID_S            $CHAR16.
      @458    TOTCHG              N10PF.
      @468    TOTCHG_X            N15P2F.
      @483    YEAR                N4PF.
;


