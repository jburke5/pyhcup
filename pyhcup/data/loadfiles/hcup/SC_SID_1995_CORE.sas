DATA SC95CORE; 
INFILE EBCORE LRECL = 1073; 

LENGTH 
       MDSPEC   $3
       MRN_S    $17
       PSTCO    4
       PAY1_X   $17
       PAY2_X   $17
       UNIT1    3
       UNIT2    3
       UNIT3    3
       UNIT4    3
       UNIT5    3
       UNIT6    3
       UNIT7    3
       UNIT8    3
       UNIT9    3
       UNIT10   3
       UNIT11   3
       CHG1     6
       CHG2     6
       CHG3     6
       CHG4     6
       CHG5     6
       CHG6     6
       CHG7     6
       CHG8     6
       CHG9     6
       CHG10    6
       CHG11    6
       CHG12    6
       CHG13    6
       CHG14    6
       CHG15    6
       CHG16    6
       CHG17    6
       CHG18    6
       CHG19    6
       CHG20    6
       CHG21    6
       CHG22    6
       CHG23    6
       CHG24    6
       CHG25    6
       CHG26    6
       CHG27    6
       CHG28    6
       CHG29    6
       CHG30    6
       CHG31    6
       CHG32    6
       CHG33    6
       CHG34    6
       CHG35    6
       CHG36    6
       CHG37    6
       CHG38    6
       CHG39    6
       CHG40    6
       CHG41    6
       CHG42    6
       CHG43    6
       CHG44    6
       CHG45    6
       CHG46    6
       CHG47    6
       CHG48    6
       CHG49    6
       CHG50    6
       CHG51    6
       CHG52    6
       PROCESS  6
       YEAR     3
       DSNUM    3
       DSTYPE   3
       HOSPST   $2
       AGE      3
       AGEDAY   3
       SEX      3
       RACE     3
       ADAYWK   3
       AMONTH   3
       DQTR     3
       LOS      3
       LOS_X    4
       DISP     3
       DIED     3
       NEOMAT   3
       ATYPE    3
       ASOURCE  3
       DXSYS    3
       DSNDX    3
       NDX      3
       DX1      $5
       DX2      $5
       DX3      $5
       DX4      $5
       DX5      $5
       DX6      $5
       DX7      $5
       DX8      $5
       DX9      $5
       DX10     $5
       DXV1     3
       DXV2     3
       DXV3     3
       DXV4     3
       DXV5     3
       DXV6     3
       DXV7     3
       DXV8     3
       DXV9     3
       DXV10    3
       DCCHPR1  3
       DCCHPR2  3
       DCCHPR3  3
       DCCHPR4  3
       DCCHPR5  3
       DCCHPR6  3
       DCCHPR7  3
       DCCHPR8  3
       DCCHPR9  3
       DCCHPR10 3
       PRSYS    3
       DSNPR    3
       NPR      3
       PR1      $4
       PR2      $4
       PR3      $4
       PR4      $4
       PR5      $4
       PR6      $4
       PR7      $4
       PR8      $4
       PR9      $4
       PR10     $4
       PRV1     3
       PRV2     3
       PRV3     3
       PRV4     3
       PRV5     3
       PRV6     3
       PRV7     3
       PRV8     3
       PRV9     3
       PRV10    3
       PCCHPR1  3
       PCCHPR2  3
       PCCHPR3  3
       PCCHPR4  3
       PCCHPR5  3
       PCCHPR6  3
       PCCHPR7  3
       PCCHPR8  3
       PCCHPR9  3
       PCCHPR10 3
       PRDAY1   3
       PRDAY2   3
       PRDAY3   3
       PRDAY4   3
       PRDAY5   3
       PRDAY6   3
       PRDAY7   3
       PRDAY8   3
       PRDAY9   3
       PRDAY10  3
       DRG      3
       MDC      3
       DRGVER   3
       DRG10    3
       MDC10    3
       PAY1     3
       PAY2     3
       TOTCHG   6
       TOTCHG_X 7
;


