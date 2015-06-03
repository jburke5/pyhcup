/*******************************************************************            
*   SD_SID_2008_CORE.SAS:                                                       
*      THE SAS CODE SHOWN BELOW WILL LOAD THE ASCII                             
*      INPATIENT STAY CORE FILE INTO SAS                                        
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
DATA SD_SIDC_2008_CORE;                                                         
INFILE 'SD_SID_2008_CORE.ASC' LRECL = 1728;                                     
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  AGE                        LENGTH=3                                           
  LABEL="Age in years at admission"                                             
                                                                                
  AGEDAY                     LENGTH=3                                           
  LABEL="Age in days (when age < 1 year)"                                       
                                                                                
  AGEMONTH                   LENGTH=3                                           
  LABEL="Age in months (when age < 11 years)"                                   
                                                                                
  AMONTH                     LENGTH=3                                           
  LABEL="Admission month"                                                       
                                                                                
  ATYPE                      LENGTH=3                                           
  LABEL="Admission type"                                                        
                                                                                
  AWEEKEND                   LENGTH=3                                           
  LABEL="Admission day is a weekend"                                            
                                                                                
  DIED                       LENGTH=3                                           
  LABEL="Died during hospitalization"                                           
                                                                                
  DISPUB04                   LENGTH=3                                           
  LABEL="Disposition of patient (UB-04 standard coding)"                        
                                                                                
  DISPUNIFORM                LENGTH=3                                           
  LABEL="Disposition of patient (uniform)"                                      
                                                                                
  DISP_X                     LENGTH=$4                                          
  LABEL="Disposition of patient (as received from source)"                      
                                                                                
  DQTR                       LENGTH=3                                           
  LABEL="Discharge quarter"                                                     
                                                                                
  DRG                        LENGTH=3                                           
  LABEL="DRG in effect on discharge date"                                       
                                                                                
  DRG24                      LENGTH=3                                           
  LABEL="DRG, version 24"                                                       
                                                                                
  DRGVER                     LENGTH=3                                           
  LABEL="DRG grouper version used on discharge date"                            
                                                                                
  DRG_NoPOA                  LENGTH=3                                           
  LABEL="DRG in use on discharge date, calculated without POA"                  
                                                                                
  DX1                        LENGTH=$5                                          
  LABEL="Diagnosis 1"                                                           
                                                                                
  DX2                        LENGTH=$5                                          
  LABEL="Diagnosis 2"                                                           
                                                                                
  DX3                        LENGTH=$5                                          
  LABEL="Diagnosis 3"                                                           
                                                                                
  DX4                        LENGTH=$5                                          
  LABEL="Diagnosis 4"                                                           
                                                                                
  DX5                        LENGTH=$5                                          
  LABEL="Diagnosis 5"                                                           
                                                                                
  DX6                        LENGTH=$5                                          
  LABEL="Diagnosis 6"                                                           
                                                                                
  DX7                        LENGTH=$5                                          
  LABEL="Diagnosis 7"                                                           
                                                                                
  DX8                        LENGTH=$5                                          
  LABEL="Diagnosis 8"                                                           
                                                                                
  DX9                        LENGTH=$5                                          
  LABEL="Diagnosis 9"                                                           
                                                                                
  DX10                       LENGTH=$5                                          
  LABEL="Diagnosis 10"                                                          
                                                                                
  DX11                       LENGTH=$5                                          
  LABEL="Diagnosis 11"                                                          
                                                                                
  DX12                       LENGTH=$5                                          
  LABEL="Diagnosis 12"                                                          
                                                                                
  DX13                       LENGTH=$5                                          
  LABEL="Diagnosis 13"                                                          
                                                                                
  DX14                       LENGTH=$5                                          
  LABEL="Diagnosis 14"                                                          
                                                                                
  DX15                       LENGTH=$5                                          
  LABEL="Diagnosis 15"                                                          
                                                                                
  DX16                       LENGTH=$5                                          
  LABEL="Diagnosis 16"                                                          
                                                                                
  DX17                       LENGTH=$5                                          
  LABEL="Diagnosis 17"                                                          
                                                                                
  DX18                       LENGTH=$5                                          
  LABEL="Diagnosis 18"                                                          
                                                                                
  DX19                       LENGTH=$5                                          
  LABEL="Diagnosis 19"                                                          
                                                                                
  DX20                       LENGTH=$5                                          
  LABEL="Diagnosis 20"                                                          
                                                                                
  DX21                       LENGTH=$5                                          
  LABEL="Diagnosis 21"                                                          
                                                                                
  DX22                       LENGTH=$5                                          
  LABEL="Diagnosis 22"                                                          
                                                                                
  DX23                       LENGTH=$5                                          
  LABEL="Diagnosis 23"                                                          
                                                                                
  DX24                       LENGTH=$5                                          
  LABEL="Diagnosis 24"                                                          
                                                                                
  DX25                       LENGTH=$5                                          
  LABEL="Diagnosis 25"                                                          
                                                                                
  DX26                       LENGTH=$5                                          
  LABEL="Diagnosis 26"                                                          
                                                                                
  DX27                       LENGTH=$5                                          
  LABEL="Diagnosis 27"                                                          
                                                                                
  DX28                       LENGTH=$5                                          
  LABEL="Diagnosis 28"                                                          
                                                                                
  DX29                       LENGTH=$5                                          
  LABEL="Diagnosis 29"                                                          
                                                                                
  DX30                       LENGTH=$5                                          
  LABEL="Diagnosis 30"                                                          
                                                                                
  DX31                       LENGTH=$5                                          
  LABEL="Diagnosis 31"                                                          
                                                                                
  DX32                       LENGTH=$5                                          
  LABEL="Diagnosis 32"                                                          
                                                                                
  DX33                       LENGTH=$5                                          
  LABEL="Diagnosis 33"                                                          
                                                                                
  DX34                       LENGTH=$5                                          
  LABEL="Diagnosis 34"                                                          
                                                                                
  DX35                       LENGTH=$5                                          
  LABEL="Diagnosis 35"                                                          
                                                                                
  DX36                       LENGTH=$5                                          
  LABEL="Diagnosis 36"                                                          
                                                                                
  DX37                       LENGTH=$5                                          
  LABEL="Diagnosis 37"                                                          
                                                                                
  DX38                       LENGTH=$5                                          
  LABEL="Diagnosis 38"                                                          
                                                                                
  DX39                       LENGTH=$5                                          
  LABEL="Diagnosis 39"                                                          
                                                                                
  DX40                       LENGTH=$5                                          
  LABEL="Diagnosis 40"                                                          
                                                                                
  DX41                       LENGTH=$5                                          
  LABEL="Diagnosis 41"                                                          
                                                                                
  DX42                       LENGTH=$5                                          
  LABEL="Diagnosis 42"                                                          
                                                                                
  DX43                       LENGTH=$5                                          
  LABEL="Diagnosis 43"                                                          
                                                                                
  DX44                       LENGTH=$5                                          
  LABEL="Diagnosis 44"                                                          
                                                                                
  DX45                       LENGTH=$5                                          
  LABEL="Diagnosis 45"                                                          
                                                                                
  DX46                       LENGTH=$5                                          
  LABEL="Diagnosis 46"                                                          
                                                                                
  DX47                       LENGTH=$5                                          
  LABEL="Diagnosis 47"                                                          
                                                                                
  DX48                       LENGTH=$5                                          
  LABEL="Diagnosis 48"                                                          
                                                                                
  DX49                       LENGTH=$5                                          
  LABEL="Diagnosis 49"                                                          
                                                                                
  DX50                       LENGTH=$5                                          
  LABEL="Diagnosis 50"                                                          
                                                                                
  DX51                       LENGTH=$5                                          
  LABEL="Diagnosis 51"                                                          
                                                                                
  DX52                       LENGTH=$5                                          
  LABEL="Diagnosis 52"                                                          
                                                                                
  DX53                       LENGTH=$5                                          
  LABEL="Diagnosis 53"                                                          
                                                                                
  DX54                       LENGTH=$5                                          
  LABEL="Diagnosis 54"                                                          
                                                                                
  DX55                       LENGTH=$5                                          
  LABEL="Diagnosis 55"                                                          
                                                                                
  DX56                       LENGTH=$5                                          
  LABEL="Diagnosis 56"                                                          
                                                                                
  DX57                       LENGTH=$5                                          
  LABEL="Diagnosis 57"                                                          
                                                                                
  DX58                       LENGTH=$5                                          
  LABEL="Diagnosis 58"                                                          
                                                                                
  DX59                       LENGTH=$5                                          
  LABEL="Diagnosis 59"                                                          
                                                                                
  DX60                       LENGTH=$5                                          
  LABEL="Diagnosis 60"                                                          
                                                                                
  DX61                       LENGTH=$5                                          
  LABEL="Diagnosis 61"                                                          
                                                                                
  DXCCS1                     LENGTH=4                                           
  LABEL="CCS: diagnosis 1"                                                      
                                                                                
  DXCCS2                     LENGTH=4                                           
  LABEL="CCS: diagnosis 2"                                                      
                                                                                
  DXCCS3                     LENGTH=4                                           
  LABEL="CCS: diagnosis 3"                                                      
                                                                                
  DXCCS4                     LENGTH=4                                           
  LABEL="CCS: diagnosis 4"                                                      
                                                                                
  DXCCS5                     LENGTH=4                                           
  LABEL="CCS: diagnosis 5"                                                      
                                                                                
  DXCCS6                     LENGTH=4                                           
  LABEL="CCS: diagnosis 6"                                                      
                                                                                
  DXCCS7                     LENGTH=4                                           
  LABEL="CCS: diagnosis 7"                                                      
                                                                                
  DXCCS8                     LENGTH=4                                           
  LABEL="CCS: diagnosis 8"                                                      
                                                                                
  DXCCS9                     LENGTH=4                                           
  LABEL="CCS: diagnosis 9"                                                      
                                                                                
  DXCCS10                    LENGTH=4                                           
  LABEL="CCS: diagnosis 10"                                                     
                                                                                
  DXCCS11                    LENGTH=4                                           
  LABEL="CCS: diagnosis 11"                                                     
                                                                                
  DXCCS12                    LENGTH=4                                           
  LABEL="CCS: diagnosis 12"                                                     
                                                                                
  DXCCS13                    LENGTH=4                                           
  LABEL="CCS: diagnosis 13"                                                     
                                                                                
  DXCCS14                    LENGTH=4                                           
  LABEL="CCS: diagnosis 14"                                                     
                                                                                
  DXCCS15                    LENGTH=4                                           
  LABEL="CCS: diagnosis 15"                                                     
                                                                                
  DXCCS16                    LENGTH=4                                           
  LABEL="CCS: diagnosis 16"                                                     
                                                                                
  DXCCS17                    LENGTH=4                                           
  LABEL="CCS: diagnosis 17"                                                     
                                                                                
  DXCCS18                    LENGTH=4                                           
  LABEL="CCS: diagnosis 18"                                                     
                                                                                
  DXCCS19                    LENGTH=4                                           
  LABEL="CCS: diagnosis 19"                                                     
                                                                                
  DXCCS20                    LENGTH=4                                           
  LABEL="CCS: diagnosis 20"                                                     
                                                                                
  DXCCS21                    LENGTH=4                                           
  LABEL="CCS: diagnosis 21"                                                     
                                                                                
  DXCCS22                    LENGTH=4                                           
  LABEL="CCS: diagnosis 22"                                                     
                                                                                
  DXCCS23                    LENGTH=4                                           
  LABEL="CCS: diagnosis 23"                                                     
                                                                                
  DXCCS24                    LENGTH=4                                           
  LABEL="CCS: diagnosis 24"                                                     
                                                                                
  DXCCS25                    LENGTH=4                                           
  LABEL="CCS: diagnosis 25"                                                     
                                                                                
  DXCCS26                    LENGTH=4                                           
  LABEL="CCS: diagnosis 26"                                                     
                                                                                
  DXCCS27                    LENGTH=4                                           
  LABEL="CCS: diagnosis 27"                                                     
                                                                                
  DXCCS28                    LENGTH=4                                           
  LABEL="CCS: diagnosis 28"                                                     
                                                                                
  DXCCS29                    LENGTH=4                                           
  LABEL="CCS: diagnosis 29"                                                     
                                                                                
  DXCCS30                    LENGTH=4                                           
  LABEL="CCS: diagnosis 30"                                                     
                                                                                
  DXCCS31                    LENGTH=4                                           
  LABEL="CCS: diagnosis 31"                                                     
                                                                                
  DXCCS32                    LENGTH=4                                           
  LABEL="CCS: diagnosis 32"                                                     
                                                                                
  DXCCS33                    LENGTH=4                                           
  LABEL="CCS: diagnosis 33"                                                     
                                                                                
  DXCCS34                    LENGTH=4                                           
  LABEL="CCS: diagnosis 34"                                                     
                                                                                
  DXCCS35                    LENGTH=4                                           
  LABEL="CCS: diagnosis 35"                                                     
                                                                                
  DXCCS36                    LENGTH=4                                           
  LABEL="CCS: diagnosis 36"                                                     
                                                                                
  DXCCS37                    LENGTH=4                                           
  LABEL="CCS: diagnosis 37"                                                     
                                                                                
  DXCCS38                    LENGTH=4                                           
  LABEL="CCS: diagnosis 38"                                                     
                                                                                
  DXCCS39                    LENGTH=4                                           
  LABEL="CCS: diagnosis 39"                                                     
                                                                                
  DXCCS40                    LENGTH=4                                           
  LABEL="CCS: diagnosis 40"                                                     
                                                                                
  DXCCS41                    LENGTH=4                                           
  LABEL="CCS: diagnosis 41"                                                     
                                                                                
  DXCCS42                    LENGTH=4                                           
  LABEL="CCS: diagnosis 42"                                                     
                                                                                
  DXCCS43                    LENGTH=4                                           
  LABEL="CCS: diagnosis 43"                                                     
                                                                                
  DXCCS44                    LENGTH=4                                           
  LABEL="CCS: diagnosis 44"                                                     
                                                                                
  DXCCS45                    LENGTH=4                                           
  LABEL="CCS: diagnosis 45"                                                     
                                                                                
  DXCCS46                    LENGTH=4                                           
  LABEL="CCS: diagnosis 46"                                                     
                                                                                
  DXCCS47                    LENGTH=4                                           
  LABEL="CCS: diagnosis 47"                                                     
                                                                                
  DXCCS48                    LENGTH=4                                           
  LABEL="CCS: diagnosis 48"                                                     
                                                                                
  DXCCS49                    LENGTH=4                                           
  LABEL="CCS: diagnosis 49"                                                     
                                                                                
  DXCCS50                    LENGTH=4                                           
  LABEL="CCS: diagnosis 50"                                                     
                                                                                
  DXCCS51                    LENGTH=4                                           
  LABEL="CCS: diagnosis 51"                                                     
                                                                                
  DXCCS52                    LENGTH=4                                           
  LABEL="CCS: diagnosis 52"                                                     
                                                                                
  DXCCS53                    LENGTH=4                                           
  LABEL="CCS: diagnosis 53"                                                     
                                                                                
  DXCCS54                    LENGTH=4                                           
  LABEL="CCS: diagnosis 54"                                                     
                                                                                
  DXCCS55                    LENGTH=4                                           
  LABEL="CCS: diagnosis 55"                                                     
                                                                                
  DXCCS56                    LENGTH=4                                           
  LABEL="CCS: diagnosis 56"                                                     
                                                                                
  DXCCS57                    LENGTH=4                                           
  LABEL="CCS: diagnosis 57"                                                     
                                                                                
  DXCCS58                    LENGTH=4                                           
  LABEL="CCS: diagnosis 58"                                                     
                                                                                
  DXCCS59                    LENGTH=4                                           
  LABEL="CCS: diagnosis 59"                                                     
                                                                                
  DXCCS60                    LENGTH=4                                           
  LABEL="CCS: diagnosis 60"                                                     
                                                                                
  DXCCS61                    LENGTH=4                                           
  LABEL="CCS: diagnosis 61"                                                     
                                                                                
  DXPOA1                     LENGTH=$1                                          
  LABEL="Diagnosis 1, present on admission indicator"                           
                                                                                
  DXPOA2                     LENGTH=$1                                          
  LABEL="Diagnosis 2, present on admission indicator"                           
                                                                                
  DXPOA3                     LENGTH=$1                                          
  LABEL="Diagnosis 3, present on admission indicator"                           
                                                                                
  DXPOA4                     LENGTH=$1                                          
  LABEL="Diagnosis 4, present on admission indicator"                           
                                                                                
  DXPOA5                     LENGTH=$1                                          
  LABEL="Diagnosis 5, present on admission indicator"                           
                                                                                
  DXPOA6                     LENGTH=$1                                          
  LABEL="Diagnosis 6, present on admission indicator"                           
                                                                                
  DXPOA7                     LENGTH=$1                                          
  LABEL="Diagnosis 7, present on admission indicator"                           
                                                                                
  DXPOA8                     LENGTH=$1                                          
  LABEL="Diagnosis 8, present on admission indicator"                           
                                                                                
  DXPOA9                     LENGTH=$1                                          
  LABEL="Diagnosis 9, present on admission indicator"                           
                                                                                
  DXPOA10                    LENGTH=$1                                          
  LABEL="Diagnosis 10, present on admission indicator"                          
                                                                                
  DXPOA11                    LENGTH=$1                                          
  LABEL="Diagnosis 11, present on admission indicator"                          
                                                                                
  DXPOA12                    LENGTH=$1                                          
  LABEL="Diagnosis 12, present on admission indicator"                          
                                                                                
  DXPOA13                    LENGTH=$1                                          
  LABEL="Diagnosis 13, present on admission indicator"                          
                                                                                
  DXPOA14                    LENGTH=$1                                          
  LABEL="Diagnosis 14, present on admission indicator"                          
                                                                                
  DXPOA15                    LENGTH=$1                                          
  LABEL="Diagnosis 15, present on admission indicator"                          
                                                                                
  DXPOA16                    LENGTH=$1                                          
  LABEL="Diagnosis 16, present on admission indicator"                          
                                                                                
  DXPOA17                    LENGTH=$1                                          
  LABEL="Diagnosis 17, present on admission indicator"                          
                                                                                
  DXPOA18                    LENGTH=$1                                          
  LABEL="Diagnosis 18, present on admission indicator"                          
                                                                                
  DXPOA19                    LENGTH=$1                                          
  LABEL="Diagnosis 19, present on admission indicator"                          
                                                                                
  DXPOA20                    LENGTH=$1                                          
  LABEL="Diagnosis 20, present on admission indicator"                          
                                                                                
  DXPOA21                    LENGTH=$1                                          
  LABEL="Diagnosis 21, present on admission indicator"                          
                                                                                
  DXPOA22                    LENGTH=$1                                          
  LABEL="Diagnosis 22, present on admission indicator"                          
                                                                                
  DXPOA23                    LENGTH=$1                                          
  LABEL="Diagnosis 23, present on admission indicator"                          
                                                                                
  DXPOA24                    LENGTH=$1                                          
  LABEL="Diagnosis 24, present on admission indicator"                          
                                                                                
  DXPOA25                    LENGTH=$1                                          
  LABEL="Diagnosis 25, present on admission indicator"                          
                                                                                
  DXPOA26                    LENGTH=$1                                          
  LABEL="Diagnosis 26, present on admission indicator"                          
                                                                                
  DXPOA27                    LENGTH=$1                                          
  LABEL="Diagnosis 27, present on admission indicator"                          
                                                                                
  DXPOA28                    LENGTH=$1                                          
  LABEL="Diagnosis 28, present on admission indicator"                          
                                                                                
  DXPOA29                    LENGTH=$1                                          
  LABEL="Diagnosis 29, present on admission indicator"                          
                                                                                
  DXPOA30                    LENGTH=$1                                          
  LABEL="Diagnosis 30, present on admission indicator"                          
                                                                                
  DXPOA31                    LENGTH=$1                                          
  LABEL="Diagnosis 31, present on admission indicator"                          
                                                                                
  DXPOA32                    LENGTH=$1                                          
  LABEL="Diagnosis 32, present on admission indicator"                          
                                                                                
  DXPOA33                    LENGTH=$1                                          
  LABEL="Diagnosis 33, present on admission indicator"                          
                                                                                
  DXPOA34                    LENGTH=$1                                          
  LABEL="Diagnosis 34, present on admission indicator"                          
                                                                                
  DXPOA35                    LENGTH=$1                                          
  LABEL="Diagnosis 35, present on admission indicator"                          
                                                                                
  DXPOA36                    LENGTH=$1                                          
  LABEL="Diagnosis 36, present on admission indicator"                          
                                                                                
  DXPOA37                    LENGTH=$1                                          
  LABEL="Diagnosis 37, present on admission indicator"                          
                                                                                
  DXPOA38                    LENGTH=$1                                          
  LABEL="Diagnosis 38, present on admission indicator"                          
                                                                                
  DXPOA39                    LENGTH=$1                                          
  LABEL="Diagnosis 39, present on admission indicator"                          
                                                                                
  DXPOA40                    LENGTH=$1                                          
  LABEL="Diagnosis 40, present on admission indicator"                          
                                                                                
  DXPOA41                    LENGTH=$1                                          
  LABEL="Diagnosis 41, present on admission indicator"                          
                                                                                
  DXPOA42                    LENGTH=$1                                          
  LABEL="Diagnosis 42, present on admission indicator"                          
                                                                                
  DXPOA43                    LENGTH=$1                                          
  LABEL="Diagnosis 43, present on admission indicator"                          
                                                                                
  DXPOA44                    LENGTH=$1                                          
  LABEL="Diagnosis 44, present on admission indicator"                          
                                                                                
  DXPOA45                    LENGTH=$1                                          
  LABEL="Diagnosis 45, present on admission indicator"                          
                                                                                
  DXPOA46                    LENGTH=$1                                          
  LABEL="Diagnosis 46, present on admission indicator"                          
                                                                                
  DXPOA47                    LENGTH=$1                                          
  LABEL="Diagnosis 47, present on admission indicator"                          
                                                                                
  DXPOA48                    LENGTH=$1                                          
  LABEL="Diagnosis 48, present on admission indicator"                          
                                                                                
  DXPOA49                    LENGTH=$1                                          
  LABEL="Diagnosis 49, present on admission indicator"                          
                                                                                
  DXPOA50                    LENGTH=$1                                          
  LABEL="Diagnosis 50, present on admission indicator"                          
                                                                                
  DXPOA51                    LENGTH=$1                                          
  LABEL="Diagnosis 51, present on admission indicator"                          
                                                                                
  DXPOA52                    LENGTH=$1                                          
  LABEL="Diagnosis 52, present on admission indicator"                          
                                                                                
  DXPOA53                    LENGTH=$1                                          
  LABEL="Diagnosis 53, present on admission indicator"                          
                                                                                
  DXPOA54                    LENGTH=$1                                          
  LABEL="Diagnosis 54, present on admission indicator"                          
                                                                                
  DXPOA55                    LENGTH=$1                                          
  LABEL="Diagnosis 55, present on admission indicator"                          
                                                                                
  DXPOA56                    LENGTH=$1                                          
  LABEL="Diagnosis 56, present on admission indicator"                          
                                                                                
  DXPOA57                    LENGTH=$1                                          
  LABEL="Diagnosis 57, present on admission indicator"                          
                                                                                
  DXPOA58                    LENGTH=$1                                          
  LABEL="Diagnosis 58, present on admission indicator"                          
                                                                                
  DXPOA59                    LENGTH=$1                                          
  LABEL="Diagnosis 59, present on admission indicator"                          
                                                                                
  DXPOA60                    LENGTH=$1                                          
  LABEL="Diagnosis 60, present on admission indicator"                          
                                                                                
  DXPOA61                    LENGTH=$1                                          
  LABEL="Diagnosis 61, present on admission indicator"                          
                                                                                
  ECODE1                     LENGTH=$5                                          
  LABEL="E code 1"                                                              
                                                                                
  ECODE2                     LENGTH=$5                                          
  LABEL="E code 2"                                                              
                                                                                
  ECODE3                     LENGTH=$5                                          
  LABEL="E code 3"                                                              
                                                                                
  ECODE4                     LENGTH=$5                                          
  LABEL="E code 4"                                                              
                                                                                
  ECODE5                     LENGTH=$5                                          
  LABEL="E code 5"                                                              
                                                                                
  ECODE6                     LENGTH=$5                                          
  LABEL="E code 6"                                                              
                                                                                
  E_CCS1                     LENGTH=3                                           
  LABEL="CCS: E Code 1"                                                         
                                                                                
  E_CCS2                     LENGTH=3                                           
  LABEL="CCS: E Code 2"                                                         
                                                                                
  E_CCS3                     LENGTH=3                                           
  LABEL="CCS: E Code 3"                                                         
                                                                                
  E_CCS4                     LENGTH=3                                           
  LABEL="CCS: E Code 4"                                                         
                                                                                
  E_CCS5                     LENGTH=3                                           
  LABEL="CCS: E Code 5"                                                         
                                                                                
  E_CCS6                     LENGTH=3                                           
  LABEL="CCS: E Code 6"                                                         
                                                                                
  E_POA1                     LENGTH=$1                                          
  LABEL="E Code 1, present on admission indicator"                              
                                                                                
  E_POA2                     LENGTH=$1                                          
  LABEL="E Code 2, present on admission indicator"                              
                                                                                
  E_POA3                     LENGTH=$1                                          
  LABEL="E Code 3, present on admission indicator"                              
                                                                                
  E_POA4                     LENGTH=$1                                          
  LABEL="E Code 4, present on admission indicator"                              
                                                                                
  E_POA5                     LENGTH=$1                                          
  LABEL="E Code 5, present on admission indicator"                              
                                                                                
  E_POA6                     LENGTH=$1                                          
  LABEL="E Code 6, present on admission indicator"                              
                                                                                
  FEMALE                     LENGTH=3                                           
  LABEL="Indicator of sex"                                                      
                                                                                
  HCUP_ED                    LENGTH=3                                           
  LABEL="HCUP Emergency Department service indicator"                           
                                                                                
  HCUP_OS                    LENGTH=3                                           
  LABEL="HCUP Observation Stay service indicator"                               
                                                                                
  HOSPBRTH                   LENGTH=3                                           
  LABEL="Indicator of birth in this hospital"                                   
                                                                                
  HOSPST                     LENGTH=$2                                          
  LABEL="Hospital state postal code"                                            
                                                                                
  HospitalUnit               LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indicator that patient was discharged from a special unit within an acute care 
hospital (reported by source)"                                                  
                                                                                
  KEY                        LENGTH=8                 FORMAT=Z14.               
  LABEL="HCUP record identifier"                                                
                                                                                
  LOS                        LENGTH=4                                           
  LABEL="Length of stay (cleaned)"                                              
                                                                                
  LOS_X                      LENGTH=4                                           
  LABEL="Length of stay (as received from source)"                              
                                                                                
  MDC                        LENGTH=3                                           
  LABEL="MDC in effect on discharge date"                                       
                                                                                
  MDC24                      LENGTH=3                                           
  LABEL="MDC, version 24"                                                       
                                                                                
  MDNUM1_R                   LENGTH=5                                           
  LABEL="Physician 1 number (re-identified)"                                    
                                                                                
  MDNUM2_R                   LENGTH=5                                           
  LABEL="Physician 2 number (re-identified)"                                    
                                                                                
  MDNUM3_R                   LENGTH=5                                           
  LABEL="Physician 3 number (re-identified)"                                    
                                                                                
  MEDINCSTQ                  LENGTH=3                                           
  LABEL="Median household income state quartile for patient ZIP Code"           
                                                                                
  MRN_R                      LENGTH=5                                           
  LABEL="Medical record number (re-identified)"                                 
                                                                                
  NDX                        LENGTH=3                                           
  LABEL="Number of diagnoses on this record"                                    
                                                                                
  NECODE                     LENGTH=3                                           
  LABEL="Number of E codes on this record"                                      
                                                                                
  NEOMAT                     LENGTH=3                                           
  LABEL="Neonatal and/or maternal DX and/or PR"                                 
                                                                                
  NPR                        LENGTH=3                                           
  LABEL="Number of procedures on this record"                                   
                                                                                
  PAY1                       LENGTH=3                                           
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PL_CBSA                    LENGTH=3                                           
  LABEL="Patient location: Core Based Statistical Area (CBSA)"                  
                                                                                
  PL_MSA1993                 LENGTH=3                                           
  LABEL="Patient location: Metropolitan Statistical Area (MSA), 1993"           
                                                                                
  PL_NCHS2006                LENGTH=3                                           
  LABEL="Patient Location: NCHS Urban-Rural Code (V2006)"                       
                                                                                
  PL_RUCA10_2005             LENGTH=3                                           
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes, ten levels" 
                                                                                
  PL_RUCA2005                LENGTH=4                 FORMAT=4.1                
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes"             
                                                                                
  PL_RUCA4_2005              LENGTH=3                                           
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes, four levels"
                                                                                
  PL_RUCC2003                LENGTH=3                                           
  LABEL="Patient location: Rural-Urban Continuum Codes(RUCC), 2003"             
                                                                                
  PL_UIC2003                 LENGTH=3                                           
  LABEL="Patient location: Urban Influence Codes, 2003"                         
                                                                                
  PL_UR_CAT4                 LENGTH=3                                           
  LABEL="Patient Location: Urban-Rural 4 Categories"                            
                                                                                
  PR1                        LENGTH=$4                                          
  LABEL="Procedure 1"                                                           
                                                                                
  PR2                        LENGTH=$4                                          
  LABEL="Procedure 2"                                                           
                                                                                
  PR3                        LENGTH=$4                                          
  LABEL="Procedure 3"                                                           
                                                                                
  PR4                        LENGTH=$4                                          
  LABEL="Procedure 4"                                                           
                                                                                
  PR5                        LENGTH=$4                                          
  LABEL="Procedure 5"                                                           
                                                                                
  PR6                        LENGTH=$4                                          
  LABEL="Procedure 6"                                                           
                                                                                
  PR7                        LENGTH=$4                                          
  LABEL="Procedure 7"                                                           
                                                                                
  PR8                        LENGTH=$4                                          
  LABEL="Procedure 8"                                                           
                                                                                
  PR9                        LENGTH=$4                                          
  LABEL="Procedure 9"                                                           
                                                                                
  PR10                       LENGTH=$4                                          
  LABEL="Procedure 10"                                                          
                                                                                
  PR11                       LENGTH=$4                                          
  LABEL="Procedure 11"                                                          
                                                                                
  PR12                       LENGTH=$4                                          
  LABEL="Procedure 12"                                                          
                                                                                
  PR13                       LENGTH=$4                                          
  LABEL="Procedure 13"                                                          
                                                                                
  PR14                       LENGTH=$4                                          
  LABEL="Procedure 14"                                                          
                                                                                
  PR15                       LENGTH=$4                                          
  LABEL="Procedure 15"                                                          
                                                                                
  PR16                       LENGTH=$4                                          
  LABEL="Procedure 16"                                                          
                                                                                
  PR17                       LENGTH=$4                                          
  LABEL="Procedure 17"                                                          
                                                                                
  PR18                       LENGTH=$4                                          
  LABEL="Procedure 18"                                                          
                                                                                
  PR19                       LENGTH=$4                                          
  LABEL="Procedure 19"                                                          
                                                                                
  PR20                       LENGTH=$4                                          
  LABEL="Procedure 20"                                                          
                                                                                
  PR21                       LENGTH=$4                                          
  LABEL="Procedure 21"                                                          
                                                                                
  PR22                       LENGTH=$4                                          
  LABEL="Procedure 22"                                                          
                                                                                
  PR23                       LENGTH=$4                                          
  LABEL="Procedure 23"                                                          
                                                                                
  PR24                       LENGTH=$4                                          
  LABEL="Procedure 24"                                                          
                                                                                
  PR25                       LENGTH=$4                                          
  LABEL="Procedure 25"                                                          
                                                                                
  PR26                       LENGTH=$4                                          
  LABEL="Procedure 26"                                                          
                                                                                
  PR27                       LENGTH=$4                                          
  LABEL="Procedure 27"                                                          
                                                                                
  PR28                       LENGTH=$4                                          
  LABEL="Procedure 28"                                                          
                                                                                
  PR29                       LENGTH=$4                                          
  LABEL="Procedure 29"                                                          
                                                                                
  PR30                       LENGTH=$4                                          
  LABEL="Procedure 30"                                                          
                                                                                
  PR31                       LENGTH=$4                                          
  LABEL="Procedure 31"                                                          
                                                                                
  PR32                       LENGTH=$4                                          
  LABEL="Procedure 32"                                                          
                                                                                
  PR33                       LENGTH=$4                                          
  LABEL="Procedure 33"                                                          
                                                                                
  PR34                       LENGTH=$4                                          
  LABEL="Procedure 34"                                                          
                                                                                
  PR35                       LENGTH=$4                                          
  LABEL="Procedure 35"                                                          
                                                                                
  PR36                       LENGTH=$4                                          
  LABEL="Procedure 36"                                                          
                                                                                
  PR37                       LENGTH=$4                                          
  LABEL="Procedure 37"                                                          
                                                                                
  PR38                       LENGTH=$4                                          
  LABEL="Procedure 38"                                                          
                                                                                
  PR39                       LENGTH=$4                                          
  LABEL="Procedure 39"                                                          
                                                                                
  PR40                       LENGTH=$4                                          
  LABEL="Procedure 40"                                                          
                                                                                
  PR41                       LENGTH=$4                                          
  LABEL="Procedure 41"                                                          
                                                                                
  PR42                       LENGTH=$4                                          
  LABEL="Procedure 42"                                                          
                                                                                
  PR43                       LENGTH=$4                                          
  LABEL="Procedure 43"                                                          
                                                                                
  PR44                       LENGTH=$4                                          
  LABEL="Procedure 44"                                                          
                                                                                
  PR45                       LENGTH=$4                                          
  LABEL="Procedure 45"                                                          
                                                                                
  PR46                       LENGTH=$4                                          
  LABEL="Procedure 46"                                                          
                                                                                
  PRCCS1                     LENGTH=3                                           
  LABEL="CCS: procedure 1"                                                      
                                                                                
  PRCCS2                     LENGTH=3                                           
  LABEL="CCS: procedure 2"                                                      
                                                                                
  PRCCS3                     LENGTH=3                                           
  LABEL="CCS: procedure 3"                                                      
                                                                                
  PRCCS4                     LENGTH=3                                           
  LABEL="CCS: procedure 4"                                                      
                                                                                
  PRCCS5                     LENGTH=3                                           
  LABEL="CCS: procedure 5"                                                      
                                                                                
  PRCCS6                     LENGTH=3                                           
  LABEL="CCS: procedure 6"                                                      
                                                                                
  PRCCS7                     LENGTH=3                                           
  LABEL="CCS: procedure 7"                                                      
                                                                                
  PRCCS8                     LENGTH=3                                           
  LABEL="CCS: procedure 8"                                                      
                                                                                
  PRCCS9                     LENGTH=3                                           
  LABEL="CCS: procedure 9"                                                      
                                                                                
  PRCCS10                    LENGTH=3                                           
  LABEL="CCS: procedure 10"                                                     
                                                                                
  PRCCS11                    LENGTH=3                                           
  LABEL="CCS: procedure 11"                                                     
                                                                                
  PRCCS12                    LENGTH=3                                           
  LABEL="CCS: procedure 12"                                                     
                                                                                
  PRCCS13                    LENGTH=3                                           
  LABEL="CCS: procedure 13"                                                     
                                                                                
  PRCCS14                    LENGTH=3                                           
  LABEL="CCS: procedure 14"                                                     
                                                                                
  PRCCS15                    LENGTH=3                                           
  LABEL="CCS: procedure 15"                                                     
                                                                                
  PRCCS16                    LENGTH=3                                           
  LABEL="CCS: procedure 16"                                                     
                                                                                
  PRCCS17                    LENGTH=3                                           
  LABEL="CCS: procedure 17"                                                     
                                                                                
  PRCCS18                    LENGTH=3                                           
  LABEL="CCS: procedure 18"                                                     
                                                                                
  PRCCS19                    LENGTH=3                                           
  LABEL="CCS: procedure 19"                                                     
                                                                                
  PRCCS20                    LENGTH=3                                           
  LABEL="CCS: procedure 20"                                                     
                                                                                
  PRCCS21                    LENGTH=3                                           
  LABEL="CCS: procedure 21"                                                     
                                                                                
  PRCCS22                    LENGTH=3                                           
  LABEL="CCS: procedure 22"                                                     
                                                                                
  PRCCS23                    LENGTH=3                                           
  LABEL="CCS: procedure 23"                                                     
                                                                                
  PRCCS24                    LENGTH=3                                           
  LABEL="CCS: procedure 24"                                                     
                                                                                
  PRCCS25                    LENGTH=3                                           
  LABEL="CCS: procedure 25"                                                     
                                                                                
  PRCCS26                    LENGTH=3                                           
  LABEL="CCS: procedure 26"                                                     
                                                                                
  PRCCS27                    LENGTH=3                                           
  LABEL="CCS: procedure 27"                                                     
                                                                                
  PRCCS28                    LENGTH=3                                           
  LABEL="CCS: procedure 28"                                                     
                                                                                
  PRCCS29                    LENGTH=3                                           
  LABEL="CCS: procedure 29"                                                     
                                                                                
  PRCCS30                    LENGTH=3                                           
  LABEL="CCS: procedure 30"                                                     
                                                                                
  PRCCS31                    LENGTH=3                                           
  LABEL="CCS: procedure 31"                                                     
                                                                                
  PRCCS32                    LENGTH=3                                           
  LABEL="CCS: procedure 32"                                                     
                                                                                
  PRCCS33                    LENGTH=3                                           
  LABEL="CCS: procedure 33"                                                     
                                                                                
  PRCCS34                    LENGTH=3                                           
  LABEL="CCS: procedure 34"                                                     
                                                                                
  PRCCS35                    LENGTH=3                                           
  LABEL="CCS: procedure 35"                                                     
                                                                                
  PRCCS36                    LENGTH=3                                           
  LABEL="CCS: procedure 36"                                                     
                                                                                
  PRCCS37                    LENGTH=3                                           
  LABEL="CCS: procedure 37"                                                     
                                                                                
  PRCCS38                    LENGTH=3                                           
  LABEL="CCS: procedure 38"                                                     
                                                                                
  PRCCS39                    LENGTH=3                                           
  LABEL="CCS: procedure 39"                                                     
                                                                                
  PRCCS40                    LENGTH=3                                           
  LABEL="CCS: procedure 40"                                                     
                                                                                
  PRCCS41                    LENGTH=3                                           
  LABEL="CCS: procedure 41"                                                     
                                                                                
  PRCCS42                    LENGTH=3                                           
  LABEL="CCS: procedure 42"                                                     
                                                                                
  PRCCS43                    LENGTH=3                                           
  LABEL="CCS: procedure 43"                                                     
                                                                                
  PRCCS44                    LENGTH=3                                           
  LABEL="CCS: procedure 44"                                                     
                                                                                
  PRCCS45                    LENGTH=3                                           
  LABEL="CCS: procedure 45"                                                     
                                                                                
  PRCCS46                    LENGTH=3                                           
  LABEL="CCS: procedure 46"                                                     
                                                                                
  PRDAY1                     LENGTH=4                                           
  LABEL="Number of days from admission to PR1"                                  
                                                                                
  PRDAY2                     LENGTH=4                                           
  LABEL="Number of days from admission to PR2"                                  
                                                                                
  PRDAY3                     LENGTH=4                                           
  LABEL="Number of days from admission to PR3"                                  
                                                                                
  PRDAY4                     LENGTH=4                                           
  LABEL="Number of days from admission to PR4"                                  
                                                                                
  PRDAY5                     LENGTH=4                                           
  LABEL="Number of days from admission to PR5"                                  
                                                                                
  PRDAY6                     LENGTH=4                                           
  LABEL="Number of days from admission to PR6"                                  
                                                                                
  PRDAY7                     LENGTH=4                                           
  LABEL="Number of days from admission to PR7"                                  
                                                                                
  PRDAY8                     LENGTH=4                                           
  LABEL="Number of days from admission to PR8"                                  
                                                                                
  PRDAY9                     LENGTH=4                                           
  LABEL="Number of days from admission to PR9"                                  
                                                                                
  PRDAY10                    LENGTH=4                                           
  LABEL="Number of days from admission to PR10"                                 
                                                                                
  PRDAY11                    LENGTH=4                                           
  LABEL="Number of days from admission to PR11"                                 
                                                                                
  PRDAY12                    LENGTH=4                                           
  LABEL="Number of days from admission to PR12"                                 
                                                                                
  PRDAY13                    LENGTH=4                                           
  LABEL="Number of days from admission to PR13"                                 
                                                                                
  PRDAY14                    LENGTH=4                                           
  LABEL="Number of days from admission to PR14"                                 
                                                                                
  PRDAY15                    LENGTH=4                                           
  LABEL="Number of days from admission to PR15"                                 
                                                                                
  PRDAY16                    LENGTH=4                                           
  LABEL="Number of days from admission to PR16"                                 
                                                                                
  PRDAY17                    LENGTH=4                                           
  LABEL="Number of days from admission to PR17"                                 
                                                                                
  PRDAY18                    LENGTH=4                                           
  LABEL="Number of days from admission to PR18"                                 
                                                                                
  PRDAY19                    LENGTH=4                                           
  LABEL="Number of days from admission to PR19"                                 
                                                                                
  PRDAY20                    LENGTH=4                                           
  LABEL="Number of days from admission to PR20"                                 
                                                                                
  PRDAY21                    LENGTH=4                                           
  LABEL="Number of days from admission to PR21"                                 
                                                                                
  PRDAY22                    LENGTH=4                                           
  LABEL="Number of days from admission to PR22"                                 
                                                                                
  PRDAY23                    LENGTH=4                                           
  LABEL="Number of days from admission to PR23"                                 
                                                                                
  PRDAY24                    LENGTH=4                                           
  LABEL="Number of days from admission to PR24"                                 
                                                                                
  PRDAY25                    LENGTH=4                                           
  LABEL="Number of days from admission to PR25"                                 
                                                                                
  PRDAY26                    LENGTH=4                                           
  LABEL="Number of days from admission to PR26"                                 
                                                                                
  PRDAY27                    LENGTH=4                                           
  LABEL="Number of days from admission to PR27"                                 
                                                                                
  PRDAY28                    LENGTH=4                                           
  LABEL="Number of days from admission to PR28"                                 
                                                                                
  PRDAY29                    LENGTH=4                                           
  LABEL="Number of days from admission to PR29"                                 
                                                                                
  PRDAY30                    LENGTH=4                                           
  LABEL="Number of days from admission to PR30"                                 
                                                                                
  PRDAY31                    LENGTH=4                                           
  LABEL="Number of days from admission to PR31"                                 
                                                                                
  PRDAY32                    LENGTH=4                                           
  LABEL="Number of days from admission to PR32"                                 
                                                                                
  PRDAY33                    LENGTH=4                                           
  LABEL="Number of days from admission to PR33"                                 
                                                                                
  PRDAY34                    LENGTH=4                                           
  LABEL="Number of days from admission to PR34"                                 
                                                                                
  PRDAY35                    LENGTH=4                                           
  LABEL="Number of days from admission to PR35"                                 
                                                                                
  PRDAY36                    LENGTH=4                                           
  LABEL="Number of days from admission to PR36"                                 
                                                                                
  PRDAY37                    LENGTH=4                                           
  LABEL="Number of days from admission to PR37"                                 
                                                                                
  PRDAY38                    LENGTH=4                                           
  LABEL="Number of days from admission to PR38"                                 
                                                                                
  PRDAY39                    LENGTH=4                                           
  LABEL="Number of days from admission to PR39"                                 
                                                                                
  PRDAY40                    LENGTH=4                                           
  LABEL="Number of days from admission to PR40"                                 
                                                                                
  PRDAY41                    LENGTH=4                                           
  LABEL="Number of days from admission to PR41"                                 
                                                                                
  PRDAY42                    LENGTH=4                                           
  LABEL="Number of days from admission to PR42"                                 
                                                                                
  PRDAY43                    LENGTH=4                                           
  LABEL="Number of days from admission to PR43"                                 
                                                                                
  PRDAY44                    LENGTH=4                                           
  LABEL="Number of days from admission to PR44"                                 
                                                                                
  PRDAY45                    LENGTH=4                                           
  LABEL="Number of days from admission to PR45"                                 
                                                                                
  PRDAY46                    LENGTH=4                                           
  LABEL="Number of days from admission to PR46"                                 
                                                                                
  PROCTYPE                   LENGTH=3                                           
  LABEL="Procedure type indicator"                                              
                                                                                
  PSTATE                     LENGTH=$2                                          
  LABEL="Patient State postal code"                                             
                                                                                
  PSTCO                      LENGTH=4                 FORMAT=Z5.                
  LABEL="Patient state/county FIPS code"                                        
                                                                                
  PSTCO2                     LENGTH=4                 FORMAT=Z5.                
  LABEL="Patient state/county FIPS code, possibly derived from ZIP Code"        
                                                                                
  PointOfOriginUB04          LENGTH=$1                                          
  LABEL="Point of origin for admission or visit, UB-04 standard coding"         
                                                                                
  PointOfOrigin_X            LENGTH=$1                                          
  LABEL="Point of origin for admission or visit, as received from source"       
                                                                                
  RACE                       LENGTH=3                                           
  LABEL="Race (uniform)"                                                        
                                                                                
  RACE_X                     LENGTH=$4                                          
  LABEL="Race (as received from source)"                                        
                                                                                
  TOTCHG                     LENGTH=6                                           
  LABEL="Total charges (cleaned)"                                               
                                                                                
  TOTCHG_X                   LENGTH=7                                           
  LABEL="Total charges (as received from source)"                               
                                                                                
  YEAR                       LENGTH=3                                           
  LABEL="Calendar year"                                                         
                                                                                
  ZIP3                       LENGTH=$3                                          
  LABEL="Patient ZIP Code, first 3 digits"                                      
                                                                                
  ZIPINC_QRTL                LENGTH=3                                           
  LABEL="Median household income national quartile for patient ZIP Code"        
                                                                                
  HOSPID                     LENGTH=4                 FORMAT=Z5.                
  LABEL="HCUP hospital identification number"                                   
                                                                                
  ZIP                        LENGTH=$5                                          
  LABEL="Patient ZIP Code"                                                      
                                                                                
  AYEAR                      LENGTH=3                                           
  LABEL="Admission year"                                                        
                                                                                
  DMONTH                     LENGTH=3                                           
  LABEL="Discharge month"                                                       
                                                                                
  BMONTH                     LENGTH=3                                           
  LABEL="Birth month"                                                           
                                                                                
  BYEAR                      LENGTH=3                                           
  LABEL="Birth year"                                                            
                                                                                
  PRMONTH1                   LENGTH=3                                           
  LABEL="Month of procedure 1"                                                  
                                                                                
  PRMONTH2                   LENGTH=3                                           
  LABEL="Month of procedure 2"                                                  
                                                                                
  PRMONTH3                   LENGTH=3                                           
  LABEL="Month of procedure 3"                                                  
                                                                                
  PRMONTH4                   LENGTH=3                                           
  LABEL="Month of procedure 4"                                                  
                                                                                
  PRMONTH5                   LENGTH=3                                           
  LABEL="Month of procedure 5"                                                  
                                                                                
  PRMONTH6                   LENGTH=3                                           
  LABEL="Month of procedure 6"                                                  
                                                                                
  PRMONTH7                   LENGTH=3                                           
  LABEL="Month of procedure 7"                                                  
                                                                                
  PRMONTH8                   LENGTH=3                                           
  LABEL="Month of procedure 8"                                                  
                                                                                
  PRMONTH9                   LENGTH=3                                           
  LABEL="Month of procedure 9"                                                  
                                                                                
  PRMONTH10                  LENGTH=3                                           
  LABEL="Month of procedure 10"                                                 
                                                                                
  PRMONTH11                  LENGTH=3                                           
  LABEL="Month of procedure 11"                                                 
                                                                                
  PRMONTH12                  LENGTH=3                                           
  LABEL="Month of procedure 12"                                                 
                                                                                
  PRMONTH13                  LENGTH=3                                           
  LABEL="Month of procedure 13"                                                 
                                                                                
  PRMONTH14                  LENGTH=3                                           
  LABEL="Month of procedure 14"                                                 
                                                                                
  PRMONTH15                  LENGTH=3                                           
  LABEL="Month of procedure 15"                                                 
                                                                                
  PRMONTH16                  LENGTH=3                                           
  LABEL="Month of procedure 16"                                                 
                                                                                
  PRMONTH17                  LENGTH=3                                           
  LABEL="Month of procedure 17"                                                 
                                                                                
  PRMONTH18                  LENGTH=3                                           
  LABEL="Month of procedure 18"                                                 
                                                                                
  PRMONTH19                  LENGTH=3                                           
  LABEL="Month of procedure 19"                                                 
                                                                                
  PRMONTH20                  LENGTH=3                                           
  LABEL="Month of procedure 20"                                                 
                                                                                
  PRMONTH21                  LENGTH=3                                           
  LABEL="Month of procedure 21"                                                 
                                                                                
  PRMONTH22                  LENGTH=3                                           
  LABEL="Month of procedure 22"                                                 
                                                                                
  PRMONTH23                  LENGTH=3                                           
  LABEL="Month of procedure 23"                                                 
                                                                                
  PRMONTH24                  LENGTH=3                                           
  LABEL="Month of procedure 24"                                                 
                                                                                
  PRMONTH25                  LENGTH=3                                           
  LABEL="Month of procedure 25"                                                 
                                                                                
  PRMONTH26                  LENGTH=3                                           
  LABEL="Month of procedure 26"                                                 
                                                                                
  PRMONTH27                  LENGTH=3                                           
  LABEL="Month of procedure 27"                                                 
                                                                                
  PRMONTH28                  LENGTH=3                                           
  LABEL="Month of procedure 28"                                                 
                                                                                
  PRMONTH29                  LENGTH=3                                           
  LABEL="Month of procedure 29"                                                 
                                                                                
  PRMONTH30                  LENGTH=3                                           
  LABEL="Month of procedure 30"                                                 
                                                                                
  PRMONTH31                  LENGTH=3                                           
  LABEL="Month of procedure 31"                                                 
                                                                                
  PRMONTH32                  LENGTH=3                                           
  LABEL="Month of procedure 32"                                                 
                                                                                
  PRMONTH33                  LENGTH=3                                           
  LABEL="Month of procedure 33"                                                 
                                                                                
  PRMONTH34                  LENGTH=3                                           
  LABEL="Month of procedure 34"                                                 
                                                                                
  PRMONTH35                  LENGTH=3                                           
  LABEL="Month of procedure 35"                                                 
                                                                                
  PRMONTH36                  LENGTH=3                                           
  LABEL="Month of procedure 36"                                                 
                                                                                
  PRMONTH37                  LENGTH=3                                           
  LABEL="Month of procedure 37"                                                 
                                                                                
  PRMONTH38                  LENGTH=3                                           
  LABEL="Month of procedure 38"                                                 
                                                                                
  PRMONTH39                  LENGTH=3                                           
  LABEL="Month of procedure 39"                                                 
                                                                                
  PRMONTH40                  LENGTH=3                                           
  LABEL="Month of procedure 40"                                                 
                                                                                
  PRMONTH41                  LENGTH=3                                           
  LABEL="Month of procedure 41"                                                 
                                                                                
  PRMONTH42                  LENGTH=3                                           
  LABEL="Month of procedure 42"                                                 
                                                                                
  PRMONTH43                  LENGTH=3                                           
  LABEL="Month of procedure 43"                                                 
                                                                                
  PRMONTH44                  LENGTH=3                                           
  LABEL="Month of procedure 44"                                                 
                                                                                
  PRMONTH45                  LENGTH=3                                           
  LABEL="Month of procedure 45"                                                 
                                                                                
  PRMONTH46                  LENGTH=3                                           
  LABEL="Month of procedure 46"                                                 
                                                                                
  PRYEAR1                    LENGTH=3                                           
  LABEL="Year of procedure 1"                                                   
                                                                                
  PRYEAR2                    LENGTH=3                                           
  LABEL="Year of procedure 2"                                                   
                                                                                
  PRYEAR3                    LENGTH=3                                           
  LABEL="Year of procedure 3"                                                   
                                                                                
  PRYEAR4                    LENGTH=3                                           
  LABEL="Year of procedure 4"                                                   
                                                                                
  PRYEAR5                    LENGTH=3                                           
  LABEL="Year of procedure 5"                                                   
                                                                                
  PRYEAR6                    LENGTH=3                                           
  LABEL="Year of procedure 6"                                                   
                                                                                
  PRYEAR7                    LENGTH=3                                           
  LABEL="Year of procedure 7"                                                   
                                                                                
  PRYEAR8                    LENGTH=3                                           
  LABEL="Year of procedure 8"                                                   
                                                                                
  PRYEAR9                    LENGTH=3                                           
  LABEL="Year of procedure 9"                                                   
                                                                                
  PRYEAR10                   LENGTH=3                                           
  LABEL="Year of procedure 10"                                                  
                                                                                
  PRYEAR11                   LENGTH=3                                           
  LABEL="Year of procedure 11"                                                  
                                                                                
  PRYEAR12                   LENGTH=3                                           
  LABEL="Year of procedure 12"                                                  
                                                                                
  PRYEAR13                   LENGTH=3                                           
  LABEL="Year of procedure 13"                                                  
                                                                                
  PRYEAR14                   LENGTH=3                                           
  LABEL="Year of procedure 14"                                                  
                                                                                
  PRYEAR15                   LENGTH=3                                           
  LABEL="Year of procedure 15"                                                  
                                                                                
  PRYEAR16                   LENGTH=3                                           
  LABEL="Year of procedure 16"                                                  
                                                                                
  PRYEAR17                   LENGTH=3                                           
  LABEL="Year of procedure 17"                                                  
                                                                                
  PRYEAR18                   LENGTH=3                                           
  LABEL="Year of procedure 18"                                                  
                                                                                
  PRYEAR19                   LENGTH=3                                           
  LABEL="Year of procedure 19"                                                  
                                                                                
  PRYEAR20                   LENGTH=3                                           
  LABEL="Year of procedure 20"                                                  
                                                                                
  PRYEAR21                   LENGTH=3                                           
  LABEL="Year of procedure 21"                                                  
                                                                                
  PRYEAR22                   LENGTH=3                                           
  LABEL="Year of procedure 22"                                                  
                                                                                
  PRYEAR23                   LENGTH=3                                           
  LABEL="Year of procedure 23"                                                  
                                                                                
  PRYEAR24                   LENGTH=3                                           
  LABEL="Year of procedure 24"                                                  
                                                                                
  PRYEAR25                   LENGTH=3                                           
  LABEL="Year of procedure 25"                                                  
                                                                                
  PRYEAR26                   LENGTH=3                                           
  LABEL="Year of procedure 26"                                                  
                                                                                
  PRYEAR27                   LENGTH=3                                           
  LABEL="Year of procedure 27"                                                  
                                                                                
  PRYEAR28                   LENGTH=3                                           
  LABEL="Year of procedure 28"                                                  
                                                                                
  PRYEAR29                   LENGTH=3                                           
  LABEL="Year of procedure 29"                                                  
                                                                                
  PRYEAR30                   LENGTH=3                                           
  LABEL="Year of procedure 30"                                                  
                                                                                
  PRYEAR31                   LENGTH=3                                           
  LABEL="Year of procedure 31"                                                  
                                                                                
  PRYEAR32                   LENGTH=3                                           
  LABEL="Year of procedure 32"                                                  
                                                                                
  PRYEAR33                   LENGTH=3                                           
  LABEL="Year of procedure 33"                                                  
                                                                                
  PRYEAR34                   LENGTH=3                                           
  LABEL="Year of procedure 34"                                                  
                                                                                
  PRYEAR35                   LENGTH=3                                           
  LABEL="Year of procedure 35"                                                  
                                                                                
  PRYEAR36                   LENGTH=3                                           
  LABEL="Year of procedure 36"                                                  
                                                                                
  PRYEAR37                   LENGTH=3                                           
  LABEL="Year of procedure 37"                                                  
                                                                                
  PRYEAR38                   LENGTH=3                                           
  LABEL="Year of procedure 38"                                                  
                                                                                
  PRYEAR39                   LENGTH=3                                           
  LABEL="Year of procedure 39"                                                  
                                                                                
  PRYEAR40                   LENGTH=3                                           
  LABEL="Year of procedure 40"                                                  
                                                                                
  PRYEAR41                   LENGTH=3                                           
  LABEL="Year of procedure 41"                                                  
                                                                                
  PRYEAR42                   LENGTH=3                                           
  LABEL="Year of procedure 42"                                                  
                                                                                
  PRYEAR43                   LENGTH=3                                           
  LABEL="Year of procedure 43"                                                  
                                                                                
  PRYEAR44                   LENGTH=3                                           
  LABEL="Year of procedure 44"                                                  
                                                                                
  PRYEAR45                   LENGTH=3                                           
  LABEL="Year of procedure 45"                                                  
                                                                                
  PRYEAR46                   LENGTH=3                                           
  LABEL="Year of procedure 46"                                                  
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      AGE                      N3PF.                                    
      @4      AGEDAY                   N3PF.                                    
      @7      AGEMONTH                 N3PF.                                    
      @10     AMONTH                   N2PF.                                    
      @12     ATYPE                    N2PF.                                    
      @14     AWEEKEND                 N2PF.                                    
      @16     DIED                     N2PF.                                    
      @18     DISPUB04                 N2PF.                                    
      @20     DISPUNIFORM              N2PF.                                    
      @22     DISP_X                   $CHAR4.                                  
      @26     DQTR                     N2PF.                                    
      @28     DRG                      N3PF.                                    
      @31     DRG24                    N3PF.                                    
      @34     DRGVER                   N2PF.                                    
      @36     DRG_NoPOA                N3PF.                                    
      @39     DX1                      $CHAR5.                                  
      @44     DX2                      $CHAR5.                                  
      @49     DX3                      $CHAR5.                                  
      @54     DX4                      $CHAR5.                                  
      @59     DX5                      $CHAR5.                                  
      @64     DX6                      $CHAR5.                                  
      @69     DX7                      $CHAR5.                                  
      @74     DX8                      $CHAR5.                                  
      @79     DX9                      $CHAR5.                                  
      @84     DX10                     $CHAR5.                                  
      @89     DX11                     $CHAR5.                                  
      @94     DX12                     $CHAR5.                                  
      @99     DX13                     $CHAR5.                                  
      @104    DX14                     $CHAR5.                                  
      @109    DX15                     $CHAR5.                                  
      @114    DX16                     $CHAR5.                                  
      @119    DX17                     $CHAR5.                                  
      @124    DX18                     $CHAR5.                                  
      @129    DX19                     $CHAR5.                                  
      @134    DX20                     $CHAR5.                                  
      @139    DX21                     $CHAR5.                                  
      @144    DX22                     $CHAR5.                                  
      @149    DX23                     $CHAR5.                                  
      @154    DX24                     $CHAR5.                                  
      @159    DX25                     $CHAR5.                                  
      @164    DX26                     $CHAR5.                                  
      @169    DX27                     $CHAR5.                                  
      @174    DX28                     $CHAR5.                                  
      @179    DX29                     $CHAR5.                                  
      @184    DX30                     $CHAR5.                                  
      @189    DX31                     $CHAR5.                                  
      @194    DX32                     $CHAR5.                                  
      @199    DX33                     $CHAR5.                                  
      @204    DX34                     $CHAR5.                                  
      @209    DX35                     $CHAR5.                                  
      @214    DX36                     $CHAR5.                                  
      @219    DX37                     $CHAR5.                                  
      @224    DX38                     $CHAR5.                                  
      @229    DX39                     $CHAR5.                                  
      @234    DX40                     $CHAR5.                                  
      @239    DX41                     $CHAR5.                                  
      @244    DX42                     $CHAR5.                                  
      @249    DX43                     $CHAR5.                                  
      @254    DX44                     $CHAR5.                                  
      @259    DX45                     $CHAR5.                                  
      @264    DX46                     $CHAR5.                                  
      @269    DX47                     $CHAR5.                                  
      @274    DX48                     $CHAR5.                                  
      @279    DX49                     $CHAR5.                                  
      @284    DX50                     $CHAR5.                                  
      @289    DX51                     $CHAR5.                                  
      @294    DX52                     $CHAR5.                                  
      @299    DX53                     $CHAR5.                                  
      @304    DX54                     $CHAR5.                                  
      @309    DX55                     $CHAR5.                                  
      @314    DX56                     $CHAR5.                                  
      @319    DX57                     $CHAR5.                                  
      @324    DX58                     $CHAR5.                                  
      @329    DX59                     $CHAR5.                                  
      @334    DX60                     $CHAR5.                                  
      @339    DX61                     $CHAR5.                                  
      @344    DXCCS1                   N4PF.                                    
      @348    DXCCS2                   N4PF.                                    
      @352    DXCCS3                   N4PF.                                    
      @356    DXCCS4                   N4PF.                                    
      @360    DXCCS5                   N4PF.                                    
      @364    DXCCS6                   N4PF.                                    
      @368    DXCCS7                   N4PF.                                    
      @372    DXCCS8                   N4PF.                                    
      @376    DXCCS9                   N4PF.                                    
      @380    DXCCS10                  N4PF.                                    
      @384    DXCCS11                  N4PF.                                    
      @388    DXCCS12                  N4PF.                                    
      @392    DXCCS13                  N4PF.                                    
      @396    DXCCS14                  N4PF.                                    
      @400    DXCCS15                  N4PF.                                    
      @404    DXCCS16                  N4PF.                                    
      @408    DXCCS17                  N4PF.                                    
      @412    DXCCS18                  N4PF.                                    
      @416    DXCCS19                  N4PF.                                    
      @420    DXCCS20                  N4PF.                                    
      @424    DXCCS21                  N4PF.                                    
      @428    DXCCS22                  N4PF.                                    
      @432    DXCCS23                  N4PF.                                    
      @436    DXCCS24                  N4PF.                                    
      @440    DXCCS25                  N4PF.                                    
      @444    DXCCS26                  N4PF.                                    
      @448    DXCCS27                  N4PF.                                    
      @452    DXCCS28                  N4PF.                                    
      @456    DXCCS29                  N4PF.                                    
      @460    DXCCS30                  N4PF.                                    
      @464    DXCCS31                  N4PF.                                    
      @468    DXCCS32                  N4PF.                                    
      @472    DXCCS33                  N4PF.                                    
      @476    DXCCS34                  N4PF.                                    
      @480    DXCCS35                  N4PF.                                    
      @484    DXCCS36                  N4PF.                                    
      @488    DXCCS37                  N4PF.                                    
      @492    DXCCS38                  N4PF.                                    
      @496    DXCCS39                  N4PF.                                    
      @500    DXCCS40                  N4PF.                                    
      @504    DXCCS41                  N4PF.                                    
      @508    DXCCS42                  N4PF.                                    
      @512    DXCCS43                  N4PF.                                    
      @516    DXCCS44                  N4PF.                                    
      @520    DXCCS45                  N4PF.                                    
      @524    DXCCS46                  N4PF.                                    
      @528    DXCCS47                  N4PF.                                    
      @532    DXCCS48                  N4PF.                                    
      @536    DXCCS49                  N4PF.                                    
      @540    DXCCS50                  N4PF.                                    
      @544    DXCCS51                  N4PF.                                    
      @548    DXCCS52                  N4PF.                                    
      @552    DXCCS53                  N4PF.                                    
      @556    DXCCS54                  N4PF.                                    
      @560    DXCCS55                  N4PF.                                    
      @564    DXCCS56                  N4PF.                                    
      @568    DXCCS57                  N4PF.                                    
      @572    DXCCS58                  N4PF.                                    
      @576    DXCCS59                  N4PF.                                    
      @580    DXCCS60                  N4PF.                                    
      @584    DXCCS61                  N4PF.                                    
      @588    DXPOA1                   $CHAR1.                                  
      @589    DXPOA2                   $CHAR1.                                  
      @590    DXPOA3                   $CHAR1.                                  
      @591    DXPOA4                   $CHAR1.                                  
      @592    DXPOA5                   $CHAR1.                                  
      @593    DXPOA6                   $CHAR1.                                  
      @594    DXPOA7                   $CHAR1.                                  
      @595    DXPOA8                   $CHAR1.                                  
      @596    DXPOA9                   $CHAR1.                                  
      @597    DXPOA10                  $CHAR1.                                  
      @598    DXPOA11                  $CHAR1.                                  
      @599    DXPOA12                  $CHAR1.                                  
      @600    DXPOA13                  $CHAR1.                                  
      @601    DXPOA14                  $CHAR1.                                  
      @602    DXPOA15                  $CHAR1.                                  
      @603    DXPOA16                  $CHAR1.                                  
      @604    DXPOA17                  $CHAR1.                                  
      @605    DXPOA18                  $CHAR1.                                  
      @606    DXPOA19                  $CHAR1.                                  
      @607    DXPOA20                  $CHAR1.                                  
      @608    DXPOA21                  $CHAR1.                                  
      @609    DXPOA22                  $CHAR1.                                  
      @610    DXPOA23                  $CHAR1.                                  
      @611    DXPOA24                  $CHAR1.                                  
      @612    DXPOA25                  $CHAR1.                                  
      @613    DXPOA26                  $CHAR1.                                  
      @614    DXPOA27                  $CHAR1.                                  
      @615    DXPOA28                  $CHAR1.                                  
      @616    DXPOA29                  $CHAR1.                                  
      @617    DXPOA30                  $CHAR1.                                  
      @618    DXPOA31                  $CHAR1.                                  
      @619    DXPOA32                  $CHAR1.                                  
      @620    DXPOA33                  $CHAR1.                                  
      @621    DXPOA34                  $CHAR1.                                  
      @622    DXPOA35                  $CHAR1.                                  
      @623    DXPOA36                  $CHAR1.                                  
      @624    DXPOA37                  $CHAR1.                                  
      @625    DXPOA38                  $CHAR1.                                  
      @626    DXPOA39                  $CHAR1.                                  
      @627    DXPOA40                  $CHAR1.                                  
      @628    DXPOA41                  $CHAR1.                                  
      @629    DXPOA42                  $CHAR1.                                  
      @630    DXPOA43                  $CHAR1.                                  
      @631    DXPOA44                  $CHAR1.                                  
      @632    DXPOA45                  $CHAR1.                                  
      @633    DXPOA46                  $CHAR1.                                  
      @634    DXPOA47                  $CHAR1.                                  
      @635    DXPOA48                  $CHAR1.                                  
      @636    DXPOA49                  $CHAR1.                                  
      @637    DXPOA50                  $CHAR1.                                  
      @638    DXPOA51                  $CHAR1.                                  
      @639    DXPOA52                  $CHAR1.                                  
      @640    DXPOA53                  $CHAR1.                                  
      @641    DXPOA54                  $CHAR1.                                  
      @642    DXPOA55                  $CHAR1.                                  
      @643    DXPOA56                  $CHAR1.                                  
      @644    DXPOA57                  $CHAR1.                                  
      @645    DXPOA58                  $CHAR1.                                  
      @646    DXPOA59                  $CHAR1.                                  
      @647    DXPOA60                  $CHAR1.                                  
      @648    DXPOA61                  $CHAR1.                                  
      @649    ECODE1                   $CHAR5.                                  
      @654    ECODE2                   $CHAR5.                                  
      @659    ECODE3                   $CHAR5.                                  
      @664    ECODE4                   $CHAR5.                                  
      @669    ECODE5                   $CHAR5.                                  
      @674    ECODE6                   $CHAR5.                                  
      @679    E_CCS1                   N4PF.                                    
      @683    E_CCS2                   N4PF.                                    
      @687    E_CCS3                   N4PF.                                    
      @691    E_CCS4                   N4PF.                                    
      @695    E_CCS5                   N4PF.                                    
      @699    E_CCS6                   N4PF.                                    
      @703    E_POA1                   $CHAR1.                                  
      @704    E_POA2                   $CHAR1.                                  
      @705    E_POA3                   $CHAR1.                                  
      @706    E_POA4                   $CHAR1.                                  
      @707    E_POA5                   $CHAR1.                                  
      @708    E_POA6                   $CHAR1.                                  
      @709    FEMALE                   N2PF.                                    
      @711    HCUP_ED                  N2PF.                                    
      @713    HCUP_OS                  N2PF.                                    
      @715    HOSPBRTH                 N3PF.                                    
      @718    HOSPST                   $CHAR2.                                  
      @720    HospitalUnit             N2PF.                                    
      @722    KEY                      14.                                      
      @736    LOS                      N5PF.                                    
      @741    LOS_X                    N6PF.                                    
      @747    MDC                      N2PF.                                    
      @749    MDC24                    N2PF.                                    
      @751    MDNUM1_R                 N9PF.                                    
      @760    MDNUM2_R                 N9PF.                                    
      @769    MDNUM3_R                 N9PF.                                    
      @778    MEDINCSTQ                N2PF.                                    
      @780    MRN_R                    N9PF.                                    
      @789    NDX                      N2PF.                                    
      @791    NECODE                   N2PF.                                    
      @793    NEOMAT                   N2PF.                                    
      @795    NPR                      N2PF.                                    
      @797    PAY1                     N2PF.                                    
      @799    PL_CBSA                  N3PF.                                    
      @802    PL_MSA1993               N3PF.                                    
      @805    PL_NCHS2006              N2PF.                                    
      @807    PL_RUCA10_2005           N2PF.                                    
      @809    PL_RUCA2005              N4P1F.                                   
      @813    PL_RUCA4_2005            N2PF.                                    
      @815    PL_RUCC2003              N2PF.                                    
      @817    PL_UIC2003               N2PF.                                    
      @819    PL_UR_CAT4               N2PF.                                    
      @821    PR1                      $CHAR4.                                  
      @825    PR2                      $CHAR4.                                  
      @829    PR3                      $CHAR4.                                  
      @833    PR4                      $CHAR4.                                  
      @837    PR5                      $CHAR4.                                  
      @841    PR6                      $CHAR4.                                  
      @845    PR7                      $CHAR4.                                  
      @849    PR8                      $CHAR4.                                  
      @853    PR9                      $CHAR4.                                  
      @857    PR10                     $CHAR4.                                  
      @861    PR11                     $CHAR4.                                  
      @865    PR12                     $CHAR4.                                  
      @869    PR13                     $CHAR4.                                  
      @873    PR14                     $CHAR4.                                  
      @877    PR15                     $CHAR4.                                  
      @881    PR16                     $CHAR4.                                  
      @885    PR17                     $CHAR4.                                  
      @889    PR18                     $CHAR4.                                  
      @893    PR19                     $CHAR4.                                  
      @897    PR20                     $CHAR4.                                  
      @901    PR21                     $CHAR4.                                  
      @905    PR22                     $CHAR4.                                  
      @909    PR23                     $CHAR4.                                  
      @913    PR24                     $CHAR4.                                  
      @917    PR25                     $CHAR4.                                  
      @921    PR26                     $CHAR4.                                  
      @925    PR27                     $CHAR4.                                  
      @929    PR28                     $CHAR4.                                  
      @933    PR29                     $CHAR4.                                  
      @937    PR30                     $CHAR4.                                  
      @941    PR31                     $CHAR4.                                  
      @945    PR32                     $CHAR4.                                  
      @949    PR33                     $CHAR4.                                  
      @953    PR34                     $CHAR4.                                  
      @957    PR35                     $CHAR4.                                  
      @961    PR36                     $CHAR4.                                  
      @965    PR37                     $CHAR4.                                  
      @969    PR38                     $CHAR4.                                  
      @973    PR39                     $CHAR4.                                  
      @977    PR40                     $CHAR4.                                  
      @981    PR41                     $CHAR4.                                  
      @985    PR42                     $CHAR4.                                  
      @989    PR43                     $CHAR4.                                  
      @993    PR44                     $CHAR4.                                  
      @997    PR45                     $CHAR4.                                  
      @1001   PR46                     $CHAR4.                                  
      @1005   PRCCS1                   N3PF.                                    
      @1008   PRCCS2                   N3PF.                                    
      @1011   PRCCS3                   N3PF.                                    
      @1014   PRCCS4                   N3PF.                                    
      @1017   PRCCS5                   N3PF.                                    
      @1020   PRCCS6                   N3PF.                                    
      @1023   PRCCS7                   N3PF.                                    
      @1026   PRCCS8                   N3PF.                                    
      @1029   PRCCS9                   N3PF.                                    
      @1032   PRCCS10                  N3PF.                                    
      @1035   PRCCS11                  N3PF.                                    
      @1038   PRCCS12                  N3PF.                                    
      @1041   PRCCS13                  N3PF.                                    
      @1044   PRCCS14                  N3PF.                                    
      @1047   PRCCS15                  N3PF.                                    
      @1050   PRCCS16                  N3PF.                                    
      @1053   PRCCS17                  N3PF.                                    
      @1056   PRCCS18                  N3PF.                                    
      @1059   PRCCS19                  N3PF.                                    
      @1062   PRCCS20                  N3PF.                                    
      @1065   PRCCS21                  N3PF.                                    
      @1068   PRCCS22                  N3PF.                                    
      @1071   PRCCS23                  N3PF.                                    
      @1074   PRCCS24                  N3PF.                                    
      @1077   PRCCS25                  N3PF.                                    
      @1080   PRCCS26                  N3PF.                                    
      @1083   PRCCS27                  N3PF.                                    
      @1086   PRCCS28                  N3PF.                                    
      @1089   PRCCS29                  N3PF.                                    
      @1092   PRCCS30                  N3PF.                                    
      @1095   PRCCS31                  N3PF.                                    
      @1098   PRCCS32                  N3PF.                                    
      @1101   PRCCS33                  N3PF.                                    
      @1104   PRCCS34                  N3PF.                                    
      @1107   PRCCS35                  N3PF.                                    
      @1110   PRCCS36                  N3PF.                                    
      @1113   PRCCS37                  N3PF.                                    
      @1116   PRCCS38                  N3PF.                                    
      @1119   PRCCS39                  N3PF.                                    
      @1122   PRCCS40                  N3PF.                                    
      @1125   PRCCS41                  N3PF.                                    
      @1128   PRCCS42                  N3PF.                                    
      @1131   PRCCS43                  N3PF.                                    
      @1134   PRCCS44                  N3PF.                                    
      @1137   PRCCS45                  N3PF.                                    
      @1140   PRCCS46                  N3PF.                                    
      @1143   PRDAY1                   N5PF.                                    
      @1148   PRDAY2                   N5PF.                                    
      @1153   PRDAY3                   N5PF.                                    
      @1158   PRDAY4                   N5PF.                                    
      @1163   PRDAY5                   N5PF.                                    
      @1168   PRDAY6                   N5PF.                                    
      @1173   PRDAY7                   N5PF.                                    
      @1178   PRDAY8                   N5PF.                                    
      @1183   PRDAY9                   N5PF.                                    
      @1188   PRDAY10                  N5PF.                                    
      @1193   PRDAY11                  N5PF.                                    
      @1198   PRDAY12                  N5PF.                                    
      @1203   PRDAY13                  N5PF.                                    
      @1208   PRDAY14                  N5PF.                                    
      @1213   PRDAY15                  N5PF.                                    
      @1218   PRDAY16                  N5PF.                                    
      @1223   PRDAY17                  N5PF.                                    
      @1228   PRDAY18                  N5PF.                                    
      @1233   PRDAY19                  N5PF.                                    
      @1238   PRDAY20                  N5PF.                                    
      @1243   PRDAY21                  N5PF.                                    
      @1248   PRDAY22                  N5PF.                                    
      @1253   PRDAY23                  N5PF.                                    
      @1258   PRDAY24                  N5PF.                                    
      @1263   PRDAY25                  N5PF.                                    
      @1268   PRDAY26                  N5PF.                                    
      @1273   PRDAY27                  N5PF.                                    
      @1278   PRDAY28                  N5PF.                                    
      @1283   PRDAY29                  N5PF.                                    
      @1288   PRDAY30                  N5PF.                                    
      @1293   PRDAY31                  N5PF.                                    
      @1298   PRDAY32                  N5PF.                                    
      @1303   PRDAY33                  N5PF.                                    
      @1308   PRDAY34                  N5PF.                                    
      @1313   PRDAY35                  N5PF.                                    
      @1318   PRDAY36                  N5PF.                                    
      @1323   PRDAY37                  N5PF.                                    
      @1328   PRDAY38                  N5PF.                                    
      @1333   PRDAY39                  N5PF.                                    
      @1338   PRDAY40                  N5PF.                                    
      @1343   PRDAY41                  N5PF.                                    
      @1348   PRDAY42                  N5PF.                                    
      @1353   PRDAY43                  N5PF.                                    
      @1358   PRDAY44                  N5PF.                                    
      @1363   PRDAY45                  N5PF.                                    
      @1368   PRDAY46                  N5PF.                                    
      @1373   PROCTYPE                 N3PF.                                    
      @1376   PSTATE                   $CHAR2.                                  
      @1378   PSTCO                    N5PF.                                    
      @1383   PSTCO2                   N5PF.                                    
      @1388   PointOfOriginUB04        $CHAR1.                                  
      @1389   PointOfOrigin_X          $CHAR1.                                  
      @1390   RACE                     N2PF.                                    
      @1392   RACE_X                   $CHAR4.                                  
      @1396   TOTCHG                   N10PF.                                   
      @1406   TOTCHG_X                 N15P2F.                                  
      @1421   YEAR                     N4PF.                                    
      @1425   ZIP3                     $CHAR3.                                  
      @1428   ZIPINC_QRTL              N3PF.                                    
      @1431   HOSPID                   N5PF.                                    
      @1436   ZIP                      $CHAR5.                                  
      @1441   AYEAR                    N4PF.                                    
      @1445   DMONTH                   N2PF.                                    
      @1447   BMONTH                   N2PF.                                    
      @1449   BYEAR                    N4PF.                                    
      @1453   PRMONTH1                 N2PF.                                    
      @1455   PRMONTH2                 N2PF.                                    
      @1457   PRMONTH3                 N2PF.                                    
      @1459   PRMONTH4                 N2PF.                                    
      @1461   PRMONTH5                 N2PF.                                    
      @1463   PRMONTH6                 N2PF.                                    
      @1465   PRMONTH7                 N2PF.                                    
      @1467   PRMONTH8                 N2PF.                                    
      @1469   PRMONTH9                 N2PF.                                    
      @1471   PRMONTH10                N2PF.                                    
      @1473   PRMONTH11                N2PF.                                    
      @1475   PRMONTH12                N2PF.                                    
      @1477   PRMONTH13                N2PF.                                    
      @1479   PRMONTH14                N2PF.                                    
      @1481   PRMONTH15                N2PF.                                    
      @1483   PRMONTH16                N2PF.                                    
      @1485   PRMONTH17                N2PF.                                    
      @1487   PRMONTH18                N2PF.                                    
      @1489   PRMONTH19                N2PF.                                    
      @1491   PRMONTH20                N2PF.                                    
      @1493   PRMONTH21                N2PF.                                    
      @1495   PRMONTH22                N2PF.                                    
      @1497   PRMONTH23                N2PF.                                    
      @1499   PRMONTH24                N2PF.                                    
      @1501   PRMONTH25                N2PF.                                    
      @1503   PRMONTH26                N2PF.                                    
      @1505   PRMONTH27                N2PF.                                    
      @1507   PRMONTH28                N2PF.                                    
      @1509   PRMONTH29                N2PF.                                    
      @1511   PRMONTH30                N2PF.                                    
      @1513   PRMONTH31                N2PF.                                    
      @1515   PRMONTH32                N2PF.                                    
      @1517   PRMONTH33                N2PF.                                    
      @1519   PRMONTH34                N2PF.                                    
      @1521   PRMONTH35                N2PF.                                    
      @1523   PRMONTH36                N2PF.                                    
      @1525   PRMONTH37                N2PF.                                    
      @1527   PRMONTH38                N2PF.                                    
      @1529   PRMONTH39                N2PF.                                    
      @1531   PRMONTH40                N2PF.                                    
      @1533   PRMONTH41                N2PF.                                    
      @1535   PRMONTH42                N2PF.                                    
      @1537   PRMONTH43                N2PF.                                    
      @1539   PRMONTH44                N2PF.                                    
      @1541   PRMONTH45                N2PF.                                    
      @1543   PRMONTH46                N2PF.                                    
      @1545   PRYEAR1                  N4PF.                                    
      @1549   PRYEAR2                  N4PF.                                    
      @1553   PRYEAR3                  N4PF.                                    
      @1557   PRYEAR4                  N4PF.                                    
      @1561   PRYEAR5                  N4PF.                                    
      @1565   PRYEAR6                  N4PF.                                    
      @1569   PRYEAR7                  N4PF.                                    
      @1573   PRYEAR8                  N4PF.                                    
      @1577   PRYEAR9                  N4PF.                                    
      @1581   PRYEAR10                 N4PF.                                    
      @1585   PRYEAR11                 N4PF.                                    
      @1589   PRYEAR12                 N4PF.                                    
      @1593   PRYEAR13                 N4PF.                                    
      @1597   PRYEAR14                 N4PF.                                    
      @1601   PRYEAR15                 N4PF.                                    
      @1605   PRYEAR16                 N4PF.                                    
      @1609   PRYEAR17                 N4PF.                                    
      @1613   PRYEAR18                 N4PF.                                    
      @1617   PRYEAR19                 N4PF.                                    
      @1621   PRYEAR20                 N4PF.                                    
      @1625   PRYEAR21                 N4PF.                                    
      @1629   PRYEAR22                 N4PF.                                    
      @1633   PRYEAR23                 N4PF.                                    
      @1637   PRYEAR24                 N4PF.                                    
      @1641   PRYEAR25                 N4PF.                                    
      @1645   PRYEAR26                 N4PF.                                    
      @1649   PRYEAR27                 N4PF.                                    
      @1653   PRYEAR28                 N4PF.                                    
      @1657   PRYEAR29                 N4PF.                                    
      @1661   PRYEAR30                 N4PF.                                    
      @1665   PRYEAR31                 N4PF.                                    
      @1669   PRYEAR32                 N4PF.                                    
      @1673   PRYEAR33                 N4PF.                                    
      @1677   PRYEAR34                 N4PF.                                    
      @1681   PRYEAR35                 N4PF.                                    
      @1685   PRYEAR36                 N4PF.                                    
      @1689   PRYEAR37                 N4PF.                                    
      @1693   PRYEAR38                 N4PF.                                    
      @1697   PRYEAR39                 N4PF.                                    
      @1701   PRYEAR40                 N4PF.                                    
      @1705   PRYEAR41                 N4PF.                                    
      @1709   PRYEAR42                 N4PF.                                    
      @1713   PRYEAR43                 N4PF.                                    
      @1717   PRYEAR44                 N4PF.                                    
      @1721   PRYEAR45                 N4PF.                                    
      @1725   PRYEAR46                 N4PF.                                    
      ;                                                                         
                                                                                
                                                                                
RUN;
