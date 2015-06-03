DATA MA95SPEC; 
INFILE EBSPEC1 LRECL = 1393; 

LENGTH 
       SEQ_SID  7
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
       UNIT12   3
       UNIT13   3
       UNIT14   3
       UNIT15   3
       UNIT16   3
       UNIT17   3
       UNIT18   3
       UNIT19   3
       UNIT20   3
       UNIT21   3
       UNIT22   3
       UNIT23   3
       UNIT24   3
       UNIT25   3
       UNIT26   3
       UNIT27   3
       UNIT28   3
       UNIT29   3
       UNIT30   3
       UNIT31   3
       UNIT32   3
       UNIT33   3
       UNIT34   3
       UNIT35   3
       UNIT36   3
       UNIT37   3
       UNIT38   3
       UNIT39   3
       UNIT40   3
       UNIT41   3
       UNIT42   3
       UNIT43   3
       UNIT44   3
       UNIT45   3
       UNIT46   3
       UNIT47   3
       UNIT48   3
       UNIT49   3
       UNIT50   3
       UNIT51   3
       UNIT52   3
       UNIT53   3
       UNIT54   3
       UNIT55   3
       UNIT56   3
       UNIT57   3
       UNIT58   3
       UNIT59   3
       UNIT60   3
       UNIT61   3
       UNIT62   3
       UNIT63   3
       UNIT64   3
       UNIT65   3
       UNIT66   3
       UNIT67   3
       UNIT68   3
       UNIT69   3
       UNIT70   3
       UNIT71   3
       UNIT72   3
       UNIT73   3
       UNIT74   3
       UNIT75   3
       UNIT76   3
       UNIT77   3
       UNIT78   3
       UNIT79   3
       UNIT80   3
       UNIT81   3
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
       ADATE    4
       DDATE    4
       PRDATE1  4
       PRDATE2  4
       PRDATE3  4
;


LABEL 
      SEQ_SID ='I:HCUP SID record sequence number'
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
      ADATE   ='I:Admission date'
      DDATE   ='I:Discharge date'
      PRDATE1 ='I:Date of principal procedure'
      PRDATE2 ='I:Date of procedure 2'
      PRDATE3 ='I:Date of procedure 3'
;


FORMAT
       SEQ_SID   Z13.
       ADATE     DATE7.
       DDATE     DATE7.
       PRDATE1   DATE7.
       PRDATE2   DATE7.
       PRDATE3   DATE7.
;


