/*******************************************************************            
* Creation Date: 11/26/2014                                                     
*   NE_SID_2013_CORE.SAS:                                                       
*      THE SAS CODE SHOWN BELOW WILL LOAD THE ASCII                             
*      INPATIENT STAY CORE FILE INTO SAS                                        
*******************************************************************/            
                                                                                
                                                                                
***************************************************************;                
* ----------------------------------------------------------- *;                
* |  NOTICE: Use of HCUP data constitutes acceptance of the | *;                
* |  terms and conditions of the HCUP Data Use Agreement.   | *;                
* ----------------------------------------------------------- *;                
***************************************************************;                
                                                                                
                                                                                
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
  INVALUE N11P2F                                                                
    '-9999999.99' = .                                                           
    '-8888888.88' = .A                                                          
    '-6666666.66' = .C                                                          
    OTHER = (|11.2|)                                                            
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
DATA NE_SIDC_2013_CORE;                                                         
INFILE 'NE_SID_2013_CORE.ASC' FIRSTOBS=3 LRECL = 528;                           
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  AGE                        LENGTH=3                                           
  LABEL="Age in years at admission"                                             
                                                                                
  AGEDAY                     LENGTH=3                                           
  LABEL="Age in days (when age < 1 year)"                                       
                                                                                
  AGEMONTH                   LENGTH=3                                           
  LABEL="Age in months (when age < 11 years)"                                   
                                                                                
  AHOUR                      LENGTH=3                 FORMAT=Z4.                
  LABEL="Admission Hour"                                                        
                                                                                
  AMONTH                     LENGTH=3                                           
  LABEL="Admission month"                                                       
                                                                                
  ATYPE                      LENGTH=3                                           
  LABEL="Admission type"                                                        
                                                                                
  AWEEKEND                   LENGTH=3                                           
  LABEL="Admission day is a weekend"                                            
                                                                                
  BILLTYPE                   LENGTH=$4                                          
  LABEL="Type of bill, UB-04 coding"                                            
                                                                                
  BLOOD                      LENGTH=4                                           
  LABEL="Pints of blood furnished to the patient"                               
                                                                                
  DHOUR                      LENGTH=3                 FORMAT=Z4.                
  LABEL="Discharge Hour"                                                        
                                                                                
  DIED                       LENGTH=3                                           
  LABEL="Died during hospitalization"                                           
                                                                                
  DISPUB04                   LENGTH=3                                           
  LABEL="Disposition of patient (UB-04 standard coding)"                        
                                                                                
  DISPUNIFORM                LENGTH=3                                           
  LABEL="Disposition of patient (uniform)"                                      
                                                                                
  DISP_X                     LENGTH=$2                                          
  LABEL="Disposition of patient (as received from source)"                      
                                                                                
  DMONTH                     LENGTH=3                                           
  LABEL="Discharge month"                                                       
                                                                                
  DQTR                       LENGTH=3                                           
  LABEL="Discharge quarter"                                                     
                                                                                
  DRG                        LENGTH=3                                           
  LABEL="DRG in effect on discharge date"                                       
                                                                                
  DRG24                      LENGTH=3                                           
  LABEL="DRG, version 24"                                                       
                                                                                
  DRGVER                     LENGTH=3                                           
  LABEL="DRG grouper version used on discharge date"                            
                                                                                
  DRG_NoPOA                  LENGTH=3                                           
  LABEL="DRG in use on discharge date, calculated without POA"                  
                                                                                
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
                                                                                
  DXPOA1                     LENGTH=$1                                          
  LABEL="Diagnosis 1, present on admission indicator"                           
                                                                                
  DXPOA2                     LENGTH=$1                                          
  LABEL="Diagnosis 2, present on admission indicator"                           
                                                                                
  DXPOA3                     LENGTH=$1                                          
  LABEL="Diagnosis 3, present on admission indicator"                           
                                                                                
  DXPOA4                     LENGTH=$1                                          
  LABEL="Diagnosis 4, present on admission indicator"                           
                                                                                
  DXPOA5                     LENGTH=$1                                          
  LABEL="Diagnosis 5, present on admission indicator"                           
                                                                                
  DXPOA6                     LENGTH=$1                                          
  LABEL="Diagnosis 6, present on admission indicator"                           
                                                                                
  DXPOA7                     LENGTH=$1                                          
  LABEL="Diagnosis 7, present on admission indicator"                           
                                                                                
  DXPOA8                     LENGTH=$1                                          
  LABEL="Diagnosis 8, present on admission indicator"                           
                                                                                
  DXPOA9                     LENGTH=$1                                          
  LABEL="Diagnosis 9, present on admission indicator"                           
                                                                                
  DX_Admitting               LENGTH=$5                                          
  LABEL="Admitting Diagnosis Code"                                              
                                                                                
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
                                                                                
  E_POA1                     LENGTH=$1                                          
  LABEL="E Code 1, present on admission indicator"                              
                                                                                
  E_POA2                     LENGTH=$1                                          
  LABEL="E Code 2, present on admission indicator"                              
                                                                                
  E_POA3                     LENGTH=$1                                          
  LABEL="E Code 3, present on admission indicator"                              
                                                                                
  E_POA4                     LENGTH=$1                                          
  LABEL="E Code 4, present on admission indicator"                              
                                                                                
  E_POA5                     LENGTH=$1                                          
  LABEL="E Code 5, present on admission indicator"                              
                                                                                
  E_POA6                     LENGTH=$1                                          
  LABEL="E Code 6, present on admission indicator"                              
                                                                                
  FEMALE                     LENGTH=3                                           
  LABEL="Indicator of sex"                                                      
                                                                                
  HCUP_ED                    LENGTH=3                                           
  LABEL="HCUP Emergency Department service indicator"                           
                                                                                
  HCUP_OS                    LENGTH=3                                           
  LABEL="HCUP Observation Stay service indicator"                               
                                                                                
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
                                                                                
  MARITALSTATUSUB04          LENGTH=$1                                          
  LABEL="Patient's marital status, UB-04 standard coding"                       
                                                                                
  MARITALSTATUS_X            LENGTH=$1                                          
  LABEL="Patient's marital status (as received from source)"                    
                                                                                
  MDC                        LENGTH=3                                           
  LABEL="MDC in effect on discharge date"                                       
                                                                                
  MDC24                      LENGTH=3                                           
  LABEL="MDC, version 24"                                                       
                                                                                
  MDC_NoPOA                  LENGTH=3                                           
  LABEL="MDC in use on discharge date, calculated without POA"                  
                                                                                
  MEDINCSTQ                  LENGTH=3                                           
  LABEL="Median household income state quartile for patient ZIP Code"           
                                                                                
  NCHRONIC                   LENGTH=3                                           
  LABEL="Number of chronic conditions"                                          
                                                                                
  NDX                        LENGTH=3                                           
  LABEL="Number of diagnoses on this record"                                    
                                                                                
  NECODE                     LENGTH=3                                           
  LABEL="Number of E codes on this record"                                      
                                                                                
  NEOMAT                     LENGTH=3                                           
  LABEL="Neonatal and/or maternal DX and/or PR"                                 
                                                                                
  NPR                        LENGTH=3                                           
  LABEL="Number of procedures on this record"                                   
                                                                                
  ORPROC                     LENGTH=3                                           
  LABEL="Major operating room procedure indicator"                              
                                                                                
  OS_TIME                    LENGTH=4                                           
  LABEL="Observation stay time summed from UNITS"                               
                                                                                
  P7EDSRC_X                  LENGTH=$2                                          
  LABEL="Condition Code P7, Direct Inpatient Admission from Emergency Room"     
                                                                                
  PAY1                       LENGTH=3                                           
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PAY1_X                     LENGTH=$2                                          
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PAY2                       LENGTH=3                                           
  LABEL="Secondary expected payer (uniform)"                                    
                                                                                
  PAY2_X                     LENGTH=$2                                          
  LABEL="Secondary expected payer (as received from source)"                    
                                                                                
  PAY3                       LENGTH=3                                           
  LABEL="Tertiary expected payer (uniform)"                                     
                                                                                
  PAY3_X                     LENGTH=$2                                          
  LABEL="Tertiary expected payer (as received from source)"                     
                                                                                
  PL_CBSA                    LENGTH=3                                           
  LABEL="Patient location: Core Based Statistical Area (CBSA)"                  
                                                                                
  PL_NCHS                    LENGTH=3                                           
  LABEL="Patient Location: NCHS Urban-Rural Code"                               
                                                                                
  PL_RUCA10_2005             LENGTH=3                                           
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes, ten levels" 
                                                                                
  PL_RUCA2005                LENGTH=4                 FORMAT=4.1                
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes"             
                                                                                
  PL_RUCA4_2005              LENGTH=3                                           
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes, four levels"
                                                                                
  PL_RUCC                    LENGTH=3                                           
  LABEL="Patient location: Rural-Urban Continuum Codes(RUCC)"                   
                                                                                
  PL_UIC                     LENGTH=3                                           
  LABEL="Patient location: Urban Influence Codes"                               
                                                                                
  PL_UR_CAT4                 LENGTH=3                                           
  LABEL="Patient Location: Urban-Rural 4 Categories"                            
                                                                                
  PR1                        LENGTH=$4                                          
  LABEL="Procedure 1"                                                           
                                                                                
  PR2                        LENGTH=$4                                          
  LABEL="Procedure 2"                                                           
                                                                                
  PR3                        LENGTH=$4                                          
  LABEL="Procedure 3"                                                           
                                                                                
  PR4                        LENGTH=$4                                          
  LABEL="Procedure 4"                                                           
                                                                                
  PR5                        LENGTH=$4                                          
  LABEL="Procedure 5"                                                           
                                                                                
  PR6                        LENGTH=$4                                          
  LABEL="Procedure 6"                                                           
                                                                                
  PRCCS1                     LENGTH=3                                           
  LABEL="CCS: procedure 1"                                                      
                                                                                
  PRCCS2                     LENGTH=3                                           
  LABEL="CCS: procedure 2"                                                      
                                                                                
  PRCCS3                     LENGTH=3                                           
  LABEL="CCS: procedure 3"                                                      
                                                                                
  PRCCS4                     LENGTH=3                                           
  LABEL="CCS: procedure 4"                                                      
                                                                                
  PRCCS5                     LENGTH=3                                           
  LABEL="CCS: procedure 5"                                                      
                                                                                
  PRCCS6                     LENGTH=3                                           
  LABEL="CCS: procedure 6"                                                      
                                                                                
  PRDAY1                     LENGTH=4                                           
  LABEL="Number of days from admission to PR1"                                  
                                                                                
  PRDAY2                     LENGTH=4                                           
  LABEL="Number of days from admission to PR2"                                  
                                                                                
  PRDAY3                     LENGTH=4                                           
  LABEL="Number of days from admission to PR3"                                  
                                                                                
  PRDAY4                     LENGTH=4                                           
  LABEL="Number of days from admission to PR4"                                  
                                                                                
  PRDAY5                     LENGTH=4                                           
  LABEL="Number of days from admission to PR5"                                  
                                                                                
  PRDAY6                     LENGTH=4                                           
  LABEL="Number of days from admission to PR6"                                  
                                                                                
  PROCTYPE                   LENGTH=3                                           
  LABEL="Procedure type indicator"                                              
                                                                                
  PSTATE                     LENGTH=$2                                          
  LABEL="Patient State postal code"                                             
                                                                                
  PSTCO2                     LENGTH=4                 FORMAT=Z5.                
  LABEL="Patient state/county FIPS code, possibly derived from ZIP Code"        
                                                                                
  PointOfOriginUB04          LENGTH=$1                                          
  LABEL="Point of origin for admission or visit, UB-04 standard coding"         
                                                                                
  PointOfOrigin_X            LENGTH=$1                                          
  LABEL="Point of origin for admission or visit, as received from source"       
                                                                                
  TOTCHG                     LENGTH=6                                           
  LABEL="Total charges (cleaned)"                                               
                                                                                
  TOTCHG_X                   LENGTH=7                                           
  LABEL="Total charges (as received from source)"                               
                                                                                
  TRAN_IN                    LENGTH=3                                           
  LABEL="Transfer in indicator"                                                 
                                                                                
  TRAN_OUT                   LENGTH=3                                           
  LABEL="Transfer out indicator"                                                
                                                                                
  VisitLink                  LENGTH=8                                           
  LABEL="Visit linkage variable"                                                
                                                                                
  YEAR                       LENGTH=3                                           
  LABEL="Calendar year"                                                         
                                                                                
  ZIPINC_QRTL                LENGTH=3                                           
  LABEL="Median household income national quartile for patient ZIP Code"        
                                                                                
  TOWN                       LENGTH=$30                                         
  LABEL="Patient town of residence (as received from source)"                   
                                                                                
  ZIP                        LENGTH=$5                                          
  LABEL="Patient ZIP Code"                                                      
                                                                                
  AYEAR                      LENGTH=3                                           
  LABEL="Admission year"                                                        
                                                                                
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
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      AGE                      N3PF.                                    
      @4      AGEDAY                   N3PF.                                    
      @7      AGEMONTH                 N3PF.                                    
      @10     AHOUR                    N4PF.                                    
      @14     AMONTH                   N2PF.                                    
      @16     ATYPE                    N2PF.                                    
      @18     AWEEKEND                 N2PF.                                    
      @20     BILLTYPE                 $CHAR4.                                  
      @24     BLOOD                    N6PF.                                    
      @30     DHOUR                    N4PF.                                    
      @34     DIED                     N2PF.                                    
      @36     DISPUB04                 N2PF.                                    
      @38     DISPUNIFORM              N2PF.                                    
      @40     DISP_X                   $CHAR2.                                  
      @42     DMONTH                   N2PF.                                    
      @44     DQTR                     N2PF.                                    
      @46     DRG                      N3PF.                                    
      @49     DRG24                    N3PF.                                    
      @52     DRGVER                   N2PF.                                    
      @54     DRG_NoPOA                N3PF.                                    
      @57     DX1                      $CHAR5.                                  
      @62     DX2                      $CHAR5.                                  
      @67     DX3                      $CHAR5.                                  
      @72     DX4                      $CHAR5.                                  
      @77     DX5                      $CHAR5.                                  
      @82     DX6                      $CHAR5.                                  
      @87     DX7                      $CHAR5.                                  
      @92     DX8                      $CHAR5.                                  
      @97     DX9                      $CHAR5.                                  
      @102    DXCCS1                   N4PF.                                    
      @106    DXCCS2                   N4PF.                                    
      @110    DXCCS3                   N4PF.                                    
      @114    DXCCS4                   N4PF.                                    
      @118    DXCCS5                   N4PF.                                    
      @122    DXCCS6                   N4PF.                                    
      @126    DXCCS7                   N4PF.                                    
      @130    DXCCS8                   N4PF.                                    
      @134    DXCCS9                   N4PF.                                    
      @138    DXPOA1                   $CHAR1.                                  
      @139    DXPOA2                   $CHAR1.                                  
      @140    DXPOA3                   $CHAR1.                                  
      @141    DXPOA4                   $CHAR1.                                  
      @142    DXPOA5                   $CHAR1.                                  
      @143    DXPOA6                   $CHAR1.                                  
      @144    DXPOA7                   $CHAR1.                                  
      @145    DXPOA8                   $CHAR1.                                  
      @146    DXPOA9                   $CHAR1.                                  
      @147    DX_Admitting             $CHAR5.                                  
      @152    DaysToEvent              N6PF.                                    
      @158    ECODE1                   $CHAR5.                                  
      @163    ECODE2                   $CHAR5.                                  
      @168    ECODE3                   $CHAR5.                                  
      @173    ECODE4                   $CHAR5.                                  
      @178    ECODE5                   $CHAR5.                                  
      @183    ECODE6                   $CHAR5.                                  
      @188    E_CCS1                   N4PF.                                    
      @192    E_CCS2                   N4PF.                                    
      @196    E_CCS3                   N4PF.                                    
      @200    E_CCS4                   N4PF.                                    
      @204    E_CCS5                   N4PF.                                    
      @208    E_CCS6                   N4PF.                                    
      @212    E_POA1                   $CHAR1.                                  
      @213    E_POA2                   $CHAR1.                                  
      @214    E_POA3                   $CHAR1.                                  
      @215    E_POA4                   $CHAR1.                                  
      @216    E_POA5                   $CHAR1.                                  
      @217    E_POA6                   $CHAR1.                                  
      @218    FEMALE                   N2PF.                                    
      @220    HCUP_ED                  N2PF.                                    
      @222    HCUP_OS                  N2PF.                                    
      @224    HOSPBRTH                 N3PF.                                    
      @227    HOSPST                   $CHAR2.                                  
      @229    KEY                      15.                                      
      @244    LOS                      N5PF.                                    
      @249    LOS_X                    N6PF.                                    
      @255    MARITALSTATUSUB04        $CHAR1.                                  
      @256    MARITALSTATUS_X          $CHAR1.                                  
      @257    MDC                      N2PF.                                    
      @259    MDC24                    N2PF.                                    
      @261    MDC_NoPOA                N2PF.                                    
      @263    MEDINCSTQ                N2PF.                                    
      @265    NCHRONIC                 N3PF.                                    
      @268    NDX                      N2PF.                                    
      @270    NECODE                   N2PF.                                    
      @272    NEOMAT                   N2PF.                                    
      @274    NPR                      N2PF.                                    
      @276    ORPROC                   N2PF.                                    
      @278    OS_TIME                  N8PF.                                    
      @286    P7EDSRC_X                $CHAR2.                                  
      @288    PAY1                     N2PF.                                    
      @290    PAY1_X                   $CHAR2.                                  
      @292    PAY2                     N2PF.                                    
      @294    PAY2_X                   $CHAR2.                                  
      @296    PAY3                     N2PF.                                    
      @298    PAY3_X                   $CHAR2.                                  
      @300    PL_CBSA                  N3PF.                                    
      @303    PL_NCHS                  N2PF.                                    
      @305    PL_RUCA10_2005           N2PF.                                    
      @307    PL_RUCA2005              N4P1F.                                   
      @311    PL_RUCA4_2005            N2PF.                                    
      @313    PL_RUCC                  N2PF.                                    
      @315    PL_UIC                   N2PF.                                    
      @317    PL_UR_CAT4               N2PF.                                    
      @319    PR1                      $CHAR4.                                  
      @323    PR2                      $CHAR4.                                  
      @327    PR3                      $CHAR4.                                  
      @331    PR4                      $CHAR4.                                  
      @335    PR5                      $CHAR4.                                  
      @339    PR6                      $CHAR4.                                  
      @343    PRCCS1                   N3PF.                                    
      @346    PRCCS2                   N3PF.                                    
      @349    PRCCS3                   N3PF.                                    
      @352    PRCCS4                   N3PF.                                    
      @355    PRCCS5                   N3PF.                                    
      @358    PRCCS6                   N3PF.                                    
      @361    PRDAY1                   N5PF.                                    
      @366    PRDAY2                   N5PF.                                    
      @371    PRDAY3                   N5PF.                                    
      @376    PRDAY4                   N5PF.                                    
      @381    PRDAY5                   N5PF.                                    
      @386    PRDAY6                   N5PF.                                    
      @391    PROCTYPE                 N3PF.                                    
      @394    PSTATE                   $CHAR2.                                  
      @396    PSTCO2                   N5PF.                                    
      @401    PointOfOriginUB04        $CHAR1.                                  
      @402    PointOfOrigin_X          $CHAR1.                                  
      @403    TOTCHG                   N10PF.                                   
      @413    TOTCHG_X                 N15P2F.                                  
      @428    TRAN_IN                  N2PF.                                    
      @430    TRAN_OUT                 N2PF.                                    
      @432    VisitLink                N9PF.                                    
      @441    YEAR                     N4PF.                                    
      @445    ZIPINC_QRTL              N3PF.                                    
      @448    TOWN                     $CHAR30.                                 
      @478    ZIP                      $CHAR5.                                  
      @483    AYEAR                    N4PF.                                    
      @487    BMONTH                   N2PF.                                    
      @489    BYEAR                    N4PF.                                    
      @493    PRMONTH1                 N2PF.                                    
      @495    PRMONTH2                 N2PF.                                    
      @497    PRMONTH3                 N2PF.                                    
      @499    PRMONTH4                 N2PF.                                    
      @501    PRMONTH5                 N2PF.                                    
      @503    PRMONTH6                 N2PF.                                    
      @505    PRYEAR1                  N4PF.                                    
      @509    PRYEAR2                  N4PF.                                    
      @513    PRYEAR3                  N4PF.                                    
      @517    PRYEAR4                  N4PF.                                    
      @521    PRYEAR5                  N4PF.                                    
      @525    PRYEAR6                  N4PF.                                    
      ;                                                                         
                                                                                
                                                                                
RUN;
