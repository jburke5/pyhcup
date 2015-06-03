/*******************************************************************            
*   HI_SID_1997_CORE.SAS:                                                       
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
DATA HI_SIDC_1997_CORE;                                                         
INFILE 'HI_SID_1997_CORE.ASC' LRECL = 609;                                      
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  SEQ_SID                    LENGTH=7                 FORMAT=Z13.               
  LABEL="I:HCUP-3 SID record sequence number"                                   
                                                                                
  AGEDAY                     LENGTH=3                                           
  LABEL="I:Age in days (when < 1 year)"                                         
                                                                                
  SEX                        LENGTH=3                                           
  LABEL="I:Sex"                                                                 
                                                                                
  RACE                       LENGTH=3                                           
  LABEL="I:Race"                                                                
                                                                                
  DQTR                       LENGTH=3                                           
  LABEL="I:Discharge quarter"                                                   
                                                                                
  LOS                        LENGTH=4                                           
  LABEL="I:Length of stay (cleaned)"                                            
                                                                                
  DISP                       LENGTH=3                                           
  LABEL="I:Disposition of patient"                                              
                                                                                
  DIED                       LENGTH=3                                           
  LABEL="I:Died during hospitalization"                                         
                                                                                
  ATYPE                      LENGTH=3                                           
  LABEL="I:Admission type"                                                      
                                                                                
  ASOURCE                    LENGTH=3                                           
  LABEL="I:Admission source"                                                    
                                                                                
  NDX                        LENGTH=3                                           
  LABEL="I:Number of diagnoses on this discharge"                               
                                                                                
  DX1                        LENGTH=$5                                          
  LABEL="I:Principal diagnosis"                                                 
                                                                                
  DXV1                       LENGTH=3                                           
  LABEL="I:Validity flag: principal diagnosis"                                  
                                                                                
  DCCHPR1                    LENGTH=3                                           
  LABEL="I:CCHPR: principal diagnosis"                                          
                                                                                
  NPR                        LENGTH=3                                           
  LABEL="I:Number of procedures on this discharge"                              
                                                                                
  PR1                        LENGTH=$4                                          
  LABEL="I:Principal procedure"                                                 
                                                                                
  PRV1                       LENGTH=3                                           
  LABEL="I:Validity flag: principal procedure"                                  
                                                                                
  PCCHPR1                    LENGTH=3                                           
  LABEL="I:CCHPR: principal procedure"                                          
                                                                                
  DRG                        LENGTH=3                                           
  LABEL="I:DRG in effect on discharge date"                                     
                                                                                
  MDC                        LENGTH=3                                           
  LABEL="I:MDC in effect on discharge date"                                     
                                                                                
  DRGVER                     LENGTH=3                                           
  LABEL="I:DRG grouper version used on disch date"                              
                                                                                
  DRG10                      LENGTH=3                                           
  LABEL="I:DRG, Version 10"                                                     
                                                                                
  MDC10                      LENGTH=3                                           
  LABEL="I:MDC, Version 10"                                                     
                                                                                
  PAY1                       LENGTH=3                                           
  LABEL="I:Primary expected payer, uniform"                                     
                                                                                
  TOTCHG                     LENGTH=6                                           
  LABEL="I:Total charges (cleaned)"                                             
                                                                                
  PROCESS                    LENGTH=6                                           
  LABEL="I:HCUP-3 discharge processing ID number"                               
                                                                                
  YEAR                       LENGTH=3                                           
  LABEL="Calendar year"                                                         
                                                                                
  DSNUM                      LENGTH=3                                           
  LABEL="I:Data source ID number"                                               
                                                                                
  DSTYPE                     LENGTH=3                                           
  LABEL="I:Data source type"                                                    
                                                                                
  HOSPST                     LENGTH=$2                                          
  LABEL="Hospital state postal code"                                            
                                                                                
  MDID_S                     LENGTH=$16                                         
  LABEL="I:Attending physician number (synthetic)"                              
                                                                                
  SURGID_S                   LENGTH=$16                                         
  LABEL="I:Primary surgeon number (synthetic)"                                  
                                                                                
  ADAYWK                     LENGTH=3                                           
  LABEL="I:Admission day of week"                                               
                                                                                
  AMONTH                     LENGTH=3                                           
  LABEL="I:Admission month"                                                     
                                                                                
  LOS_X                      LENGTH=4                                           
  LABEL="I:Length of stay (uncleaned)"                                          
                                                                                
  NEOMAT                     LENGTH=3                                           
  LABEL="I:Neonatal and/or maternal DX and/or PR"                               
                                                                                
  DXSYS                      LENGTH=3                                           
  LABEL="I:Diagnosis coding system"                                             
                                                                                
  DSNDX                      LENGTH=3                                           
  LABEL="I:Max number of diagnoses from source"                                 
                                                                                
  PRSYS                      LENGTH=3                                           
  LABEL="I:Procedure coding system"                                             
                                                                                
  DSNPR                      LENGTH=3                                           
  LABEL="I:Max number of procedures from source"                                
                                                                                
  PRDAY1                     LENGTH=4                                           
  LABEL="I:No. of days from admission to PR1"                                   
                                                                                
  PAY1_N                     LENGTH=3                                           
  LABEL="I:Primary expected payer, nonuniform"                                  
                                                                                
  TOTCHG_X                   LENGTH=7                                           
  LABEL="I:Total charges (from data source)"                                    
                                                                                
  DX2                        LENGTH=$5                                          
  LABEL="I:Diagnosis 2"                                                         
                                                                                
  DX3                        LENGTH=$5                                          
  LABEL="I:Diagnosis 3"                                                         
                                                                                
  DX4                        LENGTH=$5                                          
  LABEL="I:Diagnosis 4"                                                         
                                                                                
  DX5                        LENGTH=$5                                          
  LABEL="I:Diagnosis 5"                                                         
                                                                                
  DX6                        LENGTH=$5                                          
  LABEL="I:Diagnosis 6"                                                         
                                                                                
  DX7                        LENGTH=$5                                          
  LABEL="I:Diagnosis 7"                                                         
                                                                                
  DX8                        LENGTH=$5                                          
  LABEL="I:Diagnosis 8"                                                         
                                                                                
  DX9                        LENGTH=$5                                          
  LABEL="I:Diagnosis 9"                                                         
                                                                                
  DX10                       LENGTH=$5                                          
  LABEL="I:Diagnosis 10"                                                        
                                                                                
  DX11                       LENGTH=$5                                          
  LABEL="I:Diagnosis 11"                                                        
                                                                                
  DXV2                       LENGTH=3                                           
  LABEL="I:Validity flag: diagnosis 2"                                          
                                                                                
  DXV3                       LENGTH=3                                           
  LABEL="I:Validity flag: diagnosis 3"                                          
                                                                                
  DXV4                       LENGTH=3                                           
  LABEL="I:Validity flag: diagnosis 4"                                          
                                                                                
  DXV5                       LENGTH=3                                           
  LABEL="I:Validity flag: diagnosis 5"                                          
                                                                                
  DXV6                       LENGTH=3                                           
  LABEL="I:Validity flag: diagnosis 6"                                          
                                                                                
  DXV7                       LENGTH=3                                           
  LABEL="I:Validity flag: diagnosis 7"                                          
                                                                                
  DXV8                       LENGTH=3                                           
  LABEL="I:Validity flag: diagnosis 8"                                          
                                                                                
  DXV9                       LENGTH=3                                           
  LABEL="I:Validity flag: diagnosis 9"                                          
                                                                                
  DXV10                      LENGTH=3                                           
  LABEL="I:Validity flag: diagnosis 10"                                         
                                                                                
  DXV11                      LENGTH=3                                           
  LABEL="I:Validity flag: diagnosis 11"                                         
                                                                                
  DCCHPR2                    LENGTH=3                                           
  LABEL="I:CCHPR: diagnosis 2"                                                  
                                                                                
  DCCHPR3                    LENGTH=3                                           
  LABEL="I:CCHPR: diagnosis 3"                                                  
                                                                                
  DCCHPR4                    LENGTH=3                                           
  LABEL="I:CCHPR: diagnosis 4"                                                  
                                                                                
  DCCHPR5                    LENGTH=3                                           
  LABEL="I:CCHPR: diagnosis 5"                                                  
                                                                                
  DCCHPR6                    LENGTH=3                                           
  LABEL="I:CCHPR: diagnosis 6"                                                  
                                                                                
  DCCHPR7                    LENGTH=3                                           
  LABEL="I:CCHPR: diagnosis 7"                                                  
                                                                                
  DCCHPR8                    LENGTH=3                                           
  LABEL="I:CCHPR: diagnosis 8"                                                  
                                                                                
  DCCHPR9                    LENGTH=3                                           
  LABEL="I:CCHPR: diagnosis 9"                                                  
                                                                                
  DCCHPR10                   LENGTH=3                                           
  LABEL="I:CCHPR: diagnosis 10"                                                 
                                                                                
  DCCHPR11                   LENGTH=3                                           
  LABEL="I:CCHPR: diagnosis 11"                                                 
                                                                                
  PR2                        LENGTH=$4                                          
  LABEL="I:Procedure 2"                                                         
                                                                                
  PR3                        LENGTH=$4                                          
  LABEL="I:Procedure 3"                                                         
                                                                                
  PR4                        LENGTH=$4                                          
  LABEL="I:Procedure 4"                                                         
                                                                                
  PR5                        LENGTH=$4                                          
  LABEL="I:Procedure 5"                                                         
                                                                                
  PR6                        LENGTH=$4                                          
  LABEL="I:Procedure 6"                                                         
                                                                                
  PR7                        LENGTH=$4                                          
  LABEL="I:Procedure 7"                                                         
                                                                                
  PR8                        LENGTH=$4                                          
  LABEL="I:Procedure 8"                                                         
                                                                                
  PR9                        LENGTH=$4                                          
  LABEL="I:Procedure 9"                                                         
                                                                                
  PR10                       LENGTH=$4                                          
  LABEL="I:Procedure 10"                                                        
                                                                                
  PRV2                       LENGTH=3                                           
  LABEL="I:Validity flag: procedure 2"                                          
                                                                                
  PRV3                       LENGTH=3                                           
  LABEL="I:Validity flag: procedure 3"                                          
                                                                                
  PRV4                       LENGTH=3                                           
  LABEL="I:Validity flag: procedure 4"                                          
                                                                                
  PRV5                       LENGTH=3                                           
  LABEL="I:Validity flag: procedure 5"                                          
                                                                                
  PRV6                       LENGTH=3                                           
  LABEL="I:Validity flag: procedure 6"                                          
                                                                                
  PRV7                       LENGTH=3                                           
  LABEL="I:Validity flag: procedure 7"                                          
                                                                                
  PRV8                       LENGTH=3                                           
  LABEL="I:Validity flag: procedure 8"                                          
                                                                                
  PRV9                       LENGTH=3                                           
  LABEL="I:Validity flag: procedure 9"                                          
                                                                                
  PRV10                      LENGTH=3                                           
  LABEL="I:Validity flag: procedure 10"                                         
                                                                                
  PCCHPR2                    LENGTH=3                                           
  LABEL="I:CCHPR: procedure 2"                                                  
                                                                                
  PCCHPR3                    LENGTH=3                                           
  LABEL="I:CCHPR: procedure 3"                                                  
                                                                                
  PCCHPR4                    LENGTH=3                                           
  LABEL="I:CCHPR: procedure 4"                                                  
                                                                                
  PCCHPR5                    LENGTH=3                                           
  LABEL="I:CCHPR: procedure 5"                                                  
                                                                                
  PCCHPR6                    LENGTH=3                                           
  LABEL="I:CCHPR: procedure 6"                                                  
                                                                                
  PCCHPR7                    LENGTH=3                                           
  LABEL="I:CCHPR: procedure 7"                                                  
                                                                                
  PCCHPR8                    LENGTH=3                                           
  LABEL="I:CCHPR: procedure 8"                                                  
                                                                                
  PCCHPR9                    LENGTH=3                                           
  LABEL="I:CCHPR: procedure 9"                                                  
                                                                                
  PCCHPR10                   LENGTH=3                                           
  LABEL="I:CCHPR: procedure 10"                                                 
                                                                                
  PRDAY2                     LENGTH=4                                           
  LABEL="I:No. of days from admission to PR2"                                   
                                                                                
  PRDAY3                     LENGTH=4                                           
  LABEL="I:No. of days from admission to PR3"                                   
                                                                                
  PRDAY4                     LENGTH=4                                           
  LABEL="I:No. of days from admission to PR4"                                   
                                                                                
  PRDAY5                     LENGTH=4                                           
  LABEL="I:No. of days from admission to PR5"                                   
                                                                                
  PRDAY6                     LENGTH=4                                           
  LABEL="I:No. of days from admission to PR6"                                   
                                                                                
  PRDAY7                     LENGTH=4                                           
  LABEL="I:No. of days from admission to PR7"                                   
                                                                                
  PRDAY8                     LENGTH=4                                           
  LABEL="I:No. of days from admission to PR8"                                   
                                                                                
  PRDAY9                     LENGTH=4                                           
  LABEL="I:No. of days from admission to PR9"                                   
                                                                                
  PRDAY10                    LENGTH=4                                           
  LABEL="I:No. of days from admission to PR10"                                  
                                                                                
  HOSPID                     LENGTH=4                 FORMAT=Z5.                
  LABEL="HCUP-3 hospital ID number (SSHHH)"                                     
                                                                                
  ZIP                        LENGTH=$5                                          
  LABEL="I:Patient zip code"                                                    
                                                                                
  MRN_S                      LENGTH=$18                                         
  LABEL="I:Medical record number (synthetic)"                                   
                                                                                
  PNUM_S                     LENGTH=$17                                         
  LABEL="I:Person number (synthetic)"                                           
                                                                                
  BWT                        LENGTH=4                                           
  LABEL="I:Birthweight in grams"                                                
                                                                                
  PAY1_X                     LENGTH=$20                                         
  LABEL="I:Primary exp. payer (from data source)"                               
                                                                                
  AGEGROUP                   LENGTH=3                                           
  LABEL="Age Group"                                                             
                                                                                
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
                                                                                
  PRMONTH2                   LENGTH=3                                           
  LABEL="Month of procedure 2"                                                  
                                                                                
  PRMONTH3                   LENGTH=3                                           
  LABEL="Month of procedure 3"                                                  
                                                                                
  PRMONTH4                   LENGTH=3                                           
  LABEL="Month of procedure 4"                                                  
                                                                                
  PRMONTH5                   LENGTH=3                                           
  LABEL="Month of procedure 5"                                                  
                                                                                
  PRMONTH6                   LENGTH=3                                           
  LABEL="Month of procedure 6"                                                  
                                                                                
  PRMONTH7                   LENGTH=3                                           
  LABEL="Month of procedure 7"                                                  
                                                                                
  PRMONTH8                   LENGTH=3                                           
  LABEL="Month of procedure 8"                                                  
                                                                                
  PRMONTH9                   LENGTH=3                                           
  LABEL="Month of procedure 9"                                                  
                                                                                
  PRMONTH10                  LENGTH=3                                           
  LABEL="Month of procedure 10"                                                 
                                                                                
  PRYEAR1                    LENGTH=3                                           
  LABEL="Year of procedure 1"                                                   
                                                                                
  PRYEAR2                    LENGTH=3                                           
  LABEL="Year of procedure 2"                                                   
                                                                                
  PRYEAR3                    LENGTH=3                                           
  LABEL="Year of procedure 3"                                                   
                                                                                
  PRYEAR4                    LENGTH=3                                           
  LABEL="Year of procedure 4"                                                   
                                                                                
  PRYEAR5                    LENGTH=3                                           
  LABEL="Year of procedure 5"                                                   
                                                                                
  PRYEAR6                    LENGTH=3                                           
  LABEL="Year of procedure 6"                                                   
                                                                                
  PRYEAR7                    LENGTH=3                                           
  LABEL="Year of procedure 7"                                                   
                                                                                
  PRYEAR8                    LENGTH=3                                           
  LABEL="Year of procedure 8"                                                   
                                                                                
  PRYEAR9                    LENGTH=3                                           
  LABEL="Year of procedure 9"                                                   
                                                                                
  PRYEAR10                   LENGTH=3                                           
  LABEL="Year of procedure 10"                                                  
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      SEQ_SID                  N13PF.                                   
      @14     AGEDAY                   N3PF.                                    
      @17     SEX                      N3PF.                                    
      @20     RACE                     N2PF.                                    
      @22     DQTR                     N2PF.                                    
      @24     LOS                      N5PF.                                    
      @29     DISP                     N2PF.                                    
      @31     DIED                     N2PF.                                    
      @33     ATYPE                    N2PF.                                    
      @35     ASOURCE                  N2PF.                                    
      @37     NDX                      N2PF.                                    
      @39     DX1                      $CHAR5.                                  
      @44     DXV1                     N4PF.                                    
      @48     DCCHPR1                  N4PF.                                    
      @52     NPR                      N2PF.                                    
      @54     PR1                      $CHAR4.                                  
      @58     PRV1                     N3PF.                                    
      @61     PCCHPR1                  N4PF.                                    
      @65     DRG                      N3PF.                                    
      @68     MDC                      N2PF.                                    
      @70     DRGVER                   N2PF.                                    
      @72     DRG10                    N3PF.                                    
      @75     MDC10                    N2PF.                                    
      @77     PAY1                     N2PF.                                    
      @79     TOTCHG                   N10PF.                                   
      @89     PROCESS                  N11PF.                                   
      @100    YEAR                     N4PF.                                    
      @104    DSNUM                    N3PF.                                    
      @107    DSTYPE                   N3PF.                                    
      @110    HOSPST                   $CHAR2.                                  
      @112    MDID_S                   $CHAR16.                                 
      @128    SURGID_S                 $CHAR16.                                 
      @144    ADAYWK                   N3PF.                                    
      @147    AMONTH                   N2PF.                                    
      @149    LOS_X                    N6PF.                                    
      @155    NEOMAT                   N2PF.                                    
      @157    DXSYS                    N3PF.                                    
      @160    DSNDX                    N3PF.                                    
      @163    PRSYS                    N3PF.                                    
      @166    DSNPR                    N3PF.                                    
      @169    PRDAY1                   N5PF.                                    
      @174    PAY1_N                   N3PF.                                    
      @177    TOTCHG_X                 N15P2F.                                  
      @192    DX2                      $CHAR5.                                  
      @197    DX3                      $CHAR5.                                  
      @202    DX4                      $CHAR5.                                  
      @207    DX5                      $CHAR5.                                  
      @212    DX6                      $CHAR5.                                  
      @217    DX7                      $CHAR5.                                  
      @222    DX8                      $CHAR5.                                  
      @227    DX9                      $CHAR5.                                  
      @232    DX10                     $CHAR5.                                  
      @237    DX11                     $CHAR5.                                  
      @242    DXV2                     N4PF.                                    
      @246    DXV3                     N4PF.                                    
      @250    DXV4                     N4PF.                                    
      @254    DXV5                     N4PF.                                    
      @258    DXV6                     N4PF.                                    
      @262    DXV7                     N4PF.                                    
      @266    DXV8                     N4PF.                                    
      @270    DXV9                     N4PF.                                    
      @274    DXV10                    N4PF.                                    
      @278    DXV11                    N4PF.                                    
      @282    DCCHPR2                  N4PF.                                    
      @286    DCCHPR3                  N4PF.                                    
      @290    DCCHPR4                  N4PF.                                    
      @294    DCCHPR5                  N4PF.                                    
      @298    DCCHPR6                  N4PF.                                    
      @302    DCCHPR7                  N4PF.                                    
      @306    DCCHPR8                  N4PF.                                    
      @310    DCCHPR9                  N4PF.                                    
      @314    DCCHPR10                 N4PF.                                    
      @318    DCCHPR11                 N4PF.                                    
      @322    PR2                      $CHAR4.                                  
      @326    PR3                      $CHAR4.                                  
      @330    PR4                      $CHAR4.                                  
      @334    PR5                      $CHAR4.                                  
      @338    PR6                      $CHAR4.                                  
      @342    PR7                      $CHAR4.                                  
      @346    PR8                      $CHAR4.                                  
      @350    PR9                      $CHAR4.                                  
      @354    PR10                     $CHAR4.                                  
      @358    PRV2                     N3PF.                                    
      @361    PRV3                     N3PF.                                    
      @364    PRV4                     N3PF.                                    
      @367    PRV5                     N3PF.                                    
      @370    PRV6                     N3PF.                                    
      @373    PRV7                     N3PF.                                    
      @376    PRV8                     N3PF.                                    
      @379    PRV9                     N3PF.                                    
      @382    PRV10                    N3PF.                                    
      @385    PCCHPR2                  N4PF.                                    
      @389    PCCHPR3                  N4PF.                                    
      @393    PCCHPR4                  N4PF.                                    
      @397    PCCHPR5                  N4PF.                                    
      @401    PCCHPR6                  N4PF.                                    
      @405    PCCHPR7                  N4PF.                                    
      @409    PCCHPR8                  N4PF.                                    
      @413    PCCHPR9                  N4PF.                                    
      @417    PCCHPR10                 N4PF.                                    
      @421    PRDAY2                   N5PF.                                    
      @426    PRDAY3                   N5PF.                                    
      @431    PRDAY4                   N5PF.                                    
      @436    PRDAY5                   N5PF.                                    
      @441    PRDAY6                   N5PF.                                    
      @446    PRDAY7                   N5PF.                                    
      @451    PRDAY8                   N5PF.                                    
      @456    PRDAY9                   N5PF.                                    
      @461    PRDAY10                  N5PF.                                    
      @466    HOSPID                   N5PF.                                    
      @471    ZIP                      $CHAR5.                                  
      @476    MRN_S                    $CHAR18.                                 
      @494    PNUM_S                   $CHAR17.                                 
      @511    BWT                      N4PF.                                    
      @515    PAY1_X                   $CHAR20.                                 
      @535    AGEGROUP                 N3PF.                                    
      @538    AYEAR                    N4PF.                                    
      @542    DMONTH                   N2PF.                                    
      @544    BMONTH                   N2PF.                                    
      @546    BYEAR                    N4PF.                                    
      @550    PRMONTH1                 N2PF.                                    
      @552    PRMONTH2                 N2PF.                                    
      @554    PRMONTH3                 N2PF.                                    
      @556    PRMONTH4                 N2PF.                                    
      @558    PRMONTH5                 N2PF.                                    
      @560    PRMONTH6                 N2PF.                                    
      @562    PRMONTH7                 N2PF.                                    
      @564    PRMONTH8                 N2PF.                                    
      @566    PRMONTH9                 N2PF.                                    
      @568    PRMONTH10                N2PF.                                    
      @570    PRYEAR1                  N4PF.                                    
      @574    PRYEAR2                  N4PF.                                    
      @578    PRYEAR3                  N4PF.                                    
      @582    PRYEAR4                  N4PF.                                    
      @586    PRYEAR5                  N4PF.                                    
      @590    PRYEAR6                  N4PF.                                    
      @594    PRYEAR7                  N4PF.                                    
      @598    PRYEAR8                  N4PF.                                    
      @602    PRYEAR9                  N4PF.                                    
      @606    PRYEAR10                 N4PF.                                    
      ;                                                                         
                                                                                
                                                                                
RUN;
