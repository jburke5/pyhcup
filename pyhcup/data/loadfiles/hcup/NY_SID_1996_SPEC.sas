DATA NY96SPEC; 
INFILE EBSPEC1 LRECL = 542; 

LENGTH 
       SEQ_SID  7
       PSTCO    4
       BWT      4
       TMDX1    3
       TMDX2    3
       TMDX3    3
       TMDX4    3
       TMDX5    3
       TMDX6    3
       TMDX7    3
       TMDX8    3
       TMDX9    3
       TMDX10   3
       TMDX11   3
       TMDX12   3
       TMDX13   3
       TMDX14   3
       TMDX15   3
       PAY1_X   $2
       PAY2_X   $2
       REVCD1   $4
       REVCD2   $4
       REVCD3   $4
       REVCD4   $4
       REVCD5   $4
       REVCD6   $4
       REVCD7   $4
       REVCD8   $4
       REVCD9   $4
       REVCD10  $4
       REVCD11  $4
       REVCD12  $4
       REVCD13  $4
       REVCD14  $4
       REVCD15  $4
       REVCD16  $4
       REVCD17  $4
       REVCD18  $4
       REVCD19  $4
       REVCD20  $4
       REVCD21  $4
       REVCD22  $4
       REVCD23  $4
       REVCD24  $4
       REVCD25  $4
       UNIT1    4
       UNIT2    4
       UNIT3    4
       UNIT4    4
       UNIT5    4
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
       RATE1    5
       RATE2    5
       RATE3    5
       RATE4    5
       RATE5    5
       ADATE    4
       DDATE    4
       DOB      4
       ZIP      $5
;


LABEL 
      SEQ_SID ='I:HCUP SID record sequence number'
      PSTCO   ='I:Patient state/county FIPS code'
      BWT     ='I:Birthweight in grams'
      TMDX1   ='I:Time of onset: principal diagnosis'
      TMDX2   ='I:Time of onset: diagnosis 2'
      TMDX3   ='I:Time of onset: diagnosis 3'
      TMDX4   ='I:Time of onset: diagnosis 4'
      TMDX5   ='I:Time of onset: diagnosis 5'
      TMDX6   ='I:Time of onset: diagnosis 6'
      TMDX7   ='I:Time of onset: diagnosis 7'
      TMDX8   ='I:Time of onset: diagnosis 8'
      TMDX9   ='I:Time of onset: diagnosis 9'
      TMDX10  ='I:Time of onset: diagnosis 10'
      TMDX11  ='I:Time of onset: diagnosis 11'
      TMDX12  ='I:Time of onset: diagnosis 12'
      TMDX13  ='I:Time of onset: diagnosis 13'
      TMDX14  ='I:Time of onset: diagnosis 14'
      TMDX15  ='I:Time of onset: diagnosis 15'
      PAY1_X  ='I:Primary exp. payer (from data source)'
      PAY2_X  ='I:Secondary exp. payer (from data source'
      REVCD1  ='I:Revenue code 1 (from data source)'
      REVCD2  ='I:Revenue code 2 (from data source)'
      REVCD3  ='I:Revenue code 3 (from data source)'
      REVCD4  ='I:Revenue code 4 (from data source)'
      REVCD5  ='I:Revenue code 5 (from data source)'
      REVCD6  ='I:Revenue code 6 (from data source)'
      REVCD7  ='I:Revenue code 7 (from data source)'
      REVCD8  ='I:Revenue code 8 (from data source)'
      REVCD9  ='I:Revenue code 9 (from data source)'
      REVCD10 ='I:Revenue code 10 (from data source)'
      REVCD11 ='I:Revenue code 11 (from data source)'
      REVCD12 ='I:Revenue code 12 (from data source)'
      REVCD13 ='I:Revenue code 13 (from data source)'
      REVCD14 ='I:Revenue code 14 (from data source)'
      REVCD15 ='I:Revenue code 15 (from data source)'
      REVCD16 ='I:Revenue code 16 (from data source)'
      REVCD17 ='I:Revenue code 17 (from data source)'
      REVCD18 ='I:Revenue code 18 (from data source)'
      REVCD19 ='I:Revenue code 19 (from data source)'
      REVCD20 ='I:Revenue code 20 (from data source)'
      REVCD21 ='I:Revenue code 21 (from data source)'
      REVCD22 ='I:Revenue code 22 (from data source)'
      REVCD23 ='I:Revenue code 23 (from data source)'
      REVCD24 ='I:Revenue code 24 (from data source)'
      REVCD25 ='I:Revenue code 25 (from data source)'
      UNIT1   ='I:Units of service 1 (from data source)'
      UNIT2   ='I:Units of service 2 (from data source)'
      UNIT3   ='I:Units of service 3 (from data source)'
      UNIT4   ='I:Units of service 4 (from data source)'
      UNIT5   ='I:Units of service 5 (from data source)'
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
      RATE1   ='I:Daily rate 1 (from data source)'
      RATE2   ='I:Daily rate 2 (from data source)'
      RATE3   ='I:Daily rate 3 (from data source)'
      RATE4   ='I:Daily rate 4 (from data source)'
      RATE5   ='I:Daily rate 5 (from data source)'
      ADATE   ='I:Admission date'
      DDATE   ='I:Discharge date'
      DOB     ='I:Date of birth'
      ZIP     ='I:Patient zip code'
