/*******************************************************************            
*   ME_SID_2000_CHGS.SAS:                                                       
*      THE SAS CODE SHOWN BELOW WILL CONVERT THE ASCII                          
*      INPATIENT STAY CHGS FILE INTO SAS                                        
*******************************************************************/            
                                                                                
                                                                                
***********************************************;                                
*  Create SAS informats for missing values     ;                                
***********************************************;                                
PROC FORMAT;                                                                    
  INVALUE N2PF                                                                  
    '-9' = .                                                                    
    '-8' = .A                                                                   
    '-6' = .C                                                                   
    '-5' = .N                                                                   
    OTHER = (|2.|)                                                              
  ;                                                                             
  INVALUE N3PF                                                                  
    '-99' = .                                                                   
    '-88' = .A                                                                  
    '-66' = .C                                                                  
    OTHER = (|3.|)                                                              
  ;                                                                             
  INVALUE N4PF                                                                  
    '-999' = .                                                                  
    '-888' = .A                                                                 
    '-666' = .C                                                                 
    OTHER = (|4.|)                                                              
  ;                                                                             
  INVALUE N5PF                                                                  
    '-9999' = .                                                                 
    '-8888' = .A                                                                
    '-6666' = .C                                                                
    OTHER = (|5.|)                                                              
  ;                                                                             
  INVALUE N6PF                                                                  
    '-99999' = .                                                                
    '-88888' = .A                                                               
    '-66666' = .C                                                               
    OTHER = (|6.|)                                                              
  ;                                                                             
  INVALUE N6P2F                                                                 
    '-99.99' = .                                                                
    '-88.88' = .A                                                               
    '-66.66' = .C                                                               
    OTHER = (|6.2|)                                                             
  ;                                                                             
  INVALUE N7P2F                                                                 
    '-999.99' = .                                                               
    '-888.88' = .A                                                              
    '-666.66' = .C                                                              
    OTHER = (|7.2|)                                                             
  ;                                                                             
  INVALUE N8PF                                                                  
    '-9999999' = .                                                              
    '-8888888' = .A                                                             
    '-6666666' = .C                                                             
    OTHER = (|8.|)                                                              
  ;                                                                             
  INVALUE N10PF                                                                 
    '-999999999' = .                                                            
    '-888888888' = .A                                                           
    '-666666666' = .C                                                           
    OTHER = (|10.|)                                                             
  ;                                                                             
  INVALUE N10P4F                                                                
    '-9999.9999' = .                                                            
    '-8888.8888' = .A                                                           
    '-6666.6666' = .C                                                           
    OTHER = (|10.4|)                                                            
  ;                                                                             
  INVALUE DATE10F                                                               
    '-999999999' = .                                                            
    '-888888888' = .A                                                           
    '-666666666' = .C                                                           
    OTHER = (|MMDDYY10.|)                                                       
  ;                                                                             
  INVALUE N12P2F                                                                
    '-99999999.99' = .                                                          
    '-88888888.88' = .A                                                         
    '-66666666.66' = .C                                                         
    OTHER = (|12.2|)                                                            
  ;                                                                             
  INVALUE N15P2F                                                                
    '-99999999999.99' = .                                                       
    '-88888888888.88' = .A                                                      
    '-66666666666.66' = .C                                                      
    OTHER = (|15.2|)                                                            
  ;                                                                             
  RUN;                                                                          
                                                                                
                                                                                
