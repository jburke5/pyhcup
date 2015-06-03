/*******************************************************************            
*   MD_SEDD_2001_CORE.SAS:                                                      
*      THE SAS CODE SHOWN BELOW WILL LOAD THE ASCII                             
*      EMERGENCY DEPARTMENT CORE FILE INTO SAS                                        
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
DATA MD_SEDDC_2001_CORE;                                                        
INFILE 'MD_SEDD_2001_CORE.ASC' LRECL = 552;                                     
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  KEY                LENGTH=8          FORMAT=Z14.                              
  LABEL="HCUP record identifier"                                                
                                                                                
  AGE                LENGTH=3                                                   
  LABEL="Age in years at admission"                                             
                                                                                
  AGEDAY             LENGTH=3                                                   
  LABEL="Age in days (when age < 1 year)"                                       
                                                                                
  AGEMONTH           LENGTH=3                                                   
  LABEL="Age in months (when age < 11 years)"                                   
                                                                                
  AWEEKEND           LENGTH=3                                                   
  LABEL="Admission day is a weekend"                                            
                                                                                
  CPT1               LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 1"                                            
                                                                                
  CPT2               LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 2"                                            
                                                                                
  CPT3               LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 3"                                            
                                                                                
  CPT4               LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 4"                                            
                                                                                
  CPT5               LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 5"                                            
                                                                                
  CPT6               LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 6"                                            
                                                                                
  CPT7               LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 7"                                            
                                                                                
  CPT8               LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 8"                                            
                                                                                
  CPT9               LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 9"                                            
                                                                                
  CPT10              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 10"                                           
                                                                                
  CPT11              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 11"                                           
                                                                                
  CPT12              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 12"                                           
                                                                                
  CPT13              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 13"                                           
                                                                                
  CPT14              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 14"                                           
                                                                                
  CPT15              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 15"                                           
                                                                                
  CPT16              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 16"                                           
                                                                                
  CPT17              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 17"                                           
                                                                                
  CPT18              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 18"                                           
                                                                                
  CPT19              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 19"                                           
                                                                                
  CPT20              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 20"                                           
                                                                                
  CPT21              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 21"                                           
                                                                                
  CPT22              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 22"                                           
                                                                                
  CPT23              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 23"                                           
                                                                                
  CPT24              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 24"                                           
                                                                                
  CPT25              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 25"                                           
                                                                                
  CPT26              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 26"                                           
                                                                                
  CPT27              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 27"                                           
                                                                                
  CPT28              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 28"                                           
                                                                                
  CPT29              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 29"                                           
                                                                                
  CPT30              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 30"                                           
                                                                                
  CPT31              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 31"                                           
                                                                                
  CPT32              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 32"                                           
                                                                                
  CPT33              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 33"                                           
                                                                                
  CPT34              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 34"                                           
                                                                                
  CPT35              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 35"                                           
                                                                                
  CPT36              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 36"                                           
                                                                                
  CPT37              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 37"                                           
                                                                                
  CPT38              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 38"                                           
                                                                                
  CPT39              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 39"                                           
                                                                                
  CPT40              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 40"                                           
                                                                                
  CPT41              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 41"                                           
                                                                                
  CPT42              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 42"                                           
                                                                                
  CPT43              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 43"                                           
                                                                                
  CPT44              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 44"                                           
                                                                                
  CPT45              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 45"                                           
                                                                                
  CPT46              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 46"                                           
                                                                                
  CPT47              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 47"                                           
                                                                                
  CPT48              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 48"                                           
                                                                                
  CPT49              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 49"                                           
                                                                                
  CPT50              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 50"                                           
                                                                                
  CPT51              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 51"                                           
                                                                                
  CPT52              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 52"                                           
                                                                                
  CPT53              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 53"                                           
                                                                                
  CPT54              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 54"                                           
                                                                                
  CPT55              LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 55"                                           
                                                                                
  DQTR               LENGTH=3                                                   
  LABEL="Discharge quarter"                                                     
                                                                                
  DSHOSPID           LENGTH=$13                                                 
  LABEL="Data source hospital identifier"                                       
                                                                                
  DX1                LENGTH=$5                                                  
  LABEL="Principal diagnosis"                                                   
                                                                                
  DX2                LENGTH=$5                                                  
  LABEL="Diagnosis 2"                                                           
                                                                                
  DX3                LENGTH=$5                                                  
  LABEL="Diagnosis 3"                                                           
                                                                                
  DX4                LENGTH=$5                                                  
  LABEL="Diagnosis 4"                                                           
                                                                                
  DX5                LENGTH=$5                                                  
  LABEL="Diagnosis 5"                                                           
                                                                                
  DX6                LENGTH=$5                                                  
  LABEL="Diagnosis 6"                                                           
                                                                                
  DX7                LENGTH=$5                                                  
  LABEL="Diagnosis 7"                                                           
                                                                                
  DX8                LENGTH=$5                                                  
  LABEL="Diagnosis 8"                                                           
                                                                                
  DX9                LENGTH=$5                                                  
  LABEL="Diagnosis 9"                                                           
                                                                                
  DX10               LENGTH=$5                                                  
  LABEL="Diagnosis 10"                                                          
                                                                                
  DX11               LENGTH=$5                                                  
  LABEL="Diagnosis 11"                                                          
                                                                                
  DX12               LENGTH=$5                                                  
  LABEL="Diagnosis 12"                                                          
                                                                                
  DX13               LENGTH=$5                                                  
  LABEL="Diagnosis 13"                                                          
                                                                                
  DX14               LENGTH=$5                                                  
  LABEL="Diagnosis 14"                                                          
                                                                                
  DX15               LENGTH=$5                                                  
  LABEL="Diagnosis 15"                                                          
                                                                                
  DX16               LENGTH=$5                                                  
  LABEL="Diagnosis 16"                                                          
                                                                                
  DX17               LENGTH=$5                                                  
  LABEL="Diagnosis 17"                                                          
                                                                                
  DXCCS1             LENGTH=4                                                   
  LABEL="CCS: principal diagnosis"                                              
                                                                                
  DXCCS2             LENGTH=4                                                   
  LABEL="CCS: diagnosis 2"                                                      
                                                                                
  DXCCS3             LENGTH=4                                                   
  LABEL="CCS: diagnosis 3"                                                      
                                                                                
  DXCCS4             LENGTH=4                                                   
  LABEL="CCS: diagnosis 4"                                                      
                                                                                
  DXCCS5             LENGTH=4                                                   
  LABEL="CCS: diagnosis 5"                                                      
                                                                                
  DXCCS6             LENGTH=4                                                   
  LABEL="CCS: diagnosis 6"                                                      
                                                                                
  DXCCS7             LENGTH=4                                                   
  LABEL="CCS: diagnosis 7"                                                      
                                                                                
  DXCCS8             LENGTH=4                                                   
  LABEL="CCS: diagnosis 8"                                                      
                                                                                
  DXCCS9             LENGTH=4                                                   
  LABEL="CCS: diagnosis 9"                                                      
                                                                                
  DXCCS10            LENGTH=4                                                   
  LABEL="CCS: diagnosis 10"                                                     
                                                                                
  DXCCS11            LENGTH=4                                                   
  LABEL="CCS: diagnosis 11"                                                     
                                                                                
  DXCCS12            LENGTH=4                                                   
  LABEL="CCS: diagnosis 12"                                                     
                                                                                
  DXCCS13            LENGTH=4                                                   
  LABEL="CCS: diagnosis 13"                                                     
                                                                                
  DXCCS14            LENGTH=4                                                   
  LABEL="CCS: diagnosis 14"                                                     
                                                                                
  DXCCS15            LENGTH=4                                                   
  LABEL="CCS: diagnosis 15"                                                     
                                                                                
  DXCCS16            LENGTH=4                                                   
  LABEL="CCS: diagnosis 16"                                                     
                                                                                
  DXCCS17            LENGTH=4                                                   
  LABEL="CCS: diagnosis 17"                                                     
                                                                                
  FEMALE             LENGTH=3                                                   
  LABEL="Indicator of sex"                                                      
                                                                                
  HOSPST             LENGTH=$2                                                  
  LABEL="Hospital state postal code"                                            
                                                                                
  LOS                LENGTH=4                                                   
  LABEL="Length of stay (cleaned)"                                              
                                                                                
  LOS_X              LENGTH=4                                                   
  LABEL="Length of stay (as received from source)"                              
                                                                                
  MRN_S              LENGTH=$18                                                 
  LABEL="Medical record number (synthetic)"                                     
                                                                                
  NCPT               LENGTH=3                                                   
  LABEL="Number of CPT/HCPCS procedures on this record"                         
                                                                                
  NDX                LENGTH=3                                                   
  LABEL="Number of diagnoses on this record"                                    
                                                                                
  NEOMAT             LENGTH=3                                                   
  LABEL="Neonatal and/or maternal DX and/or PR"                                 
                                                                                
  PAY1               LENGTH=3                                                   
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PAY2               LENGTH=3                                                   
  LABEL="Secondary expected payer (uniform)"                                    
                                                                                
  PAY1_X             LENGTH=$2                                                  
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PAY2_X             LENGTH=$2                                                  
  LABEL="Secondary expected payer (as received from source)"                    
                                                                                
  PSTCO              LENGTH=4                                                   
  LABEL="Patient state/county FIPS code"                                        
                                                                                
  RACE               LENGTH=3                                                   
  LABEL="Race (uniform)"                                                        
                                                                                
  RACE_X             LENGTH=$1                                                  
  LABEL="Race (as received from source)"                                        
                                                                                
  TOTCHG             LENGTH=6                                                   
  LABEL="Total charges (cleaned)"                                               
                                                                                
  TOTCHG_X           LENGTH=7                                                   
  LABEL="Total charges (as received from source)"                               
                                                                                
  YEAR               LENGTH=3                                                   
  LABEL="Calendar year"                                                         
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      KEY                 14.                                           
      @15     AGE                 N3PF.                                         
      @18     AGEDAY              N3PF.                                         
      @21     AGEMONTH            N3PF.                                         
      @24     AWEEKEND            N2PF.                                         
      @26     CPT1                $CHAR5.                                       
      @31     CPT2                $CHAR5.                                       
      @36     CPT3                $CHAR5.                                       
      @41     CPT4                $CHAR5.                                       
      @46     CPT5                $CHAR5.                                       
      @51     CPT6                $CHAR5.                                       
      @56     CPT7                $CHAR5.                                       
      @61     CPT8                $CHAR5.                                       
      @66     CPT9                $CHAR5.                                       
      @71     CPT10               $CHAR5.                                       
      @76     CPT11               $CHAR5.                                       
      @81     CPT12               $CHAR5.                                       
      @86     CPT13               $CHAR5.                                       
      @91     CPT14               $CHAR5.                                       
      @96     CPT15               $CHAR5.                                       
      @101    CPT16               $CHAR5.                                       
      @106    CPT17               $CHAR5.                                       
      @111    CPT18               $CHAR5.                                       
      @116    CPT19               $CHAR5.                                       
      @121    CPT20               $CHAR5.                                       
      @126    CPT21               $CHAR5.                                       
      @131    CPT22               $CHAR5.                                       
      @136    CPT23               $CHAR5.                                       
      @141    CPT24               $CHAR5.                                       
      @146    CPT25               $CHAR5.                                       
      @151    CPT26               $CHAR5.                                       
      @156    CPT27               $CHAR5.                                       
      @161    CPT28               $CHAR5.                                       
      @166    CPT29               $CHAR5.                                       
      @171    CPT30               $CHAR5.                                       
      @176    CPT31               $CHAR5.                                       
      @181    CPT32               $CHAR5.                                       
      @186    CPT33               $CHAR5.                                       
      @191    CPT34               $CHAR5.                                       
      @196    CPT35               $CHAR5.                                       
      @201    CPT36               $CHAR5.                                       
      @206    CPT37               $CHAR5.                                       
      @211    CPT38               $CHAR5.                                       
      @216    CPT39               $CHAR5.                                       
      @221    CPT40               $CHAR5.                                       
      @226    CPT41               $CHAR5.                                       
      @231    CPT42               $CHAR5.                                       
      @236    CPT43               $CHAR5.                                       
      @241    CPT44               $CHAR5.                                       
      @246    CPT45               $CHAR5.                                       
      @251    CPT46               $CHAR5.                                       
      @256    CPT47               $CHAR5.                                       
      @261    CPT48               $CHAR5.                                       
      @266    CPT49               $CHAR5.                                       
      @271    CPT50               $CHAR5.                                       
      @276    CPT51               $CHAR5.                                       
      @281    CPT52               $CHAR5.                                       
      @286    CPT53               $CHAR5.                                       
      @291    CPT54               $CHAR5.                                       
      @296    CPT55               $CHAR5.                                       
      @301    DQTR                N2PF.                                         
      @303    DSHOSPID            $CHAR13.                                      
      @316    DX1                 $CHAR5.                                       
      @321    DX2                 $CHAR5.                                       
      @326    DX3                 $CHAR5.                                       
      @331    DX4                 $CHAR5.                                       
      @336    DX5                 $CHAR5.                                       
      @341    DX6                 $CHAR5.                                       
      @346    DX7                 $CHAR5.                                       
      @351    DX8                 $CHAR5.                                       
      @356    DX9                 $CHAR5.                                       
      @361    DX10                $CHAR5.                                       
      @366    DX11                $CHAR5.                                       
      @371    DX12                $CHAR5.                                       
      @376    DX13                $CHAR5.                                       
      @381    DX14                $CHAR5.                                       
      @386    DX15                $CHAR5.                                       
      @391    DX16                $CHAR5.                                       
      @396    DX17                $CHAR5.                                       
      @401    DXCCS1              N4PF.                                         
      @405    DXCCS2              N4PF.                                         
      @409    DXCCS3              N4PF.                                         
      @413    DXCCS4              N4PF.                                         
      @417    DXCCS5              N4PF.                                         
      @421    DXCCS6              N4PF.                                         
      @425    DXCCS7              N4PF.                                         
      @429    DXCCS8              N4PF.                                         
      @433    DXCCS9              N4PF.                                         
      @437    DXCCS10             N4PF.                                         
      @441    DXCCS11             N4PF.                                         
      @445    DXCCS12             N4PF.                                         
      @449    DXCCS13             N4PF.                                         
      @453    DXCCS14             N4PF.                                         
      @457    DXCCS15             N4PF.                                         
      @461    DXCCS16             N4PF.                                         
      @465    DXCCS17             N4PF.                                         
      @469    FEMALE              N2PF.                                         
      @471    HOSPST              $CHAR2.                                       
      @473    LOS                 N5PF.                                         
      @478    LOS_X               N6PF.                                         
      @484    MRN_S               $CHAR18.                                      
      @502    NCPT                N2PF.                                         
      @504    NDX                 N2PF.                                         
      @506    NEOMAT              N2PF.                                         
      @508    PAY1                N2PF.                                         
      @510    PAY2                N2PF.                                         
      @512    PAY1_X              $CHAR2.                                       
      @514    PAY2_X              $CHAR2.                                       
      @516    PSTCO               N5PF.                                         
      @521    RACE                N2PF.                                         
      @523    RACE_X              $CHAR1.                                       
      @524    TOTCHG              N10PF.                                        
      @534    TOTCHG_X            N15P2F.                                       
      @549    YEAR                N4PF.                                         
      ;                                                                         
                                                                                
                                                                                
RUN;