INPUT 
      @1      SEQ_SID   13.
      @14     PAY1_X    $CHAR17.
      @31     PAY2_X    $CHAR17.
      @48     UNIT1     N4PF.
      @52     UNIT2     N4PF.
      @56     UNIT3     N4PF.
      @60     UNIT4     N4PF.
      @64     UNIT5     N4PF.
      @68     UNIT6     N4PF.
      @72     UNIT7     N4PF.
      @76     UNIT8     N4PF.
      @80     UNIT9     N4PF.
      @84     UNIT10    N4PF.
      @88     UNIT11    N4PF.
      @92     UNIT12    N4PF.
      @96     UNIT13    N4PF.
      @100    UNIT14    N4PF.
      @104    UNIT15    N4PF.
      @108    UNIT16    N4PF.
      @112    UNIT17    N4PF.
      @116    UNIT18    N4PF.
      @120    UNIT19    N4PF.
      @124    UNIT20    N4PF.
      @128    UNIT21    N4PF.
      @132    UNIT22    N4PF.
      @136    UNIT23    N4PF.
      @140    UNIT24    N4PF.
      @144    UNIT25    N4PF.
      @148    UNIT26    N4PF.
      @152    UNIT27    N4PF.
      @156    UNIT28    N4PF.
      @160    UNIT29    N4PF.
      @164    UNIT30    N4PF.
      @168    UNIT31    N4PF.
      @172    UNIT32    N4PF.
      @176    UNIT33    N4PF.
      @180    UNIT34    N4PF.
      @184    UNIT35    N4PF.
      @188    UNIT36    N4PF.
      @192    UNIT37    N4PF.
      @196    UNIT38    N4PF.
      @200    UNIT39    N4PF.
      @204    UNIT40    N4PF.
      @208    UNIT41    N4PF.
      @212    UNIT42    N4PF.
      @216    UNIT43    N4PF.
      @220    UNIT44    N4PF.
      @224    UNIT45    N4PF.
      @228    UNIT46    N4PF.
      @232    UNIT47    N4PF.
      @236    UNIT48    N4PF.
      @240    UNIT49    N4PF.
      @244    UNIT50    N4PF.
      @248    UNIT51    N4PF.
      @252    UNIT52    N4PF.
      @256    UNIT53    N4PF.
      @260    UNIT54    N4PF.
      @264    UNIT55    N4PF.
      @268    UNIT56    N4PF.
      @272    UNIT57    N4PF.
      @276    UNIT58    N4PF.
      @280    UNIT59    N4PF.
      @284    UNIT60    N4PF.
      @288    UNIT61    N4PF.
      @292    UNIT62    N4PF.
      @296    UNIT63    N4PF.
      @300    UNIT64    N4PF.
      @304    UNIT65    N4PF.
      @308    UNIT66    N4PF.
      @312    UNIT67    N4PF.
      @316    UNIT68    N4PF.
      @320    UNIT69    N4PF.
      @324    UNIT70    N4PF.
      @328    UNIT71    N4PF.
      @332    UNIT72    N4PF.
      @336    UNIT73    N4PF.
      @340    UNIT74    N4PF.
      @344    UNIT75    N4PF.
      @348    UNIT76    N4PF.
      @352    UNIT77    N4PF.
      @356    UNIT78    N4PF.
      @360    UNIT79    N4PF.
      @364    UNIT80    N4PF.
      @368    UNIT81    N4PF.
      @372    CHG1      N12P2F.
      @384    CHG2      N12P2F.
      @396    CHG3      N12P2F.
      @408    CHG4      N12P2F.
      @420    CHG5      N12P2F.
      @432    CHG6      N12P2F.
      @444    CHG7      N12P2F.
      @456    CHG8      N12P2F.
      @468    CHG9      N12P2F.
      @480    CHG10     N12P2F.
      @492    CHG11     N12P2F.
      @504    CHG12     N12P2F.
      @516    CHG13     N12P2F.
      @528    CHG14     N12P2F.
      @540    CHG15     N12P2F.
      @552    CHG16     N12P2F.
      @564    CHG17     N12P2F.
      @576    CHG18     N12P2F.
      @588    CHG19     N12P2F.
      @600    CHG20     N12P2F.
      @612    CHG21     N12P2F.
      @624    CHG22     N12P2F.
      @636    CHG23     N12P2F.
      @648    CHG24     N12P2F.
      @660    CHG25     N12P2F.
      @672    CHG26     N12P2F.
      @684    CHG27     N12P2F.
      @696    CHG28     N12P2F.
      @708    CHG29     N12P2F.
      @720    CHG30     N12P2F.
      @732    CHG31     N12P2F.
      @744    CHG32     N12P2F.
      @756    CHG33     N12P2F.
      @768    CHG34     N12P2F.
      @780    CHG35     N12P2F.
      @792    CHG36     N12P2F.
      @804    CHG37     N12P2F.
      @816    CHG38     N12P2F.
      @828    CHG39     N12P2F.
      @840    CHG40     N12P2F.
      @852    CHG41     N12P2F.
      @864    CHG42     N12P2F.
      @876    CHG43     N12P2F.
      @888    CHG44     N12P2F.
      @900    CHG45     N12P2F.
      @912    CHG46     N12P2F.
      @924    CHG47     N12P2F.
      @936    CHG48     N12P2F.
      @948    CHG49     N12P2F.
      @960    CHG50     N12P2F.
      @972    CHG51     N12P2F.
      @984    CHG52     N12P2F.
      @996    CHG53     N12P2F.
      @1008   CHG54     N12P2F.
      @1020   CHG55     N12P2F.
      @1032   CHG56     N12P2F.
      @1044   CHG57     N12P2F.
      @1056   CHG58     N12P2F.
      @1068   CHG59     N12P2F.
      @1080   CHG60     N12P2F.
      @1092   CHG61     N12P2F.
      @1104   CHG62     N12P2F.
      @1116   CHG63     N12P2F.
      @1128   CHG64     N12P2F.
      @1140   CHG65     N12P2F.
      @1152   CHG66     N12P2F.
      @1164   CHG67     N12P2F.
      @1176   CHG68     N12P2F.
      @1188   CHG69     N12P2F.
      @1200   CHG70     N12P2F.
      @1212   CHG71     N12P2F.
      @1224   CHG72     N12P2F.
      @1236   CHG73     N12P2F.
      @1248   CHG74     N12P2F.
      @1260   CHG75     N12P2F.
      @1272   CHG76     N12P2F.
      @1284   CHG77     N12P2F.
      @1296   CHG78     N12P2F.
      @1308   CHG79     N12P2F.
      @1320   CHG80     N12P2F.
      @1332   CHG81     N12P2F.
      @1344   ADATE     DATE10F.
      @1354   DDATE     DATE10F.
      @1364   PRDATE1   DATE10F.
      @1374   PRDATE2   DATE10F.
      @1384   PRDATE3   DATE10F.
;