*******************************;                                                
*  Data Step                  *;                                                
*******************************;                                                
DATA ME_SIDC_2000_CHGS;                                                         
INFILE 'ME_SIDC_2000_CHGS.ASC' LRECL = 566;                                     
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  KEY                LENGTH=8                                                   
  LABEL="HCUP record identifier"                                   FORMAT=Z14.  
  CHG1               LENGTH=6                                                   
  LABEL="Detailed charges 1 (as received from source)"                          
  CHG2               LENGTH=6                                                   
  LABEL="Detailed charges 2 (as received from source)"                          
  CHG3               LENGTH=6                                                   
  LABEL="Detailed charges 3 (as received from source)"                          
  CHG4               LENGTH=6                                                   
  LABEL="Detailed charges 4 (as received from source)"                          
  CHG5               LENGTH=6                                                   
  LABEL="Detailed charges 5 (as received from source)"                          
  CHG6               LENGTH=6                                                   
  LABEL="Detailed charges 6 (as received from source)"                          
  CHG7               LENGTH=6                                                   
  LABEL="Detailed charges 7 (as received from source)"                          
  CHG8               LENGTH=6                                                   
  LABEL="Detailed charges 8 (as received from source)"                          
  CHG9               LENGTH=6                                                   
  LABEL="Detailed charges 9 (as received from source)"                          
  CHG10              LENGTH=6                                                   
  LABEL="Detailed charges 10 (as received from source)"                         
  CHG11              LENGTH=6                                                   
  LABEL="Detailed charges 11 (as received from source)"                         
  CHG12              LENGTH=6                                                   
  LABEL="Detailed charges 12 (as received from source)"                         
  CHG13              LENGTH=6                                                   
  LABEL="Detailed charges 13 (as received from source)"                         
  CHG14              LENGTH=6                                                   
  LABEL="Detailed charges 14 (as received from source)"                         
  CHG15              LENGTH=6                                                   
  LABEL="Detailed charges 15 (as received from source)"                         
  CHG16              LENGTH=6                                                   
  LABEL="Detailed charges 16 (as received from source)"                         
  CHG17              LENGTH=6                                                   
  LABEL="Detailed charges 17 (as received from source)"                         
  CHG18              LENGTH=6                                                   
  LABEL="Detailed charges 18 (as received from source)"                         
  CHG19              LENGTH=6                                                   
  LABEL="Detailed charges 19 (as received from source)"                         
  CHG20              LENGTH=6                                                   
  LABEL="Detailed charges 20 (as received from source)"                         
  CHG21              LENGTH=6                                                   
  LABEL="Detailed charges 21 (as received from source)"                         
  CHG22              LENGTH=6                                                   
  LABEL="Detailed charges 22 (as received from source)"                         
  CHG23              LENGTH=6                                                   
  LABEL="Detailed charges 23 (as received from source)"                         
  CHG24              LENGTH=6                                                   
  LABEL="Detailed charges 24 (as received from source)"                         
  CHG25              LENGTH=6                                                   
  LABEL="Detailed charges 25 (as received from source)"                         
  CHG26              LENGTH=6                                                   
  LABEL="Detailed charges 26 (as received from source)"                         
  CHG27              LENGTH=6                                                   
  LABEL="Detailed charges 27 (as received from source)"                         
  CHG28              LENGTH=6                                                   
  LABEL="Detailed charges 28 (as received from source)"                         
  CHG29              LENGTH=6                                                   
  LABEL="Detailed charges 29 (as received from source)"                         
  CHG30              LENGTH=6                                                   
  LABEL="Detailed charges 30 (as received from source)"                         
  CHG31              LENGTH=6                                                   
  LABEL="Detailed charges 31 (as received from source)"                         
  CHG32              LENGTH=6                                                   
  LABEL="Detailed charges 32 (as received from source)"                         
  CHG33              LENGTH=6                                                   
  LABEL="Detailed charges 33 (as received from source)"                         
  CHG34              LENGTH=6                                                   
  LABEL="Detailed charges 34 (as received from source)"                         
  REVCD1             LENGTH=$4                                                  
  LABEL="Revenue code 1 (as received from source)"                              
  REVCD2             LENGTH=$4                                                  
  LABEL="Revenue code 2 (as received from source)"                              
  REVCD3             LENGTH=$4                                                  
  LABEL="Revenue code 3 (as received from source)"                              
  REVCD4             LENGTH=$4                                                  
  LABEL="Revenue code 4 (as received from source)"                              
  REVCD5             LENGTH=$4                                                  
  LABEL="Revenue code 5 (as received from source)"                              
  REVCD6             LENGTH=$4                                                  
  LABEL="Revenue code 6 (as received from source)"                              
  REVCD7             LENGTH=$4                                                  
  LABEL="Revenue code 7 (as received from source)"                              
  REVCD8             LENGTH=$4                                                  
  LABEL="Revenue code 8 (as received from source)"                              
  REVCD9             LENGTH=$4                                                  
  LABEL="Revenue code 9 (as received from source)"                              
  REVCD10            LENGTH=$4                                                  
  LABEL="Revenue code 10 (as received from source)"                             
  REVCD11            LENGTH=$4                                                  
  LABEL="Revenue code 11 (as received from source)"                             
  REVCD12            LENGTH=$4                                                  
  LABEL="Revenue code 12 (as received from source)"                             
  REVCD13            LENGTH=$4                                                  
  LABEL="Revenue code 13 (as received from source)"                             
  REVCD14            LENGTH=$4                                                  
  LABEL="Revenue code 14 (as received from source)"                             
  REVCD15            LENGTH=$4                                                  
  LABEL="Revenue code 15 (as received from source)"                             
  REVCD16            LENGTH=$4                                                  
  LABEL="Revenue code 16 (as received from source)"                             
  REVCD17            LENGTH=$4                                                  
  LABEL="Revenue code 17 (as received from source)"                             
  REVCD18            LENGTH=$4                                                  
  LABEL="Revenue code 18 (as received from source)"                             
  REVCD19            LENGTH=$4                                                  
  LABEL="Revenue code 19 (as received from source)"                             
  REVCD20            LENGTH=$4                                                  
  LABEL="Revenue code 20 (as received from source)"                             
  REVCD21            LENGTH=$4                                                  
  LABEL="Revenue code 21 (as received from source)"                             
  REVCD22            LENGTH=$4                                                  
  LABEL="Revenue code 22 (as received from source)"                             
  REVCD23            LENGTH=$4                                                  
  LABEL="Revenue code 23 (as received from source)"                             
  REVCD24            LENGTH=$4                                                  
  LABEL="Revenue code 24 (as received from source)"                             
  REVCD25            LENGTH=$4                                                  
  LABEL="Revenue code 25 (as received from source)"                             
  REVCD26            LENGTH=$4                                                  
  LABEL="Revenue code 26 (as received from source)"                             
  REVCD27            LENGTH=$4                                                  
  LABEL="Revenue code 27 (as received from source)"                             
  REVCD28            LENGTH=$4                                                  
  LABEL="Revenue code 28 (as received from source)"                             
  REVCD29            LENGTH=$4                                                  
  LABEL="Revenue code 29 (as received from source)"                             
  REVCD30            LENGTH=$4                                                  
  LABEL="Revenue code 30 (as received from source)"                             
  REVCD31            LENGTH=$4                                                  
  LABEL="Revenue code 31 (as received from source)"                             
  REVCD32            LENGTH=$4                                                  
  LABEL="Revenue code 32 (as received from source)"                             
  REVCD33            LENGTH=$4                                                  
  LABEL="Revenue code 33 (as received from source)"                             
  UNIT1              LENGTH=4                                                   
  LABEL="Units of service 1 (as received from source)"                          
  UNIT2              LENGTH=4                                                   
  LABEL="Units of service 2 (as received from source)"                          
  UNIT3              LENGTH=4                                                   
  LABEL="Units of service 3 (as received from source)"                          
