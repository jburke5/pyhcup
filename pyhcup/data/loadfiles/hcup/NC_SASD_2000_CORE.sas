/*******************************************************************            
*   NC_SASD_2000_CORE.SAS:                                                      
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
DATA NC_SASDC_2000_CORE;                                                        
INFILE 'NC_SASD_2000_CORE.ASC' LRECL = 614;                                     
                                                                                
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
                                                                                
  AMONTH             LENGTH=3                                                   
  LABEL="Admission month"                                                       
                                                                                
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
                                                                                
  FEMALE             LENGTH=3                                                   
  LABEL="Indicator of sex"                                                      
                                                                                
  HOSPST             LENGTH=$2                                                  
  LABEL="Hospital state postal code"                                            
                                                                                
  LOS                LENGTH=4                                                   
  LABEL="Length of stay (cleaned)"                                              
                                                                                
  LOS_X              LENGTH=4                                                   
  LABEL="Length of stay (as received from source)"                              
                                                                                
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
                                                                                
  PAY1_X             LENGTH=$1                                                  
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PNUM_S             LENGTH=$17                                                 
  LABEL="Person number (synthetic)"                                             
                                                                                
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
                                                                                
  PR9                LENGTH=$4                                                  
  LABEL="Procedure 9"                                                           
                                                                                
  PR10               LENGTH=$4                                                  
  LABEL="Procedure 10"                                                          
                                                                                
  PR11               LENGTH=$4                                                  
  LABEL="Procedure 11"                                                          
                                                                                
  PR12               LENGTH=$4                                                  
  LABEL="Procedure 12"                                                          
                                                                                
  PR13               LENGTH=$4                                                  
  LABEL="Procedure 13"                                                          
                                                                                
  PR14               LENGTH=$4                                                  
  LABEL="Procedure 14"                                                          
                                                                                
  PR15               LENGTH=$4                                                  
  LABEL="Procedure 15"                                                          
                                                                                
  PR16               LENGTH=$4                                                  
  LABEL="Procedure 16"                                                          
                                                                                
  PR17               LENGTH=$4                                                  
  LABEL="Procedure 17"                                                          
                                                                                
  PR18               LENGTH=$4                                                  
  LABEL="Procedure 18"                                                          
                                                                                
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
                                                                                
  PRCCS9             LENGTH=3                                                   
  LABEL="CCS: procedure 9"                                                      
                                                                                
  PRCCS10            LENGTH=3                                                   
  LABEL="CCS: procedure 10"                                                     
                                                                                
  PRCCS11            LENGTH=3                                                   
  LABEL="CCS: procedure 11"                                                     
                                                                                
  PRCCS12            LENGTH=3                                                   
  LABEL="CCS: procedure 12"                                                     
                                                                                
  PRCCS13            LENGTH=3                                                   
  LABEL="CCS: procedure 13"                                                     
                                                                                
  PRCCS14            LENGTH=3                                                   
  LABEL="CCS: procedure 14"                                                     
                                                                                
  PRCCS15            LENGTH=3                                                   
  LABEL="CCS: procedure 15"                                                     
                                                                                
  PRCCS16            LENGTH=3                                                   
  LABEL="CCS: procedure 16"                                                     
                                                                                
  PRCCS17            LENGTH=3                                                   
  LABEL="CCS: procedure 17"                                                     
                                                                                
  PRCCS18            LENGTH=3                                                   
  LABEL="CCS: procedure 18"                                                     
                                                                                
  PRDAY1             LENGTH=4                                                   
  LABEL="Number of days from admission to PR1"                                  
                                                                                
  PRDAY2             LENGTH=4                                                   
  LABEL="Number of days from admission to PR2"                                  
                                                                                
  PRDAY3             LENGTH=4                                                   
  LABEL="Number of days from admission to PR3"                                  
                                                                                
  PRDAY4             LENGTH=4                                                   
  LABEL="Number of days from admission to PR4"                                  
                                                                                
  PRDAY5             LENGTH=4                                                   
  LABEL="Number of days from admission to PR5"                                  
                                                                                
  PRDAY6             LENGTH=4                                                   
  LABEL="Number of days from admission to PR6"                                  
                                                                                
  PRDAY7             LENGTH=4                                                   
  LABEL="Number of days from admission to PR7"                                  
                                                                                
  PRDAY8             LENGTH=4                                                   
  LABEL="Number of days from admission to PR8"                                  
                                                                                
  PRDAY9             LENGTH=4                                                   
  LABEL="Number of days from admission to PR9"                                  
                                                                                
  PRDAY10            LENGTH=4                                                   
  LABEL="Number of days from admission to PR10"                                 
                                                                                
  PRDAY11            LENGTH=4                                                   
  LABEL="Number of days from admission to PR11"                                 
                                                                                
  PRDAY12            LENGTH=4                                                   
  LABEL="Number of days from admission to PR12"                                 
                                                                                
  PRDAY13            LENGTH=4                                                   
  LABEL="Number of days from admission to PR13"                                 
                                                                                
  PRDAY14            LENGTH=4                                                   
  LABEL="Number of days from admission to PR14"                                 
                                                                                
  PRDAY15            LENGTH=4                                                   
  LABEL="Number of days from admission to PR15"                                 
                                                                                
  PRDAY16            LENGTH=4                                                   
  LABEL="Number of days from admission to PR16"                                 
                                                                                
  PRDAY17            LENGTH=4                                                   
  LABEL="Number of days from admission to PR17"                                 
                                                                                
  PRDAY18            LENGTH=4                                                   
  LABEL="Number of days from admission to PR18"                                 
                                                                                
  TOTCHG             LENGTH=6                                                   
  LABEL="Total charges (cleaned)"                                               
                                                                                
  TOTCHG_X           LENGTH=7                                                   
  LABEL="Total charges (as received from source)"                               
                                                                                
  YEAR               LENGTH=3                                                   
  LABEL="Calendar year"                                                         
                                                                                
  ZIP                LENGTH=$5                                                  
  LABEL="Patient zip code"                                                      
                                                                                
  AYEAR              LENGTH=3                                                   
  LABEL="Admission year"                                                        
                                                                                
  DMONTH             LENGTH=3                                                   
  LABEL="Discharge month"                                                       
                                                                                
  BMONTH             LENGTH=3                                                   
  LABEL="Birth month"                                                           
                                                                                
  BYEAR              LENGTH=3                                                   
  LABEL="Birth year"                                                            
                                                                                
  PRMONTH1           LENGTH=3                                                   
  LABEL="Month of procedure 1"                                                  
                                                                                
  PRMONTH2           LENGTH=3                                                   
  LABEL="Month of procedure 2"                                                  
                                                                                
  PRMONTH3           LENGTH=3                                                   
  LABEL="Month of procedure 3"                                                  
                                                                                
  PRMONTH4           LENGTH=3                                                   
  LABEL="Month of procedure 4"                                                  
                                                                                
  PRMONTH5           LENGTH=3                                                   
  LABEL="Month of procedure 5"                                                  
                                                                                
  PRMONTH6           LENGTH=3                                                   
  LABEL="Month of procedure 6"                                                  
                                                                                
  PRMONTH7           LENGTH=3                                                   
  LABEL="Month of procedure 7"                                                  
                                                                                
  PRMONTH8           LENGTH=3                                                   
  LABEL="Month of procedure 8"                                                  
                                                                                
  PRMONTH9           LENGTH=3                                                   
  LABEL="Month of procedure 9"                                                  
                                                                                
  PRMONTH10          LENGTH=3                                                   
  LABEL="Month of procedure 10"                                                 
                                                                                
  PRMONTH11          LENGTH=3                                                   
  LABEL="Month of procedure 11"                                                 
                                                                                
  PRMONTH12          LENGTH=3                                                   
  LABEL="Month of procedure 12"                                                 
                                                                                
  PRMONTH13          LENGTH=3                                                   
  LABEL="Month of procedure 13"                                                 
                                                                                
  PRMONTH14          LENGTH=3                                                   
  LABEL="Month of procedure 14"                                                 
                                                                                
  PRMONTH15          LENGTH=3                                                   
  LABEL="Month of procedure 15"                                                 
                                                                                
  PRMONTH16          LENGTH=3                                                   
  LABEL="Month of procedure 16"                                                 
                                                                                
  PRMONTH17          LENGTH=3                                                   
  LABEL="Month of procedure 17"                                                 
                                                                                
  PRMONTH18          LENGTH=3                                                   
  LABEL="Month of procedure 18"                                                 
                                                                                
  PRYEAR1            LENGTH=3                                                   
  LABEL="Year of procedure 1"                                                   
                                                                                
  PRYEAR2            LENGTH=3                                                   
  LABEL="Year of procedure 2"                                                   
                                                                                
  PRYEAR3            LENGTH=3                                                   
  LABEL="Year of procedure 3"                                                   
                                                                                
  PRYEAR4            LENGTH=3                                                   
  LABEL="Year of procedure 4"                                                   
                                                                                
  PRYEAR5            LENGTH=3                                                   
  LABEL="Year of procedure 5"                                                   
                                                                                
  PRYEAR6            LENGTH=3                                                   
  LABEL="Year of procedure 6"                                                   
                                                                                
  PRYEAR7            LENGTH=3                                                   
  LABEL="Year of procedure 7"                                                   
                                                                                
  PRYEAR8            LENGTH=3                                                   
  LABEL="Year of procedure 8"                                                   
                                                                                
  PRYEAR9            LENGTH=3                                                   
  LABEL="Year of procedure 9"                                                   
                                                                                
  PRYEAR10           LENGTH=3                                                   
  LABEL="Year of procedure 10"                                                  
                                                                                
  PRYEAR11           LENGTH=3                                                   
  LABEL="Year of procedure 11"                                                  
                                                                                
  PRYEAR12           LENGTH=3                                                   
  LABEL="Year of procedure 12"                                                  
                                                                                
  PRYEAR13           LENGTH=3                                                   
  LABEL="Year of procedure 13"                                                  
                                                                                
  PRYEAR14           LENGTH=3                                                   
  LABEL="Year of procedure 14"                                                  
                                                                                
  PRYEAR15           LENGTH=3                                                   
  LABEL="Year of procedure 15"                                                  
                                                                                
  PRYEAR16           LENGTH=3                                                   
  LABEL="Year of procedure 16"                                                  
                                                                                
  PRYEAR17           LENGTH=3                                                   
  LABEL="Year of procedure 17"                                                  
                                                                                
  PRYEAR18           LENGTH=3                                                   
  LABEL="Year of procedure 18"                                                  
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      KEY                 14.                                           
      @15     AGE                 N3PF.                                         
      @18     AGEDAY              N3PF.                                         
      @21     AGEMONTH            N3PF.                                         
      @24     AMONTH              N2PF.                                         
      @26     AWEEKEND            N2PF.                                         
      @28     CPT1                $CHAR5.                                       
      @33     CPT2                $CHAR5.                                       
      @38     CPT3                $CHAR5.                                       
      @43     CPT4                $CHAR5.                                       
      @48     CPT5                $CHAR5.                                       
      @53     CPT6                $CHAR5.                                       
      @58     CPT7                $CHAR5.                                       
      @63     CPT8                $CHAR5.                                       
      @68     CPT9                $CHAR5.                                       
      @73     CPT10               $CHAR5.                                       
      @78     CPT11               $CHAR5.                                       
      @83     CPT12               $CHAR5.                                       
      @88     DQTR                N2PF.                                         
      @90     DSHOSPID            $CHAR13.                                      
      @103    DX1                 $CHAR5.                                       
      @108    DX2                 $CHAR5.                                       
      @113    DX3                 $CHAR5.                                       
      @118    DX4                 $CHAR5.                                       
      @123    DX5                 $CHAR5.                                       
      @128    DX6                 $CHAR5.                                       
      @133    DX7                 $CHAR5.                                       
      @138    DX8                 $CHAR5.                                       
      @143    DX9                 $CHAR5.                                       
      @148    DX10                $CHAR5.                                       
      @153    DX11                $CHAR5.                                       
      @158    DXCCS1              N4PF.                                         
      @162    DXCCS2              N4PF.                                         
      @166    DXCCS3              N4PF.                                         
      @170    DXCCS4              N4PF.                                         
      @174    DXCCS5              N4PF.                                         
      @178    DXCCS6              N4PF.                                         
      @182    DXCCS7              N4PF.                                         
      @186    DXCCS8              N4PF.                                         
      @190    DXCCS9              N4PF.                                         
      @194    DXCCS10             N4PF.                                         
      @198    DXCCS11             N4PF.                                         
      @202    FEMALE              N2PF.                                         
      @204    HOSPST              $CHAR2.                                       
      @206    LOS                 N5PF.                                         
      @211    LOS_X               N6PF.                                         
      @217    NCPT                N2PF.                                         
      @219    NDX                 N2PF.                                         
      @221    NEOMAT              N2PF.                                         
      @223    NPR                 N2PF.                                         
      @225    PAY1                N2PF.                                         
      @227    PAY1_X              $CHAR1.                                       
      @228    PNUM_S              $CHAR17.                                      
      @245    PR1                 $CHAR4.                                       
      @249    PR2                 $CHAR4.                                       
      @253    PR3                 $CHAR4.                                       
      @257    PR4                 $CHAR4.                                       
      @261    PR5                 $CHAR4.                                       
      @265    PR6                 $CHAR4.                                       
      @269    PR7                 $CHAR4.                                       
      @273    PR8                 $CHAR4.                                       
      @277    PR9                 $CHAR4.                                       
      @281    PR10                $CHAR4.                                       
      @285    PR11                $CHAR4.                                       
      @289    PR12                $CHAR4.                                       
      @293    PR13                $CHAR4.                                       
      @297    PR14                $CHAR4.                                       
      @301    PR15                $CHAR4.                                       
      @305    PR16                $CHAR4.                                       
      @309    PR17                $CHAR4.                                       
      @313    PR18                $CHAR4.                                       
      @317    PRCCS1              N3PF.                                         
      @320    PRCCS2              N3PF.                                         
      @323    PRCCS3              N3PF.                                         
      @326    PRCCS4              N3PF.                                         
      @329    PRCCS5              N3PF.                                         
      @332    PRCCS6              N3PF.                                         
      @335    PRCCS7              N3PF.                                         
      @338    PRCCS8              N3PF.                                         
      @341    PRCCS9              N3PF.                                         
      @344    PRCCS10             N3PF.                                         
      @347    PRCCS11             N3PF.                                         
      @350    PRCCS12             N3PF.                                         
      @353    PRCCS13             N3PF.                                         
      @356    PRCCS14             N3PF.                                         
      @359    PRCCS15             N3PF.                                         
      @362    PRCCS16             N3PF.                                         
      @365    PRCCS17             N3PF.                                         
      @368    PRCCS18             N3PF.                                         
      @371    PRDAY1              N5PF.                                         
      @376    PRDAY2              N5PF.                                         
      @381    PRDAY3              N5PF.                                         
      @386    PRDAY4              N5PF.                                         
      @391    PRDAY5              N5PF.                                         
      @396    PRDAY6              N5PF.                                         
      @401    PRDAY7              N5PF.                                         
      @406    PRDAY8              N5PF.                                         
      @411    PRDAY9              N5PF.                                         
      @416    PRDAY10             N5PF.                                         
      @421    PRDAY11             N5PF.                                         
      @426    PRDAY12             N5PF.                                         
      @431    PRDAY13             N5PF.                                         
      @436    PRDAY14             N5PF.                                         
      @441    PRDAY15             N5PF.                                         
      @446    PRDAY16             N5PF.                                         
      @451    PRDAY17             N5PF.                                         
      @456    PRDAY18             N5PF.                                         
      @461    TOTCHG              N10PF.                                        
      @471    TOTCHG_X            N15P2F.                                       
      @486    YEAR                N4PF.                                         
      @490    ZIP                 $CHAR5.                                       
      @495    AYEAR               N4PF.                                         
      @499    DMONTH              N2PF.                                         
      @501    BMONTH              N2PF.                                         
      @503    BYEAR               N4PF.                                         
      @507    PRMONTH1            N2PF.                                         
      @509    PRMONTH2            N2PF.                                         
      @511    PRMONTH3            N2PF.                                         
      @513    PRMONTH4            N2PF.                                         
      @515    PRMONTH5            N2PF.                                         
      @517    PRMONTH6            N2PF.                                         
      @519    PRMONTH7            N2PF.                                         
      @521    PRMONTH8            N2PF.                                         
      @523    PRMONTH9            N2PF.                                         
      @525    PRMONTH10           N2PF.                                         
      @527    PRMONTH11           N2PF.                                         
      @529    PRMONTH12           N2PF.                                         
      @531    PRMONTH13           N2PF.                                         
      @533    PRMONTH14           N2PF.                                         
      @535    PRMONTH15           N2PF.                                         
      @537    PRMONTH16           N2PF.                                         
      @539    PRMONTH17           N2PF.                                         
      @541    PRMONTH18           N2PF.                                         
      @543    PRYEAR1             N4PF.                                         
      @547    PRYEAR2             N4PF.                                         
      @551    PRYEAR3             N4PF.                                         
      @555    PRYEAR4             N4PF.                                         
      @559    PRYEAR5             N4PF.                                         
      @563    PRYEAR6             N4PF.                                         
      @567    PRYEAR7             N4PF.                                         
      @571    PRYEAR8             N4PF.                                         
      @575    PRYEAR9             N4PF.                                         
      @579    PRYEAR10            N4PF.                                         
      @583    PRYEAR11            N4PF.                                         
      @587    PRYEAR12            N4PF.                                         
      @591    PRYEAR13            N4PF.                                         
      @595    PRYEAR14            N4PF.                                         
      @599    PRYEAR15            N4PF.                                         
      @603    PRYEAR16            N4PF.                                         
      @607    PRYEAR17            N4PF.                                         
      @611    PRYEAR18            N4PF.                                         
      ;                                                                         
                                                                                
                                                                                
RUN;
