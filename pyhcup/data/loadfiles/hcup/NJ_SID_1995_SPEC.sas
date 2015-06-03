DATA NJ95SPEC; 
INFILE EBSPEC1 LRECL = 661; 

LENGTH 
       SEQ_SID  7
       MDSPEC   $3
       MRN_S    $17
       PSTCO    4
       READMIT  3
       BWT      3
       PAY1_X   $17
       PAY2_X   $17
       PAY3_X   $17
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
      @46     PAY1_X    $CHAR17.
      @63     PAY2_X    $CHAR17.
      @80     PAY3_X    $CHAR17.
      @97     UNIT1     N4PF.
      @101    UNIT2     N4PF.
      @105    UNIT3     N4PF.
      @109    UNIT4     N4PF.
      @113    UNIT5     N4PF.
      @117    UNIT6     N4PF.
      @121    UNIT7     N4PF.
      @125    UNIT8     N4PF.
      @129    UNIT9     N4PF.
      @133    UNIT10    N4PF.
      @137    UNIT11    N4PF.
      @141    UNIT12    N4PF.
      @145    UNIT13    N4PF.
      @149    UNIT14    N4PF.
      @153    UNIT15    N4PF.
      @157    UNIT16    N4PF.
      @161    UNIT17    N4PF.
      @165    UNIT18    N4PF.
      @169    UNIT19    N4PF.
      @173    UNIT20    N4PF.
      @177    UNIT21    N4PF.
      @181    UNIT22    N4PF.
      @185    UNIT23    N4PF.
      @189    UNIT24    N4PF.
      @193    UNIT25    N4PF.
      @197    UNIT26    N4PF.
      @201    UNIT27    N4PF.
      @205    UNIT28    N4PF.
      @209    UNIT29    N4PF.
      @213    UNIT30    N4PF.
      @217    UNIT31    N4PF.
      @221    UNIT32    N4PF.
      @225    UNIT33    N4PF.
      @229    UNIT34    N4PF.
      @233    UNIT35    N4PF.
      @237    CHG1      N12P2F.
      @249    CHG2      N12P2F.
      @261    CHG3      N12P2F.
      @273    CHG4      N12P2F.
      @285    CHG5      N12P2F.
      @297    CHG6      N12P2F.
      @309    CHG7      N12P2F.
      @321    CHG8      N12P2F.
      @333    CHG9      N12P2F.
      @345    CHG10     N12P2F.
      @357    CHG11     N12P2F.
      @369    CHG12     N12P2F.
      @381    CHG13     N12P2F.
      @393    CHG14     N12P2F.
      @405    CHG15     N12P2F.
      @417    CHG16     N12P2F.
      @429    CHG17     N12P2F.
      @441    CHG18     N12P2F.
      @453    CHG19     N12P2F.
      @465    CHG20     N12P2F.
      @477    CHG21     N12P2F.
      @489    CHG22     N12P2F.
      @501    CHG23     N12P2F.
      @513    CHG24     N12P2F.
      @525    CHG25     N12P2F.
      @537    CHG26     N12P2F.
      @549    CHG27     N12P2F.
      @561    CHG28     N12P2F.
      @573    CHG29     N12P2F.
      @585    CHG30     N12P2F.
      @597    CHG31     N12P2F.
      @609    CHG32     N12P2F.
      @621    CHG33     N12P2F.
      @633    CHG34     N12P2F.
      @645    CHG35     N12P2F.
      @657    ZIP       $CHAR5.
;


