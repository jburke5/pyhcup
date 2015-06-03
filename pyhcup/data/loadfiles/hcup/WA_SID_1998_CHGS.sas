DATA WA_SIDC_1998_CHGS; 
INFILE EBCHGS LRECL = 814; 

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
       REVCD1              $4
       REVCD2              $4
       REVCD3              $4
       REVCD4              $4
       REVCD5              $4
       REVCD6              $4
       REVCD7              $4
       REVCD8              $4
       REVCD9              $4
       REVCD10             $4
       REVCD11             $4
       REVCD12             $4
       REVCD13             $4
       REVCD14             $4
       REVCD15             $4
       REVCD16             $4
       REVCD17             $4
       REVCD18             $4
       REVCD19             $4
       REVCD20             $4
       REVCD21             $4
       REVCD22             $4
       REVCD23             $4
       REVCD24             $4
       REVCD25             $4
       REVCD26             $4
       REVCD27             $4
       REVCD28             $4
       REVCD29             $4
       REVCD30             $4
       REVCD31             $4
       REVCD32             $4
       REVCD33             $4
       REVCD34             $4
       REVCD35             $4
       REVCD36             $4
       REVCD37             $4
       REVCD38             $4
       REVCD39             $4
       REVCD40             $4
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
       UNIT36              4
       UNIT37              4
       UNIT38              4
       UNIT39              4
       UNIT40              4
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
      REVCD1              ='Revenue code 1 (as received from source)'
      REVCD2              ='Revenue code 2 (as received from source)'
      REVCD3              ='Revenue code 3 (as received from source)'
      REVCD4              ='Revenue code 4 (as received from source)'
      REVCD5              ='Revenue code 5 (as received from source)'
      REVCD6              ='Revenue code 6 (as received from source)'
      REVCD7              ='Revenue code 7 (as received from source)'
      REVCD8              ='Revenue code 8 (as received from source)'
      REVCD9              ='Revenue code 9 (as received from source)'
      REVCD10             ='Revenue code 10 (as received from source)'
      REVCD11             ='Revenue code 11 (as received from source)'
      REVCD12             ='Revenue code 12 (as received from source)'
      REVCD13             ='Revenue code 13 (as received from source)'
      REVCD14             ='Revenue code 14 (as received from source)'
      REVCD15             ='Revenue code 15 (as received from source)'
      REVCD16             ='Revenue code 16 (as received from source)'
      REVCD17             ='Revenue code 17 (as received from source)'
      REVCD18             ='Revenue code 18 (as received from source)'
      REVCD19             ='Revenue code 19 (as received from source)'
      REVCD20             ='Revenue code 20 (as received from source)'
      REVCD21             ='Revenue code 21 (as received from source)'
      REVCD22             ='Revenue code 22 (as received from source)'
      REVCD23             ='Revenue code 23 (as received from source)'
      REVCD24             ='Revenue code 24 (as received from source)'
      REVCD25             ='Revenue code 25 (as received from source)'
      REVCD26             ='Revenue code 26 (as received from source)'
      REVCD27             ='Revenue code 27 (as received from source)'
      REVCD28             ='Revenue code 28 (as received from source)'
      REVCD29             ='Revenue code 29 (as received from source)'
      REVCD30             ='Revenue code 30 (as received from source)'
      REVCD31             ='Revenue code 31 (as received from source)'
      REVCD32             ='Revenue code 32 (as received from source)'
      REVCD33             ='Revenue code 33 (as received from source)'
      REVCD34             ='Revenue code 34 (as received from source)'
      REVCD35             ='Revenue code 35 (as received from source)'
      REVCD36             ='Revenue code 36 (as received from source)'
      REVCD37             ='Revenue code 37 (as received from source)'
      REVCD38             ='Revenue code 38 (as received from source)'
      REVCD39             ='Revenue code 39 (as received from source)'
      REVCD40             ='Revenue code 40 (as received from source)'
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
      UNIT36              ='Units of service 36 (as received from source)'
      UNIT37              ='Units of service 37 (as received from source)'
      UNIT38              ='Units of service 38 (as received from source)'
      UNIT39              ='Units of service 39 (as received from source)'
      UNIT40              ='Units of service 40 (as received from source)'
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
      @495    REVCD1              $CHAR4.
      @499    REVCD2              $CHAR4.
      @503    REVCD3              $CHAR4.
      @507    REVCD4              $CHAR4.
      @511    REVCD5              $CHAR4.
      @515    REVCD6              $CHAR4.
      @519    REVCD7              $CHAR4.
      @523    REVCD8              $CHAR4.
      @527    REVCD9              $CHAR4.
      @531    REVCD10             $CHAR4.
      @535    REVCD11             $CHAR4.
      @539    REVCD12             $CHAR4.
      @543    REVCD13             $CHAR4.
      @547    REVCD14             $CHAR4.
      @551    REVCD15             $CHAR4.
      @555    REVCD16             $CHAR4.
      @559    REVCD17             $CHAR4.
      @563    REVCD18             $CHAR4.
      @567    REVCD19             $CHAR4.
      @571    REVCD20             $CHAR4.
      @575    REVCD21             $CHAR4.
      @579    REVCD22             $CHAR4.
      @583    REVCD23             $CHAR4.
      @587    REVCD24             $CHAR4.
      @591    REVCD25             $CHAR4.
      @595    REVCD26             $CHAR4.
      @599    REVCD27             $CHAR4.
      @603    REVCD28             $CHAR4.
      @607    REVCD29             $CHAR4.
      @611    REVCD30             $CHAR4.
      @615    REVCD31             $CHAR4.
      @619    REVCD32             $CHAR4.
      @623    REVCD33             $CHAR4.
      @627    REVCD34             $CHAR4.
      @631    REVCD35             $CHAR4.
      @635    REVCD36             $CHAR4.
      @639    REVCD37             $CHAR4.
      @643    REVCD38             $CHAR4.
      @647    REVCD39             $CHAR4.
      @651    REVCD40             $CHAR4.
      @655    UNIT1               N4PF.
      @659    UNIT2               N4PF.
      @663    UNIT3               N4PF.
      @667    UNIT4               N4PF.
      @671    UNIT5               N4PF.
      @675    UNIT6               N4PF.
      @679    UNIT7               N4PF.
      @683    UNIT8               N4PF.
      @687    UNIT9               N4PF.
      @691    UNIT10              N4PF.
      @695    UNIT11              N4PF.
      @699    UNIT12              N4PF.
      @703    UNIT13              N4PF.
      @707    UNIT14              N4PF.
      @711    UNIT15              N4PF.
      @715    UNIT16              N4PF.
      @719    UNIT17              N4PF.
      @723    UNIT18              N4PF.
      @727    UNIT19              N4PF.
      @731    UNIT20              N4PF.
      @735    UNIT21              N4PF.
      @739    UNIT22              N4PF.
      @743    UNIT23              N4PF.
      @747    UNIT24              N4PF.
      @751    UNIT25              N4PF.
      @755    UNIT26              N4PF.
      @759    UNIT27              N4PF.
      @763    UNIT28              N4PF.
      @767    UNIT29              N4PF.
      @771    UNIT30              N4PF.
      @775    UNIT31              N4PF.
      @779    UNIT32              N4PF.
      @783    UNIT33              N4PF.
      @787    UNIT34              N4PF.
      @791    UNIT35              N4PF.
      @795    UNIT36              N4PF.
      @799    UNIT37              N4PF.
      @803    UNIT38              N4PF.
      @807    UNIT39              N4PF.
      @811    UNIT40              N4PF.
;


