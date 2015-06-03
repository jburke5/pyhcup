DATA UT97ASTS; 
INFILE EBASTS LRECL = 88; 

LENGTH 
       SEQ_ASD  7
       PROCESS  6
       YEAR     3
       DSHOSPID $13
       ZIP_S    $5
       PAY1_X   $2
       PAY2_X   $2
       DOB      4
       ADATE    4
       DDATE    4
       PRDATE1  4
;


LABEL 
      SEQ_ASD ='S:HCUP AS record sequence number'
      PROCESS ='S:HCUP-3 discharge processing ID number'
      YEAR    ='Calendar year'
      DSHOSPID='S:Data source hospital ID number'
      ZIP_S   ='S:Patient zip code (synthetic)'
      PAY1_X  ='S:Primary exp. payer (from data source)'
      PAY2_X  ='S:Secondary exp. payer (from data source'
      DOB     ='S:Date of birth'
      ADATE   ='S:Admission date'
      DDATE   ='S:Discharge date'
      PRDATE1 ='S:Date of principal procedure'
;


FORMAT
       SEQ_ASD   Z13.
       DOB       DATE9.
       ADATE     DATE9.
       DDATE     DATE9.
       PRDATE1   DATE9.
;


INPUT 
      @1      SEQ_ASD   13.
      @14     PROCESS   11.
      @25     YEAR      N2PF.
      @27     DSHOSPID  $CHAR13.
      @40     ZIP_S     $CHAR5.
      @45     PAY1_X    $CHAR2.
      @47     PAY2_X    $CHAR2.
      @49     DOB       DATE10F.
      @59     ADATE     DATE10F.
      @69     DDATE     DATE10F.
      @79     PRDATE1   DATE10F.
;


