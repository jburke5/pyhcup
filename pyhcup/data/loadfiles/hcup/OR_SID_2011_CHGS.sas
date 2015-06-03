/*******************************************************************            
*   OR_SID_2011_CHGS.SAS:                                                       
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
  INVALUE N11PF                                                                 
    '-9999999999' = .                                                           
    '-8888888888' = .A                                                          
    '-6666666666' = .C                                                          
    OTHER = (|11.|)                                                             
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
  INVALUE N13PF                                                                 
    '-999999999999' = .                                                         
    '-888888888888' = .A                                                        
    '-666666666666' = .C                                                        
    OTHER = (|13.|)                                                             
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
DATA OR_SIDC_2011_CHGS;                                                         
INFILE 'OR_SID_2011_CHGS.ASC' LRECL = 1292;                                     
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  KEY                        LENGTH=8                 FORMAT=Z18.               
  LABEL="HCUP record identifier"                                                
                                                                                
  NREVCD                     LENGTH=3                                           
  LABEL="Number of revenue codes for this discharge"                            
                                                                                
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
                                                                                
  REVCHG1                    LENGTH=6                                           
  LABEL="Detailed charges for revenue code 1 (as received from source)"         
                                                                                
  REVCHG2                    LENGTH=6                                           
  LABEL="Detailed charges for revenue code 2 (as received from source)"         
                                                                                
  REVCHG3                    LENGTH=6                                           
  LABEL="Detailed charges for revenue code 3 (as received from source)"         
                                                                                
  REVCHG4                    LENGTH=6                                           
  LABEL="Detailed charges for revenue code 4 (as received from source)"         
                                                                                
  REVCHG5                    LENGTH=6                                           
  LABEL="Detailed charges for revenue code 5 (as received from source)"         
                                                                                
  REVCHG6                    LENGTH=6                                           
  LABEL="Detailed charges for revenue code 6 (as received from source)"         
                                                                                
  REVCHG7                    LENGTH=6                                           
  LABEL="Detailed charges for revenue code 7 (as received from source)"         
                                                                                
  REVCHG8                    LENGTH=6                                           
  LABEL="Detailed charges for revenue code 8 (as received from source)"         
                                                                                
  REVCHG9                    LENGTH=6                                           
  LABEL="Detailed charges for revenue code 9 (as received from source)"         
                                                                                
  REVCHG10                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 10 (as received from source)"        
                                                                                
  REVCHG11                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 11 (as received from source)"        
                                                                                
  REVCHG12                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 12 (as received from source)"        
                                                                                
  REVCHG13                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 13 (as received from source)"        
                                                                                
  REVCHG14                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 14 (as received from source)"        
                                                                                
  REVCHG15                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 15 (as received from source)"        
                                                                                
  REVCHG16                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 16 (as received from source)"        
                                                                                
  REVCHG17                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 17 (as received from source)"        
                                                                                
  REVCHG18                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 18 (as received from source)"        
                                                                                
  REVCHG19                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 19 (as received from source)"        
                                                                                
  REVCHG20                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 20 (as received from source)"        
                                                                                
  REVCHG21                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 21 (as received from source)"        
                                                                                
  REVCHG22                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 22 (as received from source)"        
                                                                                
  REVCHG23                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 23 (as received from source)"        
                                                                                
  REVCHG24                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 24 (as received from source)"        
                                                                                
  REVCHG25                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 25 (as received from source)"        
                                                                                
  REVCHG26                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 26 (as received from source)"        
                                                                                
  REVCHG27                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 27 (as received from source)"        
                                                                                
  REVCHG28                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 28 (as received from source)"        
                                                                                
  REVCHG29                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 29 (as received from source)"        
                                                                                
  REVCHG30                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 30 (as received from source)"        
                                                                                
  REVCHG31                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 31 (as received from source)"        
                                                                                
  REVCHG32                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 32 (as received from source)"        
                                                                                
  REVCHG33                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 33 (as received from source)"        
                                                                                
  REVCHG34                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 34 (as received from source)"        
                                                                                
  REVCHG35                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 35 (as received from source)"        
                                                                                
  REVCHG36                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 36 (as received from source)"        
                                                                                
  REVCHG37                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 37 (as received from source)"        
                                                                                
  REVCHG38                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 38 (as received from source)"        
                                                                                
  REVCHG39                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 39 (as received from source)"        
                                                                                
  REVCHG40                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 40 (as received from source)"        
                                                                                
  REVCHG41                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 41 (as received from source)"        
                                                                                
  REVCHG42                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 42 (as received from source)"        
                                                                                
  REVCHG43                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 43 (as received from source)"        
                                                                                
  REVCHG44                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 44 (as received from source)"        
                                                                                
  REVCHG45                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 45 (as received from source)"        
                                                                                
  REVCHG46                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 46 (as received from source)"        
                                                                                
  REVCHG47                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 47 (as received from source)"        
                                                                                
  REVCHG48                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 48 (as received from source)"        
                                                                                
  REVCHG49                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 49 (as received from source)"        
                                                                                
  REVCHG50                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 50 (as received from source)"        
                                                                                
  REVCHG51                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 51 (as received from source)"        
                                                                                
  REVCHG52                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 52 (as received from source)"        
                                                                                
  REVCHG53                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 53 (as received from source)"        
                                                                                
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
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      KEY                      18.                                      
      @19     NREVCD                   N2PF.                                    
      @21     REVCD1                   $CHAR4.                                  
      @25     REVCD2                   $CHAR4.                                  
      @29     REVCD3                   $CHAR4.                                  
      @33     REVCD4                   $CHAR4.                                  
      @37     REVCD5                   $CHAR4.                                  
      @41     REVCD6                   $CHAR4.                                  
      @45     REVCD7                   $CHAR4.                                  
      @49     REVCD8                   $CHAR4.                                  
      @53     REVCD9                   $CHAR4.                                  
      @57     REVCD10                  $CHAR4.                                  
      @61     REVCD11                  $CHAR4.                                  
      @65     REVCD12                  $CHAR4.                                  
      @69     REVCD13                  $CHAR4.                                  
      @73     REVCD14                  $CHAR4.                                  
      @77     REVCD15                  $CHAR4.                                  
      @81     REVCD16                  $CHAR4.                                  
      @85     REVCD17                  $CHAR4.                                  
      @89     REVCD18                  $CHAR4.                                  
      @93     REVCD19                  $CHAR4.                                  
      @97     REVCD20                  $CHAR4.                                  
      @101    REVCD21                  $CHAR4.                                  
      @105    REVCD22                  $CHAR4.                                  
      @109    REVCD23                  $CHAR4.                                  
      @113    REVCD24                  $CHAR4.                                  
      @117    REVCD25                  $CHAR4.                                  
      @121    REVCD26                  $CHAR4.                                  
      @125    REVCD27                  $CHAR4.                                  
      @129    REVCD28                  $CHAR4.                                  
      @133    REVCD29                  $CHAR4.                                  
      @137    REVCD30                  $CHAR4.                                  
      @141    REVCD31                  $CHAR4.                                  
      @145    REVCD32                  $CHAR4.                                  
      @149    REVCD33                  $CHAR4.                                  
      @153    REVCD34                  $CHAR4.                                  
      @157    REVCD35                  $CHAR4.                                  
      @161    REVCD36                  $CHAR4.                                  
      @165    REVCD37                  $CHAR4.                                  
      @169    REVCD38                  $CHAR4.                                  
      @173    REVCD39                  $CHAR4.                                  
      @177    REVCD40                  $CHAR4.                                  
      @181    REVCD41                  $CHAR4.                                  
      @185    REVCD42                  $CHAR4.                                  
      @189    REVCD43                  $CHAR4.                                  
      @193    REVCD44                  $CHAR4.                                  
      @197    REVCD45                  $CHAR4.                                  
      @201    REVCD46                  $CHAR4.                                  
      @205    REVCD47                  $CHAR4.                                  
      @209    REVCD48                  $CHAR4.                                  
      @213    REVCD49                  $CHAR4.                                  
      @217    REVCD50                  $CHAR4.                                  
      @221    REVCD51                  $CHAR4.                                  
      @225    REVCD52                  $CHAR4.                                  
      @229    REVCD53                  $CHAR4.                                  
      @233    REVCHG1                  N12P2F.                                  
      @245    REVCHG2                  N12P2F.                                  
      @257    REVCHG3                  N12P2F.                                  
      @269    REVCHG4                  N12P2F.                                  
      @281    REVCHG5                  N12P2F.                                  
      @293    REVCHG6                  N12P2F.                                  
      @305    REVCHG7                  N12P2F.                                  
      @317    REVCHG8                  N12P2F.                                  
      @329    REVCHG9                  N12P2F.                                  
      @341    REVCHG10                 N12P2F.                                  
      @353    REVCHG11                 N12P2F.                                  
      @365    REVCHG12                 N12P2F.                                  
      @377    REVCHG13                 N12P2F.                                  
      @389    REVCHG14                 N12P2F.                                  
      @401    REVCHG15                 N12P2F.                                  
      @413    REVCHG16                 N12P2F.                                  
      @425    REVCHG17                 N12P2F.                                  
      @437    REVCHG18                 N12P2F.                                  
      @449    REVCHG19                 N12P2F.                                  
      @461    REVCHG20                 N12P2F.                                  
      @473    REVCHG21                 N12P2F.                                  
      @485    REVCHG22                 N12P2F.                                  
      @497    REVCHG23                 N12P2F.                                  
      @509    REVCHG24                 N12P2F.                                  
      @521    REVCHG25                 N12P2F.                                  
      @533    REVCHG26                 N12P2F.                                  
      @545    REVCHG27                 N12P2F.                                  
      @557    REVCHG28                 N12P2F.                                  
      @569    REVCHG29                 N12P2F.                                  
      @581    REVCHG30                 N12P2F.                                  
      @593    REVCHG31                 N12P2F.                                  
      @605    REVCHG32                 N12P2F.                                  
      @617    REVCHG33                 N12P2F.                                  
      @629    REVCHG34                 N12P2F.                                  
      @641    REVCHG35                 N12P2F.                                  
      @653    REVCHG36                 N12P2F.                                  
      @665    REVCHG37                 N12P2F.                                  
      @677    REVCHG38                 N12P2F.                                  
      @689    REVCHG39                 N12P2F.                                  
      @701    REVCHG40                 N12P2F.                                  
      @713    REVCHG41                 N12P2F.                                  
      @725    REVCHG42                 N12P2F.                                  
      @737    REVCHG43                 N12P2F.                                  
      @749    REVCHG44                 N12P2F.                                  
      @761    REVCHG45                 N12P2F.                                  
      @773    REVCHG46                 N12P2F.                                  
      @785    REVCHG47                 N12P2F.                                  
      @797    REVCHG48                 N12P2F.                                  
      @809    REVCHG49                 N12P2F.                                  
      @821    REVCHG50                 N12P2F.                                  
      @833    REVCHG51                 N12P2F.                                  
      @845    REVCHG52                 N12P2F.                                  
      @857    REVCHG53                 N12P2F.                                  
      @869    UNIT1                    N8PF.                                    
      @877    UNIT2                    N8PF.                                    
      @885    UNIT3                    N8PF.                                    
      @893    UNIT4                    N8PF.                                    
      @901    UNIT5                    N8PF.                                    
      @909    UNIT6                    N8PF.                                    
      @917    UNIT7                    N8PF.                                    
      @925    UNIT8                    N8PF.                                    
      @933    UNIT9                    N8PF.                                    
      @941    UNIT10                   N8PF.                                    
      @949    UNIT11                   N8PF.                                    
      @957    UNIT12                   N8PF.                                    
      @965    UNIT13                   N8PF.                                    
      @973    UNIT14                   N8PF.                                    
      @981    UNIT15                   N8PF.                                    
      @989    UNIT16                   N8PF.                                    
      @997    UNIT17                   N8PF.                                    
      @1005   UNIT18                   N8PF.                                    
      @1013   UNIT19                   N8PF.                                    
      @1021   UNIT20                   N8PF.                                    
      @1029   UNIT21                   N8PF.                                    
      @1037   UNIT22                   N8PF.                                    
      @1045   UNIT23                   N8PF.                                    
      @1053   UNIT24                   N8PF.                                    
      @1061   UNIT25                   N8PF.                                    
      @1069   UNIT26                   N8PF.                                    
      @1077   UNIT27                   N8PF.                                    
      @1085   UNIT28                   N8PF.                                    
      @1093   UNIT29                   N8PF.                                    
      @1101   UNIT30                   N8PF.                                    
      @1109   UNIT31                   N8PF.                                    
      @1117   UNIT32                   N8PF.                                    
      @1125   UNIT33                   N8PF.                                    
      @1133   UNIT34                   N8PF.                                    
      @1141   UNIT35                   N8PF.                                    
      @1149   UNIT36                   N8PF.                                    
      @1157   UNIT37                   N8PF.                                    
      @1165   UNIT38                   N8PF.                                    
      @1173   UNIT39                   N8PF.                                    
      @1181   UNIT40                   N8PF.                                    
      @1189   UNIT41                   N8PF.                                    
      @1197   UNIT42                   N8PF.                                    
      @1205   UNIT43                   N8PF.                                    
      @1213   UNIT44                   N8PF.                                    
      @1221   UNIT45                   N8PF.                                    
      @1229   UNIT46                   N8PF.                                    
      @1237   UNIT47                   N8PF.                                    
      @1245   UNIT48                   N8PF.                                    
      @1253   UNIT49                   N8PF.                                    
      @1261   UNIT50                   N8PF.                                    
      @1269   UNIT51                   N8PF.                                    
      @1277   UNIT52                   N8PF.                                    
      @1285   UNIT53                   N8PF.                                    
      ;                                                                         
                                                                                
                                                                                
RUN;
