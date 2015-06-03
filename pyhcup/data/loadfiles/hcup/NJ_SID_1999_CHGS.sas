DATA NJ_SIDC_1999_CHGS; 
INFILE EBCHGS LRECL = 574; 

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
       UNIT20              4
       UNIT21              4
       UNIT22              4
       UNIT23              4
       UNIT24              4
       UNIT25              4
       UNIT26              4
       UNIT27              4
       UNIT28              4
       UNIT29              4
       UNIT30              4
       UNIT31              4
       UNIT32              4
       UNIT33              4
       UNIT34              4
       UNIT35              4
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
      UNIT20              ='Units of service 20 (as received from source)'
      UNIT21              ='Units of service 21 (as received from source)'
      UNIT22              ='Units of service 22 (as received from source)'
      UNIT23              ='Units of service 23 (as received from source)'
      UNIT24              ='Units of service 24 (as received from source)'
      UNIT25              ='Units of service 25 (as received from source)'
      UNIT26              ='Units of service 26 (as received from source)'
      UNIT27              ='Units of service 27 (as received from source)'
      UNIT28              ='Units of service 28 (as received from source)'
      UNIT29              ='Units of service 29 (as received from source)'
      UNIT30              ='Units of service 30 (as received from source)'
      UNIT31              ='Units of service 31 (as received from source)'
      UNIT32              ='Units of service 32 (as received from source)'
      UNIT33              ='Units of service 33 (as received from source)'
      UNIT34              ='Units of service 34 (as received from source)'
      UNIT35              ='Units of service 35 (as received from source)'
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
      @435    UNIT1               N4PF.
      @439    UNIT2               N4PF.
      @443    UNIT3               N4PF.
      @447    UNIT4               N4PF.
      @451    UNIT5               N4PF.
      @455    UNIT6               N4PF.
      @459    UNIT7               N4PF.
      @463    UNIT8               N4PF.
      @467    UNIT9               N4PF.
      @471    UNIT10              N4PF.
      @475    UNIT11              N4PF.
      @479    UNIT12              N4PF.
      @483    UNIT13              N4PF.
      @487    UNIT14              N4PF.
      @491    UNIT15              N4PF.
      @495    UNIT16              N4PF.
      @499    UNIT17              N4PF.
      @503    UNIT18              N4PF.
      @507    UNIT19              N4PF.
      @511    UNIT20              N4PF.
      @515    UNIT21              N4PF.
      @519    UNIT22              N4PF.
      @523    UNIT23              N4PF.
      @527    UNIT24              N4PF.
      @531    UNIT25              N4PF.
      @535    UNIT26              N4PF.
      @539    UNIT27              N4PF.
      @543    UNIT28              N4PF.
      @547    UNIT29              N4PF.
      @551    UNIT30              N4PF.
      @555    UNIT31              N4PF.
      @559    UNIT32              N4PF.
      @563    UNIT33              N4PF.
      @567    UNIT34              N4PF.
      @571    UNIT35              N4PF.
;


