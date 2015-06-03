DATA SC_SIDC_1998_CHGS; 
INFILE EBCHGS LRECL = 1026; 

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
       CHG24               6
       CHG25               6
       CHG26               6
       CHG27               6
       CHG28               6
       CHG29               6
       CHG30               6
       CHG31               6
       CHG32               6
       CHG33               6
       CHG34               6
       CHG35               6
       CHG36               6
       CHG37               6
       CHG38               6
       CHG39               6
       CHG40               6
       CHG41               6
       CHG42               6
       CHG43               6
       CHG44               6
       CHG45               6
       CHG46               6
       CHG47               6
       CHG48               6
       CHG49               6
       CHG50               6
       CHG51               6
       CHG52               6
       CHG53               6
       CHG54               6
       CHG55               6
       CHG56               6
       CHG57               6
       CHG58               6
       CHG59               6
       CHG60               6
       CHG61               6
       CHG62               6
       CHG63               6
       CHG64               6
       CHG65               6
       CHG66               6
       CHG67               6
       CHG68               6
       CHG69               6
       CHG70               6
       CHG71               6
       CHG72               6
       CHG73               6
       CHG74               6
       CHG75               6
       CHG76               6
       CHG77               6
       CHG78               6
       UNIT1               4
       UNIT2               4
       UNIT3               4
       UNIT4               4
       UNIT5               4
       UNIT6               4
       UNIT7               4
       UNIT8               4
       UNIT9               4
       UNIT10              4
       UNIT11              4
       UNIT12              4
       UNIT13              4
       UNIT14              4
       UNIT15              4
       UNIT16              4
       UNIT17              4
       UNIT18              4
       UNIT19              4
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
      CHG24               ='Detailed charges 24 (as received from source)'
      CHG25               ='Detailed charges 25 (as received from source)'
      CHG26               ='Detailed charges 26 (as received from source)'
      CHG27               ='Detailed charges 27 (as received from source)'
      CHG28               ='Detailed charges 28 (as received from source)'
      CHG29               ='Detailed charges 29 (as received from source)'
      CHG30               ='Detailed charges 30 (as received from source)'
      CHG31               ='Detailed charges 31 (as received from source)'
      CHG32               ='Detailed charges 32 (as received from source)'
      CHG33               ='Detailed charges 33 (as received from source)'
      CHG34               ='Detailed charges 34 (as received from source)'
      CHG35               ='Detailed charges 35 (as received from source)'
      CHG36               ='Detailed charges 36 (as received from source)'
      CHG37               ='Detailed charges 37 (as received from source)'
      CHG38               ='Detailed charges 38 (as received from source)'
      CHG39               ='Detailed charges 39 (as received from source)'
      CHG40               ='Detailed charges 40 (as received from source)'
      CHG41               ='Detailed charges 41 (as received from source)'
      CHG42               ='Detailed charges 42 (as received from source)'
      CHG43               ='Detailed charges 43 (as received from source)'
      CHG44               ='Detailed charges 44 (as received from source)'
      CHG45               ='Detailed charges 45 (as received from source)'
      CHG46               ='Detailed charges 46 (as received from source)'
      CHG47               ='Detailed charges 47 (as received from source)'
      CHG48               ='Detailed charges 48 (as received from source)'
      CHG49               ='Detailed charges 49 (as received from source)'
      CHG50               ='Detailed charges 50 (as received from source)'
      CHG51               ='Detailed charges 51 (as received from source)'
      CHG52               ='Detailed charges 52 (as received from source)'
      CHG53               ='Detailed charges 53 (as received from source)'
      CHG54               ='Detailed charges 54 (as received from source)'
      CHG55               ='Detailed charges 55 (as received from source)'
      CHG56               ='Detailed charges 56 (as received from source)'
      CHG57               ='Detailed charges 57 (as received from source)'
      CHG58               ='Detailed charges 58 (as received from source)'
      CHG59               ='Detailed charges 59 (as received from source)'
      CHG60               ='Detailed charges 60 (as received from source)'
      CHG61               ='Detailed charges 61 (as received from source)'
      CHG62               ='Detailed charges 62 (as received from source)'
      CHG63               ='Detailed charges 63 (as received from source)'
      CHG64               ='Detailed charges 64 (as received from source)'
      CHG65               ='Detailed charges 65 (as received from source)'
      CHG66               ='Detailed charges 66 (as received from source)'
      CHG67               ='Detailed charges 67 (as received from source)'
      CHG68               ='Detailed charges 68 (as received from source)'
      CHG69               ='Detailed charges 69 (as received from source)'
      CHG70               ='Detailed charges 70 (as received from source)'
      CHG71               ='Detailed charges 71 (as received from source)'
      CHG72               ='Detailed charges 72 (as received from source)'
      CHG73               ='Detailed charges 73 (as received from source)'
      CHG74               ='Detailed charges 74 (as received from source)'
      CHG75               ='Detailed charges 75 (as received from source)'
      CHG76               ='Detailed charges 76 (as received from source)'
      CHG77               ='Detailed charges 77 (as received from source)'
      CHG78               ='Detailed charges 78 (as received from source)'
      UNIT1               ='Units of service 1 (as received from source)'
      UNIT2               ='Units of service 2 (as received from source)'
      UNIT3               ='Units of service 3 (as received from source)'
      UNIT4               ='Units of service 4 (as received from source)'
      UNIT5               ='Units of service 5 (as received from source)'
      UNIT6               ='Units of service 6 (as received from source)'
      UNIT7               ='Units of service 7 (as received from source)'
      UNIT8               ='Units of service 8 (as received from source)'
      UNIT9               ='Units of service 9 (as received from source)'
      UNIT10              ='Units of service 10 (as received from source)'
      UNIT11              ='Units of service 11 (as received from source)'
      UNIT12              ='Units of service 12 (as received from source)'
      UNIT13              ='Units of service 13 (as received from source)'
      UNIT14              ='Units of service 14 (as received from source)'
      UNIT15              ='Units of service 15 (as received from source)'
      UNIT16              ='Units of service 16 (as received from source)'
      UNIT17              ='Units of service 17 (as received from source)'
      UNIT18              ='Units of service 18 (as received from source)'
      UNIT19              ='Units of service 19 (as received from source)'
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
      @291    CHG24               N12P2F.
      @303    CHG25               N12P2F.
      @315    CHG26               N12P2F.
      @327    CHG27               N12P2F.
      @339    CHG28               N12P2F.
      @351    CHG29               N12P2F.
      @363    CHG30               N12P2F.
      @375    CHG31               N12P2F.
      @387    CHG32               N12P2F.
      @399    CHG33               N12P2F.
      @411    CHG34               N12P2F.
      @423    CHG35               N12P2F.
      @435    CHG36               N12P2F.
      @447    CHG37               N12P2F.
      @459    CHG38               N12P2F.
      @471    CHG39               N12P2F.
      @483    CHG40               N12P2F.
      @495    CHG41               N12P2F.
      @507    CHG42               N12P2F.
      @519    CHG43               N12P2F.
      @531    CHG44               N12P2F.
      @543    CHG45               N12P2F.
      @555    CHG46               N12P2F.
      @567    CHG47               N12P2F.
      @579    CHG48               N12P2F.
      @591    CHG49               N12P2F.
      @603    CHG50               N12P2F.
      @615    CHG51               N12P2F.
      @627    CHG52               N12P2F.
      @639    CHG53               N12P2F.
      @651    CHG54               N12P2F.
      @663    CHG55               N12P2F.
      @675    CHG56               N12P2F.
      @687    CHG57               N12P2F.
      @699    CHG58               N12P2F.
      @711    CHG59               N12P2F.
      @723    CHG60               N12P2F.
      @735    CHG61               N12P2F.
      @747    CHG62               N12P2F.
      @759    CHG63               N12P2F.
      @771    CHG64               N12P2F.
      @783    CHG65               N12P2F.
      @795    CHG66               N12P2F.
      @807    CHG67               N12P2F.
      @819    CHG68               N12P2F.
      @831    CHG69               N12P2F.
      @843    CHG70               N12P2F.
      @855    CHG71               N12P2F.
      @867    CHG72               N12P2F.
      @879    CHG73               N12P2F.
      @891    CHG74               N12P2F.
      @903    CHG75               N12P2F.
      @915    CHG76               N12P2F.
      @927    CHG77               N12P2F.
      @939    CHG78               N12P2F.
      @951    UNIT1               N4PF.
      @955    UNIT2               N4PF.
      @959    UNIT3               N4PF.
      @963    UNIT4               N4PF.
      @967    UNIT5               N4PF.
      @971    UNIT6               N4PF.
      @975    UNIT7               N4PF.
      @979    UNIT8               N4PF.
      @983    UNIT9               N4PF.
      @987    UNIT10              N4PF.
      @991    UNIT11              N4PF.
      @995    UNIT12              N4PF.
      @999    UNIT13              N4PF.
      @1003   UNIT14              N4PF.
      @1007   UNIT15              N4PF.
      @1011   UNIT16              N4PF.
      @1015   UNIT17              N4PF.
      @1019   UNIT18              N4PF.
      @1023   UNIT19              N4PF.
;