;


FORMAT
       SEQ_SID   Z13.
       ADATE     DATE9.
       DDATE     DATE9.
       DOB       DATE9.
;


INPUT 
      @1      SEQ_SID   13.
      @14     PSTCO     N5PF.
      @19     BWT       N5PF.
      @24     TMDX1     N2PF.
      @26     TMDX2     N2PF.
      @28     TMDX3     N2PF.
      @30     TMDX4     N2PF.
      @32     TMDX5     N2PF.
      @34     TMDX6     N2PF.
      @36     TMDX7     N2PF.
      @38     TMDX8     N2PF.
      @40     TMDX9     N2PF.
      @42     TMDX10    N2PF.
      @44     TMDX11    N2PF.
      @46     TMDX12    N2PF.
      @48     TMDX13    N2PF.
      @50     TMDX14    N2PF.
      @52     TMDX15    N2PF.
      @54     PAY1_X    $CHAR2.
      @56     PAY2_X    $CHAR2.
      @58     REVCD1    $CHAR4.
      @62     REVCD2    $CHAR4.
      @66     REVCD3    $CHAR4.
      @70     REVCD4    $CHAR4.
      @74     REVCD5    $CHAR4.
      @78     REVCD6    $CHAR4.
      @82     REVCD7    $CHAR4.
      @86     REVCD8    $CHAR4.
      @90     REVCD9    $CHAR4.
      @94     REVCD10   $CHAR4.
      @98     REVCD11   $CHAR4.
      @102    REVCD12   $CHAR4.
      @106    REVCD13   $CHAR4.
      @110    REVCD14   $CHAR4.
      @114    REVCD15   $CHAR4.
      @118    REVCD16   $CHAR4.
      @122    REVCD17   $CHAR4.
      @126    REVCD18   $CHAR4.
      @130    REVCD19   $CHAR4.
      @134    REVCD20   $CHAR4.
      @138    REVCD21   $CHAR4.
      @142    REVCD22   $CHAR4.
      @146    REVCD23   $CHAR4.
      @150    REVCD24   $CHAR4.
      @154    REVCD25   $CHAR4.
      @158    UNIT1     N4PF.
      @162    UNIT2     N4PF.
      @166    UNIT3     N4PF.
      @170    UNIT4     N4PF.
      @174    UNIT5     N4PF.
      @178    CHG1      N12P2F.
      @190    CHG2      N12P2F.
      @202    CHG3      N12P2F.
      @214    CHG4      N12P2F.
      @226    CHG5      N12P2F.
      @238    CHG6      N12P2F.
      @250    CHG7      N12P2F.
      @262    CHG8      N12P2F.
      @274    CHG9      N12P2F.
      @286    CHG10     N12P2F.
      @298    CHG11     N12P2F.
      @310    CHG12     N12P2F.
      @322    CHG13     N12P2F.
      @334    CHG14     N12P2F.
      @346    CHG15     N12P2F.
      @358    CHG16     N12P2F.
      @370    CHG17     N12P2F.
      @382    CHG18     N12P2F.
      @394    CHG19     N12P2F.
      @406    CHG20     N12P2F.
      @418    CHG21     N12P2F.
      @430    CHG22     N12P2F.
      @442    CHG23     N12P2F.
      @454    CHG24     N12P2F.
      @466    CHG25     N12P2F.
      @478    RATE1     N6P2F.
      @484    RATE2     N6P2F.
      @490    RATE3     N6P2F.
      @496    RATE4     N6P2F.
      @502    RATE5     N6P2F.
      @508    ADATE     DATE10F.
      @518    DDATE     DATE10F.
      @528    DOB       DATE10F.
      @538    ZIP       $CHAR5.
;


