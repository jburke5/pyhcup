/*******************************************************************            
*   CA_SID_2005_CORE.SAS:                                                       
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
DATA CA_SIDC_2005_CORE;                                                         
INFILE 'CA_SID_2005_CORE.ASC' LRECL = 880;                                      
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  KEY                        LENGTH=8                 FORMAT=Z14.               
  LABEL="HCUP record identifier"                                                
                                                                                
  AGE                        LENGTH=3                                           
  LABEL="Age in years at admission"                                             
                                                                                
  AGEDAY                     LENGTH=3                                           
  LABEL="Age in days (when age < 1 year)"                                       
                                                                                
  AGEMONTH                   LENGTH=3                                           
  LABEL="Age in months (when age < 11 years)"                                   
                                                                                
  AMONTH                     LENGTH=3                                           
  LABEL="Admission month"                                                       
                                                                                
  ASCHED                     LENGTH=3                                           
  LABEL="Admission scheduled vs. unscheduled"                                   
                                                                                
  ASOURCE                    LENGTH=3                                           
  LABEL="Admission source (uniform)"                                            
                                                                                
  ASOURCE_X                  LENGTH=$3                                          
  LABEL="Admission source (as received from source)"                            
                                                                                
  AWEEKEND                   LENGTH=3                                           
  LABEL="Admission day is a weekend"                                            
                                                                                
  DIED                       LENGTH=3                                           
  LABEL="Died during hospitalization"                                           
                                                                                
  DISP_X                     LENGTH=$2                                          
  LABEL="Disposition of patient (as received from source)"                      
                                                                                
  DISPUNIFORM                LENGTH=3                                           
  LABEL="Disposition of patient (uniform)"                                      
                                                                                
  DNR                        LENGTH=3                                           
  LABEL="Do not resuscitate indicator"                                          
                                                                                
  DQTR                       LENGTH=3                                           
  LABEL="Discharge quarter"                                                     
                                                                                
  DRG                        LENGTH=3                                           
  LABEL="DRG in effect on discharge date"                                       
                                                                                
  DRG18                      LENGTH=3                                           
  LABEL="DRG, version 18"                                                       
                                                                                
  DRGVER                     LENGTH=3                                           
  LABEL="DRG grouper version used on discharge date"                            
                                                                                
  DSHOSPID                   LENGTH=$13                                         
  LABEL="Data source hospital identifier"                                       
                                                                                
  DX1                        LENGTH=$5                                          
  LABEL="Principal diagnosis"                                                   
                                                                                
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
                                                                                
  DXATADMIT1                 LENGTH=3                                           
  LABEL="Principal diagnosis present at admission"                              
                                                                                
  DXATADMIT2                 LENGTH=3                                           
  LABEL="Diagnosis 2 present at admission"                                      
                                                                                
  DXATADMIT3                 LENGTH=3                                           
  LABEL="Diagnosis 3 present at admission"                                      
                                                                                
  DXATADMIT4                 LENGTH=3                                           
  LABEL="Diagnosis 4 present at admission"                                      
                                                                                
  DXATADMIT5                 LENGTH=3                                           
  LABEL="Diagnosis 5 present at admission"                                      
                                                                                
  DXATADMIT6                 LENGTH=3                                           
  LABEL="Diagnosis 6 present at admission"                                      
                                                                                
  DXATADMIT7                 LENGTH=3                                           
  LABEL="Diagnosis 7 present at admission"                                      
                                                                                
  DXATADMIT8                 LENGTH=3                                           
  LABEL="Diagnosis 8 present at admission"                                      
                                                                                
  DXATADMIT9                 LENGTH=3                                           
  LABEL="Diagnosis 9 present at admission"                                      
                                                                                
  DXATADMIT10                LENGTH=3                                           
  LABEL="Diagnosis 10 present at admission"                                     
                                                                                
  DXATADMIT11                LENGTH=3                                           
  LABEL="Diagnosis 11 present at admission"                                     
                                                                                
  DXATADMIT12                LENGTH=3                                           
  LABEL="Diagnosis 12 present at admission"                                     
                                                                                
  DXATADMIT13                LENGTH=3                                           
  LABEL="Diagnosis 13 present at admission"                                     
                                                                                
  DXATADMIT14                LENGTH=3                                           
  LABEL="Diagnosis 14 present at admission"                                     
                                                                                
  DXATADMIT15                LENGTH=3                                           
  LABEL="Diagnosis 15 present at admission"                                     
                                                                                
  DXATADMIT16                LENGTH=3                                           
  LABEL="Diagnosis 16 present at admission"                                     
                                                                                
  DXATADMIT17                LENGTH=3                                           
  LABEL="Diagnosis 17 present at admission"                                     
                                                                                
  DXATADMIT18                LENGTH=3                                           
  LABEL="Diagnosis 18 present at admission"                                     
                                                                                
  DXATADMIT19                LENGTH=3                                           
  LABEL="Diagnosis 19 present at admission"                                     
                                                                                
  DXATADMIT20                LENGTH=3                                           
  LABEL="Diagnosis 20 present at admission"                                     
                                                                                
  DXATADMIT21                LENGTH=3                                           
  LABEL="Diagnosis 21 present at admission"                                     
                                                                                
  DXATADMIT22                LENGTH=3                                           
  LABEL="Diagnosis 22 present at admission"                                     
                                                                                
  DXATADMIT23                LENGTH=3                                           
  LABEL="Diagnosis 23 present at admission"                                     
                                                                                
  DXATADMIT24                LENGTH=3                                           
  LABEL="Diagnosis 24 present at admission"                                     
                                                                                
  DXATADMIT25                LENGTH=3                                           
  LABEL="Diagnosis 25 present at admission"                                     
                                                                                
  DXCCS1                     LENGTH=4                                           
  LABEL="CCS: principal diagnosis"                                              
                                                                                
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
                                                                                
  FEMALE                     LENGTH=3                                           
  LABEL="Indicator of sex"                                                      
                                                                                
  HCUP_ED                    LENGTH=3                                           
  LABEL="HCUP Emergency Department service indicator"                           
                                                                                
  HCUP_OS                    LENGTH=3                                           
  LABEL="HCUP Observation Stay service indicator"                               
                                                                                
  HISPANIC_X                 LENGTH=$1                                          
  LABEL="Hispanic ethnicity (as received from source)"                          
                                                                                
  HOSPST                     LENGTH=$2                                          
  LABEL="Hospital state postal code"                                            
                                                                                
  LEVELCARE                  LENGTH=$1                                          
  LABEL="Level of patient care (as received from source)"                       
                                                                                
  LOS                        LENGTH=4                                           
  LABEL="Length of stay (cleaned)"                                              
                                                                                
  LOS_X                      LENGTH=4                                           
  LABEL="Length of stay (as received from source)"                              
                                                                                
  MEDINCSTQ                  LENGTH=3                                           
  LABEL="Median household income state quartile for patient ZIP Code"           
                                                                                
  MDC                        LENGTH=3                                           
  LABEL="MDC in effect on discharge date"                                       
                                                                                
  MDC18                      LENGTH=3                                           
  LABEL="MDC, version 18"                                                       
                                                                                
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
                                                                                
  PAY1_X                     LENGTH=$3                                          
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PAYER1_X                   LENGTH=$4                                          
  LABEL="Primary expected payer plan identifier (as received from source)"      
                                                                                
  PL_CBSA                    LENGTH=3                                           
  LABEL="Patient location: Core Based Statistical Area (CBSA)"                  
                                                                                
  PL_MSA1993                 LENGTH=3                                           
  LABEL="Patient location: Metropolitan Statistical Area (MSA), 1993"           
                                                                                
  PL_NHCS2006                LENGTH=3                                           
  LABEL="Patient Location: NCHS Urban-Rural Code (V2006)"                       
                                                                                
  PL_RUCA4_2005              LENGTH=3                                           
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes, four levels"
                                                                                
  PL_RUCC2003                LENGTH=3                                           
  LABEL="Patient location: Rural-Urban Continuum Codes(RUCC), 2003"             
                                                                                
  PL_UIC2003                 LENGTH=3                                           
  LABEL="Patient location: Urban Influence Codes, 2003"                         
                                                                                
  PL_UR_CAT4                 LENGTH=3                                           
  LABEL="Patient Location: Urban-Rural 4 Categories"                            
                                                                                
  PL_UR_CAT5                 LENGTH=3                                           
  LABEL="Patient Location: Urban-Rural 5 Categories"                            
                                                                                
  PNUM_R                     LENGTH=5                                           
  LABEL="Person number (re-identified)"                                         
                                                                                
  PR1                        LENGTH=$4                                          
  LABEL="Principal procedure"                                                   
                                                                                
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
                                                                                
  PRCCS1                     LENGTH=3                                           
  LABEL="CCS: principal procedure"                                              
                                                                                
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
                                                                                
  PSTATE                     LENGTH=$2                                          
  LABEL="Patient State postal code"                                             
                                                                                
  RACE                       LENGTH=3                                           
  LABEL="Race (uniform)"                                                        
                                                                                
  RACE_X                     LENGTH=$1                                          
  LABEL="Race (as received from source)"                                        
                                                                                
  TOTCHG                     LENGTH=6                                           
  LABEL="Total charges (cleaned)"                                               
                                                                                
  TOTCHG_X                   LENGTH=7                                           
  LABEL="Total charges (as received from source)"                               
                                                                                
  YEAR                       LENGTH=3                                           
  LABEL="Calendar year"                                                         
                                                                                
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
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      KEY                      14.                                      
      @15     AGE                      N3PF.                                    
      @18     AGEDAY                   N3PF.                                    
      @21     AGEMONTH                 N3PF.                                    
      @24     AMONTH                   N2PF.                                    
      @26     ASCHED                   N2PF.                                    
      @28     ASOURCE                  N2PF.                                    
      @30     ASOURCE_X                $CHAR3.                                  
      @33     AWEEKEND                 N2PF.                                    
      @35     DIED                     N2PF.                                    
      @37     DISP_X                   $CHAR2.                                  
      @39     DISPUNIFORM              N2PF.                                    
      @41     DNR                      N2PF.                                    
      @43     DQTR                     N2PF.                                    
      @45     DRG                      N3PF.                                    
      @48     DRG18                    N3PF.                                    
      @51     DRGVER                   N2PF.                                    
      @53     DSHOSPID                 $CHAR13.                                 
      @66     DX1                      $CHAR5.                                  
      @71     DX2                      $CHAR5.                                  
      @76     DX3                      $CHAR5.                                  
      @81     DX4                      $CHAR5.                                  
      @86     DX5                      $CHAR5.                                  
      @91     DX6                      $CHAR5.                                  
      @96     DX7                      $CHAR5.                                  
      @101    DX8                      $CHAR5.                                  
      @106    DX9                      $CHAR5.                                  
      @111    DX10                     $CHAR5.                                  
      @116    DX11                     $CHAR5.                                  
      @121    DX12                     $CHAR5.                                  
      @126    DX13                     $CHAR5.                                  
      @131    DX14                     $CHAR5.                                  
      @136    DX15                     $CHAR5.                                  
      @141    DX16                     $CHAR5.                                  
      @146    DX17                     $CHAR5.                                  
      @151    DX18                     $CHAR5.                                  
      @156    DX19                     $CHAR5.                                  
      @161    DX20                     $CHAR5.                                  
      @166    DX21                     $CHAR5.                                  
      @171    DX22                     $CHAR5.                                  
      @176    DX23                     $CHAR5.                                  
      @181    DX24                     $CHAR5.                                  
      @186    DX25                     $CHAR5.                                  
      @191    DXATADMIT1               N2PF.                                    
      @193    DXATADMIT2               N2PF.                                    
      @195    DXATADMIT3               N2PF.                                    
      @197    DXATADMIT4               N2PF.                                    
      @199    DXATADMIT5               N2PF.                                    
      @201    DXATADMIT6               N2PF.                                    
      @203    DXATADMIT7               N2PF.                                    
      @205    DXATADMIT8               N2PF.                                    
      @207    DXATADMIT9               N2PF.                                    
      @209    DXATADMIT10              N2PF.                                    
      @211    DXATADMIT11              N2PF.                                    
      @213    DXATADMIT12              N2PF.                                    
      @215    DXATADMIT13              N2PF.                                    
      @217    DXATADMIT14              N2PF.                                    
      @219    DXATADMIT15              N2PF.                                    
      @221    DXATADMIT16              N2PF.                                    
      @223    DXATADMIT17              N2PF.                                    
      @225    DXATADMIT18              N2PF.                                    
      @227    DXATADMIT19              N2PF.                                    
      @229    DXATADMIT20              N2PF.                                    
      @231    DXATADMIT21              N2PF.                                    
      @233    DXATADMIT22              N2PF.                                    
      @235    DXATADMIT23              N2PF.                                    
      @237    DXATADMIT24              N2PF.                                    
      @239    DXATADMIT25              N2PF.                                    
      @241    DXCCS1                   N4PF.                                    
      @245    DXCCS2                   N4PF.                                    
      @249    DXCCS3                   N4PF.                                    
      @253    DXCCS4                   N4PF.                                    
      @257    DXCCS5                   N4PF.                                    
      @261    DXCCS6                   N4PF.                                    
      @265    DXCCS7                   N4PF.                                    
      @269    DXCCS8                   N4PF.                                    
      @273    DXCCS9                   N4PF.                                    
      @277    DXCCS10                  N4PF.                                    
      @281    DXCCS11                  N4PF.                                    
      @285    DXCCS12                  N4PF.                                    
      @289    DXCCS13                  N4PF.                                    
      @293    DXCCS14                  N4PF.                                    
      @297    DXCCS15                  N4PF.                                    
      @301    DXCCS16                  N4PF.                                    
      @305    DXCCS17                  N4PF.                                    
      @309    DXCCS18                  N4PF.                                    
      @313    DXCCS19                  N4PF.                                    
      @317    DXCCS20                  N4PF.                                    
      @321    DXCCS21                  N4PF.                                    
      @325    DXCCS22                  N4PF.                                    
      @329    DXCCS23                  N4PF.                                    
      @333    DXCCS24                  N4PF.                                    
      @337    DXCCS25                  N4PF.                                    
      @341    ECODE1                   $CHAR5.                                  
      @346    ECODE2                   $CHAR5.                                  
      @351    ECODE3                   $CHAR5.                                  
      @356    ECODE4                   $CHAR5.                                  
      @361    ECODE5                   $CHAR5.                                  
      @366    E_CCS1                   N4PF.                                    
      @370    E_CCS2                   N4PF.                                    
      @374    E_CCS3                   N4PF.                                    
      @378    E_CCS4                   N4PF.                                    
      @382    E_CCS5                   N4PF.                                    
      @386    FEMALE                   N2PF.                                    
      @388    HCUP_ED                  N2PF.                                    
      @390    HCUP_OS                  N2PF.                                    
      @392    HISPANIC_X               $CHAR1.                                  
      @393    HOSPST                   $CHAR2.                                  
      @395    LEVELCARE                $CHAR1.                                  
      @396    LOS                      N5PF.                                    
      @401    LOS_X                    N6PF.                                    
      @407    MEDINCSTQ                N2PF.                                    
      @409    MDC                      N2PF.                                    
      @411    MDC18                    N2PF.                                    
      @413    NDX                      N2PF.                                    
      @415    NECODE                   N2PF.                                    
      @417    NEOMAT                   N2PF.                                    
      @419    NPR                      N2PF.                                    
      @421    PAY1                     N2PF.                                    
      @423    PAY1_X                   $CHAR3.                                  
      @426    PAYER1_X                 $CHAR4.                                  
      @430    PL_CBSA                  N3PF.                                    
      @433    PL_MSA1993               N3PF.                                    
      @436    PL_NHCS2006              N2PF.                                    
      @438    PL_RUCA4_2005            N2PF.                                    
      @440    PL_RUCC2003              N2PF.                                    
      @442    PL_UIC2003               N2PF.                                    
      @444    PL_UR_CAT4               N2PF.                                    
      @446    PL_UR_CAT5               N2PF.                                    
      @448    PNUM_R                   N9PF.                                    
      @457    PR1                      $CHAR4.                                  
      @461    PR2                      $CHAR4.                                  
      @465    PR3                      $CHAR4.                                  
      @469    PR4                      $CHAR4.                                  
      @473    PR5                      $CHAR4.                                  
      @477    PR6                      $CHAR4.                                  
      @481    PR7                      $CHAR4.                                  
      @485    PR8                      $CHAR4.                                  
      @489    PR9                      $CHAR4.                                  
      @493    PR10                     $CHAR4.                                  
      @497    PR11                     $CHAR4.                                  
      @501    PR12                     $CHAR4.                                  
      @505    PR13                     $CHAR4.                                  
      @509    PR14                     $CHAR4.                                  
      @513    PR15                     $CHAR4.                                  
      @517    PR16                     $CHAR4.                                  
      @521    PR17                     $CHAR4.                                  
      @525    PR18                     $CHAR4.                                  
      @529    PR19                     $CHAR4.                                  
      @533    PR20                     $CHAR4.                                  
      @537    PR21                     $CHAR4.                                  
      @541    PRCCS1                   N3PF.                                    
      @544    PRCCS2                   N3PF.                                    
      @547    PRCCS3                   N3PF.                                    
      @550    PRCCS4                   N3PF.                                    
      @553    PRCCS5                   N3PF.                                    
      @556    PRCCS6                   N3PF.                                    
      @559    PRCCS7                   N3PF.                                    
      @562    PRCCS8                   N3PF.                                    
      @565    PRCCS9                   N3PF.                                    
      @568    PRCCS10                  N3PF.                                    
      @571    PRCCS11                  N3PF.                                    
      @574    PRCCS12                  N3PF.                                    
      @577    PRCCS13                  N3PF.                                    
      @580    PRCCS14                  N3PF.                                    
      @583    PRCCS15                  N3PF.                                    
      @586    PRCCS16                  N3PF.                                    
      @589    PRCCS17                  N3PF.                                    
      @592    PRCCS18                  N3PF.                                    
      @595    PRCCS19                  N3PF.                                    
      @598    PRCCS20                  N3PF.                                    
      @601    PRCCS21                  N3PF.                                    
      @604    PRDAY1                   N5PF.                                    
      @609    PRDAY2                   N5PF.                                    
      @614    PRDAY3                   N5PF.                                    
      @619    PRDAY4                   N5PF.                                    
      @624    PRDAY5                   N5PF.                                    
      @629    PRDAY6                   N5PF.                                    
      @634    PRDAY7                   N5PF.                                    
      @639    PRDAY8                   N5PF.                                    
      @644    PRDAY9                   N5PF.                                    
      @649    PRDAY10                  N5PF.                                    
      @654    PRDAY11                  N5PF.                                    
      @659    PRDAY12                  N5PF.                                    
      @664    PRDAY13                  N5PF.                                    
      @669    PRDAY14                  N5PF.                                    
      @674    PRDAY15                  N5PF.                                    
      @679    PRDAY16                  N5PF.                                    
      @684    PRDAY17                  N5PF.                                    
      @689    PRDAY18                  N5PF.                                    
      @694    PRDAY19                  N5PF.                                    
      @699    PRDAY20                  N5PF.                                    
      @704    PRDAY21                  N5PF.                                    
      @709    PSTATE                   $CHAR2.                                  
      @711    RACE                     N2PF.                                    
      @713    RACE_X                   $CHAR1.                                  
      @714    TOTCHG                   N10PF.                                   
      @724    TOTCHG_X                 N15P2F.                                  
      @739    YEAR                     N4PF.                                    
      @743    AYEAR                    N4PF.                                    
      @747    DMONTH                   N2PF.                                    
      @749    BMONTH                   N2PF.                                    
      @751    BYEAR                    N4PF.                                    
      @755    PRMONTH1                 N2PF.                                    
      @757    PRMONTH2                 N2PF.                                    
      @759    PRMONTH3                 N2PF.                                    
      @761    PRMONTH4                 N2PF.                                    
      @763    PRMONTH5                 N2PF.                                    
      @765    PRMONTH6                 N2PF.                                    
      @767    PRMONTH7                 N2PF.                                    
      @769    PRMONTH8                 N2PF.                                    
      @771    PRMONTH9                 N2PF.                                    
      @773    PRMONTH10                N2PF.                                    
      @775    PRMONTH11                N2PF.                                    
      @777    PRMONTH12                N2PF.                                    
      @779    PRMONTH13                N2PF.                                    
      @781    PRMONTH14                N2PF.                                    
      @783    PRMONTH15                N2PF.                                    
      @785    PRMONTH16                N2PF.                                    
      @787    PRMONTH17                N2PF.                                    
      @789    PRMONTH18                N2PF.                                    
      @791    PRMONTH19                N2PF.                                    
      @793    PRMONTH20                N2PF.                                    
      @795    PRMONTH21                N2PF.                                    
      @797    PRYEAR1                  N4PF.                                    
      @801    PRYEAR2                  N4PF.                                    
      @805    PRYEAR3                  N4PF.                                    
      @809    PRYEAR4                  N4PF.                                    
      @813    PRYEAR5                  N4PF.                                    
      @817    PRYEAR6                  N4PF.                                    
      @821    PRYEAR7                  N4PF.                                    
      @825    PRYEAR8                  N4PF.                                    
      @829    PRYEAR9                  N4PF.                                    
      @833    PRYEAR10                 N4PF.                                    
      @837    PRYEAR11                 N4PF.                                    
      @841    PRYEAR12                 N4PF.                                    
      @845    PRYEAR13                 N4PF.                                    
      @849    PRYEAR14                 N4PF.                                    
      @853    PRYEAR15                 N4PF.                                    
      @857    PRYEAR16                 N4PF.                                    
      @861    PRYEAR17                 N4PF.                                    
      @865    PRYEAR18                 N4PF.                                    
      @869    PRYEAR19                 N4PF.                                    
      @873    PRYEAR20                 N4PF.                                    
      @877    PRYEAR21                 N4PF.                                    
      ;                                                                         
                                                                                
                                                                                
RUN;
