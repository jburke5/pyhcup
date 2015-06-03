/*******************************************************************            
*   IA_SASD_2012_CORE.SAS:                                                      
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
DATA IA_SASDC_2012_CORE;                                                        
INFILE 'IA_SASD_2012_CORE.ASC' LRECL = 1535;                                    
                                                                                
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
                                                                                
  CPTDAY1                    LENGTH=4                                           
  LABEL="Number of days from admission to CPT1"                                 
                                                                                
  CPTDAY2                    LENGTH=4                                           
  LABEL="Number of days from admission to CPT2"                                 
                                                                                
  CPTDAY3                    LENGTH=4                                           
  LABEL="Number of days from admission to CPT3"                                 
                                                                                
  CPTDAY4                    LENGTH=4                                           
  LABEL="Number of days from admission to CPT4"                                 
                                                                                
  CPTDAY5                    LENGTH=4                                           
  LABEL="Number of days from admission to CPT5"                                 
                                                                                
  CPTDAY6                    LENGTH=4                                           
  LABEL="Number of days from admission to CPT6"                                 
                                                                                
  CPTDAY7                    LENGTH=4                                           
  LABEL="Number of days from admission to CPT7"                                 
                                                                                
  CPTDAY8                    LENGTH=4                                           
  LABEL="Number of days from admission to CPT8"                                 
                                                                                
  CPTDAY9                    LENGTH=4                                           
  LABEL="Number of days from admission to CPT9"                                 
                                                                                
  CPTDAY10                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT10"                                
                                                                                
  CPTDAY11                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT11"                                
                                                                                
  CPTDAY12                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT12"                                
                                                                                
  CPTDAY13                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT13"                                
                                                                                
  CPTDAY14                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT14"                                
                                                                                
  CPTDAY15                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT15"                                
                                                                                
  CPTDAY16                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT16"                                
                                                                                
  CPTDAY17                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT17"                                
                                                                                
  CPTDAY18                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT18"                                
                                                                                
  CPTDAY19                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT19"                                
                                                                                
  CPTDAY20                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT20"                                
                                                                                
  CPTDAY21                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT21"                                
                                                                                
  CPTDAY22                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT22"                                
                                                                                
  CPTDAY23                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT23"                                
                                                                                
  CPTDAY24                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT24"                                
                                                                                
  CPTDAY25                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT25"                                
                                                                                
  CPTDAY26                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT26"                                
                                                                                
  CPTDAY27                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT27"                                
                                                                                
  CPTDAY28                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT28"                                
                                                                                
  CPTDAY29                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT29"                                
                                                                                
  CPTDAY30                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT30"                                
                                                                                
  CPTDAY31                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT31"                                
                                                                                
  CPTDAY32                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT32"                                
                                                                                
  CPTDAY33                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT33"                                
                                                                                
  CPTDAY34                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT34"                                
                                                                                
  CPTDAY35                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT35"                                
                                                                                
  CPTDAY36                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT36"                                
                                                                                
  CPTDAY37                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT37"                                
                                                                                
  CPTDAY38                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT38"                                
                                                                                
  CPTDAY39                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT39"                                
                                                                                
  CPTDAY40                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT40"                                
                                                                                
  CPTDAY41                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT41"                                
                                                                                
  CPTDAY42                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT42"                                
                                                                                
  CPTDAY43                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT43"                                
                                                                                
  CPTDAY44                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT44"                                
                                                                                
  CPTDAY45                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT45"                                
                                                                                
  CPTDAY46                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT46"                                
                                                                                
  CPTDAY47                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT47"                                
                                                                                
  CPTDAY48                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT48"                                
                                                                                
  CPTDAY49                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT49"                                
                                                                                
  CPTDAY50                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT50"                                
                                                                                
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
                                                                                
  DX_Visit_Reason1           LENGTH=$5                                          
  LABEL="Reason for visit diagnosis 1"                                          
                                                                                
  DX_Visit_Reason2           LENGTH=$5                                          
  LABEL="Reason for visit diagnosis 2"                                          
                                                                                
  DX_Visit_Reason3           LENGTH=$5                                          
  LABEL="Reason for visit diagnosis 3"                                          
                                                                                
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
                                                                                
  NCPT                       LENGTH=3                                           
  LABEL="Number of CPT/HCPCS procedures on this record"                         
                                                                                
  NDX                        LENGTH=3                                           
  LABEL="Number of diagnoses on this record"                                    
                                                                                
  NECODE                     LENGTH=3                                           
  LABEL="Number of E codes on this record"                                      
                                                                                
  NEOMAT                     LENGTH=3                                           
  LABEL="Neonatal and/or maternal DX and/or PR"                                 
                                                                                
  OS_TIME                    LENGTH=4                                           
  LABEL="Observation stay time summed from UNITS"                               
                                                                                
  PAY1                       LENGTH=3                                           
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PAY1_X                     LENGTH=$4                                          
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PAY2                       LENGTH=3                                           
  LABEL="Secondary expected payer (uniform)"                                    
                                                                                
  PAY2_X                     LENGTH=$4                                          
  LABEL="Secondary expected payer (as received from source)"                    
                                                                                
  PAY3                       LENGTH=3                                           
  LABEL="Tertiary expected payer (uniform)"                                     
                                                                                
  PAY3_X                     LENGTH=$4                                          
  LABEL="Tertiary expected payer (as received from source)"                     
                                                                                
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
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      AGE                      N3PF.                                    
      @4      AGEDAY                   N3PF.                                    
      @7      AGEMONTH                 N3PF.                                    
      @10     AMONTH                   N2PF.                                    
      @12     ATYPE                    N2PF.                                    
      @14     AWEEKEND                 N2PF.                                    
      @16     CPT1                     $CHAR5.                                  
      @21     CPT2                     $CHAR5.                                  
      @26     CPT3                     $CHAR5.                                  
      @31     CPT4                     $CHAR5.                                  
      @36     CPT5                     $CHAR5.                                  
      @41     CPT6                     $CHAR5.                                  
      @46     CPT7                     $CHAR5.                                  
      @51     CPT8                     $CHAR5.                                  
      @56     CPT9                     $CHAR5.                                  
      @61     CPT10                    $CHAR5.                                  
      @66     CPT11                    $CHAR5.                                  
      @71     CPT12                    $CHAR5.                                  
      @76     CPT13                    $CHAR5.                                  
      @81     CPT14                    $CHAR5.                                  
      @86     CPT15                    $CHAR5.                                  
      @91     CPT16                    $CHAR5.                                  
      @96     CPT17                    $CHAR5.                                  
      @101    CPT18                    $CHAR5.                                  
      @106    CPT19                    $CHAR5.                                  
      @111    CPT20                    $CHAR5.                                  
      @116    CPT21                    $CHAR5.                                  
      @121    CPT22                    $CHAR5.                                  
      @126    CPT23                    $CHAR5.                                  
      @131    CPT24                    $CHAR5.                                  
      @136    CPT25                    $CHAR5.                                  
      @141    CPT26                    $CHAR5.                                  
      @146    CPT27                    $CHAR5.                                  
      @151    CPT28                    $CHAR5.                                  
      @156    CPT29                    $CHAR5.                                  
      @161    CPT30                    $CHAR5.                                  
      @166    CPT31                    $CHAR5.                                  
      @171    CPT32                    $CHAR5.                                  
      @176    CPT33                    $CHAR5.                                  
      @181    CPT34                    $CHAR5.                                  
      @186    CPT35                    $CHAR5.                                  
      @191    CPT36                    $CHAR5.                                  
      @196    CPT37                    $CHAR5.                                  
      @201    CPT38                    $CHAR5.                                  
      @206    CPT39                    $CHAR5.                                  
      @211    CPT40                    $CHAR5.                                  
      @216    CPT41                    $CHAR5.                                  
      @221    CPT42                    $CHAR5.                                  
      @226    CPT43                    $CHAR5.                                  
      @231    CPT44                    $CHAR5.                                  
      @236    CPT45                    $CHAR5.                                  
      @241    CPT46                    $CHAR5.                                  
      @246    CPT47                    $CHAR5.                                  
      @251    CPT48                    $CHAR5.                                  
      @256    CPT49                    $CHAR5.                                  
      @261    CPT50                    $CHAR5.                                  
      @266    CPTCCS1                  N3PF.                                    
      @269    CPTCCS2                  N3PF.                                    
      @272    CPTCCS3                  N3PF.                                    
      @275    CPTCCS4                  N3PF.                                    
      @278    CPTCCS5                  N3PF.                                    
      @281    CPTCCS6                  N3PF.                                    
      @284    CPTCCS7                  N3PF.                                    
      @287    CPTCCS8                  N3PF.                                    
      @290    CPTCCS9                  N3PF.                                    
      @293    CPTCCS10                 N3PF.                                    
      @296    CPTCCS11                 N3PF.                                    
      @299    CPTCCS12                 N3PF.                                    
      @302    CPTCCS13                 N3PF.                                    
      @305    CPTCCS14                 N3PF.                                    
      @308    CPTCCS15                 N3PF.                                    
      @311    CPTCCS16                 N3PF.                                    
      @314    CPTCCS17                 N3PF.                                    
      @317    CPTCCS18                 N3PF.                                    
      @320    CPTCCS19                 N3PF.                                    
      @323    CPTCCS20                 N3PF.                                    
      @326    CPTCCS21                 N3PF.                                    
      @329    CPTCCS22                 N3PF.                                    
      @332    CPTCCS23                 N3PF.                                    
      @335    CPTCCS24                 N3PF.                                    
      @338    CPTCCS25                 N3PF.                                    
      @341    CPTCCS26                 N3PF.                                    
      @344    CPTCCS27                 N3PF.                                    
      @347    CPTCCS28                 N3PF.                                    
      @350    CPTCCS29                 N3PF.                                    
      @353    CPTCCS30                 N3PF.                                    
      @356    CPTCCS31                 N3PF.                                    
      @359    CPTCCS32                 N3PF.                                    
      @362    CPTCCS33                 N3PF.                                    
      @365    CPTCCS34                 N3PF.                                    
      @368    CPTCCS35                 N3PF.                                    
      @371    CPTCCS36                 N3PF.                                    
      @374    CPTCCS37                 N3PF.                                    
      @377    CPTCCS38                 N3PF.                                    
      @380    CPTCCS39                 N3PF.                                    
      @383    CPTCCS40                 N3PF.                                    
      @386    CPTCCS41                 N3PF.                                    
      @389    CPTCCS42                 N3PF.                                    
      @392    CPTCCS43                 N3PF.                                    
      @395    CPTCCS44                 N3PF.                                    
      @398    CPTCCS45                 N3PF.                                    
      @401    CPTCCS46                 N3PF.                                    
      @404    CPTCCS47                 N3PF.                                    
      @407    CPTCCS48                 N3PF.                                    
      @410    CPTCCS49                 N3PF.                                    
      @413    CPTCCS50                 N3PF.                                    
      @416    CPTDAY1                  N3PF.                                    
      @419    CPTDAY2                  N3PF.                                    
      @422    CPTDAY3                  N3PF.                                    
      @425    CPTDAY4                  N3PF.                                    
      @428    CPTDAY5                  N3PF.                                    
      @431    CPTDAY6                  N3PF.                                    
      @434    CPTDAY7                  N3PF.                                    
      @437    CPTDAY8                  N3PF.                                    
      @440    CPTDAY9                  N3PF.                                    
      @443    CPTDAY10                 N3PF.                                    
      @446    CPTDAY11                 N3PF.                                    
      @449    CPTDAY12                 N3PF.                                    
      @452    CPTDAY13                 N3PF.                                    
      @455    CPTDAY14                 N3PF.                                    
      @458    CPTDAY15                 N3PF.                                    
      @461    CPTDAY16                 N3PF.                                    
      @464    CPTDAY17                 N3PF.                                    
      @467    CPTDAY18                 N3PF.                                    
      @470    CPTDAY19                 N3PF.                                    
      @473    CPTDAY20                 N3PF.                                    
      @476    CPTDAY21                 N3PF.                                    
      @479    CPTDAY22                 N3PF.                                    
      @482    CPTDAY23                 N3PF.                                    
      @485    CPTDAY24                 N3PF.                                    
      @488    CPTDAY25                 N3PF.                                    
      @491    CPTDAY26                 N3PF.                                    
      @494    CPTDAY27                 N3PF.                                    
      @497    CPTDAY28                 N3PF.                                    
      @500    CPTDAY29                 N3PF.                                    
      @503    CPTDAY30                 N3PF.                                    
      @506    CPTDAY31                 N3PF.                                    
      @509    CPTDAY32                 N3PF.                                    
      @512    CPTDAY33                 N3PF.                                    
      @515    CPTDAY34                 N3PF.                                    
      @518    CPTDAY35                 N3PF.                                    
      @521    CPTDAY36                 N3PF.                                    
      @524    CPTDAY37                 N3PF.                                    
      @527    CPTDAY38                 N3PF.                                    
      @530    CPTDAY39                 N3PF.                                    
      @533    CPTDAY40                 N3PF.                                    
      @536    CPTDAY41                 N3PF.                                    
      @539    CPTDAY42                 N3PF.                                    
      @542    CPTDAY43                 N3PF.                                    
      @545    CPTDAY44                 N3PF.                                    
      @548    CPTDAY45                 N3PF.                                    
      @551    CPTDAY46                 N3PF.                                    
      @554    CPTDAY47                 N3PF.                                    
      @557    CPTDAY48                 N3PF.                                    
      @560    CPTDAY49                 N3PF.                                    
      @563    CPTDAY50                 N3PF.                                    
      @566    CPTM1_1                  $CHAR2.                                  
      @568    CPTM1_2                  $CHAR2.                                  
      @570    CPTM1_3                  $CHAR2.                                  
      @572    CPTM1_4                  $CHAR2.                                  
      @574    CPTM1_5                  $CHAR2.                                  
      @576    CPTM1_6                  $CHAR2.                                  
      @578    CPTM1_7                  $CHAR2.                                  
      @580    CPTM1_8                  $CHAR2.                                  
      @582    CPTM1_9                  $CHAR2.                                  
      @584    CPTM1_10                 $CHAR2.                                  
      @586    CPTM1_11                 $CHAR2.                                  
      @588    CPTM1_12                 $CHAR2.                                  
      @590    CPTM1_13                 $CHAR2.                                  
      @592    CPTM1_14                 $CHAR2.                                  
      @594    CPTM1_15                 $CHAR2.                                  
      @596    CPTM1_16                 $CHAR2.                                  
      @598    CPTM1_17                 $CHAR2.                                  
      @600    CPTM1_18                 $CHAR2.                                  
      @602    CPTM1_19                 $CHAR2.                                  
      @604    CPTM1_20                 $CHAR2.                                  
      @606    CPTM1_21                 $CHAR2.                                  
      @608    CPTM1_22                 $CHAR2.                                  
      @610    CPTM1_23                 $CHAR2.                                  
      @612    CPTM1_24                 $CHAR2.                                  
      @614    CPTM1_25                 $CHAR2.                                  
      @616    CPTM1_26                 $CHAR2.                                  
      @618    CPTM1_27                 $CHAR2.                                  
      @620    CPTM1_28                 $CHAR2.                                  
      @622    CPTM1_29                 $CHAR2.                                  
      @624    CPTM1_30                 $CHAR2.                                  
      @626    CPTM1_31                 $CHAR2.                                  
      @628    CPTM1_32                 $CHAR2.                                  
      @630    CPTM1_33                 $CHAR2.                                  
      @632    CPTM1_34                 $CHAR2.                                  
      @634    CPTM1_35                 $CHAR2.                                  
      @636    CPTM1_36                 $CHAR2.                                  
      @638    CPTM1_37                 $CHAR2.                                  
      @640    CPTM1_38                 $CHAR2.                                  
      @642    CPTM1_39                 $CHAR2.                                  
      @644    CPTM1_40                 $CHAR2.                                  
      @646    CPTM1_41                 $CHAR2.                                  
      @648    CPTM1_42                 $CHAR2.                                  
      @650    CPTM1_43                 $CHAR2.                                  
      @652    CPTM1_44                 $CHAR2.                                  
      @654    CPTM1_45                 $CHAR2.                                  
      @656    CPTM1_46                 $CHAR2.                                  
      @658    CPTM1_47                 $CHAR2.                                  
      @660    CPTM1_48                 $CHAR2.                                  
      @662    CPTM1_49                 $CHAR2.                                  
      @664    CPTM1_50                 $CHAR2.                                  
      @666    CPTM2_1                  $CHAR2.                                  
      @668    CPTM2_2                  $CHAR2.                                  
      @670    CPTM2_3                  $CHAR2.                                  
      @672    CPTM2_4                  $CHAR2.                                  
      @674    CPTM2_5                  $CHAR2.                                  
      @676    CPTM2_6                  $CHAR2.                                  
      @678    CPTM2_7                  $CHAR2.                                  
      @680    CPTM2_8                  $CHAR2.                                  
      @682    CPTM2_9                  $CHAR2.                                  
      @684    CPTM2_10                 $CHAR2.                                  
      @686    CPTM2_11                 $CHAR2.                                  
      @688    CPTM2_12                 $CHAR2.                                  
      @690    CPTM2_13                 $CHAR2.                                  
      @692    CPTM2_14                 $CHAR2.                                  
      @694    CPTM2_15                 $CHAR2.                                  
      @696    CPTM2_16                 $CHAR2.                                  
      @698    CPTM2_17                 $CHAR2.                                  
      @700    CPTM2_18                 $CHAR2.                                  
      @702    CPTM2_19                 $CHAR2.                                  
      @704    CPTM2_20                 $CHAR2.                                  
      @706    CPTM2_21                 $CHAR2.                                  
      @708    CPTM2_22                 $CHAR2.                                  
      @710    CPTM2_23                 $CHAR2.                                  
      @712    CPTM2_24                 $CHAR2.                                  
      @714    CPTM2_25                 $CHAR2.                                  
      @716    CPTM2_26                 $CHAR2.                                  
      @718    CPTM2_27                 $CHAR2.                                  
      @720    CPTM2_28                 $CHAR2.                                  
      @722    CPTM2_29                 $CHAR2.                                  
      @724    CPTM2_30                 $CHAR2.                                  
      @726    CPTM2_31                 $CHAR2.                                  
      @728    CPTM2_32                 $CHAR2.                                  
      @730    CPTM2_33                 $CHAR2.                                  
      @732    CPTM2_34                 $CHAR2.                                  
      @734    CPTM2_35                 $CHAR2.                                  
      @736    CPTM2_36                 $CHAR2.                                  
      @738    CPTM2_37                 $CHAR2.                                  
      @740    CPTM2_38                 $CHAR2.                                  
      @742    CPTM2_39                 $CHAR2.                                  
      @744    CPTM2_40                 $CHAR2.                                  
      @746    CPTM2_41                 $CHAR2.                                  
      @748    CPTM2_42                 $CHAR2.                                  
      @750    CPTM2_43                 $CHAR2.                                  
      @752    CPTM2_44                 $CHAR2.                                  
      @754    CPTM2_45                 $CHAR2.                                  
      @756    CPTM2_46                 $CHAR2.                                  
      @758    CPTM2_47                 $CHAR2.                                  
      @760    CPTM2_48                 $CHAR2.                                  
      @762    CPTM2_49                 $CHAR2.                                  
      @764    CPTM2_50                 $CHAR2.                                  
      @766    DIED                     N2PF.                                    
      @768    DISPUB04                 N2PF.                                    
      @770    DISPUNIFORM              N2PF.                                    
      @772    DISP_X                   $CHAR2.                                  
      @774    DQTR                     N2PF.                                    
      @776    DX1                      $CHAR5.                                  
      @781    DX2                      $CHAR5.                                  
      @786    DX3                      $CHAR5.                                  
      @791    DX4                      $CHAR5.                                  
      @796    DX5                      $CHAR5.                                  
      @801    DX6                      $CHAR5.                                  
      @806    DX7                      $CHAR5.                                  
      @811    DX8                      $CHAR5.                                  
      @816    DX9                      $CHAR5.                                  
      @821    DX10                     $CHAR5.                                  
      @826    DX11                     $CHAR5.                                  
      @831    DX12                     $CHAR5.                                  
      @836    DX13                     $CHAR5.                                  
      @841    DX14                     $CHAR5.                                  
      @846    DX15                     $CHAR5.                                  
      @851    DX16                     $CHAR5.                                  
      @856    DX17                     $CHAR5.                                  
      @861    DX18                     $CHAR5.                                  
      @866    DX19                     $CHAR5.                                  
      @871    DX20                     $CHAR5.                                  
      @876    DX21                     $CHAR5.                                  
      @881    DX22                     $CHAR5.                                  
      @886    DX23                     $CHAR5.                                  
      @891    DX24                     $CHAR5.                                  
      @896    DX25                     $CHAR5.                                  
      @901    DX26                     $CHAR5.                                  
      @906    DX27                     $CHAR5.                                  
      @911    DX28                     $CHAR5.                                  
      @916    DX29                     $CHAR5.                                  
      @921    DX30                     $CHAR5.                                  
      @926    DX31                     $CHAR5.                                  
      @931    DX32                     $CHAR5.                                  
      @936    DX33                     $CHAR5.                                  
      @941    DX34                     $CHAR5.                                  
      @946    DX35                     $CHAR5.                                  
      @951    DX36                     $CHAR5.                                  
      @956    DX37                     $CHAR5.                                  
      @961    DX38                     $CHAR5.                                  
      @966    DX39                     $CHAR5.                                  
      @971    DX40                     $CHAR5.                                  
      @976    DX41                     $CHAR5.                                  
      @981    DX42                     $CHAR5.                                  
      @986    DX43                     $CHAR5.                                  
      @991    DX44                     $CHAR5.                                  
      @996    DX45                     $CHAR5.                                  
      @1001   DX46                     $CHAR5.                                  
      @1006   DX47                     $CHAR5.                                  
      @1011   DX48                     $CHAR5.                                  
      @1016   DXCCS1                   N4PF.                                    
      @1020   DXCCS2                   N4PF.                                    
      @1024   DXCCS3                   N4PF.                                    
      @1028   DXCCS4                   N4PF.                                    
      @1032   DXCCS5                   N4PF.                                    
      @1036   DXCCS6                   N4PF.                                    
      @1040   DXCCS7                   N4PF.                                    
      @1044   DXCCS8                   N4PF.                                    
      @1048   DXCCS9                   N4PF.                                    
      @1052   DXCCS10                  N4PF.                                    
      @1056   DXCCS11                  N4PF.                                    
      @1060   DXCCS12                  N4PF.                                    
      @1064   DXCCS13                  N4PF.                                    
      @1068   DXCCS14                  N4PF.                                    
      @1072   DXCCS15                  N4PF.                                    
      @1076   DXCCS16                  N4PF.                                    
      @1080   DXCCS17                  N4PF.                                    
      @1084   DXCCS18                  N4PF.                                    
      @1088   DXCCS19                  N4PF.                                    
      @1092   DXCCS20                  N4PF.                                    
      @1096   DXCCS21                  N4PF.                                    
      @1100   DXCCS22                  N4PF.                                    
      @1104   DXCCS23                  N4PF.                                    
      @1108   DXCCS24                  N4PF.                                    
      @1112   DXCCS25                  N4PF.                                    
      @1116   DXCCS26                  N4PF.                                    
      @1120   DXCCS27                  N4PF.                                    
      @1124   DXCCS28                  N4PF.                                    
      @1128   DXCCS29                  N4PF.                                    
      @1132   DXCCS30                  N4PF.                                    
      @1136   DXCCS31                  N4PF.                                    
      @1140   DXCCS32                  N4PF.                                    
      @1144   DXCCS33                  N4PF.                                    
      @1148   DXCCS34                  N4PF.                                    
      @1152   DXCCS35                  N4PF.                                    
      @1156   DXCCS36                  N4PF.                                    
      @1160   DXCCS37                  N4PF.                                    
      @1164   DXCCS38                  N4PF.                                    
      @1168   DXCCS39                  N4PF.                                    
      @1172   DXCCS40                  N4PF.                                    
      @1176   DXCCS41                  N4PF.                                    
      @1180   DXCCS42                  N4PF.                                    
      @1184   DXCCS43                  N4PF.                                    
      @1188   DXCCS44                  N4PF.                                    
      @1192   DXCCS45                  N4PF.                                    
      @1196   DXCCS46                  N4PF.                                    
      @1200   DXCCS47                  N4PF.                                    
      @1204   DXCCS48                  N4PF.                                    
      @1208   DX_Visit_Reason1         $CHAR5.                                  
      @1213   DX_Visit_Reason2         $CHAR5.                                  
      @1218   DX_Visit_Reason3         $CHAR5.                                  
      @1223   DaysToEvent              N6PF.                                    
      @1229   ECODE1                   $CHAR5.                                  
      @1234   ECODE2                   $CHAR5.                                  
      @1239   ECODE3                   $CHAR5.                                  
      @1244   ECODE4                   $CHAR5.                                  
      @1249   ECODE5                   $CHAR5.                                  
      @1254   ECODE6                   $CHAR5.                                  
      @1259   ECODE7                   $CHAR5.                                  
      @1264   ECODE8                   $CHAR5.                                  
      @1269   E_CCS1                   N4PF.                                    
      @1273   E_CCS2                   N4PF.                                    
      @1277   E_CCS3                   N4PF.                                    
      @1281   E_CCS4                   N4PF.                                    
      @1285   E_CCS5                   N4PF.                                    
      @1289   E_CCS6                   N4PF.                                    
      @1293   E_CCS7                   N4PF.                                    
      @1297   E_CCS8                   N4PF.                                    
      @1301   FEMALE                   N2PF.                                    
      @1303   HCUP_ED                  N2PF.                                    
      @1305   HCUP_OS                  N2PF.                                    
      @1307   HISPANIC_X               $CHAR1.                                  
      @1308   HOSPBRTH                 N3PF.                                    
      @1311   HOSPST                   $CHAR2.                                  
      @1313   KEY                      15.                                      
      @1328   LOS                      N5PF.                                    
      @1333   LOS_X                    N6PF.                                    
      @1339   MDNUM1_R                 N9PF.                                    
      @1348   MDNUM2_R                 N9PF.                                    
      @1357   MDNUM3_R                 N9PF.                                    
      @1366   MEDINCSTQ                N2PF.                                    
      @1368   MRN_R                    N9PF.                                    
      @1377   NCHRONIC                 N3PF.                                    
      @1380   NCPT                     N3PF.                                    
      @1383   NDX                      N2PF.                                    
      @1385   NECODE                   N2PF.                                    
      @1387   NEOMAT                   N2PF.                                    
      @1389   OS_TIME                  N8PF.                                    
      @1397   PAY1                     N2PF.                                    
      @1399   PAY1_X                   $CHAR4.                                  
      @1403   PAY2                     N2PF.                                    
      @1405   PAY2_X                   $CHAR4.                                  
      @1409   PAY3                     N2PF.                                    
      @1411   PAY3_X                   $CHAR4.                                  
      @1415   PL_CBSA                  N3PF.                                    
      @1418   PL_MSA1993               N3PF.                                    
      @1421   PL_NCHS2006              N2PF.                                    
      @1423   PL_RUCA10_2005           N2PF.                                    
      @1425   PL_RUCA2005              N4P1F.                                   
      @1429   PL_RUCA4_2005            N2PF.                                    
      @1431   PL_RUCC2003              N2PF.                                    
      @1433   PL_UIC2003               N2PF.                                    
      @1435   PL_UR_CAT4               N2PF.                                    
      @1437   PNUM_R                   N9PF.                                    
      @1446   PROCTYPE                 N3PF.                                    
      @1449   PSTATE                   $CHAR2.                                  
      @1451   PSTCO                    N5PF.                                    
      @1456   PSTCO2                   N5PF.                                    
      @1461   PointOfOriginUB04        $CHAR1.                                  
      @1462   PointOfOrigin_X          $CHAR1.                                  
      @1463   RACE                     N2PF.                                    
      @1465   RACE_X                   $CHAR4.                                  
      @1469   STATE_AS                 N2PF.                                    
      @1471   STATE_ED                 N2PF.                                    
      @1473   STATE_OS                 N2PF.                                    
      @1475   TOTCHG                   N10PF.                                   
      @1485   TOTCHG_X                 N15P2F.                                  
      @1500   VisitLink                N9PF.                                    
      @1509   YEAR                     N4PF.                                    
      @1513   ZIP3                     $CHAR3.                                  
      @1516   ZIPINC_QRTL              N3PF.                                    
      @1519   ZIP                      $CHAR5.                                  
      @1524   AYEAR                    N4PF.                                    
      @1528   DMONTH                   N2PF.                                    
      @1530   BMONTH                   N2PF.                                    
      @1532   BYEAR                    N4PF.                                    
      ;                                                                         
                                                                                
                                                                                
RUN;
