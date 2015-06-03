DATA OR96AHAL; 
INFILE EBAHAL LRECL = 40; 

LENGTH 
       HOSPSTCO 5
       HOSPID   4
       DSHOSPID $13
       YEAR     3
       HOSPST   $2
       IDNUMBER $6
       AHAID    $7
;


LABEL 
      HOSPSTCO='Hospital modified FIPS state/county code'
      HOSPID  ='HCUP hospital ID number (SSHHH)'
      DSHOSPID='I:Data source hospital ID number'
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
      @1      HOSPSTCO  N5PF.
      @6      HOSPID    N5PF.
      @11     DSHOSPID  $CHAR13.
      @24     YEAR      N2PF.
      @26     HOSPST    $CHAR2.
      @28     IDNUMBER  $CHAR6.
      @34     AHAID     $CHAR7.
;


