/*******************************************************************            
*   MD_SEDD_2004_CORE.SAS:                                                      
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
DATA MD_SEDDC_2004_CORE;                                                        
INFILE 'MD_SEDD_2004_CORE.ASC' LRECL = 1263;                                    
                                                                                
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
                                                                                
  AWEEKEND                   LENGTH=3                                           
  LABEL="Admission day is a weekend"                                            
                                                                                
  CPT1                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 1"                                            
                                                                                
  CPT2                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 2"                                            
                                                                                
  CPT3                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 3"                                            
                                                                                
  CPT4                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 4"                                            
                                                                                
  CPT5                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 5"                                            
                                                                                
  CPT6                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 6"                                            
                                                                                
  CPT7                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 7"                                            
                                                                                
  CPT8                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 8"                                            
                                                                                
  CPT9                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 9"                                            
                                                                                
  CPT10                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 10"                                           
                                                                                
  CPT11                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 11"                                           
                                                                                
  CPT12                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 12"                                           
                                                                                
  CPT13                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 13"                                           
                                                                                
  CPT14                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 14"                                           
                                                                                
  CPT15                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 15"                                           
                                                                                
  CPT16                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 16"                                           
                                                                                
  CPT17                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 17"                                           
                                                                                
  CPT18                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 18"                                           
                                                                                
  CPT19                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 19"                                           
                                                                                
  CPT20                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 20"                                           
                                                                                
  CPT21                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 21"                                           
                                                                                
  CPT22                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 22"                                           
                                                                                
  CPT23                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 23"                                           
                                                                                
  CPT24                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 24"                                           
                                                                                
  CPT25                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 25"                                           
                                                                                
  CPT26                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 26"                                           
                                                                                
  CPT27                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 27"                                           
                                                                                
  CPT28                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 28"                                           
                                                                                
  CPT29                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 29"                                           
                                                                                
  CPT30                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 30"                                           
                                                                                
  CPT31                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 31"                                           
                                                                                
  CPT32                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 32"                                           
                                                                                
  CPT33                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 33"                                           
                                                                                
  CPT34                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 34"                                           
                                                                                
  CPT35                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 35"                                           
                                                                                
  CPT36                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 36"                                           
                                                                                
  CPT37                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 37"                                           
                                                                                
  CPT38                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 38"                                           
                                                                                
  CPT39                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 39"                                           
                                                                                
  CPT40                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 40"                                           
                                                                                
  CPT41                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 41"                                           
                                                                                
  CPT42                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 42"                                           
                                                                                
  CPT43                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 43"                                           
                                                                                
  CPT44                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 44"                                           
                                                                                
  CPT45                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 45"                                           
                                                                                
  CPT46                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 46"                                           
                                                                                
  CPT47                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 47"                                           
                                                                                
  CPT48                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 48"                                           
                                                                                
  CPT49                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 49"                                           
                                                                                
  CPT50                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 50"                                           
                                                                                
  CPT51                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 51"                                           
                                                                                
  CPT52                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 52"                                           
                                                                                
  CPT53                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 53"                                           
                                                                                
  CPT54                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 54"                                           
                                                                                
  CPT55                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 55"                                           
                                                                                
  CPT56                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 56"                                           
                                                                                
  CPT57                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 57"                                           
                                                                                
  CPT58                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 58"                                           
                                                                                
  CPT59                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 59"                                           
                                                                                
  CPT60                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 60"                                           
                                                                                
  CPT61                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 61"                                           
                                                                                
  CPT62                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 62"                                           
                                                                                
  CPT63                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 63"                                           
                                                                                
  CPT64                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 64"                                           
                                                                                
  CPT65                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 65"                                           
                                                                                
  CPT66                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 66"                                           
                                                                                
  CPT67                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 67"                                           
                                                                                
  CPT68                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 68"                                           
                                                                                
  CPT69                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 69"                                           
                                                                                
  CPT70                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 70"                                           
                                                                                
  CPT71                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 71"                                           
                                                                                
  CPT72                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 72"                                           
                                                                                
  CPT73                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 73"                                           
                                                                                
  CPT74                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 74"                                           
                                                                                
  CPT75                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 75"                                           
                                                                                
  CPT76                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 76"                                           
                                                                                
  CPT77                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 77"                                           
                                                                                
  CPT78                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 78"                                           
                                                                                
  CPT79                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 79"                                           
                                                                                
  CPT80                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 80"                                           
                                                                                
  CPT81                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 81"                                           
                                                                                
  CPT82                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 82"                                           
                                                                                
  CPT83                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 83"                                           
                                                                                
  CPT84                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 84"                                           
                                                                                
  CPT85                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 85"                                           
                                                                                
  CPT86                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 86"                                           
                                                                                
  CPT87                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 87"                                           
                                                                                
  CPT88                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 88"                                           
                                                                                
  CPT89                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 89"                                           
                                                                                
  CPT90                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 90"                                           
                                                                                
  CPT91                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 91"                                           
                                                                                
  CPT92                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 92"                                           
                                                                                
  CPT93                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 93"                                           
                                                                                
  CPT94                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 94"                                           
                                                                                
  CPT95                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 95"                                           
                                                                                
  CPT96                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 96"                                           
                                                                                
  CPT97                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 97"                                           
                                                                                
  CPT98                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 98"                                           
                                                                                
  CPT99                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 99"                                           
                                                                                
  CPT100                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 100"                                          
                                                                                
  DQTR                       LENGTH=3                                           
  LABEL="Discharge quarter"                                                     
                                                                                
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
                                                                                
  DX_Visit_Reason            LENGTH=$5                                          
  LABEL="Reason for visit diagnosis"                                            
                                                                                
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
                                                                                
  FEMALE                     LENGTH=3                                           
  LABEL="Indicator of sex"                                                      
                                                                                
  HCUP_AS                    LENGTH=3                                           
  LABEL="HCUP Ambulatory Surgery service indicator"                             
                                                                                
  HCUP_ED                    LENGTH=3                                           
  LABEL="HCUP Emergency Department service indicator"                           
                                                                                
  HCUP_OS                    LENGTH=3                                           
  LABEL="HCUP Observation Stay service indicator"                               
                                                                                
  HOSPST                     LENGTH=$2                                          
  LABEL="Hospital state postal code"                                            
                                                                                
  LOS                        LENGTH=4                                           
  LABEL="Length of stay (cleaned)"                                              
                                                                                
  LOS_X                      LENGTH=4                                           
  LABEL="Length of stay (as received from source)"                              
                                                                                
  MRN_R                      LENGTH=5                                           
  LABEL="Medical record number (re-identified)"                                 
                                                                                
  NCPT                       LENGTH=3                                           
  LABEL="Number of CPT/HCPCS procedures on this record"                         
                                                                                
  NDX                        LENGTH=3                                           
  LABEL="Number of diagnoses on this record"                                    
                                                                                
  NECODE                     LENGTH=3                                           
  LABEL="Number of E codes on this record"                                      
                                                                                
  NEOMAT                     LENGTH=3                                           
  LABEL="Neonatal and/or maternal DX and/or PR"                                 
                                                                                
  PAY1                       LENGTH=3                                           
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PAY2                       LENGTH=3                                           
  LABEL="Secondary expected payer (uniform)"                                    
                                                                                
  PAY1_X                     LENGTH=$2                                          
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PAY2_X                     LENGTH=$2                                          
  LABEL="Secondary expected payer (as received from source)"                    
                                                                                
  PAYER1_X                   LENGTH=$2                                          
  LABEL="Primary expected payer plan identifier (as received from source)"      
                                                                                
  PAYER2_X                   LENGTH=$2                                          
  LABEL="Secondary expected payer plan identifier (as received from source)"    
                                                                                
  PL_CBSA                    LENGTH=3                                           
  LABEL="Patient location: Core Based Statistical Area (CBSA)"                  
                                                                                
  PL_MSA1993                 LENGTH=3                                           
  LABEL="Patient location: Metropolitan Statistical Area (MSA), 1993"           
                                                                                
  PL_RUCA4                   LENGTH=3                                           
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes, four levels"
                                                                                
  PL_RUCC2003                LENGTH=3                                           
  LABEL="Patient location: Rural-Urban Continuum Codes(RUCC), 2003"             
                                                                                
  PL_UIC2003                 LENGTH=3                                           
  LABEL="Patient location: Urban Influence Codes, 2003"                         
                                                                                
  PL_UR_CAT4                 LENGTH=3                                           
  LABEL="Patient Location: Urban-Rural 4 Categories"                            
                                                                                
  PL_UR_CAT5                 LENGTH=3                                           
  LABEL="Patient Location: Urban-Rural 5 Categories"                            
                                                                                
  PSTATE                     LENGTH=$2                                          
  LABEL="Patient State postal code"                                             
                                                                                
  PSTCO                      LENGTH=4                                           
  LABEL="Patient state/county FIPS code"                                        
                                                                                
  PSTCO2                     LENGTH=4                                           
  LABEL="Patient state/county FIPS code, possibly derived from ZIP Code"        
                                                                                
  RACE                       LENGTH=3                                           
  LABEL="Race (uniform)"                                                        
                                                                                
  RACE_X                     LENGTH=$1                                          
  LABEL="Race (as received from source)"                                        
                                                                                
  STATE_AS                   LENGTH=3                                           
  LABEL="State Ambulatory Surgery service indicator"                            
                                                                                
  STATE_ED                   LENGTH=3                                           
  LABEL="State Emergency Department service indicator"                          
                                                                                
  STATE_OS                   LENGTH=3                                           
  LABEL="State Observation Stay service indicator"                              
                                                                                
  TOTCHG                     LENGTH=6                                           
  LABEL="Total charges (cleaned)"                                               
                                                                                
  TOTCHG_X                   LENGTH=7                                           
  LABEL="Total charges (as received from source)"                               
                                                                                
  YEAR                       LENGTH=3                                           
  LABEL="Calendar year"                                                         
                                                                                
  ZIP3                       LENGTH=$3                                          
  LABEL="Patient ZIP Code, first 3 digits"                                      
                                                                                
  APG1                       LENGTH=3                                           
  LABEL="Ambulatory Patient Group 1 (as received from source)"                  
                                                                                
  APG2                       LENGTH=3                                           
  LABEL="Ambulatory Patient Group 2 (as received from source)"                  
                                                                                
  APG3                       LENGTH=3                                           
  LABEL="Ambulatory Patient Group 3 (as received from source)"                  
                                                                                
  APG4                       LENGTH=3                                           
  LABEL="Ambulatory Patient Group 4 (as received from source)"                  
                                                                                
  APG5                       LENGTH=3                                           
  LABEL="Ambulatory Patient Group 5 (as received from source)"                  
                                                                                
  APG6                       LENGTH=3                                           
  LABEL="Ambulatory Patient Group 6 (as received from source)"                  
                                                                                
  APG7                       LENGTH=3                                           
  LABEL="Ambulatory Patient Group 7 (as received from source)"                  
                                                                                
  APG8                       LENGTH=3                                           
  LABEL="Ambulatory Patient Group 8 (as received from source)"                  
                                                                                
  APG9                       LENGTH=3                                           
  LABEL="Ambulatory Patient Group 9 (as received from source)"                  
                                                                                
  APG10                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 10 (as received from source)"                 
                                                                                
  APG11                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 11 (as received from source)"                 
                                                                                
  APG12                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 12 (as received from source)"                 
                                                                                
  APG13                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 13 (as received from source)"                 
                                                                                
  APG14                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 14 (as received from source)"                 
                                                                                
  APG15                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 15 (as received from source)"                 
                                                                                
  APG16                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 16 (as received from source)"                 
                                                                                
  APG17                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 17 (as received from source)"                 
                                                                                
  APG18                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 18 (as received from source)"                 
                                                                                
  APG19                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 19 (as received from source)"                 
                                                                                
  APG20                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 20 (as received from source)"                 
                                                                                
  APG21                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 21 (as received from source)"                 
                                                                                
  APG22                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 22 (as received from source)"                 
                                                                                
  APG23                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 23 (as received from source)"                 
                                                                                
  APG24                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 24 (as received from source)"                 
                                                                                
  APG25                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 25 (as received from source)"                 
                                                                                
  APG26                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 26 (as received from source)"                 
                                                                                
  APG27                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 27 (as received from source)"                 
                                                                                
  APG28                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 28 (as received from source)"                 
                                                                                
  APG29                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 29 (as received from source)"                 
                                                                                
  APG30                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 30 (as received from source)"                 
                                                                                
  APG31                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 31 (as received from source)"                 
                                                                                
  APG32                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 32 (as received from source)"                 
                                                                                
  APG33                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 33 (as received from source)"                 
                                                                                
  APG34                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 34 (as received from source)"                 
                                                                                
  APG35                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 35 (as received from source)"                 
                                                                                
  APG36                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 36 (as received from source)"                 
                                                                                
  APG37                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 37 (as received from source)"                 
                                                                                
  APG38                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 38 (as received from source)"                 
                                                                                
  APG39                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 39 (as received from source)"                 
                                                                                
  APG40                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 40 (as received from source)"                 
                                                                                
  APG41                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 41 (as received from source)"                 
                                                                                
  APG42                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 42 (as received from source)"                 
                                                                                
  APG43                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 43 (as received from source)"                 
                                                                                
  APG44                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 44 (as received from source)"                 
                                                                                
  APG45                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 45 (as received from source)"                 
                                                                                
  APG46                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 46 (as received from source)"                 
                                                                                
  APG47                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 47 (as received from source)"                 
                                                                                
  APG48                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 48 (as received from source)"                 
                                                                                
  APG49                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 49 (as received from source)"                 
                                                                                
  APG50                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 50 (as received from source)"                 
                                                                                
  APG51                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 51 (as received from source)"                 
                                                                                
  APG52                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 52 (as received from source)"                 
                                                                                
  APG53                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 53 (as received from source)"                 
                                                                                
  APG54                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 54 (as received from source)"                 
                                                                                
  APG55                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 55 (as received from source)"                 
                                                                                
  APG56                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 56 (as received from source)"                 
                                                                                
  APG57                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 57 (as received from source)"                 
                                                                                
  APG58                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 58 (as received from source)"                 
                                                                                
  APG59                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 59 (as received from source)"                 
                                                                                
  APG60                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 60 (as received from source)"                 
                                                                                
  APG61                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 61 (as received from source)"                 
                                                                                
  APG62                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 62 (as received from source)"                 
                                                                                
  APG63                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 63 (as received from source)"                 
                                                                                
  APG64                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 64 (as received from source)"                 
                                                                                
  APG65                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 65 (as received from source)"                 
                                                                                
  APG66                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 66 (as received from source)"                 
                                                                                
  APG67                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 67 (as received from source)"                 
                                                                                
  APG68                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 68 (as received from source)"                 
                                                                                
  APG69                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 69 (as received from source)"                 
                                                                                
  APG70                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 70 (as received from source)"                 
                                                                                
  APG71                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 71 (as received from source)"                 
                                                                                
  APG72                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 72 (as received from source)"                 
                                                                                
  APG73                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 73 (as received from source)"                 
                                                                                
  APG74                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 74 (as received from source)"                 
                                                                                
  APG75                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 75 (as received from source)"                 
                                                                                
  APG76                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 76 (as received from source)"                 
                                                                                
  APG77                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 77 (as received from source)"                 
                                                                                
  APG78                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 78 (as received from source)"                 
                                                                                
  APG79                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 79 (as received from source)"                 
                                                                                
  APG80                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 80 (as received from source)"                 
                                                                                
  APG81                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 81 (as received from source)"                 
                                                                                
  APG82                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 82 (as received from source)"                 
                                                                                
  APG83                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 83 (as received from source)"                 
                                                                                
  APG84                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 84 (as received from source)"                 
                                                                                
  APG85                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 85 (as received from source)"                 
                                                                                
  APG86                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 86 (as received from source)"                 
                                                                                
  APG87                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 87 (as received from source)"                 
                                                                                
  APG88                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 88 (as received from source)"                 
                                                                                
  APG89                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 89 (as received from source)"                 
                                                                                
  APG90                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 90 (as received from source)"                 
                                                                                
  APG91                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 91 (as received from source)"                 
                                                                                
  APG92                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 92 (as received from source)"                 
                                                                                
  APG93                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 93 (as received from source)"                 
                                                                                
  APG94                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 94 (as received from source)"                 
                                                                                
  APG95                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 95 (as received from source)"                 
                                                                                
  APG96                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 96 (as received from source)"                 
                                                                                
  APG97                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 97 (as received from source)"                 
                                                                                
  APG98                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 98 (as received from source)"                 
                                                                                
  APG99                      LENGTH=3                                           
  LABEL="Ambulatory Patient Group 99 (as received from source)"                 
                                                                                
  APG100                     LENGTH=3                                           
  LABEL="Ambulatory Patient Group 100 (as received from source)"                
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      KEY                      14.                                      
      @15     AGE                      N3PF.                                    
      @18     AGEDAY                   N3PF.                                    
      @21     AGEMONTH                 N3PF.                                    
      @24     AWEEKEND                 N2PF.                                    
      @26     CPT1                     $CHAR5.                                  
      @31     CPT2                     $CHAR5.                                  
      @36     CPT3                     $CHAR5.                                  
      @41     CPT4                     $CHAR5.                                  
      @46     CPT5                     $CHAR5.                                  
      @51     CPT6                     $CHAR5.                                  
      @56     CPT7                     $CHAR5.                                  
      @61     CPT8                     $CHAR5.                                  
      @66     CPT9                     $CHAR5.                                  
      @71     CPT10                    $CHAR5.                                  
      @76     CPT11                    $CHAR5.                                  
      @81     CPT12                    $CHAR5.                                  
      @86     CPT13                    $CHAR5.                                  
      @91     CPT14                    $CHAR5.                                  
      @96     CPT15                    $CHAR5.                                  
      @101    CPT16                    $CHAR5.                                  
      @106    CPT17                    $CHAR5.                                  
      @111    CPT18                    $CHAR5.                                  
      @116    CPT19                    $CHAR5.                                  
      @121    CPT20                    $CHAR5.                                  
      @126    CPT21                    $CHAR5.                                  
      @131    CPT22                    $CHAR5.                                  
      @136    CPT23                    $CHAR5.                                  
      @141    CPT24                    $CHAR5.                                  
      @146    CPT25                    $CHAR5.                                  
      @151    CPT26                    $CHAR5.                                  
      @156    CPT27                    $CHAR5.                                  
      @161    CPT28                    $CHAR5.                                  
      @166    CPT29                    $CHAR5.                                  
      @171    CPT30                    $CHAR5.                                  
      @176    CPT31                    $CHAR5.                                  
      @181    CPT32                    $CHAR5.                                  
      @186    CPT33                    $CHAR5.                                  
      @191    CPT34                    $CHAR5.                                  
      @196    CPT35                    $CHAR5.                                  
      @201    CPT36                    $CHAR5.                                  
      @206    CPT37                    $CHAR5.                                  
      @211    CPT38                    $CHAR5.                                  
      @216    CPT39                    $CHAR5.                                  
      @221    CPT40                    $CHAR5.                                  
      @226    CPT41                    $CHAR5.                                  
      @231    CPT42                    $CHAR5.                                  
      @236    CPT43                    $CHAR5.                                  
      @241    CPT44                    $CHAR5.                                  
      @246    CPT45                    $CHAR5.                                  
      @251    CPT46                    $CHAR5.                                  
      @256    CPT47                    $CHAR5.                                  
      @261    CPT48                    $CHAR5.                                  
      @266    CPT49                    $CHAR5.                                  
      @271    CPT50                    $CHAR5.                                  
      @276    CPT51                    $CHAR5.                                  
      @281    CPT52                    $CHAR5.                                  
      @286    CPT53                    $CHAR5.                                  
      @291    CPT54                    $CHAR5.                                  
      @296    CPT55                    $CHAR5.                                  
      @301    CPT56                    $CHAR5.                                  
      @306    CPT57                    $CHAR5.                                  
      @311    CPT58                    $CHAR5.                                  
      @316    CPT59                    $CHAR5.                                  
      @321    CPT60                    $CHAR5.                                  
      @326    CPT61                    $CHAR5.                                  
      @331    CPT62                    $CHAR5.                                  
      @336    CPT63                    $CHAR5.                                  
      @341    CPT64                    $CHAR5.                                  
      @346    CPT65                    $CHAR5.                                  
      @351    CPT66                    $CHAR5.                                  
      @356    CPT67                    $CHAR5.                                  
      @361    CPT68                    $CHAR5.                                  
      @366    CPT69                    $CHAR5.                                  
      @371    CPT70                    $CHAR5.                                  
      @376    CPT71                    $CHAR5.                                  
      @381    CPT72                    $CHAR5.                                  
      @386    CPT73                    $CHAR5.                                  
      @391    CPT74                    $CHAR5.                                  
      @396    CPT75                    $CHAR5.                                  
      @401    CPT76                    $CHAR5.                                  
      @406    CPT77                    $CHAR5.                                  
      @411    CPT78                    $CHAR5.                                  
      @416    CPT79                    $CHAR5.                                  
      @421    CPT80                    $CHAR5.                                  
      @426    CPT81                    $CHAR5.                                  
      @431    CPT82                    $CHAR5.                                  
      @436    CPT83                    $CHAR5.                                  
      @441    CPT84                    $CHAR5.                                  
      @446    CPT85                    $CHAR5.                                  
      @451    CPT86                    $CHAR5.                                  
      @456    CPT87                    $CHAR5.                                  
      @461    CPT88                    $CHAR5.                                  
      @466    CPT89                    $CHAR5.                                  
      @471    CPT90                    $CHAR5.                                  
      @476    CPT91                    $CHAR5.                                  
      @481    CPT92                    $CHAR5.                                  
      @486    CPT93                    $CHAR5.                                  
      @491    CPT94                    $CHAR5.                                  
      @496    CPT95                    $CHAR5.                                  
      @501    CPT96                    $CHAR5.                                  
      @506    CPT97                    $CHAR5.                                  
      @511    CPT98                    $CHAR5.                                  
      @516    CPT99                    $CHAR5.                                  
      @521    CPT100                   $CHAR5.                                  
      @526    DQTR                     N2PF.                                    
      @528    DSHOSPID                 $CHAR13.                                 
      @541    DX1                      $CHAR5.                                  
      @546    DX2                      $CHAR5.                                  
      @551    DX3                      $CHAR5.                                  
      @556    DX4                      $CHAR5.                                  
      @561    DX5                      $CHAR5.                                  
      @566    DX6                      $CHAR5.                                  
      @571    DX7                      $CHAR5.                                  
      @576    DX8                      $CHAR5.                                  
      @581    DX9                      $CHAR5.                                  
      @586    DX10                     $CHAR5.                                  
      @591    DX11                     $CHAR5.                                  
      @596    DX12                     $CHAR5.                                  
      @601    DX13                     $CHAR5.                                  
      @606    DX14                     $CHAR5.                                  
      @611    DX15                     $CHAR5.                                  
      @616    DX16                     $CHAR5.                                  
      @621    DX_Visit_Reason          $CHAR5.                                  
      @626    DXCCS1                   N4PF.                                    
      @630    DXCCS2                   N4PF.                                    
      @634    DXCCS3                   N4PF.                                    
      @638    DXCCS4                   N4PF.                                    
      @642    DXCCS5                   N4PF.                                    
      @646    DXCCS6                   N4PF.                                    
      @650    DXCCS7                   N4PF.                                    
      @654    DXCCS8                   N4PF.                                    
      @658    DXCCS9                   N4PF.                                    
      @662    DXCCS10                  N4PF.                                    
      @666    DXCCS11                  N4PF.                                    
      @670    DXCCS12                  N4PF.                                    
      @674    DXCCS13                  N4PF.                                    
      @678    DXCCS14                  N4PF.                                    
      @682    DXCCS15                  N4PF.                                    
      @686    DXCCS16                  N4PF.                                    
      @690    ECODE1                   $CHAR5.                                  
      @695    ECODE2                   $CHAR5.                                  
      @700    ECODE3                   $CHAR5.                                  
      @705    ECODE4                   $CHAR5.                                  
      @710    ECODE5                   $CHAR5.                                  
      @715    ECODE6                   $CHAR5.                                  
      @720    E_CCS1                   N4PF.                                    
      @724    E_CCS2                   N4PF.                                    
      @728    E_CCS3                   N4PF.                                    
      @732    E_CCS4                   N4PF.                                    
      @736    E_CCS5                   N4PF.                                    
      @740    E_CCS6                   N4PF.                                    
      @744    FEMALE                   N2PF.                                    
      @746    HCUP_AS                  N2PF.                                    
      @748    HCUP_ED                  N2PF.                                    
      @750    HCUP_OS                  N2PF.                                    
      @752    HOSPST                   $CHAR2.                                  
      @754    LOS                      N5PF.                                    
      @759    LOS_X                    N6PF.                                    
      @765    MRN_R                    N9PF.                                    
      @774    NCPT                     N3PF.                                    
      @777    NDX                      N2PF.                                    
      @779    NECODE                   N2PF.                                    
      @781    NEOMAT                   N2PF.                                    
      @783    PAY1                     N2PF.                                    
      @785    PAY2                     N2PF.                                    
      @787    PAY1_X                   $CHAR2.                                  
      @789    PAY2_X                   $CHAR2.                                  
      @791    PAYER1_X                 $CHAR2.                                  
      @793    PAYER2_X                 $CHAR2.                                  
      @795    PL_CBSA                  N3PF.                                    
      @798    PL_MSA1993               N3PF.                                    
      @801    PL_RUCA4                 N2PF.                                    
      @803    PL_RUCC2003              N2PF.                                    
      @805    PL_UIC2003               N2PF.                                    
      @807    PL_UR_CAT4               N2PF.                                    
      @809    PL_UR_CAT5               N2PF.                                    
      @811    PSTATE                   $CHAR2.                                  
      @813    PSTCO                    N5PF.                                    
      @818    PSTCO2                   N5PF.                                    
      @823    RACE                     N2PF.                                    
      @825    RACE_X                   $CHAR1.                                  
      @826    STATE_AS                 N2PF.                                    
      @828    STATE_ED                 N2PF.                                    
      @830    STATE_OS                 N2PF.                                    
      @832    TOTCHG                   N10PF.                                   
      @842    TOTCHG_X                 N15P2F.                                  
      @857    YEAR                     N4PF.                                    
      @861    ZIP3                     $CHAR3.                                  
      @864    APG1                     N4PF.                                    
      @868    APG2                     N4PF.                                    
      @872    APG3                     N4PF.                                    
      @876    APG4                     N4PF.                                    
      @880    APG5                     N4PF.                                    
      @884    APG6                     N4PF.                                    
      @888    APG7                     N4PF.                                    
      @892    APG8                     N4PF.                                    
      @896    APG9                     N4PF.                                    
      @900    APG10                    N4PF.                                    
      @904    APG11                    N4PF.                                    
      @908    APG12                    N4PF.                                    
      @912    APG13                    N4PF.                                    
      @916    APG14                    N4PF.                                    
      @920    APG15                    N4PF.                                    
      @924    APG16                    N4PF.                                    
      @928    APG17                    N4PF.                                    
      @932    APG18                    N4PF.                                    
      @936    APG19                    N4PF.                                    
      @940    APG20                    N4PF.                                    
      @944    APG21                    N4PF.                                    
      @948    APG22                    N4PF.                                    
      @952    APG23                    N4PF.                                    
      @956    APG24                    N4PF.                                    
      @960    APG25                    N4PF.                                    
      @964    APG26                    N4PF.                                    
      @968    APG27                    N4PF.                                    
      @972    APG28                    N4PF.                                    
      @976    APG29                    N4PF.                                    
      @980    APG30                    N4PF.                                    
      @984    APG31                    N4PF.                                    
      @988    APG32                    N4PF.                                    
      @992    APG33                    N4PF.                                    
      @996    APG34                    N4PF.                                    
      @1000   APG35                    N4PF.                                    
      @1004   APG36                    N4PF.                                    
      @1008   APG37                    N4PF.                                    
      @1012   APG38                    N4PF.                                    
      @1016   APG39                    N4PF.                                    
      @1020   APG40                    N4PF.                                    
      @1024   APG41                    N4PF.                                    
      @1028   APG42                    N4PF.                                    
      @1032   APG43                    N4PF.                                    
      @1036   APG44                    N4PF.                                    
      @1040   APG45                    N4PF.                                    
      @1044   APG46                    N4PF.                                    
      @1048   APG47                    N4PF.                                    
      @1052   APG48                    N4PF.                                    
      @1056   APG49                    N4PF.                                    
      @1060   APG50                    N4PF.                                    
      @1064   APG51                    N4PF.                                    
      @1068   APG52                    N4PF.                                    
      @1072   APG53                    N4PF.                                    
      @1076   APG54                    N4PF.                                    
      @1080   APG55                    N4PF.                                    
      @1084   APG56                    N4PF.                                    
      @1088   APG57                    N4PF.                                    
      @1092   APG58                    N4PF.                                    
      @1096   APG59                    N4PF.                                    
      @1100   APG60                    N4PF.                                    
      @1104   APG61                    N4PF.                                    
      @1108   APG62                    N4PF.                                    
      @1112   APG63                    N4PF.                                    
      @1116   APG64                    N4PF.                                    
      @1120   APG65                    N4PF.                                    
      @1124   APG66                    N4PF.                                    
      @1128   APG67                    N4PF.                                    
      @1132   APG68                    N4PF.                                    
      @1136   APG69                    N4PF.                                    
      @1140   APG70                    N4PF.                                    
      @1144   APG71                    N4PF.                                    
      @1148   APG72                    N4PF.                                    
      @1152   APG73                    N4PF.                                    
      @1156   APG74                    N4PF.                                    
      @1160   APG75                    N4PF.                                    
      @1164   APG76                    N4PF.                                    
      @1168   APG77                    N4PF.                                    
      @1172   APG78                    N4PF.                                    
      @1176   APG79                    N4PF.                                    
      @1180   APG80                    N4PF.                                    
      @1184   APG81                    N4PF.                                    
      @1188   APG82                    N4PF.                                    
      @1192   APG83                    N4PF.                                    
      @1196   APG84                    N4PF.                                    
      @1200   APG85                    N4PF.                                    
      @1204   APG86                    N4PF.                                    
      @1208   APG87                    N4PF.                                    
      @1212   APG88                    N4PF.                                    
      @1216   APG89                    N4PF.                                    
      @1220   APG90                    N4PF.                                    
      @1224   APG91                    N4PF.                                    
      @1228   APG92                    N4PF.                                    
      @1232   APG93                    N4PF.                                    
      @1236   APG94                    N4PF.                                    
      @1240   APG95                    N4PF.                                    
      @1244   APG96                    N4PF.                                    
      @1248   APG97                    N4PF.                                    
      @1252   APG98                    N4PF.                                    
      @1256   APG99                    N4PF.                                    
      @1260   APG100                   N4PF.                                    
      ;                                                                         
                                                                                
                                                                                
RUN;
