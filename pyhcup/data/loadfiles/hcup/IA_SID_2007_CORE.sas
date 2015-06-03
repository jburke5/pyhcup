/*******************************************************************            
*   IA_SID_2007_CORE.SAS:                                                       
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
DATA IA_SIDC_2007_CORE;                                                         
INFILE 'IA_SID_2007_CORE.ASC' LRECL = 1419;                                     
                                                                                
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
                                                                                
  DSHOSPID                   LENGTH=$13                                         
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
                                                                                
  PRMONTH30                  LENGTH=3                                           
  LABEL="Month of procedure 30"                                                 
                                                                                
  PRMONTH31                  LENGTH=3                                           
  LABEL="Month of procedure 31"                                                 
                                                                                
  PRMONTH32                  LENGTH=3                                           
  LABEL="Month of procedure 32"                                                 
                                                                                
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
      @40     DSHOSPID                 $CHAR13.                                 
      @53     DX1                      $CHAR5.                                  
      @58     DX2                      $CHAR5.                                  
      @63     DX3                      $CHAR5.                                  
      @68     DX4                      $CHAR5.                                  
      @73     DX5                      $CHAR5.                                  
      @78     DX6                      $CHAR5.                                  
      @83     DX7                      $CHAR5.                                  
      @88     DX8                      $CHAR5.                                  
      @93     DX9                      $CHAR5.                                  
      @98     DX10                     $CHAR5.                                  
      @103    DX11                     $CHAR5.                                  
      @108    DX12                     $CHAR5.                                  
      @113    DX13                     $CHAR5.                                  
      @118    DX14                     $CHAR5.                                  
      @123    DX15                     $CHAR5.                                  
      @128    DX16                     $CHAR5.                                  
      @133    DX17                     $CHAR5.                                  
      @138    DX18                     $CHAR5.                                  
      @143    DX19                     $CHAR5.                                  
      @148    DX20                     $CHAR5.                                  
      @153    DX21                     $CHAR5.                                  
      @158    DX22                     $CHAR5.                                  
      @163    DX23                     $CHAR5.                                  
      @168    DX24                     $CHAR5.                                  
      @173    DX25                     $CHAR5.                                  
      @178    DX26                     $CHAR5.                                  
      @183    DX27                     $CHAR5.                                  
      @188    DX28                     $CHAR5.                                  
      @193    DX29                     $CHAR5.                                  
      @198    DX30                     $CHAR5.                                  
      @203    DX31                     $CHAR5.                                  
      @208    DX32                     $CHAR5.                                  
      @213    DX33                     $CHAR5.                                  
      @218    DX34                     $CHAR5.                                  
      @223    DX35                     $CHAR5.                                  
      @228    DX36                     $CHAR5.                                  
      @233    DX37                     $CHAR5.                                  
      @238    DX38                     $CHAR5.                                  
      @243    DX39                     $CHAR5.                                  
      @248    DX40                     $CHAR5.                                  
      @253    DX41                     $CHAR5.                                  
      @258    DX42                     $CHAR5.                                  
      @263    DX43                     $CHAR5.                                  
      @268    DX44                     $CHAR5.                                  
      @273    DX45                     $CHAR5.                                  
      @278    DX46                     $CHAR5.                                  
      @283    DX47                     $CHAR5.                                  
      @288    DX48                     $CHAR5.                                  
      @293    DX49                     $CHAR5.                                  
      @298    DX50                     $CHAR5.                                  
      @303    DX51                     $CHAR5.                                  
      @308    DX52                     $CHAR5.                                  
      @313    DX53                     $CHAR5.                                  
      @318    DX54                     $CHAR5.                                  
      @323    DX55                     $CHAR5.                                  
      @328    DX56                     $CHAR5.                                  
      @333    DX57                     $CHAR5.                                  
      @338    DX58                     $CHAR5.                                  
      @343    DX59                     $CHAR5.                                  
      @348    DX60                     $CHAR5.                                  
      @353    DXCCS1                   N4PF.                                    
      @357    DXCCS2                   N4PF.                                    
      @361    DXCCS3                   N4PF.                                    
      @365    DXCCS4                   N4PF.                                    
      @369    DXCCS5                   N4PF.                                    
      @373    DXCCS6                   N4PF.                                    
      @377    DXCCS7                   N4PF.                                    
      @381    DXCCS8                   N4PF.                                    
      @385    DXCCS9                   N4PF.                                    
      @389    DXCCS10                  N4PF.                                    
      @393    DXCCS11                  N4PF.                                    
      @397    DXCCS12                  N4PF.                                    
      @401    DXCCS13                  N4PF.                                    
      @405    DXCCS14                  N4PF.                                    
      @409    DXCCS15                  N4PF.                                    
      @413    DXCCS16                  N4PF.                                    
      @417    DXCCS17                  N4PF.                                    
      @421    DXCCS18                  N4PF.                                    
      @425    DXCCS19                  N4PF.                                    
      @429    DXCCS20                  N4PF.                                    
      @433    DXCCS21                  N4PF.                                    
      @437    DXCCS22                  N4PF.                                    
      @441    DXCCS23                  N4PF.                                    
      @445    DXCCS24                  N4PF.                                    
      @449    DXCCS25                  N4PF.                                    
      @453    DXCCS26                  N4PF.                                    
      @457    DXCCS27                  N4PF.                                    
      @461    DXCCS28                  N4PF.                                    
      @465    DXCCS29                  N4PF.                                    
      @469    DXCCS30                  N4PF.                                    
      @473    DXCCS31                  N4PF.                                    
      @477    DXCCS32                  N4PF.                                    
      @481    DXCCS33                  N4PF.                                    
      @485    DXCCS34                  N4PF.                                    
      @489    DXCCS35                  N4PF.                                    
      @493    DXCCS36                  N4PF.                                    
      @497    DXCCS37                  N4PF.                                    
      @501    DXCCS38                  N4PF.                                    
      @505    DXCCS39                  N4PF.                                    
      @509    DXCCS40                  N4PF.                                    
      @513    DXCCS41                  N4PF.                                    
      @517    DXCCS42                  N4PF.                                    
      @521    DXCCS43                  N4PF.                                    
      @525    DXCCS44                  N4PF.                                    
      @529    DXCCS45                  N4PF.                                    
      @533    DXCCS46                  N4PF.                                    
      @537    DXCCS47                  N4PF.                                    
      @541    DXCCS48                  N4PF.                                    
      @545    DXCCS49                  N4PF.                                    
      @549    DXCCS50                  N4PF.                                    
      @553    DXCCS51                  N4PF.                                    
      @557    DXCCS52                  N4PF.                                    
      @561    DXCCS53                  N4PF.                                    
      @565    DXCCS54                  N4PF.                                    
      @569    DXCCS55                  N4PF.                                    
      @573    DXCCS56                  N4PF.                                    
      @577    DXCCS57                  N4PF.                                    
      @581    DXCCS58                  N4PF.                                    
      @585    DXCCS59                  N4PF.                                    
      @589    DXCCS60                  N4PF.                                    
      @593    ECODE1                   $CHAR5.                                  
      @598    ECODE2                   $CHAR5.                                  
      @603    ECODE3                   $CHAR5.                                  
      @608    ECODE4                   $CHAR5.                                  
      @613    ECODE5                   $CHAR5.                                  
      @618    ECODE6                   $CHAR5.                                  
      @623    ECODE7                   $CHAR5.                                  
      @628    ECODE8                   $CHAR5.                                  
      @633    E_CCS1                   N4PF.                                    
      @637    E_CCS2                   N4PF.                                    
      @641    E_CCS3                   N4PF.                                    
      @645    E_CCS4                   N4PF.                                    
      @649    E_CCS5                   N4PF.                                    
      @653    E_CCS6                   N4PF.                                    
      @657    E_CCS7                   N4PF.                                    
      @661    E_CCS8                   N4PF.                                    
      @665    FEMALE                   N2PF.                                    
      @667    HCUP_ED                  N2PF.                                    
      @669    HCUP_OS                  N2PF.                                    
      @671    HOSPBRTH                 N3PF.                                    
      @674    HOSPST                   $CHAR2.                                  
      @676    HospitalUnit             N2PF.                                    
      @678    KEY                      14.                                      
      @692    LOS                      N5PF.                                    
      @697    LOS_X                    N6PF.                                    
      @703    MDC                      N2PF.                                    
      @705    MDC24                    N2PF.                                    
      @707    MDNUM1_R                 N9PF.                                    
      @716    MDNUM2_R                 N9PF.                                    
      @725    MEDINCSTQ                N2PF.                                    
      @727    MRN_R                    N9PF.                                    
      @736    NDX                      N2PF.                                    
      @738    NECODE                   N2PF.                                    
      @740    NEOMAT                   N2PF.                                    
      @742    NPR                      N2PF.                                    
      @744    PAY1                     N2PF.                                    
      @746    PAY1_X                   $CHAR4.                                  
      @750    PL_CBSA                  N3PF.                                    
      @753    PL_MSA1993               N3PF.                                    
      @756    PL_NCHS2006              N2PF.                                    
      @758    PL_RUCA10_2005           N2PF.                                    
      @760    PL_RUCA2005              N4P1F.                                   
      @764    PL_RUCA4_2005            N2PF.                                    
      @766    PL_RUCC2003              N2PF.                                    
      @768    PL_UIC2003               N2PF.                                    
      @770    PL_UR_CAT4               N2PF.                                    
      @772    PR1                      $CHAR4.                                  
      @776    PR2                      $CHAR4.                                  
      @780    PR3                      $CHAR4.                                  
      @784    PR4                      $CHAR4.                                  
      @788    PR5                      $CHAR4.                                  
      @792    PR6                      $CHAR4.                                  
      @796    PR7                      $CHAR4.                                  
      @800    PR8                      $CHAR4.                                  
      @804    PR9                      $CHAR4.                                  
      @808    PR10                     $CHAR4.                                  
      @812    PR11                     $CHAR4.                                  
      @816    PR12                     $CHAR4.                                  
      @820    PR13                     $CHAR4.                                  
      @824    PR14                     $CHAR4.                                  
      @828    PR15                     $CHAR4.                                  
      @832    PR16                     $CHAR4.                                  
      @836    PR17                     $CHAR4.                                  
      @840    PR18                     $CHAR4.                                  
      @844    PR19                     $CHAR4.                                  
      @848    PR20                     $CHAR4.                                  
      @852    PR21                     $CHAR4.                                  
      @856    PR22                     $CHAR4.                                  
      @860    PR23                     $CHAR4.                                  
      @864    PR24                     $CHAR4.                                  
      @868    PR25                     $CHAR4.                                  
      @872    PR26                     $CHAR4.                                  
      @876    PR27                     $CHAR4.                                  
      @880    PR28                     $CHAR4.                                  
      @884    PR29                     $CHAR4.                                  
      @888    PR30                     $CHAR4.                                  
      @892    PR31                     $CHAR4.                                  
      @896    PR32                     $CHAR4.                                  
      @900    PRCCS1                   N3PF.                                    
      @903    PRCCS2                   N3PF.                                    
      @906    PRCCS3                   N3PF.                                    
      @909    PRCCS4                   N3PF.                                    
      @912    PRCCS5                   N3PF.                                    
      @915    PRCCS6                   N3PF.                                    
      @918    PRCCS7                   N3PF.                                    
      @921    PRCCS8                   N3PF.                                    
      @924    PRCCS9                   N3PF.                                    
      @927    PRCCS10                  N3PF.                                    
      @930    PRCCS11                  N3PF.                                    
      @933    PRCCS12                  N3PF.                                    
      @936    PRCCS13                  N3PF.                                    
      @939    PRCCS14                  N3PF.                                    
      @942    PRCCS15                  N3PF.                                    
      @945    PRCCS16                  N3PF.                                    
      @948    PRCCS17                  N3PF.                                    
      @951    PRCCS18                  N3PF.                                    
      @954    PRCCS19                  N3PF.                                    
      @957    PRCCS20                  N3PF.                                    
      @960    PRCCS21                  N3PF.                                    
      @963    PRCCS22                  N3PF.                                    
      @966    PRCCS23                  N3PF.                                    
      @969    PRCCS24                  N3PF.                                    
      @972    PRCCS25                  N3PF.                                    
      @975    PRCCS26                  N3PF.                                    
      @978    PRCCS27                  N3PF.                                    
      @981    PRCCS28                  N3PF.                                    
      @984    PRCCS29                  N3PF.                                    
      @987    PRCCS30                  N3PF.                                    
      @990    PRCCS31                  N3PF.                                    
      @993    PRCCS32                  N3PF.                                    
      @996    PRDAY1                   N5PF.                                    
      @1001   PRDAY2                   N5PF.                                    
      @1006   PRDAY3                   N5PF.                                    
      @1011   PRDAY4                   N5PF.                                    
      @1016   PRDAY5                   N5PF.                                    
      @1021   PRDAY6                   N5PF.                                    
      @1026   PRDAY7                   N5PF.                                    
      @1031   PRDAY8                   N5PF.                                    
      @1036   PRDAY9                   N5PF.                                    
      @1041   PRDAY10                  N5PF.                                    
      @1046   PRDAY11                  N5PF.                                    
      @1051   PRDAY12                  N5PF.                                    
      @1056   PRDAY13                  N5PF.                                    
      @1061   PRDAY14                  N5PF.                                    
      @1066   PRDAY15                  N5PF.                                    
      @1071   PRDAY16                  N5PF.                                    
      @1076   PRDAY17                  N5PF.                                    
      @1081   PRDAY18                  N5PF.                                    
      @1086   PRDAY19                  N5PF.                                    
      @1091   PRDAY20                  N5PF.                                    
      @1096   PRDAY21                  N5PF.                                    
      @1101   PRDAY22                  N5PF.                                    
      @1106   PRDAY23                  N5PF.                                    
      @1111   PRDAY24                  N5PF.                                    
      @1116   PRDAY25                  N5PF.                                    
      @1121   PRDAY26                  N5PF.                                    
      @1126   PRDAY27                  N5PF.                                    
      @1131   PRDAY28                  N5PF.                                    
      @1136   PRDAY29                  N5PF.                                    
      @1141   PRDAY30                  N5PF.                                    
      @1146   PRDAY31                  N5PF.                                    
      @1151   PRDAY32                  N5PF.                                    
      @1156   PROCTYPE                 N3PF.                                    
      @1159   PSTATE                   $CHAR2.                                  
      @1161   PSTCO                    N5PF.                                    
      @1166   PSTCO2                   N5PF.                                    
      @1171   PointOfOriginUB04        $CHAR1.                                  
      @1172   PointOfOrigin_X          $CHAR1.                                  
      @1173   RACE                     N2PF.                                    
      @1175   RACE_X                   $CHAR4.                                  
      @1179   TOTCHG                   N10PF.                                   
      @1189   TOTCHG_X                 N15P2F.                                  
      @1204   YEAR                     N4PF.                                    
      @1208   ZIPINC_QRTL              N3PF.                                    
      @1211   ZIP                      $CHAR5.                                  
      @1216   AYEAR                    N4PF.                                    
      @1220   DMONTH                   N2PF.                                    
      @1222   BMONTH                   N2PF.                                    
      @1224   BYEAR                    N4PF.                                    
      @1228   PRMONTH1                 N2PF.                                    
      @1230   PRMONTH2                 N2PF.                                    
      @1232   PRMONTH3                 N2PF.                                    
      @1234   PRMONTH4                 N2PF.                                    
      @1236   PRMONTH5                 N2PF.                                    
      @1238   PRMONTH6                 N2PF.                                    
      @1240   PRMONTH7                 N2PF.                                    
      @1242   PRMONTH8                 N2PF.                                    
      @1244   PRMONTH9                 N2PF.                                    
      @1246   PRMONTH10                N2PF.                                    
      @1248   PRMONTH11                N2PF.                                    
      @1250   PRMONTH12                N2PF.                                    
      @1252   PRMONTH13                N2PF.                                    
      @1254   PRMONTH14                N2PF.                                    
      @1256   PRMONTH15                N2PF.                                    
      @1258   PRMONTH16                N2PF.                                    
      @1260   PRMONTH17                N2PF.                                    
      @1262   PRMONTH18                N2PF.                                    
      @1264   PRMONTH19                N2PF.                                    
      @1266   PRMONTH20                N2PF.                                    
      @1268   PRMONTH21                N2PF.                                    
      @1270   PRMONTH22                N2PF.                                    
      @1272   PRMONTH23                N2PF.                                    
      @1274   PRMONTH24                N2PF.                                    
      @1276   PRMONTH25                N2PF.                                    
      @1278   PRMONTH26                N2PF.                                    
      @1280   PRMONTH27                N2PF.                                    
      @1282   PRMONTH28                N2PF.                                    
      @1284   PRMONTH29                N2PF.                                    
      @1286   PRMONTH30                N2PF.                                    
      @1288   PRMONTH31                N2PF.                                    
      @1290   PRMONTH32                N2PF.                                    
      @1292   PRYEAR1                  N4PF.                                    
      @1296   PRYEAR2                  N4PF.                                    
      @1300   PRYEAR3                  N4PF.                                    
      @1304   PRYEAR4                  N4PF.                                    
      @1308   PRYEAR5                  N4PF.                                    
      @1312   PRYEAR6                  N4PF.                                    
      @1316   PRYEAR7                  N4PF.                                    
      @1320   PRYEAR8                  N4PF.                                    
      @1324   PRYEAR9                  N4PF.                                    
      @1328   PRYEAR10                 N4PF.                                    
      @1332   PRYEAR11                 N4PF.                                    
      @1336   PRYEAR12                 N4PF.                                    
      @1340   PRYEAR13                 N4PF.                                    
      @1344   PRYEAR14                 N4PF.                                    
      @1348   PRYEAR15                 N4PF.                                    
      @1352   PRYEAR16                 N4PF.                                    
      @1356   PRYEAR17                 N4PF.                                    
      @1360   PRYEAR18                 N4PF.                                    
      @1364   PRYEAR19                 N4PF.                                    
      @1368   PRYEAR20                 N4PF.                                    
      @1372   PRYEAR21                 N4PF.                                    
      @1376   PRYEAR22                 N4PF.                                    
      @1380   PRYEAR23                 N4PF.                                    
      @1384   PRYEAR24                 N4PF.                                    
      @1388   PRYEAR25                 N4PF.                                    
      @1392   PRYEAR26                 N4PF.                                    
      @1396   PRYEAR27                 N4PF.                                    
      @1400   PRYEAR28                 N4PF.                                    
      @1404   PRYEAR29                 N4PF.                                    
      @1408   PRYEAR30                 N4PF.                                    
      @1412   PRYEAR31                 N4PF.                                    
      @1416   PRYEAR32                 N4PF.                                    
      ;                                                                         
                                                                                
                                                                                
RUN;
