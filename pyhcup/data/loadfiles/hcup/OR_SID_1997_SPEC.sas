DATA OR97SPEC; 
INFILE EBSPEC LRECL = 235; 

LENGTH 
       SEQ_SID  7
       PAY1_X   $1
       PAY2_X   $1
       PAY3_X   $1
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
       RDRG     4
       ADATE    4
       DDATE    4
       PRDATE1  4
       PRDATE2  4
       PRDATE3  4
       PRDATE4  4
       PRDATE5  4
       PRDATE6  4
       DOB      4
       ZIP      $5
;


LABEL 
      SEQ_SID ='I:HCUP SID record sequence number'
      PAY1_X  ='I:Primary exp. payer (from data source)'
      PAY2_X  ='I:Secondary exp. payer (from data source'
      PAY3_X  ='I:Tertiary exp. payer (from data source)'
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
      RDRG    ='I:Refined DRG'
      ADATE   ='I:Admission date'
      DDATE   ='I:Discharge date'
      PRDATE1 ='I:Date of principal procedure'
      PRDATE2 ='I:Date of procedure 2'
      PRDATE3 ='I:Date of procedure 3'
      PRDATE4 ='I:Date of procedure 4'
      PRDATE5 ='I:Date of procedure 5'
      PRDATE6 ='I:Date of procedure 6'
      DOB     ='I:Date of birth'
      ZIP     ='I:Patient zip code'
;


FORMAT
       SEQ_SID   Z13.
       ADATE     DATE9.
       DDATE     DATE9.
       PRDATE1   DATE9.
       PRDATE2   DATE9.
       PRDATE3   DATE9.
       PRDATE4   DATE9.
       PRDATE5   DATE9.
       PRDATE6   DATE9.
       DOB       DATE9.
;


INPUT 
      @1      SEQ_SID   13.
      @14     PAY1_X    $CHAR1.
      @15     PAY2_X    $CHAR1.
      @16     PAY3_X    $CHAR1.
      @17     CHG1      N12P2F.
      @29     CHG2      N12P2F.
      @41     CHG3      N12P2F.
      @53     CHG4      N12P2F.
      @65     CHG5      N12P2F.
      @77     CHG6      N12P2F.
      @89     CHG7      N12P2F.
      @101    CHG8      N12P2F.
      @113    CHG9      N12P2F.
      @125    CHG10     N12P2F.
      @137    RDRG      N4PF.
      @141    ADATE     DATE10F.
      @151    DDATE     DATE10F.
      @161    PRDATE1   DATE10F.
      @171    PRDATE2   DATE10F.
      @181    PRDATE3   DATE10F.
      @191    PRDATE4   DATE10F.
      @201    PRDATE5   DATE10F.
      @211    PRDATE6   DATE10F.
      @221    DOB       DATE10F.
      @231    ZIP       $CHAR5.
;


