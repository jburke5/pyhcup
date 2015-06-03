/*******************************************************************            
*   FL_SASD_2002_CORE.SAS:                                                      
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
DATA FL_SASDC_2002_CORE;                                                        
INFILE 'FL_SASD_2002_CORE.ASC' LRECL = 276;                                     
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  KEY                LENGTH=8          FORMAT=Z14.                              
  LABEL="HCUP record identifier"                                                
                                                                                
  AGE                LENGTH=3                                                   
  LABEL="Age in years at admission"                                             
                                                                                
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
                                                                                
  DIED               LENGTH=3                                                   
  LABEL="Died during hospitalization"                                           
                                                                                
  DISP_X             LENGTH=$2                                                  
  LABEL="Disposition of patient (as received from source)"                      
                                                                                
  DISPUB92           LENGTH=3                                                   
  LABEL="Disposition of patient (UB-92 standard coding)"                        
                                                                                
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
                                                                                
  FEMALE             LENGTH=3                                                   
  LABEL="Indicator of sex"                                                      
                                                                                
  HOSPST             LENGTH=$2                                                  
  LABEL="Hospital state postal code"                                            
                                                                                
  MDNUM1_S           LENGTH=$16                                                 
  LABEL="Physician 1 number (synthetic)"                                        
                                                                                
  MDNUM2_S           LENGTH=$16                                                 
  LABEL="Physician 2 number (synthetic)"                                        
                                                                                
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
                                                                                
  PL_CBSA            LENGTH=3                                                   
  LABEL="Patient location: Core Based Statistical Area (CBSA)"                  
                                                                                
  PL_MSA1993         LENGTH=3                                                   
  LABEL="Patient location: Metropolitan Statistical Area (MSA), 1993"           
                                                                                
  PL_RUCA            LENGTH=4          FORMAT=4.1                               
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes"             
                                                                                
  PL_RUCA10          LENGTH=3                                                   
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes, ten levels" 
                                                                                
  PL_RUCA4           LENGTH=3                                                   
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes, four levels"
                                                                                
  PL_RUCC            LENGTH=3                                                   
  LABEL="Patient location: Rural-Urban Continuum Codes(RUCC)"                   
                                                                                
  PL_UIC             LENGTH=3                                                   
  LABEL="Patient location: Urban Influence Codes"                               
                                                                                
  PR1                LENGTH=$4                                                  
  LABEL="Principal procedure"                                                   
                                                                                
  PRCCS1             LENGTH=3                                                   
  LABEL="CCS: principal procedure"                                              
                                                                                
  PROFEE             LENGTH=3                                                   
  LABEL="Professional fees included in total charges"                           
                                                                                
  PSTCO2             LENGTH=4                                                   
  LABEL="Patient state/county FIPS code, possibly derived from ZIP Code"        
                                                                                
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
                                                                                
  ZIP                LENGTH=$5                                                  
  LABEL="Patient ZIP Code"                                                      
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      KEY                 14.                                           
      @15     AGE                 N3PF.                                         
      @18     AWEEKEND            N2PF.                                         
      @20     CPT1                $CHAR5.                                       
      @25     CPT2                $CHAR5.                                       
      @30     CPT3                $CHAR5.                                       
      @35     CPT4                $CHAR5.                                       
      @40     CPT5                $CHAR5.                                       
      @45     CPT6                $CHAR5.                                       
      @50     CPT7                $CHAR5.                                       
      @55     CPT8                $CHAR5.                                       
      @60     CPT9                $CHAR5.                                       
      @65     CPT10               $CHAR5.                                       
      @70     CPT11               $CHAR5.                                       
      @75     CPT12               $CHAR5.                                       
      @80     CPT13               $CHAR5.                                       
      @85     CPT14               $CHAR5.                                       
      @90     CPT15               $CHAR5.                                       
      @95     DIED                N2PF.                                         
      @97     DISP_X              $CHAR2.                                       
      @99     DISPUB92            N2PF.                                         
      @101    DISPUNIFORM         N2PF.                                         
      @103    DQTR                N2PF.                                         
      @105    DSHOSPID            $CHAR13.                                      
      @118    DX1                 $CHAR5.                                       
      @123    DX2                 $CHAR5.                                       
      @128    DX3                 $CHAR5.                                       
      @133    DX4                 $CHAR5.                                       
      @138    DX5                 $CHAR5.                                       
      @143    DXCCS1              N4PF.                                         
      @147    DXCCS2              N4PF.                                         
      @151    DXCCS3              N4PF.                                         
      @155    DXCCS4              N4PF.                                         
      @159    DXCCS5              N4PF.                                         
      @163    FEMALE              N2PF.                                         
      @165    HOSPST              $CHAR2.                                       
      @167    MDNUM1_S            $CHAR16.                                      
      @183    MDNUM2_S            $CHAR16.                                      
      @199    NCPT                N2PF.                                         
      @201    NDX                 N2PF.                                         
      @203    NEOMAT              N2PF.                                         
      @205    NPR                 N2PF.                                         
      @207    PAY1                N2PF.                                         
      @209    PAY1_X              $CHAR1.                                       
      @210    PL_CBSA             N2PF.                                         
      @212    PL_MSA1993          N2PF.                                         
      @214    PL_RUCA             N4P1F.                                        
      @218    PL_RUCA10           N2PF.                                         
      @220    PL_RUCA4            N2PF.                                         
      @222    PL_RUCC             N2PF.                                         
      @224    PL_UIC              N2PF.                                         
      @226    PR1                 $CHAR4.                                       
      @230    PRCCS1              N3PF.                                         
      @233    PROFEE              N2PF.                                         
      @235    PSTCO2              N5PF.                                         
      @240    RACE                N2PF.                                         
      @242    RACE_X              $CHAR1.                                       
      @243    TOTCHG              N10PF.                                        
      @253    TOTCHG_X            N15P2F.                                       
      @268    YEAR                N4PF.                                         
      @272    ZIP                 $CHAR5.                                       
      ;                                                                         
                                                                                
                                                                                
RUN;
