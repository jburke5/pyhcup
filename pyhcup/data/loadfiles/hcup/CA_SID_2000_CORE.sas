/*******************************************************************            
*   CA_SID_2000_CORE.SAS:                                                       
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
DATA CA_SIDC_2000_CORE;                                                         
INFILE 'CA_SID_2000_CORE.ASC' LRECL = 695;                                      
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  AGE                LENGTH=3                                                   
  LABEL="Age in years at admission"                                             
                                                                                
  AGEDAY             LENGTH=3                                                   
  LABEL="Age in days (when age < 1 year)"                                       
                                                                                
  AGEMONTH           LENGTH=3                                                   
  LABEL="Age in months (when age < 11 years)"                                   
                                                                                
  AMONTH             LENGTH=3                                                   
  LABEL="Admission month"                                                       
                                                                                
  ASCHED             LENGTH=3                                                   
  LABEL="Admission scheduled vs. unscheduled"                                   
                                                                                
  ASOURCE            LENGTH=3                                                   
  LABEL="Admission source (uniform)"                                            
                                                                                
  ASOURCE_X          LENGTH=$3                                                  
  LABEL="Admission source (as received from source)"                            
                                                                                
  AWEEKEND           LENGTH=3                                                   
  LABEL="Admission day is a weekend"                                            
                                                                                
  DIED               LENGTH=3                                                   
  LABEL="Died during hospitalization"                                           
                                                                                
  DISP_X             LENGTH=$2                                                  
  LABEL="Disposition of patient (as received from source)"                      
                                                                                
  DISPUNIFORM        LENGTH=3                                                   
  LABEL="Disposition of patient, uniform"                                       
                                                                                
  DNR                LENGTH=3                                                   
  LABEL="Do not resuscitate indicator"                                          
                                                                                
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
                                                                                
  DXATADMIT16        LENGTH=3                                                   
  LABEL="Diagnosis 16 present at admission"                                     
                                                                                
  DXATADMIT17        LENGTH=3                                                   
  LABEL="Diagnosis 17 present at admission"                                     
                                                                                
  DXATADMIT18        LENGTH=3                                                   
  LABEL="Diagnosis 18 present at admission"                                     
                                                                                
  DXATADMIT19        LENGTH=3                                                   
  LABEL="Diagnosis 19 present at admission"                                     
                                                                                
  DXATADMIT20        LENGTH=3                                                   
  LABEL="Diagnosis 20 present at admission"                                     
                                                                                
  DXATADMIT21        LENGTH=3                                                   
  LABEL="Diagnosis 21 present at admission"                                     
                                                                                
  DXATADMIT22        LENGTH=3                                                   
  LABEL="Diagnosis 22 present at admission"                                     
                                                                                
  DXATADMIT23        LENGTH=3                                                   
  LABEL="Diagnosis 23 present at admission"                                     
                                                                                
  DXATADMIT24        LENGTH=3                                                   
  LABEL="Diagnosis 24 present at admission"                                     
                                                                                
  DXATADMIT25        LENGTH=3                                                   
  LABEL="Diagnosis 25 present at admission"                                     
                                                                                
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
                                                                                
  HOSPST             LENGTH=$2                                                  
  LABEL="Hospital state postal code"                                            
                                                                                
  LEVELCARE          LENGTH=$1                                                  
  LABEL="Level of patient care (as received from source)"                       
                                                                                
  LOS                LENGTH=4                                                   
  LABEL="Length of stay (cleaned)"                                              
                                                                                
  LOS_X              LENGTH=4                                                   
  LABEL="Length of stay (as received from source)"                              
                                                                                
  MDC                LENGTH=3                                                   
  LABEL="MDC in effect on discharge date"                                       
                                                                                
  MDC18              LENGTH=3                                                   
  LABEL="MDC, version 18"                                                       
                                                                                
  NDX                LENGTH=3                                                   
  LABEL="Number of diagnoses on this record"                                    
                                                                                
  NEOMAT             LENGTH=3                                                   
  LABEL="Neonatal and/or maternal DX and/or PR"                                 
                                                                                
  NPR                LENGTH=3                                                   
  LABEL="Number of procedures on this record"                                   
                                                                                
  PAY1               LENGTH=3                                                   
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PAY1_X             LENGTH=$3                                                  
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PAYER1_X           LENGTH=$4                                                  
  LABEL="Primary expected payer plan identifier (as received from source)"      
                                                                                
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
                                                                                
  PR19               LENGTH=$4                                                  
  LABEL="Procedure 19"                                                          
                                                                                
  PR20               LENGTH=$4                                                  
  LABEL="Procedure 20"                                                          
                                                                                
  PR21               LENGTH=$4                                                  
  LABEL="Procedure 21"                                                          
                                                                                
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
                                                                                
  PRDAY19            LENGTH=4                                                   
  LABEL="Number of days from admission to PR19"                                 
                                                                                
  PRDAY20            LENGTH=4                                                   
  LABEL="Number of days from admission to PR20"                                 
                                                                                
  PRDAY21            LENGTH=4                                                   
  LABEL="Number of days from admission to PR21"                                 
                                                                                
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
      @1      AGE                 N3PF.                                         
      @4      AGEDAY              N3PF.                                         
      @7      AGEMONTH            N3PF.                                         
      @10     AMONTH              N2PF.                                         
      @12     ASCHED              N2PF.                                         
      @14     ASOURCE             N2PF.                                         
      @16     ASOURCE_X           $CHAR3.                                       
      @19     AWEEKEND            N2PF.                                         
      @21     DIED                N2PF.                                         
      @23     DISP_X              $CHAR2.                                       
      @25     DISPUNIFORM         N2PF.                                         
      @27     DNR                 N2PF.                                         
      @29     DQTR                N2PF.                                         
      @31     DRG                 N3PF.                                         
      @34     DRG18               N3PF.                                         
      @37     DRGVER              N2PF.                                         
      @39     DX1                 $CHAR5.                                       
      @44     DX2                 $CHAR5.                                       
      @49     DX3                 $CHAR5.                                       
      @54     DX4                 $CHAR5.                                       
      @59     DX5                 $CHAR5.                                       
      @64     DX6                 $CHAR5.                                       
      @69     DX7                 $CHAR5.                                       
      @74     DX8                 $CHAR5.                                       
      @79     DX9                 $CHAR5.                                       
      @84     DX10                $CHAR5.                                       
      @89     DX11                $CHAR5.                                       
      @94     DX12                $CHAR5.                                       
      @99     DX13                $CHAR5.                                       
      @104    DX14                $CHAR5.                                       
      @109    DX15                $CHAR5.                                       
      @114    DX16                $CHAR5.                                       
      @119    DX17                $CHAR5.                                       
      @124    DX18                $CHAR5.                                       
      @129    DX19                $CHAR5.                                       
      @134    DX20                $CHAR5.                                       
      @139    DX21                $CHAR5.                                       
      @144    DX22                $CHAR5.                                       
      @149    DX23                $CHAR5.                                       
      @154    DX24                $CHAR5.                                       
      @159    DX25                $CHAR5.                                       
      @164    DX26                $CHAR5.                                       
      @169    DX27                $CHAR5.                                       
      @174    DX28                $CHAR5.                                       
      @179    DX29                $CHAR5.                                       
      @184    DX30                $CHAR5.                                       
      @189    DXATADMIT1          N2PF.                                         
      @191    DXATADMIT2          N2PF.                                         
      @193    DXATADMIT3          N2PF.                                         
      @195    DXATADMIT4          N2PF.                                         
      @197    DXATADMIT5          N2PF.                                         
      @199    DXATADMIT6          N2PF.                                         
      @201    DXATADMIT7          N2PF.                                         
      @203    DXATADMIT8          N2PF.                                         
      @205    DXATADMIT9          N2PF.                                         
      @207    DXATADMIT10         N2PF.                                         
      @209    DXATADMIT11         N2PF.                                         
      @211    DXATADMIT12         N2PF.                                         
      @213    DXATADMIT13         N2PF.                                         
      @215    DXATADMIT14         N2PF.                                         
      @217    DXATADMIT15         N2PF.                                         
      @219    DXATADMIT16         N2PF.                                         
      @221    DXATADMIT17         N2PF.                                         
      @223    DXATADMIT18         N2PF.                                         
      @225    DXATADMIT19         N2PF.                                         
      @227    DXATADMIT20         N2PF.                                         
      @229    DXATADMIT21         N2PF.                                         
      @231    DXATADMIT22         N2PF.                                         
      @233    DXATADMIT23         N2PF.                                         
      @235    DXATADMIT24         N2PF.                                         
      @237    DXATADMIT25         N2PF.                                         
      @239    DXCCS1              N4PF.                                         
      @243    DXCCS2              N4PF.                                         
      @247    DXCCS3              N4PF.                                         
      @251    DXCCS4              N4PF.                                         
      @255    DXCCS5              N4PF.                                         
      @259    DXCCS6              N4PF.                                         
      @263    DXCCS7              N4PF.                                         
      @267    DXCCS8              N4PF.                                         
      @271    DXCCS9              N4PF.                                         
      @275    DXCCS10             N4PF.                                         
      @279    DXCCS11             N4PF.                                         
      @283    DXCCS12             N4PF.                                         
      @287    DXCCS13             N4PF.                                         
      @291    DXCCS14             N4PF.                                         
      @295    DXCCS15             N4PF.                                         
      @299    DXCCS16             N4PF.                                         
      @303    DXCCS17             N4PF.                                         
      @307    DXCCS18             N4PF.                                         
      @311    DXCCS19             N4PF.                                         
      @315    DXCCS20             N4PF.                                         
      @319    DXCCS21             N4PF.                                         
      @323    DXCCS22             N4PF.                                         
      @327    DXCCS23             N4PF.                                         
      @331    DXCCS24             N4PF.                                         
      @335    DXCCS25             N4PF.                                         
      @339    DXCCS26             N4PF.                                         
      @343    DXCCS27             N4PF.                                         
      @347    DXCCS28             N4PF.                                         
      @351    DXCCS29             N4PF.                                         
      @355    DXCCS30             N4PF.                                         
      @359    FEMALE              N2PF.                                         
      @361    HISPANIC_X          $CHAR1.                                       
      @362    HOSPST              $CHAR2.                                       
      @364    LEVELCARE           $CHAR1.                                       
      @365    LOS                 N5PF.                                         
      @370    LOS_X               N6PF.                                         
      @376    MDC                 N2PF.                                         
      @378    MDC18               N2PF.                                         
      @380    NDX                 N2PF.                                         
      @382    NEOMAT              N2PF.                                         
      @384    NPR                 N2PF.                                         
      @386    PAY1                N2PF.                                         
      @388    PAY1_X              $CHAR3.                                       
      @391    PAYER1_X            $CHAR4.                                       
      @395    PNUM_S              $CHAR17.                                      
      @412    PR1                 $CHAR4.                                       
      @416    PR2                 $CHAR4.                                       
      @420    PR3                 $CHAR4.                                       
      @424    PR4                 $CHAR4.                                       
      @428    PR5                 $CHAR4.                                       
      @432    PR6                 $CHAR4.                                       
      @436    PR7                 $CHAR4.                                       
      @440    PR8                 $CHAR4.                                       
      @444    PR9                 $CHAR4.                                       
      @448    PR10                $CHAR4.                                       
      @452    PR11                $CHAR4.                                       
      @456    PR12                $CHAR4.                                       
      @460    PR13                $CHAR4.                                       
      @464    PR14                $CHAR4.                                       
      @468    PR15                $CHAR4.                                       
      @472    PR16                $CHAR4.                                       
      @476    PR17                $CHAR4.                                       
      @480    PR18                $CHAR4.                                       
      @484    PR19                $CHAR4.                                       
      @488    PR20                $CHAR4.                                       
      @492    PR21                $CHAR4.                                       
      @496    PRCCS1              N3PF.                                         
      @499    PRCCS2              N3PF.                                         
      @502    PRCCS3              N3PF.                                         
      @505    PRCCS4              N3PF.                                         
      @508    PRCCS5              N3PF.                                         
      @511    PRCCS6              N3PF.                                         
      @514    PRCCS7              N3PF.                                         
      @517    PRCCS8              N3PF.                                         
      @520    PRCCS9              N3PF.                                         
      @523    PRCCS10             N3PF.                                         
      @526    PRCCS11             N3PF.                                         
      @529    PRCCS12             N3PF.                                         
      @532    PRCCS13             N3PF.                                         
      @535    PRCCS14             N3PF.                                         
      @538    PRCCS15             N3PF.                                         
      @541    PRCCS16             N3PF.                                         
      @544    PRCCS17             N3PF.                                         
      @547    PRCCS18             N3PF.                                         
      @550    PRCCS19             N3PF.                                         
      @553    PRCCS20             N3PF.                                         
      @556    PRCCS21             N3PF.                                         
      @559    PRDAY1              N5PF.                                         
      @564    PRDAY2              N5PF.                                         
      @569    PRDAY3              N5PF.                                         
      @574    PRDAY4              N5PF.                                         
      @579    PRDAY5              N5PF.                                         
      @584    PRDAY6              N5PF.                                         
      @589    PRDAY7              N5PF.                                         
      @594    PRDAY8              N5PF.                                         
      @599    PRDAY9              N5PF.                                         
      @604    PRDAY10             N5PF.                                         
      @609    PRDAY11             N5PF.                                         
      @614    PRDAY12             N5PF.                                         
      @619    PRDAY13             N5PF.                                         
      @624    PRDAY14             N5PF.                                         
      @629    PRDAY15             N5PF.                                         
      @634    PRDAY16             N5PF.                                         
      @639    PRDAY17             N5PF.                                         
      @644    PRDAY18             N5PF.                                         
      @649    PRDAY19             N5PF.                                         
      @654    PRDAY20             N5PF.                                         
      @659    PRDAY21             N5PF.                                         
      @664    RACE                N2PF.                                         
      @666    RACE_X              $CHAR1.                                       
      @667    TOTCHG              N10PF.                                        
      @677    TOTCHG_X            N15P2F.                                       
      @692    YEAR                N4PF.                                         
      ;                                                                         
                                                                                
                                                                                
RUN;
