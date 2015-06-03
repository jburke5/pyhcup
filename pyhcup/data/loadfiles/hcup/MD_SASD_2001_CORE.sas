/*******************************************************************            
*   MD_SASD_2001_CORE.SAS:                                                      
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
DATA MD_SASDC_2001_CORE;                                                        
INFILE 'MD_SASDC_2001_CORE.ASC' LRECL = 627;                                    
                                                                                
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
                                                                                
  DIED               LENGTH=3                                                   
  LABEL="Died during hospitalization"                                           
                                                                                
  DISP_X             LENGTH=$2                                                  
  LABEL="Disposition of patient (as received from source)"                      
                                                                                
  DISPUNIFORM        LENGTH=3                                                   
  LABEL="Disposition of patient (uniform)"                                      
                                                                                
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
                                                                                
  HISPANIC_X         LENGTH=$1                                                  
  LABEL="Hispanic ethnicity (as received from source)"                          
                                                                                
  HOSPST             LENGTH=$2                                                  
  LABEL="Hospital state postal code"                                            
                                                                                
  LOS                LENGTH=4                                                   
  LABEL="Length of stay (cleaned)"                                              
                                                                                
  LOS_X              LENGTH=4                                                   
  LABEL="Length of stay (as received from source)"                              
                                                                                
  MDNUM1_S           LENGTH=$16                                                 
  LABEL="Physician 1 number (synthetic)"                                        
                                                                                
  MRN_S              LENGTH=$17                                                 
  LABEL="Medical record number (synthetic)"                                     
                                                                                
  NCPT               LENGTH=3                                                   
  LABEL="Number of CPT/HCPCS procedures on this record"                         
                                                                                
  NDX                LENGTH=3                                                   
  LABEL="Number of diagnoses on this record"                                    
                                                                                
  NEOMAT             LENGTH=3                                                   
  LABEL="Neonatal and/or maternal DX and/or PR"                                 
                                                                                
  NPR                LENGTH=3                                                   
  LABEL="Number of procedures on this record"                                   
                                                                                
  PAY1               LENGTH=3                                                   
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PAY2               LENGTH=3                                                   
  LABEL="Secondary expected payer (uniform)"                                    
                                                                                
  PAY1_X             LENGTH=$2                                                  
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PAY2_X             LENGTH=$2                                                  
  LABEL="Secondary expected payer (as received from source)"                    
                                                                                
  PR1                LENGTH=$4                                                  
  LABEL="Principal procedure"                                                   
                                                                                
  PR2                LENGTH=$4                                                  
  LABEL="Procedure 2"                                                           
                                                                                
  PR3                LENGTH=$4                                                  
  LABEL="Procedure 3"                                                           
                                                                                
  PR4                LENGTH=$4                                                  
  LABEL="Procedure 4"                                                           
                                                                                
  PR5                LENGTH=$4                                                  
  LABEL="Procedure 5"                                                           
                                                                                
  PR6                LENGTH=$4                                                  
  LABEL="Procedure 6"                                                           
                                                                                
  PR7                LENGTH=$4                                                  
  LABEL="Procedure 7"                                                           
                                                                                
  PR8                LENGTH=$4                                                  
  LABEL="Procedure 8"                                                           
                                                                                
  PRCCS1             LENGTH=3                                                   
  LABEL="CCS: principal procedure"                                              
                                                                                
  PRCCS2             LENGTH=3                                                   
  LABEL="CCS: procedure 2"                                                      
                                                                                
  PRCCS3             LENGTH=3                                                   
  LABEL="CCS: procedure 3"                                                      
                                                                                
  PRCCS4             LENGTH=3                                                   
  LABEL="CCS: procedure 4"                                                      
                                                                                
  PRCCS5             LENGTH=3                                                   
  LABEL="CCS: procedure 5"                                                      
                                                                                
  PRCCS6             LENGTH=3                                                   
  LABEL="CCS: procedure 6"                                                      
                                                                                
  PRCCS7             LENGTH=3                                                   
  LABEL="CCS: procedure 7"                                                      
                                                                                
  PRCCS8             LENGTH=3                                                   
  LABEL="CCS: procedure 8"                                                      
                                                                                
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
      @301    DIED                N2PF.                                         
      @303    DISP_X              $CHAR2.                                       
      @305    DISPUNIFORM         N2PF.                                         
      @307    DQTR                N2PF.                                         
      @309    DSHOSPID            $CHAR13.                                      
      @322    DX1                 $CHAR5.                                       
      @327    DX2                 $CHAR5.                                       
      @332    DX3                 $CHAR5.                                       
      @337    DX4                 $CHAR5.                                       
      @342    DX5                 $CHAR5.                                       
      @347    DX6                 $CHAR5.                                       
      @352    DX7                 $CHAR5.                                       
      @357    DX8                 $CHAR5.                                       
      @362    DX9                 $CHAR5.                                       
      @367    DX10                $CHAR5.                                       
      @372    DX11                $CHAR5.                                       
      @377    DX12                $CHAR5.                                       
      @382    DX13                $CHAR5.                                       
      @387    DX14                $CHAR5.                                       
      @392    DX15                $CHAR5.                                       
      @397    DX16                $CHAR5.                                       
      @402    DX17                $CHAR5.                                       
      @407    DXCCS1              N4PF.                                         
      @411    DXCCS2              N4PF.                                         
      @415    DXCCS3              N4PF.                                         
      @419    DXCCS4              N4PF.                                         
      @423    DXCCS5              N4PF.                                         
      @427    DXCCS6              N4PF.                                         
      @431    DXCCS7              N4PF.                                         
      @435    DXCCS8              N4PF.                                         
      @439    DXCCS9              N4PF.                                         
      @443    DXCCS10             N4PF.                                         
      @447    DXCCS11             N4PF.                                         
      @451    DXCCS12             N4PF.                                         
      @455    DXCCS13             N4PF.                                         
      @459    DXCCS14             N4PF.                                         
      @463    DXCCS15             N4PF.                                         
      @467    DXCCS16             N4PF.                                         
      @471    DXCCS17             N4PF.                                         
      @475    FEMALE              N2PF.                                         
      @477    HISPANIC_X          $CHAR1.                                       
      @478    HOSPST              $CHAR2.                                       
      @480    LOS                 N5PF.                                         
      @485    LOS_X               N6PF.                                         
      @491    MDNUM1_S            $CHAR16.                                      
      @507    MRN_S               $CHAR17.                                      
      @524    NCPT                N2PF.                                         
      @526    NDX                 N2PF.                                         
      @528    NEOMAT              N2PF.                                         
      @530    NPR                 N2PF.                                         
      @532    PAY1                N2PF.                                         
      @534    PAY2                N2PF.                                         
      @536    PAY1_X              $CHAR2.                                       
      @538    PAY2_X              $CHAR2.                                       
      @540    PR1                 $CHAR4.                                       
      @544    PR2                 $CHAR4.                                       
      @548    PR3                 $CHAR4.                                       
      @552    PR4                 $CHAR4.                                       
      @556    PR5                 $CHAR4.                                       
      @560    PR6                 $CHAR4.                                       
      @564    PR7                 $CHAR4.                                       
      @568    PR8                 $CHAR4.                                       
      @572    PRCCS1              N3PF.                                         
      @575    PRCCS2              N3PF.                                         
      @578    PRCCS3              N3PF.                                         
      @581    PRCCS4              N3PF.                                         
      @584    PRCCS5              N3PF.                                         
      @587    PRCCS6              N3PF.                                         
      @590    PRCCS7              N3PF.                                         
      @593    PRCCS8              N3PF.                                         
      @596    RACE                N2PF.                                         
      @598    RACE_X              $CHAR1.                                       
      @599    TOTCHG              N10PF.                                        
      @609    TOTCHG_X            N15P2F.                                       
      @624    YEAR                N4PF.                                         
      ;                                                                         
                                                                                
                                                                                
RUN;
