/*******************************************************************            
*   NY_SID_2003_CHGS.SAS:                                                       
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
  INVALUE N5P2F                                                                 
    '-9.99' = .                                                                 
    '-8.88' = .A                                                                
    '-6.66' = .C                                                                
    OTHER = (|5.2|)                                                             
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
  INVALUE N9PF                                                                  
    '-99999999' = .                                                             
    '-88888888' = .A                                                            
    '-66666666' = .C                                                            
    OTHER = (|9.|)                                                              
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
  INVALUE N10P5F                                                                
    '-999.99999' = .                                                            
    '-888.88888' = .A                                                           
    '-666.66666' = .C                                                           
    OTHER = (|10.5|)                                                            
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
  INVALUE N12P5F                                                                
    '-99999.99999' = .                                                          
    '-88888.88888' = .A                                                         
    '-66666.66666' = .C                                                         
    OTHER = (|12.5|)                                                            
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
DATA NY_SIDC_2003_CHGS;                                                         
INFILE 'NY_SID_2003_CHGS.ASC' LRECL = 1001;                                     
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  KEY                        LENGTH=8                 FORMAT=Z14.               
  LABEL="HCUP record identifier"                                                
                                                                                
  CHG1                       LENGTH=6                                           
  LABEL="Detailed charges 1 (as received from source)"                          
                                                                                
  CHG2                       LENGTH=6                                           
  LABEL="Detailed charges 2 (as received from source)"                          
                                                                                
  CHG3                       LENGTH=6                                           
  LABEL="Detailed charges 3 (as received from source)"                          
                                                                                
  CHG4                       LENGTH=6                                           
  LABEL="Detailed charges 4 (as received from source)"                          
                                                                                
  CHG5                       LENGTH=6                                           
  LABEL="Detailed charges 5 (as received from source)"                          
                                                                                
  CHG6                       LENGTH=6                                           
  LABEL="Detailed charges 6 (as received from source)"                          
                                                                                
  CHG7                       LENGTH=6                                           
  LABEL="Detailed charges 7 (as received from source)"                          
                                                                                
  CHG8                       LENGTH=6                                           
  LABEL="Detailed charges 8 (as received from source)"                          
                                                                                
  CHG9                       LENGTH=6                                           
  LABEL="Detailed charges 9 (as received from source)"                          
                                                                                
  CHG10                      LENGTH=6                                           
  LABEL="Detailed charges 10 (as received from source)"                         
                                                                                
  CHG11                      LENGTH=6                                           
  LABEL="Detailed charges 11 (as received from source)"                         
                                                                                
  CHG12                      LENGTH=6                                           
  LABEL="Detailed charges 12 (as received from source)"                         
                                                                                
  CHG13                      LENGTH=6                                           
  LABEL="Detailed charges 13 (as received from source)"                         
                                                                                
  CHG14                      LENGTH=6                                           
  LABEL="Detailed charges 14 (as received from source)"                         
                                                                                
  CHG15                      LENGTH=6                                           
  LABEL="Detailed charges 15 (as received from source)"                         
                                                                                
  CHG16                      LENGTH=6                                           
  LABEL="Detailed charges 16 (as received from source)"                         
                                                                                
  CHG17                      LENGTH=6                                           
  LABEL="Detailed charges 17 (as received from source)"                         
                                                                                
  CHG18                      LENGTH=6                                           
  LABEL="Detailed charges 18 (as received from source)"                         
                                                                                
  CHG19                      LENGTH=6                                           
  LABEL="Detailed charges 19 (as received from source)"                         
                                                                                
  CHG20                      LENGTH=6                                           
  LABEL="Detailed charges 20 (as received from source)"                         
                                                                                
  CHG21                      LENGTH=6                                           
  LABEL="Detailed charges 21 (as received from source)"                         
                                                                                
  CHG22                      LENGTH=6                                           
  LABEL="Detailed charges 22 (as received from source)"                         
                                                                                
  CHG23                      LENGTH=6                                           
  LABEL="Detailed charges 23 (as received from source)"                         
                                                                                
  CHG24                      LENGTH=6                                           
  LABEL="Detailed charges 24 (as received from source)"                         
                                                                                
  CHG25                      LENGTH=6                                           
  LABEL="Detailed charges 25 (as received from source)"                         
                                                                                
  CHG26                      LENGTH=6                                           
  LABEL="Detailed charges 26 (as received from source)"                         
                                                                                
  CHG27                      LENGTH=6                                           
  LABEL="Detailed charges 27 (as received from source)"                         
                                                                                
  CHG28                      LENGTH=6                                           
  LABEL="Detailed charges 28 (as received from source)"                         
                                                                                
  CHG29                      LENGTH=6                                           
  LABEL="Detailed charges 29 (as received from source)"                         
                                                                                
  CHG30                      LENGTH=6                                           
  LABEL="Detailed charges 30 (as received from source)"                         
                                                                                
  CHG31                      LENGTH=6                                           
  LABEL="Detailed charges 31 (as received from source)"                         
                                                                                
  CHG32                      LENGTH=6                                           
  LABEL="Detailed charges 32 (as received from source)"                         
                                                                                
  CHG33                      LENGTH=6                                           
  LABEL="Detailed charges 33 (as received from source)"                         
                                                                                
  CHG34                      LENGTH=6                                           
  LABEL="Detailed charges 34 (as received from source)"                         
                                                                                
  CHG35                      LENGTH=6                                           
  LABEL="Detailed charges 35 (as received from source)"                         
                                                                                
  CHG36                      LENGTH=6                                           
  LABEL="Detailed charges 36 (as received from source)"                         
                                                                                
  CHG37                      LENGTH=6                                           
  LABEL="Detailed charges 37 (as received from source)"                         
                                                                                
  CHG38                      LENGTH=6                                           
  LABEL="Detailed charges 38 (as received from source)"                         
                                                                                
  CHG39                      LENGTH=6                                           
  LABEL="Detailed charges 39 (as received from source)"                         
                                                                                
  CHG40                      LENGTH=6                                           
  LABEL="Detailed charges 40 (as received from source)"                         
                                                                                
  CHG41                      LENGTH=6                                           
  LABEL="Detailed charges 41 (as received from source)"                         
                                                                                
  CHG42                      LENGTH=6                                           
  LABEL="Detailed charges 42 (as received from source)"                         
                                                                                
  CHG43                      LENGTH=6                                           
  LABEL="Detailed charges 43 (as received from source)"                         
                                                                                
  CHG44                      LENGTH=6                                           
  LABEL="Detailed charges 44 (as received from source)"                         
                                                                                
  CHG45                      LENGTH=6                                           
  LABEL="Detailed charges 45 (as received from source)"                         
                                                                                
  CHG46                      LENGTH=6                                           
  LABEL="Detailed charges 46 (as received from source)"                         
                                                                                
  CHG47                      LENGTH=6                                           
  LABEL="Detailed charges 47 (as received from source)"                         
                                                                                
  CHG48                      LENGTH=6                                           
  LABEL="Detailed charges 48 (as received from source)"                         
                                                                                
  CHG49                      LENGTH=6                                           
  LABEL="Detailed charges 49 (as received from source)"                         
                                                                                
  CHG50                      LENGTH=6                                           
  LABEL="Detailed charges 50 (as received from source)"                         
                                                                                
  CHG51                      LENGTH=6                                           
  LABEL="Detailed charges 51 (as received from source)"                         
                                                                                
  CHG52                      LENGTH=6                                           
  LABEL="Detailed charges 52 (as received from source)"                         
                                                                                
  CHG53                      LENGTH=6                                           
  LABEL="Detailed charges 53 (as received from source)"                         
                                                                                
  CHG54                      LENGTH=6                                           
  LABEL="Detailed charges 54 (as received from source)"                         
                                                                                
  CHG55                      LENGTH=6                                           
  LABEL="Detailed charges 55 (as received from source)"                         
                                                                                
  CHG56                      LENGTH=6                                           
  LABEL="Detailed charges 56 (as received from source)"                         
                                                                                
  CHG57                      LENGTH=6                                           
  LABEL="Detailed charges 57 (as received from source)"                         
                                                                                
  RATE1                      LENGTH=5                                           
  LABEL="Daily rate 1 (as received from source)"                                
                                                                                
  RATE2                      LENGTH=5                                           
  LABEL="Daily rate 2 (as received from source)"                                
                                                                                
  RATE3                      LENGTH=5                                           
  LABEL="Daily rate 3 (as received from source)"                                
                                                                                
  RATE4                      LENGTH=5                                           
  LABEL="Daily rate 4 (as received from source)"                                
                                                                                
  RATE5                      LENGTH=5                                           
  LABEL="Daily rate 5 (as received from source)"                                
                                                                                
  REVCD1                     LENGTH=$4                                          
  LABEL="Revenue code 1 (as received from source)"                              
                                                                                
  REVCD2                     LENGTH=$4                                          
  LABEL="Revenue code 2 (as received from source)"                              
                                                                                
  REVCD3                     LENGTH=$4                                          
  LABEL="Revenue code 3 (as received from source)"                              
                                                                                
  REVCD4                     LENGTH=$4                                          
  LABEL="Revenue code 4 (as received from source)"                              
                                                                                
  REVCD5                     LENGTH=$4                                          
  LABEL="Revenue code 5 (as received from source)"                              
                                                                                
  REVCD6                     LENGTH=$4                                          
  LABEL="Revenue code 6 (as received from source)"                              
                                                                                
  REVCD7                     LENGTH=$4                                          
  LABEL="Revenue code 7 (as received from source)"                              
                                                                                
  REVCD8                     LENGTH=$4                                          
  LABEL="Revenue code 8 (as received from source)"                              
                                                                                
  REVCD9                     LENGTH=$4                                          
  LABEL="Revenue code 9 (as received from source)"                              
                                                                                
  REVCD10                    LENGTH=$4                                          
  LABEL="Revenue code 10 (as received from source)"                             
                                                                                
  REVCD11                    LENGTH=$4                                          
  LABEL="Revenue code 11 (as received from source)"                             
                                                                                
  REVCD12                    LENGTH=$4                                          
  LABEL="Revenue code 12 (as received from source)"                             
                                                                                
  REVCD13                    LENGTH=$4                                          
  LABEL="Revenue code 13 (as received from source)"                             
                                                                                
  REVCD14                    LENGTH=$4                                          
  LABEL="Revenue code 14 (as received from source)"                             
                                                                                
  REVCD15                    LENGTH=$4                                          
  LABEL="Revenue code 15 (as received from source)"                             
                                                                                
  REVCD16                    LENGTH=$4                                          
  LABEL="Revenue code 16 (as received from source)"                             
                                                                                
  REVCD17                    LENGTH=$4                                          
  LABEL="Revenue code 17 (as received from source)"                             
                                                                                
  REVCD18                    LENGTH=$4                                          
  LABEL="Revenue code 18 (as received from source)"                             
                                                                                
  REVCD19                    LENGTH=$4                                          
  LABEL="Revenue code 19 (as received from source)"                             
                                                                                
  REVCD20                    LENGTH=$4                                          
  LABEL="Revenue code 20 (as received from source)"                             
                                                                                
  REVCD21                    LENGTH=$4                                          
  LABEL="Revenue code 21 (as received from source)"                             
                                                                                
  REVCD22                    LENGTH=$4                                          
  LABEL="Revenue code 22 (as received from source)"                             
                                                                                
  REVCD23                    LENGTH=$4                                          
  LABEL="Revenue code 23 (as received from source)"                             
                                                                                
  REVCD24                    LENGTH=$4                                          
  LABEL="Revenue code 24 (as received from source)"                             
                                                                                
  REVCD25                    LENGTH=$4                                          
  LABEL="Revenue code 25 (as received from source)"                             
                                                                                
  REVCD26                    LENGTH=$4                                          
  LABEL="Revenue code 26 (as received from source)"                             
                                                                                
  REVCD27                    LENGTH=$4                                          
  LABEL="Revenue code 27 (as received from source)"                             
                                                                                
  REVCD28                    LENGTH=$4                                          
  LABEL="Revenue code 28 (as received from source)"                             
                                                                                
  REVCD29                    LENGTH=$4                                          
  LABEL="Revenue code 29 (as received from source)"                             
                                                                                
  REVCD30                    LENGTH=$4                                          
  LABEL="Revenue code 30 (as received from source)"                             
                                                                                
  REVCD31                    LENGTH=$4                                          
  LABEL="Revenue code 31 (as received from source)"                             
                                                                                
  REVCD32                    LENGTH=$4                                          
  LABEL="Revenue code 32 (as received from source)"                             
                                                                                
  REVCD33                    LENGTH=$4                                          
  LABEL="Revenue code 33 (as received from source)"                             
                                                                                
  REVCD34                    LENGTH=$4                                          
  LABEL="Revenue code 34 (as received from source)"                             
                                                                                
  REVCD35                    LENGTH=$4                                          
  LABEL="Revenue code 35 (as received from source)"                             
                                                                                
  REVCD36                    LENGTH=$4                                          
  LABEL="Revenue code 36 (as received from source)"                             
                                                                                
  REVCD37                    LENGTH=$4                                          
  LABEL="Revenue code 37 (as received from source)"                             
                                                                                
  REVCD38                    LENGTH=$4                                          
  LABEL="Revenue code 38 (as received from source)"                             
                                                                                
  REVCD39                    LENGTH=$4                                          
  LABEL="Revenue code 39 (as received from source)"                             
                                                                                
  REVCD40                    LENGTH=$4                                          
  LABEL="Revenue code 40 (as received from source)"                             
                                                                                
  REVCD41                    LENGTH=$4                                          
  LABEL="Revenue code 41 (as received from source)"                             
                                                                                
  REVCD42                    LENGTH=$4                                          
  LABEL="Revenue code 42 (as received from source)"                             
                                                                                
  REVCD43                    LENGTH=$4                                          
  LABEL="Revenue code 43 (as received from source)"                             
                                                                                
  REVCD44                    LENGTH=$4                                          
  LABEL="Revenue code 44 (as received from source)"                             
                                                                                
  REVCD45                    LENGTH=$4                                          
  LABEL="Revenue code 45 (as received from source)"                             
                                                                                
  REVCD46                    LENGTH=$4                                          
  LABEL="Revenue code 46 (as received from source)"                             
                                                                                
  REVCD47                    LENGTH=$4                                          
  LABEL="Revenue code 47 (as received from source)"                             
                                                                                
  REVCD48                    LENGTH=$4                                          
  LABEL="Revenue code 48 (as received from source)"                             
                                                                                
  REVCD49                    LENGTH=$4                                          
  LABEL="Revenue code 49 (as received from source)"                             
                                                                                
  REVCD50                    LENGTH=$4                                          
  LABEL="Revenue code 50 (as received from source)"                             
                                                                                
  REVCD51                    LENGTH=$4                                          
  LABEL="Revenue code 51 (as received from source)"                             
                                                                                
  REVCD52                    LENGTH=$4                                          
  LABEL="Revenue code 52 (as received from source)"                             
                                                                                
  REVCD53                    LENGTH=$4                                          
  LABEL="Revenue code 53 (as received from source)"                             
                                                                                
  REVCD54                    LENGTH=$4                                          
  LABEL="Revenue code 54 (as received from source)"                             
                                                                                
  REVCD55                    LENGTH=$4                                          
  LABEL="Revenue code 55 (as received from source)"                             
                                                                                
  REVCD56                    LENGTH=$4                                          
  LABEL="Revenue code 56 (as received from source)"                             
                                                                                
  REVCD57                    LENGTH=$4                                          
  LABEL="Revenue code 57 (as received from source)"                             
                                                                                
  UNIT1                      LENGTH=4                                           
  LABEL="Units of service 1 (as received from source)"                          
                                                                                
  UNIT2                      LENGTH=4                                           
  LABEL="Units of service 2 (as received from source)"                          
                                                                                
  UNIT3                      LENGTH=4                                           
  LABEL="Units of service 3 (as received from source)"                          
                                                                                
  UNIT4                      LENGTH=4                                           
  LABEL="Units of service 4 (as received from source)"                          
                                                                                
  UNIT5                      LENGTH=4                                           
  LABEL="Units of service 5 (as received from source)"                          
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      KEY                      14.                                      
      @15     CHG1                     N12P2F.                                  
      @27     CHG2                     N12P2F.                                  
      @39     CHG3                     N12P2F.                                  
      @51     CHG4                     N12P2F.                                  
      @63     CHG5                     N12P2F.                                  
      @75     CHG6                     N12P2F.                                  
      @87     CHG7                     N12P2F.                                  
      @99     CHG8                     N12P2F.                                  
      @111    CHG9                     N12P2F.                                  
      @123    CHG10                    N12P2F.                                  
      @135    CHG11                    N12P2F.                                  
      @147    CHG12                    N12P2F.                                  
      @159    CHG13                    N12P2F.                                  
      @171    CHG14                    N12P2F.                                  
      @183    CHG15                    N12P2F.                                  
      @195    CHG16                    N12P2F.                                  
      @207    CHG17                    N12P2F.                                  
      @219    CHG18                    N12P2F.                                  
      @231    CHG19                    N12P2F.                                  
      @243    CHG20                    N12P2F.                                  
      @255    CHG21                    N12P2F.                                  
      @267    CHG22                    N12P2F.                                  
      @279    CHG23                    N12P2F.                                  
      @291    CHG24                    N12P2F.                                  
      @303    CHG25                    N12P2F.                                  
      @315    CHG26                    N12P2F.                                  
      @327    CHG27                    N12P2F.                                  
      @339    CHG28                    N12P2F.                                  
      @351    CHG29                    N12P2F.                                  
      @363    CHG30                    N12P2F.                                  
      @375    CHG31                    N12P2F.                                  
      @387    CHG32                    N12P2F.                                  
      @399    CHG33                    N12P2F.                                  
      @411    CHG34                    N12P2F.                                  
      @423    CHG35                    N12P2F.                                  
      @435    CHG36                    N12P2F.                                  
      @447    CHG37                    N12P2F.                                  
      @459    CHG38                    N12P2F.                                  
      @471    CHG39                    N12P2F.                                  
      @483    CHG40                    N12P2F.                                  
      @495    CHG41                    N12P2F.                                  
      @507    CHG42                    N12P2F.                                  
      @519    CHG43                    N12P2F.                                  
      @531    CHG44                    N12P2F.                                  
      @543    CHG45                    N12P2F.                                  
      @555    CHG46                    N12P2F.                                  
      @567    CHG47                    N12P2F.                                  
      @579    CHG48                    N12P2F.                                  
      @591    CHG49                    N12P2F.                                  
      @603    CHG50                    N12P2F.                                  
      @615    CHG51                    N12P2F.                                  
      @627    CHG52                    N12P2F.                                  
      @639    CHG53                    N12P2F.                                  
      @651    CHG54                    N12P2F.                                  
      @663    CHG55                    N12P2F.                                  
      @675    CHG56                    N12P2F.                                  
      @687    CHG57                    N12P2F.                                  
      @699    RATE1                    N7P2F.                                   
      @706    RATE2                    N7P2F.                                   
      @713    RATE3                    N7P2F.                                   
      @720    RATE4                    N7P2F.                                   
      @727    RATE5                    N7P2F.                                   
      @734    REVCD1                   $CHAR4.                                  
      @738    REVCD2                   $CHAR4.                                  
      @742    REVCD3                   $CHAR4.                                  
      @746    REVCD4                   $CHAR4.                                  
      @750    REVCD5                   $CHAR4.                                  
      @754    REVCD6                   $CHAR4.                                  
      @758    REVCD7                   $CHAR4.                                  
      @762    REVCD8                   $CHAR4.                                  
      @766    REVCD9                   $CHAR4.                                  
      @770    REVCD10                  $CHAR4.                                  
      @774    REVCD11                  $CHAR4.                                  
      @778    REVCD12                  $CHAR4.                                  
      @782    REVCD13                  $CHAR4.                                  
      @786    REVCD14                  $CHAR4.                                  
      @790    REVCD15                  $CHAR4.                                  
      @794    REVCD16                  $CHAR4.                                  
      @798    REVCD17                  $CHAR4.                                  
      @802    REVCD18                  $CHAR4.                                  
      @806    REVCD19                  $CHAR4.                                  
      @810    REVCD20                  $CHAR4.                                  
      @814    REVCD21                  $CHAR4.                                  
      @818    REVCD22                  $CHAR4.                                  
      @822    REVCD23                  $CHAR4.                                  
      @826    REVCD24                  $CHAR4.                                  
      @830    REVCD25                  $CHAR4.                                  
      @834    REVCD26                  $CHAR4.                                  
      @838    REVCD27                  $CHAR4.                                  
      @842    REVCD28                  $CHAR4.                                  
      @846    REVCD29                  $CHAR4.                                  
      @850    REVCD30                  $CHAR4.                                  
      @854    REVCD31                  $CHAR4.                                  
      @858    REVCD32                  $CHAR4.                                  
      @862    REVCD33                  $CHAR4.                                  
      @866    REVCD34                  $CHAR4.                                  
      @870    REVCD35                  $CHAR4.                                  
      @874    REVCD36                  $CHAR4.                                  
      @878    REVCD37                  $CHAR4.                                  
      @882    REVCD38                  $CHAR4.                                  
      @886    REVCD39                  $CHAR4.                                  
      @890    REVCD40                  $CHAR4.                                  
      @894    REVCD41                  $CHAR4.                                  
      @898    REVCD42                  $CHAR4.                                  
      @902    REVCD43                  $CHAR4.                                  
      @906    REVCD44                  $CHAR4.                                  
      @910    REVCD45                  $CHAR4.                                  
      @914    REVCD46                  $CHAR4.                                  
      @918    REVCD47                  $CHAR4.                                  
      @922    REVCD48                  $CHAR4.                                  
      @926    REVCD49                  $CHAR4.                                  
      @930    REVCD50                  $CHAR4.                                  
      @934    REVCD51                  $CHAR4.                                  
      @938    REVCD52                  $CHAR4.                                  
      @942    REVCD53                  $CHAR4.                                  
      @946    REVCD54                  $CHAR4.                                  
      @950    REVCD55                  $CHAR4.                                  
      @954    REVCD56                  $CHAR4.                                  
      @958    REVCD57                  $CHAR4.                                  
      @962    UNIT1                    N8PF.                                    
      @970    UNIT2                    N8PF.                                    
      @978    UNIT3                    N8PF.                                    
      @986    UNIT4                    N8PF.                                    
      @994    UNIT5                    N8PF.                                    
      ;                                                                         
                                                                                
                                                                                
RUN;
