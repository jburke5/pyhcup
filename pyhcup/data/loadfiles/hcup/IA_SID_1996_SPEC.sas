DATA IA96SPEC; 
INFILE EBSPEC LRECL = 144; 

LENGTH 
       SEQ_SID  7
       MRN_S    $17
       PSTCO    4
       PAY1_X   $2
       CHG1     6
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
      MRN_S   ='I:Medical record number (synthetic)'
      PSTCO   ='I:Patient state/county FIPS code'
      PAY1_X  ='I:Primary exp. payer (from data source)'
      CHG1    ='I:Detailed charges 1 (from data source)'
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
      @14     MRN_S     $CHAR17.
      @31     PSTCO     N5PF.
      @36     PAY1_X    $CHAR2.
      @38     CHG1      N12P2F.
      @50     ADATE     DATE10F.
      @60     DDATE     DATE10F.
      @70     PRDATE1   DATE10F.
      @80     PRDATE2   DATE10F.
      @90     PRDATE3   DATE10F.
      @100    PRDATE4   DATE10F.
      @110    PRDATE5   DATE10F.
      @120    PRDATE6   DATE10F.
      @130    DOB       DATE10F.
      @140    ZIP       $CHAR5.
;


