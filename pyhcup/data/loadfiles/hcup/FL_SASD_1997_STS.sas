DATA FL97ASTS; 
INFILE EBASTS LRECL = 168; 

LENGTH 
       SEQ_ASD  7
       YEAR     3
       DSHOSPID $13
       PROFEE   3
       PAY1_X   $1
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
       ZIP      $5
;


LABEL 
      SEQ_ASD ='S:HCUP AS record sequence number'
      YEAR    ='Calendar year'
      DSHOSPID='S:Data source hospital ID number'
      PROFEE  ='S:Indicates Professional Fees in TOTCHG'
      PAY1_X  ='S:Primary exp. payer (from data source)'
      CHG1    ='S:Detailed charges 1 (from data source)'
      CHG2    ='S:Detailed charges 2 (from data source)'
      CHG3    ='S:Detailed charges 3 (from data source)'
      CHG4    ='S:Detailed charges 4 (from data source)'
      CHG5    ='S:Detailed charges 5 (from data source)'
      CHG6    ='S:Detailed charges 6 (from data source)'
      CHG7    ='S:Detailed charges 7 (from data source)'
      CHG8    ='S:Detailed charges 8 (from data source)'
      CHG9    ='S:Detailed charges 9 (from data source)'
      CHG10   ='S:Detailed charges 10 (from data source)'
      CHG11   ='S:Detailed charges 11 (from data source)'
      ZIP     ='S:Patient zip code'
;


FORMAT
       SEQ_ASD   Z13.
;


INPUT 
      @1      SEQ_ASD   13.
      @14     YEAR      N2PF.
      @16     DSHOSPID  $CHAR13.
      @29     PROFEE    N2PF.
      @31     PAY1_X    $CHAR1.
      @32     CHG1      N12P2F.
      @44     CHG2      N12P2F.
      @56     CHG3      N12P2F.
      @68     CHG4      N12P2F.
      @80     CHG5      N12P2F.
      @92     CHG6      N12P2F.
      @104    CHG7      N12P2F.
      @116    CHG8      N12P2F.
      @128    CHG9      N12P2F.
      @140    CHG10     N12P2F.
      @152    CHG11     N12P2F.
      @164    ZIP       $CHAR5.
;


