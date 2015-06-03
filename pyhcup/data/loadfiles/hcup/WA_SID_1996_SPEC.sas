DATA WA96SPEC; 
INFILE EBSPEC LRECL = 862; 

LENGTH 
       SEQ_SID  7
       PNUM_S   $17
       PAY1_X   $3
       PAY2_X   $3
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
       REVCD26  $4
       REVCD27  $4
       REVCD28  $4
       REVCD29  $4
       REVCD30  $4
       REVCD31  $4
       REVCD32  $4
       REVCD33  $4
       REVCD34  $4
       REVCD35  $4
       REVCD36  $4
       REVCD37  $4
       REVCD38  $4
       REVCD39  $4
       REVCD40  $4
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
       RDRG     4
       RDRGWT   5
       ADATE    4
       ZIP      $5
;


LABEL 
      SEQ_SID ='I:HCUP SID record sequence number'
      PNUM_S  ='I:Person number (synthetic)'
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
      REVCD26 ='I:Revenue code 26 (from data source)'
      REVCD27 ='I:Revenue code 27 (from data source)'
      REVCD28 ='I:Revenue code 28 (from data source)'
      REVCD29 ='I:Revenue code 29 (from data source)'
      REVCD30 ='I:Revenue code 30 (from data source)'
      REVCD31 ='I:Revenue code 31 (from data source)'
      REVCD32 ='I:Revenue code 32 (from data source)'
      REVCD33 ='I:Revenue code 33 (from data source)'
      REVCD34 ='I:Revenue code 34 (from data source)'
      REVCD35 ='I:Revenue code 35 (from data source)'
      REVCD36 ='I:Revenue code 36 (from data source)'
      REVCD37 ='I:Revenue code 37 (from data source)'
      REVCD38 ='I:Revenue code 38 (from data source)'
      REVCD39 ='I:Revenue code 39 (from data source)'
      REVCD40 ='I:Revenue code 40 (from data source)'
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
      RDRG    ='I:Refined DRG'
      RDRGWT  ='I:Refined DRG weight'
      ADATE   ='I:Admission date'
      ZIP     ='I:Patient zip code'
;


FORMAT
       SEQ_SID   Z13.
       ADATE     DATE9.
;


INPUT 
      @1      SEQ_SID   13.
      @14     PNUM_S    $CHAR17.
      @31     PAY1_X    $CHAR3.
      @34     PAY2_X    $CHAR3.
      @37     REVCD1    $CHAR4.
      @41     REVCD2    $CHAR4.
      @45     REVCD3    $CHAR4.
      @49     REVCD4    $CHAR4.
      @53     REVCD5    $CHAR4.
      @57     REVCD6    $CHAR4.
      @61     REVCD7    $CHAR4.
      @65     REVCD8    $CHAR4.
      @69     REVCD9    $CHAR4.
      @73     REVCD10   $CHAR4.
      @77     REVCD11   $CHAR4.
      @81     REVCD12   $CHAR4.
      @85     REVCD13   $CHAR4.
      @89     REVCD14   $CHAR4.
      @93     REVCD15   $CHAR4.
      @97     REVCD16   $CHAR4.
      @101    REVCD17   $CHAR4.
      @105    REVCD18   $CHAR4.
      @109    REVCD19   $CHAR4.
      @113    REVCD20   $CHAR4.
      @117    REVCD21   $CHAR4.
      @121    REVCD22   $CHAR4.
      @125    REVCD23   $CHAR4.
      @129    REVCD24   $CHAR4.
      @133    REVCD25   $CHAR4.
      @137    REVCD26   $CHAR4.
      @141    REVCD27   $CHAR4.
      @145    REVCD28   $CHAR4.
      @149    REVCD29   $CHAR4.
      @153    REVCD30   $CHAR4.
      @157    REVCD31   $CHAR4.
      @161    REVCD32   $CHAR4.
      @165    REVCD33   $CHAR4.
      @169    REVCD34   $CHAR4.
      @173    REVCD35   $CHAR4.
      @177    REVCD36   $CHAR4.
      @181    REVCD37   $CHAR4.
      @185    REVCD38   $CHAR4.
      @189    REVCD39   $CHAR4.
      @193    REVCD40   $CHAR4.
      @197    UNIT1     N4PF.
      @201    UNIT2     N4PF.
      @205    UNIT3     N4PF.
      @209    UNIT4     N4PF.
      @213    UNIT5     N4PF.
      @217    UNIT6     N4PF.
      @221    UNIT7     N4PF.
      @225    UNIT8     N4PF.
      @229    UNIT9     N4PF.
      @233    UNIT10    N4PF.
      @237    UNIT11    N4PF.
      @241    UNIT12    N4PF.
      @245    UNIT13    N4PF.
      @249    UNIT14    N4PF.
      @253    UNIT15    N4PF.
      @257    UNIT16    N4PF.
      @261    UNIT17    N4PF.
      @265    UNIT18    N4PF.
      @269    UNIT19    N4PF.
      @273    UNIT20    N4PF.
      @277    UNIT21    N4PF.
      @281    UNIT22    N4PF.
      @285    UNIT23    N4PF.
      @289    UNIT24    N4PF.
      @293    UNIT25    N4PF.
      @297    UNIT26    N4PF.
      @301    UNIT27    N4PF.
      @305    UNIT28    N4PF.
      @309    UNIT29    N4PF.
      @313    UNIT30    N4PF.
      @317    UNIT31    N4PF.
      @321    UNIT32    N4PF.
      @325    UNIT33    N4PF.
      @329    UNIT34    N4PF.
      @333    UNIT35    N4PF.
      @337    UNIT36    N4PF.
      @341    UNIT37    N4PF.
      @345    UNIT38    N4PF.
      @349    UNIT39    N4PF.
      @353    UNIT40    N4PF.
      @357    CHG1      N12P2F.
      @369    CHG2      N12P2F.
      @381    CHG3      N12P2F.
      @393    CHG4      N12P2F.
      @405    CHG5      N12P2F.
      @417    CHG6      N12P2F.
      @429    CHG7      N12P2F.
      @441    CHG8      N12P2F.
      @453    CHG9      N12P2F.
      @465    CHG10     N12P2F.
      @477    CHG11     N12P2F.
      @489    CHG12     N12P2F.
      @501    CHG13     N12P2F.
      @513    CHG14     N12P2F.
      @525    CHG15     N12P2F.
      @537    CHG16     N12P2F.
      @549    CHG17     N12P2F.
      @561    CHG18     N12P2F.
      @573    CHG19     N12P2F.
      @585    CHG20     N12P2F.
      @597    CHG21     N12P2F.
      @609    CHG22     N12P2F.
      @621    CHG23     N12P2F.
      @633    CHG24     N12P2F.
      @645    CHG25     N12P2F.
      @657    CHG26     N12P2F.
      @669    CHG27     N12P2F.
      @681    CHG28     N12P2F.
      @693    CHG29     N12P2F.
      @705    CHG30     N12P2F.
      @717    CHG31     N12P2F.
      @729    CHG32     N12P2F.
      @741    CHG33     N12P2F.
      @753    CHG34     N12P2F.
      @765    CHG35     N12P2F.
      @777    CHG36     N12P2F.
      @789    CHG37     N12P2F.
      @801    CHG38     N12P2F.
      @813    CHG39     N12P2F.
      @825    CHG40     N12P2F.
      @837    RDRG      N4PF.
      @841    RDRGWT    N7P2F.
      @848    ADATE     DATE10F.
      @858    ZIP       $CHAR5.
;


