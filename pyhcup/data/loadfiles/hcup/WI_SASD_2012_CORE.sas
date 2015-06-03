/*******************************************************************            
*   WI_SASD_2012_CORE.SAS:                                                      
*      THE SAS CODE SHOWN BELOW WILL LOAD THE ASCII                             
*      OUTPATIENT SASD CORE FILE INTO SAS                                       
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
DATA WI_SASDC_2012_CORE;                                                        
INFILE 'WI_SASD_2012_CORE.ASC' LRECL = 1753;                                    
                                                                                
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
                                                                                
  BILLTYPE                   LENGTH=$4                                          
  LABEL="UB-92 bill type"                                                       
                                                                                
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
                                                                                
  CPTCCS1                    LENGTH=4                                           
  LABEL="CCS: CPT 1"                                                            
                                                                                
  CPTCCS2                    LENGTH=4                                           
  LABEL="CCS: CPT 2"                                                            
                                                                                
  CPTCCS3                    LENGTH=4                                           
  LABEL="CCS: CPT 3"                                                            
                                                                                
  CPTCCS4                    LENGTH=4                                           
  LABEL="CCS: CPT 4"                                                            
                                                                                
  CPTCCS5                    LENGTH=4                                           
  LABEL="CCS: CPT 5"                                                            
                                                                                
  CPTCCS6                    LENGTH=4                                           
  LABEL="CCS: CPT 6"                                                            
                                                                                
  CPTCCS7                    LENGTH=4                                           
  LABEL="CCS: CPT 7"                                                            
                                                                                
  CPTCCS8                    LENGTH=4                                           
  LABEL="CCS: CPT 8"                                                            
                                                                                
  CPTCCS9                    LENGTH=4                                           
  LABEL="CCS: CPT 9"                                                            
                                                                                
  CPTCCS10                   LENGTH=4                                           
  LABEL="CCS: CPT 10"                                                           
                                                                                
  CPTCCS11                   LENGTH=4                                           
  LABEL="CCS: CPT 11"                                                           
                                                                                
  CPTCCS12                   LENGTH=4                                           
  LABEL="CCS: CPT 12"                                                           
                                                                                
  CPTCCS13                   LENGTH=4                                           
  LABEL="CCS: CPT 13"                                                           
                                                                                
  CPTCCS14                   LENGTH=4                                           
  LABEL="CCS: CPT 14"                                                           
                                                                                
  CPTCCS15                   LENGTH=4                                           
  LABEL="CCS: CPT 15"                                                           
                                                                                
  CPTCCS16                   LENGTH=4                                           
  LABEL="CCS: CPT 16"                                                           
                                                                                
  CPTCCS17                   LENGTH=4                                           
  LABEL="CCS: CPT 17"                                                           
                                                                                
  CPTCCS18                   LENGTH=4                                           
  LABEL="CCS: CPT 18"                                                           
                                                                                
  CPTCCS19                   LENGTH=4                                           
  LABEL="CCS: CPT 19"                                                           
                                                                                
  CPTCCS20                   LENGTH=4                                           
  LABEL="CCS: CPT 20"                                                           
                                                                                
  CPTCCS21                   LENGTH=4                                           
  LABEL="CCS: CPT 21"                                                           
                                                                                
  CPTCCS22                   LENGTH=4                                           
  LABEL="CCS: CPT 22"                                                           
                                                                                
  CPTCCS23                   LENGTH=4                                           
  LABEL="CCS: CPT 23"                                                           
                                                                                
  CPTCCS24                   LENGTH=4                                           
  LABEL="CCS: CPT 24"                                                           
                                                                                
  CPTCCS25                   LENGTH=4                                           
  LABEL="CCS: CPT 25"                                                           
                                                                                
  CPTCCS26                   LENGTH=4                                           
  LABEL="CCS: CPT 26"                                                           
                                                                                
  CPTCCS27                   LENGTH=4                                           
  LABEL="CCS: CPT 27"                                                           
                                                                                
  CPTCCS28                   LENGTH=4                                           
  LABEL="CCS: CPT 28"                                                           
                                                                                
  CPTCCS29                   LENGTH=4                                           
  LABEL="CCS: CPT 29"                                                           
                                                                                
  CPTCCS30                   LENGTH=4                                           
  LABEL="CCS: CPT 30"                                                           
                                                                                
  CPTCCS31                   LENGTH=4                                           
  LABEL="CCS: CPT 31"                                                           
                                                                                
  CPTCCS32                   LENGTH=4                                           
  LABEL="CCS: CPT 32"                                                           
                                                                                
  CPTCCS33                   LENGTH=4                                           
  LABEL="CCS: CPT 33"                                                           
                                                                                
  CPTCCS34                   LENGTH=4                                           
  LABEL="CCS: CPT 34"                                                           
                                                                                
  CPTCCS35                   LENGTH=4                                           
  LABEL="CCS: CPT 35"                                                           
                                                                                
  CPTCCS36                   LENGTH=4                                           
  LABEL="CCS: CPT 36"                                                           
                                                                                
  CPTCCS37                   LENGTH=4                                           
  LABEL="CCS: CPT 37"                                                           
                                                                                
  CPTCCS38                   LENGTH=4                                           
  LABEL="CCS: CPT 38"                                                           
                                                                                
  CPTCCS39                   LENGTH=4                                           
  LABEL="CCS: CPT 39"                                                           
                                                                                
  CPTCCS40                   LENGTH=4                                           
  LABEL="CCS: CPT 40"                                                           
                                                                                
  CPTCCS41                   LENGTH=4                                           
  LABEL="CCS: CPT 41"                                                           
                                                                                
  CPTCCS42                   LENGTH=4                                           
  LABEL="CCS: CPT 42"                                                           
                                                                                
  CPTCCS43                   LENGTH=4                                           
  LABEL="CCS: CPT 43"                                                           
                                                                                
  CPTCCS44                   LENGTH=4                                           
  LABEL="CCS: CPT 44"                                                           
                                                                                
  CPTCCS45                   LENGTH=4                                           
  LABEL="CCS: CPT 45"                                                           
                                                                                
  CPTCCS46                   LENGTH=4                                           
  LABEL="CCS: CPT 46"                                                           
                                                                                
  CPTCCS47                   LENGTH=4                                           
  LABEL="CCS: CPT 47"                                                           
                                                                                
  CPTCCS48                   LENGTH=4                                           
  LABEL="CCS: CPT 48"                                                           
                                                                                
  CPTCCS49                   LENGTH=4                                           
  LABEL="CCS: CPT 49"                                                           
                                                                                
  CPTCCS50                   LENGTH=4                                           
  LABEL="CCS: CPT 50"                                                           
                                                                                
  CPTM1_1                    LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 1"                                          
                                                                                
  CPTM1_2                    LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 2"                                          
                                                                                
  CPTM1_3                    LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 3"                                          
                                                                                
  CPTM1_4                    LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 4"                                          
                                                                                
  CPTM1_5                    LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 5"                                          
                                                                                
  CPTM1_6                    LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 6"                                          
                                                                                
  CPTM1_7                    LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 7"                                          
                                                                                
  CPTM1_8                    LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 8"                                          
                                                                                
  CPTM1_9                    LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 9"                                          
                                                                                
  CPTM1_10                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 10"                                         
                                                                                
  CPTM1_11                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 11"                                         
                                                                                
  CPTM1_12                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 12"                                         
                                                                                
  CPTM1_13                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 13"                                         
                                                                                
  CPTM1_14                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 14"                                         
                                                                                
  CPTM1_15                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 15"                                         
                                                                                
  CPTM1_16                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 16"                                         
                                                                                
  CPTM1_17                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 17"                                         
                                                                                
  CPTM1_18                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 18"                                         
                                                                                
  CPTM1_19                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 19"                                         
                                                                                
  CPTM1_20                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 20"                                         
                                                                                
  CPTM1_21                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 21"                                         
                                                                                
  CPTM1_22                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 22"                                         
                                                                                
  CPTM1_23                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 23"                                         
                                                                                
  CPTM1_24                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 24"                                         
                                                                                
  CPTM1_25                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 25"                                         
                                                                                
  CPTM1_26                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 26"                                         
                                                                                
  CPTM1_27                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 27"                                         
                                                                                
  CPTM1_28                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 28"                                         
                                                                                
  CPTM1_29                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 29"                                         
                                                                                
  CPTM1_30                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 30"                                         
                                                                                
  CPTM1_31                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 31"                                         
                                                                                
  CPTM1_32                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 32"                                         
                                                                                
  CPTM1_33                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 33"                                         
                                                                                
  CPTM1_34                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 34"                                         
                                                                                
  CPTM1_35                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 35"                                         
                                                                                
  CPTM1_36                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 36"                                         
                                                                                
  CPTM1_37                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 37"                                         
                                                                                
  CPTM1_38                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 38"                                         
                                                                                
  CPTM1_39                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 39"                                         
                                                                                
  CPTM1_40                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 40"                                         
                                                                                
  CPTM1_41                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 41"                                         
                                                                                
  CPTM1_42                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 42"                                         
                                                                                
  CPTM1_43                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 43"                                         
                                                                                
  CPTM1_44                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 44"                                         
                                                                                
  CPTM1_45                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 45"                                         
                                                                                
  CPTM1_46                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 46"                                         
                                                                                
  CPTM1_47                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 47"                                         
                                                                                
  CPTM1_48                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 48"                                         
                                                                                
  CPTM1_49                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 49"                                         
                                                                                
  CPTM1_50                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 50"                                         
                                                                                
  CPTM2_1                    LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 1"                                         
                                                                                
  CPTM2_2                    LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 2"                                         
                                                                                
  CPTM2_3                    LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 3"                                         
                                                                                
  CPTM2_4                    LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 4"                                         
                                                                                
  CPTM2_5                    LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 5"                                         
                                                                                
  CPTM2_6                    LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 6"                                         
                                                                                
  CPTM2_7                    LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 7"                                         
                                                                                
  CPTM2_8                    LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 8"                                         
                                                                                
  CPTM2_9                    LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 9"                                         
                                                                                
  CPTM2_10                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 10"                                        
                                                                                
  CPTM2_11                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 11"                                        
                                                                                
  CPTM2_12                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 12"                                        
                                                                                
  CPTM2_13                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 13"                                        
                                                                                
  CPTM2_14                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 14"                                        
                                                                                
  CPTM2_15                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 15"                                        
                                                                                
  CPTM2_16                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 16"                                        
                                                                                
  CPTM2_17                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 17"                                        
                                                                                
  CPTM2_18                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 18"                                        
                                                                                
  CPTM2_19                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 19"                                        
                                                                                
  CPTM2_20                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 20"                                        
                                                                                
  CPTM2_21                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 21"                                        
                                                                                
  CPTM2_22                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 22"                                        
                                                                                
  CPTM2_23                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 23"                                        
                                                                                
  CPTM2_24                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 24"                                        
                                                                                
  CPTM2_25                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 25"                                        
                                                                                
  CPTM2_26                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 26"                                        
                                                                                
  CPTM2_27                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 27"                                        
                                                                                
  CPTM2_28                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 28"                                        
                                                                                
  CPTM2_29                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 29"                                        
                                                                                
  CPTM2_30                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 30"                                        
                                                                                
  CPTM2_31                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 31"                                        
                                                                                
  CPTM2_32                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 32"                                        
                                                                                
  CPTM2_33                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 33"                                        
                                                                                
  CPTM2_34                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 34"                                        
                                                                                
  CPTM2_35                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 35"                                        
                                                                                
  CPTM2_36                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 36"                                        
                                                                                
  CPTM2_37                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 37"                                        
                                                                                
  CPTM2_38                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 38"                                        
                                                                                
  CPTM2_39                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 39"                                        
                                                                                
  CPTM2_40                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 40"                                        
                                                                                
  CPTM2_41                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 41"                                        
                                                                                
  CPTM2_42                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 42"                                        
                                                                                
  CPTM2_43                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 43"                                        
                                                                                
  CPTM2_44                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 44"                                        
                                                                                
  CPTM2_45                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 45"                                        
                                                                                
  CPTM2_46                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 46"                                        
                                                                                
  CPTM2_47                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 47"                                        
                                                                                
  CPTM2_48                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 48"                                        
                                                                                
  CPTM2_49                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 49"                                        
                                                                                
  CPTM2_50                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 50"                                        
                                                                                
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
                                                                                
  DX_Visit_Reason1           LENGTH=$5                                          
  LABEL="Reason for visit diagnosis 1"                                          
                                                                                
  DX_Visit_Reason2           LENGTH=$5                                          
  LABEL="Reason for visit diagnosis 2"                                          
                                                                                
  DX_Visit_Reason3           LENGTH=$5                                          
  LABEL="Reason for visit diagnosis 3"                                          
                                                                                
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
                                                                                
  HISPANIC_X                 LENGTH=$1                                          
  LABEL="Hispanic ethnicity (as received from source)"                          
                                                                                
  HOSPBRTH                   LENGTH=3                                           
  LABEL="Indicator of birth in this hospital"                                   
                                                                                
  HOSPST                     LENGTH=$2                                          
  LABEL="Hospital state postal code"                                            
                                                                                
  HOSP_NPI                   LENGTH=$10                                         
  LABEL="Hospital NPI"                                                          
                                                                                
  Homeless                   LENGTH=3                                           
  LABEL="Indicator that patient is homeless"                                    
                                                                                
  KEY                        LENGTH=8                 FORMAT=Z15.               
  LABEL="HCUP record identifier"                                                
                                                                                
  LOS                        LENGTH=4                                           
  LABEL="Length of stay (cleaned)"                                              
                                                                                
  LOS_X                      LENGTH=4                                           
  LABEL="Length of stay (as received from source)"                              
                                                                                
  MDSPEC1                    LENGTH=$3                                          
  LABEL="Physician 1 specialty (as received from source)"                       
                                                                                
  MDSPEC2                    LENGTH=$3                                          
  LABEL="Physician 2 specialty (as received from source)"                       
                                                                                
  MEDINCSTQ                  LENGTH=3                                           
  LABEL="Median household income state quartile for patient ZIP Code"           
                                                                                
  MRN_R                      LENGTH=5                                           
  LABEL="Medical record number (re-identified)"                                 
                                                                                
  NCHRONIC                   LENGTH=3                                           
  LABEL="Number of chronic conditions"                                          
                                                                                
  NCPT                       LENGTH=3                                           
  LABEL="Number of CPT/HCPCS procedures on this record"                         
                                                                                
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
                                                                                
  OS_TIME                    LENGTH=4                                           
  LABEL="Observation stay time summed from UNITS"                               
                                                                                
  PAY1                       LENGTH=3                                           
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PAY1_X                     LENGTH=$5                                          
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PAY2                       LENGTH=3                                           
  LABEL="Secondary expected payer (uniform)"                                    
                                                                                
  PAY2_X                     LENGTH=$5                                          
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
                                                                                
  PRDAY1                     LENGTH=4                                           
  LABEL="Number of days from admission to PR1"                                  
                                                                                
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
                                                                                
  PRYEAR1                    LENGTH=3                                           
  LABEL="Year of procedure 1"                                                   
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      AGE                      N3PF.                                    
      @4      AGEDAY                   N3PF.                                    
      @7      AGEMONTH                 N3PF.                                    
      @10     AMONTH                   N2PF.                                    
      @12     ATYPE                    N2PF.                                    
      @14     AWEEKEND                 N2PF.                                    
      @16     BILLTYPE                 $CHAR4.                                  
      @20     CPT1                     $CHAR5.                                  
      @25     CPT2                     $CHAR5.                                  
      @30     CPT3                     $CHAR5.                                  
      @35     CPT4                     $CHAR5.                                  
      @40     CPT5                     $CHAR5.                                  
      @45     CPT6                     $CHAR5.                                  
      @50     CPT7                     $CHAR5.                                  
      @55     CPT8                     $CHAR5.                                  
      @60     CPT9                     $CHAR5.                                  
      @65     CPT10                    $CHAR5.                                  
      @70     CPT11                    $CHAR5.                                  
      @75     CPT12                    $CHAR5.                                  
      @80     CPT13                    $CHAR5.                                  
      @85     CPT14                    $CHAR5.                                  
      @90     CPT15                    $CHAR5.                                  
      @95     CPT16                    $CHAR5.                                  
      @100    CPT17                    $CHAR5.                                  
      @105    CPT18                    $CHAR5.                                  
      @110    CPT19                    $CHAR5.                                  
      @115    CPT20                    $CHAR5.                                  
      @120    CPT21                    $CHAR5.                                  
      @125    CPT22                    $CHAR5.                                  
      @130    CPT23                    $CHAR5.                                  
      @135    CPT24                    $CHAR5.                                  
      @140    CPT25                    $CHAR5.                                  
      @145    CPT26                    $CHAR5.                                  
      @150    CPT27                    $CHAR5.                                  
      @155    CPT28                    $CHAR5.                                  
      @160    CPT29                    $CHAR5.                                  
      @165    CPT30                    $CHAR5.                                  
      @170    CPT31                    $CHAR5.                                  
      @175    CPT32                    $CHAR5.                                  
      @180    CPT33                    $CHAR5.                                  
      @185    CPT34                    $CHAR5.                                  
      @190    CPT35                    $CHAR5.                                  
      @195    CPT36                    $CHAR5.                                  
      @200    CPT37                    $CHAR5.                                  
      @205    CPT38                    $CHAR5.                                  
      @210    CPT39                    $CHAR5.                                  
      @215    CPT40                    $CHAR5.                                  
      @220    CPT41                    $CHAR5.                                  
      @225    CPT42                    $CHAR5.                                  
      @230    CPT43                    $CHAR5.                                  
      @235    CPT44                    $CHAR5.                                  
      @240    CPT45                    $CHAR5.                                  
      @245    CPT46                    $CHAR5.                                  
      @250    CPT47                    $CHAR5.                                  
      @255    CPT48                    $CHAR5.                                  
      @260    CPT49                    $CHAR5.                                  
      @265    CPT50                    $CHAR5.                                  
      @270    CPTCCS1                  N3PF.                                    
      @273    CPTCCS2                  N3PF.                                    
      @276    CPTCCS3                  N3PF.                                    
      @279    CPTCCS4                  N3PF.                                    
      @282    CPTCCS5                  N3PF.                                    
      @285    CPTCCS6                  N3PF.                                    
      @288    CPTCCS7                  N3PF.                                    
      @291    CPTCCS8                  N3PF.                                    
      @294    CPTCCS9                  N3PF.                                    
      @297    CPTCCS10                 N3PF.                                    
      @300    CPTCCS11                 N3PF.                                    
      @303    CPTCCS12                 N3PF.                                    
      @306    CPTCCS13                 N3PF.                                    
      @309    CPTCCS14                 N3PF.                                    
      @312    CPTCCS15                 N3PF.                                    
      @315    CPTCCS16                 N3PF.                                    
      @318    CPTCCS17                 N3PF.                                    
      @321    CPTCCS18                 N3PF.                                    
      @324    CPTCCS19                 N3PF.                                    
      @327    CPTCCS20                 N3PF.                                    
      @330    CPTCCS21                 N3PF.                                    
      @333    CPTCCS22                 N3PF.                                    
      @336    CPTCCS23                 N3PF.                                    
      @339    CPTCCS24                 N3PF.                                    
      @342    CPTCCS25                 N3PF.                                    
      @345    CPTCCS26                 N3PF.                                    
      @348    CPTCCS27                 N3PF.                                    
      @351    CPTCCS28                 N3PF.                                    
      @354    CPTCCS29                 N3PF.                                    
      @357    CPTCCS30                 N3PF.                                    
      @360    CPTCCS31                 N3PF.                                    
      @363    CPTCCS32                 N3PF.                                    
      @366    CPTCCS33                 N3PF.                                    
      @369    CPTCCS34                 N3PF.                                    
      @372    CPTCCS35                 N3PF.                                    
      @375    CPTCCS36                 N3PF.                                    
      @378    CPTCCS37                 N3PF.                                    
      @381    CPTCCS38                 N3PF.                                    
      @384    CPTCCS39                 N3PF.                                    
      @387    CPTCCS40                 N3PF.                                    
      @390    CPTCCS41                 N3PF.                                    
      @393    CPTCCS42                 N3PF.                                    
      @396    CPTCCS43                 N3PF.                                    
      @399    CPTCCS44                 N3PF.                                    
      @402    CPTCCS45                 N3PF.                                    
      @405    CPTCCS46                 N3PF.                                    
      @408    CPTCCS47                 N3PF.                                    
      @411    CPTCCS48                 N3PF.                                    
      @414    CPTCCS49                 N3PF.                                    
      @417    CPTCCS50                 N3PF.                                    
      @420    CPTM1_1                  $CHAR2.                                  
      @422    CPTM1_2                  $CHAR2.                                  
      @424    CPTM1_3                  $CHAR2.                                  
      @426    CPTM1_4                  $CHAR2.                                  
      @428    CPTM1_5                  $CHAR2.                                  
      @430    CPTM1_6                  $CHAR2.                                  
      @432    CPTM1_7                  $CHAR2.                                  
      @434    CPTM1_8                  $CHAR2.                                  
      @436    CPTM1_9                  $CHAR2.                                  
      @438    CPTM1_10                 $CHAR2.                                  
      @440    CPTM1_11                 $CHAR2.                                  
      @442    CPTM1_12                 $CHAR2.                                  
      @444    CPTM1_13                 $CHAR2.                                  
      @446    CPTM1_14                 $CHAR2.                                  
      @448    CPTM1_15                 $CHAR2.                                  
      @450    CPTM1_16                 $CHAR2.                                  
      @452    CPTM1_17                 $CHAR2.                                  
      @454    CPTM1_18                 $CHAR2.                                  
      @456    CPTM1_19                 $CHAR2.                                  
      @458    CPTM1_20                 $CHAR2.                                  
      @460    CPTM1_21                 $CHAR2.                                  
      @462    CPTM1_22                 $CHAR2.                                  
      @464    CPTM1_23                 $CHAR2.                                  
      @466    CPTM1_24                 $CHAR2.                                  
      @468    CPTM1_25                 $CHAR2.                                  
      @470    CPTM1_26                 $CHAR2.                                  
      @472    CPTM1_27                 $CHAR2.                                  
      @474    CPTM1_28                 $CHAR2.                                  
      @476    CPTM1_29                 $CHAR2.                                  
      @478    CPTM1_30                 $CHAR2.                                  
      @480    CPTM1_31                 $CHAR2.                                  
      @482    CPTM1_32                 $CHAR2.                                  
      @484    CPTM1_33                 $CHAR2.                                  
      @486    CPTM1_34                 $CHAR2.                                  
      @488    CPTM1_35                 $CHAR2.                                  
      @490    CPTM1_36                 $CHAR2.                                  
      @492    CPTM1_37                 $CHAR2.                                  
      @494    CPTM1_38                 $CHAR2.                                  
      @496    CPTM1_39                 $CHAR2.                                  
      @498    CPTM1_40                 $CHAR2.                                  
      @500    CPTM1_41                 $CHAR2.                                  
      @502    CPTM1_42                 $CHAR2.                                  
      @504    CPTM1_43                 $CHAR2.                                  
      @506    CPTM1_44                 $CHAR2.                                  
      @508    CPTM1_45                 $CHAR2.                                  
      @510    CPTM1_46                 $CHAR2.                                  
      @512    CPTM1_47                 $CHAR2.                                  
      @514    CPTM1_48                 $CHAR2.                                  
      @516    CPTM1_49                 $CHAR2.                                  
      @518    CPTM1_50                 $CHAR2.                                  
      @520    CPTM2_1                  $CHAR2.                                  
      @522    CPTM2_2                  $CHAR2.                                  
      @524    CPTM2_3                  $CHAR2.                                  
      @526    CPTM2_4                  $CHAR2.                                  
      @528    CPTM2_5                  $CHAR2.                                  
      @530    CPTM2_6                  $CHAR2.                                  
      @532    CPTM2_7                  $CHAR2.                                  
      @534    CPTM2_8                  $CHAR2.                                  
      @536    CPTM2_9                  $CHAR2.                                  
      @538    CPTM2_10                 $CHAR2.                                  
      @540    CPTM2_11                 $CHAR2.                                  
      @542    CPTM2_12                 $CHAR2.                                  
      @544    CPTM2_13                 $CHAR2.                                  
      @546    CPTM2_14                 $CHAR2.                                  
      @548    CPTM2_15                 $CHAR2.                                  
      @550    CPTM2_16                 $CHAR2.                                  
      @552    CPTM2_17                 $CHAR2.                                  
      @554    CPTM2_18                 $CHAR2.                                  
      @556    CPTM2_19                 $CHAR2.                                  
      @558    CPTM2_20                 $CHAR2.                                  
      @560    CPTM2_21                 $CHAR2.                                  
      @562    CPTM2_22                 $CHAR2.                                  
      @564    CPTM2_23                 $CHAR2.                                  
      @566    CPTM2_24                 $CHAR2.                                  
      @568    CPTM2_25                 $CHAR2.                                  
      @570    CPTM2_26                 $CHAR2.                                  
      @572    CPTM2_27                 $CHAR2.                                  
      @574    CPTM2_28                 $CHAR2.                                  
      @576    CPTM2_29                 $CHAR2.                                  
      @578    CPTM2_30                 $CHAR2.                                  
      @580    CPTM2_31                 $CHAR2.                                  
      @582    CPTM2_32                 $CHAR2.                                  
      @584    CPTM2_33                 $CHAR2.                                  
      @586    CPTM2_34                 $CHAR2.                                  
      @588    CPTM2_35                 $CHAR2.                                  
      @590    CPTM2_36                 $CHAR2.                                  
      @592    CPTM2_37                 $CHAR2.                                  
      @594    CPTM2_38                 $CHAR2.                                  
      @596    CPTM2_39                 $CHAR2.                                  
      @598    CPTM2_40                 $CHAR2.                                  
      @600    CPTM2_41                 $CHAR2.                                  
      @602    CPTM2_42                 $CHAR2.                                  
      @604    CPTM2_43                 $CHAR2.                                  
      @606    CPTM2_44                 $CHAR2.                                  
      @608    CPTM2_45                 $CHAR2.                                  
      @610    CPTM2_46                 $CHAR2.                                  
      @612    CPTM2_47                 $CHAR2.                                  
      @614    CPTM2_48                 $CHAR2.                                  
      @616    CPTM2_49                 $CHAR2.                                  
      @618    CPTM2_50                 $CHAR2.                                  
      @620    DIED                     N2PF.                                    
      @622    DISPUB04                 N2PF.                                    
      @624    DISPUNIFORM              N2PF.                                    
      @626    DISP_X                   $CHAR2.                                  
      @628    DQTR                     N2PF.                                    
      @630    DSHOSPID                 $CHAR17.                                 
      @647    DX1                      $CHAR5.                                  
      @652    DX2                      $CHAR5.                                  
      @657    DX3                      $CHAR5.                                  
      @662    DX4                      $CHAR5.                                  
      @667    DX5                      $CHAR5.                                  
      @672    DX6                      $CHAR5.                                  
      @677    DX7                      $CHAR5.                                  
      @682    DX8                      $CHAR5.                                  
      @687    DX9                      $CHAR5.                                  
      @692    DX10                     $CHAR5.                                  
      @697    DX11                     $CHAR5.                                  
      @702    DX12                     $CHAR5.                                  
      @707    DX13                     $CHAR5.                                  
      @712    DX14                     $CHAR5.                                  
      @717    DX15                     $CHAR5.                                  
      @722    DX16                     $CHAR5.                                  
      @727    DX17                     $CHAR5.                                  
      @732    DX18                     $CHAR5.                                  
      @737    DX19                     $CHAR5.                                  
      @742    DX20                     $CHAR5.                                  
      @747    DX21                     $CHAR5.                                  
      @752    DX22                     $CHAR5.                                  
      @757    DX23                     $CHAR5.                                  
      @762    DX24                     $CHAR5.                                  
      @767    DX25                     $CHAR5.                                  
      @772    DX26                     $CHAR5.                                  
      @777    DX27                     $CHAR5.                                  
      @782    DX28                     $CHAR5.                                  
      @787    DX29                     $CHAR5.                                  
      @792    DX30                     $CHAR5.                                  
      @797    DX31                     $CHAR5.                                  
      @802    DX32                     $CHAR5.                                  
      @807    DX33                     $CHAR5.                                  
      @812    DX34                     $CHAR5.                                  
      @817    DX35                     $CHAR5.                                  
      @822    DX36                     $CHAR5.                                  
      @827    DX37                     $CHAR5.                                  
      @832    DX38                     $CHAR5.                                  
      @837    DX39                     $CHAR5.                                  
      @842    DX40                     $CHAR5.                                  
      @847    DX41                     $CHAR5.                                  
      @852    DX42                     $CHAR5.                                  
      @857    DX43                     $CHAR5.                                  
      @862    DX44                     $CHAR5.                                  
      @867    DX45                     $CHAR5.                                  
      @872    DX46                     $CHAR5.                                  
      @877    DX47                     $CHAR5.                                  
      @882    DX48                     $CHAR5.                                  
      @887    DX49                     $CHAR5.                                  
      @892    DX50                     $CHAR5.                                  
      @897    DXCCS1                   N4PF.                                    
      @901    DXCCS2                   N4PF.                                    
      @905    DXCCS3                   N4PF.                                    
      @909    DXCCS4                   N4PF.                                    
      @913    DXCCS5                   N4PF.                                    
      @917    DXCCS6                   N4PF.                                    
      @921    DXCCS7                   N4PF.                                    
      @925    DXCCS8                   N4PF.                                    
      @929    DXCCS9                   N4PF.                                    
      @933    DXCCS10                  N4PF.                                    
      @937    DXCCS11                  N4PF.                                    
      @941    DXCCS12                  N4PF.                                    
      @945    DXCCS13                  N4PF.                                    
      @949    DXCCS14                  N4PF.                                    
      @953    DXCCS15                  N4PF.                                    
      @957    DXCCS16                  N4PF.                                    
      @961    DXCCS17                  N4PF.                                    
      @965    DXCCS18                  N4PF.                                    
      @969    DXCCS19                  N4PF.                                    
      @973    DXCCS20                  N4PF.                                    
      @977    DXCCS21                  N4PF.                                    
      @981    DXCCS22                  N4PF.                                    
      @985    DXCCS23                  N4PF.                                    
      @989    DXCCS24                  N4PF.                                    
      @993    DXCCS25                  N4PF.                                    
      @997    DXCCS26                  N4PF.                                    
      @1001   DXCCS27                  N4PF.                                    
      @1005   DXCCS28                  N4PF.                                    
      @1009   DXCCS29                  N4PF.                                    
      @1013   DXCCS30                  N4PF.                                    
      @1017   DXCCS31                  N4PF.                                    
      @1021   DXCCS32                  N4PF.                                    
      @1025   DXCCS33                  N4PF.                                    
      @1029   DXCCS34                  N4PF.                                    
      @1033   DXCCS35                  N4PF.                                    
      @1037   DXCCS36                  N4PF.                                    
      @1041   DXCCS37                  N4PF.                                    
      @1045   DXCCS38                  N4PF.                                    
      @1049   DXCCS39                  N4PF.                                    
      @1053   DXCCS40                  N4PF.                                    
      @1057   DXCCS41                  N4PF.                                    
      @1061   DXCCS42                  N4PF.                                    
      @1065   DXCCS43                  N4PF.                                    
      @1069   DXCCS44                  N4PF.                                    
      @1073   DXCCS45                  N4PF.                                    
      @1077   DXCCS46                  N4PF.                                    
      @1081   DXCCS47                  N4PF.                                    
      @1085   DXCCS48                  N4PF.                                    
      @1089   DXCCS49                  N4PF.                                    
      @1093   DXCCS50                  N4PF.                                    
      @1097   DX_Visit_Reason1         $CHAR5.                                  
      @1102   DX_Visit_Reason2         $CHAR5.                                  
      @1107   DX_Visit_Reason3         $CHAR5.                                  
      @1112   ECODE1                   $CHAR5.                                  
      @1117   ECODE2                   $CHAR5.                                  
      @1122   ECODE3                   $CHAR5.                                  
      @1127   ECODE4                   $CHAR5.                                  
      @1132   ECODE5                   $CHAR5.                                  
      @1137   ECODE6                   $CHAR5.                                  
      @1142   ECODE7                   $CHAR5.                                  
      @1147   ECODE8                   $CHAR5.                                  
      @1152   ECODE9                   $CHAR5.                                  
      @1157   E_CCS1                   N4PF.                                    
      @1161   E_CCS2                   N4PF.                                    
      @1165   E_CCS3                   N4PF.                                    
      @1169   E_CCS4                   N4PF.                                    
      @1173   E_CCS5                   N4PF.                                    
      @1177   E_CCS6                   N4PF.                                    
      @1181   E_CCS7                   N4PF.                                    
      @1185   E_CCS8                   N4PF.                                    
      @1189   E_CCS9                   N4PF.                                    
      @1193   FEMALE                   N2PF.                                    
      @1195   HCUP_ED                  N2PF.                                    
      @1197   HCUP_OS                  N2PF.                                    
      @1199   HISPANIC_X               $CHAR1.                                  
      @1200   HOSPBRTH                 N3PF.                                    
      @1203   HOSPST                   $CHAR2.                                  
      @1205   HOSP_NPI                 $CHAR10.                                 
      @1215   Homeless                 N2PF.                                    
      @1217   KEY                      15.                                      
      @1232   LOS                      N5PF.                                    
      @1237   LOS_X                    N6PF.                                    
      @1243   MDSPEC1                  $CHAR3.                                  
      @1246   MDSPEC2                  $CHAR3.                                  
      @1249   MEDINCSTQ                N2PF.                                    
      @1251   MRN_R                    N9PF.                                    
      @1260   NCHRONIC                 N3PF.                                    
      @1263   NCPT                     N3PF.                                    
      @1266   NDX                      N2PF.                                    
      @1268   NECODE                   N2PF.                                    
      @1270   NEOMAT                   N2PF.                                    
      @1272   NPR                      N2PF.                                    
      @1274   ORPROC                   N2PF.                                    
      @1276   OS_TIME                  N8PF.                                    
      @1284   PAY1                     N2PF.                                    
      @1286   PAY1_X                   $CHAR5.                                  
      @1291   PAY2                     N2PF.                                    
      @1293   PAY2_X                   $CHAR5.                                  
      @1298   PL_CBSA                  N3PF.                                    
      @1301   PL_MSA1993               N3PF.                                    
      @1304   PL_NCHS2006              N2PF.                                    
      @1306   PL_RUCA10_2005           N2PF.                                    
      @1308   PL_RUCA2005              N4P1F.                                   
      @1312   PL_RUCA4_2005            N2PF.                                    
      @1314   PL_RUCC2003              N2PF.                                    
      @1316   PL_UIC2003               N2PF.                                    
      @1318   PL_UR_CAT4               N2PF.                                    
      @1320   PR1                      $CHAR4.                                  
      @1324   PR2                      $CHAR4.                                  
      @1328   PR3                      $CHAR4.                                  
      @1332   PR4                      $CHAR4.                                  
      @1336   PR5                      $CHAR4.                                  
      @1340   PR6                      $CHAR4.                                  
      @1344   PR7                      $CHAR4.                                  
      @1348   PR8                      $CHAR4.                                  
      @1352   PR9                      $CHAR4.                                  
      @1356   PR10                     $CHAR4.                                  
      @1360   PR11                     $CHAR4.                                  
      @1364   PR12                     $CHAR4.                                  
      @1368   PR13                     $CHAR4.                                  
      @1372   PR14                     $CHAR4.                                  
      @1376   PR15                     $CHAR4.                                  
      @1380   PR16                     $CHAR4.                                  
      @1384   PR17                     $CHAR4.                                  
      @1388   PR18                     $CHAR4.                                  
      @1392   PR19                     $CHAR4.                                  
      @1396   PR20                     $CHAR4.                                  
      @1400   PR21                     $CHAR4.                                  
      @1404   PR22                     $CHAR4.                                  
      @1408   PR23                     $CHAR4.                                  
      @1412   PR24                     $CHAR4.                                  
      @1416   PR25                     $CHAR4.                                  
      @1420   PR26                     $CHAR4.                                  
      @1424   PR27                     $CHAR4.                                  
      @1428   PR28                     $CHAR4.                                  
      @1432   PR29                     $CHAR4.                                  
      @1436   PR30                     $CHAR4.                                  
      @1440   PR31                     $CHAR4.                                  
      @1444   PR32                     $CHAR4.                                  
      @1448   PR33                     $CHAR4.                                  
      @1452   PR34                     $CHAR4.                                  
      @1456   PR35                     $CHAR4.                                  
      @1460   PR36                     $CHAR4.                                  
      @1464   PR37                     $CHAR4.                                  
      @1468   PR38                     $CHAR4.                                  
      @1472   PR39                     $CHAR4.                                  
      @1476   PR40                     $CHAR4.                                  
      @1480   PR41                     $CHAR4.                                  
      @1484   PR42                     $CHAR4.                                  
      @1488   PR43                     $CHAR4.                                  
      @1492   PR44                     $CHAR4.                                  
      @1496   PR45                     $CHAR4.                                  
      @1500   PR46                     $CHAR4.                                  
      @1504   PR47                     $CHAR4.                                  
      @1508   PR48                     $CHAR4.                                  
      @1512   PR49                     $CHAR4.                                  
      @1516   PR50                     $CHAR4.                                  
      @1520   PRCCS1                   N3PF.                                    
      @1523   PRCCS2                   N3PF.                                    
      @1526   PRCCS3                   N3PF.                                    
      @1529   PRCCS4                   N3PF.                                    
      @1532   PRCCS5                   N3PF.                                    
      @1535   PRCCS6                   N3PF.                                    
      @1538   PRCCS7                   N3PF.                                    
      @1541   PRCCS8                   N3PF.                                    
      @1544   PRCCS9                   N3PF.                                    
      @1547   PRCCS10                  N3PF.                                    
      @1550   PRCCS11                  N3PF.                                    
      @1553   PRCCS12                  N3PF.                                    
      @1556   PRCCS13                  N3PF.                                    
      @1559   PRCCS14                  N3PF.                                    
      @1562   PRCCS15                  N3PF.                                    
      @1565   PRCCS16                  N3PF.                                    
      @1568   PRCCS17                  N3PF.                                    
      @1571   PRCCS18                  N3PF.                                    
      @1574   PRCCS19                  N3PF.                                    
      @1577   PRCCS20                  N3PF.                                    
      @1580   PRCCS21                  N3PF.                                    
      @1583   PRCCS22                  N3PF.                                    
      @1586   PRCCS23                  N3PF.                                    
      @1589   PRCCS24                  N3PF.                                    
      @1592   PRCCS25                  N3PF.                                    
      @1595   PRCCS26                  N3PF.                                    
      @1598   PRCCS27                  N3PF.                                    
      @1601   PRCCS28                  N3PF.                                    
      @1604   PRCCS29                  N3PF.                                    
      @1607   PRCCS30                  N3PF.                                    
      @1610   PRCCS31                  N3PF.                                    
      @1613   PRCCS32                  N3PF.                                    
      @1616   PRCCS33                  N3PF.                                    
      @1619   PRCCS34                  N3PF.                                    
      @1622   PRCCS35                  N3PF.                                    
      @1625   PRCCS36                  N3PF.                                    
      @1628   PRCCS37                  N3PF.                                    
      @1631   PRCCS38                  N3PF.                                    
      @1634   PRCCS39                  N3PF.                                    
      @1637   PRCCS40                  N3PF.                                    
      @1640   PRCCS41                  N3PF.                                    
      @1643   PRCCS42                  N3PF.                                    
      @1646   PRCCS43                  N3PF.                                    
      @1649   PRCCS44                  N3PF.                                    
      @1652   PRCCS45                  N3PF.                                    
      @1655   PRCCS46                  N3PF.                                    
      @1658   PRCCS47                  N3PF.                                    
      @1661   PRCCS48                  N3PF.                                    
      @1664   PRCCS49                  N3PF.                                    
      @1667   PRCCS50                  N3PF.                                    
      @1670   PRDAY1                   N5PF.                                    
      @1675   PROCTYPE                 N3PF.                                    
      @1678   PSTATE                   $CHAR2.                                  
      @1680   PSTCO2                   N5PF.                                    
      @1685   PointOfOriginUB04        $CHAR1.                                  
      @1686   PointOfOrigin_X          $CHAR1.                                  
      @1687   RACE                     N2PF.                                    
      @1689   RACE_X                   $CHAR1.                                  
      @1690   STATE_AS                 N2PF.                                    
      @1692   STATE_ED                 N2PF.                                    
      @1694   STATE_OS                 N2PF.                                    
      @1696   TOTCHG                   N10PF.                                   
      @1706   TOTCHG_X                 N15P2F.                                  
      @1721   YEAR                     N4PF.                                    
      @1725   ZIP3                     $CHAR3.                                  
      @1728   ZIPINC_QRTL              N3PF.                                    
      @1731   ZIP                      $CHAR5.                                  
      @1736   AYEAR                    N4PF.                                    
      @1740   DMONTH                   N2PF.                                    
      @1742   BMONTH                   N2PF.                                    
      @1744   BYEAR                    N4PF.                                    
      @1748   PRMONTH1                 N2PF.                                    
      @1750   PRYEAR1                  N4PF.                                    
      ;                                                                         
                                                                                
                                                                                
RUN;