LABEL 
      MDSPEC  ='I:Physician specialty'
      MRN_S   ='I:Medical record number (synthetic)'
      PSTCO   ='I:Patient state/county FIPS code'
      PAY1_X  ='I:Primary exp. payer (from data source)'
      PAY2_X  ='I:Secondary exp. payer (from data source'
      UNIT1   ='I:Units of service 1 (from data source)'
      UNIT2   ='I:Units of service 2 (from data source)'
      UNIT3   ='I:Units of service 3 (from data source)'
      UNIT4   ='I:Units of service 4 (from data source)'
      UNIT5   ='I:Units of service 5 (from data source)'
      UNIT6   ='I:Units of service 6 (from data source)'
      UNIT7   ='I:Units of service 7 (from data source)'
      UNIT8   ='I:Units of service 8 (from data source)'
      UNIT9   ='I:Units of service 9 (from data source)'
      UNIT10  ='I:Units of service 10 (from data source)'
      UNIT11  ='I:Units of service 11 (from data source)'
      CHG1    ='I:Detailed charges 1 (from data source)'
      CHG2    ='I:Detailed charges 2 (from data source)'
      CHG3    ='I:Detailed charges 3 (from data source)'
      CHG4    ='I:Detailed charges 4 (from data source)'
      CHG5    ='I:Detailed charges 5 (from data source)'
      CHG6    ='I:Detailed charges 6 (from data source)'
      CHG7    ='I:Detailed charges 7 (from data source)'
      CHG8    ='I:Detailed charges 8 (from data source)'
      CHG9    ='I:Detailed charges 9 (from data source)'
      CHG10   ='I:Detailed charges 10 (from data source)'
      CHG11   ='I:Detailed charges 11 (from data source)'
      CHG12   ='I:Detailed charges 12 (from data source)'
      CHG13   ='I:Detailed charges 13 (from data source)'
      CHG14   ='I:Detailed charges 14 (from data source)'
      CHG15   ='I:Detailed charges 15 (from data source)'
      CHG16   ='I:Detailed charges 16 (from data source)'
      CHG17   ='I:Detailed charges 17 (from data source)'
      CHG18   ='I:Detailed charges 18 (from data source)'
      CHG19   ='I:Detailed charges 19 (from data source)'
      CHG20   ='I:Detailed charges 20 (from data source)'
      CHG21   ='I:Detailed charges 21 (from data source)'
      CHG22   ='I:Detailed charges 22 (from data source)'
      CHG23   ='I:Detailed charges 23 (from data source)'
      CHG24   ='I:Detailed charges 24 (from data source)'
      CHG25   ='I:Detailed charges 25 (from data source)'
      CHG26   ='I:Detailed charges 26 (from data source)'
      CHG27   ='I:Detailed charges 27 (from data source)'
      CHG28   ='I:Detailed charges 28 (from data source)'
      CHG29   ='I:Detailed charges 29 (from data source)'
      CHG30   ='I:Detailed charges 30 (from data source)'
      CHG31   ='I:Detailed charges 31 (from data source)'
      CHG32   ='I:Detailed charges 32 (from data source)'
      CHG33   ='I:Detailed charges 33 (from data source)'
      CHG34   ='I:Detailed charges 34 (from data source)'
      CHG35   ='I:Detailed charges 35 (from data source)'
      CHG36   ='I:Detailed charges 36 (from data source)'
      CHG37   ='I:Detailed charges 37 (from data source)'
      CHG38   ='I:Detailed charges 38 (from data source)'
      CHG39   ='I:Detailed charges 39 (from data source)'
      CHG40   ='I:Detailed charges 40 (from data source)'
      CHG41   ='I:Detailed charges 41 (from data source)'
      CHG42   ='I:Detailed charges 42 (from data source)'
      CHG43   ='I:Detailed charges 43 (from data source)'
      CHG44   ='I:Detailed charges 44 (from data source)'
      CHG45   ='I:Detailed charges 45 (from data source)'
      CHG46   ='I:Detailed charges 46 (from data source)'
      CHG47   ='I:Detailed charges 47 (from data source)'
      CHG48   ='I:Detailed charges 48 (from data source)'
      CHG49   ='I:Detailed charges 49 (from data source)'
      CHG50   ='I:Detailed charges 50 (from data source)'
      CHG51   ='I:Detailed charges 51 (from data source)'
      CHG52   ='I:Detailed charges 52 (from data source)'
      PROCESS ='I:HCUP discharge processing ID number'
      YEAR    ='Calendar year'
      DSNUM   ='I:Data source ID number'
      DSTYPE  ='I:Data source type'
      HOSPST  ='Hospital state postal code'
      AGE     ='I:Age in years at admission'
      AGEDAY  ='I:Age in days (when < 1 year)'
      SEX     ='I:Sex'
      RACE    ='I:Race'
      ADAYWK  ='I:Admission day of week'
      AMONTH  ='I:Admission month'
      DQTR    ='I:Discharge quarter'
      LOS     ='I:Length of stay (cleaned)'
      LOS_X   ='I:Length of stay (uncleaned)'
      DISP    ='I:Disposition of patient'
      DIED    ='I:Died during hospitalization'
      NEOMAT  ='I:Neonatal and/or maternal DX and/or PR'
      ATYPE   ='I:Admission type'
      ASOURCE ='I:Admission source'
      DXSYS   ='I:Diagnosis coding system'
      DSNDX   ='I:Max number of diagnoses from source'
      NDX     ='I:Number of diagnoses on this discharge'
      DX1     ='I:Principal diagnosis'
      DX2     ='I:Diagnosis 2'
      DX3     ='I:Diagnosis 3'
      DX4     ='I:Diagnosis 4'
      DX5     ='I:Diagnosis 5'
      DX6     ='I:Diagnosis 6'
      DX7     ='I:Diagnosis 7'
      DX8     ='I:Diagnosis 8'
      DX9     ='I:Diagnosis 9'
      DX10    ='I:Diagnosis 10'
      DXV1    ='I:Validity flag: principal diagnosis'
      DXV2    ='I:Validity flag: diagnosis 2'
      DXV3    ='I:Validity flag: diagnosis 3'
      DXV4    ='I:Validity flag: diagnosis 4'
      DXV5    ='I:Validity flag: diagnosis 5'
      DXV6    ='I:Validity flag: diagnosis 6'
      DXV7    ='I:Validity flag: diagnosis 7'
      DXV8    ='I:Validity flag: diagnosis 8'
      DXV9    ='I:Validity flag: diagnosis 9'
      DXV10   ='I:Validity flag: diagnosis 10'
      DCCHPR1 ='I:CCHPR: principal diagnosis'
      DCCHPR2 ='I:CCHPR: diagnosis 2'
      DCCHPR3 ='I:CCHPR: diagnosis 3'
      DCCHPR4 ='I:CCHPR: diagnosis 4'
      DCCHPR5 ='I:CCHPR: diagnosis 5'
      DCCHPR6 ='I:CCHPR: diagnosis 6'
      DCCHPR7 ='I:CCHPR: diagnosis 7'
      DCCHPR8 ='I:CCHPR: diagnosis 8'
      DCCHPR9 ='I:CCHPR: diagnosis 9'
      DCCHPR10='I:CCHPR: diagnosis 10'
      PRSYS   ='I:Procedure coding system'
      DSNPR   ='I:Max number of procedures from source'
      NPR     ='I:Number of procedures on this discharge'
      PR1     ='I:Principal procedure'
      PR2     ='I:Procedure 2'
      PR3     ='I:Procedure 3'
      PR4     ='I:Procedure 4'
      PR5     ='I:Procedure 5'
      PR6     ='I:Procedure 6'
      PR7     ='I:Procedure 7'
      PR8     ='I:Procedure 8'
      PR9     ='I:Procedure 9'
      PR10    ='I:Procedure 10'
      PRV1    ='I:Validity flag: principal procedure'
      PRV2    ='I:Validity flag: procedure 2'
      PRV3    ='I:Validity flag: procedure 3'
      PRV4    ='I:Validity flag: procedure 4'
      PRV5    ='I:Validity flag: procedure 5'
      PRV6    ='I:Validity flag: procedure 6'
      PRV7    ='I:Validity flag: procedure 7'
      PRV8    ='I:Validity flag: procedure 8'
      PRV9    ='I:Validity flag: procedure 9'
      PRV10   ='I:Validity flag: procedure 10'
      PCCHPR1 ='I:CCHPR: principal procedure'
      PCCHPR2 ='I:CCHPR: procedure 2'
      PCCHPR3 ='I:CCHPR: procedure 3'
      PCCHPR4 ='I:CCHPR: procedure 4'
      PCCHPR5 ='I:CCHPR: procedure 5'
      PCCHPR6 ='I:CCHPR: procedure 6'
      PCCHPR7 ='I:CCHPR: procedure 7'
      PCCHPR8 ='I:CCHPR: procedure 8'
      PCCHPR9 ='I:CCHPR: procedure 9'
      PCCHPR10='I:CCHPR: procedure 10'
      PRDAY1  ='I:No. of days from admission to PR1'
      PRDAY2  ='I:No. of days from admission to PR2'
      PRDAY3  ='I:No. of days from admission to PR3'
      PRDAY4  ='I:No. of days from admission to PR4'
      PRDAY5  ='I:No. of days from admission to PR5'
      PRDAY6  ='I:No. of days from admission to PR6'
      PRDAY7  ='I:No. of days from admission to PR7'
      PRDAY8  ='I:No. of days from admission to PR8'
      PRDAY9  ='I:No. of days from admission to PR9'
      PRDAY10 ='I:No. of days from admission to PR10'
      DRG     ='I:DRG in effect on discharge date'
      MDC     ='I:MDC in effect on discharge date'
      DRGVER  ='I:DRG grouper version used on disch date'
      DRG10   ='I:DRG, Version 10'
      MDC10   ='I:MDC, Version 10'
      PAY1    ='I:Primary expected payer, uniform'
      PAY2    ='I:Secondary expected payer, uniform'
      TOTCHG  ='I:Total charges (cleaned)'
      TOTCHG_X='I:Total charges (from data source)'
