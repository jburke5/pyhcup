/*******************************************************************            
*   NE_SEDD_2006_CHGS.SAS:                                                      
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
DATA NE_SEDDC_2006_CHGS;                                                        
INFILE 'NE_SEDD_2006_CHGS.ASC' LRECL = 592;                                     
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  KEY                        LENGTH=8                 FORMAT=Z14.               
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
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      KEY                      14.                                      
      @15     NREVCD                   N2PF.                                    
      @17     REVCD1                   $CHAR4.                                  
      @21     REVCD2                   $CHAR4.                                  
      @25     REVCD3                   $CHAR4.                                  
      @29     REVCD4                   $CHAR4.                                  
      @33     REVCD5                   $CHAR4.                                  
      @37     REVCD6                   $CHAR4.                                  
      @41     REVCD7                   $CHAR4.                                  
      @45     REVCD8                   $CHAR4.                                  
      @49     REVCD9                   $CHAR4.                                  
      @53     REVCD10                  $CHAR4.                                  
      @57     REVCD11                  $CHAR4.                                  
      @61     REVCD12                  $CHAR4.                                  
      @65     REVCD13                  $CHAR4.                                  
      @69     REVCD14                  $CHAR4.                                  
      @73     REVCD15                  $CHAR4.                                  
      @77     REVCD16                  $CHAR4.                                  
      @81     REVCD17                  $CHAR4.                                  
      @85     REVCD18                  $CHAR4.                                  
      @89     REVCD19                  $CHAR4.                                  
      @93     REVCD20                  $CHAR4.                                  
      @97     REVCD21                  $CHAR4.                                  
      @101    REVCD22                  $CHAR4.                                  
      @105    REVCD23                  $CHAR4.                                  
      @109    REVCD24                  $CHAR4.                                  
      @113    REVCHG1                  N12P2F.                                  
      @125    REVCHG2                  N12P2F.                                  
      @137    REVCHG3                  N12P2F.                                  
      @149    REVCHG4                  N12P2F.                                  
      @161    REVCHG5                  N12P2F.                                  
      @173    REVCHG6                  N12P2F.                                  
      @185    REVCHG7                  N12P2F.                                  
      @197    REVCHG8                  N12P2F.                                  
      @209    REVCHG9                  N12P2F.                                  
      @221    REVCHG10                 N12P2F.                                  
      @233    REVCHG11                 N12P2F.                                  
      @245    REVCHG12                 N12P2F.                                  
      @257    REVCHG13                 N12P2F.                                  
      @269    REVCHG14                 N12P2F.                                  
      @281    REVCHG15                 N12P2F.                                  
      @293    REVCHG16                 N12P2F.                                  
      @305    REVCHG17                 N12P2F.                                  
      @317    REVCHG18                 N12P2F.                                  
      @329    REVCHG19                 N12P2F.                                  
      @341    REVCHG20                 N12P2F.                                  
      @353    REVCHG21                 N12P2F.                                  
      @365    REVCHG22                 N12P2F.                                  
      @377    REVCHG23                 N12P2F.                                  
      @389    REVCHG24                 N12P2F.                                  
      @401    UNIT1                    N8PF.                                    
      @409    UNIT2                    N8PF.                                    
      @417    UNIT3                    N8PF.                                    
      @425    UNIT4                    N8PF.                                    
      @433    UNIT5                    N8PF.                                    
      @441    UNIT6                    N8PF.                                    
      @449    UNIT7                    N8PF.                                    
      @457    UNIT8                    N8PF.                                    
      @465    UNIT9                    N8PF.                                    
      @473    UNIT10                   N8PF.                                    
      @481    UNIT11                   N8PF.                                    
      @489    UNIT12                   N8PF.                                    
      @497    UNIT13                   N8PF.                                    
      @505    UNIT14                   N8PF.                                    
      @513    UNIT15                   N8PF.                                    
      @521    UNIT16                   N8PF.                                    
      @529    UNIT17                   N8PF.                                    
      @537    UNIT18                   N8PF.                                    
      @545    UNIT19                   N8PF.                                    
      @553    UNIT20                   N8PF.                                    
      @561    UNIT21                   N8PF.                                    
      @569    UNIT22                   N8PF.                                    
      @577    UNIT23                   N8PF.                                    
      @585    UNIT24                   N8PF.                                    
      ;                                                                         
                                                                                
                                                                                
RUN;
