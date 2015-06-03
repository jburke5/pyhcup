DATA SC96CORE; 
INFILE EBCORE LRECL = 1387; 

LENGTH 
       MDSPEC   $3
       MRN_S    $17
       PSTCO    4
       PAY1_X   $2
       PAY2_X   $2
       UNIT1    4
       UNIT2    4
       UNIT3    4
       UNIT4    4
       UNIT5    4
       UNIT6    4
       UNIT7    4
       UNIT8    4
       UNIT9    4
       UNIT10   4
       UNIT11   4
       UNIT12   4
       UNIT13   4
       UNIT14   4
       UNIT15   4
       UNIT16   4
       UNIT17   4
       UNIT18   4
       UNIT19   4
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
       CHG53    6
       CHG54    6
       CHG55    6
       CHG56    6
       CHG57    6
       CHG58    6
       CHG59    6
       CHG60    6
       CHG61    6
       CHG62    6
       CHG63    6
       CHG64    6
       CHG65    6
       CHG66    6
       CHG67    6
       CHG68    6
       CHG69    6
       CHG70    6
       CHG71    6
       CHG72    6
       CHG73    6
       CHG74    6
       CHG75    6
       CHG76    6
       CHG77    6
       CHG78    6
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
       LOS      4
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
       PRDAY1   4
       PRDAY2   4
       PRDAY3   4
       PRDAY4   4
       PRDAY5   4
       PRDAY6   4
       PRDAY7   4
       PRDAY8   4
       PRDAY9   4
       PRDAY10  4
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
      UNIT12  ='I:Units of service 12 (from data source)'
      UNIT13  ='I:Units of service 13 (from data source)'
      UNIT14  ='I:Units of service 14 (from data source)'
      UNIT15  ='I:Units of service 15 (from data source)'
      UNIT16  ='I:Units of service 16 (from data source)'
      UNIT17  ='I:Units of service 17 (from data source)'
      UNIT18  ='I:Units of service 18 (from data source)'
      UNIT19  ='I:Units of service 19 (from data source)'
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
      CHG53   ='I:Detailed charges 53 (from data source)'
      CHG54   ='I:Detailed charges 54 (from data source)'
      CHG55   ='I:Detailed charges 55 (from data source)'
      CHG56   ='I:Detailed charges 56 (from data source)'
      CHG57   ='I:Detailed charges 57 (from data source)'
      CHG58   ='I:Detailed charges 58 (from data source)'
      CHG59   ='I:Detailed charges 59 (from data source)'
      CHG60   ='I:Detailed charges 60 (from data source)'
      CHG61   ='I:Detailed charges 61 (from data source)'
      CHG62   ='I:Detailed charges 62 (from data source)'
      CHG63   ='I:Detailed charges 63 (from data source)'
      CHG64   ='I:Detailed charges 64 (from data source)'
      CHG65   ='I:Detailed charges 65 (from data source)'
      CHG66   ='I:Detailed charges 66 (from data source)'
      CHG67   ='I:Detailed charges 67 (from data source)'
      CHG68   ='I:Detailed charges 68 (from data source)'
      CHG69   ='I:Detailed charges 69 (from data source)'
      CHG70   ='I:Detailed charges 70 (from data source)'
      CHG71   ='I:Detailed charges 71 (from data source)'
      CHG72   ='I:Detailed charges 72 (from data source)'
      CHG73   ='I:Detailed charges 73 (from data source)'
      CHG74   ='I:Detailed charges 74 (from data source)'
      CHG75   ='I:Detailed charges 75 (from data source)'
      CHG76   ='I:Detailed charges 76 (from data source)'
      CHG77   ='I:Detailed charges 77 (from data source)'
      CHG78   ='I:Detailed charges 78 (from data source)'
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
      @26     PAY1_X    $CHAR2.
      @28     PAY2_X    $CHAR2.
      @30     UNIT1     N4PF.
      @34     UNIT2     N4PF.
      @38     UNIT3     N4PF.
      @42     UNIT4     N4PF.
      @46     UNIT5     N4PF.
      @50     UNIT6     N4PF.
      @54     UNIT7     N4PF.
      @58     UNIT8     N4PF.
      @62     UNIT9     N4PF.
      @66     UNIT10    N4PF.
      @70     UNIT11    N4PF.
      @74     UNIT12    N4PF.
      @78     UNIT13    N4PF.
      @82     UNIT14    N4PF.
      @86     UNIT15    N4PF.
      @90     UNIT16    N4PF.
      @94     UNIT17    N4PF.
      @98     UNIT18    N4PF.
      @102    UNIT19    N4PF.
      @106    CHG1      N12P2F.
      @118    CHG2      N12P2F.
      @130    CHG3      N12P2F.
      @142    CHG4      N12P2F.
      @154    CHG5      N12P2F.
      @166    CHG6      N12P2F.
      @178    CHG7      N12P2F.
      @190    CHG8      N12P2F.
      @202    CHG9      N12P2F.
      @214    CHG10     N12P2F.
      @226    CHG11     N12P2F.
      @238    CHG12     N12P2F.
      @250    CHG13     N12P2F.
      @262    CHG14     N12P2F.
      @274    CHG15     N12P2F.
      @286    CHG16     N12P2F.
      @298    CHG17     N12P2F.
      @310    CHG18     N12P2F.
      @322    CHG19     N12P2F.
      @334    CHG20     N12P2F.
      @346    CHG21     N12P2F.
      @358    CHG22     N12P2F.
      @370    CHG23     N12P2F.
      @382    CHG24     N12P2F.
      @394    CHG25     N12P2F.
      @406    CHG26     N12P2F.
      @418    CHG27     N12P2F.
      @430    CHG28     N12P2F.
      @442    CHG29     N12P2F.
      @454    CHG30     N12P2F.
      @466    CHG31     N12P2F.
      @478    CHG32     N12P2F.
      @490    CHG33     N12P2F.
      @502    CHG34     N12P2F.
      @514    CHG35     N12P2F.
      @526    CHG36     N12P2F.
      @538    CHG37     N12P2F.
      @550    CHG38     N12P2F.
      @562    CHG39     N12P2F.
      @574    CHG40     N12P2F.
      @586    CHG41     N12P2F.
      @598    CHG42     N12P2F.
      @610    CHG43     N12P2F.
      @622    CHG44     N12P2F.
      @634    CHG45     N12P2F.
      @646    CHG46     N12P2F.
      @658    CHG47     N12P2F.
      @670    CHG48     N12P2F.
      @682    CHG49     N12P2F.
      @694    CHG50     N12P2F.
      @706    CHG51     N12P2F.
      @718    CHG52     N12P2F.
      @730    CHG53     N12P2F.
      @742    CHG54     N12P2F.
      @754    CHG55     N12P2F.
      @766    CHG56     N12P2F.
      @778    CHG57     N12P2F.
      @790    CHG58     N12P2F.
      @802    CHG59     N12P2F.
      @814    CHG60     N12P2F.
      @826    CHG61     N12P2F.
      @838    CHG62     N12P2F.
      @850    CHG63     N12P2F.
      @862    CHG64     N12P2F.
      @874    CHG65     N12P2F.
      @886    CHG66     N12P2F.
      @898    CHG67     N12P2F.
      @910    CHG68     N12P2F.
      @922    CHG69     N12P2F.
      @934    CHG70     N12P2F.
      @946    CHG71     N12P2F.
      @958    CHG72     N12P2F.
      @970    CHG73     N12P2F.
      @982    CHG74     N12P2F.
      @994    CHG75     N12P2F.
      @1006   CHG76     N12P2F.
      @1018   CHG77     N12P2F.
      @1030   CHG78     N12P2F.
      @1042   PROCESS   11.
      @1053   YEAR      N2PF.
      @1055   DSNUM     N2PF.
      @1057   DSTYPE    1.
      @1058   HOSPST    $CHAR2.
      @1060   AGE       N3PF.
      @1063   AGEDAY    N3PF.
      @1066   SEX       N2PF.
      @1068   RACE      N2PF.
      @1070   ADAYWK    N2PF.
      @1072   AMONTH    N2PF.
      @1074   DQTR      1.
      @1075   LOS       N5PF.
      @1080   LOS_X     N6PF.
      @1086   DISP      N2PF.
      @1088   DIED      N2PF.
      @1090   NEOMAT    1.
      @1091   ATYPE     N2PF.
      @1093   ASOURCE   N2PF.
      @1095   DXSYS     N2PF.
      @1097   DSNDX     N2PF.
      @1099   NDX       N2PF.
      @1101   DX1       $CHAR5.
      @1106   DX2       $CHAR5.
      @1111   DX3       $CHAR5.
      @1116   DX4       $CHAR5.
      @1121   DX5       $CHAR5.
      @1126   DX6       $CHAR5.
      @1131   DX7       $CHAR5.
      @1136   DX8       $CHAR5.
      @1141   DX9       $CHAR5.
      @1146   DX10      $CHAR5.
      @1151   DXV1      N2PF.
      @1153   DXV2      N2PF.
      @1155   DXV3      N2PF.
      @1157   DXV4      N2PF.
      @1159   DXV5      N2PF.
      @1161   DXV6      N2PF.
      @1163   DXV7      N2PF.
      @1165   DXV8      N2PF.
      @1167   DXV9      N2PF.
      @1169   DXV10     N2PF.
      @1171   DCCHPR1   N3PF.
      @1174   DCCHPR2   N3PF.
      @1177   DCCHPR3   N3PF.
      @1180   DCCHPR4   N3PF.
      @1183   DCCHPR5   N3PF.
      @1186   DCCHPR6   N3PF.
      @1189   DCCHPR7   N3PF.
      @1192   DCCHPR8   N3PF.
      @1195   DCCHPR9   N3PF.
      @1198   DCCHPR10  N3PF.
      @1201   PRSYS     N2PF.
      @1203   DSNPR     N2PF.
      @1205   NPR       N2PF.
      @1207   PR1       $CHAR4.
      @1211   PR2       $CHAR4.
      @1215   PR3       $CHAR4.
      @1219   PR4       $CHAR4.
      @1223   PR5       $CHAR4.
      @1227   PR6       $CHAR4.
      @1231   PR7       $CHAR4.
      @1235   PR8       $CHAR4.
      @1239   PR9       $CHAR4.
      @1243   PR10      $CHAR4.
      @1247   PRV1      N2PF.
      @1249   PRV2      N2PF.
      @1251   PRV3      N2PF.
      @1253   PRV4      N2PF.
      @1255   PRV5      N2PF.
      @1257   PRV6      N2PF.
      @1259   PRV7      N2PF.
      @1261   PRV8      N2PF.
      @1263   PRV9      N2PF.
      @1265   PRV10     N2PF.
      @1267   PCCHPR1   N3PF.
      @1270   PCCHPR2   N3PF.
      @1273   PCCHPR3   N3PF.
      @1276   PCCHPR4   N3PF.
      @1279   PCCHPR5   N3PF.
      @1282   PCCHPR6   N3PF.
      @1285   PCCHPR7   N3PF.
      @1288   PCCHPR8   N3PF.
      @1291   PCCHPR9   N3PF.
      @1294   PCCHPR10  N3PF.
      @1297   PRDAY1    N5PF.
      @1302   PRDAY2    N5PF.
      @1307   PRDAY3    N5PF.
      @1312   PRDAY4    N5PF.
      @1317   PRDAY5    N5PF.
      @1322   PRDAY6    N5PF.
      @1327   PRDAY7    N5PF.
      @1332   PRDAY8    N5PF.
      @1337   PRDAY9    N5PF.
      @1342   PRDAY10   N5PF.
      @1347   DRG       N3PF.
      @1350   MDC       N2PF.
      @1352   DRGVER    N2PF.
      @1354   DRG10     N3PF.
      @1357   MDC10     N2PF.
      @1359   PAY1      N2PF.
      @1361   PAY2      N2PF.
      @1363   TOTCHG    N10PF.
      @1373   TOTCHG_X  N15P2F.
;


