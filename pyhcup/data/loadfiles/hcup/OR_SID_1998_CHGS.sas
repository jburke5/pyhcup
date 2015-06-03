DATA OR_SIDC_1998_CHGS; 
INFILE EBCHGS LRECL = 134; 

LENGTH 
       KEY                 8
       CHG1                6
       CHG2                6
       CHG3                6
       CHG4                6
       CHG5                6
       CHG6                6
       CHG7                6
       CHG8                6
       CHG9                6
       CHG10               6
;


LABEL 
      KEY                 ='HCUP record identifier'
      CHG1                ='Detailed charges 1 (as received from source)'
      CHG2                ='Detailed charges 2 (as received from source)'
      CHG3                ='Detailed charges 3 (as received from source)'
      CHG4                ='Detailed charges 4 (as received from source)'
      CHG5                ='Detailed charges 5 (as received from source)'
      CHG6                ='Detailed charges 6 (as received from source)'
      CHG7                ='Detailed charges 7 (as received from source)'
      CHG8                ='Detailed charges 8 (as received from source)'
      CHG9                ='Detailed charges 9 (as received from source)'
      CHG10               ='Detailed charges 10 (as received from source)'
;


FORMAT
       KEY                 Z14.
;


INPUT 
      @1      KEY                 14.
      @15     CHG1                N12P2F.
      @27     CHG2                N12P2F.
      @39     CHG3                N12P2F.
      @51     CHG4                N12P2F.
      @63     CHG5                N12P2F.
      @75     CHG6                N12P2F.
      @87     CHG7                N12P2F.
      @99     CHG8                N12P2F.
      @111    CHG9                N12P2F.
      @123    CHG10               N12P2F.
;