;


FORMAT
;


INPUT 
      @1      MDSPEC    $CHAR3.
      @4      MRN_S     $CHAR17.
      @21     PSTCO     N5PF.
      @26     PAY1_X    $CHAR17.
      @43     PAY2_X    $CHAR17.
      @60     UNIT1     N4PF.
      @64     UNIT2     N4PF.
      @68     UNIT3     N4PF.
      @72     UNIT4     N4PF.
      @76     UNIT5     N4PF.
      @80     UNIT6     N4PF.
      @84     UNIT7     N4PF.
      @88     UNIT8     N4PF.
      @92     UNIT9     N4PF.
      @96     UNIT10    N4PF.
      @100    UNIT11    N4PF.
      @104    CHG1      N12P2F.
      @116    CHG2      N12P2F.
      @128    CHG3      N12P2F.
      @140    CHG4      N12P2F.
      @152    CHG5      N12P2F.
      @164    CHG6      N12P2F.
      @176    CHG7      N12P2F.
      @188    CHG8      N12P2F.
      @200    CHG9      N12P2F.
      @212    CHG10     N12P2F.
      @224    CHG11     N12P2F.
      @236    CHG12     N12P2F.
      @248    CHG13     N12P2F.
      @260    CHG14     N12P2F.
      @272    CHG15     N12P2F.
      @284    CHG16     N12P2F.
      @296    CHG17     N12P2F.
      @308    CHG18     N12P2F.
      @320    CHG19     N12P2F.
      @332    CHG20     N12P2F.
      @344    CHG21     N12P2F.
      @356    CHG22     N12P2F.
      @368    CHG23     N12P2F.
      @380    CHG24     N12P2F.
      @392    CHG25     N12P2F.
      @404    CHG26     N12P2F.
      @416    CHG27     N12P2F.
      @428    CHG28     N12P2F.
      @440    CHG29     N12P2F.
      @452    CHG30     N12P2F.
      @464    CHG31     N12P2F.
      @476    CHG32     N12P2F.
      @488    CHG33     N12P2F.
      @500    CHG34     N12P2F.
      @512    CHG35     N12P2F.
      @524    CHG36     N12P2F.
      @536    CHG37     N12P2F.
      @548    CHG38     N12P2F.
      @560    CHG39     N12P2F.
      @572    CHG40     N12P2F.
      @584    CHG41     N12P2F.
      @596    CHG42     N12P2F.
      @608    CHG43     N12P2F.
      @620    CHG44     N12P2F.
      @632    CHG45     N12P2F.
      @644    CHG46     N12P2F.
      @656    CHG47     N12P2F.
      @668    CHG48     N12P2F.
      @680    CHG49     N12P2F.
      @692    CHG50     N12P2F.
      @704    CHG51     N12P2F.
      @716    CHG52     N12P2F.
      @728    PROCESS   11.
      @739    YEAR      N2PF.
      @741    DSNUM     N2PF.
      @743    DSTYPE    1.
      @744    HOSPST    $CHAR2.
      @746    AGE       N3PF.
      @749    AGEDAY    N3PF.
      @752    SEX       N2PF.
      @754    RACE      N2PF.
      @756    ADAYWK    N2PF.
      @758    AMONTH    N2PF.
      @760    DQTR      1.
      @761    LOS       N5PF.
      @766    LOS_X     N6PF.
      @772    DISP      N2PF.
      @774    DIED      N2PF.
      @776    NEOMAT    1.
      @777    ATYPE     N2PF.
      @779    ASOURCE   N2PF.
      @781    DXSYS     N2PF.
      @783    DSNDX     N2PF.
      @785    NDX       N2PF.
      @787    DX1       $CHAR5.
      @792    DX2       $CHAR5.
      @797    DX3       $CHAR5.
      @802    DX4       $CHAR5.
      @807    DX5       $CHAR5.
      @812    DX6       $CHAR5.
      @817    DX7       $CHAR5.
      @822    DX8       $CHAR5.
      @827    DX9       $CHAR5.
      @832    DX10      $CHAR5.
      @837    DXV1      N2PF.
      @839    DXV2      N2PF.
      @841    DXV3      N2PF.
      @843    DXV4      N2PF.
      @845    DXV5      N2PF.
      @847    DXV6      N2PF.
      @849    DXV7      N2PF.
      @851    DXV8      N2PF.
      @853    DXV9      N2PF.
      @855    DXV10     N2PF.
      @857    DCCHPR1   N3PF.
      @860    DCCHPR2   N3PF.
      @863    DCCHPR3   N3PF.
      @866    DCCHPR4   N3PF.
      @869    DCCHPR5   N3PF.
      @872    DCCHPR6   N3PF.
      @875    DCCHPR7   N3PF.
      @878    DCCHPR8   N3PF.
      @881    DCCHPR9   N3PF.
      @884    DCCHPR10  N3PF.
      @887    PRSYS     N2PF.
      @889    DSNPR     N2PF.
      @891    NPR       N2PF.
      @893    PR1       $CHAR4.
      @897    PR2       $CHAR4.
      @901    PR3       $CHAR4.
      @905    PR4       $CHAR4.
      @909    PR5       $CHAR4.
      @913    PR6       $CHAR4.
      @917    PR7       $CHAR4.
      @921    PR8       $CHAR4.
      @925    PR9       $CHAR4.
      @929    PR10      $CHAR4.
      @933    PRV1      N2PF.
      @935    PRV2      N2PF.
      @937    PRV3      N2PF.
      @939    PRV4      N2PF.
      @941    PRV5      N2PF.
      @943    PRV6      N2PF.
      @945    PRV7      N2PF.
      @947    PRV8      N2PF.
      @949    PRV9      N2PF.
      @951    PRV10     N2PF.
      @953    PCCHPR1   N3PF.
      @956    PCCHPR2   N3PF.
      @959    PCCHPR3   N3PF.
      @962    PCCHPR4   N3PF.
      @965    PCCHPR5   N3PF.
      @968    PCCHPR6   N3PF.
      @971    PCCHPR7   N3PF.
      @974    PCCHPR8   N3PF.
      @977    PCCHPR9   N3PF.
      @980    PCCHPR10  N3PF.
      @983    PRDAY1    N5PF.
      @988    PRDAY2    N5PF.
      @993    PRDAY3    N5PF.
      @998    PRDAY4    N5PF.
      @1003   PRDAY5    N5PF.
      @1008   PRDAY6    N5PF.
      @1013   PRDAY7    N5PF.
      @1018   PRDAY8    N5PF.
      @1023   PRDAY9    N5PF.
      @1028   PRDAY10   N5PF.
      @1033   DRG       N3PF.
      @1036   MDC       N2PF.
      @1038   DRGVER    N2PF.
      @1040   DRG10     N3PF.
      @1043   MDC10     N2PF.
      @1045   PAY1      N2PF.
      @1047   PAY2      N2PF.
      @1049   TOTCHG    N10PF.
      @1059   TOTCHG_X  N15P2F.
;


