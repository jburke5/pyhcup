/*******************************************************************            
*   MD_SASD_2004_CORE.SAS:                                                      
*      THE SAS CODE SHOWN BELOW WILL LOAD THE ASCII                             
*      OUTPATIENT CORE FILE INTO SAS                                            
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
DATA MD_SASDC_2004_CORE;                                                        
INFILE 'MD_SASD_2004_CORE.ASC' LRECL = 1288;                                    
                                                                                
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
                                                                                
  ASOURCE                    LENGTH=3                                           
  LABEL="Admission source (uniform)"                                            
                                                                                
  ASOURCE_X                  LENGTH=$2                                          
  LABEL="Admission source (as received from source)"                            
                                                                                
  ATYPE                      LENGTH=3                                           
  LABEL="Admission type"                                                        
                                                                                
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
                                                                                
  DIED                       LENGTH=3                                           
  LABEL="Died during hospitalization"                                           
                                                                                
  DISP_X                     LENGTH=$2                                          
  LABEL="Disposition of patient (as received from source)"                      
                                                                                
  DISPUB92                   LENGTH=3                                           
  LABEL="Disposition of patient (UB-92 standard coding)"                        
                                                                                
  DISPUNIFORM                LENGTH=3                                           
  LABEL="Disposition of patient (uniform)"                                      
                                                                                
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
                                                                                
  HISPANIC_X                 LENGTH=$1                                          
  LABEL="Hispanic ethnicity (as received from source)"                          
                                                                                
  HOSPST                     LENGTH=$2                                          
  LABEL="Hospital state postal code"                                            
                                                                                
  LOS                        LENGTH=4                                           
  LABEL="Length of stay (cleaned)"                                              
                                                                                
  LOS_X                      LENGTH=4                                           
  LABEL="Length of stay (as received from source)"                              
                                                                                
  MARITALSTATUS              LENGTH=$1                                          
  LABEL="Patient's marital status"                                              
                                                                                
  MDNUM1_R                   LENGTH=5                                           
  LABEL="Physician 1 number (re-identified)"                                    
                                                                                
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
      @24     ASOURCE                  N2PF.                                    
      @26     ASOURCE_X                $CHAR2.                                  
      @28     ATYPE                    N2PF.                                    
      @30     AWEEKEND                 N2PF.                                    
      @32     CPT1                     $CHAR5.                                  
      @37     CPT2                     $CHAR5.                                  
      @42     CPT3                     $CHAR5.                                  
      @47     CPT4                     $CHAR5.                                  
      @52     CPT5                     $CHAR5.                                  
      @57     CPT6                     $CHAR5.                                  
      @62     CPT7                     $CHAR5.                                  
      @67     CPT8                     $CHAR5.                                  
      @72     CPT9                     $CHAR5.                                  
      @77     CPT10                    $CHAR5.                                  
      @82     CPT11                    $CHAR5.                                  
      @87     CPT12                    $CHAR5.                                  
      @92     CPT13                    $CHAR5.                                  
      @97     CPT14                    $CHAR5.                                  
      @102    CPT15                    $CHAR5.                                  
      @107    CPT16                    $CHAR5.                                  
      @112    CPT17                    $CHAR5.                                  
      @117    CPT18                    $CHAR5.                                  
      @122    CPT19                    $CHAR5.                                  
      @127    CPT20                    $CHAR5.                                  
      @132    CPT21                    $CHAR5.                                  
      @137    CPT22                    $CHAR5.                                  
      @142    CPT23                    $CHAR5.                                  
      @147    CPT24                    $CHAR5.                                  
      @152    CPT25                    $CHAR5.                                  
      @157    CPT26                    $CHAR5.                                  
      @162    CPT27                    $CHAR5.                                  
      @167    CPT28                    $CHAR5.                                  
      @172    CPT29                    $CHAR5.                                  
      @177    CPT30                    $CHAR5.                                  
      @182    CPT31                    $CHAR5.                                  
      @187    CPT32                    $CHAR5.                                  
      @192    CPT33                    $CHAR5.                                  
      @197    CPT34                    $CHAR5.                                  
      @202    CPT35                    $CHAR5.                                  
      @207    CPT36                    $CHAR5.                                  
      @212    CPT37                    $CHAR5.                                  
      @217    CPT38                    $CHAR5.                                  
      @222    CPT39                    $CHAR5.                                  
      @227    CPT40                    $CHAR5.                                  
      @232    CPT41                    $CHAR5.                                  
      @237    CPT42                    $CHAR5.                                  
      @242    CPT43                    $CHAR5.                                  
      @247    CPT44                    $CHAR5.                                  
      @252    CPT45                    $CHAR5.                                  
      @257    CPT46                    $CHAR5.                                  
      @262    CPT47                    $CHAR5.                                  
      @267    CPT48                    $CHAR5.                                  
      @272    CPT49                    $CHAR5.                                  
      @277    CPT50                    $CHAR5.                                  
      @282    CPT51                    $CHAR5.                                  
      @287    CPT52                    $CHAR5.                                  
      @292    CPT53                    $CHAR5.                                  
      @297    CPT54                    $CHAR5.                                  
      @302    CPT55                    $CHAR5.                                  
      @307    CPT56                    $CHAR5.                                  
      @312    CPT57                    $CHAR5.                                  
      @317    CPT58                    $CHAR5.                                  
      @322    CPT59                    $CHAR5.                                  
      @327    CPT60                    $CHAR5.                                  
      @332    CPT61                    $CHAR5.                                  
      @337    CPT62                    $CHAR5.                                  
      @342    CPT63                    $CHAR5.                                  
      @347    CPT64                    $CHAR5.                                  
      @352    CPT65                    $CHAR5.                                  
      @357    CPT66                    $CHAR5.                                  
      @362    CPT67                    $CHAR5.                                  
      @367    CPT68                    $CHAR5.                                  
      @372    CPT69                    $CHAR5.                                  
      @377    CPT70                    $CHAR5.                                  
      @382    CPT71                    $CHAR5.                                  
      @387    CPT72                    $CHAR5.                                  
      @392    CPT73                    $CHAR5.                                  
      @397    CPT74                    $CHAR5.                                  
      @402    CPT75                    $CHAR5.                                  
      @407    CPT76                    $CHAR5.                                  
      @412    CPT77                    $CHAR5.                                  
      @417    CPT78                    $CHAR5.                                  
      @422    CPT79                    $CHAR5.                                  
      @427    CPT80                    $CHAR5.                                  
      @432    CPT81                    $CHAR5.                                  
      @437    CPT82                    $CHAR5.                                  
      @442    CPT83                    $CHAR5.                                  
      @447    CPT84                    $CHAR5.                                  
      @452    CPT85                    $CHAR5.                                  
      @457    CPT86                    $CHAR5.                                  
      @462    CPT87                    $CHAR5.                                  
      @467    CPT88                    $CHAR5.                                  
      @472    CPT89                    $CHAR5.                                  
      @477    CPT90                    $CHAR5.                                  
      @482    CPT91                    $CHAR5.                                  
      @487    CPT92                    $CHAR5.                                  
      @492    CPT93                    $CHAR5.                                  
      @497    CPT94                    $CHAR5.                                  
      @502    CPT95                    $CHAR5.                                  
      @507    CPT96                    $CHAR5.                                  
      @512    CPT97                    $CHAR5.                                  
      @517    CPT98                    $CHAR5.                                  
      @522    CPT99                    $CHAR5.                                  
      @527    CPT100                   $CHAR5.                                  
      @532    DIED                     N2PF.                                    
      @534    DISP_X                   $CHAR2.                                  
      @536    DISPUB92                 N2PF.                                    
      @538    DISPUNIFORM              N2PF.                                    
      @540    DQTR                     N2PF.                                    
      @542    DSHOSPID                 $CHAR13.                                 
      @555    DX1                      $CHAR5.                                  
      @560    DX2                      $CHAR5.                                  
      @565    DX3                      $CHAR5.                                  
      @570    DX4                      $CHAR5.                                  
      @575    DX5                      $CHAR5.                                  
      @580    DX6                      $CHAR5.                                  
      @585    DX7                      $CHAR5.                                  
      @590    DX8                      $CHAR5.                                  
      @595    DX9                      $CHAR5.                                  
      @600    DX10                     $CHAR5.                                  
      @605    DX11                     $CHAR5.                                  
      @610    DX12                     $CHAR5.                                  
      @615    DX13                     $CHAR5.                                  
      @620    DX14                     $CHAR5.                                  
      @625    DX15                     $CHAR5.                                  
      @630    DX16                     $CHAR5.                                  
      @635    DX_Visit_Reason          $CHAR5.                                  
      @640    DXCCS1                   N4PF.                                    
      @644    DXCCS2                   N4PF.                                    
      @648    DXCCS3                   N4PF.                                    
      @652    DXCCS4                   N4PF.                                    
      @656    DXCCS5                   N4PF.                                    
      @660    DXCCS6                   N4PF.                                    
      @664    DXCCS7                   N4PF.                                    
      @668    DXCCS8                   N4PF.                                    
      @672    DXCCS9                   N4PF.                                    
      @676    DXCCS10                  N4PF.                                    
      @680    DXCCS11                  N4PF.                                    
      @684    DXCCS12                  N4PF.                                    
      @688    DXCCS13                  N4PF.                                    
      @692    DXCCS14                  N4PF.                                    
      @696    DXCCS15                  N4PF.                                    
      @700    DXCCS16                  N4PF.                                    
      @704    ECODE1                   $CHAR5.                                  
      @709    ECODE2                   $CHAR5.                                  
      @714    ECODE3                   $CHAR5.                                  
      @719    ECODE4                   $CHAR5.                                  
      @724    ECODE5                   $CHAR5.                                  
      @729    ECODE6                   $CHAR5.                                  
      @734    E_CCS1                   N4PF.                                    
      @738    E_CCS2                   N4PF.                                    
      @742    E_CCS3                   N4PF.                                    
      @746    E_CCS4                   N4PF.                                    
      @750    E_CCS5                   N4PF.                                    
      @754    E_CCS6                   N4PF.                                    
      @758    FEMALE                   N2PF.                                    
      @760    HCUP_AS                  N2PF.                                    
      @762    HCUP_ED                  N2PF.                                    
      @764    HCUP_OS                  N2PF.                                    
      @766    HISPANIC_X               $CHAR1.                                  
      @767    HOSPST                   $CHAR2.                                  
      @769    LOS                      N5PF.                                    
      @774    LOS_X                    N6PF.                                    
      @780    MARITALSTATUS            $CHAR1.                                  
      @781    MDNUM1_R                 N9PF.                                    
      @790    MRN_R                    N9PF.                                    
      @799    NCPT                     N3PF.                                    
      @802    NDX                      N2PF.                                    
      @804    NECODE                   N2PF.                                    
      @806    NEOMAT                   N2PF.                                    
      @808    PAY1                     N2PF.                                    
      @810    PAY2                     N2PF.                                    
      @812    PAY1_X                   $CHAR2.                                  
      @814    PAY2_X                   $CHAR2.                                  
      @816    PAYER1_X                 $CHAR2.                                  
      @818    PAYER2_X                 $CHAR2.                                  
      @820    PL_CBSA                  N3PF.                                    
      @823    PL_MSA1993               N3PF.                                    
      @826    PL_RUCA4                 N2PF.                                    
      @828    PL_RUCC2003              N2PF.                                    
      @830    PL_UIC2003               N2PF.                                    
      @832    PL_UR_CAT4               N2PF.                                    
      @834    PL_UR_CAT5               N2PF.                                    
      @836    PSTATE                   $CHAR2.                                  
      @838    PSTCO                    N5PF.                                    
      @843    PSTCO2                   N5PF.                                    
      @848    RACE                     N2PF.                                    
      @850    RACE_X                   $CHAR1.                                  
      @851    STATE_AS                 N2PF.                                    
      @853    STATE_ED                 N2PF.                                    
      @855    STATE_OS                 N2PF.                                    
      @857    TOTCHG                   N10PF.                                   
      @867    TOTCHG_X                 N15P2F.                                  
      @882    YEAR                     N4PF.                                    
      @886    ZIP3                     $CHAR3.                                  
      @889    APG1                     N4PF.                                    
      @893    APG2                     N4PF.                                    
      @897    APG3                     N4PF.                                    
      @901    APG4                     N4PF.                                    
      @905    APG5                     N4PF.                                    
      @909    APG6                     N4PF.                                    
      @913    APG7                     N4PF.                                    
      @917    APG8                     N4PF.                                    
      @921    APG9                     N4PF.                                    
      @925    APG10                    N4PF.                                    
      @929    APG11                    N4PF.                                    
      @933    APG12                    N4PF.                                    
      @937    APG13                    N4PF.                                    
      @941    APG14                    N4PF.                                    
      @945    APG15                    N4PF.                                    
      @949    APG16                    N4PF.                                    
      @953    APG17                    N4PF.                                    
      @957    APG18                    N4PF.                                    
      @961    APG19                    N4PF.                                    
      @965    APG20                    N4PF.                                    
      @969    APG21                    N4PF.                                    
      @973    APG22                    N4PF.                                    
      @977    APG23                    N4PF.                                    
      @981    APG24                    N4PF.                                    
      @985    APG25                    N4PF.                                    
      @989    APG26                    N4PF.                                    
      @993    APG27                    N4PF.                                    
      @997    APG28                    N4PF.                                    
      @1001   APG29                    N4PF.                                    
      @1005   APG30                    N4PF.                                    
      @1009   APG31                    N4PF.                                    
      @1013   APG32                    N4PF.                                    
      @1017   APG33                    N4PF.                                    
      @1021   APG34                    N4PF.                                    
      @1025   APG35                    N4PF.                                    
      @1029   APG36                    N4PF.                                    
      @1033   APG37                    N4PF.                                    
      @1037   APG38                    N4PF.                                    
      @1041   APG39                    N4PF.                                    
      @1045   APG40                    N4PF.                                    
      @1049   APG41                    N4PF.                                    
      @1053   APG42                    N4PF.                                    
      @1057   APG43                    N4PF.                                    
      @1061   APG44                    N4PF.                                    
      @1065   APG45                    N4PF.                                    
      @1069   APG46                    N4PF.                                    
      @1073   APG47                    N4PF.                                    
      @1077   APG48                    N4PF.                                    
      @1081   APG49                    N4PF.                                    
      @1085   APG50                    N4PF.                                    
      @1089   APG51                    N4PF.                                    
      @1093   APG52                    N4PF.                                    
      @1097   APG53                    N4PF.                                    
      @1101   APG54                    N4PF.                                    
      @1105   APG55                    N4PF.                                    
      @1109   APG56                    N4PF.                                    
      @1113   APG57                    N4PF.                                    
      @1117   APG58                    N4PF.                                    
      @1121   APG59                    N4PF.                                    
      @1125   APG60                    N4PF.                                    
      @1129   APG61                    N4PF.                                    
      @1133   APG62                    N4PF.                                    
      @1137   APG63                    N4PF.                                    
      @1141   APG64                    N4PF.                                    
      @1145   APG65                    N4PF.                                    
      @1149   APG66                    N4PF.                                    
      @1153   APG67                    N4PF.                                    
      @1157   APG68                    N4PF.                                    
      @1161   APG69                    N4PF.                                    
      @1165   APG70                    N4PF.                                    
      @1169   APG71                    N4PF.                                    
      @1173   APG72                    N4PF.                                    
      @1177   APG73                    N4PF.                                    
      @1181   APG74                    N4PF.                                    
      @1185   APG75                    N4PF.                                    
      @1189   APG76                    N4PF.                                    
      @1193   APG77                    N4PF.                                    
      @1197   APG78                    N4PF.                                    
      @1201   APG79                    N4PF.                                    
      @1205   APG80                    N4PF.                                    
      @1209   APG81                    N4PF.                                    
      @1213   APG82                    N4PF.                                    
      @1217   APG83                    N4PF.                                    
      @1221   APG84                    N4PF.                                    
      @1225   APG85                    N4PF.                                    
      @1229   APG86                    N4PF.                                    
      @1233   APG87                    N4PF.                                    
      @1237   APG88                    N4PF.                                    
      @1241   APG89                    N4PF.                                    
      @1245   APG90                    N4PF.                                    
      @1249   APG91                    N4PF.                                    
      @1253   APG92                    N4PF.                                    
      @1257   APG93                    N4PF.                                    
      @1261   APG94                    N4PF.                                    
      @1265   APG95                    N4PF.                                    
      @1269   APG96                    N4PF.                                    
      @1273   APG97                    N4PF.                                    
      @1277   APG98                    N4PF.                                    
      @1281   APG99                    N4PF.                                    
      @1285   APG100                   N4PF.                                    
      ;                                                                         
                                                                                
                                                                                
RUN;
