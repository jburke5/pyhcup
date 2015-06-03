DATA CO97ASTS; 
INFILE EBASTS LRECL = 158; 

LENGTH 
       SEQ_ASD  7
       PROCESS  6
       YEAR     3
       DSHOSPID $13
       MRN_S    $17
       PSTCO    4
       PAY1_X   $2
       CHG1     6
       CHG2     6
       CHG3     6
       CHG4     6
       CHG5     6
       ZIP      $5
       ADATE    4
       DDATE    4
       PRDATE1  4
;


LABEL 
      SEQ_ASD ='S:HCUP AS record sequence number'
      PROCESS ='S:HCUP-3 discharge processing ID number'
      YEAR    ='Calendar year'
      DSHOSPID='S:Data source hospital ID number'
      MRN_S   ='S:Medical record number (synthetic)'
      PSTCO   ='S:Patient state/county FIPS code'
      PAY1_X  ='S:Primary exp. payer (from data source)'
      CHG1    ='S:Detailed charges 1 (from data source)'
      CHG2    ='S:Detailed charges 2 (from data source)'
      CHG3    ='S:Detailed charges 3 (from data source)'
      CHG4    ='S:Detailed charges 4 (from data source)'
      CHG5    ='S:Detailed charges 5 (from data source)'
      ZIP     ='S:Patient zip code'
      ADATE   ='S:Admission date'
      DDATE   ='S:Discharge date'
      PRDATE1 ='S:Date of principal procedure'
;


FORMAT
       SEQ_ASD   Z13.
       ADATE     DATE9.
       DDATE     DATE9.
       PRDATE1   DATE9.
;


INPUT 
      @1      SEQ_ASD   13.
      @14     PROCESS   11.
      @25     YEAR      N2PF.
      @27     DSHOSPID  $CHAR13.
      @40     MRN_S     $CHAR17.
      @57     PSTCO     N5PF.
      @62     PAY1_X    $CHAR2.
      @64     CHG1      N12P2F.
      @76     CHG2      N12P2F.
      @88     CHG3      N12P2F.
      @100    CHG4      N12P2F.
      @112    CHG5      N12P2F.
      @124    ZIP       $CHAR5.
      @129    ADATE     DATE10F.
      @139    DDATE     DATE10F.
      @149    PRDATE1   DATE10F.
;


