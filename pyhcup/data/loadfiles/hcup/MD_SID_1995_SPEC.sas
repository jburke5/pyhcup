DATA MD95SPEC; 
INFILE EBSPEC LRECL = 441; 

LENGTH 
       SEQ_SID  7
       MRN_S    $17
       BWT      3
       PAY1_X   $17
       PAY2_X   $17
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
;


LABEL 
      SEQ_SID ='I:HCUP SID record sequence number'
      MRN_S   ='I:Medical record number (synthetic)'
      BWT     ='I:Birthweight in grams'
      PAY1_X  ='I:Primary exp. payer (from data source)'
      PAY2_X  ='I:Secondary exp. payer (from data source'
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
;


FORMAT
       SEQ_SID   Z13.
;


INPUT 
      @1      SEQ_SID   13.
      @14     MRN_S     $CHAR17.
      @31     BWT       N5PF.
      @36     PAY1_X    $CHAR17.
      @53     PAY2_X    $CHAR17.
      @70     CHG1      N12P2F.
      @82     CHG2      N12P2F.
      @94     CHG3      N12P2F.
      @106    CHG4      N12P2F.
      @118    CHG5      N12P2F.
      @130    CHG6      N12P2F.
      @142    CHG7      N12P2F.
      @154    CHG8      N12P2F.
      @166    CHG9      N12P2F.
      @178    CHG10     N12P2F.
      @190    CHG11     N12P2F.
      @202    CHG12     N12P2F.
      @214    CHG13     N12P2F.
      @226    CHG14     N12P2F.
      @238    CHG15     N12P2F.
      @250    CHG16     N12P2F.
      @262    CHG17     N12P2F.
      @274    CHG18     N12P2F.
      @286    CHG19     N12P2F.
      @298    CHG20     N12P2F.
      @310    CHG21     N12P2F.
      @322    CHG22     N12P2F.
      @334    CHG23     N12P2F.
      @346    CHG24     N12P2F.
      @358    CHG25     N12P2F.
      @370    CHG26     N12P2F.
      @382    CHG27     N12P2F.
      @394    CHG28     N12P2F.
      @406    CHG29     N12P2F.
      @418    CHG30     N12P2F.
      @430    CHG31     N12P2F.
;


