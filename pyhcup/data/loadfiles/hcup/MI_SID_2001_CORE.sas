/*******************************************************************            
*   MI_SID_2001_CORE.SAS:                                                       
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
DATA MI_SIDC_2001_CORE;                                                         
INFILE 'MI_SID_2001_CORE.ASC' LRECL = 685;                                      
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  HOSPID             LENGTH=4          FORMAT=Z5.                               
  LABEL="HCUP hospital identification number"                                   
                                                                                
  HOSPST             LENGTH=$2                                                  
  LABEL="Hospital state postal code"                                            
                                                                                
  KEY                LENGTH=8          FORMAT=Z14.                              
  LABEL="HCUP record identifier"                                                
                                                                                
  ADRG               LENGTH=3                                                   
  LABEL="All Patient Refined DRG"                                               
                                                                                
  ADRGRISKMORTALITY  LENGTH=3                                                   
  LABEL="All Patient Refined DRG mortality risk"                                
                                                                                
  ADRGSEV            LENGTH=3                                                   
  LABEL="All Patient Refined DRG severity level"                                
                                                                                
  AGE                LENGTH=3                                                   
  LABEL="Age in years at admission"                                             
                                                                                
  AGEDAY             LENGTH=3                                                   
  LABEL="Age in days (when age < 1 year)"                                       
                                                                                
  AGEMONTH           LENGTH=3                                                   
  LABEL="Age in months (when age < 11 years)"                                   
                                                                                
  AMONTH             LENGTH=3                                                   
  LABEL="Admission month"                                                       
                                                                                
  ASOURCE            LENGTH=3                                                   
  LABEL="Admission source (uniform)"                                            
                                                                                
  ASOURCE_X          LENGTH=$1                                                  
  LABEL="Admission source (as received from source)"                            
                                                                                
  ATYPE              LENGTH=3                                                   
  LABEL="Admission type"                                                        
                                                                                
  AWEEKEND           LENGTH=3                                                   
  LABEL="Admission day is a weekend"                                            
                                                                                
  DaysCCU            LENGTH=3                                                   
  LABEL="Days in coronary care unit (as received from the source)"              
                                                                                
  DaysICU            LENGTH=3                                                   
  LABEL=                                                                        
  "Days in medical/surgical intensive care unit (as received from the source)"  
                                                                                
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
                                                                                
  DX18               LENGTH=$5                                                  
  LABEL="Diagnosis 18"                                                          
                                                                                
  DX19               LENGTH=$5                                                  
  LABEL="Diagnosis 19"                                                          
                                                                                
  DX20               LENGTH=$5                                                  
  LABEL="Diagnosis 20"                                                          
                                                                                
  DX21               LENGTH=$5                                                  
  LABEL="Diagnosis 21"                                                          
                                                                                
  DX22               LENGTH=$5                                                  
  LABEL="Diagnosis 22"                                                          
                                                                                
  DX23               LENGTH=$5                                                  
  LABEL="Diagnosis 23"                                                          
                                                                                
  DX24               LENGTH=$5                                                  
  LABEL="Diagnosis 24"                                                          
                                                                                
  DX25               LENGTH=$5                                                  
  LABEL="Diagnosis 25"                                                          
                                                                                
  DX26               LENGTH=$5                                                  
  LABEL="Diagnosis 26"                                                          
                                                                                
  DX27               LENGTH=$5                                                  
  LABEL="Diagnosis 27"                                                          
                                                                                
  DX28               LENGTH=$5                                                  
  LABEL="Diagnosis 28"                                                          
                                                                                
  DX29               LENGTH=$5                                                  
  LABEL="Diagnosis 29"                                                          
                                                                                
  DX30               LENGTH=$5                                                  
  LABEL="Diagnosis 30"                                                          
                                                                                
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
                                                                                
  DXCCS18            LENGTH=4                                                   
  LABEL="CCS: diagnosis 18"                                                     
                                                                                
  DXCCS19            LENGTH=4                                                   
  LABEL="CCS: diagnosis 19"                                                     
                                                                                
  DXCCS20            LENGTH=4                                                   
  LABEL="CCS: diagnosis 20"                                                     
                                                                                
  DXCCS21            LENGTH=4                                                   
  LABEL="CCS: diagnosis 21"                                                     
                                                                                
  DXCCS22            LENGTH=4                                                   
  LABEL="CCS: diagnosis 22"                                                     
                                                                                
  DXCCS23            LENGTH=4                                                   
  LABEL="CCS: diagnosis 23"                                                     
                                                                                
  DXCCS24            LENGTH=4                                                   
  LABEL="CCS: diagnosis 24"                                                     
                                                                                
  DXCCS25            LENGTH=4                                                   
  LABEL="CCS: diagnosis 25"                                                     
                                                                                
  DXCCS26            LENGTH=4                                                   
  LABEL="CCS: diagnosis 26"                                                     
                                                                                
  DXCCS27            LENGTH=4                                                   
  LABEL="CCS: diagnosis 27"                                                     
                                                                                
  DXCCS28            LENGTH=4                                                   
  LABEL="CCS: diagnosis 28"                                                     
                                                                                
  DXCCS29            LENGTH=4                                                   
  LABEL="CCS: diagnosis 29"                                                     
                                                                                
  DXCCS30            LENGTH=4                                                   
  LABEL="CCS: diagnosis 30"                                                     
                                                                                
  FEMALE             LENGTH=3                                                   
  LABEL="Indicator of sex"                                                      
                                                                                
  HISPANIC_X         LENGTH=$1                                                  
  LABEL="Hispanic ethnicity (as received from source)"                          
                                                                                
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
                                                                                
  MRN_S              LENGTH=$17                                                 
  LABEL="Medical record number (synthetic)"                                     
                                                                                
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
                                                                                
  PR19               LENGTH=$4                                                  
  LABEL="Procedure 19"                                                          
                                                                                
  PR20               LENGTH=$4                                                  
  LABEL="Procedure 20"                                                          
                                                                                
  PR21               LENGTH=$4                                                  
  LABEL="Procedure 21"                                                          
                                                                                
  PR22               LENGTH=$4                                                  
  LABEL="Procedure 22"                                                          
                                                                                
  PR23               LENGTH=$4                                                  
  LABEL="Procedure 23"                                                          
                                                                                
  PR24               LENGTH=$4                                                  
  LABEL="Procedure 24"                                                          
                                                                                
  PR25               LENGTH=$4                                                  
  LABEL="Procedure 25"                                                          
                                                                                
  PR26               LENGTH=$4                                                  
  LABEL="Procedure 26"                                                          
                                                                                
  PR27               LENGTH=$4                                                  
  LABEL="Procedure 27"                                                          
                                                                                
  PR28               LENGTH=$4                                                  
  LABEL="Procedure 28"                                                          
                                                                                
  PR29               LENGTH=$4                                                  
  LABEL="Procedure 29"                                                          
                                                                                
  PR30               LENGTH=$4                                                  
  LABEL="Procedure 30"                                                          
                                                                                
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
                                                                                
  PRCCS19            LENGTH=3                                                   
  LABEL="CCS: procedure 19"                                                     
                                                                                
  PRCCS20            LENGTH=3                                                   
  LABEL="CCS: procedure 20"                                                     
                                                                                
  PRCCS21            LENGTH=3                                                   
  LABEL="CCS: procedure 21"                                                     
                                                                                
  PRCCS22            LENGTH=3                                                   
  LABEL="CCS: procedure 22"                                                     
                                                                                
  PRCCS23            LENGTH=3                                                   
  LABEL="CCS: procedure 23"                                                     
                                                                                
  PRCCS24            LENGTH=3                                                   
  LABEL="CCS: procedure 24"                                                     
                                                                                
  PRCCS25            LENGTH=3                                                   
  LABEL="CCS: procedure 25"                                                     
                                                                                
  PRCCS26            LENGTH=3                                                   
  LABEL="CCS: procedure 26"                                                     
                                                                                
  PRCCS27            LENGTH=3                                                   
  LABEL="CCS: procedure 27"                                                     
                                                                                
  PRCCS28            LENGTH=3                                                   
  LABEL="CCS: procedure 28"                                                     
                                                                                
  PRCCS29            LENGTH=3                                                   
  LABEL="CCS: procedure 29"                                                     
                                                                                
  PRCCS30            LENGTH=3                                                   
  LABEL="CCS: procedure 30"                                                     
                                                                                
  PRDAY1             LENGTH=4                                                   
  LABEL="Number of days from admission to PR1"                                  
                                                                                
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
                                                                                
  AYEAR              LENGTH=3                                                   
  LABEL="Admission year"                                                        
                                                                                
  DMONTH             LENGTH=3                                                   
  LABEL="Discharge month"                                                       
                                                                                
  BMONTH             LENGTH=3                                                   
  LABEL="Birth month"                                                           
                                                                                
  BYEAR              LENGTH=3                                                   
  LABEL="Birth year"                                                            
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      HOSPID              N5PF.                                         
      @6      HOSPST              $CHAR2.                                       
      @8      KEY                 14.                                           
      @22     ADRG                N3PF.                                         
      @25     ADRGRISKMORTALITY   N2PF.                                         
      @27     ADRGSEV             N2PF.                                         
      @29     AGE                 N3PF.                                         
      @32     AGEDAY              N3PF.                                         
      @35     AGEMONTH            N3PF.                                         
      @38     AMONTH              N2PF.                                         
      @40     ASOURCE             N2PF.                                         
      @42     ASOURCE_X           $CHAR1.                                       
      @43     ATYPE               N2PF.                                         
      @45     AWEEKEND            N2PF.                                         
      @47     DaysCCU             N3PF.                                         
      @50     DaysICU             N3PF.                                         
      @53     DIED                N2PF.                                         
      @55     DISP_X              $CHAR2.                                       
      @57     DISPUB92            N2PF.                                         
      @59     DISPUNIFORM         N2PF.                                         
      @61     DQTR                N2PF.                                         
      @63     DRG                 N3PF.                                         
      @66     DRG18               N3PF.                                         
      @69     DRGVER              N2PF.                                         
      @71     DX1                 $CHAR5.                                       
      @76     DX2                 $CHAR5.                                       
      @81     DX3                 $CHAR5.                                       
      @86     DX4                 $CHAR5.                                       
      @91     DX5                 $CHAR5.                                       
      @96     DX6                 $CHAR5.                                       
      @101    DX7                 $CHAR5.                                       
      @106    DX8                 $CHAR5.                                       
      @111    DX9                 $CHAR5.                                       
      @116    DX10                $CHAR5.                                       
      @121    DX11                $CHAR5.                                       
      @126    DX12                $CHAR5.                                       
      @131    DX13                $CHAR5.                                       
      @136    DX14                $CHAR5.                                       
      @141    DX15                $CHAR5.                                       
      @146    DX16                $CHAR5.                                       
      @151    DX17                $CHAR5.                                       
      @156    DX18                $CHAR5.                                       
      @161    DX19                $CHAR5.                                       
      @166    DX20                $CHAR5.                                       
      @171    DX21                $CHAR5.                                       
      @176    DX22                $CHAR5.                                       
      @181    DX23                $CHAR5.                                       
      @186    DX24                $CHAR5.                                       
      @191    DX25                $CHAR5.                                       
      @196    DX26                $CHAR5.                                       
      @201    DX27                $CHAR5.                                       
      @206    DX28                $CHAR5.                                       
      @211    DX29                $CHAR5.                                       
      @216    DX30                $CHAR5.                                       
      @221    DXCCS1              N4PF.                                         
      @225    DXCCS2              N4PF.                                         
      @229    DXCCS3              N4PF.                                         
      @233    DXCCS4              N4PF.                                         
      @237    DXCCS5              N4PF.                                         
      @241    DXCCS6              N4PF.                                         
      @245    DXCCS7              N4PF.                                         
      @249    DXCCS8              N4PF.                                         
      @253    DXCCS9              N4PF.                                         
      @257    DXCCS10             N4PF.                                         
      @261    DXCCS11             N4PF.                                         
      @265    DXCCS12             N4PF.                                         
      @269    DXCCS13             N4PF.                                         
      @273    DXCCS14             N4PF.                                         
      @277    DXCCS15             N4PF.                                         
      @281    DXCCS16             N4PF.                                         
      @285    DXCCS17             N4PF.                                         
      @289    DXCCS18             N4PF.                                         
      @293    DXCCS19             N4PF.                                         
      @297    DXCCS20             N4PF.                                         
      @301    DXCCS21             N4PF.                                         
      @305    DXCCS22             N4PF.                                         
      @309    DXCCS23             N4PF.                                         
      @313    DXCCS24             N4PF.                                         
      @317    DXCCS25             N4PF.                                         
      @321    DXCCS26             N4PF.                                         
      @325    DXCCS27             N4PF.                                         
      @329    DXCCS28             N4PF.                                         
      @333    DXCCS29             N4PF.                                         
      @337    DXCCS30             N4PF.                                         
      @341    FEMALE              N2PF.                                         
      @343    HISPANIC_X          $CHAR1.                                       
      @344    LOS                 N5PF.                                         
      @349    LOS_X               N6PF.                                         
      @355    MDC                 N2PF.                                         
      @357    MDC18               N2PF.                                         
      @359    MDNUM1_S            $CHAR16.                                      
      @375    MDNUM2_S            $CHAR16.                                      
      @391    MRN_S               $CHAR17.                                      
      @408    NDX                 N2PF.                                         
      @410    NEOMAT              N2PF.                                         
      @412    NPR                 N2PF.                                         
      @414    PAY1                N2PF.                                         
      @416    PAY2                N2PF.                                         
      @418    PAY1_X              $CHAR2.                                       
      @420    PAY2_X              $CHAR2.                                       
      @422    PR1                 $CHAR4.                                       
      @426    PR2                 $CHAR4.                                       
      @430    PR3                 $CHAR4.                                       
      @434    PR4                 $CHAR4.                                       
      @438    PR5                 $CHAR4.                                       
      @442    PR6                 $CHAR4.                                       
      @446    PR7                 $CHAR4.                                       
      @450    PR8                 $CHAR4.                                       
      @454    PR9                 $CHAR4.                                       
      @458    PR10                $CHAR4.                                       
      @462    PR11                $CHAR4.                                       
      @466    PR12                $CHAR4.                                       
      @470    PR13                $CHAR4.                                       
      @474    PR14                $CHAR4.                                       
      @478    PR15                $CHAR4.                                       
      @482    PR16                $CHAR4.                                       
      @486    PR17                $CHAR4.                                       
      @490    PR18                $CHAR4.                                       
      @494    PR19                $CHAR4.                                       
      @498    PR20                $CHAR4.                                       
      @502    PR21                $CHAR4.                                       
      @506    PR22                $CHAR4.                                       
      @510    PR23                $CHAR4.                                       
      @514    PR24                $CHAR4.                                       
      @518    PR25                $CHAR4.                                       
      @522    PR26                $CHAR4.                                       
      @526    PR27                $CHAR4.                                       
      @530    PR28                $CHAR4.                                       
      @534    PR29                $CHAR4.                                       
      @538    PR30                $CHAR4.                                       
      @542    PRCCS1              N3PF.                                         
      @545    PRCCS2              N3PF.                                         
      @548    PRCCS3              N3PF.                                         
      @551    PRCCS4              N3PF.                                         
      @554    PRCCS5              N3PF.                                         
      @557    PRCCS6              N3PF.                                         
      @560    PRCCS7              N3PF.                                         
      @563    PRCCS8              N3PF.                                         
      @566    PRCCS9              N3PF.                                         
      @569    PRCCS10             N3PF.                                         
      @572    PRCCS11             N3PF.                                         
      @575    PRCCS12             N3PF.                                         
      @578    PRCCS13             N3PF.                                         
      @581    PRCCS14             N3PF.                                         
      @584    PRCCS15             N3PF.                                         
      @587    PRCCS16             N3PF.                                         
      @590    PRCCS17             N3PF.                                         
      @593    PRCCS18             N3PF.                                         
      @596    PRCCS19             N3PF.                                         
      @599    PRCCS20             N3PF.                                         
      @602    PRCCS21             N3PF.                                         
      @605    PRCCS22             N3PF.                                         
      @608    PRCCS23             N3PF.                                         
      @611    PRCCS24             N3PF.                                         
      @614    PRCCS25             N3PF.                                         
      @617    PRCCS26             N3PF.                                         
      @620    PRCCS27             N3PF.                                         
      @623    PRCCS28             N3PF.                                         
      @626    PRCCS29             N3PF.                                         
      @629    PRCCS30             N3PF.                                         
      @632    PRDAY1              N5PF.                                         
      @637    RACE                N2PF.                                         
      @639    RACE_X              $CHAR1.                                       
      @640    TOTCHG              N10PF.                                        
      @650    TOTCHG_X            N15P2F.                                       
      @665    YEAR                N4PF.                                         
      @669    ZIP                 $CHAR5.                                       
      @674    AYEAR               N4PF.                                         
      @678    DMONTH              N2PF.                                         
      @680    BMONTH              N2PF.                                         
      @682    BYEAR               N4PF.                                         
      ;                                                                         
                                                                                
                                                                                
RUN;
