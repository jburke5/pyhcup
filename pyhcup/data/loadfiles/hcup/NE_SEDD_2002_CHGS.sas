/*******************************************************************            
*   NE_SEDD_2002_CHGS.SAS:                                                      
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
  INVALUE N9P2F                                                                 
    '-99999.99' = .                                                             
    '-88888.88' = .A                                                            
    '-66666.66' = .C                                                            
    OTHER = (|9.2|)                                                             
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
DATA NE_SEDDC_2002_CHGS;                                                        
INFILE 'NE_SEDD_2002_CHGS.ASC' LRECL = 1928;                                    
                                                                                
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
                                                                                
  CHG58                      LENGTH=6                                           
  LABEL="Detailed charges 58 (as received from source)"                         
                                                                                
  CHG59                      LENGTH=6                                           
  LABEL="Detailed charges 59 (as received from source)"                         
                                                                                
  CHG60                      LENGTH=6                                           
  LABEL="Detailed charges 60 (as received from source)"                         
                                                                                
  CHG61                      LENGTH=6                                           
  LABEL="Detailed charges 61 (as received from source)"                         
                                                                                
  CHG62                      LENGTH=6                                           
  LABEL="Detailed charges 62 (as received from source)"                         
                                                                                
  CHG63                      LENGTH=6                                           
  LABEL="Detailed charges 63 (as received from source)"                         
                                                                                
  CHG64                      LENGTH=6                                           
  LABEL="Detailed charges 64 (as received from source)"                         
                                                                                
  CHG65                      LENGTH=6                                           
  LABEL="Detailed charges 65 (as received from source)"                         
                                                                                
  CHG66                      LENGTH=6                                           
  LABEL="Detailed charges 66 (as received from source)"                         
                                                                                
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
                                                                                
  REVCD58                    LENGTH=$4                                          
  LABEL="Revenue code 58 (as received from source)"                             
                                                                                
  REVCD59                    LENGTH=$4                                          
  LABEL="Revenue code 59 (as received from source)"                             
                                                                                
  REVCD60                    LENGTH=$4                                          
  LABEL="Revenue code 60 (as received from source)"                             
                                                                                
  REVCD61                    LENGTH=$4                                          
  LABEL="Revenue code 61 (as received from source)"                             
                                                                                
  REVCD62                    LENGTH=$4                                          
  LABEL="Revenue code 62 (as received from source)"                             
                                                                                
  REVCD63                    LENGTH=$4                                          
  LABEL="Revenue code 63 (as received from source)"                             
                                                                                
  REVCD64                    LENGTH=$4                                          
  LABEL="Revenue code 64 (as received from source)"                             
                                                                                
  REVCD65                    LENGTH=$4                                          
  LABEL="Revenue code 65 (as received from source)"                             
                                                                                
  REVCD66                    LENGTH=$4                                          
  LABEL="Revenue code 66 (as received from source)"                             
                                                                                
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
                                                                                
  UNIT6                      LENGTH=4                                           
  LABEL="Units of service 6 (as received from source)"                          
                                                                                
  UNIT7                      LENGTH=4                                           
  LABEL="Units of service 7 (as received from source)"                          
                                                                                
  UNIT8                      LENGTH=4                                           
  LABEL="Units of service 8 (as received from source)"                          
                                                                                
  UNIT9                      LENGTH=4                                           
  LABEL="Units of service 9 (as received from source)"                          
                                                                                
  UNIT10                     LENGTH=4                                           
  LABEL="Units of service 10 (as received from source)"                         
                                                                                
  UNIT11                     LENGTH=4                                           
  LABEL="Units of service 11 (as received from source)"                         
                                                                                
  UNIT12                     LENGTH=4                                           
  LABEL="Units of service 12 (as received from source)"                         
                                                                                
  UNIT13                     LENGTH=4                                           
  LABEL="Units of service 13 (as received from source)"                         
                                                                                
  UNIT14                     LENGTH=4                                           
  LABEL="Units of service 14 (as received from source)"                         
                                                                                
  UNIT15                     LENGTH=4                                           
  LABEL="Units of service 15 (as received from source)"                         
                                                                                
  UNIT16                     LENGTH=4                                           
  LABEL="Units of service 16 (as received from source)"                         
                                                                                
  UNIT17                     LENGTH=4                                           
  LABEL="Units of service 17 (as received from source)"                         
                                                                                
  UNIT18                     LENGTH=4                                           
  LABEL="Units of service 18 (as received from source)"                         
                                                                                
  UNIT19                     LENGTH=4                                           
  LABEL="Units of service 19 (as received from source)"                         
                                                                                
  UNIT20                     LENGTH=4                                           
  LABEL="Units of service 20 (as received from source)"                         
                                                                                
  UNIT21                     LENGTH=4                                           
  LABEL="Units of service 21 (as received from source)"                         
                                                                                
  UNIT22                     LENGTH=4                                           
  LABEL="Units of service 22 (as received from source)"                         
                                                                                
  UNIT23                     LENGTH=4                                           
  LABEL="Units of service 23 (as received from source)"                         
                                                                                
  UNIT24                     LENGTH=4                                           
  LABEL="Units of service 24 (as received from source)"                         
                                                                                
  UNIT25                     LENGTH=4                                           
  LABEL="Units of service 25 (as received from source)"                         
                                                                                
  UNIT26                     LENGTH=4                                           
  LABEL="Units of service 26 (as received from source)"                         
                                                                                
  UNIT27                     LENGTH=4                                           
  LABEL="Units of service 27 (as received from source)"                         
                                                                                
  UNIT28                     LENGTH=4                                           
  LABEL="Units of service 28 (as received from source)"                         
                                                                                
  UNIT29                     LENGTH=4                                           
  LABEL="Units of service 29 (as received from source)"                         
                                                                                
  UNIT30                     LENGTH=4                                           
  LABEL="Units of service 30 (as received from source)"                         
                                                                                
  UNIT31                     LENGTH=4                                           
  LABEL="Units of service 31 (as received from source)"                         
                                                                                
  UNIT32                     LENGTH=4                                           
  LABEL="Units of service 32 (as received from source)"                         
                                                                                
  UNIT33                     LENGTH=4                                           
  LABEL="Units of service 33 (as received from source)"                         
                                                                                
  UNIT34                     LENGTH=4                                           
  LABEL="Units of service 34 (as received from source)"                         
                                                                                
  UNIT35                     LENGTH=4                                           
  LABEL="Units of service 35 (as received from source)"                         
                                                                                
  UNIT36                     LENGTH=4                                           
  LABEL="Units of service 36 (as received from source)"                         
                                                                                
  UNIT37                     LENGTH=4                                           
  LABEL="Units of service 37 (as received from source)"                         
                                                                                
  UNIT38                     LENGTH=4                                           
  LABEL="Units of service 38 (as received from source)"                         
                                                                                
  UNIT39                     LENGTH=4                                           
  LABEL="Units of service 39 (as received from source)"                         
                                                                                
  UNIT40                     LENGTH=4                                           
  LABEL="Units of service 40 (as received from source)"                         
                                                                                
  UNIT41                     LENGTH=4                                           
  LABEL="Units of service 41 (as received from source)"                         
                                                                                
  UNIT42                     LENGTH=4                                           
  LABEL="Units of service 42 (as received from source)"                         
                                                                                
  UNIT43                     LENGTH=4                                           
  LABEL="Units of service 43 (as received from source)"                         
                                                                                
  UNIT44                     LENGTH=4                                           
  LABEL="Units of service 44 (as received from source)"                         
                                                                                
  UNIT45                     LENGTH=4                                           
  LABEL="Units of service 45 (as received from source)"                         
                                                                                
  UNIT46                     LENGTH=4                                           
  LABEL="Units of service 46 (as received from source)"                         
                                                                                
  UNIT47                     LENGTH=4                                           
  LABEL="Units of service 47 (as received from source)"                         
                                                                                
  UNIT48                     LENGTH=4                                           
  LABEL="Units of service 48 (as received from source)"                         
                                                                                
  UNIT49                     LENGTH=4                                           
  LABEL="Units of service 49 (as received from source)"                         
                                                                                
  UNIT50                     LENGTH=4                                           
  LABEL="Units of service 50 (as received from source)"                         
                                                                                
  UNIT51                     LENGTH=4                                           
  LABEL="Units of service 51 (as received from source)"                         
                                                                                
  UNIT52                     LENGTH=4                                           
  LABEL="Units of service 52 (as received from source)"                         
                                                                                
  UNIT53                     LENGTH=4                                           
  LABEL="Units of service 53 (as received from source)"                         
                                                                                
  UNIT54                     LENGTH=4                                           
  LABEL="Units of service 54 (as received from source)"                         
                                                                                
  UNIT55                     LENGTH=4                                           
  LABEL="Units of service 55 (as received from source)"                         
                                                                                
  UNIT56                     LENGTH=4                                           
  LABEL="Units of service 56 (as received from source)"                         
                                                                                
  UNIT57                     LENGTH=4                                           
  LABEL="Units of service 57 (as received from source)"                         
                                                                                
  UNIT58                     LENGTH=4                                           
  LABEL="Units of service 58 (as received from source)"                         
                                                                                
  UNIT59                     LENGTH=4                                           
  LABEL="Units of service 59 (as received from source)"                         
                                                                                
  UNIT60                     LENGTH=4                                           
  LABEL="Units of service 60 (as received from source)"                         
                                                                                
  UNIT61                     LENGTH=4                                           
  LABEL="Units of service 61 (as received from source)"                         
                                                                                
  UNIT62                     LENGTH=4                                           
  LABEL="Units of service 62 (as received from source)"                         
                                                                                
  UNIT63                     LENGTH=4                                           
  LABEL="Units of service 63 (as received from source)"                         
                                                                                
  UNIT64                     LENGTH=4                                           
  LABEL="Units of service 64 (as received from source)"                         
                                                                                
  UNIT65                     LENGTH=4                                           
  LABEL="Units of service 65 (as received from source)"                         
                                                                                
  UNIT66                     LENGTH=4                                           
  LABEL="Units of service 66 (as received from source)"                         
                                                                                
  CPT1                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 1"                                            
                                                                                
  CPT2                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 2"                                            
                                                                                
  CPT3                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 3"                                            
                                                                                
  CPT4                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 4"                                            
                                                                                
  CPT5                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 5"                                            
                                                                                
  CPT6                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 6"                                            
                                                                                
  CPT7                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 7"                                            
                                                                                
  CPT8                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 8"                                            
                                                                                
  CPT9                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 9"                                            
                                                                                
  CPT10                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 10"                                           
                                                                                
  CPT11                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 11"                                           
                                                                                
  CPT12                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 12"                                           
                                                                                
  CPT13                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 13"                                           
                                                                                
  CPT14                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 14"                                           
                                                                                
  CPT15                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 15"                                           
                                                                                
  CPT16                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 16"                                           
                                                                                
  CPT17                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 17"                                           
                                                                                
  CPT18                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 18"                                           
                                                                                
  CPT19                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 19"                                           
                                                                                
  CPT20                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 20"                                           
                                                                                
  CPT21                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 21"                                           
                                                                                
  CPT22                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 22"                                           
                                                                                
  CPT23                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 23"                                           
                                                                                
  CPT24                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 24"                                           
                                                                                
  CPT25                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 25"                                           
                                                                                
  CPT26                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 26"                                           
                                                                                
  CPT27                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 27"                                           
                                                                                
  CPT28                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 28"                                           
                                                                                
  CPT29                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 29"                                           
                                                                                
  CPT30                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 30"                                           
                                                                                
  CPT31                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 31"                                           
                                                                                
  CPT32                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 32"                                           
                                                                                
  CPT33                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 33"                                           
                                                                                
  CPT34                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 34"                                           
                                                                                
  CPT35                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 35"                                           
                                                                                
  CPT36                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 36"                                           
                                                                                
  CPT37                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 37"                                           
                                                                                
  CPT38                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 38"                                           
                                                                                
  CPT39                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 39"                                           
                                                                                
  CPT40                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 40"                                           
                                                                                
  CPT41                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 41"                                           
                                                                                
  CPT42                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 42"                                           
                                                                                
  CPT43                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 43"                                           
                                                                                
  CPT44                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 44"                                           
                                                                                
  CPT45                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 45"                                           
                                                                                
  CPT46                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 46"                                           
                                                                                
  CPT47                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 47"                                           
                                                                                
  CPT48                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 48"                                           
                                                                                
  CPT49                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 49"                                           
                                                                                
  CPT50                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 50"                                           
                                                                                
  CPT51                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 51"                                           
                                                                                
  CPT52                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 52"                                           
                                                                                
  CPT53                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 53"                                           
                                                                                
  CPT54                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 54"                                           
                                                                                
  CPT55                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 55"                                           
                                                                                
  CPT56                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 56"                                           
                                                                                
  CPT57                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 57"                                           
                                                                                
  CPT58                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 58"                                           
                                                                                
  CPT59                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 59"                                           
                                                                                
  CPT60                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 60"                                           
                                                                                
  CPT61                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 61"                                           
                                                                                
  CPT62                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 62"                                           
                                                                                
  CPT63                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 63"                                           
                                                                                
  CPT64                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 64"                                           
                                                                                
  CPT65                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 65"                                           
                                                                                
  CPT66                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 66"                                           
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
      @699    CHG58                    N12P2F.                                  
      @711    CHG59                    N12P2F.                                  
      @723    CHG60                    N12P2F.                                  
      @735    CHG61                    N12P2F.                                  
      @747    CHG62                    N12P2F.                                  
      @759    CHG63                    N12P2F.                                  
      @771    CHG64                    N12P2F.                                  
      @783    CHG65                    N12P2F.                                  
      @795    CHG66                    N12P2F.                                  
      @807    REVCD1                   $CHAR4.                                  
      @811    REVCD2                   $CHAR4.                                  
      @815    REVCD3                   $CHAR4.                                  
      @819    REVCD4                   $CHAR4.                                  
      @823    REVCD5                   $CHAR4.                                  
      @827    REVCD6                   $CHAR4.                                  
      @831    REVCD7                   $CHAR4.                                  
      @835    REVCD8                   $CHAR4.                                  
      @839    REVCD9                   $CHAR4.                                  
      @843    REVCD10                  $CHAR4.                                  
      @847    REVCD11                  $CHAR4.                                  
      @851    REVCD12                  $CHAR4.                                  
      @855    REVCD13                  $CHAR4.                                  
      @859    REVCD14                  $CHAR4.                                  
      @863    REVCD15                  $CHAR4.                                  
      @867    REVCD16                  $CHAR4.                                  
      @871    REVCD17                  $CHAR4.                                  
      @875    REVCD18                  $CHAR4.                                  
      @879    REVCD19                  $CHAR4.                                  
      @883    REVCD20                  $CHAR4.                                  
      @887    REVCD21                  $CHAR4.                                  
      @891    REVCD22                  $CHAR4.                                  
      @895    REVCD23                  $CHAR4.                                  
      @899    REVCD24                  $CHAR4.                                  
      @903    REVCD25                  $CHAR4.                                  
      @907    REVCD26                  $CHAR4.                                  
      @911    REVCD27                  $CHAR4.                                  
      @915    REVCD28                  $CHAR4.                                  
      @919    REVCD29                  $CHAR4.                                  
      @923    REVCD30                  $CHAR4.                                  
      @927    REVCD31                  $CHAR4.                                  
      @931    REVCD32                  $CHAR4.                                  
      @935    REVCD33                  $CHAR4.                                  
      @939    REVCD34                  $CHAR4.                                  
      @943    REVCD35                  $CHAR4.                                  
      @947    REVCD36                  $CHAR4.                                  
      @951    REVCD37                  $CHAR4.                                  
      @955    REVCD38                  $CHAR4.                                  
      @959    REVCD39                  $CHAR4.                                  
      @963    REVCD40                  $CHAR4.                                  
      @967    REVCD41                  $CHAR4.                                  
      @971    REVCD42                  $CHAR4.                                  
      @975    REVCD43                  $CHAR4.                                  
      @979    REVCD44                  $CHAR4.                                  
      @983    REVCD45                  $CHAR4.                                  
      @987    REVCD46                  $CHAR4.                                  
      @991    REVCD47                  $CHAR4.                                  
      @995    REVCD48                  $CHAR4.                                  
      @999    REVCD49                  $CHAR4.                                  
      @1003   REVCD50                  $CHAR4.                                  
      @1007   REVCD51                  $CHAR4.                                  
      @1011   REVCD52                  $CHAR4.                                  
      @1015   REVCD53                  $CHAR4.                                  
      @1019   REVCD54                  $CHAR4.                                  
      @1023   REVCD55                  $CHAR4.                                  
      @1027   REVCD56                  $CHAR4.                                  
      @1031   REVCD57                  $CHAR4.                                  
      @1035   REVCD58                  $CHAR4.                                  
      @1039   REVCD59                  $CHAR4.                                  
      @1043   REVCD60                  $CHAR4.                                  
      @1047   REVCD61                  $CHAR4.                                  
      @1051   REVCD62                  $CHAR4.                                  
      @1055   REVCD63                  $CHAR4.                                  
      @1059   REVCD64                  $CHAR4.                                  
      @1063   REVCD65                  $CHAR4.                                  
      @1067   REVCD66                  $CHAR4.                                  
      @1071   UNIT1                    N8PF.                                    
      @1079   UNIT2                    N8PF.                                    
      @1087   UNIT3                    N8PF.                                    
      @1095   UNIT4                    N8PF.                                    
      @1103   UNIT5                    N8PF.                                    
      @1111   UNIT6                    N8PF.                                    
      @1119   UNIT7                    N8PF.                                    
      @1127   UNIT8                    N8PF.                                    
      @1135   UNIT9                    N8PF.                                    
      @1143   UNIT10                   N8PF.                                    
      @1151   UNIT11                   N8PF.                                    
      @1159   UNIT12                   N8PF.                                    
      @1167   UNIT13                   N8PF.                                    
      @1175   UNIT14                   N8PF.                                    
      @1183   UNIT15                   N8PF.                                    
      @1191   UNIT16                   N8PF.                                    
      @1199   UNIT17                   N8PF.                                    
      @1207   UNIT18                   N8PF.                                    
      @1215   UNIT19                   N8PF.                                    
      @1223   UNIT20                   N8PF.                                    
      @1231   UNIT21                   N8PF.                                    
      @1239   UNIT22                   N8PF.                                    
      @1247   UNIT23                   N8PF.                                    
      @1255   UNIT24                   N8PF.                                    
      @1263   UNIT25                   N8PF.                                    
      @1271   UNIT26                   N8PF.                                    
      @1279   UNIT27                   N8PF.                                    
      @1287   UNIT28                   N8PF.                                    
      @1295   UNIT29                   N8PF.                                    
      @1303   UNIT30                   N8PF.                                    
      @1311   UNIT31                   N8PF.                                    
      @1319   UNIT32                   N8PF.                                    
      @1327   UNIT33                   N8PF.                                    
      @1335   UNIT34                   N8PF.                                    
      @1343   UNIT35                   N8PF.                                    
      @1351   UNIT36                   N8PF.                                    
      @1359   UNIT37                   N8PF.                                    
      @1367   UNIT38                   N8PF.                                    
      @1375   UNIT39                   N8PF.                                    
      @1383   UNIT40                   N8PF.                                    
      @1391   UNIT41                   N8PF.                                    
      @1399   UNIT42                   N8PF.                                    
      @1407   UNIT43                   N8PF.                                    
      @1415   UNIT44                   N8PF.                                    
      @1423   UNIT45                   N8PF.                                    
      @1431   UNIT46                   N8PF.                                    
      @1439   UNIT47                   N8PF.                                    
      @1447   UNIT48                   N8PF.                                    
      @1455   UNIT49                   N8PF.                                    
      @1463   UNIT50                   N8PF.                                    
      @1471   UNIT51                   N8PF.                                    
      @1479   UNIT52                   N8PF.                                    
      @1487   UNIT53                   N8PF.                                    
      @1495   UNIT54                   N8PF.                                    
      @1503   UNIT55                   N8PF.                                    
      @1511   UNIT56                   N8PF.                                    
      @1519   UNIT57                   N8PF.                                    
      @1527   UNIT58                   N8PF.                                    
      @1535   UNIT59                   N8PF.                                    
      @1543   UNIT60                   N8PF.                                    
      @1551   UNIT61                   N8PF.                                    
      @1559   UNIT62                   N8PF.                                    
      @1567   UNIT63                   N8PF.                                    
      @1575   UNIT64                   N8PF.                                    
      @1583   UNIT65                   N8PF.                                    
      @1591   UNIT66                   N8PF.                                    
      @1599   CPT1                     $CHAR5.                                  
      @1604   CPT2                     $CHAR5.                                  
      @1609   CPT3                     $CHAR5.                                  
      @1614   CPT4                     $CHAR5.                                  
      @1619   CPT5                     $CHAR5.                                  
      @1624   CPT6                     $CHAR5.                                  
      @1629   CPT7                     $CHAR5.                                  
      @1634   CPT8                     $CHAR5.                                  
      @1639   CPT9                     $CHAR5.                                  
      @1644   CPT10                    $CHAR5.                                  
      @1649   CPT11                    $CHAR5.                                  
      @1654   CPT12                    $CHAR5.                                  
      @1659   CPT13                    $CHAR5.                                  
      @1664   CPT14                    $CHAR5.                                  
      @1669   CPT15                    $CHAR5.                                  
      @1674   CPT16                    $CHAR5.                                  
      @1679   CPT17                    $CHAR5.                                  
      @1684   CPT18                    $CHAR5.                                  
      @1689   CPT19                    $CHAR5.                                  
      @1694   CPT20                    $CHAR5.                                  
      @1699   CPT21                    $CHAR5.                                  
      @1704   CPT22                    $CHAR5.                                  
      @1709   CPT23                    $CHAR5.                                  
      @1714   CPT24                    $CHAR5.                                  
      @1719   CPT25                    $CHAR5.                                  
      @1724   CPT26                    $CHAR5.                                  
      @1729   CPT27                    $CHAR5.                                  
      @1734   CPT28                    $CHAR5.                                  
      @1739   CPT29                    $CHAR5.                                  
      @1744   CPT30                    $CHAR5.                                  
      @1749   CPT31                    $CHAR5.                                  
      @1754   CPT32                    $CHAR5.                                  
      @1759   CPT33                    $CHAR5.                                  
      @1764   CPT34                    $CHAR5.                                  
      @1769   CPT35                    $CHAR5.                                  
      @1774   CPT36                    $CHAR5.                                  
      @1779   CPT37                    $CHAR5.                                  
      @1784   CPT38                    $CHAR5.                                  
      @1789   CPT39                    $CHAR5.                                  
      @1794   CPT40                    $CHAR5.                                  
      @1799   CPT41                    $CHAR5.                                  
      @1804   CPT42                    $CHAR5.                                  
      @1809   CPT43                    $CHAR5.                                  
      @1814   CPT44                    $CHAR5.                                  
      @1819   CPT45                    $CHAR5.                                  
      @1824   CPT46                    $CHAR5.                                  
      @1829   CPT47                    $CHAR5.                                  
      @1834   CPT48                    $CHAR5.                                  
      @1839   CPT49                    $CHAR5.                                  
      @1844   CPT50                    $CHAR5.                                  
      @1849   CPT51                    $CHAR5.                                  
      @1854   CPT52                    $CHAR5.                                  
      @1859   CPT53                    $CHAR5.                                  
      @1864   CPT54                    $CHAR5.                                  
      @1869   CPT55                    $CHAR5.                                  
      @1874   CPT56                    $CHAR5.                                  
      @1879   CPT57                    $CHAR5.                                  
      @1884   CPT58                    $CHAR5.                                  
      @1889   CPT59                    $CHAR5.                                  
      @1894   CPT60                    $CHAR5.                                  
      @1899   CPT61                    $CHAR5.                                  
      @1904   CPT62                    $CHAR5.                                  
      @1909   CPT63                    $CHAR5.                                  
      @1914   CPT64                    $CHAR5.                                  
      @1919   CPT65                    $CHAR5.                                  
      @1924   CPT66                    $CHAR5.                                  
      ;                                                                         
                                                                                
                                                                                
RUN;
