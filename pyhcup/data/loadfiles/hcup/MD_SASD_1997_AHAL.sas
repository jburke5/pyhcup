DATA MD97AAHA; 
INFILE EBAAHA LRECL = 40; 

LENGTH 
       DSHOSPID $13
       HOSPSTCO 5
       HOSPID   4
       YEAR     3
       HOSPST   $2
       IDNUMBER $6
       AHAID    $7
;


LABEL 
      DSHOSPID='S:Data source hospital ID number'
      HOSPSTCO='Hospital modified FIPS state/county code'
      HOSPID  ='HCUP hospital ID number (SSHHH)'
      YEAR    ='Calendar year'
      HOSPST  ='Hospital state postal code'
      IDNUMBER='HCUP AHA ID number without the leading 6'
      AHAID   ='AHA ID number with the leading 6'
;


FORMAT
       HOSPSTCO  Z5.
       HOSPID    Z5.
;


INPUT 
      @1      DSHOSPID  $CHAR13.
      @14     HOSPSTCO  N5PF.
      @19     HOSPID    N5PF.
      @24     YEAR      N2PF.
      @26     HOSPST    $CHAR2.
      @28     IDNUMBER  $CHAR6.
      @34     AHAID     $CHAR7.
;


