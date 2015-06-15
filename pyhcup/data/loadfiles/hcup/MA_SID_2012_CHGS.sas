/*******************************************************************            
*   MA_SID_2012_CHGS.SAS:                                                       
*      THE SAS CODE SHOWN BELOW WILL LOAD THE ASCII                             
*      INPATIENT STAY CHGS FILE INTO SAS                                        
*******************************************************************/            
                                                                                
                                                                                
***************************************************************;                
* ----------------------------------------------------------- *;                
* |  NOTICE: Use of HCUP data constitutes acceptance of the | *;                
* |  terms and conditions of the HCUP Data Use Agreement.   | *;                
* ----------------------------------------------------------- *;                
***************************************************************;                
                                                                                
                                                                                
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
  INVALUE N11P2F                                                                
    '-9999999.99' = .                                                           
    '-8888888.88' = .A                                                          
    '-6666666.66' = .C                                                          
    OTHER = (|11.2|)                                                            
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
DATA MA_SIDC_2012_CHGS;                                                         
INFILE 'MA_SID_2012_CHGS.ASC' FIRSTOBS=3 LRECL = 1097;                          
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  KEY                        LENGTH=8                 FORMAT=Z15.               
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
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      KEY                      15.                                      
      @16     NREVCD                   N2PF.                                    
      @18     REVCD1                   $CHAR4.                                  
      @22     REVCD2                   $CHAR4.                                  
      @26     REVCD3                   $CHAR4.                                  
      @30     REVCD4                   $CHAR4.                                  
      @34     REVCD5                   $CHAR4.                                  
      @38     REVCD6                   $CHAR4.                                  
      @42     REVCD7                   $CHAR4.                                  
      @46     REVCD8                   $CHAR4.                                  
      @50     REVCD9                   $CHAR4.                                  
      @54     REVCD10                  $CHAR4.                                  
      @58     REVCD11                  $CHAR4.                                  
      @62     REVCD12                  $CHAR4.                                  
      @66     REVCD13                  $CHAR4.                                  
      @70     REVCD14                  $CHAR4.                                  
      @74     REVCD15                  $CHAR4.                                  
      @78     REVCD16                  $CHAR4.                                  
      @82     REVCD17                  $CHAR4.                                  
      @86     REVCD18                  $CHAR4.                                  
      @90     REVCD19                  $CHAR4.                                  
      @94     REVCD20                  $CHAR4.                                  
      @98     REVCD21                  $CHAR4.                                  
      @102    REVCD22                  $CHAR4.                                  
      @106    REVCD23                  $CHAR4.                                  
      @110    REVCD24                  $CHAR4.                                  
      @114    REVCD25                  $CHAR4.                                  
      @118    REVCD26                  $CHAR4.                                  
      @122    REVCD27                  $CHAR4.                                  
      @126    REVCD28                  $CHAR4.                                  
      @130    REVCD29                  $CHAR4.                                  
      @134    REVCD30                  $CHAR4.                                  
      @138    REVCD31                  $CHAR4.                                  
      @142    REVCD32                  $CHAR4.                                  
      @146    REVCD33                  $CHAR4.                                  
      @150    REVCD34                  $CHAR4.                                  
      @154    REVCD35                  $CHAR4.                                  
      @158    REVCD36                  $CHAR4.                                  
      @162    REVCD37                  $CHAR4.                                  
      @166    REVCD38                  $CHAR4.                                  
      @170    REVCD39                  $CHAR4.                                  
      @174    REVCD40                  $CHAR4.                                  
      @178    REVCD41                  $CHAR4.                                  
      @182    REVCD42                  $CHAR4.                                  
      @186    REVCD43                  $CHAR4.                                  
      @190    REVCD44                  $CHAR4.                                  
      @194    REVCD45                  $CHAR4.                                  
      @198    REVCHG1                  N12P2F.                                  
      @210    REVCHG2                  N12P2F.                                  
      @222    REVCHG3                  N12P2F.                                  
      @234    REVCHG4                  N12P2F.                                  
      @246    REVCHG5                  N12P2F.                                  
      @258    REVCHG6                  N12P2F.                                  
      @270    REVCHG7                  N12P2F.                                  
      @282    REVCHG8                  N12P2F.                                  
      @294    REVCHG9                  N12P2F.                                  
      @306    REVCHG10                 N12P2F.                                  
      @318    REVCHG11                 N12P2F.                                  
      @330    REVCHG12                 N12P2F.                                  
      @342    REVCHG13                 N12P2F.                                  
      @354    REVCHG14                 N12P2F.                                  
      @366    REVCHG15                 N12P2F.                                  
      @378    REVCHG16                 N12P2F.                                  
      @390    REVCHG17                 N12P2F.                                  
      @402    REVCHG18                 N12P2F.                                  
      @414    REVCHG19                 N12P2F.                                  
      @426    REVCHG20                 N12P2F.                                  
      @438    REVCHG21                 N12P2F.                                  
      @450    REVCHG22                 N12P2F.                                  
      @462    REVCHG23                 N12P2F.                                  
      @474    REVCHG24                 N12P2F.                                  
      @486    REVCHG25                 N12P2F.                                  
      @498    REVCHG26                 N12P2F.                                  
      @510    REVCHG27                 N12P2F.                                  
      @522    REVCHG28                 N12P2F.                                  
      @534    REVCHG29                 N12P2F.                                  
      @546    REVCHG30                 N12P2F.                                  
      @558    REVCHG31                 N12P2F.                                  
      @570    REVCHG32                 N12P2F.                                  
      @582    REVCHG33                 N12P2F.                                  
      @594    REVCHG34                 N12P2F.                                  
      @606    REVCHG35                 N12P2F.                                  
      @618    REVCHG36                 N12P2F.                                  
      @630    REVCHG37                 N12P2F.                                  
      @642    REVCHG38                 N12P2F.                                  
      @654    REVCHG39                 N12P2F.                                  
      @666    REVCHG40                 N12P2F.                                  
      @678    REVCHG41                 N12P2F.                                  
      @690    REVCHG42                 N12P2F.                                  
      @702    REVCHG43                 N12P2F.                                  
      @714    REVCHG44                 N12P2F.                                  
      @726    REVCHG45                 N12P2F.                                  
      @738    UNIT1                    N8P2F.                                   
      @746    UNIT2                    N8P2F.                                   
      @754    UNIT3                    N8P2F.                                   
      @762    UNIT4                    N8P2F.                                   
      @770    UNIT5                    N8P2F.                                   
      @778    UNIT6                    N8P2F.                                   
      @786    UNIT7                    N8P2F.                                   
      @794    UNIT8                    N8P2F.                                   
      @802    UNIT9                    N8P2F.                                   
      @810    UNIT10                   N8P2F.                                   
      @818    UNIT11                   N8P2F.                                   
      @826    UNIT12                   N8P2F.                                   
      @834    UNIT13                   N8P2F.                                   
      @842    UNIT14                   N8P2F.                                   
      @850    UNIT15                   N8P2F.                                   
      @858    UNIT16                   N8P2F.                                   
      @866    UNIT17                   N8P2F.                                   
      @874    UNIT18                   N8P2F.                                   
      @882    UNIT19                   N8P2F.                                   
      @890    UNIT20                   N8P2F.                                   
      @898    UNIT21                   N8P2F.                                   
      @906    UNIT22                   N8P2F.                                   
      @914    UNIT23                   N8P2F.                                   
      @922    UNIT24                   N8P2F.                                   
      @930    UNIT25                   N8P2F.                                   
      @938    UNIT26                   N8P2F.                                   
      @946    UNIT27                   N8P2F.                                   
      @954    UNIT28                   N8P2F.                                   
      @962    UNIT29                   N8P2F.                                   
      @970    UNIT30                   N8P2F.                                   
      @978    UNIT31                   N8P2F.                                   
      @986    UNIT32                   N8P2F.                                   
      @994    UNIT33                   N8P2F.                                   
      @1002   UNIT34                   N8P2F.                                   
      @1010   UNIT35                   N8P2F.                                   
      @1018   UNIT36                   N8P2F.                                   
      @1026   UNIT37                   N8P2F.                                   
      @1034   UNIT38                   N8P2F.                                   
      @1042   UNIT39                   N8P2F.                                   
      @1050   UNIT40                   N8P2F.                                   
      @1058   UNIT41                   N8P2F.                                   
      @1066   UNIT42                   N8P2F.                                   
      @1074   UNIT43                   N8P2F.                                   
      @1082   UNIT44                   N8P2F.                                   
      @1090   UNIT45                   N8P2F.                                   
      ;                                                                         
                                                                                
                                                                                
RUN;
