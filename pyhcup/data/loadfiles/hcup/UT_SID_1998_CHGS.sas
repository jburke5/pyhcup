DATA UT_SIDC_1998_CHGS; 
INFILE EBCHGS LRECL = 38; 

LENGTH 
       KEY                 8
       CHG1                6
       CHG2                6
;


LABEL 
      KEY                 ='HCUP record identifier'
      CHG1                ='Detailed charges 1 (as received from source)'
      CHG2                ='Detailed charges 2 (as received from source)'
;


FORMAT
       KEY                 Z14.
;


INPUT 
      @1      KEY                 14.
      @15     CHG1                N12P2F.
      @27     CHG2                N12P2F.
;


