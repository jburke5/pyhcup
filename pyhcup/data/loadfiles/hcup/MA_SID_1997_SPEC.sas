DATA MA97SPEC; 
INFILE EBSPEC1 LRECL = 1478; 

LENGTH 
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
       CHG79    6
       CHG80    6
       CHG81    6
       CHG82    6
       CHG83    6
       CHG84    6
       CHG85    6
       CHG86    6
       CHG87    6
       CHG88    6
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
       UNIT20   4
       UNIT21   4
       UNIT22   4
       UNIT23   4
       UNIT24   4
       UNIT25   4
       UNIT26   4
       UNIT27   4
       UNIT28   4
       UNIT29   4
       UNIT30   4
       UNIT31   4
       UNIT32   4
       UNIT33   4
       UNIT34   4
       UNIT35   4
       UNIT36   4
       UNIT37   4
       UNIT38   4
       UNIT39   4
       UNIT40   4
       UNIT41   4
       UNIT42   4
       UNIT43   4
       UNIT44   4
       UNIT45   4
       UNIT46   4
       UNIT47   4
       UNIT48   4
       UNIT49   4
       UNIT50   4
       UNIT51   4
       UNIT52   4
       UNIT53   4
       UNIT54   4
       UNIT55   4
       UNIT56   4
       UNIT57   4
       UNIT58   4
       UNIT59   4
       UNIT60   4
       UNIT61   4
       UNIT62   4
       UNIT63   4
       UNIT64   4
       UNIT65   4
       UNIT66   4
       UNIT67   4
       UNIT68   4
       UNIT69   4
       UNIT70   4
       UNIT71   4
       UNIT72   4
       UNIT73   4
       UNIT74   4
       UNIT75   4
       UNIT76   4
       UNIT77   4
       UNIT78   4
       UNIT79   4
       UNIT80   4
       UNIT81   4
       UNIT82   4
       UNIT83   4
       UNIT84   4
       UNIT85   4
       UNIT86   4
       UNIT87   4
       UNIT88   4
       SEQ_SID  7
       BWT      4
       PAY1_X   $1
       PAY2_X   $1
       ADATE    4
       DDATE    4
       PRDATE1  4
       PRDATE2  4
       PRDATE3  4
;


