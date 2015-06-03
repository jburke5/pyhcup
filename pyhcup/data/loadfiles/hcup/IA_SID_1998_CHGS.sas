DATA IA_SIDC_1998_CHGS; 
INFILE EBCHGS LRECL = 290; 

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
       CHG11               6
       CHG12               6
       CHG13               6
       CHG14               6
       CHG15               6
       CHG16               6
       CHG17               6
       CHG18               6
       CHG19               6
       CHG20               6
       CHG21               6
       CHG22               6
       CHG23               6
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
      CHG11               ='Detailed charges 11 (as received from source)'
      CHG12               ='Detailed charges 12 (as received from source)'
      CHG13               ='Detailed charges 13 (as received from source)'
      CHG14               ='Detailed charges 14 (as received from source)'
      CHG15               ='Detailed charges 15 (as received from source)'
      CHG16               ='Detailed charges 16 (as received from source)'
      CHG17               ='Detailed charges 17 (as received from source)'
      CHG18               ='Detailed charges 18 (as received from source)'
      CHG19               ='Detailed charges 19 (as received from source)'
      CHG20               ='Detailed charges 20 (as received from source)'
      CHG21               ='Detailed charges 21 (as received from source)'
      CHG22               ='Detailed charges 22 (as received from source)'
      CHG23               ='Detailed charges 23 (as received from source)'
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
      @135    CHG11               N12P2F.
      @147    CHG12               N12P2F.
      @159    CHG13               N12P2F.
      @171    CHG14               N12P2F.
      @183    CHG15               N12P2F.
      @195    CHG16               N12P2F.
      @207    CHG17               N12P2F.
      @219    CHG18               N12P2F.
      @231    CHG19               N12P2F.
      @243    CHG20               N12P2F.
      @255    CHG21               N12P2F.
      @267    CHG22               N12P2F.
      @279    CHG23               N12P2F.
;


