/*******************************************************************            
*   MI_SID_2012_CORE.SAS:                                                       
*      THE SAS CODE SHOWN BELOW WILL LOAD THE ASCII                             
*      INPATIENT STAY CORE FILE INTO SAS                                        
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
DATA MI_SIDC_2012_CORE;                                                         
INFILE 'MI_SID_2012_CORE.ASC' FIRSTOBS=3 LRECL = 1178;                          
                                                                                
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
                                                                                
  DISP_X                     LENGTH=$2                                          
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
                                                                                
  DX_Admitting               LENGTH=$5                                          
  LABEL="Admitting Diagnosis Code"                                              
                                                                                
  DaysCCU                    LENGTH=3                                           
  LABEL="Days in coronary care unit (as received from source)"                  
                                                                                
  DaysICU                    LENGTH=3                                           
  LABEL="Days in medical/surgical intensive care unit (as received from source)"
                                                                                
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
                                                                                
  E_POA8                     LENGTH=$1                                          
  LABEL="E Code 8, present on admission indicator"                              
                                                                                
  E_POA9                     LENGTH=$1                                          
  LABEL="E Code 9, present on admission indicator"                              
                                                                                
  FEMALE                     LENGTH=3                                           
  LABEL="Indicator of sex"                                                      
                                                                                
  HCUP_ED                    LENGTH=3                                           
  LABEL="HCUP Emergency Department service indicator"                           
                                                                                
  HCUP_OS                    LENGTH=3                                           
  LABEL="HCUP Observation Stay service indicator"                               
                                                                                
  HISPANIC_X                 LENGTH=$1                                          
  LABEL="Hispanic ethnicity (as received from source)"                          
                                                                                
  HOSPBRTH                   LENGTH=3                                           
  LABEL="Indicator of birth in this hospital"                                   
                                                                                
  HOSPST                     LENGTH=$2                                          
  LABEL="Hospital state postal code"                                            
                                                                                
  KEY                        LENGTH=8                 FORMAT=Z15.               
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
                                                                                
  MEDINCSTQ                  LENGTH=3                                           
  LABEL="Median household income state quartile for patient ZIP Code"           
                                                                                
  MOMNUM_R                   LENGTH=5                                           
  LABEL="Mother's number (re-identified)"                                       
                                                                                
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
                                                                                
  PAY1_X                     LENGTH=$2                                          
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PAY2                       LENGTH=3                                           
  LABEL="Secondary expected payer (uniform)"                                    
                                                                                
  PAY2_X                     LENGTH=$2                                          
  LABEL="Secondary expected payer (as received from source)"                    
                                                                                
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
                                                                                
  PROCTYPE                   LENGTH=3                                           
  LABEL="Procedure type indicator"                                              
                                                                                
  PSTATE                     LENGTH=$2                                          
  LABEL="Patient State postal code"                                             
                                                                                
  PSTCO2                     LENGTH=4                 FORMAT=Z5.                
  LABEL="Patient state/county FIPS code, possibly derived from ZIP Code"        
                                                                                
  PointOfOriginUB04          LENGTH=$1                                          
  LABEL="Point of origin for admission or visit, UB-04 standard coding"         
                                                                                
  PointOfOrigin_X            LENGTH=$1                                          
  LABEL="Point of origin for admission or visit, as received from source"       
                                                                                
  RACE                       LENGTH=3                                           
  LABEL="Race (uniform)"                                                        
                                                                                
  RACE_X                     LENGTH=$1                                          
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
      @22     DISP_X                   $CHAR2.                                  
      @24     DQTR                     N2PF.                                    
      @26     DRG                      N3PF.                                    
      @29     DRG24                    N3PF.                                    
      @32     DRGVER                   N2PF.                                    
      @34     DRG_NoPOA                N3PF.                                    
      @37     DX1                      $CHAR5.                                  
      @42     DX2                      $CHAR5.                                  
      @47     DX3                      $CHAR5.                                  
      @52     DX4                      $CHAR5.                                  
      @57     DX5                      $CHAR5.                                  
      @62     DX6                      $CHAR5.                                  
      @67     DX7                      $CHAR5.                                  
      @72     DX8                      $CHAR5.                                  
      @77     DX9                      $CHAR5.                                  
      @82     DX10                     $CHAR5.                                  
      @87     DX11                     $CHAR5.                                  
      @92     DX12                     $CHAR5.                                  
      @97     DX13                     $CHAR5.                                  
      @102    DX14                     $CHAR5.                                  
      @107    DX15                     $CHAR5.                                  
      @112    DX16                     $CHAR5.                                  
      @117    DX17                     $CHAR5.                                  
      @122    DX18                     $CHAR5.                                  
      @127    DX19                     $CHAR5.                                  
      @132    DX20                     $CHAR5.                                  
      @137    DX21                     $CHAR5.                                  
      @142    DX22                     $CHAR5.                                  
      @147    DX23                     $CHAR5.                                  
      @152    DX24                     $CHAR5.                                  
      @157    DX25                     $CHAR5.                                  
      @162    DX26                     $CHAR5.                                  
      @167    DX27                     $CHAR5.                                  
      @172    DX28                     $CHAR5.                                  
      @177    DX29                     $CHAR5.                                  
      @182    DX30                     $CHAR5.                                  
      @187    DXCCS1                   N4PF.                                    
      @191    DXCCS2                   N4PF.                                    
      @195    DXCCS3                   N4PF.                                    
      @199    DXCCS4                   N4PF.                                    
      @203    DXCCS5                   N4PF.                                    
      @207    DXCCS6                   N4PF.                                    
      @211    DXCCS7                   N4PF.                                    
      @215    DXCCS8                   N4PF.                                    
      @219    DXCCS9                   N4PF.                                    
      @223    DXCCS10                  N4PF.                                    
      @227    DXCCS11                  N4PF.                                    
      @231    DXCCS12                  N4PF.                                    
      @235    DXCCS13                  N4PF.                                    
      @239    DXCCS14                  N4PF.                                    
      @243    DXCCS15                  N4PF.                                    
      @247    DXCCS16                  N4PF.                                    
      @251    DXCCS17                  N4PF.                                    
      @255    DXCCS18                  N4PF.                                    
      @259    DXCCS19                  N4PF.                                    
      @263    DXCCS20                  N4PF.                                    
      @267    DXCCS21                  N4PF.                                    
      @271    DXCCS22                  N4PF.                                    
      @275    DXCCS23                  N4PF.                                    
      @279    DXCCS24                  N4PF.                                    
      @283    DXCCS25                  N4PF.                                    
      @287    DXCCS26                  N4PF.                                    
      @291    DXCCS27                  N4PF.                                    
      @295    DXCCS28                  N4PF.                                    
      @299    DXCCS29                  N4PF.                                    
      @303    DXCCS30                  N4PF.                                    
      @307    DXPOA1                   $CHAR1.                                  
      @308    DXPOA2                   $CHAR1.                                  
      @309    DXPOA3                   $CHAR1.                                  
      @310    DXPOA4                   $CHAR1.                                  
      @311    DXPOA5                   $CHAR1.                                  
      @312    DXPOA6                   $CHAR1.                                  
      @313    DXPOA7                   $CHAR1.                                  
      @314    DXPOA8                   $CHAR1.                                  
      @315    DXPOA9                   $CHAR1.                                  
      @316    DXPOA10                  $CHAR1.                                  
      @317    DXPOA11                  $CHAR1.                                  
      @318    DXPOA12                  $CHAR1.                                  
      @319    DXPOA13                  $CHAR1.                                  
      @320    DXPOA14                  $CHAR1.                                  
      @321    DXPOA15                  $CHAR1.                                  
      @322    DXPOA16                  $CHAR1.                                  
      @323    DXPOA17                  $CHAR1.                                  
      @324    DXPOA18                  $CHAR1.                                  
      @325    DXPOA19                  $CHAR1.                                  
      @326    DXPOA20                  $CHAR1.                                  
      @327    DXPOA21                  $CHAR1.                                  
      @328    DXPOA22                  $CHAR1.                                  
      @329    DXPOA23                  $CHAR1.                                  
      @330    DXPOA24                  $CHAR1.                                  
      @331    DXPOA25                  $CHAR1.                                  
      @332    DXPOA26                  $CHAR1.                                  
      @333    DXPOA27                  $CHAR1.                                  
      @334    DXPOA28                  $CHAR1.                                  
      @335    DXPOA29                  $CHAR1.                                  
      @336    DXPOA30                  $CHAR1.                                  
      @337    DX_Admitting             $CHAR5.                                  
      @342    DaysCCU                  N3PF.                                    
      @345    DaysICU                  N3PF.                                    
      @348    ECODE1                   $CHAR5.                                  
      @353    ECODE2                   $CHAR5.                                  
      @358    ECODE3                   $CHAR5.                                  
      @363    ECODE4                   $CHAR5.                                  
      @368    ECODE5                   $CHAR5.                                  
      @373    ECODE6                   $CHAR5.                                  
      @378    ECODE7                   $CHAR5.                                  
      @383    ECODE8                   $CHAR5.                                  
      @388    ECODE9                   $CHAR5.                                  
      @393    E_CCS1                   N4PF.                                    
      @397    E_CCS2                   N4PF.                                    
      @401    E_CCS3                   N4PF.                                    
      @405    E_CCS4                   N4PF.                                    
      @409    E_CCS5                   N4PF.                                    
      @413    E_CCS6                   N4PF.                                    
      @417    E_CCS7                   N4PF.                                    
      @421    E_CCS8                   N4PF.                                    
      @425    E_CCS9                   N4PF.                                    
      @429    E_POA1                   $CHAR1.                                  
      @430    E_POA2                   $CHAR1.                                  
      @431    E_POA3                   $CHAR1.                                  
      @432    E_POA4                   $CHAR1.                                  
      @433    E_POA5                   $CHAR1.                                  
      @434    E_POA6                   $CHAR1.                                  
      @435    E_POA7                   $CHAR1.                                  
      @436    E_POA8                   $CHAR1.                                  
      @437    E_POA9                   $CHAR1.                                  
      @438    FEMALE                   N2PF.                                    
      @440    HCUP_ED                  N2PF.                                    
      @442    HCUP_OS                  N2PF.                                    
      @444    HISPANIC_X               $CHAR1.                                  
      @445    HOSPBRTH                 N3PF.                                    
      @448    HOSPST                   $CHAR2.                                  
      @450    KEY                      15.                                      
      @465    LOS                      N5PF.                                    
      @470    LOS_X                    N6PF.                                    
      @476    MDC                      N2PF.                                    
      @478    MDC24                    N2PF.                                    
      @480    MDC_NoPOA                N2PF.                                    
      @482    MDNUM1_R                 N9PF.                                    
      @491    MDNUM2_R                 N9PF.                                    
      @500    MEDINCSTQ                N2PF.                                    
      @502    MOMNUM_R                 N9PF.                                    
      @511    MRN_R                    N9PF.                                    
      @520    NCHRONIC                 N3PF.                                    
      @523    NDX                      N2PF.                                    
      @525    NECODE                   N2PF.                                    
      @527    NEOMAT                   N2PF.                                    
      @529    NPR                      N2PF.                                    
      @531    ORPROC                   N2PF.                                    
      @533    PAY1                     N2PF.                                    
      @535    PAY1_X                   $CHAR2.                                  
      @537    PAY2                     N2PF.                                    
      @539    PAY2_X                   $CHAR2.                                  
      @541    PL_CBSA                  N3PF.                                    
      @544    PL_MSA1993               N3PF.                                    
      @547    PL_NCHS2006              N2PF.                                    
      @549    PL_RUCA10_2005           N2PF.                                    
      @551    PL_RUCA2005              N4P1F.                                   
      @555    PL_RUCA4_2005            N2PF.                                    
      @557    PL_RUCC2003              N2PF.                                    
      @559    PL_UIC2003               N2PF.                                    
      @561    PL_UR_CAT4               N2PF.                                    
      @563    PR1                      $CHAR4.                                  
      @567    PR2                      $CHAR4.                                  
      @571    PR3                      $CHAR4.                                  
      @575    PR4                      $CHAR4.                                  
      @579    PR5                      $CHAR4.                                  
      @583    PR6                      $CHAR4.                                  
      @587    PR7                      $CHAR4.                                  
      @591    PR8                      $CHAR4.                                  
      @595    PR9                      $CHAR4.                                  
      @599    PR10                     $CHAR4.                                  
      @603    PR11                     $CHAR4.                                  
      @607    PR12                     $CHAR4.                                  
      @611    PR13                     $CHAR4.                                  
      @615    PR14                     $CHAR4.                                  
      @619    PR15                     $CHAR4.                                  
      @623    PR16                     $CHAR4.                                  
      @627    PR17                     $CHAR4.                                  
      @631    PR18                     $CHAR4.                                  
      @635    PR19                     $CHAR4.                                  
      @639    PR20                     $CHAR4.                                  
      @643    PR21                     $CHAR4.                                  
      @647    PR22                     $CHAR4.                                  
      @651    PR23                     $CHAR4.                                  
      @655    PR24                     $CHAR4.                                  
      @659    PR25                     $CHAR4.                                  
      @663    PR26                     $CHAR4.                                  
      @667    PR27                     $CHAR4.                                  
      @671    PR28                     $CHAR4.                                  
      @675    PR29                     $CHAR4.                                  
      @679    PR30                     $CHAR4.                                  
      @683    PRCCS1                   N3PF.                                    
      @686    PRCCS2                   N3PF.                                    
      @689    PRCCS3                   N3PF.                                    
      @692    PRCCS4                   N3PF.                                    
      @695    PRCCS5                   N3PF.                                    
      @698    PRCCS6                   N3PF.                                    
      @701    PRCCS7                   N3PF.                                    
      @704    PRCCS8                   N3PF.                                    
      @707    PRCCS9                   N3PF.                                    
      @710    PRCCS10                  N3PF.                                    
      @713    PRCCS11                  N3PF.                                    
      @716    PRCCS12                  N3PF.                                    
      @719    PRCCS13                  N3PF.                                    
      @722    PRCCS14                  N3PF.                                    
      @725    PRCCS15                  N3PF.                                    
      @728    PRCCS16                  N3PF.                                    
      @731    PRCCS17                  N3PF.                                    
      @734    PRCCS18                  N3PF.                                    
      @737    PRCCS19                  N3PF.                                    
      @740    PRCCS20                  N3PF.                                    
      @743    PRCCS21                  N3PF.                                    
      @746    PRCCS22                  N3PF.                                    
      @749    PRCCS23                  N3PF.                                    
      @752    PRCCS24                  N3PF.                                    
      @755    PRCCS25                  N3PF.                                    
      @758    PRCCS26                  N3PF.                                    
      @761    PRCCS27                  N3PF.                                    
      @764    PRCCS28                  N3PF.                                    
      @767    PRCCS29                  N3PF.                                    
      @770    PRCCS30                  N3PF.                                    
      @773    PRDAY1                   N5PF.                                    
      @778    PRDAY2                   N5PF.                                    
      @783    PRDAY3                   N5PF.                                    
      @788    PRDAY4                   N5PF.                                    
      @793    PRDAY5                   N5PF.                                    
      @798    PRDAY6                   N5PF.                                    
      @803    PRDAY7                   N5PF.                                    
      @808    PRDAY8                   N5PF.                                    
      @813    PRDAY9                   N5PF.                                    
      @818    PRDAY10                  N5PF.                                    
      @823    PRDAY11                  N5PF.                                    
      @828    PRDAY12                  N5PF.                                    
      @833    PRDAY13                  N5PF.                                    
      @838    PRDAY14                  N5PF.                                    
      @843    PRDAY15                  N5PF.                                    
      @848    PRDAY16                  N5PF.                                    
      @853    PRDAY17                  N5PF.                                    
      @858    PRDAY18                  N5PF.                                    
      @863    PRDAY19                  N5PF.                                    
      @868    PRDAY20                  N5PF.                                    
      @873    PRDAY21                  N5PF.                                    
      @878    PRDAY22                  N5PF.                                    
      @883    PRDAY23                  N5PF.                                    
      @888    PRDAY24                  N5PF.                                    
      @893    PRDAY25                  N5PF.                                    
      @898    PRDAY26                  N5PF.                                    
      @903    PRDAY27                  N5PF.                                    
      @908    PRDAY28                  N5PF.                                    
      @913    PRDAY29                  N5PF.                                    
      @918    PRDAY30                  N5PF.                                    
      @923    PROCTYPE                 N3PF.                                    
      @926    PSTATE                   $CHAR2.                                  
      @928    PSTCO2                   N5PF.                                    
      @933    PointOfOriginUB04        $CHAR1.                                  
      @934    PointOfOrigin_X          $CHAR1.                                  
      @935    RACE                     N2PF.                                    
      @937    RACE_X                   $CHAR1.                                  
      @938    TOTCHG                   N10PF.                                   
      @948    TOTCHG_X                 N15P2F.                                  
      @963    TRAN_IN                  N2PF.                                    
      @965    TRAN_OUT                 N2PF.                                    
      @967    YEAR                     N4PF.                                    
      @971    ZIP3                     $CHAR3.                                  
      @974    ZIPINC_QRTL              N3PF.                                    
      @977    HOSPID                   N5PF.                                    
      @982    ZIP                      $CHAR5.                                  
      @987    AYEAR                    N4PF.                                    
      @991    DMONTH                   N2PF.                                    
      @993    BMONTH                   N2PF.                                    
      @995    BYEAR                    N4PF.                                    
      @999    PRMONTH1                 N2PF.                                    
      @1001   PRMONTH2                 N2PF.                                    
      @1003   PRMONTH3                 N2PF.                                    
      @1005   PRMONTH4                 N2PF.                                    
      @1007   PRMONTH5                 N2PF.                                    
      @1009   PRMONTH6                 N2PF.                                    
      @1011   PRMONTH7                 N2PF.                                    
      @1013   PRMONTH8                 N2PF.                                    
      @1015   PRMONTH9                 N2PF.                                    
      @1017   PRMONTH10                N2PF.                                    
      @1019   PRMONTH11                N2PF.                                    
      @1021   PRMONTH12                N2PF.                                    
      @1023   PRMONTH13                N2PF.                                    
      @1025   PRMONTH14                N2PF.                                    
      @1027   PRMONTH15                N2PF.                                    
      @1029   PRMONTH16                N2PF.                                    
      @1031   PRMONTH17                N2PF.                                    
      @1033   PRMONTH18                N2PF.                                    
      @1035   PRMONTH19                N2PF.                                    
      @1037   PRMONTH20                N2PF.                                    
      @1039   PRMONTH21                N2PF.                                    
      @1041   PRMONTH22                N2PF.                                    
      @1043   PRMONTH23                N2PF.                                    
      @1045   PRMONTH24                N2PF.                                    
      @1047   PRMONTH25                N2PF.                                    
      @1049   PRMONTH26                N2PF.                                    
      @1051   PRMONTH27                N2PF.                                    
      @1053   PRMONTH28                N2PF.                                    
      @1055   PRMONTH29                N2PF.                                    
      @1057   PRMONTH30                N2PF.                                    
      @1059   PRYEAR1                  N4PF.                                    
      @1063   PRYEAR2                  N4PF.                                    
      @1067   PRYEAR3                  N4PF.                                    
      @1071   PRYEAR4                  N4PF.                                    
      @1075   PRYEAR5                  N4PF.                                    
      @1079   PRYEAR6                  N4PF.                                    
      @1083   PRYEAR7                  N4PF.                                    
      @1087   PRYEAR8                  N4PF.                                    
      @1091   PRYEAR9                  N4PF.                                    
      @1095   PRYEAR10                 N4PF.                                    
      @1099   PRYEAR11                 N4PF.                                    
      @1103   PRYEAR12                 N4PF.                                    
      @1107   PRYEAR13                 N4PF.                                    
      @1111   PRYEAR14                 N4PF.                                    
      @1115   PRYEAR15                 N4PF.                                    
      @1119   PRYEAR16                 N4PF.                                    
      @1123   PRYEAR17                 N4PF.                                    
      @1127   PRYEAR18                 N4PF.                                    
      @1131   PRYEAR19                 N4PF.                                    
      @1135   PRYEAR20                 N4PF.                                    
      @1139   PRYEAR21                 N4PF.                                    
      @1143   PRYEAR22                 N4PF.                                    
      @1147   PRYEAR23                 N4PF.                                    
      @1151   PRYEAR24                 N4PF.                                    
      @1155   PRYEAR25                 N4PF.                                    
      @1159   PRYEAR26                 N4PF.                                    
      @1163   PRYEAR27                 N4PF.                                    
      @1167   PRYEAR28                 N4PF.                                    
      @1171   PRYEAR29                 N4PF.                                    
      @1175   PRYEAR30                 N4PF.                                    
      ;                                                                         
                                                                                
                                                                                
RUN;
