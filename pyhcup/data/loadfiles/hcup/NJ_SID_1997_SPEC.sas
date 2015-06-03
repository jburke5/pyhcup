DATA NJ97SPEC; 
INFILE EBSPEC LRECL = 619; 

LENGTH 
       SEQ_SID  7
       MDSPEC   $3
       MRN_S    $17
       PSTCO    4
       READMIT  3
       BWT      4
       PAY1_X   $3
       PAY2_X   $3
       PAY3_X   $3
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
      SEQ_SID ='I:HCUP SID record sequence number'
      MDSPEC  ='I:Physician specialty'
      MRN_S   ='I:Medical record number (synthetic)'
      PSTCO   ='I:Patient state/county FIPS code'
      READMIT ='I:Readmission'
      BWT     ='I:Birthweight in grams'
      PAY1_X  ='I:Primary exp. payer (from data source)'
      PAY2_X  ='I:Secondary exp. payer (from data source'
      PAY3_X  ='I:Tertiary exp. payer (from data source)'
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
      ZIP     ='I:Patient zip code'
;


FORMAT
       SEQ_SID   Z13.
;


INPUT 
      @1      SEQ_SID   13.
      @14     MDSPEC    $CHAR3.
      @17     MRN_S     $CHAR17.
      @34     PSTCO     N5PF.
      @39     READMIT   N2PF.
      @41     BWT       N5PF.
      @46     PAY1_X    $CHAR3.
      @49     PAY2_X    $CHAR3.
      @52     PAY3_X    $CHAR3.
      @55     UNIT1     N4PF.
      @59     UNIT2     N4PF.
      @63     UNIT3     N4PF.
      @67     UNIT4     N4PF.
      @71     UNIT5     N4PF.
      @75     UNIT6     N4PF.
      @79     UNIT7     N4PF.
      @83     UNIT8     N4PF.
      @87     UNIT9     N4PF.
      @91     UNIT10    N4PF.
      @95     UNIT11    N4PF.
      @99     UNIT12    N4PF.
      @103    UNIT13    N4PF.
      @107    UNIT14    N4PF.
      @111    UNIT15    N4PF.
      @115    UNIT16    N4PF.
      @119    UNIT17    N4PF.
      @123    UNIT18    N4PF.
      @127    UNIT19    N4PF.
      @131    UNIT20    N4PF.
      @135    UNIT21    N4PF.
      @139    UNIT22    N4PF.
      @143    UNIT23    N4PF.
      @147    UNIT24    N4PF.
      @151    UNIT25    N4PF.
      @155    UNIT26    N4PF.
      @159    UNIT27    N4PF.
      @163    UNIT28    N4PF.
      @167    UNIT29    N4PF.
      @171    UNIT30    N4PF.
      @175    UNIT31    N4PF.
      @179    UNIT32    N4PF.
      @183    UNIT33    N4PF.
      @187    UNIT34    N4PF.
      @191    UNIT35    N4PF.
      @195    CHG1      N12P2F.
      @207    CHG2      N12P2F.
      @219    CHG3      N12P2F.
      @231    CHG4      N12P2F.
      @243    CHG5      N12P2F.
      @255    CHG6      N12P2F.
      @267    CHG7      N12P2F.
      @279    CHG8      N12P2F.
      @291    CHG9      N12P2F.
      @303    CHG10     N12P2F.
      @315    CHG11     N12P2F.
      @327    CHG12     N12P2F.
      @339    CHG13     N12P2F.
      @351    CHG14     N12P2F.
      @363    CHG15     N12P2F.
      @375    CHG16     N12P2F.
      @387    CHG17     N12P2F.
      @399    CHG18     N12P2F.
      @411    CHG19     N12P2F.
      @423    CHG20     N12P2F.
      @435    CHG21     N12P2F.
      @447    CHG22     N12P2F.
      @459    CHG23     N12P2F.
      @471    CHG24     N12P2F.
      @483    CHG25     N12P2F.
      @495    CHG26     N12P2F.
      @507    CHG27     N12P2F.
      @519    CHG28     N12P2F.
      @531    CHG29     N12P2F.
      @543    CHG30     N12P2F.
      @555    CHG31     N12P2F.
      @567    CHG32     N12P2F.
      @579    CHG33     N12P2F.
      @591    CHG34     N12P2F.
      @603    CHG35     N12P2F.
      @615    ZIP       $CHAR5.
;


