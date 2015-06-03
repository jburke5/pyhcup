/*******************************************************************            
*   IA_SID_2010_CORE.SAS:                                                       
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
DATA IA_SIDC_2010_CORE;                                                         
INFILE 'IA_SID_2010_CORE.ASC' LRECL = 1537;                                     
                                                                                
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
                                                                                
  DSHOSPID                   LENGTH=$17                                         
  LABEL="Data source hospital identifier"                                       
                                                                                
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
                                                                                
  DaysToEvent                LENGTH=8                                           
  LABEL="Days from 'start date' to admission"                                   
                                                                                
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
                                                                                
  PAY1_X                     LENGTH=$4                                          
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
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
                                                                                
  PNUM_R                     LENGTH=5                                           
  LABEL="Person number (re-identified)"                                         
                                                                                
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
                                                                                
  VisitLink                  LENGTH=8                                           
  LABEL="Visit linkage variable"                                                
                                                                                
  YEAR                       LENGTH=3                                           
  LABEL="Calendar year"                                                         
                                                                                
  ZIP3                       LENGTH=$3                                          
  LABEL="Patient ZIP Code, first 3 digits"                                      
                                                                                
  ZIPINC_QRTL                LENGTH=3                                           
  LABEL="Median household income national quartile for patient ZIP Code"        
                                                                                
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
      @39     DSHOSPID                 $CHAR17.                                 
      @56     DX1                      $CHAR5.                                  
      @61     DX2                      $CHAR5.                                  
      @66     DX3                      $CHAR5.                                  
      @71     DX4                      $CHAR5.                                  
      @76     DX5                      $CHAR5.                                  
      @81     DX6                      $CHAR5.                                  
      @86     DX7                      $CHAR5.                                  
      @91     DX8                      $CHAR5.                                  
      @96     DX9                      $CHAR5.                                  
      @101    DX10                     $CHAR5.                                  
      @106    DX11                     $CHAR5.                                  
      @111    DX12                     $CHAR5.                                  
      @116    DX13                     $CHAR5.                                  
      @121    DX14                     $CHAR5.                                  
      @126    DX15                     $CHAR5.                                  
      @131    DX16                     $CHAR5.                                  
      @136    DX17                     $CHAR5.                                  
      @141    DX18                     $CHAR5.                                  
      @146    DX19                     $CHAR5.                                  
      @151    DX20                     $CHAR5.                                  
      @156    DX21                     $CHAR5.                                  
      @161    DX22                     $CHAR5.                                  
      @166    DX23                     $CHAR5.                                  
      @171    DX24                     $CHAR5.                                  
      @176    DX25                     $CHAR5.                                  
      @181    DX26                     $CHAR5.                                  
      @186    DX27                     $CHAR5.                                  
      @191    DX28                     $CHAR5.                                  
      @196    DX29                     $CHAR5.                                  
      @201    DX30                     $CHAR5.                                  
      @206    DX31                     $CHAR5.                                  
      @211    DX32                     $CHAR5.                                  
      @216    DX33                     $CHAR5.                                  
      @221    DX34                     $CHAR5.                                  
      @226    DX35                     $CHAR5.                                  
      @231    DX36                     $CHAR5.                                  
      @236    DX37                     $CHAR5.                                  
      @241    DX38                     $CHAR5.                                  
      @246    DX39                     $CHAR5.                                  
      @251    DX40                     $CHAR5.                                  
      @256    DX41                     $CHAR5.                                  
      @261    DX42                     $CHAR5.                                  
      @266    DX43                     $CHAR5.                                  
      @271    DX44                     $CHAR5.                                  
      @276    DX45                     $CHAR5.                                  
      @281    DX46                     $CHAR5.                                  
      @286    DX47                     $CHAR5.                                  
      @291    DX48                     $CHAR5.                                  
      @296    DX49                     $CHAR5.                                  
      @301    DX50                     $CHAR5.                                  
      @306    DX51                     $CHAR5.                                  
      @311    DX52                     $CHAR5.                                  
      @316    DX53                     $CHAR5.                                  
      @321    DX54                     $CHAR5.                                  
      @326    DX55                     $CHAR5.                                  
      @331    DX56                     $CHAR5.                                  
      @336    DX57                     $CHAR5.                                  
      @341    DX58                     $CHAR5.                                  
      @346    DX59                     $CHAR5.                                  
      @351    DX60                     $CHAR5.                                  
      @356    DX61                     $CHAR5.                                  
      @361    DX62                     $CHAR5.                                  
      @366    DX63                     $CHAR5.                                  
      @371    DX64                     $CHAR5.                                  
      @376    DX65                     $CHAR5.                                  
      @381    DX66                     $CHAR5.                                  
      @386    DXCCS1                   N4PF.                                    
      @390    DXCCS2                   N4PF.                                    
      @394    DXCCS3                   N4PF.                                    
      @398    DXCCS4                   N4PF.                                    
      @402    DXCCS5                   N4PF.                                    
      @406    DXCCS6                   N4PF.                                    
      @410    DXCCS7                   N4PF.                                    
      @414    DXCCS8                   N4PF.                                    
      @418    DXCCS9                   N4PF.                                    
      @422    DXCCS10                  N4PF.                                    
      @426    DXCCS11                  N4PF.                                    
      @430    DXCCS12                  N4PF.                                    
      @434    DXCCS13                  N4PF.                                    
      @438    DXCCS14                  N4PF.                                    
      @442    DXCCS15                  N4PF.                                    
      @446    DXCCS16                  N4PF.                                    
      @450    DXCCS17                  N4PF.                                    
      @454    DXCCS18                  N4PF.                                    
      @458    DXCCS19                  N4PF.                                    
      @462    DXCCS20                  N4PF.                                    
      @466    DXCCS21                  N4PF.                                    
      @470    DXCCS22                  N4PF.                                    
      @474    DXCCS23                  N4PF.                                    
      @478    DXCCS24                  N4PF.                                    
      @482    DXCCS25                  N4PF.                                    
      @486    DXCCS26                  N4PF.                                    
      @490    DXCCS27                  N4PF.                                    
      @494    DXCCS28                  N4PF.                                    
      @498    DXCCS29                  N4PF.                                    
      @502    DXCCS30                  N4PF.                                    
      @506    DXCCS31                  N4PF.                                    
      @510    DXCCS32                  N4PF.                                    
      @514    DXCCS33                  N4PF.                                    
      @518    DXCCS34                  N4PF.                                    
      @522    DXCCS35                  N4PF.                                    
      @526    DXCCS36                  N4PF.                                    
      @530    DXCCS37                  N4PF.                                    
      @534    DXCCS38                  N4PF.                                    
      @538    DXCCS39                  N4PF.                                    
      @542    DXCCS40                  N4PF.                                    
      @546    DXCCS41                  N4PF.                                    
      @550    DXCCS42                  N4PF.                                    
      @554    DXCCS43                  N4PF.                                    
      @558    DXCCS44                  N4PF.                                    
      @562    DXCCS45                  N4PF.                                    
      @566    DXCCS46                  N4PF.                                    
      @570    DXCCS47                  N4PF.                                    
      @574    DXCCS48                  N4PF.                                    
      @578    DXCCS49                  N4PF.                                    
      @582    DXCCS50                  N4PF.                                    
      @586    DXCCS51                  N4PF.                                    
      @590    DXCCS52                  N4PF.                                    
      @594    DXCCS53                  N4PF.                                    
      @598    DXCCS54                  N4PF.                                    
      @602    DXCCS55                  N4PF.                                    
      @606    DXCCS56                  N4PF.                                    
      @610    DXCCS57                  N4PF.                                    
      @614    DXCCS58                  N4PF.                                    
      @618    DXCCS59                  N4PF.                                    
      @622    DXCCS60                  N4PF.                                    
      @626    DXCCS61                  N4PF.                                    
      @630    DXCCS62                  N4PF.                                    
      @634    DXCCS63                  N4PF.                                    
      @638    DXCCS64                  N4PF.                                    
      @642    DXCCS65                  N4PF.                                    
      @646    DXCCS66                  N4PF.                                    
      @650    DXPOA1                   $CHAR1.                                  
      @651    DXPOA2                   $CHAR1.                                  
      @652    DXPOA3                   $CHAR1.                                  
      @653    DXPOA4                   $CHAR1.                                  
      @654    DXPOA5                   $CHAR1.                                  
      @655    DXPOA6                   $CHAR1.                                  
      @656    DXPOA7                   $CHAR1.                                  
      @657    DXPOA8                   $CHAR1.                                  
      @658    DXPOA9                   $CHAR1.                                  
      @659    DXPOA10                  $CHAR1.                                  
      @660    DXPOA11                  $CHAR1.                                  
      @661    DXPOA12                  $CHAR1.                                  
      @662    DXPOA13                  $CHAR1.                                  
      @663    DXPOA14                  $CHAR1.                                  
      @664    DXPOA15                  $CHAR1.                                  
      @665    DXPOA16                  $CHAR1.                                  
      @666    DXPOA17                  $CHAR1.                                  
      @667    DXPOA18                  $CHAR1.                                  
      @668    DXPOA19                  $CHAR1.                                  
      @669    DXPOA20                  $CHAR1.                                  
      @670    DXPOA21                  $CHAR1.                                  
      @671    DXPOA22                  $CHAR1.                                  
      @672    DXPOA23                  $CHAR1.                                  
      @673    DXPOA24                  $CHAR1.                                  
      @674    DXPOA25                  $CHAR1.                                  
      @675    DXPOA26                  $CHAR1.                                  
      @676    DXPOA27                  $CHAR1.                                  
      @677    DXPOA28                  $CHAR1.                                  
      @678    DXPOA29                  $CHAR1.                                  
      @679    DXPOA30                  $CHAR1.                                  
      @680    DXPOA31                  $CHAR1.                                  
      @681    DXPOA32                  $CHAR1.                                  
      @682    DXPOA33                  $CHAR1.                                  
      @683    DXPOA34                  $CHAR1.                                  
      @684    DXPOA35                  $CHAR1.                                  
      @685    DXPOA36                  $CHAR1.                                  
      @686    DXPOA37                  $CHAR1.                                  
      @687    DXPOA38                  $CHAR1.                                  
      @688    DXPOA39                  $CHAR1.                                  
      @689    DXPOA40                  $CHAR1.                                  
      @690    DXPOA41                  $CHAR1.                                  
      @691    DXPOA42                  $CHAR1.                                  
      @692    DXPOA43                  $CHAR1.                                  
      @693    DXPOA44                  $CHAR1.                                  
      @694    DXPOA45                  $CHAR1.                                  
      @695    DXPOA46                  $CHAR1.                                  
      @696    DXPOA47                  $CHAR1.                                  
      @697    DXPOA48                  $CHAR1.                                  
      @698    DXPOA49                  $CHAR1.                                  
      @699    DXPOA50                  $CHAR1.                                  
      @700    DXPOA51                  $CHAR1.                                  
      @701    DXPOA52                  $CHAR1.                                  
      @702    DXPOA53                  $CHAR1.                                  
      @703    DXPOA54                  $CHAR1.                                  
      @704    DXPOA55                  $CHAR1.                                  
      @705    DXPOA56                  $CHAR1.                                  
      @706    DXPOA57                  $CHAR1.                                  
      @707    DXPOA58                  $CHAR1.                                  
      @708    DXPOA59                  $CHAR1.                                  
      @709    DXPOA60                  $CHAR1.                                  
      @710    DXPOA61                  $CHAR1.                                  
      @711    DXPOA62                  $CHAR1.                                  
      @712    DXPOA63                  $CHAR1.                                  
      @713    DXPOA64                  $CHAR1.                                  
      @714    DXPOA65                  $CHAR1.                                  
      @715    DXPOA66                  $CHAR1.                                  
      @716    DaysToEvent              N6PF.                                    
      @722    ECODE1                   $CHAR5.                                  
      @727    ECODE2                   $CHAR5.                                  
      @732    ECODE3                   $CHAR5.                                  
      @737    ECODE4                   $CHAR5.                                  
      @742    ECODE5                   $CHAR5.                                  
      @747    ECODE6                   $CHAR5.                                  
      @752    ECODE7                   $CHAR5.                                  
      @757    E_CCS1                   N4PF.                                    
      @761    E_CCS2                   N4PF.                                    
      @765    E_CCS3                   N4PF.                                    
      @769    E_CCS4                   N4PF.                                    
      @773    E_CCS5                   N4PF.                                    
      @777    E_CCS6                   N4PF.                                    
      @781    E_CCS7                   N4PF.                                    
      @785    E_POA1                   $CHAR1.                                  
      @786    E_POA2                   $CHAR1.                                  
      @787    E_POA3                   $CHAR1.                                  
      @788    E_POA4                   $CHAR1.                                  
      @789    E_POA5                   $CHAR1.                                  
      @790    E_POA6                   $CHAR1.                                  
      @791    E_POA7                   $CHAR1.                                  
      @792    FEMALE                   N2PF.                                    
      @794    HCUP_ED                  N2PF.                                    
      @796    HCUP_OS                  N2PF.                                    
      @798    HOSPBRTH                 N3PF.                                    
      @801    HOSPST                   $CHAR2.                                  
      @803    HospitalUnit             N2PF.                                    
      @805    KEY                      18.                                      
      @823    LOS                      N5PF.                                    
      @828    LOS_X                    N6PF.                                    
      @834    MDC                      N2PF.                                    
      @836    MDC24                    N2PF.                                    
      @838    MDC_NoPOA                N2PF.                                    
      @840    MDNUM1_R                 N9PF.                                    
      @849    MDNUM2_R                 N9PF.                                    
      @858    MDNUM3_R                 N9PF.                                    
      @867    MEDINCSTQ                N2PF.                                    
      @869    MRN_R                    N9PF.                                    
      @878    NCHRONIC                 N3PF.                                    
      @881    NDX                      N2PF.                                    
      @883    NECODE                   N2PF.                                    
      @885    NEOMAT                   N2PF.                                    
      @887    NPR                      N2PF.                                    
      @889    ORPROC                   N2PF.                                    
      @891    PAY1                     N2PF.                                    
      @893    PAY1_X                   $CHAR4.                                  
      @897    PL_CBSA                  N3PF.                                    
      @900    PL_MSA1993               N3PF.                                    
      @903    PL_NCHS2006              N2PF.                                    
      @905    PL_RUCA10_2005           N2PF.                                    
      @907    PL_RUCA2005              N4P1F.                                   
      @911    PL_RUCA4_2005            N2PF.                                    
      @913    PL_RUCC2003              N2PF.                                    
      @915    PL_UIC2003               N2PF.                                    
      @917    PL_UR_CAT4               N2PF.                                    
      @919    PNUM_R                   N9PF.                                    
      @928    PR1                      $CHAR4.                                  
      @932    PR2                      $CHAR4.                                  
      @936    PR3                      $CHAR4.                                  
      @940    PR4                      $CHAR4.                                  
      @944    PR5                      $CHAR4.                                  
      @948    PR6                      $CHAR4.                                  
      @952    PR7                      $CHAR4.                                  
      @956    PR8                      $CHAR4.                                  
      @960    PR9                      $CHAR4.                                  
      @964    PR10                     $CHAR4.                                  
      @968    PR11                     $CHAR4.                                  
      @972    PR12                     $CHAR4.                                  
      @976    PR13                     $CHAR4.                                  
      @980    PR14                     $CHAR4.                                  
      @984    PR15                     $CHAR4.                                  
      @988    PR16                     $CHAR4.                                  
      @992    PR17                     $CHAR4.                                  
      @996    PR18                     $CHAR4.                                  
      @1000   PR19                     $CHAR4.                                  
      @1004   PR20                     $CHAR4.                                  
      @1008   PR21                     $CHAR4.                                  
      @1012   PR22                     $CHAR4.                                  
      @1016   PR23                     $CHAR4.                                  
      @1020   PR24                     $CHAR4.                                  
      @1024   PR25                     $CHAR4.                                  
      @1028   PR26                     $CHAR4.                                  
      @1032   PR27                     $CHAR4.                                  
      @1036   PR28                     $CHAR4.                                  
      @1040   PR29                     $CHAR4.                                  
      @1044   PRCCS1                   N3PF.                                    
      @1047   PRCCS2                   N3PF.                                    
      @1050   PRCCS3                   N3PF.                                    
      @1053   PRCCS4                   N3PF.                                    
      @1056   PRCCS5                   N3PF.                                    
      @1059   PRCCS6                   N3PF.                                    
      @1062   PRCCS7                   N3PF.                                    
      @1065   PRCCS8                   N3PF.                                    
      @1068   PRCCS9                   N3PF.                                    
      @1071   PRCCS10                  N3PF.                                    
      @1074   PRCCS11                  N3PF.                                    
      @1077   PRCCS12                  N3PF.                                    
      @1080   PRCCS13                  N3PF.                                    
      @1083   PRCCS14                  N3PF.                                    
      @1086   PRCCS15                  N3PF.                                    
      @1089   PRCCS16                  N3PF.                                    
      @1092   PRCCS17                  N3PF.                                    
      @1095   PRCCS18                  N3PF.                                    
      @1098   PRCCS19                  N3PF.                                    
      @1101   PRCCS20                  N3PF.                                    
      @1104   PRCCS21                  N3PF.                                    
      @1107   PRCCS22                  N3PF.                                    
      @1110   PRCCS23                  N3PF.                                    
      @1113   PRCCS24                  N3PF.                                    
      @1116   PRCCS25                  N3PF.                                    
      @1119   PRCCS26                  N3PF.                                    
      @1122   PRCCS27                  N3PF.                                    
      @1125   PRCCS28                  N3PF.                                    
      @1128   PRCCS29                  N3PF.                                    
      @1131   PRDAY1                   N5PF.                                    
      @1136   PRDAY2                   N5PF.                                    
      @1141   PRDAY3                   N5PF.                                    
      @1146   PRDAY4                   N5PF.                                    
      @1151   PRDAY5                   N5PF.                                    
      @1156   PRDAY6                   N5PF.                                    
      @1161   PRDAY7                   N5PF.                                    
      @1166   PRDAY8                   N5PF.                                    
      @1171   PRDAY9                   N5PF.                                    
      @1176   PRDAY10                  N5PF.                                    
      @1181   PRDAY11                  N5PF.                                    
      @1186   PRDAY12                  N5PF.                                    
      @1191   PRDAY13                  N5PF.                                    
      @1196   PRDAY14                  N5PF.                                    
      @1201   PRDAY15                  N5PF.                                    
      @1206   PRDAY16                  N5PF.                                    
      @1211   PRDAY17                  N5PF.                                    
      @1216   PRDAY18                  N5PF.                                    
      @1221   PRDAY19                  N5PF.                                    
      @1226   PRDAY20                  N5PF.                                    
      @1231   PRDAY21                  N5PF.                                    
      @1236   PRDAY22                  N5PF.                                    
      @1241   PRDAY23                  N5PF.                                    
      @1246   PRDAY24                  N5PF.                                    
      @1251   PRDAY25                  N5PF.                                    
      @1256   PRDAY26                  N5PF.                                    
      @1261   PRDAY27                  N5PF.                                    
      @1266   PRDAY28                  N5PF.                                    
      @1271   PRDAY29                  N5PF.                                    
      @1276   PROCTYPE                 N3PF.                                    
      @1279   PSTATE                   $CHAR2.                                  
      @1281   PSTCO                    N5PF.                                    
      @1286   PSTCO2                   N5PF.                                    
      @1291   PointOfOriginUB04        $CHAR1.                                  
      @1292   PointOfOrigin_X          $CHAR1.                                  
      @1293   RACE                     N2PF.                                    
      @1295   RACE_X                   $CHAR4.                                  
      @1299   TOTCHG                   N10PF.                                   
      @1309   TOTCHG_X                 N15P2F.                                  
      @1324   TRAN_IN                  N2PF.                                    
      @1326   TRAN_OUT                 N2PF.                                    
      @1328   VisitLink                N9PF.                                    
      @1337   YEAR                     N4PF.                                    
      @1341   ZIP3                     $CHAR3.                                  
      @1344   ZIPINC_QRTL              N3PF.                                    
      @1347   ZIP                      $CHAR5.                                  
      @1352   AYEAR                    N4PF.                                    
      @1356   DMONTH                   N2PF.                                    
      @1358   BMONTH                   N2PF.                                    
      @1360   BYEAR                    N4PF.                                    
      @1364   PRMONTH1                 N2PF.                                    
      @1366   PRMONTH2                 N2PF.                                    
      @1368   PRMONTH3                 N2PF.                                    
      @1370   PRMONTH4                 N2PF.                                    
      @1372   PRMONTH5                 N2PF.                                    
      @1374   PRMONTH6                 N2PF.                                    
      @1376   PRMONTH7                 N2PF.                                    
      @1378   PRMONTH8                 N2PF.                                    
      @1380   PRMONTH9                 N2PF.                                    
      @1382   PRMONTH10                N2PF.                                    
      @1384   PRMONTH11                N2PF.                                    
      @1386   PRMONTH12                N2PF.                                    
      @1388   PRMONTH13                N2PF.                                    
      @1390   PRMONTH14                N2PF.                                    
      @1392   PRMONTH15                N2PF.                                    
      @1394   PRMONTH16                N2PF.                                    
      @1396   PRMONTH17                N2PF.                                    
      @1398   PRMONTH18                N2PF.                                    
      @1400   PRMONTH19                N2PF.                                    
      @1402   PRMONTH20                N2PF.                                    
      @1404   PRMONTH21                N2PF.                                    
      @1406   PRMONTH22                N2PF.                                    
      @1408   PRMONTH23                N2PF.                                    
      @1410   PRMONTH24                N2PF.                                    
      @1412   PRMONTH25                N2PF.                                    
      @1414   PRMONTH26                N2PF.                                    
      @1416   PRMONTH27                N2PF.                                    
      @1418   PRMONTH28                N2PF.                                    
      @1420   PRMONTH29                N2PF.                                    
      @1422   PRYEAR1                  N4PF.                                    
      @1426   PRYEAR2                  N4PF.                                    
      @1430   PRYEAR3                  N4PF.                                    
      @1434   PRYEAR4                  N4PF.                                    
      @1438   PRYEAR5                  N4PF.                                    
      @1442   PRYEAR6                  N4PF.                                    
      @1446   PRYEAR7                  N4PF.                                    
      @1450   PRYEAR8                  N4PF.                                    
      @1454   PRYEAR9                  N4PF.                                    
      @1458   PRYEAR10                 N4PF.                                    
      @1462   PRYEAR11                 N4PF.                                    
      @1466   PRYEAR12                 N4PF.                                    
      @1470   PRYEAR13                 N4PF.                                    
      @1474   PRYEAR14                 N4PF.                                    
      @1478   PRYEAR15                 N4PF.                                    
      @1482   PRYEAR16                 N4PF.                                    
      @1486   PRYEAR17                 N4PF.                                    
      @1490   PRYEAR18                 N4PF.                                    
      @1494   PRYEAR19                 N4PF.                                    
      @1498   PRYEAR20                 N4PF.                                    
      @1502   PRYEAR21                 N4PF.                                    
      @1506   PRYEAR22                 N4PF.                                    
      @1510   PRYEAR23                 N4PF.                                    
      @1514   PRYEAR24                 N4PF.                                    
      @1518   PRYEAR25                 N4PF.                                    
      @1522   PRYEAR26                 N4PF.                                    
      @1526   PRYEAR27                 N4PF.                                    
      @1530   PRYEAR28                 N4PF.                                    
      @1534   PRYEAR29                 N4PF.                                    
      ;                                                                         
                                                                                
                                                                                
RUN;
