/*******************************************************************            
*   SD_SID_2011_CORE.SAS:                                                       
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
DATA SD_SIDC_2011_CORE;                                                         
INFILE 'SD_SID_2011_CORE.ASC' LRECL = 2333;                                     
                                                                                
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
                                                                                
  DX80                       LENGTH=$5                                          
  LABEL="Diagnosis 80"                                                          
                                                                                
  DX81                       LENGTH=$5                                          
  LABEL="Diagnosis 81"                                                          
                                                                                
  DX82                       LENGTH=$5                                          
  LABEL="Diagnosis 82"                                                          
                                                                                
  DX83                       LENGTH=$5                                          
  LABEL="Diagnosis 83"                                                          
                                                                                
  DX84                       LENGTH=$5                                          
  LABEL="Diagnosis 84"                                                          
                                                                                
  DX85                       LENGTH=$5                                          
  LABEL="Diagnosis 85"                                                          
                                                                                
  DX86                       LENGTH=$5                                          
  LABEL="Diagnosis 86"                                                          
                                                                                
  DX87                       LENGTH=$5                                          
  LABEL="Diagnosis 87"                                                          
                                                                                
  DX88                       LENGTH=$5                                          
  LABEL="Diagnosis 88"                                                          
                                                                                
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
                                                                                
  DXCCS80                    LENGTH=4                                           
  LABEL="CCS: diagnosis 80"                                                     
                                                                                
  DXCCS81                    LENGTH=4                                           
  LABEL="CCS: diagnosis 81"                                                     
                                                                                
  DXCCS82                    LENGTH=4                                           
  LABEL="CCS: diagnosis 82"                                                     
                                                                                
  DXCCS83                    LENGTH=4                                           
  LABEL="CCS: diagnosis 83"                                                     
                                                                                
  DXCCS84                    LENGTH=4                                           
  LABEL="CCS: diagnosis 84"                                                     
                                                                                
  DXCCS85                    LENGTH=4                                           
  LABEL="CCS: diagnosis 85"                                                     
                                                                                
  DXCCS86                    LENGTH=4                                           
  LABEL="CCS: diagnosis 86"                                                     
                                                                                
  DXCCS87                    LENGTH=4                                           
  LABEL="CCS: diagnosis 87"                                                     
                                                                                
  DXCCS88                    LENGTH=4                                           
  LABEL="CCS: diagnosis 88"                                                     
                                                                                
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
                                                                                
  DXPOA62                    LENGTH=$1                                          
  LABEL="Diagnosis 62, present on admission indicator"                          
                                                                                
  DXPOA63                    LENGTH=$1                                          
  LABEL="Diagnosis 63, present on admission indicator"                          
                                                                                
  DXPOA64                    LENGTH=$1                                          
  LABEL="Diagnosis 64, present on admission indicator"                          
                                                                                
  DXPOA65                    LENGTH=$1                                          
  LABEL="Diagnosis 65, present on admission indicator"                          
                                                                                
  DXPOA66                    LENGTH=$1                                          
  LABEL="Diagnosis 66, present on admission indicator"                          
                                                                                
  DXPOA67                    LENGTH=$1                                          
  LABEL="Diagnosis 67, present on admission indicator"                          
                                                                                
  DXPOA68                    LENGTH=$1                                          
  LABEL="Diagnosis 68, present on admission indicator"                          
                                                                                
  DXPOA69                    LENGTH=$1                                          
  LABEL="Diagnosis 69, present on admission indicator"                          
                                                                                
  DXPOA70                    LENGTH=$1                                          
  LABEL="Diagnosis 70, present on admission indicator"                          
                                                                                
  DXPOA71                    LENGTH=$1                                          
  LABEL="Diagnosis 71, present on admission indicator"                          
                                                                                
  DXPOA72                    LENGTH=$1                                          
  LABEL="Diagnosis 72, present on admission indicator"                          
                                                                                
  DXPOA73                    LENGTH=$1                                          
  LABEL="Diagnosis 73, present on admission indicator"                          
                                                                                
  DXPOA74                    LENGTH=$1                                          
  LABEL="Diagnosis 74, present on admission indicator"                          
                                                                                
  DXPOA75                    LENGTH=$1                                          
  LABEL="Diagnosis 75, present on admission indicator"                          
                                                                                
  DXPOA76                    LENGTH=$1                                          
  LABEL="Diagnosis 76, present on admission indicator"                          
                                                                                
  DXPOA77                    LENGTH=$1                                          
  LABEL="Diagnosis 77, present on admission indicator"                          
                                                                                
  DXPOA78                    LENGTH=$1                                          
  LABEL="Diagnosis 78, present on admission indicator"                          
                                                                                
  DXPOA79                    LENGTH=$1                                          
  LABEL="Diagnosis 79, present on admission indicator"                          
                                                                                
  DXPOA80                    LENGTH=$1                                          
  LABEL="Diagnosis 80, present on admission indicator"                          
                                                                                
  DXPOA81                    LENGTH=$1                                          
  LABEL="Diagnosis 81, present on admission indicator"                          
                                                                                
  DXPOA82                    LENGTH=$1                                          
  LABEL="Diagnosis 82, present on admission indicator"                          
                                                                                
  DXPOA83                    LENGTH=$1                                          
  LABEL="Diagnosis 83, present on admission indicator"                          
                                                                                
  DXPOA84                    LENGTH=$1                                          
  LABEL="Diagnosis 84, present on admission indicator"                          
                                                                                
  DXPOA85                    LENGTH=$1                                          
  LABEL="Diagnosis 85, present on admission indicator"                          
                                                                                
  DXPOA86                    LENGTH=$1                                          
  LABEL="Diagnosis 86, present on admission indicator"                          
                                                                                
  DXPOA87                    LENGTH=$1                                          
  LABEL="Diagnosis 87, present on admission indicator"                          
                                                                                
  DXPOA88                    LENGTH=$1                                          
  LABEL="Diagnosis 88, present on admission indicator"                          
                                                                                
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
                                                                                
  E_POA7                     LENGTH=$1                                          
  LABEL="E Code 7, present on admission indicator"                              
                                                                                
  FEMALE                     LENGTH=3                                           
  LABEL="Indicator of sex"                                                      
                                                                                
  HCUP_ED                    LENGTH=3                                           
  LABEL="HCUP Emergency Department service indicator"                           
                                                                                
  HCUP_OS                    LENGTH=3                                           
  LABEL="HCUP Observation Stay service indicator"                               
                                                                                
  HCUP_SURGERY_BROAD         LENGTH=3                                           
  LABEL="Revised HCUP_AS (PCLASSn=3 or 4, or broad definition)"                 
                                                                                
  HCUP_SURGERY_NARROW        LENGTH=3                                           
  LABEL="Revised HCUP_AS (PCLASSn=4, or narrow definition)"                     
                                                                                
  HOSPBRTH                   LENGTH=3                                           
  LABEL="Indicator of birth in this hospital"                                   
                                                                                
  HOSPST                     LENGTH=$2                                          
  LABEL="Hospital state postal code"                                            
                                                                                
  HospitalUnit               LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indicator that patient was discharged from a special unit within an acute care 
hospital (reported by source)"                                                  
                                                                                
  KEY                        LENGTH=8                 FORMAT=Z18.               
  LABEL="HCUP record identifier"                                                
                                                                                
  LOS                        LENGTH=4                                           
  LABEL="Length of stay (cleaned)"                                              
                                                                                
  LOS_X                      LENGTH=4                                           
  LABEL="Length of stay (as received from source)"                              
                                                                                
  MDC                        LENGTH=3                                           
  LABEL="MDC in effect on discharge date"                                       
                                                                                
  MDC24                      LENGTH=3                                           
  LABEL="MDC, version 24"                                                       
                                                                                
  MDC_NoPOA                  LENGTH=3                                           
  LABEL="MDC in use on discharge date, calculated without POA"                  
                                                                                
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
                                                                                
  NCHRONIC                   LENGTH=3                                           
  LABEL="Number of chronic conditions"                                          
                                                                                
  NDX                        LENGTH=3                                           
  LABEL="Number of diagnoses on this record"                                    
                                                                                
  NECODE                     LENGTH=3                                           
  LABEL="Number of E codes on this record"                                      
                                                                                
  NEOMAT                     LENGTH=3                                           
  LABEL="Neonatal and/or maternal DX and/or PR"                                 
                                                                                
  NPR                        LENGTH=3                                           
  LABEL="Number of procedures on this record"                                   
                                                                                
  ORPROC                     LENGTH=3                                           
  LABEL="Major operating room procedure indicator"                              
                                                                                
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
                                                                                
  PR47                       LENGTH=$4                                          
  LABEL="Procedure 47"                                                          
                                                                                
  PR48                       LENGTH=$4                                          
  LABEL="Procedure 48"                                                          
                                                                                
  PR49                       LENGTH=$4                                          
  LABEL="Procedure 49"                                                          
                                                                                
  PR50                       LENGTH=$4                                          
  LABEL="Procedure 50"                                                          
                                                                                
  PR51                       LENGTH=$4                                          
  LABEL="Procedure 51"                                                          
                                                                                
  PR52                       LENGTH=$4                                          
  LABEL="Procedure 52"                                                          
                                                                                
  PR53                       LENGTH=$4                                          
  LABEL="Procedure 53"                                                          
                                                                                
  PR54                       LENGTH=$4                                          
  LABEL="Procedure 54"                                                          
                                                                                
  PR55                       LENGTH=$4                                          
  LABEL="Procedure 55"                                                          
                                                                                
  PR56                       LENGTH=$4                                          
  LABEL="Procedure 56"                                                          
                                                                                
  PR57                       LENGTH=$4                                          
  LABEL="Procedure 57"                                                          
                                                                                
  PR58                       LENGTH=$4                                          
  LABEL="Procedure 58"                                                          
                                                                                
  PR59                       LENGTH=$4                                          
  LABEL="Procedure 59"                                                          
                                                                                
  PR60                       LENGTH=$4                                          
  LABEL="Procedure 60"                                                          
                                                                                
  PR61                       LENGTH=$4                                          
  LABEL="Procedure 61"                                                          
                                                                                
  PR62                       LENGTH=$4                                          
  LABEL="Procedure 62"                                                          
                                                                                
  PR63                       LENGTH=$4                                          
  LABEL="Procedure 63"                                                          
                                                                                
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
                                                                                
  PRCCS47                    LENGTH=3                                           
  LABEL="CCS: procedure 47"                                                     
                                                                                
  PRCCS48                    LENGTH=3                                           
  LABEL="CCS: procedure 48"                                                     
                                                                                
  PRCCS49                    LENGTH=3                                           
  LABEL="CCS: procedure 49"                                                     
                                                                                
  PRCCS50                    LENGTH=3                                           
  LABEL="CCS: procedure 50"                                                     
                                                                                
  PRCCS51                    LENGTH=3                                           
  LABEL="CCS: procedure 51"                                                     
                                                                                
  PRCCS52                    LENGTH=3                                           
  LABEL="CCS: procedure 52"                                                     
                                                                                
  PRCCS53                    LENGTH=3                                           
  LABEL="CCS: procedure 53"                                                     
                                                                                
  PRCCS54                    LENGTH=3                                           
  LABEL="CCS: procedure 54"                                                     
                                                                                
  PRCCS55                    LENGTH=3                                           
  LABEL="CCS: procedure 55"                                                     
                                                                                
  PRCCS56                    LENGTH=3                                           
  LABEL="CCS: procedure 56"                                                     
                                                                                
  PRCCS57                    LENGTH=3                                           
  LABEL="CCS: procedure 57"                                                     
                                                                                
  PRCCS58                    LENGTH=3                                           
  LABEL="CCS: procedure 58"                                                     
                                                                                
  PRCCS59                    LENGTH=3                                           
  LABEL="CCS: procedure 59"                                                     
                                                                                
  PRCCS60                    LENGTH=3                                           
  LABEL="CCS: procedure 60"                                                     
                                                                                
  PRCCS61                    LENGTH=3                                           
  LABEL="CCS: procedure 61"                                                     
                                                                                
  PRCCS62                    LENGTH=3                                           
  LABEL="CCS: procedure 62"                                                     
                                                                                
  PRCCS63                    LENGTH=3                                           
  LABEL="CCS: procedure 63"                                                     
                                                                                
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
                                                                                
  PRDAY47                    LENGTH=4                                           
  LABEL="Number of days from admission to PR47"                                 
                                                                                
  PRDAY48                    LENGTH=4                                           
  LABEL="Number of days from admission to PR48"                                 
                                                                                
  PRDAY49                    LENGTH=4                                           
  LABEL="Number of days from admission to PR49"                                 
                                                                                
  PRDAY50                    LENGTH=4                                           
  LABEL="Number of days from admission to PR50"                                 
                                                                                
  PRDAY51                    LENGTH=4                                           
  LABEL="Number of days from admission to PR51"                                 
                                                                                
  PRDAY52                    LENGTH=4                                           
  LABEL="Number of days from admission to PR52"                                 
                                                                                
  PRDAY53                    LENGTH=4                                           
  LABEL="Number of days from admission to PR53"                                 
                                                                                
  PRDAY54                    LENGTH=4                                           
  LABEL="Number of days from admission to PR54"                                 
                                                                                
  PRDAY55                    LENGTH=4                                           
  LABEL="Number of days from admission to PR55"                                 
                                                                                
  PRDAY56                    LENGTH=4                                           
  LABEL="Number of days from admission to PR56"                                 
                                                                                
  PRDAY57                    LENGTH=4                                           
  LABEL="Number of days from admission to PR57"                                 
                                                                                
  PRDAY58                    LENGTH=4                                           
  LABEL="Number of days from admission to PR58"                                 
                                                                                
  PRDAY59                    LENGTH=4                                           
  LABEL="Number of days from admission to PR59"                                 
                                                                                
  PRDAY60                    LENGTH=4                                           
  LABEL="Number of days from admission to PR60"                                 
                                                                                
  PRDAY61                    LENGTH=4                                           
  LABEL="Number of days from admission to PR61"                                 
                                                                                
  PRDAY62                    LENGTH=4                                           
  LABEL="Number of days from admission to PR62"                                 
                                                                                
  PRDAY63                    LENGTH=4                                           
  LABEL="Number of days from admission to PR63"                                 
                                                                                
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
                                                                                
  TRAN_IN                    LENGTH=3                                           
  LABEL="Transfer in indicator"                                                 
                                                                                
  TRAN_OUT                   LENGTH=3                                           
  LABEL="Transfer out indicator"                                                
                                                                                
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
                                                                                
  PRMONTH47                  LENGTH=3                                           
  LABEL="Month of procedure 47"                                                 
                                                                                
  PRMONTH48                  LENGTH=3                                           
  LABEL="Month of procedure 48"                                                 
                                                                                
  PRMONTH49                  LENGTH=3                                           
  LABEL="Month of procedure 49"                                                 
                                                                                
  PRMONTH50                  LENGTH=3                                           
  LABEL="Month of procedure 50"                                                 
                                                                                
  PRMONTH51                  LENGTH=3                                           
  LABEL="Month of procedure 51"                                                 
                                                                                
  PRMONTH52                  LENGTH=3                                           
  LABEL="Month of procedure 52"                                                 
                                                                                
  PRMONTH53                  LENGTH=3                                           
  LABEL="Month of procedure 53"                                                 
                                                                                
  PRMONTH54                  LENGTH=3                                           
  LABEL="Month of procedure 54"                                                 
                                                                                
  PRMONTH55                  LENGTH=3                                           
  LABEL="Month of procedure 55"                                                 
                                                                                
  PRMONTH56                  LENGTH=3                                           
  LABEL="Month of procedure 56"                                                 
                                                                                
  PRMONTH57                  LENGTH=3                                           
  LABEL="Month of procedure 57"                                                 
                                                                                
  PRMONTH58                  LENGTH=3                                           
  LABEL="Month of procedure 58"                                                 
                                                                                
  PRMONTH59                  LENGTH=3                                           
  LABEL="Month of procedure 59"                                                 
                                                                                
  PRMONTH60                  LENGTH=3                                           
  LABEL="Month of procedure 60"                                                 
                                                                                
  PRMONTH61                  LENGTH=3                                           
  LABEL="Month of procedure 61"                                                 
                                                                                
  PRMONTH62                  LENGTH=3                                           
  LABEL="Month of procedure 62"                                                 
                                                                                
  PRMONTH63                  LENGTH=3                                           
  LABEL="Month of procedure 63"                                                 
                                                                                
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
                                                                                
  PRYEAR47                   LENGTH=3                                           
  LABEL="Year of procedure 47"                                                  
                                                                                
  PRYEAR48                   LENGTH=3                                           
  LABEL="Year of procedure 48"                                                  
                                                                                
  PRYEAR49                   LENGTH=3                                           
  LABEL="Year of procedure 49"                                                  
                                                                                
  PRYEAR50                   LENGTH=3                                           
  LABEL="Year of procedure 50"                                                  
                                                                                
  PRYEAR51                   LENGTH=3                                           
  LABEL="Year of procedure 51"                                                  
                                                                                
  PRYEAR52                   LENGTH=3                                           
  LABEL="Year of procedure 52"                                                  
                                                                                
  PRYEAR53                   LENGTH=3                                           
  LABEL="Year of procedure 53"                                                  
                                                                                
  PRYEAR54                   LENGTH=3                                           
  LABEL="Year of procedure 54"                                                  
                                                                                
  PRYEAR55                   LENGTH=3                                           
  LABEL="Year of procedure 55"                                                  
                                                                                
  PRYEAR56                   LENGTH=3                                           
  LABEL="Year of procedure 56"                                                  
                                                                                
  PRYEAR57                   LENGTH=3                                           
  LABEL="Year of procedure 57"                                                  
                                                                                
  PRYEAR58                   LENGTH=3                                           
  LABEL="Year of procedure 58"                                                  
                                                                                
  PRYEAR59                   LENGTH=3                                           
  LABEL="Year of procedure 59"                                                  
                                                                                
  PRYEAR60                   LENGTH=3                                           
  LABEL="Year of procedure 60"                                                  
                                                                                
  PRYEAR61                   LENGTH=3                                           
  LABEL="Year of procedure 61"                                                  
                                                                                
  PRYEAR62                   LENGTH=3                                           
  LABEL="Year of procedure 62"                                                  
                                                                                
  PRYEAR63                   LENGTH=3                                           
  LABEL="Year of procedure 63"                                                  
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
      @344    DX62                     $CHAR5.                                  
      @349    DX63                     $CHAR5.                                  
      @354    DX64                     $CHAR5.                                  
      @359    DX65                     $CHAR5.                                  
      @364    DX66                     $CHAR5.                                  
      @369    DX67                     $CHAR5.                                  
      @374    DX68                     $CHAR5.                                  
      @379    DX69                     $CHAR5.                                  
      @384    DX70                     $CHAR5.                                  
      @389    DX71                     $CHAR5.                                  
      @394    DX72                     $CHAR5.                                  
      @399    DX73                     $CHAR5.                                  
      @404    DX74                     $CHAR5.                                  
      @409    DX75                     $CHAR5.                                  
      @414    DX76                     $CHAR5.                                  
      @419    DX77                     $CHAR5.                                  
      @424    DX78                     $CHAR5.                                  
      @429    DX79                     $CHAR5.                                  
      @434    DX80                     $CHAR5.                                  
      @439    DX81                     $CHAR5.                                  
      @444    DX82                     $CHAR5.                                  
      @449    DX83                     $CHAR5.                                  
      @454    DX84                     $CHAR5.                                  
      @459    DX85                     $CHAR5.                                  
      @464    DX86                     $CHAR5.                                  
      @469    DX87                     $CHAR5.                                  
      @474    DX88                     $CHAR5.                                  
      @479    DXCCS1                   N4PF.                                    
      @483    DXCCS2                   N4PF.                                    
      @487    DXCCS3                   N4PF.                                    
      @491    DXCCS4                   N4PF.                                    
      @495    DXCCS5                   N4PF.                                    
      @499    DXCCS6                   N4PF.                                    
      @503    DXCCS7                   N4PF.                                    
      @507    DXCCS8                   N4PF.                                    
      @511    DXCCS9                   N4PF.                                    
      @515    DXCCS10                  N4PF.                                    
      @519    DXCCS11                  N4PF.                                    
      @523    DXCCS12                  N4PF.                                    
      @527    DXCCS13                  N4PF.                                    
      @531    DXCCS14                  N4PF.                                    
      @535    DXCCS15                  N4PF.                                    
      @539    DXCCS16                  N4PF.                                    
      @543    DXCCS17                  N4PF.                                    
      @547    DXCCS18                  N4PF.                                    
      @551    DXCCS19                  N4PF.                                    
      @555    DXCCS20                  N4PF.                                    
      @559    DXCCS21                  N4PF.                                    
      @563    DXCCS22                  N4PF.                                    
      @567    DXCCS23                  N4PF.                                    
      @571    DXCCS24                  N4PF.                                    
      @575    DXCCS25                  N4PF.                                    
      @579    DXCCS26                  N4PF.                                    
      @583    DXCCS27                  N4PF.                                    
      @587    DXCCS28                  N4PF.                                    
      @591    DXCCS29                  N4PF.                                    
      @595    DXCCS30                  N4PF.                                    
      @599    DXCCS31                  N4PF.                                    
      @603    DXCCS32                  N4PF.                                    
      @607    DXCCS33                  N4PF.                                    
      @611    DXCCS34                  N4PF.                                    
      @615    DXCCS35                  N4PF.                                    
      @619    DXCCS36                  N4PF.                                    
      @623    DXCCS37                  N4PF.                                    
      @627    DXCCS38                  N4PF.                                    
      @631    DXCCS39                  N4PF.                                    
      @635    DXCCS40                  N4PF.                                    
      @639    DXCCS41                  N4PF.                                    
      @643    DXCCS42                  N4PF.                                    
      @647    DXCCS43                  N4PF.                                    
      @651    DXCCS44                  N4PF.                                    
      @655    DXCCS45                  N4PF.                                    
      @659    DXCCS46                  N4PF.                                    
      @663    DXCCS47                  N4PF.                                    
      @667    DXCCS48                  N4PF.                                    
      @671    DXCCS49                  N4PF.                                    
      @675    DXCCS50                  N4PF.                                    
      @679    DXCCS51                  N4PF.                                    
      @683    DXCCS52                  N4PF.                                    
      @687    DXCCS53                  N4PF.                                    
      @691    DXCCS54                  N4PF.                                    
      @695    DXCCS55                  N4PF.                                    
      @699    DXCCS56                  N4PF.                                    
      @703    DXCCS57                  N4PF.                                    
      @707    DXCCS58                  N4PF.                                    
      @711    DXCCS59                  N4PF.                                    
      @715    DXCCS60                  N4PF.                                    
      @719    DXCCS61                  N4PF.                                    
      @723    DXCCS62                  N4PF.                                    
      @727    DXCCS63                  N4PF.                                    
      @731    DXCCS64                  N4PF.                                    
      @735    DXCCS65                  N4PF.                                    
      @739    DXCCS66                  N4PF.                                    
      @743    DXCCS67                  N4PF.                                    
      @747    DXCCS68                  N4PF.                                    
      @751    DXCCS69                  N4PF.                                    
      @755    DXCCS70                  N4PF.                                    
      @759    DXCCS71                  N4PF.                                    
      @763    DXCCS72                  N4PF.                                    
      @767    DXCCS73                  N4PF.                                    
      @771    DXCCS74                  N4PF.                                    
      @775    DXCCS75                  N4PF.                                    
      @779    DXCCS76                  N4PF.                                    
      @783    DXCCS77                  N4PF.                                    
      @787    DXCCS78                  N4PF.                                    
      @791    DXCCS79                  N4PF.                                    
      @795    DXCCS80                  N4PF.                                    
      @799    DXCCS81                  N4PF.                                    
      @803    DXCCS82                  N4PF.                                    
      @807    DXCCS83                  N4PF.                                    
      @811    DXCCS84                  N4PF.                                    
      @815    DXCCS85                  N4PF.                                    
      @819    DXCCS86                  N4PF.                                    
      @823    DXCCS87                  N4PF.                                    
      @827    DXCCS88                  N4PF.                                    
      @831    DXPOA1                   $CHAR1.                                  
      @832    DXPOA2                   $CHAR1.                                  
      @833    DXPOA3                   $CHAR1.                                  
      @834    DXPOA4                   $CHAR1.                                  
      @835    DXPOA5                   $CHAR1.                                  
      @836    DXPOA6                   $CHAR1.                                  
      @837    DXPOA7                   $CHAR1.                                  
      @838    DXPOA8                   $CHAR1.                                  
      @839    DXPOA9                   $CHAR1.                                  
      @840    DXPOA10                  $CHAR1.                                  
      @841    DXPOA11                  $CHAR1.                                  
      @842    DXPOA12                  $CHAR1.                                  
      @843    DXPOA13                  $CHAR1.                                  
      @844    DXPOA14                  $CHAR1.                                  
      @845    DXPOA15                  $CHAR1.                                  
      @846    DXPOA16                  $CHAR1.                                  
      @847    DXPOA17                  $CHAR1.                                  
      @848    DXPOA18                  $CHAR1.                                  
      @849    DXPOA19                  $CHAR1.                                  
      @850    DXPOA20                  $CHAR1.                                  
      @851    DXPOA21                  $CHAR1.                                  
      @852    DXPOA22                  $CHAR1.                                  
      @853    DXPOA23                  $CHAR1.                                  
      @854    DXPOA24                  $CHAR1.                                  
      @855    DXPOA25                  $CHAR1.                                  
      @856    DXPOA26                  $CHAR1.                                  
      @857    DXPOA27                  $CHAR1.                                  
      @858    DXPOA28                  $CHAR1.                                  
      @859    DXPOA29                  $CHAR1.                                  
      @860    DXPOA30                  $CHAR1.                                  
      @861    DXPOA31                  $CHAR1.                                  
      @862    DXPOA32                  $CHAR1.                                  
      @863    DXPOA33                  $CHAR1.                                  
      @864    DXPOA34                  $CHAR1.                                  
      @865    DXPOA35                  $CHAR1.                                  
      @866    DXPOA36                  $CHAR1.                                  
      @867    DXPOA37                  $CHAR1.                                  
      @868    DXPOA38                  $CHAR1.                                  
      @869    DXPOA39                  $CHAR1.                                  
      @870    DXPOA40                  $CHAR1.                                  
      @871    DXPOA41                  $CHAR1.                                  
      @872    DXPOA42                  $CHAR1.                                  
      @873    DXPOA43                  $CHAR1.                                  
      @874    DXPOA44                  $CHAR1.                                  
      @875    DXPOA45                  $CHAR1.                                  
      @876    DXPOA46                  $CHAR1.                                  
      @877    DXPOA47                  $CHAR1.                                  
      @878    DXPOA48                  $CHAR1.                                  
      @879    DXPOA49                  $CHAR1.                                  
      @880    DXPOA50                  $CHAR1.                                  
      @881    DXPOA51                  $CHAR1.                                  
      @882    DXPOA52                  $CHAR1.                                  
      @883    DXPOA53                  $CHAR1.                                  
      @884    DXPOA54                  $CHAR1.                                  
      @885    DXPOA55                  $CHAR1.                                  
      @886    DXPOA56                  $CHAR1.                                  
      @887    DXPOA57                  $CHAR1.                                  
      @888    DXPOA58                  $CHAR1.                                  
      @889    DXPOA59                  $CHAR1.                                  
      @890    DXPOA60                  $CHAR1.                                  
      @891    DXPOA61                  $CHAR1.                                  
      @892    DXPOA62                  $CHAR1.                                  
      @893    DXPOA63                  $CHAR1.                                  
      @894    DXPOA64                  $CHAR1.                                  
      @895    DXPOA65                  $CHAR1.                                  
      @896    DXPOA66                  $CHAR1.                                  
      @897    DXPOA67                  $CHAR1.                                  
      @898    DXPOA68                  $CHAR1.                                  
      @899    DXPOA69                  $CHAR1.                                  
      @900    DXPOA70                  $CHAR1.                                  
      @901    DXPOA71                  $CHAR1.                                  
      @902    DXPOA72                  $CHAR1.                                  
      @903    DXPOA73                  $CHAR1.                                  
      @904    DXPOA74                  $CHAR1.                                  
      @905    DXPOA75                  $CHAR1.                                  
      @906    DXPOA76                  $CHAR1.                                  
      @907    DXPOA77                  $CHAR1.                                  
      @908    DXPOA78                  $CHAR1.                                  
      @909    DXPOA79                  $CHAR1.                                  
      @910    DXPOA80                  $CHAR1.                                  
      @911    DXPOA81                  $CHAR1.                                  
      @912    DXPOA82                  $CHAR1.                                  
      @913    DXPOA83                  $CHAR1.                                  
      @914    DXPOA84                  $CHAR1.                                  
      @915    DXPOA85                  $CHAR1.                                  
      @916    DXPOA86                  $CHAR1.                                  
      @917    DXPOA87                  $CHAR1.                                  
      @918    DXPOA88                  $CHAR1.                                  
      @919    ECODE1                   $CHAR5.                                  
      @924    ECODE2                   $CHAR5.                                  
      @929    ECODE3                   $CHAR5.                                  
      @934    ECODE4                   $CHAR5.                                  
      @939    ECODE5                   $CHAR5.                                  
      @944    ECODE6                   $CHAR5.                                  
      @949    ECODE7                   $CHAR5.                                  
      @954    E_CCS1                   N4PF.                                    
      @958    E_CCS2                   N4PF.                                    
      @962    E_CCS3                   N4PF.                                    
      @966    E_CCS4                   N4PF.                                    
      @970    E_CCS5                   N4PF.                                    
      @974    E_CCS6                   N4PF.                                    
      @978    E_CCS7                   N4PF.                                    
      @982    E_POA1                   $CHAR1.                                  
      @983    E_POA2                   $CHAR1.                                  
      @984    E_POA3                   $CHAR1.                                  
      @985    E_POA4                   $CHAR1.                                  
      @986    E_POA5                   $CHAR1.                                  
      @987    E_POA6                   $CHAR1.                                  
      @988    E_POA7                   $CHAR1.                                  
      @989    FEMALE                   N2PF.                                    
      @991    HCUP_ED                  N2PF.                                    
      @993    HCUP_OS                  N2PF.                                    
      @995    HCUP_SURGERY_BROAD       N2PF.                                    
      @997    HCUP_SURGERY_NARROW      N2PF.                                    
      @999    HOSPBRTH                 N3PF.                                    
      @1002   HOSPST                   $CHAR2.                                  
      @1004   HospitalUnit             N2PF.                                    
      @1006   KEY                      18.                                      
      @1024   LOS                      N5PF.                                    
      @1029   LOS_X                    N6PF.                                    
      @1035   MDC                      N2PF.                                    
      @1037   MDC24                    N2PF.                                    
      @1039   MDC_NoPOA                N2PF.                                    
      @1041   MDNUM1_R                 N9PF.                                    
      @1050   MDNUM2_R                 N9PF.                                    
      @1059   MDNUM3_R                 N9PF.                                    
      @1068   MEDINCSTQ                N2PF.                                    
      @1070   MRN_R                    N9PF.                                    
      @1079   NCHRONIC                 N3PF.                                    
      @1082   NDX                      N2PF.                                    
      @1084   NECODE                   N2PF.                                    
      @1086   NEOMAT                   N2PF.                                    
      @1088   NPR                      N2PF.                                    
      @1090   ORPROC                   N2PF.                                    
      @1092   PAY1                     N2PF.                                    
      @1094   PL_CBSA                  N3PF.                                    
      @1097   PL_MSA1993               N3PF.                                    
      @1100   PL_NCHS2006              N2PF.                                    
      @1102   PL_RUCA10_2005           N2PF.                                    
      @1104   PL_RUCA2005              N4P1F.                                   
      @1108   PL_RUCA4_2005            N2PF.                                    
      @1110   PL_RUCC2003              N2PF.                                    
      @1112   PL_UIC2003               N2PF.                                    
      @1114   PL_UR_CAT4               N2PF.                                    
      @1116   PR1                      $CHAR4.                                  
      @1120   PR2                      $CHAR4.                                  
      @1124   PR3                      $CHAR4.                                  
      @1128   PR4                      $CHAR4.                                  
      @1132   PR5                      $CHAR4.                                  
      @1136   PR6                      $CHAR4.                                  
      @1140   PR7                      $CHAR4.                                  
      @1144   PR8                      $CHAR4.                                  
      @1148   PR9                      $CHAR4.                                  
      @1152   PR10                     $CHAR4.                                  
      @1156   PR11                     $CHAR4.                                  
      @1160   PR12                     $CHAR4.                                  
      @1164   PR13                     $CHAR4.                                  
      @1168   PR14                     $CHAR4.                                  
      @1172   PR15                     $CHAR4.                                  
      @1176   PR16                     $CHAR4.                                  
      @1180   PR17                     $CHAR4.                                  
      @1184   PR18                     $CHAR4.                                  
      @1188   PR19                     $CHAR4.                                  
      @1192   PR20                     $CHAR4.                                  
      @1196   PR21                     $CHAR4.                                  
      @1200   PR22                     $CHAR4.                                  
      @1204   PR23                     $CHAR4.                                  
      @1208   PR24                     $CHAR4.                                  
      @1212   PR25                     $CHAR4.                                  
      @1216   PR26                     $CHAR4.                                  
      @1220   PR27                     $CHAR4.                                  
      @1224   PR28                     $CHAR4.                                  
      @1228   PR29                     $CHAR4.                                  
      @1232   PR30                     $CHAR4.                                  
      @1236   PR31                     $CHAR4.                                  
      @1240   PR32                     $CHAR4.                                  
      @1244   PR33                     $CHAR4.                                  
      @1248   PR34                     $CHAR4.                                  
      @1252   PR35                     $CHAR4.                                  
      @1256   PR36                     $CHAR4.                                  
      @1260   PR37                     $CHAR4.                                  
      @1264   PR38                     $CHAR4.                                  
      @1268   PR39                     $CHAR4.                                  
      @1272   PR40                     $CHAR4.                                  
      @1276   PR41                     $CHAR4.                                  
      @1280   PR42                     $CHAR4.                                  
      @1284   PR43                     $CHAR4.                                  
      @1288   PR44                     $CHAR4.                                  
      @1292   PR45                     $CHAR4.                                  
      @1296   PR46                     $CHAR4.                                  
      @1300   PR47                     $CHAR4.                                  
      @1304   PR48                     $CHAR4.                                  
      @1308   PR49                     $CHAR4.                                  
      @1312   PR50                     $CHAR4.                                  
      @1316   PR51                     $CHAR4.                                  
      @1320   PR52                     $CHAR4.                                  
      @1324   PR53                     $CHAR4.                                  
      @1328   PR54                     $CHAR4.                                  
      @1332   PR55                     $CHAR4.                                  
      @1336   PR56                     $CHAR4.                                  
      @1340   PR57                     $CHAR4.                                  
      @1344   PR58                     $CHAR4.                                  
      @1348   PR59                     $CHAR4.                                  
      @1352   PR60                     $CHAR4.                                  
      @1356   PR61                     $CHAR4.                                  
      @1360   PR62                     $CHAR4.                                  
      @1364   PR63                     $CHAR4.                                  
      @1368   PRCCS1                   N3PF.                                    
      @1371   PRCCS2                   N3PF.                                    
      @1374   PRCCS3                   N3PF.                                    
      @1377   PRCCS4                   N3PF.                                    
      @1380   PRCCS5                   N3PF.                                    
      @1383   PRCCS6                   N3PF.                                    
      @1386   PRCCS7                   N3PF.                                    
      @1389   PRCCS8                   N3PF.                                    
      @1392   PRCCS9                   N3PF.                                    
      @1395   PRCCS10                  N3PF.                                    
      @1398   PRCCS11                  N3PF.                                    
      @1401   PRCCS12                  N3PF.                                    
      @1404   PRCCS13                  N3PF.                                    
      @1407   PRCCS14                  N3PF.                                    
      @1410   PRCCS15                  N3PF.                                    
      @1413   PRCCS16                  N3PF.                                    
      @1416   PRCCS17                  N3PF.                                    
      @1419   PRCCS18                  N3PF.                                    
      @1422   PRCCS19                  N3PF.                                    
      @1425   PRCCS20                  N3PF.                                    
      @1428   PRCCS21                  N3PF.                                    
      @1431   PRCCS22                  N3PF.                                    
      @1434   PRCCS23                  N3PF.                                    
      @1437   PRCCS24                  N3PF.                                    
      @1440   PRCCS25                  N3PF.                                    
      @1443   PRCCS26                  N3PF.                                    
      @1446   PRCCS27                  N3PF.                                    
      @1449   PRCCS28                  N3PF.                                    
      @1452   PRCCS29                  N3PF.                                    
      @1455   PRCCS30                  N3PF.                                    
      @1458   PRCCS31                  N3PF.                                    
      @1461   PRCCS32                  N3PF.                                    
      @1464   PRCCS33                  N3PF.                                    
      @1467   PRCCS34                  N3PF.                                    
      @1470   PRCCS35                  N3PF.                                    
      @1473   PRCCS36                  N3PF.                                    
      @1476   PRCCS37                  N3PF.                                    
      @1479   PRCCS38                  N3PF.                                    
      @1482   PRCCS39                  N3PF.                                    
      @1485   PRCCS40                  N3PF.                                    
      @1488   PRCCS41                  N3PF.                                    
      @1491   PRCCS42                  N3PF.                                    
      @1494   PRCCS43                  N3PF.                                    
      @1497   PRCCS44                  N3PF.                                    
      @1500   PRCCS45                  N3PF.                                    
      @1503   PRCCS46                  N3PF.                                    
      @1506   PRCCS47                  N3PF.                                    
      @1509   PRCCS48                  N3PF.                                    
      @1512   PRCCS49                  N3PF.                                    
      @1515   PRCCS50                  N3PF.                                    
      @1518   PRCCS51                  N3PF.                                    
      @1521   PRCCS52                  N3PF.                                    
      @1524   PRCCS53                  N3PF.                                    
      @1527   PRCCS54                  N3PF.                                    
      @1530   PRCCS55                  N3PF.                                    
      @1533   PRCCS56                  N3PF.                                    
      @1536   PRCCS57                  N3PF.                                    
      @1539   PRCCS58                  N3PF.                                    
      @1542   PRCCS59                  N3PF.                                    
      @1545   PRCCS60                  N3PF.                                    
      @1548   PRCCS61                  N3PF.                                    
      @1551   PRCCS62                  N3PF.                                    
      @1554   PRCCS63                  N3PF.                                    
      @1557   PRDAY1                   N5PF.                                    
      @1562   PRDAY2                   N5PF.                                    
      @1567   PRDAY3                   N5PF.                                    
      @1572   PRDAY4                   N5PF.                                    
      @1577   PRDAY5                   N5PF.                                    
      @1582   PRDAY6                   N5PF.                                    
      @1587   PRDAY7                   N5PF.                                    
      @1592   PRDAY8                   N5PF.                                    
      @1597   PRDAY9                   N5PF.                                    
      @1602   PRDAY10                  N5PF.                                    
      @1607   PRDAY11                  N5PF.                                    
      @1612   PRDAY12                  N5PF.                                    
      @1617   PRDAY13                  N5PF.                                    
      @1622   PRDAY14                  N5PF.                                    
      @1627   PRDAY15                  N5PF.                                    
      @1632   PRDAY16                  N5PF.                                    
      @1637   PRDAY17                  N5PF.                                    
      @1642   PRDAY18                  N5PF.                                    
      @1647   PRDAY19                  N5PF.                                    
      @1652   PRDAY20                  N5PF.                                    
      @1657   PRDAY21                  N5PF.                                    
      @1662   PRDAY22                  N5PF.                                    
      @1667   PRDAY23                  N5PF.                                    
      @1672   PRDAY24                  N5PF.                                    
      @1677   PRDAY25                  N5PF.                                    
      @1682   PRDAY26                  N5PF.                                    
      @1687   PRDAY27                  N5PF.                                    
      @1692   PRDAY28                  N5PF.                                    
      @1697   PRDAY29                  N5PF.                                    
      @1702   PRDAY30                  N5PF.                                    
      @1707   PRDAY31                  N5PF.                                    
      @1712   PRDAY32                  N5PF.                                    
      @1717   PRDAY33                  N5PF.                                    
      @1722   PRDAY34                  N5PF.                                    
      @1727   PRDAY35                  N5PF.                                    
      @1732   PRDAY36                  N5PF.                                    
      @1737   PRDAY37                  N5PF.                                    
      @1742   PRDAY38                  N5PF.                                    
      @1747   PRDAY39                  N5PF.                                    
      @1752   PRDAY40                  N5PF.                                    
      @1757   PRDAY41                  N5PF.                                    
      @1762   PRDAY42                  N5PF.                                    
      @1767   PRDAY43                  N5PF.                                    
      @1772   PRDAY44                  N5PF.                                    
      @1777   PRDAY45                  N5PF.                                    
      @1782   PRDAY46                  N5PF.                                    
      @1787   PRDAY47                  N5PF.                                    
      @1792   PRDAY48                  N5PF.                                    
      @1797   PRDAY49                  N5PF.                                    
      @1802   PRDAY50                  N5PF.                                    
      @1807   PRDAY51                  N5PF.                                    
      @1812   PRDAY52                  N5PF.                                    
      @1817   PRDAY53                  N5PF.                                    
      @1822   PRDAY54                  N5PF.                                    
      @1827   PRDAY55                  N5PF.                                    
      @1832   PRDAY56                  N5PF.                                    
      @1837   PRDAY57                  N5PF.                                    
      @1842   PRDAY58                  N5PF.                                    
      @1847   PRDAY59                  N5PF.                                    
      @1852   PRDAY60                  N5PF.                                    
      @1857   PRDAY61                  N5PF.                                    
      @1862   PRDAY62                  N5PF.                                    
      @1867   PRDAY63                  N5PF.                                    
      @1872   PROCTYPE                 N3PF.                                    
      @1875   PSTATE                   $CHAR2.                                  
      @1877   PSTCO                    N5PF.                                    
      @1882   PSTCO2                   N5PF.                                    
      @1887   PointOfOriginUB04        $CHAR1.                                  
      @1888   PointOfOrigin_X          $CHAR1.                                  
      @1889   RACE                     N2PF.                                    
      @1891   RACE_X                   $CHAR4.                                  
      @1895   TOTCHG                   N10PF.                                   
      @1905   TOTCHG_X                 N15P2F.                                  
      @1920   TRAN_IN                  N2PF.                                    
      @1922   TRAN_OUT                 N2PF.                                    
      @1924   YEAR                     N4PF.                                    
      @1928   ZIP3                     $CHAR3.                                  
      @1931   ZIPINC_QRTL              N3PF.                                    
      @1934   HOSPID                   N5PF.                                    
      @1939   ZIP                      $CHAR5.                                  
      @1944   AYEAR                    N4PF.                                    
      @1948   DMONTH                   N2PF.                                    
      @1950   BMONTH                   N2PF.                                    
      @1952   BYEAR                    N4PF.                                    
      @1956   PRMONTH1                 N2PF.                                    
      @1958   PRMONTH2                 N2PF.                                    
      @1960   PRMONTH3                 N2PF.                                    
      @1962   PRMONTH4                 N2PF.                                    
      @1964   PRMONTH5                 N2PF.                                    
      @1966   PRMONTH6                 N2PF.                                    
      @1968   PRMONTH7                 N2PF.                                    
      @1970   PRMONTH8                 N2PF.                                    
      @1972   PRMONTH9                 N2PF.                                    
      @1974   PRMONTH10                N2PF.                                    
      @1976   PRMONTH11                N2PF.                                    
      @1978   PRMONTH12                N2PF.                                    
      @1980   PRMONTH13                N2PF.                                    
      @1982   PRMONTH14                N2PF.                                    
      @1984   PRMONTH15                N2PF.                                    
      @1986   PRMONTH16                N2PF.                                    
      @1988   PRMONTH17                N2PF.                                    
      @1990   PRMONTH18                N2PF.                                    
      @1992   PRMONTH19                N2PF.                                    
      @1994   PRMONTH20                N2PF.                                    
      @1996   PRMONTH21                N2PF.                                    
      @1998   PRMONTH22                N2PF.                                    
      @2000   PRMONTH23                N2PF.                                    
      @2002   PRMONTH24                N2PF.                                    
      @2004   PRMONTH25                N2PF.                                    
      @2006   PRMONTH26                N2PF.                                    
      @2008   PRMONTH27                N2PF.                                    
      @2010   PRMONTH28                N2PF.                                    
      @2012   PRMONTH29                N2PF.                                    
      @2014   PRMONTH30                N2PF.                                    
      @2016   PRMONTH31                N2PF.                                    
      @2018   PRMONTH32                N2PF.                                    
      @2020   PRMONTH33                N2PF.                                    
      @2022   PRMONTH34                N2PF.                                    
      @2024   PRMONTH35                N2PF.                                    
      @2026   PRMONTH36                N2PF.                                    
      @2028   PRMONTH37                N2PF.                                    
      @2030   PRMONTH38                N2PF.                                    
      @2032   PRMONTH39                N2PF.                                    
      @2034   PRMONTH40                N2PF.                                    
      @2036   PRMONTH41                N2PF.                                    
      @2038   PRMONTH42                N2PF.                                    
      @2040   PRMONTH43                N2PF.                                    
      @2042   PRMONTH44                N2PF.                                    
      @2044   PRMONTH45                N2PF.                                    
      @2046   PRMONTH46                N2PF.                                    
      @2048   PRMONTH47                N2PF.                                    
      @2050   PRMONTH48                N2PF.                                    
      @2052   PRMONTH49                N2PF.                                    
      @2054   PRMONTH50                N2PF.                                    
      @2056   PRMONTH51                N2PF.                                    
      @2058   PRMONTH52                N2PF.                                    
      @2060   PRMONTH53                N2PF.                                    
      @2062   PRMONTH54                N2PF.                                    
      @2064   PRMONTH55                N2PF.                                    
      @2066   PRMONTH56                N2PF.                                    
      @2068   PRMONTH57                N2PF.                                    
      @2070   PRMONTH58                N2PF.                                    
      @2072   PRMONTH59                N2PF.                                    
      @2074   PRMONTH60                N2PF.                                    
      @2076   PRMONTH61                N2PF.                                    
      @2078   PRMONTH62                N2PF.                                    
      @2080   PRMONTH63                N2PF.                                    
      @2082   PRYEAR1                  N4PF.                                    
      @2086   PRYEAR2                  N4PF.                                    
      @2090   PRYEAR3                  N4PF.                                    
      @2094   PRYEAR4                  N4PF.                                    
      @2098   PRYEAR5                  N4PF.                                    
      @2102   PRYEAR6                  N4PF.                                    
      @2106   PRYEAR7                  N4PF.                                    
      @2110   PRYEAR8                  N4PF.                                    
      @2114   PRYEAR9                  N4PF.                                    
      @2118   PRYEAR10                 N4PF.                                    
      @2122   PRYEAR11                 N4PF.                                    
      @2126   PRYEAR12                 N4PF.                                    
      @2130   PRYEAR13                 N4PF.                                    
      @2134   PRYEAR14                 N4PF.                                    
      @2138   PRYEAR15                 N4PF.                                    
      @2142   PRYEAR16                 N4PF.                                    
      @2146   PRYEAR17                 N4PF.                                    
      @2150   PRYEAR18                 N4PF.                                    
      @2154   PRYEAR19                 N4PF.                                    
      @2158   PRYEAR20                 N4PF.                                    
      @2162   PRYEAR21                 N4PF.                                    
      @2166   PRYEAR22                 N4PF.                                    
      @2170   PRYEAR23                 N4PF.                                    
      @2174   PRYEAR24                 N4PF.                                    
      @2178   PRYEAR25                 N4PF.                                    
      @2182   PRYEAR26                 N4PF.                                    
      @2186   PRYEAR27                 N4PF.                                    
      @2190   PRYEAR28                 N4PF.                                    
      @2194   PRYEAR29                 N4PF.                                    
      @2198   PRYEAR30                 N4PF.                                    
      @2202   PRYEAR31                 N4PF.                                    
      @2206   PRYEAR32                 N4PF.                                    
      @2210   PRYEAR33                 N4PF.                                    
      @2214   PRYEAR34                 N4PF.                                    
      @2218   PRYEAR35                 N4PF.                                    
      @2222   PRYEAR36                 N4PF.                                    
      @2226   PRYEAR37                 N4PF.                                    
      @2230   PRYEAR38                 N4PF.                                    
      @2234   PRYEAR39                 N4PF.                                    
      @2238   PRYEAR40                 N4PF.                                    
      @2242   PRYEAR41                 N4PF.                                    
      @2246   PRYEAR42                 N4PF.                                    
      @2250   PRYEAR43                 N4PF.                                    
      @2254   PRYEAR44                 N4PF.                                    
      @2258   PRYEAR45                 N4PF.                                    
      @2262   PRYEAR46                 N4PF.                                    
      @2266   PRYEAR47                 N4PF.                                    
      @2270   PRYEAR48                 N4PF.                                    
      @2274   PRYEAR49                 N4PF.                                    
      @2278   PRYEAR50                 N4PF.                                    
      @2282   PRYEAR51                 N4PF.                                    
      @2286   PRYEAR52                 N4PF.                                    
      @2290   PRYEAR53                 N4PF.                                    
      @2294   PRYEAR54                 N4PF.                                    
      @2298   PRYEAR55                 N4PF.                                    
      @2302   PRYEAR56                 N4PF.                                    
      @2306   PRYEAR57                 N4PF.                                    
      @2310   PRYEAR58                 N4PF.                                    
      @2314   PRYEAR59                 N4PF.                                    
      @2318   PRYEAR60                 N4PF.                                    
      @2322   PRYEAR61                 N4PF.                                    
      @2326   PRYEAR62                 N4PF.                                    
      @2330   PRYEAR63                 N4PF.                                    
      ;                                                                         
                                                                                
                                                                                
RUN;
