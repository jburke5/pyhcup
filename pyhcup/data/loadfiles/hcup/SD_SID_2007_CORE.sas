/*******************************************************************            
*   SD_SID_2007_CORE.SAS:                                                       
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
DATA SD_SIDC_2007_CORE;                                                         
INFILE 'SD_SID_2007_CORE.ASC' LRECL = 1806;                                     
                                                                                
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
                                                                                
  ASOURCE                    LENGTH=3                                           
  LABEL="Admission source (uniform)"                                            
                                                                                
  ASOURCEUB92                LENGTH=$1                                          
  LABEL="Admission source (UB-92 standard coding)"                              
                                                                                
  ASOURCE_X                  LENGTH=$1                                          
  LABEL="Admission source (as received from source)"                            
                                                                                
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
                                                                                
  DX62                       LENGTH=$5                                          
  LABEL="Diagnosis 62"                                                          
                                                                                
  DX63                       LENGTH=$5                                          
  LABEL="Diagnosis 63"                                                          
                                                                                
  DX64                       LENGTH=$5                                          
  LABEL="Diagnosis 64"                                                          
                                                                                
  DX65                       LENGTH=$5                                          
  LABEL="Diagnosis 65"                                                          
                                                                                
  DX66                       LENGTH=$5                                          
  LABEL="Diagnosis 66"                                                          
                                                                                
  DX67                       LENGTH=$5                                          
  LABEL="Diagnosis 67"                                                          
                                                                                
  DX68                       LENGTH=$5                                          
  LABEL="Diagnosis 68"                                                          
                                                                                
  DX69                       LENGTH=$5                                          
  LABEL="Diagnosis 69"                                                          
                                                                                
  DX70                       LENGTH=$5                                          
  LABEL="Diagnosis 70"                                                          
                                                                                
  DX71                       LENGTH=$5                                          
  LABEL="Diagnosis 71"                                                          
                                                                                
  DX72                       LENGTH=$5                                          
  LABEL="Diagnosis 72"                                                          
                                                                                
  DX73                       LENGTH=$5                                          
  LABEL="Diagnosis 73"                                                          
                                                                                
  DX74                       LENGTH=$5                                          
  LABEL="Diagnosis 74"                                                          
                                                                                
  DX75                       LENGTH=$5                                          
  LABEL="Diagnosis 75"                                                          
                                                                                
  DX76                       LENGTH=$5                                          
  LABEL="Diagnosis 76"                                                          
                                                                                
  DX77                       LENGTH=$5                                          
  LABEL="Diagnosis 77"                                                          
                                                                                
  DX78                       LENGTH=$5                                          
  LABEL="Diagnosis 78"                                                          
                                                                                
  DX79                       LENGTH=$5                                          
  LABEL="Diagnosis 79"                                                          
                                                                                
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
                                                                                
  DXCCS62                    LENGTH=4                                           
  LABEL="CCS: diagnosis 62"                                                     
                                                                                
  DXCCS63                    LENGTH=4                                           
  LABEL="CCS: diagnosis 63"                                                     
                                                                                
  DXCCS64                    LENGTH=4                                           
  LABEL="CCS: diagnosis 64"                                                     
                                                                                
  DXCCS65                    LENGTH=4                                           
  LABEL="CCS: diagnosis 65"                                                     
                                                                                
  DXCCS66                    LENGTH=4                                           
  LABEL="CCS: diagnosis 66"                                                     
                                                                                
  DXCCS67                    LENGTH=4                                           
  LABEL="CCS: diagnosis 67"                                                     
                                                                                
  DXCCS68                    LENGTH=4                                           
  LABEL="CCS: diagnosis 68"                                                     
                                                                                
  DXCCS69                    LENGTH=4                                           
  LABEL="CCS: diagnosis 69"                                                     
                                                                                
  DXCCS70                    LENGTH=4                                           
  LABEL="CCS: diagnosis 70"                                                     
                                                                                
  DXCCS71                    LENGTH=4                                           
  LABEL="CCS: diagnosis 71"                                                     
                                                                                
  DXCCS72                    LENGTH=4                                           
  LABEL="CCS: diagnosis 72"                                                     
                                                                                
  DXCCS73                    LENGTH=4                                           
  LABEL="CCS: diagnosis 73"                                                     
                                                                                
  DXCCS74                    LENGTH=4                                           
  LABEL="CCS: diagnosis 74"                                                     
                                                                                
  DXCCS75                    LENGTH=4                                           
  LABEL="CCS: diagnosis 75"                                                     
                                                                                
  DXCCS76                    LENGTH=4                                           
  LABEL="CCS: diagnosis 76"                                                     
                                                                                
  DXCCS77                    LENGTH=4                                           
  LABEL="CCS: diagnosis 77"                                                     
                                                                                
  DXCCS78                    LENGTH=4                                           
  LABEL="CCS: diagnosis 78"                                                     
                                                                                
  DXCCS79                    LENGTH=4                                           
  LABEL="CCS: diagnosis 79"                                                     
                                                                                
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
                                                                                
  ECODE7                     LENGTH=$5                                          
  LABEL="E code 7"                                                              
                                                                                
  ECODE8                     LENGTH=$5                                          
  LABEL="E code 8"                                                              
                                                                                
  ECODE9                     LENGTH=$5                                          
  LABEL="E code 9"                                                              
                                                                                
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
                                                                                
  E_CCS7                     LENGTH=3                                           
  LABEL="CCS: E Code 7"                                                         
                                                                                
  E_CCS8                     LENGTH=3                                           
  LABEL="CCS: E Code 8"                                                         
                                                                                
  E_CCS9                     LENGTH=3                                           
  LABEL="CCS: E Code 9"                                                         
                                                                                
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
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      AGE                      N3PF.                                    
      @4      AGEDAY                   N3PF.                                    
      @7      AGEMONTH                 N3PF.                                    
      @10     AMONTH                   N2PF.                                    
      @12     ASOURCE                  N2PF.                                    
      @14     ASOURCEUB92              $CHAR1.                                  
      @15     ASOURCE_X                $CHAR1.                                  
      @16     ATYPE                    N2PF.                                    
      @18     AWEEKEND                 N2PF.                                    
      @20     DIED                     N2PF.                                    
      @22     DISPUB04                 N2PF.                                    
      @24     DISPUNIFORM              N2PF.                                    
      @26     DISP_X                   $CHAR4.                                  
      @30     DQTR                     N2PF.                                    
      @32     DRG                      N3PF.                                    
      @35     DRG24                    N3PF.                                    
      @38     DRGVER                   N2PF.                                    
      @40     DX1                      $CHAR5.                                  
      @45     DX2                      $CHAR5.                                  
      @50     DX3                      $CHAR5.                                  
      @55     DX4                      $CHAR5.                                  
      @60     DX5                      $CHAR5.                                  
      @65     DX6                      $CHAR5.                                  
      @70     DX7                      $CHAR5.                                  
      @75     DX8                      $CHAR5.                                  
      @80     DX9                      $CHAR5.                                  
      @85     DX10                     $CHAR5.                                  
      @90     DX11                     $CHAR5.                                  
      @95     DX12                     $CHAR5.                                  
      @100    DX13                     $CHAR5.                                  
      @105    DX14                     $CHAR5.                                  
      @110    DX15                     $CHAR5.                                  
      @115    DX16                     $CHAR5.                                  
      @120    DX17                     $CHAR5.                                  
      @125    DX18                     $CHAR5.                                  
      @130    DX19                     $CHAR5.                                  
      @135    DX20                     $CHAR5.                                  
      @140    DX21                     $CHAR5.                                  
      @145    DX22                     $CHAR5.                                  
      @150    DX23                     $CHAR5.                                  
      @155    DX24                     $CHAR5.                                  
      @160    DX25                     $CHAR5.                                  
      @165    DX26                     $CHAR5.                                  
      @170    DX27                     $CHAR5.                                  
      @175    DX28                     $CHAR5.                                  
      @180    DX29                     $CHAR5.                                  
      @185    DX30                     $CHAR5.                                  
      @190    DX31                     $CHAR5.                                  
      @195    DX32                     $CHAR5.                                  
      @200    DX33                     $CHAR5.                                  
      @205    DX34                     $CHAR5.                                  
      @210    DX35                     $CHAR5.                                  
      @215    DX36                     $CHAR5.                                  
      @220    DX37                     $CHAR5.                                  
      @225    DX38                     $CHAR5.                                  
      @230    DX39                     $CHAR5.                                  
      @235    DX40                     $CHAR5.                                  
      @240    DX41                     $CHAR5.                                  
      @245    DX42                     $CHAR5.                                  
      @250    DX43                     $CHAR5.                                  
      @255    DX44                     $CHAR5.                                  
      @260    DX45                     $CHAR5.                                  
      @265    DX46                     $CHAR5.                                  
      @270    DX47                     $CHAR5.                                  
      @275    DX48                     $CHAR5.                                  
      @280    DX49                     $CHAR5.                                  
      @285    DX50                     $CHAR5.                                  
      @290    DX51                     $CHAR5.                                  
      @295    DX52                     $CHAR5.                                  
      @300    DX53                     $CHAR5.                                  
      @305    DX54                     $CHAR5.                                  
      @310    DX55                     $CHAR5.                                  
      @315    DX56                     $CHAR5.                                  
      @320    DX57                     $CHAR5.                                  
      @325    DX58                     $CHAR5.                                  
      @330    DX59                     $CHAR5.                                  
      @335    DX60                     $CHAR5.                                  
      @340    DX61                     $CHAR5.                                  
      @345    DX62                     $CHAR5.                                  
      @350    DX63                     $CHAR5.                                  
      @355    DX64                     $CHAR5.                                  
      @360    DX65                     $CHAR5.                                  
      @365    DX66                     $CHAR5.                                  
      @370    DX67                     $CHAR5.                                  
      @375    DX68                     $CHAR5.                                  
      @380    DX69                     $CHAR5.                                  
      @385    DX70                     $CHAR5.                                  
      @390    DX71                     $CHAR5.                                  
      @395    DX72                     $CHAR5.                                  
      @400    DX73                     $CHAR5.                                  
      @405    DX74                     $CHAR5.                                  
      @410    DX75                     $CHAR5.                                  
      @415    DX76                     $CHAR5.                                  
      @420    DX77                     $CHAR5.                                  
      @425    DX78                     $CHAR5.                                  
      @430    DX79                     $CHAR5.                                  
      @435    DXCCS1                   N4PF.                                    
      @439    DXCCS2                   N4PF.                                    
      @443    DXCCS3                   N4PF.                                    
      @447    DXCCS4                   N4PF.                                    
      @451    DXCCS5                   N4PF.                                    
      @455    DXCCS6                   N4PF.                                    
      @459    DXCCS7                   N4PF.                                    
      @463    DXCCS8                   N4PF.                                    
      @467    DXCCS9                   N4PF.                                    
      @471    DXCCS10                  N4PF.                                    
      @475    DXCCS11                  N4PF.                                    
      @479    DXCCS12                  N4PF.                                    
      @483    DXCCS13                  N4PF.                                    
      @487    DXCCS14                  N4PF.                                    
      @491    DXCCS15                  N4PF.                                    
      @495    DXCCS16                  N4PF.                                    
      @499    DXCCS17                  N4PF.                                    
      @503    DXCCS18                  N4PF.                                    
      @507    DXCCS19                  N4PF.                                    
      @511    DXCCS20                  N4PF.                                    
      @515    DXCCS21                  N4PF.                                    
      @519    DXCCS22                  N4PF.                                    
      @523    DXCCS23                  N4PF.                                    
      @527    DXCCS24                  N4PF.                                    
      @531    DXCCS25                  N4PF.                                    
      @535    DXCCS26                  N4PF.                                    
      @539    DXCCS27                  N4PF.                                    
      @543    DXCCS28                  N4PF.                                    
      @547    DXCCS29                  N4PF.                                    
      @551    DXCCS30                  N4PF.                                    
      @555    DXCCS31                  N4PF.                                    
      @559    DXCCS32                  N4PF.                                    
      @563    DXCCS33                  N4PF.                                    
      @567    DXCCS34                  N4PF.                                    
      @571    DXCCS35                  N4PF.                                    
      @575    DXCCS36                  N4PF.                                    
      @579    DXCCS37                  N4PF.                                    
      @583    DXCCS38                  N4PF.                                    
      @587    DXCCS39                  N4PF.                                    
      @591    DXCCS40                  N4PF.                                    
      @595    DXCCS41                  N4PF.                                    
      @599    DXCCS42                  N4PF.                                    
      @603    DXCCS43                  N4PF.                                    
      @607    DXCCS44                  N4PF.                                    
      @611    DXCCS45                  N4PF.                                    
      @615    DXCCS46                  N4PF.                                    
      @619    DXCCS47                  N4PF.                                    
      @623    DXCCS48                  N4PF.                                    
      @627    DXCCS49                  N4PF.                                    
      @631    DXCCS50                  N4PF.                                    
      @635    DXCCS51                  N4PF.                                    
      @639    DXCCS52                  N4PF.                                    
      @643    DXCCS53                  N4PF.                                    
      @647    DXCCS54                  N4PF.                                    
      @651    DXCCS55                  N4PF.                                    
      @655    DXCCS56                  N4PF.                                    
      @659    DXCCS57                  N4PF.                                    
      @663    DXCCS58                  N4PF.                                    
      @667    DXCCS59                  N4PF.                                    
      @671    DXCCS60                  N4PF.                                    
      @675    DXCCS61                  N4PF.                                    
      @679    DXCCS62                  N4PF.                                    
      @683    DXCCS63                  N4PF.                                    
      @687    DXCCS64                  N4PF.                                    
      @691    DXCCS65                  N4PF.                                    
      @695    DXCCS66                  N4PF.                                    
      @699    DXCCS67                  N4PF.                                    
      @703    DXCCS68                  N4PF.                                    
      @707    DXCCS69                  N4PF.                                    
      @711    DXCCS70                  N4PF.                                    
      @715    DXCCS71                  N4PF.                                    
      @719    DXCCS72                  N4PF.                                    
      @723    DXCCS73                  N4PF.                                    
      @727    DXCCS74                  N4PF.                                    
      @731    DXCCS75                  N4PF.                                    
      @735    DXCCS76                  N4PF.                                    
      @739    DXCCS77                  N4PF.                                    
      @743    DXCCS78                  N4PF.                                    
      @747    DXCCS79                  N4PF.                                    
      @751    ECODE1                   $CHAR5.                                  
      @756    ECODE2                   $CHAR5.                                  
      @761    ECODE3                   $CHAR5.                                  
      @766    ECODE4                   $CHAR5.                                  
      @771    ECODE5                   $CHAR5.                                  
      @776    ECODE6                   $CHAR5.                                  
      @781    ECODE7                   $CHAR5.                                  
      @786    ECODE8                   $CHAR5.                                  
      @791    ECODE9                   $CHAR5.                                  
      @796    E_CCS1                   N4PF.                                    
      @800    E_CCS2                   N4PF.                                    
      @804    E_CCS3                   N4PF.                                    
      @808    E_CCS4                   N4PF.                                    
      @812    E_CCS5                   N4PF.                                    
      @816    E_CCS6                   N4PF.                                    
      @820    E_CCS7                   N4PF.                                    
      @824    E_CCS8                   N4PF.                                    
      @828    E_CCS9                   N4PF.                                    
      @832    FEMALE                   N2PF.                                    
      @834    HCUP_ED                  N2PF.                                    
      @836    HCUP_OS                  N2PF.                                    
      @838    HOSPBRTH                 N3PF.                                    
      @841    HOSPST                   $CHAR2.                                  
      @843    HospitalUnit             N2PF.                                    
      @845    KEY                      14.                                      
      @859    LOS                      N5PF.                                    
      @864    LOS_X                    N6PF.                                    
      @870    MDC                      N2PF.                                    
      @872    MDC24                    N2PF.                                    
      @874    MDNUM1_R                 N9PF.                                    
      @883    MDNUM2_R                 N9PF.                                    
      @892    MEDINCSTQ                N2PF.                                    
      @894    MRN_R                    N9PF.                                    
      @903    NDX                      N2PF.                                    
      @905    NECODE                   N2PF.                                    
      @907    NEOMAT                   N2PF.                                    
      @909    NPR                      N2PF.                                    
      @911    PAY1                     N2PF.                                    
      @913    PL_CBSA                  N3PF.                                    
      @916    PL_MSA1993               N3PF.                                    
      @919    PL_NCHS2006              N2PF.                                    
      @921    PL_RUCA10_2005           N2PF.                                    
      @923    PL_RUCA2005              N4P1F.                                   
      @927    PL_RUCA4_2005            N2PF.                                    
      @929    PL_RUCC2003              N2PF.                                    
      @931    PL_UIC2003               N2PF.                                    
      @933    PL_UR_CAT4               N2PF.                                    
      @935    PR1                      $CHAR4.                                  
      @939    PR2                      $CHAR4.                                  
      @943    PR3                      $CHAR4.                                  
      @947    PR4                      $CHAR4.                                  
      @951    PR5                      $CHAR4.                                  
      @955    PR6                      $CHAR4.                                  
      @959    PR7                      $CHAR4.                                  
      @963    PR8                      $CHAR4.                                  
      @967    PR9                      $CHAR4.                                  
      @971    PR10                     $CHAR4.                                  
      @975    PR11                     $CHAR4.                                  
      @979    PR12                     $CHAR4.                                  
      @983    PR13                     $CHAR4.                                  
      @987    PR14                     $CHAR4.                                  
      @991    PR15                     $CHAR4.                                  
      @995    PR16                     $CHAR4.                                  
      @999    PR17                     $CHAR4.                                  
      @1003   PR18                     $CHAR4.                                  
      @1007   PR19                     $CHAR4.                                  
      @1011   PR20                     $CHAR4.                                  
      @1015   PR21                     $CHAR4.                                  
      @1019   PR22                     $CHAR4.                                  
      @1023   PR23                     $CHAR4.                                  
      @1027   PR24                     $CHAR4.                                  
      @1031   PR25                     $CHAR4.                                  
      @1035   PR26                     $CHAR4.                                  
      @1039   PR27                     $CHAR4.                                  
      @1043   PR28                     $CHAR4.                                  
      @1047   PR29                     $CHAR4.                                  
      @1051   PR30                     $CHAR4.                                  
      @1055   PR31                     $CHAR4.                                  
      @1059   PR32                     $CHAR4.                                  
      @1063   PR33                     $CHAR4.                                  
      @1067   PR34                     $CHAR4.                                  
      @1071   PR35                     $CHAR4.                                  
      @1075   PR36                     $CHAR4.                                  
      @1079   PR37                     $CHAR4.                                  
      @1083   PR38                     $CHAR4.                                  
      @1087   PR39                     $CHAR4.                                  
      @1091   PR40                     $CHAR4.                                  
      @1095   PR41                     $CHAR4.                                  
      @1099   PR42                     $CHAR4.                                  
      @1103   PR43                     $CHAR4.                                  
      @1107   PR44                     $CHAR4.                                  
      @1111   PRCCS1                   N3PF.                                    
      @1114   PRCCS2                   N3PF.                                    
      @1117   PRCCS3                   N3PF.                                    
      @1120   PRCCS4                   N3PF.                                    
      @1123   PRCCS5                   N3PF.                                    
      @1126   PRCCS6                   N3PF.                                    
      @1129   PRCCS7                   N3PF.                                    
      @1132   PRCCS8                   N3PF.                                    
      @1135   PRCCS9                   N3PF.                                    
      @1138   PRCCS10                  N3PF.                                    
      @1141   PRCCS11                  N3PF.                                    
      @1144   PRCCS12                  N3PF.                                    
      @1147   PRCCS13                  N3PF.                                    
      @1150   PRCCS14                  N3PF.                                    
      @1153   PRCCS15                  N3PF.                                    
      @1156   PRCCS16                  N3PF.                                    
      @1159   PRCCS17                  N3PF.                                    
      @1162   PRCCS18                  N3PF.                                    
      @1165   PRCCS19                  N3PF.                                    
      @1168   PRCCS20                  N3PF.                                    
      @1171   PRCCS21                  N3PF.                                    
      @1174   PRCCS22                  N3PF.                                    
      @1177   PRCCS23                  N3PF.                                    
      @1180   PRCCS24                  N3PF.                                    
      @1183   PRCCS25                  N3PF.                                    
      @1186   PRCCS26                  N3PF.                                    
      @1189   PRCCS27                  N3PF.                                    
      @1192   PRCCS28                  N3PF.                                    
      @1195   PRCCS29                  N3PF.                                    
      @1198   PRCCS30                  N3PF.                                    
      @1201   PRCCS31                  N3PF.                                    
      @1204   PRCCS32                  N3PF.                                    
      @1207   PRCCS33                  N3PF.                                    
      @1210   PRCCS34                  N3PF.                                    
      @1213   PRCCS35                  N3PF.                                    
      @1216   PRCCS36                  N3PF.                                    
      @1219   PRCCS37                  N3PF.                                    
      @1222   PRCCS38                  N3PF.                                    
      @1225   PRCCS39                  N3PF.                                    
      @1228   PRCCS40                  N3PF.                                    
      @1231   PRCCS41                  N3PF.                                    
      @1234   PRCCS42                  N3PF.                                    
      @1237   PRCCS43                  N3PF.                                    
      @1240   PRCCS44                  N3PF.                                    
      @1243   PRDAY1                   N5PF.                                    
      @1248   PRDAY2                   N5PF.                                    
      @1253   PRDAY3                   N5PF.                                    
      @1258   PRDAY4                   N5PF.                                    
      @1263   PRDAY5                   N5PF.                                    
      @1268   PRDAY6                   N5PF.                                    
      @1273   PRDAY7                   N5PF.                                    
      @1278   PRDAY8                   N5PF.                                    
      @1283   PRDAY9                   N5PF.                                    
      @1288   PRDAY10                  N5PF.                                    
      @1293   PRDAY11                  N5PF.                                    
      @1298   PRDAY12                  N5PF.                                    
      @1303   PRDAY13                  N5PF.                                    
      @1308   PRDAY14                  N5PF.                                    
      @1313   PRDAY15                  N5PF.                                    
      @1318   PRDAY16                  N5PF.                                    
      @1323   PRDAY17                  N5PF.                                    
      @1328   PRDAY18                  N5PF.                                    
      @1333   PRDAY19                  N5PF.                                    
      @1338   PRDAY20                  N5PF.                                    
      @1343   PRDAY21                  N5PF.                                    
      @1348   PRDAY22                  N5PF.                                    
      @1353   PRDAY23                  N5PF.                                    
      @1358   PRDAY24                  N5PF.                                    
      @1363   PRDAY25                  N5PF.                                    
      @1368   PRDAY26                  N5PF.                                    
      @1373   PRDAY27                  N5PF.                                    
      @1378   PRDAY28                  N5PF.                                    
      @1383   PRDAY29                  N5PF.                                    
      @1388   PRDAY30                  N5PF.                                    
      @1393   PRDAY31                  N5PF.                                    
      @1398   PRDAY32                  N5PF.                                    
      @1403   PRDAY33                  N5PF.                                    
      @1408   PRDAY34                  N5PF.                                    
      @1413   PRDAY35                  N5PF.                                    
      @1418   PRDAY36                  N5PF.                                    
      @1423   PRDAY37                  N5PF.                                    
      @1428   PRDAY38                  N5PF.                                    
      @1433   PRDAY39                  N5PF.                                    
      @1438   PRDAY40                  N5PF.                                    
      @1443   PRDAY41                  N5PF.                                    
      @1448   PRDAY42                  N5PF.                                    
      @1453   PRDAY43                  N5PF.                                    
      @1458   PRDAY44                  N5PF.                                    
      @1463   PROCTYPE                 N3PF.                                    
      @1466   PSTATE                   $CHAR2.                                  
      @1468   PSTCO                    N5PF.                                    
      @1473   PSTCO2                   N5PF.                                    
      @1478   PointOfOriginUB04        $CHAR1.                                  
      @1479   PointOfOrigin_X          $CHAR1.                                  
      @1480   RACE                     N2PF.                                    
      @1482   RACE_X                   $CHAR4.                                  
      @1486   TOTCHG                   N10PF.                                   
      @1496   TOTCHG_X                 N15P2F.                                  
      @1511   YEAR                     N4PF.                                    
      @1515   ZIP3                     $CHAR3.                                  
      @1518   ZIPINC_QRTL              N3PF.                                    
      @1521   HOSPID                   N5PF.                                    
      @1526   ZIP                      $CHAR5.                                  
      @1531   AYEAR                    N4PF.                                    
      @1535   DMONTH                   N2PF.                                    
      @1537   BMONTH                   N2PF.                                    
      @1539   BYEAR                    N4PF.                                    
      @1543   PRMONTH1                 N2PF.                                    
      @1545   PRMONTH2                 N2PF.                                    
      @1547   PRMONTH3                 N2PF.                                    
      @1549   PRMONTH4                 N2PF.                                    
      @1551   PRMONTH5                 N2PF.                                    
      @1553   PRMONTH6                 N2PF.                                    
      @1555   PRMONTH7                 N2PF.                                    
      @1557   PRMONTH8                 N2PF.                                    
      @1559   PRMONTH9                 N2PF.                                    
      @1561   PRMONTH10                N2PF.                                    
      @1563   PRMONTH11                N2PF.                                    
      @1565   PRMONTH12                N2PF.                                    
      @1567   PRMONTH13                N2PF.                                    
      @1569   PRMONTH14                N2PF.                                    
      @1571   PRMONTH15                N2PF.                                    
      @1573   PRMONTH16                N2PF.                                    
      @1575   PRMONTH17                N2PF.                                    
      @1577   PRMONTH18                N2PF.                                    
      @1579   PRMONTH19                N2PF.                                    
      @1581   PRMONTH20                N2PF.                                    
      @1583   PRMONTH21                N2PF.                                    
      @1585   PRMONTH22                N2PF.                                    
      @1587   PRMONTH23                N2PF.                                    
      @1589   PRMONTH24                N2PF.                                    
      @1591   PRMONTH25                N2PF.                                    
      @1593   PRMONTH26                N2PF.                                    
      @1595   PRMONTH27                N2PF.                                    
      @1597   PRMONTH28                N2PF.                                    
      @1599   PRMONTH29                N2PF.                                    
      @1601   PRMONTH30                N2PF.                                    
      @1603   PRMONTH31                N2PF.                                    
      @1605   PRMONTH32                N2PF.                                    
      @1607   PRMONTH33                N2PF.                                    
      @1609   PRMONTH34                N2PF.                                    
      @1611   PRMONTH35                N2PF.                                    
      @1613   PRMONTH36                N2PF.                                    
      @1615   PRMONTH37                N2PF.                                    
      @1617   PRMONTH38                N2PF.                                    
      @1619   PRMONTH39                N2PF.                                    
      @1621   PRMONTH40                N2PF.                                    
      @1623   PRMONTH41                N2PF.                                    
      @1625   PRMONTH42                N2PF.                                    
      @1627   PRMONTH43                N2PF.                                    
      @1629   PRMONTH44                N2PF.                                    
      @1631   PRYEAR1                  N4PF.                                    
      @1635   PRYEAR2                  N4PF.                                    
      @1639   PRYEAR3                  N4PF.                                    
      @1643   PRYEAR4                  N4PF.                                    
      @1647   PRYEAR5                  N4PF.                                    
      @1651   PRYEAR6                  N4PF.                                    
      @1655   PRYEAR7                  N4PF.                                    
      @1659   PRYEAR8                  N4PF.                                    
      @1663   PRYEAR9                  N4PF.                                    
      @1667   PRYEAR10                 N4PF.                                    
      @1671   PRYEAR11                 N4PF.                                    
      @1675   PRYEAR12                 N4PF.                                    
      @1679   PRYEAR13                 N4PF.                                    
      @1683   PRYEAR14                 N4PF.                                    
      @1687   PRYEAR15                 N4PF.                                    
      @1691   PRYEAR16                 N4PF.                                    
      @1695   PRYEAR17                 N4PF.                                    
      @1699   PRYEAR18                 N4PF.                                    
      @1703   PRYEAR19                 N4PF.                                    
      @1707   PRYEAR20                 N4PF.                                    
      @1711   PRYEAR21                 N4PF.                                    
      @1715   PRYEAR22                 N4PF.                                    
      @1719   PRYEAR23                 N4PF.                                    
      @1723   PRYEAR24                 N4PF.                                    
      @1727   PRYEAR25                 N4PF.                                    
      @1731   PRYEAR26                 N4PF.                                    
      @1735   PRYEAR27                 N4PF.                                    
      @1739   PRYEAR28                 N4PF.                                    
      @1743   PRYEAR29                 N4PF.                                    
      @1747   PRYEAR30                 N4PF.                                    
      @1751   PRYEAR31                 N4PF.                                    
      @1755   PRYEAR32                 N4PF.                                    
      @1759   PRYEAR33                 N4PF.                                    
      @1763   PRYEAR34                 N4PF.                                    
      @1767   PRYEAR35                 N4PF.                                    
      @1771   PRYEAR36                 N4PF.                                    
      @1775   PRYEAR37                 N4PF.                                    
      @1779   PRYEAR38                 N4PF.                                    
      @1783   PRYEAR39                 N4PF.                                    
      @1787   PRYEAR40                 N4PF.                                    
      @1791   PRYEAR41                 N4PF.                                    
      @1795   PRYEAR42                 N4PF.                                    
      @1799   PRYEAR43                 N4PF.                                    
      @1803   PRYEAR44                 N4PF.                                    
      ;                                                                         
                                                                                
                                                                                
RUN;
