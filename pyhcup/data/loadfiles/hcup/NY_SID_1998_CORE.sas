/*******************************************************************            
*   NY_SID_1998_CORE.SAS:                                                       
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
DATA NY_SIDC_1998_CORE;                                                         
INFILE 'NY_SIDC_1998_CORE.ASC' LRECL = 630;                                     
                                                                                
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
                                                                                
  DISPUB92           LENGTH=3                                                   
  LABEL="Disposition of patient (UB-92 standard coding)"                        
                                                                                
  DISPUNIFORM        LENGTH=3                                                   
  LABEL="Disposition of patient (uniform)"                                      
                                                                                
  DISP_X             LENGTH=$2                                                  
  LABEL="Disposition of patient (as received from source)"                      
                                                                                
  DQTR               LENGTH=3                                                   
  LABEL="Discharge quarter"                                                     
                                                                                
  DRG                LENGTH=3                                                   
  LABEL="DRG in effect on discharge date"                                       
                                                                                
  DRG10              LENGTH=3                                                   
  LABEL="DRG, version 10"                                                       
                                                                                
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
  LABEL="Length of stay (uncleaned)"                                            
                                                                                
  MDC                LENGTH=3                                                   
  LABEL="MDC in effect on discharge date"                                       
                                                                                
  MDC10              LENGTH=3                                                   
  LABEL="MDC, version 10"                                                       
                                                                                
  MDC18              LENGTH=3                                                   
  LABEL="MDC, version 18"                                                       
                                                                                
  MDID_S             LENGTH=$16                                                 
  LABEL="Attending physician number (synthetic)"                                
                                                                                
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
                                                                                
  SURGID_S           LENGTH=$16                                                 
  LABEL="Primary surgeon number (synthetic)"                                    
                                                                                
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
      @38     BLOOD               N7P2F.                                        
      @45     BWT                 N4PF.                                         
      @49     DIED                N2PF.                                         
      @51     DISPUB92            N2PF.                                         
      @53     DISPUNIFORM         N2PF.                                         
      @55     DISP_X              $CHAR2.                                       
      @57     DQTR                N2PF.                                         
      @59     DRG                 N3PF.                                         
      @62     DRG10               N3PF.                                         
      @65     DRG18               N3PF.                                         
      @68     DRGVER              N2PF.                                         
      @70     DSHOSPID            $CHAR13.                                      
      @83     DX1                 $CHAR5.                                       
      @88     DX2                 $CHAR5.                                       
      @93     DX3                 $CHAR5.                                       
      @98     DX4                 $CHAR5.                                       
      @103    DX5                 $CHAR5.                                       
      @108    DX6                 $CHAR5.                                       
      @113    DX7                 $CHAR5.                                       
      @118    DX8                 $CHAR5.                                       
      @123    DX9                 $CHAR5.                                       
      @128    DX10                $CHAR5.                                       
      @133    DX11                $CHAR5.                                       
      @138    DX12                $CHAR5.                                       
      @143    DX13                $CHAR5.                                       
      @148    DX14                $CHAR5.                                       
      @153    DX15                $CHAR5.                                       
      @158    DX16                $CHAR5.                                       
      @163    DX17                $CHAR5.                                       
      @168    DXATADMIT1          N2PF.                                         
      @170    DXATADMIT2          N2PF.                                         
      @172    DXATADMIT3          N2PF.                                         
      @174    DXATADMIT4          N2PF.                                         
      @176    DXATADMIT5          N2PF.                                         
      @178    DXATADMIT6          N2PF.                                         
      @180    DXATADMIT7          N2PF.                                         
      @182    DXATADMIT8          N2PF.                                         
      @184    DXATADMIT9          N2PF.                                         
      @186    DXATADMIT10         N2PF.                                         
      @188    DXATADMIT11         N2PF.                                         
      @190    DXATADMIT12         N2PF.                                         
      @192    DXATADMIT13         N2PF.                                         
      @194    DXATADMIT14         N2PF.                                         
      @196    DXATADMIT15         N2PF.                                         
      @198    DXCCS1              N4PF.                                         
      @202    DXCCS2              N4PF.                                         
      @206    DXCCS3              N4PF.                                         
      @210    DXCCS4              N4PF.                                         
      @214    DXCCS5              N4PF.                                         
      @218    DXCCS6              N4PF.                                         
      @222    DXCCS7              N4PF.                                         
      @226    DXCCS8              N4PF.                                         
      @230    DXCCS9              N4PF.                                         
      @234    DXCCS10             N4PF.                                         
      @238    DXCCS11             N4PF.                                         
      @242    DXCCS12             N4PF.                                         
      @246    DXCCS13             N4PF.                                         
      @250    DXCCS14             N4PF.                                         
      @254    DXCCS15             N4PF.                                         
      @258    DXCCS16             N4PF.                                         
      @262    DXCCS17             N4PF.                                         
      @266    FEMALE              N2PF.                                         
      @268    HISPANIC_X          $CHAR1.                                       
      @269    HOSPST              $CHAR2.                                       
      @271    LOS                 N5PF.                                         
      @276    LOS_X               N6PF.                                         
      @282    MDC                 N2PF.                                         
      @284    MDC10               N2PF.                                         
      @286    MDC18               N2PF.                                         
      @288    MDID_S              $CHAR16.                                      
      @304    NDX                 N2PF.                                         
      @306    NEOMAT              N2PF.                                         
      @308    NPR                 N2PF.                                         
      @310    PAY1                N2PF.                                         
      @312    PAY2                N2PF.                                         
      @314    PAY1_X              $CHAR2.                                       
      @316    PAY2_X              $CHAR2.                                       
      @318    PAY3_X              $CHAR2.                                       
      @320    PR1                 $CHAR4.                                       
      @324    PR2                 $CHAR4.                                       
      @328    PR3                 $CHAR4.                                       
      @332    PR4                 $CHAR4.                                       
      @336    PR5                 $CHAR4.                                       
      @340    PR6                 $CHAR4.                                       
      @344    PR7                 $CHAR4.                                       
      @348    PR8                 $CHAR4.                                       
      @352    PR9                 $CHAR4.                                       
      @356    PR10                $CHAR4.                                       
      @360    PR11                $CHAR4.                                       
      @364    PR12                $CHAR4.                                       
      @368    PR13                $CHAR4.                                       
      @372    PR14                $CHAR4.                                       
      @376    PR15                $CHAR4.                                       
      @380    PRCCS1              N3PF.                                         
      @383    PRCCS2              N3PF.                                         
      @386    PRCCS3              N3PF.                                         
      @389    PRCCS4              N3PF.                                         
      @392    PRCCS5              N3PF.                                         
      @395    PRCCS6              N3PF.                                         
      @398    PRCCS7              N3PF.                                         
      @401    PRCCS8              N3PF.                                         
      @404    PRCCS9              N3PF.                                         
      @407    PRCCS10             N3PF.                                         
      @410    PRCCS11             N3PF.                                         
      @413    PRCCS12             N3PF.                                         
      @416    PRCCS13             N3PF.                                         
      @419    PRCCS14             N3PF.                                         
      @422    PRCCS15             N3PF.                                         
      @425    PRDAY1              N3PF.                                         
      @428    PRDAY2              N3PF.                                         
      @431    PRDAY3              N3PF.                                         
      @434    PRDAY4              N3PF.                                         
      @437    PRDAY5              N3PF.                                         
      @440    PRDAY6              N3PF.                                         
      @443    PRDAY7              N3PF.                                         
      @446    PRDAY8              N3PF.                                         
      @449    PRDAY9              N3PF.                                         
      @452    PRDAY10             N3PF.                                         
      @455    PRDAY11             N3PF.                                         
      @458    PRDAY12             N3PF.                                         
      @461    PRDAY13             N3PF.                                         
      @464    PRDAY14             N3PF.                                         
      @467    PRDAY15             N3PF.                                         
      @470    PSTCO               N5PF.                                         
      @475    RACE                N2PF.                                         
      @477    RACE_X              $CHAR2.                                       
      @479    SURGID_S            $CHAR16.                                      
      @495    TOTCHG              N10PF.                                        
      @505    TOTCHG_X            N15P2F.                                       
      @520    YEAR                N4PF.                                         
      @524    ZIP                 $CHAR5.                                       
      @529    AYEAR               N4PF.                                         
      @533    DMONTH              N2PF.                                         
      @535    BMONTH              N2PF.                                         
      @537    BYEAR               N4PF.                                         
      @541    PRMONTH1            N2PF.                                         
      @543    PRMONTH2            N2PF.                                         
      @545    PRMONTH3            N2PF.                                         
      @547    PRMONTH4            N2PF.                                         
      @549    PRMONTH5            N2PF.                                         
      @551    PRMONTH6            N2PF.                                         
      @553    PRMONTH7            N2PF.                                         
      @555    PRMONTH8            N2PF.                                         
      @557    PRMONTH9            N2PF.                                         
      @559    PRMONTH10           N2PF.                                         
      @561    PRMONTH11           N2PF.                                         
      @563    PRMONTH12           N2PF.                                         
      @565    PRMONTH13           N2PF.                                         
      @567    PRMONTH14           N2PF.                                         
      @569    PRMONTH15           N2PF.                                         
      @571    PRYEAR1             N4PF.                                         
      @575    PRYEAR2             N4PF.                                         
      @579    PRYEAR3             N4PF.                                         
      @583    PRYEAR4             N4PF.                                         
      @587    PRYEAR5             N4PF.                                         
      @591    PRYEAR6             N4PF.                                         
      @595    PRYEAR7             N4PF.                                         
      @599    PRYEAR8             N4PF.                                         
      @603    PRYEAR9             N4PF.                                         
      @607    PRYEAR10            N4PF.                                         
      @611    PRYEAR11            N4PF.                                         
      @615    PRYEAR12            N4PF.                                         
      @619    PRYEAR13            N4PF.                                         
      @623    PRYEAR14            N4PF.                                         
      @627    PRYEAR15            N4PF.                                         
      ;                                                                         
                                                                                
                                                                                
RUN;
