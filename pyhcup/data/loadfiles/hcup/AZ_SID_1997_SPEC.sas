DATA AZ_SIDC_97_SPEC; 
INFILE EBSPEC LRECL = 838; 

LENGTH 
       SEQ_SID  7
       PNUM_S   $17
       BWT      4
       PAY1_X   $2
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
       ADATE    4
       DDATE    4
       PRDATE1  4
       DOB      4
       ZIP      $5
;


LABEL 
      SEQ_SID ='I:HCUP SID record sequence number'
      PNUM_S  ='I:Person number (synthetic)'
      BWT     ='I:Birthweight in grams'
      PAY1_X  ='I:Primary exp. payer (from data source)'
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
      ADATE   ='I:Admission date'
      DDATE   ='I:Discharge date'
      PRDATE1 ='I:Date of principal procedure'
      DOB     ='I:Date of birth'
      ZIP     ='I:Patient zip code'
;


FORMAT
       SEQ_SID   Z13.
       ADATE     DATE9.
       DDATE     DATE9.
       PRDATE1   DATE9.
       DOB       DATE9.
;


INPUT 
      @1      SEQ_SID   13.
      @14     PNUM_S    $CHAR17.
      @31     BWT       N5PF.
      @36     PAY1_X    $CHAR2.
      @38     CHG1      N12P2F.
      @50     CHG2      N12P2F.
      @62     CHG3      N12P2F.
      @74     CHG4      N12P2F.
      @86     CHG5      N12P2F.
      @98     CHG6      N12P2F.
      @110    CHG7      N12P2F.
      @122    CHG8      N12P2F.
      @134    CHG9      N12P2F.
      @146    CHG10     N12P2F.
      @158    CHG11     N12P2F.
      @170    CHG12     N12P2F.
      @182    CHG13     N12P2F.
      @194    CHG14     N12P2F.
      @206    CHG15     N12P2F.
      @218    CHG16     N12P2F.
      @230    CHG17     N12P2F.
      @242    CHG18     N12P2F.
      @254    CHG19     N12P2F.
      @266    CHG20     N12P2F.
      @278    CHG21     N12P2F.
      @290    CHG22     N12P2F.
      @302    CHG23     N12P2F.
      @314    CHG24     N12P2F.
      @326    CHG25     N12P2F.
      @338    CHG26     N12P2F.
      @350    CHG27     N12P2F.
      @362    CHG28     N12P2F.
      @374    CHG29     N12P2F.
      @386    CHG30     N12P2F.
      @398    CHG31     N12P2F.
      @410    CHG32     N12P2F.
      @422    CHG33     N12P2F.
      @434    CHG34     N12P2F.
      @446    CHG35     N12P2F.
      @458    CHG36     N12P2F.
      @470    CHG37     N12P2F.
      @482    CHG38     N12P2F.
      @494    CHG39     N12P2F.
      @506    CHG40     N12P2F.
      @518    CHG41     N12P2F.
      @530    CHG42     N12P2F.
      @542    CHG43     N12P2F.
      @554    CHG44     N12P2F.
      @566    CHG45     N12P2F.
      @578    CHG46     N12P2F.
      @590    CHG47     N12P2F.
      @602    CHG48     N12P2F.
      @614    CHG49     N12P2F.
      @626    CHG50     N12P2F.
      @638    CHG51     N12P2F.
      @650    CHG52     N12P2F.
      @662    CHG53     N12P2F.
      @674    CHG54     N12P2F.
      @686    CHG55     N12P2F.
      @698    CHG56     N12P2F.
      @710    CHG57     N12P2F.
      @722    CHG58     N12P2F.
      @734    CHG59     N12P2F.
      @746    CHG60     N12P2F.
      @758    CHG61     N12P2F.
      @770    CHG62     N12P2F.
      @782    CHG63     N12P2F.
      @794    ADATE     DATE10F.
      @804    DDATE     DATE10F.
      @814    PRDATE1   DATE10F.
      @824    DOB       DATE10F.
      @834    ZIP       $CHAR5.
;


