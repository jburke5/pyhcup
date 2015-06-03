DATA NJ97ASTS; 
INFILE EBASTS LRECL = 632; 

LENGTH 
       SEQ_ASD  7
       PROCESS  6
       YEAR     3
       DSHOSPID $13
       MRN_S    $17
       PSTCO    4
       PAY1_X   $3
       PAY2_X   $3
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
       ZIP      $5
;


LABEL 
      SEQ_ASD ='S:HCUP AS record sequence number'
      PROCESS ='S:HCUP-3 discharge processing ID number'
      YEAR    ='Calendar year'
      DSHOSPID='S:Data source hospital ID number'
      MRN_S   ='S:Medical record number (synthetic)'
      PSTCO   ='S:Patient state/county FIPS code'
      PAY1_X  ='S:Primary exp. payer (from data source)'
      PAY2_X  ='S:Secondary exp. payer (from data source'
      UNIT1   ='S:Units of service 1 (from data source)'
      UNIT2   ='S:Units of service 2 (from data source)'
      UNIT3   ='S:Units of service 3 (from data source)'
      UNIT4   ='S:Units of service 4 (from data source)'
      UNIT5   ='S:Units of service 5 (from data source)'
      UNIT6   ='S:Units of service 6 (from data source)'
      UNIT7   ='S:Units of service 7 (from data source)'
      UNIT8   ='S:Units of service 8 (from data source)'
      UNIT9   ='S:Units of service 9 (from data source)'
      UNIT10  ='S:Units of service 10 (from data source)'
      UNIT11  ='S:Units of service 11 (from data source)'
      UNIT12  ='S:Units of service 12 (from data source)'
      UNIT13  ='S:Units of service 13 (from data source)'
      UNIT14  ='S:Units of service 14 (from data source)'
      UNIT15  ='S:Units of service 15 (from data source)'
      UNIT16  ='S:Units of service 16 (from data source)'
      UNIT17  ='S:Units of service 17 (from data source)'
      UNIT18  ='S:Units of service 18 (from data source)'
      UNIT19  ='S:Units of service 19 (from data source)'
      UNIT20  ='S:Units of service 20 (from data source)'
      UNIT21  ='S:Units of service 21 (from data source)'
      UNIT22  ='S:Units of service 22 (from data source)'
      UNIT23  ='S:Units of service 23 (from data source)'
      UNIT24  ='S:Units of service 24 (from data source)'
      UNIT25  ='S:Units of service 25 (from data source)'
      UNIT26  ='S:Units of service 26 (from data source)'
      UNIT27  ='S:Units of service 27 (from data source)'
      UNIT28  ='S:Units of service 28 (from data source)'
      UNIT29  ='S:Units of service 29 (from data source)'
      UNIT30  ='S:Units of service 30 (from data source)'
      UNIT31  ='S:Units of service 31 (from data source)'
      UNIT32  ='S:Units of service 32 (from data source)'
      UNIT33  ='S:Units of service 33 (from data source)'
      UNIT34  ='S:Units of service 34 (from data source)'
      UNIT35  ='S:Units of service 35 (from data source)'
      CHG1    ='S:Detailed charges 1 (from data source)'
      CHG2    ='S:Detailed charges 2 (from data source)'
      CHG3    ='S:Detailed charges 3 (from data source)'
      CHG4    ='S:Detailed charges 4 (from data source)'
      CHG5    ='S:Detailed charges 5 (from data source)'
      CHG6    ='S:Detailed charges 6 (from data source)'
      CHG7    ='S:Detailed charges 7 (from data source)'
      CHG8    ='S:Detailed charges 8 (from data source)'
      CHG9    ='S:Detailed charges 9 (from data source)'
      CHG10   ='S:Detailed charges 10 (from data source)'
      CHG11   ='S:Detailed charges 11 (from data source)'
      CHG12   ='S:Detailed charges 12 (from data source)'
      CHG13   ='S:Detailed charges 13 (from data source)'
      CHG14   ='S:Detailed charges 14 (from data source)'
      CHG15   ='S:Detailed charges 15 (from data source)'
      CHG16   ='S:Detailed charges 16 (from data source)'
      CHG17   ='S:Detailed charges 17 (from data source)'
      CHG18   ='S:Detailed charges 18 (from data source)'
      CHG19   ='S:Detailed charges 19 (from data source)'
      CHG20   ='S:Detailed charges 20 (from data source)'
      CHG21   ='S:Detailed charges 21 (from data source)'
      CHG22   ='S:Detailed charges 22 (from data source)'
      CHG23   ='S:Detailed charges 23 (from data source)'
      CHG24   ='S:Detailed charges 24 (from data source)'
      CHG25   ='S:Detailed charges 25 (from data source)'
      CHG26   ='S:Detailed charges 26 (from data source)'
      CHG27   ='S:Detailed charges 27 (from data source)'
      CHG28   ='S:Detailed charges 28 (from data source)'
      CHG29   ='S:Detailed charges 29 (from data source)'
      CHG30   ='S:Detailed charges 30 (from data source)'
      CHG31   ='S:Detailed charges 31 (from data source)'
      CHG32   ='S:Detailed charges 32 (from data source)'
      CHG33   ='S:Detailed charges 33 (from data source)'
      CHG34   ='S:Detailed charges 34 (from data source)'
      CHG35   ='S:Detailed charges 35 (from data source)'
      ZIP     ='S:Patient zip code'
