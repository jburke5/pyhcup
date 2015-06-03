/*******************************************************************            
*   NY_SID_2001_CORE.SAS:                                                       
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
DATA NY_SIDC_2001_CORE;                                                         
INFILE 'NY_SIDC_2001_CORE.ASC' LRECL = 624;                                     
                                                                                
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
                                                                                
  ANESTH             LENGTH=3                                                   
  LABEL="Method of anesthesia"                                                  
                                                                                
  ASCHED             LENGTH=3                                                   
  LABEL="Admission scheduled vs. unscheduled"                                   
                                                                                
  ASOURCE            LENGTH=3                                                   
  LABEL="Admission source (uniform)"                                            
                                                                                
  ASOURCE_X          LENGTH=$1                                                  
  LABEL="Admission source (as received from source)"                            
                                                                                
  ATYPE              LENGTH=3                                                   
  LABEL="Admission type"                                                        
                                                                                
  AWEEKEND           LENGTH=3                                                   
  LABEL="Admission day is a weekend"                                            
                                                                                
  BLOOD              LENGTH=4                                                   
  LABEL="Pints of blood furnished to the patient"                               
                                                                                
  BWT                LENGTH=4                                                   
  LABEL="Birth weight in grams"                                                 
                                                                                
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
                                                                                
  DRG                LENGTH=3                                                   
  LABEL="DRG in effect on discharge date"                                       
                                                                                
  DRG18              LENGTH=3                                                   
  LABEL="DRG, version 18"                                                       
                                                                                
  DRGVER             LENGTH=3                                                   
  LABEL="DRG grouper version used on discharge date"                            
                                                                                
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
                                                                                
  DXATADMIT1         LENGTH=3                                                   
  LABEL="Principal diagnosis present at admission"                              
                                                                                
  DXATADMIT2         LENGTH=3                                                   
  LABEL="Diagnosis 2 present at admission"                                      
                                                                                
  DXATADMIT3         LENGTH=3                                                   
  LABEL="Diagnosis 3 present at admission"                                      
                                                                                
  DXATADMIT4         LENGTH=3                                                   
  LABEL="Diagnosis 4 present at admission"                                      
                                                                                
  DXATADMIT5         LENGTH=3                                                   
  LABEL="Diagnosis 5 present at admission"                                      
                                                                                
  DXATADMIT6         LENGTH=3                                                   
  LABEL="Diagnosis 6 present at admission"                                      
                                                                                
  DXATADMIT7         LENGTH=3                                                   
  LABEL="Diagnosis 7 present at admission"                                      
                                                                                
  DXATADMIT8         LENGTH=3                                                   
  LABEL="Diagnosis 8 present at admission"                                      
                                                                                
  DXATADMIT9         LENGTH=3                                                   
  LABEL="Diagnosis 9 present at admission"                                      
                                                                                
  DXATADMIT10        LENGTH=3                                                   
  LABEL="Diagnosis 10 present at admission"                                     
                                                                                
  DXATADMIT11        LENGTH=3                                                   
  LABEL="Diagnosis 11 present at admission"                                     
                                                                                
  DXATADMIT12        LENGTH=3                                                   
  LABEL="Diagnosis 12 present at admission"                                     
                                                                                
  DXATADMIT13        LENGTH=3                                                   
  LABEL="Diagnosis 13 present at admission"                                     
                                                                                
  DXATADMIT14        LENGTH=3                                                   
  LABEL="Diagnosis 14 present at admission"                                     
                                                                                
  DXATADMIT15        LENGTH=3                                                   
  LABEL="Diagnosis 15 present at admission"                                     
                                                                                
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
                                                                                
  MDC                LENGTH=3                                                   
  LABEL="MDC in effect on discharge date"                                       
                                                                                
  MDC18              LENGTH=3                                                   
  LABEL="MDC, version 18"                                                       
                                                                                
  MDNUM1_S           LENGTH=$16                                                 
  LABEL="Physician 1 number (synthetic)"                                        
                                                                                
  MDNUM2_S           LENGTH=$16                                                 
  LABEL="Physician 2 number (synthetic)"                                        
                                                                                
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
                                                                                
  PAY3_X             LENGTH=$2                                                  
  LABEL="Tertiary expected payer (as received from source)"                     
                                                                                
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
                                                                                
  PSTCO              LENGTH=4                                                   
  LABEL="Patient state/county FIPS code"                                        
                                                                                
  RACE               LENGTH=3                                                   
  LABEL="Race (uniform)"                                                        
                                                                                
  RACE_X             LENGTH=$2                                                  
  LABEL="Race (as received from source)"                                        
                                                                                
  TOTCHG             LENGTH=6                                                   
  LABEL="Total charges (cleaned)"                                               
                                                                                
  TOTCHG_X           LENGTH=7                                                   
  LABEL="Total charges (as received from source)"                               
                                                                                
  YEAR               LENGTH=3                                                   
  LABEL="Calendar year"                                                         
                                                                                
  ZIP                LENGTH=$5                                                  
  LABEL="Patient ZIP Code"                                                      
                                                                                
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
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      KEY                 14.                                           
      @15     AGE                 N3PF.                                         
      @18     AGEDAY              N3PF.                                         
      @21     AGEMONTH            N3PF.                                         
      @24     AMONTH              N2PF.                                         
      @26     ANESTH              N3PF.                                         
      @29     ASCHED              N2PF.                                         
      @31     ASOURCE             N2PF.                                         
      @33     ASOURCE_X           $CHAR1.                                       
      @34     ATYPE               N2PF.                                         
      @36     AWEEKEND            N2PF.                                         
      @38     BLOOD               N6PF.                                         
      @44     BWT                 N4PF.                                         
      @48     DIED                N2PF.                                         
      @50     DISP_X              $CHAR2.                                       
      @52     DISPUB92            N2PF.                                         
      @54     DISPUNIFORM         N2PF.                                         
      @56     DQTR                N2PF.                                         
      @58     DRG                 N3PF.                                         
      @61     DRG18               N3PF.                                         
      @64     DRGVER              N2PF.                                         
      @66     DSHOSPID            $CHAR13.                                      
      @79     DX1                 $CHAR5.                                       
      @84     DX2                 $CHAR5.                                       
      @89     DX3                 $CHAR5.                                       
      @94     DX4                 $CHAR5.                                       
      @99     DX5                 $CHAR5.                                       
      @104    DX6                 $CHAR5.                                       
      @109    DX7                 $CHAR5.                                       
      @114    DX8                 $CHAR5.                                       
      @119    DX9                 $CHAR5.                                       
      @124    DX10                $CHAR5.                                       
      @129    DX11                $CHAR5.                                       
      @134    DX12                $CHAR5.                                       
      @139    DX13                $CHAR5.                                       
      @144    DX14                $CHAR5.                                       
      @149    DX15                $CHAR5.                                       
      @154    DX16                $CHAR5.                                       
      @159    DX17                $CHAR5.                                       
      @164    DXATADMIT1          N2PF.                                         
      @166    DXATADMIT2          N2PF.                                         
      @168    DXATADMIT3          N2PF.                                         
      @170    DXATADMIT4          N2PF.                                         
      @172    DXATADMIT5          N2PF.                                         
      @174    DXATADMIT6          N2PF.                                         
      @176    DXATADMIT7          N2PF.                                         
      @178    DXATADMIT8          N2PF.                                         
      @180    DXATADMIT9          N2PF.                                         
      @182    DXATADMIT10         N2PF.                                         
      @184    DXATADMIT11         N2PF.                                         
      @186    DXATADMIT12         N2PF.                                         
      @188    DXATADMIT13         N2PF.                                         
      @190    DXATADMIT14         N2PF.                                         
      @192    DXATADMIT15         N2PF.                                         
      @194    DXCCS1              N4PF.                                         
      @198    DXCCS2              N4PF.                                         
      @202    DXCCS3              N4PF.                                         
      @206    DXCCS4              N4PF.                                         
      @210    DXCCS5              N4PF.                                         
      @214    DXCCS6              N4PF.                                         
      @218    DXCCS7              N4PF.                                         
      @222    DXCCS8              N4PF.                                         
      @226    DXCCS9              N4PF.                                         
      @230    DXCCS10             N4PF.                                         
      @234    DXCCS11             N4PF.                                         
      @238    DXCCS12             N4PF.                                         
      @242    DXCCS13             N4PF.                                         
      @246    DXCCS14             N4PF.                                         
      @250    DXCCS15             N4PF.                                         
      @254    DXCCS16             N4PF.                                         
      @258    DXCCS17             N4PF.                                         
      @262    FEMALE              N2PF.                                         
      @264    HISPANIC_X          $CHAR1.                                       
      @265    HOSPST              $CHAR2.                                       
      @267    LOS                 N5PF.                                         
      @272    LOS_X               N6PF.                                         
      @278    MDC                 N2PF.                                         
      @280    MDC18               N2PF.                                         
      @282    MDNUM1_S            $CHAR16.                                      
      @298    MDNUM2_S            $CHAR16.                                      
      @314    NDX                 N2PF.                                         
      @316    NEOMAT              N2PF.                                         
      @318    NPR                 N2PF.                                         
      @320    PAY1                N2PF.                                         
      @322    PAY2                N2PF.                                         
      @324    PAY1_X              $CHAR2.                                       
      @326    PAY2_X              $CHAR2.                                       
      @328    PAY3_X              $CHAR2.                                       
      @330    PR1                 $CHAR4.                                       
      @334    PR2                 $CHAR4.                                       
      @338    PR3                 $CHAR4.                                       
      @342    PR4                 $CHAR4.                                       
      @346    PR5                 $CHAR4.                                       
      @350    PR6                 $CHAR4.                                       
      @354    PR7                 $CHAR4.                                       
      @358    PR8                 $CHAR4.                                       
      @362    PR9                 $CHAR4.                                       
      @366    PR10                $CHAR4.                                       
      @370    PR11                $CHAR4.                                       
      @374    PR12                $CHAR4.                                       
      @378    PR13                $CHAR4.                                       
      @382    PR14                $CHAR4.                                       
      @386    PR15                $CHAR4.                                       
      @390    PRCCS1              N3PF.                                         
      @393    PRCCS2              N3PF.                                         
      @396    PRCCS3              N3PF.                                         
      @399    PRCCS4              N3PF.                                         
      @402    PRCCS5              N3PF.                                         
      @405    PRCCS6              N3PF.                                         
      @408    PRCCS7              N3PF.                                         
      @411    PRCCS8              N3PF.                                         
      @414    PRCCS9              N3PF.                                         
      @417    PRCCS10             N3PF.                                         
      @420    PRCCS11             N3PF.                                         
      @423    PRCCS12             N3PF.                                         
      @426    PRCCS13             N3PF.                                         
      @429    PRCCS14             N3PF.                                         
      @432    PRCCS15             N3PF.                                         
      @435    PRDAY1              N3PF.                                         
      @438    PRDAY2              N3PF.                                         
      @441    PRDAY3              N3PF.                                         
      @444    PRDAY4              N3PF.                                         
      @447    PRDAY5              N3PF.                                         
      @450    PRDAY6              N3PF.                                         
      @453    PRDAY7              N3PF.                                         
      @456    PRDAY8              N3PF.                                         
      @459    PRDAY9              N3PF.                                         
      @462    PRDAY10             N3PF.                                         
      @465    PRDAY11             N3PF.                                         
      @468    PRDAY12             N3PF.                                         
      @471    PRDAY13             N3PF.                                         
      @474    PRDAY14             N3PF.                                         
      @477    PRDAY15             N3PF.                                         
      @480    PSTCO               N5PF.                                         
      @485    RACE                N2PF.                                         
      @487    RACE_X              $CHAR2.                                       
      @489    TOTCHG              N10PF.                                        
      @499    TOTCHG_X            N15P2F.                                       
      @514    YEAR                N4PF.                                         
      @518    ZIP                 $CHAR5.                                       
      @523    AYEAR               N4PF.                                         
      @527    DMONTH              N2PF.                                         
      @529    BMONTH              N2PF.                                         
      @531    BYEAR               N4PF.                                         
      @535    PRMONTH1            N2PF.                                         
      @537    PRMONTH2            N2PF.                                         
      @539    PRMONTH3            N2PF.                                         
      @541    PRMONTH4            N2PF.                                         
      @543    PRMONTH5            N2PF.                                         
      @545    PRMONTH6            N2PF.                                         
      @547    PRMONTH7            N2PF.                                         
      @549    PRMONTH8            N2PF.                                         
      @551    PRMONTH9            N2PF.                                         
      @553    PRMONTH10           N2PF.                                         
      @555    PRMONTH11           N2PF.                                         
      @557    PRMONTH12           N2PF.                                         
      @559    PRMONTH13           N2PF.                                         
      @561    PRMONTH14           N2PF.                                         
      @563    PRMONTH15           N2PF.                                         
      @565    PRYEAR1             N4PF.                                         
      @569    PRYEAR2             N4PF.                                         
      @573    PRYEAR3             N4PF.                                         
      @577    PRYEAR4             N4PF.                                         
      @581    PRYEAR5             N4PF.                                         
      @585    PRYEAR6             N4PF.                                         
      @589    PRYEAR7             N4PF.                                         
      @593    PRYEAR8             N4PF.                                         
      @597    PRYEAR9             N4PF.                                         
      @601    PRYEAR10            N4PF.                                         
      @605    PRYEAR11            N4PF.                                         
      @609    PRYEAR12            N4PF.                                         
      @613    PRYEAR13            N4PF.                                         
      @617    PRYEAR14            N4PF.                                         
      @621    PRYEAR15            N4PF.                                         
      ;                                                                         
                                                                                
                                                                                
RUN;
