DATA WI96SPEC; 
INFILE EBSPEC LRECL = 75; 

LENGTH 
       SEQ_SID  7
       MRN_S    $17
       PAY1_X   $5
       PAY2_X   $5
       ADATE    4
       DDATE    4
       DOB      4
       ZIP      $5
;


LABEL 
      SEQ_SID ='I:HCUP SID record sequence number'
      MRN_S   ='I:Medical record number (synthetic)'
      PAY1_X  ='I:Primary exp. payer (from data source)'
      PAY2_X  ='I:Secondary exp. payer (from data source'
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
      @14     MRN_S     $CHAR17.
      @31     PAY1_X    $CHAR5.
      @36     PAY2_X    $CHAR5.
      @41     ADATE     DATE10F.
      @51     DDATE     DATE10F.
      @61     DOB       DATE10F.
      @71     ZIP       $CHAR5.
;