;


FORMAT
       SEQ_ASD   Z13.
;


INPUT 
      @1      SEQ_ASD   13.
      @14     PROCESS   11.
      @25     YEAR      N2PF.
      @27     DSHOSPID  $CHAR13.
      @40     MRN_S     $CHAR17.
      @57     PSTCO     N5PF.
      @62     PAY1_X    $CHAR3.
      @65     PAY2_X    $CHAR3.
      @68     UNIT1     N4PF.
      @72     UNIT2     N4PF.
      @76     UNIT3     N4PF.
      @80     UNIT4     N4PF.
      @84     UNIT5     N4PF.
      @88     UNIT6     N4PF.
      @92     UNIT7     N4PF.
      @96     UNIT8     N4PF.
      @100    UNIT9     N4PF.
      @104    UNIT10    N4PF.
      @108    UNIT11    N4PF.
      @112    UNIT12    N4PF.
      @116    UNIT13    N4PF.
      @120    UNIT14    N4PF.
      @124    UNIT15    N4PF.
      @128    UNIT16    N4PF.
      @132    UNIT17    N4PF.
      @136    UNIT18    N4PF.
      @140    UNIT19    N4PF.
      @144    UNIT20    N4PF.
      @148    UNIT21    N4PF.
      @152    UNIT22    N4PF.
      @156    UNIT23    N4PF.
      @160    UNIT24    N4PF.
      @164    UNIT25    N4PF.
      @168    UNIT26    N4PF.
      @172    UNIT27    N4PF.
      @176    UNIT28    N4PF.
      @180    UNIT29    N4PF.
      @184    UNIT30    N4PF.
      @188    UNIT31    N4PF.
      @192    UNIT32    N4PF.
      @196    UNIT33    N4PF.
      @200    UNIT34    N4PF.
      @204    UNIT35    N4PF.
      @208    CHG1      N12P2F.
      @220    CHG2      N12P2F.
      @232    CHG3      N12P2F.
      @244    CHG4      N12P2F.
      @256    CHG5      N12P2F.
      @268    CHG6      N12P2F.
      @280    CHG7      N12P2F.
      @292    CHG8      N12P2F.
      @304    CHG9      N12P2F.
      @316    CHG10     N12P2F.
      @328    CHG11     N12P2F.
      @340    CHG12     N12P2F.
      @352    CHG13     N12P2F.
      @364    CHG14     N12P2F.
      @376    CHG15     N12P2F.
      @388    CHG16     N12P2F.
      @400    CHG17     N12P2F.
      @412    CHG18     N12P2F.
      @424    CHG19     N12P2F.
      @436    CHG20     N12P2F.
      @448    CHG21     N12P2F.
      @460    CHG22     N12P2F.
      @472    CHG23     N12P2F.
      @484    CHG24     N12P2F.
      @496    CHG25     N12P2F.
      @508    CHG26     N12P2F.
      @520    CHG27     N12P2F.
      @532    CHG28     N12P2F.
      @544    CHG29     N12P2F.
      @556    CHG30     N12P2F.
      @568    CHG31     N12P2F.
      @580    CHG32     N12P2F.
      @592    CHG33     N12P2F.
      @604    CHG34     N12P2F.
      @616    CHG35     N12P2F.
      @628    ZIP       $CHAR5.
;


