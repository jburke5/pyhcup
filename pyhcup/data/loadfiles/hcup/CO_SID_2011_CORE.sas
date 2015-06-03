/*******************************************************************            
*   CO_SID_2011_CORE.SAS:                                                       
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
DATA CO_SIDC_2011_CORE;                                                         
INFILE 'CO_SID_2011_CORE.ASC' LRECL = 1207;                                     
                                                                                
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
                                                                                
  BWT                        LENGTH=4                                           
  LABEL="Birth weight in grams"                                                 
                                                                                
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
                                                                                
  ECODE10                    LENGTH=$5                                          
  LABEL="E code 10"                                                             
                                                                                
  ECODE11                    LENGTH=$5                                          
  LABEL="E code 11"                                                             
                                                                                
  ECODE12                    LENGTH=$5                                          
  LABEL="E code 12"                                                             
                                                                                
  ECODE13                    LENGTH=$5                                          
  LABEL="E code 13"                                                             
                                                                                
  ECODE14                    LENGTH=$5                                          
  LABEL="E code 14"                                                             
                                                                                
  ECODE15                    LENGTH=$5                                          
  LABEL="E code 15"                                                             
                                                                                
  ECODE16                    LENGTH=$5                                          
  LABEL="E code 16"                                                             
                                                                                
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
                                                                                
  E_CCS10                    LENGTH=3                                           
  LABEL="CCS: E Code 10"                                                        
                                                                                
  E_CCS11                    LENGTH=3                                           
  LABEL="CCS: E Code 11"                                                        
                                                                                
  E_CCS12                    LENGTH=3                                           
  LABEL="CCS: E Code 12"                                                        
                                                                                
  E_CCS13                    LENGTH=3                                           
  LABEL="CCS: E Code 13"                                                        
                                                                                
  E_CCS14                    LENGTH=3                                           
  LABEL="CCS: E Code 14"                                                        
                                                                                
  E_CCS15                    LENGTH=3                                           
  LABEL="CCS: E Code 15"                                                        
                                                                                
  E_CCS16                    LENGTH=3                                           
  LABEL="CCS: E Code 16"                                                        
                                                                                
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
                                                                                
  Homeless                   LENGTH=3                                           
  LABEL="Indicator that patient is homeless"                                    
                                                                                
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
                                                                                
  PAY1_X                     LENGTH=$2                                          
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
      @16     BWT                      N4PF.                                    
      @20     DIED                     N2PF.                                    
      @22     DISPUB04                 N2PF.                                    
      @24     DISPUNIFORM              N2PF.                                    
      @26     DISP_X                   $CHAR2.                                  
      @28     DQTR                     N2PF.                                    
      @30     DRG                      N3PF.                                    
      @33     DRG24                    N3PF.                                    
      @36     DRGVER                   N2PF.                                    
      @38     DRG_NoPOA                N3PF.                                    
      @41     DSHOSPID                 $CHAR17.                                 
      @58     DX1                      $CHAR5.                                  
      @63     DX2                      $CHAR5.                                  
      @68     DX3                      $CHAR5.                                  
      @73     DX4                      $CHAR5.                                  
      @78     DX5                      $CHAR5.                                  
      @83     DX6                      $CHAR5.                                  
      @88     DX7                      $CHAR5.                                  
      @93     DX8                      $CHAR5.                                  
      @98     DX9                      $CHAR5.                                  
      @103    DX10                     $CHAR5.                                  
      @108    DX11                     $CHAR5.                                  
      @113    DX12                     $CHAR5.                                  
      @118    DX13                     $CHAR5.                                  
      @123    DX14                     $CHAR5.                                  
      @128    DX15                     $CHAR5.                                  
      @133    DX16                     $CHAR5.                                  
      @138    DX17                     $CHAR5.                                  
      @143    DX18                     $CHAR5.                                  
      @148    DX19                     $CHAR5.                                  
      @153    DX20                     $CHAR5.                                  
      @158    DX21                     $CHAR5.                                  
      @163    DX22                     $CHAR5.                                  
      @168    DX23                     $CHAR5.                                  
      @173    DX24                     $CHAR5.                                  
      @178    DX25                     $CHAR5.                                  
      @183    DX26                     $CHAR5.                                  
      @188    DX27                     $CHAR5.                                  
      @193    DX28                     $CHAR5.                                  
      @198    DX29                     $CHAR5.                                  
      @203    DX30                     $CHAR5.                                  
      @208    DXCCS1                   N4PF.                                    
      @212    DXCCS2                   N4PF.                                    
      @216    DXCCS3                   N4PF.                                    
      @220    DXCCS4                   N4PF.                                    
      @224    DXCCS5                   N4PF.                                    
      @228    DXCCS6                   N4PF.                                    
      @232    DXCCS7                   N4PF.                                    
      @236    DXCCS8                   N4PF.                                    
      @240    DXCCS9                   N4PF.                                    
      @244    DXCCS10                  N4PF.                                    
      @248    DXCCS11                  N4PF.                                    
      @252    DXCCS12                  N4PF.                                    
      @256    DXCCS13                  N4PF.                                    
      @260    DXCCS14                  N4PF.                                    
      @264    DXCCS15                  N4PF.                                    
      @268    DXCCS16                  N4PF.                                    
      @272    DXCCS17                  N4PF.                                    
      @276    DXCCS18                  N4PF.                                    
      @280    DXCCS19                  N4PF.                                    
      @284    DXCCS20                  N4PF.                                    
      @288    DXCCS21                  N4PF.                                    
      @292    DXCCS22                  N4PF.                                    
      @296    DXCCS23                  N4PF.                                    
      @300    DXCCS24                  N4PF.                                    
      @304    DXCCS25                  N4PF.                                    
      @308    DXCCS26                  N4PF.                                    
      @312    DXCCS27                  N4PF.                                    
      @316    DXCCS28                  N4PF.                                    
      @320    DXCCS29                  N4PF.                                    
      @324    DXCCS30                  N4PF.                                    
      @328    ECODE1                   $CHAR5.                                  
      @333    ECODE2                   $CHAR5.                                  
      @338    ECODE3                   $CHAR5.                                  
      @343    ECODE4                   $CHAR5.                                  
      @348    ECODE5                   $CHAR5.                                  
      @353    ECODE6                   $CHAR5.                                  
      @358    ECODE7                   $CHAR5.                                  
      @363    ECODE8                   $CHAR5.                                  
      @368    ECODE9                   $CHAR5.                                  
      @373    ECODE10                  $CHAR5.                                  
      @378    ECODE11                  $CHAR5.                                  
      @383    ECODE12                  $CHAR5.                                  
      @388    ECODE13                  $CHAR5.                                  
      @393    ECODE14                  $CHAR5.                                  
      @398    ECODE15                  $CHAR5.                                  
      @403    ECODE16                  $CHAR5.                                  
      @408    E_CCS1                   N4PF.                                    
      @412    E_CCS2                   N4PF.                                    
      @416    E_CCS3                   N4PF.                                    
      @420    E_CCS4                   N4PF.                                    
      @424    E_CCS5                   N4PF.                                    
      @428    E_CCS6                   N4PF.                                    
      @432    E_CCS7                   N4PF.                                    
      @436    E_CCS8                   N4PF.                                    
      @440    E_CCS9                   N4PF.                                    
      @444    E_CCS10                  N4PF.                                    
      @448    E_CCS11                  N4PF.                                    
      @452    E_CCS12                  N4PF.                                    
      @456    E_CCS13                  N4PF.                                    
      @460    E_CCS14                  N4PF.                                    
      @464    E_CCS15                  N4PF.                                    
      @468    E_CCS16                  N4PF.                                    
      @472    FEMALE                   N2PF.                                    
      @474    HCUP_ED                  N2PF.                                    
      @476    HCUP_OS                  N2PF.                                    
      @478    HCUP_SURGERY_BROAD       N2PF.                                    
      @480    HCUP_SURGERY_NARROW      N2PF.                                    
      @482    HOSPBRTH                 N3PF.                                    
      @485    HOSPST                   $CHAR2.                                  
      @487    Homeless                 N2PF.                                    
      @489    KEY                      18.                                      
      @507    LOS                      N5PF.                                    
      @512    LOS_X                    N6PF.                                    
      @518    MDC                      N2PF.                                    
      @520    MDC24                    N2PF.                                    
      @522    MDC_NoPOA                N2PF.                                    
      @524    MDNUM1_R                 N9PF.                                    
      @533    MDNUM2_R                 N9PF.                                    
      @542    MEDINCSTQ                N2PF.                                    
      @544    MRN_R                    N9PF.                                    
      @553    NCHRONIC                 N3PF.                                    
      @556    NDX                      N2PF.                                    
      @558    NECODE                   N2PF.                                    
      @560    NEOMAT                   N2PF.                                    
      @562    NPR                      N2PF.                                    
      @564    ORPROC                   N2PF.                                    
      @566    PAY1                     N2PF.                                    
      @568    PAY1_X                   $CHAR2.                                  
      @570    PL_CBSA                  N3PF.                                    
      @573    PL_MSA1993               N3PF.                                    
      @576    PL_NCHS2006              N2PF.                                    
      @578    PL_RUCA10_2005           N2PF.                                    
      @580    PL_RUCA2005              N4P1F.                                   
      @584    PL_RUCA4_2005            N2PF.                                    
      @586    PL_RUCC2003              N2PF.                                    
      @588    PL_UIC2003               N2PF.                                    
      @590    PL_UR_CAT4               N2PF.                                    
      @592    PR1                      $CHAR4.                                  
      @596    PR2                      $CHAR4.                                  
      @600    PR3                      $CHAR4.                                  
      @604    PR4                      $CHAR4.                                  
      @608    PR5                      $CHAR4.                                  
      @612    PR6                      $CHAR4.                                  
      @616    PR7                      $CHAR4.                                  
      @620    PR8                      $CHAR4.                                  
      @624    PR9                      $CHAR4.                                  
      @628    PR10                     $CHAR4.                                  
      @632    PR11                     $CHAR4.                                  
      @636    PR12                     $CHAR4.                                  
      @640    PR13                     $CHAR4.                                  
      @644    PR14                     $CHAR4.                                  
      @648    PR15                     $CHAR4.                                  
      @652    PR16                     $CHAR4.                                  
      @656    PR17                     $CHAR4.                                  
      @660    PR18                     $CHAR4.                                  
      @664    PR19                     $CHAR4.                                  
      @668    PR20                     $CHAR4.                                  
      @672    PR21                     $CHAR4.                                  
      @676    PR22                     $CHAR4.                                  
      @680    PR23                     $CHAR4.                                  
      @684    PR24                     $CHAR4.                                  
      @688    PR25                     $CHAR4.                                  
      @692    PR26                     $CHAR4.                                  
      @696    PR27                     $CHAR4.                                  
      @700    PR28                     $CHAR4.                                  
      @704    PR29                     $CHAR4.                                  
      @708    PR30                     $CHAR4.                                  
      @712    PRCCS1                   N3PF.                                    
      @715    PRCCS2                   N3PF.                                    
      @718    PRCCS3                   N3PF.                                    
      @721    PRCCS4                   N3PF.                                    
      @724    PRCCS5                   N3PF.                                    
      @727    PRCCS6                   N3PF.                                    
      @730    PRCCS7                   N3PF.                                    
      @733    PRCCS8                   N3PF.                                    
      @736    PRCCS9                   N3PF.                                    
      @739    PRCCS10                  N3PF.                                    
      @742    PRCCS11                  N3PF.                                    
      @745    PRCCS12                  N3PF.                                    
      @748    PRCCS13                  N3PF.                                    
      @751    PRCCS14                  N3PF.                                    
      @754    PRCCS15                  N3PF.                                    
      @757    PRCCS16                  N3PF.                                    
      @760    PRCCS17                  N3PF.                                    
      @763    PRCCS18                  N3PF.                                    
      @766    PRCCS19                  N3PF.                                    
      @769    PRCCS20                  N3PF.                                    
      @772    PRCCS21                  N3PF.                                    
      @775    PRCCS22                  N3PF.                                    
      @778    PRCCS23                  N3PF.                                    
      @781    PRCCS24                  N3PF.                                    
      @784    PRCCS25                  N3PF.                                    
      @787    PRCCS26                  N3PF.                                    
      @790    PRCCS27                  N3PF.                                    
      @793    PRCCS28                  N3PF.                                    
      @796    PRCCS29                  N3PF.                                    
      @799    PRCCS30                  N3PF.                                    
      @802    PRDAY1                   N5PF.                                    
      @807    PRDAY2                   N5PF.                                    
      @812    PRDAY3                   N5PF.                                    
      @817    PRDAY4                   N5PF.                                    
      @822    PRDAY5                   N5PF.                                    
      @827    PRDAY6                   N5PF.                                    
      @832    PRDAY7                   N5PF.                                    
      @837    PRDAY8                   N5PF.                                    
      @842    PRDAY9                   N5PF.                                    
      @847    PRDAY10                  N5PF.                                    
      @852    PRDAY11                  N5PF.                                    
      @857    PRDAY12                  N5PF.                                    
      @862    PRDAY13                  N5PF.                                    
      @867    PRDAY14                  N5PF.                                    
      @872    PRDAY15                  N5PF.                                    
      @877    PRDAY16                  N5PF.                                    
      @882    PRDAY17                  N5PF.                                    
      @887    PRDAY18                  N5PF.                                    
      @892    PRDAY19                  N5PF.                                    
      @897    PRDAY20                  N5PF.                                    
      @902    PRDAY21                  N5PF.                                    
      @907    PRDAY22                  N5PF.                                    
      @912    PRDAY23                  N5PF.                                    
      @917    PRDAY24                  N5PF.                                    
      @922    PRDAY25                  N5PF.                                    
      @927    PRDAY26                  N5PF.                                    
      @932    PRDAY27                  N5PF.                                    
      @937    PRDAY28                  N5PF.                                    
      @942    PRDAY29                  N5PF.                                    
      @947    PRDAY30                  N5PF.                                    
      @952    PROCTYPE                 N3PF.                                    
      @955    PSTATE                   $CHAR2.                                  
      @957    PSTCO                    N5PF.                                    
      @962    PSTCO2                   N5PF.                                    
      @967    PointOfOriginUB04        $CHAR1.                                  
      @968    PointOfOrigin_X          $CHAR1.                                  
      @969    RACE                     N2PF.                                    
      @971    RACE_X                   $CHAR1.                                  
      @972    TOTCHG                   N10PF.                                   
      @982    TOTCHG_X                 N15P2F.                                  
      @997    TRAN_IN                  N2PF.                                    
      @999    TRAN_OUT                 N2PF.                                    
      @1001   YEAR                     N4PF.                                    
      @1005   ZIP3                     $CHAR3.                                  
      @1008   ZIPINC_QRTL              N3PF.                                    
      @1011   ZIP                      $CHAR5.                                  
      @1016   AYEAR                    N4PF.                                    
      @1020   DMONTH                   N2PF.                                    
      @1022   BMONTH                   N2PF.                                    
      @1024   BYEAR                    N4PF.                                    
      @1028   PRMONTH1                 N2PF.                                    
      @1030   PRMONTH2                 N2PF.                                    
      @1032   PRMONTH3                 N2PF.                                    
      @1034   PRMONTH4                 N2PF.                                    
      @1036   PRMONTH5                 N2PF.                                    
      @1038   PRMONTH6                 N2PF.                                    
      @1040   PRMONTH7                 N2PF.                                    
      @1042   PRMONTH8                 N2PF.                                    
      @1044   PRMONTH9                 N2PF.                                    
      @1046   PRMONTH10                N2PF.                                    
      @1048   PRMONTH11                N2PF.                                    
      @1050   PRMONTH12                N2PF.                                    
      @1052   PRMONTH13                N2PF.                                    
      @1054   PRMONTH14                N2PF.                                    
      @1056   PRMONTH15                N2PF.                                    
      @1058   PRMONTH16                N2PF.                                    
      @1060   PRMONTH17                N2PF.                                    
      @1062   PRMONTH18                N2PF.                                    
      @1064   PRMONTH19                N2PF.                                    
      @1066   PRMONTH20                N2PF.                                    
      @1068   PRMONTH21                N2PF.                                    
      @1070   PRMONTH22                N2PF.                                    
      @1072   PRMONTH23                N2PF.                                    
      @1074   PRMONTH24                N2PF.                                    
      @1076   PRMONTH25                N2PF.                                    
      @1078   PRMONTH26                N2PF.                                    
      @1080   PRMONTH27                N2PF.                                    
      @1082   PRMONTH28                N2PF.                                    
      @1084   PRMONTH29                N2PF.                                    
      @1086   PRMONTH30                N2PF.                                    
      @1088   PRYEAR1                  N4PF.                                    
      @1092   PRYEAR2                  N4PF.                                    
      @1096   PRYEAR3                  N4PF.                                    
      @1100   PRYEAR4                  N4PF.                                    
      @1104   PRYEAR5                  N4PF.                                    
      @1108   PRYEAR6                  N4PF.                                    
      @1112   PRYEAR7                  N4PF.                                    
      @1116   PRYEAR8                  N4PF.                                    
      @1120   PRYEAR9                  N4PF.                                    
      @1124   PRYEAR10                 N4PF.                                    
      @1128   PRYEAR11                 N4PF.                                    
      @1132   PRYEAR12                 N4PF.                                    
      @1136   PRYEAR13                 N4PF.                                    
      @1140   PRYEAR14                 N4PF.                                    
      @1144   PRYEAR15                 N4PF.                                    
      @1148   PRYEAR16                 N4PF.                                    
      @1152   PRYEAR17                 N4PF.                                    
      @1156   PRYEAR18                 N4PF.                                    
      @1160   PRYEAR19                 N4PF.                                    
      @1164   PRYEAR20                 N4PF.                                    
      @1168   PRYEAR21                 N4PF.                                    
      @1172   PRYEAR22                 N4PF.                                    
      @1176   PRYEAR23                 N4PF.                                    
      @1180   PRYEAR24                 N4PF.                                    
      @1184   PRYEAR25                 N4PF.                                    
      @1188   PRYEAR26                 N4PF.                                    
      @1192   PRYEAR27                 N4PF.                                    
      @1196   PRYEAR28                 N4PF.                                    
      @1200   PRYEAR29                 N4PF.                                    
      @1204   PRYEAR30                 N4PF.                                    
      ;                                                                         
                                                                                
                                                                                
RUN;
