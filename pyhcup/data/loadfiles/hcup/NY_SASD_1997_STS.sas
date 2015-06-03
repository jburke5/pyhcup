DATA NY97ASTS; 
INFILE EBASTS LRECL = 78; 

LENGTH 
       SEQ_ASD  7
       PROCESS  6
       YEAR     3
       DSHOSPID $13
       PSTCO    4
       PAY1_X   $2
       ORTIME   4
       ANESTH   3
       DOB      4
       ZIP      $5
       DDATE    4
;


LABEL 
      SEQ_ASD ='S:HCUP AS record sequence number'
      PROCESS ='S:HCUP-3 discharge processing ID number'
      YEAR    ='Calendar year'
      DSHOSPID='S:Data source hospital ID number'
      PSTCO   ='S:Patient state/county FIPS code'
      PAY1_X  ='S:Primary exp. payer (from data source)'
      ORTIME  ='S:Operating Room Time'
      ANESTH  ='S:Method of Anesthesia'
      DOB     ='S:Date of birth'
      ZIP     ='S:Patient zip code'
      DDATE   ='S:Discharge date'
;


FORMAT
       SEQ_ASD   Z13.
       DOB       DATE9.
       DDATE     DATE9.
;


INPUT 
      @1      SEQ_ASD   13.
      @14     PROCESS   11.
      @25     YEAR      N2PF.
      @27     DSHOSPID  $CHAR13.
      @40     PSTCO     N5PF.
      @45     PAY1_X    $CHAR2.
      @47     ORTIME    N4PF.
      @51     ANESTH    N3PF.
      @54     DOB       DATE10F.
      @64     ZIP       $CHAR5.
      @69     DDATE     DATE10F.
;


