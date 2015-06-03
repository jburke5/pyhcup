DATA FL_SIDC_1999_AHAL; 
INFILE EBAHAL LRECL = 36; 

LENGTH 
       AHAID               $7
       DSHOSPID            $13
       HOSPID              4
       HOSPST              $2
       HOSPSTCO            4
       YEAR                3
;


LABEL 
      AHAID               ='AHA hospital identifier with the leading 6'
      DSHOSPID            ='Data source hospital identifier'
      HOSPID              ='HCUP hospital identifier (SSHHH)'
      HOSPST              ='Hospital state postal code'
      HOSPSTCO            ='Hospital modified FIPS state/county code'
      YEAR                ='Calendar year'
;


FORMAT
       HOSPID              Z5.
       HOSPSTCO            Z5.
;


INPUT 
      @1      AHAID               $CHAR7.
      @8      DSHOSPID            $CHAR13.
      @21     HOSPID              5.
      @26     HOSPST              $CHAR2.
      @28     HOSPSTCO            5.
      @33     YEAR                N4PF.
;