LABEL 
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
      CHG79   ='I:Detailed charges 79 (from data source)'
      CHG80   ='I:Detailed charges 80 (from data source)'
      CHG81   ='I:Detailed charges 81 (from data source)'
      CHG82   ='I:Detailed charges 82 (from data source)'
      CHG83   ='I:Detailed charges 83 (from data source)'
      CHG84   ='I:Detailed charges 84 (from data source)'
      CHG85   ='I:Detailed charges 85 (from data source)'
      CHG86   ='I:Detailed charges 86 (from data source)'
      CHG87   ='I:Detailed charges 87 (from data source)'
      CHG88   ='I:Detailed charges 88 (from data source)'
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
      UNIT20  ='I:Units of service 20 (from data source)'
      UNIT21  ='I:Units of service 21 (from data source)'
      UNIT22  ='I:Units of service 22 (from data source)'
      UNIT23  ='I:Units of service 23 (from data source)'
      UNIT24  ='I:Units of service 24 (from data source)'
      UNIT25  ='I:Units of service 25 (from data source)'
      UNIT26  ='I:Units of service 26 (from data source)'
      UNIT27  ='I:Units of service 27 (from data source)'
      UNIT28  ='I:Units of service 28 (from data source)'
      UNIT29  ='I:Units of service 29 (from data source)'
      UNIT30  ='I:Units of service 30 (from data source)'
      UNIT31  ='I:Units of service 31 (from data source)'
      UNIT32  ='I:Units of service 32 (from data source)'
      UNIT33  ='I:Units of service 33 (from data source)'
      UNIT34  ='I:Units of service 34 (from data source)'
      UNIT35  ='I:Units of service 35 (from data source)'
      UNIT36  ='I:Units of service 36 (from data source)'
      UNIT37  ='I:Units of service 37 (from data source)'
      UNIT38  ='I:Units of service 38 (from data source)'
      UNIT39  ='I:Units of service 39 (from data source)'
      UNIT40  ='I:Units of service 40 (from data source)'
      UNIT41  ='I:Units of service 41 (from data source)'
      UNIT42  ='I:Units of service 42 (from data source)'
      UNIT43  ='I:Units of service 43 (from data source)'
      UNIT44  ='I:Units of service 44 (from data source)'
      UNIT45  ='I:Units of service 45 (from data source)'
      UNIT46  ='I:Units of service 46 (from data source)'
      UNIT47  ='I:Units of service 47 (from data source)'
      UNIT48  ='I:Units of service 48 (from data source)'
      UNIT49  ='I:Units of service 49 (from data source)'
      UNIT50  ='I:Units of service 50 (from data source)'
      UNIT51  ='I:Units of service 51 (from data source)'
      UNIT52  ='I:Units of service 52 (from data source)'
      UNIT53  ='I:Units of service 53 (from data source)'
      UNIT54  ='I:Units of service 54 (from data source)'
      UNIT55  ='I:Units of service 55 (from data source)'
      UNIT56  ='I:Units of service 56 (from data source)'
      UNIT57  ='I:Units of service 57 (from data source)'
      UNIT58  ='I:Units of service 58 (from data source)'
      UNIT59  ='I:Units of service 59 (from data source)'
      UNIT60  ='I:Units of service 60 (from data source)'
      UNIT61  ='I:Units of service 61 (from data source)'
      UNIT62  ='I:Units of service 62 (from data source)'
      UNIT63  ='I:Units of service 63 (from data source)'
      UNIT64  ='I:Units of service 64 (from data source)'
      UNIT65  ='I:Units of service 65 (from data source)'
      UNIT66  ='I:Units of service 66 (from data source)'
      UNIT67  ='I:Units of service 67 (from data source)'
      UNIT68  ='I:Units of service 68 (from data source)'
      UNIT69  ='I:Units of service 69 (from data source)'
      UNIT70  ='I:Units of service 70 (from data source)'
      UNIT71  ='I:Units of service 71 (from data source)'
      UNIT72  ='I:Units of service 72 (from data source)'
      UNIT73  ='I:Units of service 73 (from data source)'
      UNIT74  ='I:Units of service 74 (from data source)'
      UNIT75  ='I:Units of service 75 (from data source)'
      UNIT76  ='I:Units of service 76 (from data source)'
      UNIT77  ='I:Units of service 77 (from data source)'
      UNIT78  ='I:Units of service 78 (from data source)'
      UNIT79  ='I:Units of service 79 (from data source)'
      UNIT80  ='I:Units of service 80 (from data source)'
      UNIT81  ='I:Units of service 81 (from data source)'
      UNIT82  ='I:Units of service 82 (from data source)'
      UNIT83  ='I:Units of service 83 (from data source)'
      UNIT84  ='I:Units of service 84 (from data source)'
      UNIT85  ='I:Units of service 85 (from data source)'
      UNIT86  ='I:Units of service 86 (from data source)'
      UNIT87  ='I:Units of service 87 (from data source)'
      UNIT88  ='I:Units of service 88 (from data source)'
      SEQ_SID ='I:HCUP SID record sequence number'
      BWT     ='I:Birthweight in grams'
      PAY1_X  ='I:Primary exp. payer (from data source)'
      PAY2_X  ='I:Secondary exp. payer (from data source'
      ADATE   ='I:Admission date'
      DDATE   ='I:Discharge date'
      PRDATE1 ='I:Date of principal procedure'
      PRDATE2 ='I:Date of procedure 2'
      PRDATE3 ='I:Date of procedure 3'
;


