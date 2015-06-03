DATA UT97SPEC; 
INFILE EBSPEC LRECL = 83; 

LENGTH 
       SEQ_SID  7
       ZIP_S    $5
       PAY1_X   $2
       PAY2_X   $2
       PAY3_X   $2
       CHG1     6
       CHG2     6
       ADRG     3
       ADRGSEV  3
       ADATE    4
       DDATE    4
       DOB      4
;


LABEL 
      SEQ_SID ='I:HCUP SID record sequence number'
      ZIP_S   ='I:Patient zip code (synthetic)'
      PAY1_X  ='I:Primary exp. payer (from data source)'
      PAY2_X  ='I:Secondary exp. payer (from data source'
      PAY3_X  ='I:Tertiary exp. payer (from data source)'
      CHG1    ='I:Detailed charges 1 (from data source)'
      CHG2    ='I:Detailed charges 2 (from data source)'
      ADRG    ='I:All Patient Refined DRG'
      ADRGSEV ='I:All Patient Refined DRG severity level'
      ADATE   ='I:Admission date'
      DDATE   ='I:Discharge date'
      DOB     ='I:Date of birth'
;


FORMAT
       SEQ_SID   Z13.
       ADATE     DATE9.
       DDATE     DATE9.
       DOB       DATE9.
;


INPUT 
      @1      SEQ_SID   13.
      @14     ZIP_S     $CHAR5.
      @19     PAY1_X    $CHAR2.
      @21     PAY2_X    $CHAR2.
      @23     PAY3_X    $CHAR2.
      @25     CHG1      N12P2F.
      @37     CHG2      N12P2F.
      @49     ADRG      N3PF.
      @52     ADRGSEV   N2PF.
      @54     ADATE     DATE10F.
      @64     DDATE     DATE10F.
      @74     DOB       DATE10F.
;


