DATA MD97ASTS; 
INFILE EBASTS LRECL = 165; 

LENGTH 
       SEQ_ASD  7
       PROCESS  6
       YEAR     3
       DSHOSPID $13
       MRN_S    $17
       PSTCO    4
       PAY1_X   $2
       PAY2_X   $2
       PAYER1_X $2
       PAYER2_X $2
       CHG1     6
       CHG2     6
       CHG3     6
       CHG4     6
       CHG5     6
       CHG6     6
       CHG7     6
       CHG8     6
;


LABEL 
      SEQ_ASD ='S:HCUP AS record sequence number'
      PROCESS ='S:HCUP-3 discharge processing ID number'
      YEAR    ='Calendar year'
      DSHOSPID='S:Data source hospital ID number'
      MRN_S   ='S:Medical record number (synthetic)'
      PSTCO   ='S:Patient state/county FIPS code'
      PAY1_X  ='S:Primary exp. payer (from data source)'
      PAY2_X  ='S:Secondary exp. payer (from data source'
      PAYER1_X='S:Primary exp. payer (plan IDs)'
      PAYER2_X='S:Secondary exp. payer (plan IDs)'
      CHG1    ='S:Detailed charges 1 (from data source)'
      CHG2    ='S:Detailed charges 2 (from data source)'
      CHG3    ='S:Detailed charges 3 (from data source)'
      CHG4    ='S:Detailed charges 4 (from data source)'
      CHG5    ='S:Detailed charges 5 (from data source)'
      CHG6    ='S:Detailed charges 6 (from data source)'
      CHG7    ='S:Detailed charges 7 (from data source)'
      CHG8    ='S:Detailed charges 8 (from data source)'
;


FORMAT
       SEQ_ASD   Z13.
;


INPUT 
      @1      SEQ_ASD   13.
      @14     PROCESS   11.
      @25     YEAR      N2PF.
      @27     DSHOSPID  $CHAR13.
      @40     MRN_S     $CHAR17.
      @57     PSTCO     N5PF.
      @62     PAY1_X    $CHAR2.
      @64     PAY2_X    $CHAR2.
      @66     PAYER1_X  $CHAR2.
      @68     PAYER2_X  $CHAR2.
      @70     CHG1      N12P2F.
      @82     CHG2      N12P2F.
      @94     CHG3      N12P2F.
      @106    CHG4      N12P2F.
      @118    CHG5      N12P2F.
      @130    CHG6      N12P2F.
      @142    CHG7      N12P2F.
      @154    CHG8      N12P2F.
;


