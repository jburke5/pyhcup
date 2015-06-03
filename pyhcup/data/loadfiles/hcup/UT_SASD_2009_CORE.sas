/*******************************************************************            
*   UT_SASD_2009_CORE.SAS:                                                      
*      THE SAS CODE SHOWN BELOW WILL LOAD THE ASCII                             
*      OUTPATIENT SASD CORE FILE INTO SAS                                       
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
DATA UT_SASDC_2009_CORE;                                                        
INFILE 'UT_SASD_2009_CORE.ASC' LRECL = 531;                                     
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  AGE                        LENGTH=3                                           
  LABEL="Age in years at admission"                                             
                                                                                
  AGEDAY                     LENGTH=3                                           
  LABEL="Age in days (when age < 1 year)"                                       
                                                                                
  AGEMONTH                   LENGTH=3                                           
  LABEL="Age in months (when age < 11 years)"                                   
                                                                                
  AMONTH                     LENGTH=3                                           
  LABEL="Admission month"                                                       
                                                                                
  APG1                       LENGTH=3                                           
  LABEL="Ambulatory Patient Group 1 (as received from source)"                  
                                                                                
  APG2                       LENGTH=3                                           
  LABEL="Ambulatory Patient Group 2 (as received from source)"                  
                                                                                
  APG3                       LENGTH=3                                           
  LABEL="Ambulatory Patient Group 3 (as received from source)"                  
                                                                                
  APG4                       LENGTH=3                                           
  LABEL="Ambulatory Patient Group 4 (as received from source)"                  
                                                                                
  APG5                       LENGTH=3                                           
  LABEL="Ambulatory Patient Group 5 (as received from source)"                  
                                                                                
  APG6                       LENGTH=3                                           
  LABEL="Ambulatory Patient Group 6 (as received from source)"                  
                                                                                
  APGCAT1                    LENGTH=3                                           
  LABEL="Ambulatory Patient Group Category 1 (as received from source)"         
                                                                                
  APGCAT2                    LENGTH=3                                           
  LABEL="Ambulatory Patient Group Category 2 (as received from source)"         
                                                                                
  APGCAT3                    LENGTH=3                                           
  LABEL="Ambulatory Patient Group Category 3 (as received from source)"         
                                                                                
  APGCAT4                    LENGTH=3                                           
  LABEL="Ambulatory Patient Group Category 4 (as received from source)"         
                                                                                
  APGCAT5                    LENGTH=3                                           
  LABEL="Ambulatory Patient Group Category 5 (as received from source)"         
                                                                                
  APGCAT6                    LENGTH=3                                           
  LABEL="Ambulatory Patient Group Category 6 (as received from source)"         
                                                                                
  APGTYPE1                   LENGTH=3                                           
  LABEL="Ambulatory Patient Group Type 1 (as received from source)"             
                                                                                
  APGTYPE2                   LENGTH=3                                           
  LABEL="Ambulatory Patient Group Type 1 (as received from source)"             
                                                                                
  APGTYPE3                   LENGTH=3                                           
  LABEL="Ambulatory Patient Group Type 1 (as received from source)"             
                                                                                
  APGTYPE4                   LENGTH=3                                           
  LABEL="Ambulatory Patient Group Type 1 (as received from source)"             
                                                                                
  APGTYPE5                   LENGTH=3                                           
  LABEL="Ambulatory Patient Group Type 1 (as received from source)"             
                                                                                
  APGTYPE6                   LENGTH=3                                           
  LABEL="Ambulatory Patient Group Type 1 (as received from source)"             
                                                                                
  AWEEKEND                   LENGTH=3                                           
  LABEL="Admission day is a weekend"                                            
                                                                                
  CPT1                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 1"                                            
                                                                                
  CPT2                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 2"                                            
                                                                                
  CPT3                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 3"                                            
                                                                                
  CPT4                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 4"                                            
                                                                                
  CPT5                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 5"                                            
                                                                                
  CPT6                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 6"                                            
                                                                                
  CPTCCS1                    LENGTH=4                                           
  LABEL="CCS: CPT 1"                                                            
                                                                                
  CPTCCS2                    LENGTH=4                                           
  LABEL="CCS: CPT 2"                                                            
                                                                                
  CPTCCS3                    LENGTH=4                                           
  LABEL="CCS: CPT 3"                                                            
                                                                                
  CPTCCS4                    LENGTH=4                                           
  LABEL="CCS: CPT 4"                                                            
                                                                                
  CPTCCS5                    LENGTH=4                                           
  LABEL="CCS: CPT 5"                                                            
                                                                                
  CPTCCS6                    LENGTH=4                                           
  LABEL="CCS: CPT 6"                                                            
                                                                                
  CPTM1_1                    LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 1"                                          
                                                                                
  CPTM1_2                    LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 2"                                          
                                                                                
  CPTM1_3                    LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 3"                                          
                                                                                
  CPTM1_4                    LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 4"                                          
                                                                                
  CPTM1_5                    LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 5"                                          
                                                                                
  CPTM1_6                    LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 6"                                          
                                                                                
  CPTM2_1                    LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 1"                                         
                                                                                
  CPTM2_2                    LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 2"                                         
                                                                                
  CPTM2_3                    LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 3"                                         
                                                                                
  CPTM2_4                    LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 4"                                         
                                                                                
  CPTM2_5                    LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 5"                                         
                                                                                
  CPTM2_6                    LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 6"                                         
                                                                                
  DIED                       LENGTH=3                                           
  LABEL="Died during hospitalization"                                           
                                                                                
  DISPUB04                   LENGTH=3                                           
  LABEL="Disposition of patient (UB-04 standard coding)"                        
                                                                                
  DISPUNIFORM                LENGTH=3                                           
  LABEL="Disposition of patient (uniform)"                                      
                                                                                
  DISP_X                     LENGTH=$2                                          
  LABEL="Disposition of patient (as received from source)"                      
                                                                                
  DQTR                       LENGTH=3                                           
  LABEL="Discharge quarter"                                                     
                                                                                
  DSHOSPID                   LENGTH=$17                                         
  LABEL="Data source hospital identifier"                                       
                                                                                
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
                                                                                
  FEMALE                     LENGTH=3                                           
  LABEL="Indicator of sex"                                                      
                                                                                
  HCUP_AS                    LENGTH=3                                           
  LABEL="HCUP Ambulatory Surgery service indicator"                             
                                                                                
  HCUP_ED                    LENGTH=3                                           
  LABEL="HCUP Emergency Department service indicator"                           
                                                                                
  HCUP_OS                    LENGTH=3                                           
  LABEL="HCUP Observation Stay service indicator"                               
                                                                                
  HOSPBRTH                   LENGTH=3                                           
  LABEL="Indicator of birth in this hospital"                                   
                                                                                
  HOSPST                     LENGTH=$2                                          
  LABEL="Hospital state postal code"                                            
                                                                                
  Homeless                   LENGTH=3                                           
  LABEL="Indicator that patient is homeless"                                    
                                                                                
  KEY                        LENGTH=8                 FORMAT=Z18.               
  LABEL="HCUP record identifier"                                                
                                                                                
  LOS                        LENGTH=4                                           
  LABEL="Length of stay (cleaned)"                                              
                                                                                
  LOS_X                      LENGTH=4                                           
  LABEL="Length of stay (as received from source)"                              
                                                                                
  MEDINCSTQ                  LENGTH=3                                           
  LABEL="Median household income state quartile for patient ZIP Code"           
                                                                                
  NCHRONIC                   LENGTH=3                                           
  LABEL="Number of chronic conditions"                                          
                                                                                
  NCPT                       LENGTH=3                                           
  LABEL="Number of CPT/HCPCS procedures on this record"                         
                                                                                
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
                                                                                
  PAY1                       LENGTH=3                                           
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PAY1_X                     LENGTH=$2                                          
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PAY2                       LENGTH=3                                           
  LABEL="Secondary expected payer (uniform)"                                    
                                                                                
  PAY2_X                     LENGTH=$2                                          
  LABEL="Secondary expected payer (as received from source)"                    
                                                                                
  PAY3_X                     LENGTH=$2                                          
  LABEL="Tertiary expected payer (as received from source)"                     
                                                                                
  PL_CBSA                    LENGTH=3                                           
  LABEL="Patient location: Core Based Statistical Area (CBSA)"                  
                                                                                
  PL_MSA1993                 LENGTH=3                                           
  LABEL="Patient location: Metropolitan Statistical Area (MSA), 1993"           
                                                                                
  PL_NCHS2006                LENGTH=3                                           
  LABEL="Patient Location: NCHS Urban-Rural Code (V2006)"                       
                                                                                
  PL_RUCA10_2005             LENGTH=3                                           
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes, ten levels" 
                                                                                
  PL_RUCA2005                LENGTH=4                 FORMAT=4.1                
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes"             
                                                                                
  PL_RUCA4_2005              LENGTH=3                                           
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes, four levels"
                                                                                
  PL_RUCC2003                LENGTH=3                                           
  LABEL="Patient location: Rural-Urban Continuum Codes(RUCC), 2003"             
                                                                                
  PL_UIC2003                 LENGTH=3                                           
  LABEL="Patient location: Urban Influence Codes, 2003"                         
                                                                                
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
                                                                                
  PROCTYPE                   LENGTH=3                                           
  LABEL="Procedure type indicator"                                              
                                                                                
  PSTATE                     LENGTH=$2                                          
  LABEL="Patient State postal code"                                             
                                                                                
  PSTCO                      LENGTH=4                 FORMAT=Z5.                
  LABEL="Patient state/county FIPS code"                                        
                                                                                
  PSTCO2                     LENGTH=4                 FORMAT=Z5.                
  LABEL="Patient state/county FIPS code, possibly derived from ZIP Code"        
                                                                                
  PointOfOriginUB04          LENGTH=$1                                          
  LABEL="Point of origin for admission or visit, UB-04 standard coding"         
                                                                                
  PointOfOrigin_X            LENGTH=$1                                          
  LABEL="Point of origin for admission or visit, as received from source"       
                                                                                
  STATE_AS                   LENGTH=3                                           
  LABEL="State Ambulatory Surgery service indicator"                            
                                                                                
  STATE_ED                   LENGTH=3                                           
  LABEL="State Emergency Department service indicator"                          
                                                                                
  STATE_OS                   LENGTH=3                                           
  LABEL="State Observation Stay service indicator"                              
                                                                                
  TOTCHG                     LENGTH=6                                           
  LABEL="Total charges (cleaned)"                                               
                                                                                
  TOTCHG_X                   LENGTH=7                                           
  LABEL="Total charges (as received from source)"                               
                                                                                
  VisitLink                  LENGTH=8                                           
  LABEL="Visit linkage variable"                                                
                                                                                
  YEAR                       LENGTH=3                                           
  LABEL="Calendar year"                                                         
                                                                                
  ZIP3                       LENGTH=$3                                          
  LABEL="Patient ZIP Code, first 3 digits"                                      
                                                                                
  ZIPINC_QRTL                LENGTH=3                                           
  LABEL="Median household income national quartile for patient ZIP Code"        
                                                                                
  ZIP                        LENGTH=$5                                          
  LABEL="Patient ZIP Code"                                                      
                                                                                
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
                                                                                
  PRYEAR1                    LENGTH=3                                           
  LABEL="Year of procedure 1"                                                   
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      AGE                      N3PF.                                    
      @4      AGEDAY                   N3PF.                                    
      @7      AGEMONTH                 N3PF.                                    
      @10     AMONTH                   N2PF.                                    
      @12     APG1                     N4PF.                                    
      @16     APG2                     N4PF.                                    
      @20     APG3                     N4PF.                                    
      @24     APG4                     N4PF.                                    
      @28     APG5                     N4PF.                                    
      @32     APG6                     N4PF.                                    
      @36     APGCAT1                  N3PF.                                    
      @39     APGCAT2                  N3PF.                                    
      @42     APGCAT3                  N3PF.                                    
      @45     APGCAT4                  N3PF.                                    
      @48     APGCAT5                  N3PF.                                    
      @51     APGCAT6                  N3PF.                                    
      @54     APGTYPE1                 N3PF.                                    
      @57     APGTYPE2                 N3PF.                                    
      @60     APGTYPE3                 N3PF.                                    
      @63     APGTYPE4                 N3PF.                                    
      @66     APGTYPE5                 N3PF.                                    
      @69     APGTYPE6                 N3PF.                                    
      @72     AWEEKEND                 N2PF.                                    
      @74     CPT1                     $CHAR5.                                  
      @79     CPT2                     $CHAR5.                                  
      @84     CPT3                     $CHAR5.                                  
      @89     CPT4                     $CHAR5.                                  
      @94     CPT5                     $CHAR5.                                  
      @99     CPT6                     $CHAR5.                                  
      @104    CPTCCS1                  N3PF.                                    
      @107    CPTCCS2                  N3PF.                                    
      @110    CPTCCS3                  N3PF.                                    
      @113    CPTCCS4                  N3PF.                                    
      @116    CPTCCS5                  N3PF.                                    
      @119    CPTCCS6                  N3PF.                                    
      @122    CPTM1_1                  $CHAR2.                                  
      @124    CPTM1_2                  $CHAR2.                                  
      @126    CPTM1_3                  $CHAR2.                                  
      @128    CPTM1_4                  $CHAR2.                                  
      @130    CPTM1_5                  $CHAR2.                                  
      @132    CPTM1_6                  $CHAR2.                                  
      @134    CPTM2_1                  $CHAR2.                                  
      @136    CPTM2_2                  $CHAR2.                                  
      @138    CPTM2_3                  $CHAR2.                                  
      @140    CPTM2_4                  $CHAR2.                                  
      @142    CPTM2_5                  $CHAR2.                                  
      @144    CPTM2_6                  $CHAR2.                                  
      @146    DIED                     N2PF.                                    
      @148    DISPUB04                 N2PF.                                    
      @150    DISPUNIFORM              N2PF.                                    
      @152    DISP_X                   $CHAR2.                                  
      @154    DQTR                     N2PF.                                    
      @156    DSHOSPID                 $CHAR17.                                 
      @173    DX1                      $CHAR5.                                  
      @178    DX2                      $CHAR5.                                  
      @183    DX3                      $CHAR5.                                  
      @188    DX4                      $CHAR5.                                  
      @193    DX5                      $CHAR5.                                  
      @198    DX6                      $CHAR5.                                  
      @203    DX7                      $CHAR5.                                  
      @208    DX8                      $CHAR5.                                  
      @213    DX9                      $CHAR5.                                  
      @218    DXCCS1                   N4PF.                                    
      @222    DXCCS2                   N4PF.                                    
      @226    DXCCS3                   N4PF.                                    
      @230    DXCCS4                   N4PF.                                    
      @234    DXCCS5                   N4PF.                                    
      @238    DXCCS6                   N4PF.                                    
      @242    DXCCS7                   N4PF.                                    
      @246    DXCCS8                   N4PF.                                    
      @250    DXCCS9                   N4PF.                                    
      @254    DaysToEvent              N6PF.                                    
      @260    ECODE1                   $CHAR5.                                  
      @265    ECODE2                   $CHAR5.                                  
      @270    ECODE3                   $CHAR5.                                  
      @275    ECODE4                   $CHAR5.                                  
      @280    ECODE5                   $CHAR5.                                  
      @285    E_CCS1                   N4PF.                                    
      @289    E_CCS2                   N4PF.                                    
      @293    E_CCS3                   N4PF.                                    
      @297    E_CCS4                   N4PF.                                    
      @301    E_CCS5                   N4PF.                                    
      @305    FEMALE                   N2PF.                                    
      @307    HCUP_AS                  N2PF.                                    
      @309    HCUP_ED                  N2PF.                                    
      @311    HCUP_OS                  N2PF.                                    
      @313    HOSPBRTH                 N3PF.                                    
      @316    HOSPST                   $CHAR2.                                  
      @318    Homeless                 N2PF.                                    
      @320    KEY                      14.                                      
      @334    LOS                      N5PF.                                    
      @339    LOS_X                    N6PF.                                    
      @345    MEDINCSTQ                N2PF.                                    
      @347    NCHRONIC                 N3PF.                                    
      @350    NCPT                     N3PF.                                    
      @353    NDX                      N2PF.                                    
      @355    NECODE                   N2PF.                                    
      @357    NEOMAT                   N2PF.                                    
      @359    NPR                      N2PF.                                    
      @361    ORPROC                   N2PF.                                    
      @363    PAY1                     N2PF.                                    
      @365    PAY1_X                   $CHAR2.                                  
      @367    PAY2                     N2PF.                                    
      @369    PAY2_X                   $CHAR2.                                  
      @371    PAY3_X                   $CHAR2.                                  
      @373    PL_CBSA                  N3PF.                                    
      @376    PL_MSA1993               N3PF.                                    
      @379    PL_NCHS2006              N2PF.                                    
      @381    PL_RUCA10_2005           N2PF.                                    
      @383    PL_RUCA2005              N4P1F.                                   
      @387    PL_RUCA4_2005            N2PF.                                    
      @389    PL_RUCC2003              N2PF.                                    
      @391    PL_UIC2003               N2PF.                                    
      @393    PL_UR_CAT4               N2PF.                                    
      @395    PR1                      $CHAR4.                                  
      @399    PR2                      $CHAR4.                                  
      @403    PR3                      $CHAR4.                                  
      @407    PR4                      $CHAR4.                                  
      @411    PR5                      $CHAR4.                                  
      @415    PR6                      $CHAR4.                                  
      @419    PRCCS1                   N3PF.                                    
      @422    PRCCS2                   N3PF.                                    
      @425    PRCCS3                   N3PF.                                    
      @428    PRCCS4                   N3PF.                                    
      @431    PRCCS5                   N3PF.                                    
      @434    PRCCS6                   N3PF.                                    
      @437    PRDAY1                   N5PF.                                    
      @442    PROCTYPE                 N3PF.                                    
      @445    PSTATE                   $CHAR2.                                  
      @447    PSTCO                    N5PF.                                    
      @452    PSTCO2                   N5PF.                                    
      @457    PointOfOriginUB04        $CHAR1.                                  
      @458    PointOfOrigin_X          $CHAR1.                                  
      @459    STATE_AS                 N2PF.                                    
      @461    STATE_ED                 N2PF.                                    
      @463    STATE_OS                 N2PF.                                    
      @465    TOTCHG                   N10PF.                                   
      @475    TOTCHG_X                 N15P2F.                                  
      @490    VisitLink                N9PF.                                    
      @499    YEAR                     N4PF.                                    
      @503    ZIP3                     $CHAR3.                                  
      @506    ZIPINC_QRTL              N3PF.                                    
      @509    ZIP                      $CHAR5.                                  
      @514    AYEAR                    N4PF.                                    
      @518    DMONTH                   N2PF.                                    
      @520    BMONTH                   N2PF.                                    
      @522    BYEAR                    N4PF.                                    
      @526    PRMONTH1                 N2PF.                                    
      @528    PRYEAR1                  N4PF.                                    
      ;                                                                         
                                                                                
                                                                                
RUN;