;                                                                               
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
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
      @423    REVCD1              $CHAR4.                                       
      @427    REVCD2              $CHAR4.                                       
      @431    REVCD3              $CHAR4.                                       
      @435    REVCD4              $CHAR4.                                       
      @439    REVCD5              $CHAR4.                                       
      @443    REVCD6              $CHAR4.                                       
      @447    REVCD7              $CHAR4.                                       
      @451    REVCD8              $CHAR4.                                       
      @455    REVCD9              $CHAR4.                                       
      @459    REVCD10             $CHAR4.                                       
      @463    REVCD11             $CHAR4.                                       
      @467    REVCD12             $CHAR4.                                       
      @471    REVCD13             $CHAR4.                                       
      @475    REVCD14             $CHAR4.                                       
      @479    REVCD15             $CHAR4.                                       
      @483    REVCD16             $CHAR4.                                       
      @487    REVCD17             $CHAR4.                                       
      @491    REVCD18             $CHAR4.                                       
      @495    REVCD19             $CHAR4.                                       
      @499    REVCD20             $CHAR4.                                       
      @503    REVCD21             $CHAR4.                                       
      @507    REVCD22             $CHAR4.                                       
      @511    REVCD23             $CHAR4.                                       
      @515    REVCD24             $CHAR4.                                       
      @519    REVCD25             $CHAR4.                                       
      @523    REVCD26             $CHAR4.                                       
      @527    REVCD27             $CHAR4.                                       
      @531    REVCD28             $CHAR4.                                       
      @535    REVCD29             $CHAR4.                                       
      @539    REVCD30             $CHAR4.                                       
      @543    REVCD31             $CHAR4.                                       
      @547    REVCD32             $CHAR4.                                       
      @551    REVCD33             $CHAR4.                                       
      @555    UNIT1               N4PF.                                         
      @559    UNIT2               N4PF.                                         
      @563    UNIT3               N4PF.                                         
;                                                                               
                                                                                
                                                                                
RUN;