FORMAT
       SEQ_SID   Z13.
       ADATE     DATE9.
       DDATE     DATE9.
       PRDATE1   DATE9.
       PRDATE2   DATE9.
       PRDATE3   DATE9.
;


INPUT 
      @1      CHG1      N12P2F.
      @13     CHG2      N12P2F.
      @25     CHG3      N12P2F.
      @37     CHG4      N12P2F.
      @49     CHG5      N12P2F.
      @61     CHG6      N12P2F.
      @73     CHG7      N12P2F.
      @85     CHG8      N12P2F.
      @97     CHG9      N12P2F.
      @109    CHG10     N12P2F.
      @121    CHG11     N12P2F.
      @133    CHG12     N12P2F.
      @145    CHG13     N12P2F.
      @157    CHG14     N12P2F.
      @169    CHG15     N12P2F.
      @181    CHG16     N12P2F.
      @193    CHG17     N12P2F.
      @205    CHG18     N12P2F.
      @217    CHG19     N12P2F.
      @229    CHG20     N12P2F.
      @241    CHG21     N12P2F.
      @253    CHG22     N12P2F.
      @265    CHG23     N12P2F.
      @277    CHG24     N12P2F.
      @289    CHG25     N12P2F.
      @301    CHG26     N12P2F.
      @313    CHG27     N12P2F.
      @325    CHG28     N12P2F.
      @337    CHG29     N12P2F.
      @349    CHG30     N12P2F.
      @361    CHG31     N12P2F.
      @373    CHG32     N12P2F.
      @385    CHG33     N12P2F.
      @397    CHG34     N12P2F.
      @409    CHG35     N12P2F.
      @421    CHG36     N12P2F.
      @433    CHG37     N12P2F.
      @445    CHG38     N12P2F.
      @457    CHG39     N12P2F.
      @469    CHG40     N12P2F.
      @481    CHG41     N12P2F.
      @493    CHG42     N12P2F.
      @505    CHG43     N12P2F.
      @517    CHG44     N12P2F.
      @529    CHG45     N12P2F.
      @541    CHG46     N12P2F.
      @553    CHG47     N12P2F.
      @565    CHG48     N12P2F.
      @577    CHG49     N12P2F.
      @589    CHG50     N12P2F.
      @601    CHG51     N12P2F.
      @613    CHG52     N12P2F.
      @625    CHG53     N12P2F.
      @637    CHG54     N12P2F.
      @649    CHG55     N12P2F.
      @661    CHG56     N12P2F.
      @673    CHG57     N12P2F.
      @685    CHG58     N12P2F.
      @697    CHG59     N12P2F.
      @709    CHG60     N12P2F.
      @721    CHG61     N12P2F.
      @733    CHG62     N12P2F.
      @745    CHG63     N12P2F.
      @757    CHG64     N12P2F.
      @769    CHG65     N12P2F.
      @781    CHG66     N12P2F.
      @793    CHG67     N12P2F.
      @805    CHG68     N12P2F.
      @817    CHG69     N12P2F.
      @829    CHG70     N12P2F.
      @841    CHG71     N12P2F.
      @853    CHG72     N12P2F.
      @865    CHG73     N12P2F.
      @877    CHG74     N12P2F.
      @889    CHG75     N12P2F.
      @901    CHG76     N12P2F.
      @913    CHG77     N12P2F.
      @925    CHG78     N12P2F.
      @937    CHG79     N12P2F.
      @949    CHG80     N12P2F.
      @961    CHG81     N12P2F.
      @973    CHG82     N12P2F.
      @985    CHG83     N12P2F.
      @997    CHG84     N12P2F.
      @1009   CHG85     N12P2F.
      @1021   CHG86     N12P2F.
      @1033   CHG87     N12P2F.
      @1045   CHG88     N12P2F.
      @1057   UNIT1     N4PF.
      @1061   UNIT2     N4PF.
      @1065   UNIT3     N4PF.
      @1069   UNIT4     N4PF.
      @1073   UNIT5     N4PF.
      @1077   UNIT6     N4PF.
      @1081   UNIT7     N4PF.
      @1085   UNIT8     N4PF.
      @1089   UNIT9     N4PF.
      @1093   UNIT10    N4PF.
      @1097   UNIT11    N4PF.
      @1101   UNIT12    N4PF.
      @1105   UNIT13    N4PF.
      @1109   UNIT14    N4PF.
      @1113   UNIT15    N4PF.
      @1117   UNIT16    N4PF.
      @1121   UNIT17    N4PF.
      @1125   UNIT18    N4PF.
      @1129   UNIT19    N4PF.
      @1133   UNIT20    N4PF.
      @1137   UNIT21    N4PF.
      @1141   UNIT22    N4PF.
      @1145   UNIT23    N4PF.
      @1149   UNIT24    N4PF.
      @1153   UNIT25    N4PF.
      @1157   UNIT26    N4PF.
      @1161   UNIT27    N4PF.
      @1165   UNIT28    N4PF.
      @1169   UNIT29    N4PF.
      @1173   UNIT30    N4PF.
      @1177   UNIT31    N4PF.
      @1181   UNIT32    N4PF.
      @1185   UNIT33    N4PF.
      @1189   UNIT34    N4PF.
      @1193   UNIT35    N4PF.
      @1197   UNIT36    N4PF.
      @1201   UNIT37    N4PF.
      @1205   UNIT38    N4PF.
      @1209   UNIT39    N4PF.
      @1213   UNIT40    N4PF.
      @1217   UNIT41    N4PF.
      @1221   UNIT42    N4PF.
      @1225   UNIT43    N4PF.
      @1229   UNIT44    N4PF.
      @1233   UNIT45    N4PF.
      @1237   UNIT46    N4PF.
      @1241   UNIT47    N4PF.
      @1245   UNIT48    N4PF.
      @1249   UNIT49    N4PF.
      @1253   UNIT50    N4PF.
      @1257   UNIT51    N4PF.
      @1261   UNIT52    N4PF.
      @1265   UNIT53    N4PF.
      @1269   UNIT54    N4PF.
      @1273   UNIT55    N4PF.
      @1277   UNIT56    N4PF.
      @1281   UNIT57    N4PF.
      @1285   UNIT58    N4PF.
      @1289   UNIT59    N4PF.
      @1293   UNIT60    N4PF.
      @1297   UNIT61    N4PF.
      @1301   UNIT62    N4PF.
      @1305   UNIT63    N4PF.
      @1309   UNIT64    N4PF.
      @1313   UNIT65    N4PF.
      @1317   UNIT66    N4PF.
      @1321   UNIT67    N4PF.
      @1325   UNIT68    N4PF.
      @1329   UNIT69    N4PF.
      @1333   UNIT70    N4PF.
      @1337   UNIT71    N4PF.
      @1341   UNIT72    N4PF.
      @1345   UNIT73    N4PF.
      @1349   UNIT74    N4PF.
      @1353   UNIT75    N4PF.
      @1357   UNIT76    N4PF.
      @1361   UNIT77    N4PF.
      @1365   UNIT78    N4PF.
      @1369   UNIT79    N4PF.
      @1373   UNIT80    N4PF.
      @1377   UNIT81    N4PF.
      @1381   UNIT82    N4PF.
      @1385   UNIT83    N4PF.
      @1389   UNIT84    N4PF.
      @1393   UNIT85    N4PF.
      @1397   UNIT86    N4PF.
      @1401   UNIT87    N4PF.
      @1405   UNIT88    N4PF.
      @1409   SEQ_SID   13.
      @1422   BWT       N5PF.
      @1427   PAY1_X    $CHAR1.
      @1428   PAY2_X    $CHAR1.
      @1429   ADATE     DATE10F.
      @1439   DDATE     DATE10F.
      @1449   PRDATE1   DATE10F.
      @1459   PRDATE2   DATE10F.
      @1469   PRDATE3   DATE10F.
;


