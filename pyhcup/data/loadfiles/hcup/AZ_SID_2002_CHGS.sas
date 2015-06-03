/*******************************************************************            
*   AZ_SID_2002_CHGS.SAS:                                                       
*      THE SAS CODE SHOWN BELOW WILL LOAD THE ASCII                             
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
  INVALUE N4P1F                                                                 
    '-9.9' = .                                                                  
    '-8.8' = .A                                                                 
    '-6.6' = .C                                                                 
    OTHER = (|4.1|)                                                             
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
  INVALUE N7P4F                                                                 
    '-9.9999' = .                                                               
    '-8.8888' = .A                                                              
    '-6.6666' = .C                                                              
    OTHER = (|7.4|)                                                             
  ;                                                                             
  INVALUE N8PF                                                                  
    '-9999999' = .                                                              
    '-8888888' = .A                                                             
    '-6666666' = .C                                                             
    OTHER = (|8.|)                                                              
  ;                                                                             
  INVALUE N8P2F                                                                 
    '-9999.99' = .                                                              
    '-8888.88' = .A                                                             
    '-6666.66' = .C                                                             
    OTHER = (|8.2|)                                                             
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
DATA AZ_SIDC_2002_CHGS;                                                         
INFILE 'AZ_SID_2002_CHGS.ASC' LRECL = 770;                                      
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  KEY                LENGTH=8          FORMAT=Z14.                              
  LABEL="HCUP record identifier"                                                
                                                                                
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
                                                                                
  CHG35              LENGTH=6                                                   
  LABEL="Detailed charges 35 (as received from source)"                         
                                                                                
  CHG36              LENGTH=6                                                   
  LABEL="Detailed charges 36 (as received from source)"                         
                                                                                
  CHG37              LENGTH=6                                                   
  LABEL="Detailed charges 37 (as received from source)"                         
                                                                                
  CHG38              LENGTH=6                                                   
  LABEL="Detailed charges 38 (as received from source)"                         
                                                                                
  CHG39              LENGTH=6                                                   
  LABEL="Detailed charges 39 (as received from source)"                         
                                                                                
  CHG40              LENGTH=6                                                   
  LABEL="Detailed charges 40 (as received from source)"                         
                                                                                
  CHG41              LENGTH=6                                                   
  LABEL="Detailed charges 41 (as received from source)"                         
                                                                                
  CHG42              LENGTH=6                                                   
  LABEL="Detailed charges 42 (as received from source)"                         
                                                                                
  CHG43              LENGTH=6                                                   
  LABEL="Detailed charges 43 (as received from source)"                         
                                                                                
  CHG44              LENGTH=6                                                   
  LABEL="Detailed charges 44 (as received from source)"                         
                                                                                
  CHG45              LENGTH=6                                                   
  LABEL="Detailed charges 45 (as received from source)"                         
                                                                                
  CHG46              LENGTH=6                                                   
  LABEL="Detailed charges 46 (as received from source)"                         
                                                                                
  CHG47              LENGTH=6                                                   
  LABEL="Detailed charges 47 (as received from source)"                         
                                                                                
  CHG48              LENGTH=6                                                   
  LABEL="Detailed charges 48 (as received from source)"                         
                                                                                
  CHG49              LENGTH=6                                                   
  LABEL="Detailed charges 49 (as received from source)"                         
                                                                                
  CHG50              LENGTH=6                                                   
  LABEL="Detailed charges 50 (as received from source)"                         
                                                                                
  CHG51              LENGTH=6                                                   
  LABEL="Detailed charges 51 (as received from source)"                         
                                                                                
  CHG52              LENGTH=6                                                   
  LABEL="Detailed charges 52 (as received from source)"                         
                                                                                
  CHG53              LENGTH=6                                                   
  LABEL="Detailed charges 53 (as received from source)"                         
                                                                                
  CHG54              LENGTH=6                                                   
  LABEL="Detailed charges 54 (as received from source)"                         
                                                                                
  CHG55              LENGTH=6                                                   
  LABEL="Detailed charges 55 (as received from source)"                         
                                                                                
  CHG56              LENGTH=6                                                   
  LABEL="Detailed charges 56 (as received from source)"                         
                                                                                
  CHG57              LENGTH=6                                                   
  LABEL="Detailed charges 57 (as received from source)"                         
                                                                                
  CHG58              LENGTH=6                                                   
  LABEL="Detailed charges 58 (as received from source)"                         
                                                                                
  CHG59              LENGTH=6                                                   
  LABEL="Detailed charges 59 (as received from source)"                         
                                                                                
  CHG60              LENGTH=6                                                   
  LABEL="Detailed charges 60 (as received from source)"                         
                                                                                
  CHG61              LENGTH=6                                                   
  LABEL="Detailed charges 61 (as received from source)"                         
                                                                                
  CHG62              LENGTH=6                                                   
  LABEL="Detailed charges 62 (as received from source)"                         
                                                                                
  CHG63              LENGTH=6                                                   
  LABEL="Detailed charges 63 (as received from source)"                         
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
      ;                                                                         
                                                                                
                                                                                
RUN;
