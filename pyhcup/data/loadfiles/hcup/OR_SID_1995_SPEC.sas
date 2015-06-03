DATA OR95SPEC; 
INFILE EBSPEC LRECL = 279; 

LENGTH 
       SEQ_SID  7
       PAY1_X   $17
       PAY2_X   $17
       PAY3_X   $17
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
       ADATE     DATE7.
       DDATE     DATE7.
       PRDATE1   DATE7.
       PRDATE2   DATE7.
       PRDATE3   DATE7.
       PRDATE4   DATE7.
       PRDATE5   DATE7.
       PRDATE6   DATE7.
       DOB       DATE9.
;


INPUT 
      @1      SEQ_SID   13.
      @14     PAY1_X    $CHAR17.
      @31     PAY2_X    $CHAR17.
      @48     PAY3_X    $CHAR17.
      @65     CHG1      N12P2F.
      @77     CHG2      N12P2F.
      @89     CHG3      N12P2F.
      @101    CHG4      N12P2F.
      @113    CHG5      N12P2F.
      @125    CHG6      N12P2F.
      @137    CHG7      N12P2F.
      @149    CHG8      N12P2F.
      @161    CHG9      N12P2F.
      @173    CHG10     N12P2F.
      @185    ADATE     DATE10F.
      @195    DDATE     DATE10F.
      @205    PRDATE1   DATE10F.
      @215    PRDATE2   DATE10F.
      @225    PRDATE3   DATE10F.
      @235    PRDATE4   DATE10F.
      @245    PRDATE5   DATE10F.
      @255    PRDATE6   DATE10F.
      @265    DOB       DATE10F.
      @275    ZIP       $CHAR5.
;


