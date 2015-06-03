/*******************************************************************            
*   UT_SASD_2007_CORE.SAS:                                                      
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
DATA UT_SASDC_2007_CORE;                                                        
INFILE 'UT_SASD_2007_CORE.ASC' LRECL = 483;                                     
                                                                                
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
                                                                                
  ASOURCE                    LENGTH=3                                           
  LABEL="Admission source (uniform)"                                            
                                                                                
  ASOURCEUB92                LENGTH=$1                                          
  LABEL="Admission source (UB-92 standard coding)"                              
                                                                                
  ASOURCE_X                  LENGTH=$1                                          
  LABEL="Admission source (as received from source)"                            
                                                                                
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
                                                                                
  DSHOSPID                   LENGTH=$13                                         
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
                                                                                
  KEY                        LENGTH=8                 FORMAT=Z14.               
  LABEL="HCUP record identifier"                                                
                                                                                
  LOS                        LENGTH=4                                           
  LABEL="Length of stay (cleaned)"                                              
                                                                                
  LOS_X                      LENGTH=4                                           
  LABEL="Length of stay (as received from source)"                              
                                                                                
  MEDINCSTQ                  LENGTH=3                                           
  LABEL="Median household income state quartile for patient ZIP Code"           
                                                                                
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
                                                                                
  PSTCO2                     LENGTH=4                 FORMAT=Z5.                
  LABEL="Patient state/county FIPS code, possibly derived from ZIP Code"        
                                                                                
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
                                                                                
  YEAR                       LENGTH=3                                           
  LABEL="Calendar year"                                                         
                                                                                
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
      @72     ASOURCE                  N2PF.                                    
      @74     ASOURCEUB92              $CHAR1.                                  
      @75     ASOURCE_X                $CHAR1.                                  
      @76     AWEEKEND                 N2PF.                                    
      @78     CPT1                     $CHAR5.                                  
      @83     CPT2                     $CHAR5.                                  
      @88     CPT3                     $CHAR5.                                  
      @93     CPT4                     $CHAR5.                                  
      @98     CPT5                     $CHAR5.                                  
      @103    CPT6                     $CHAR5.                                  
      @108    CPTM1_1                  $CHAR2.                                  
      @110    CPTM1_2                  $CHAR2.                                  
      @112    CPTM1_3                  $CHAR2.                                  
      @114    CPTM1_4                  $CHAR2.                                  
      @116    CPTM1_5                  $CHAR2.                                  
      @118    CPTM1_6                  $CHAR2.                                  
      @120    CPTM2_1                  $CHAR2.                                  
      @122    CPTM2_2                  $CHAR2.                                  
      @124    CPTM2_3                  $CHAR2.                                  
      @126    CPTM2_4                  $CHAR2.                                  
      @128    CPTM2_5                  $CHAR2.                                  
      @130    CPTM2_6                  $CHAR2.                                  
      @132    DIED                     N2PF.                                    
      @134    DISPUB04                 N2PF.                                    
      @136    DISPUNIFORM              N2PF.                                    
      @138    DISP_X                   $CHAR2.                                  
      @140    DQTR                     N2PF.                                    
      @142    DSHOSPID                 $CHAR13.                                 
      @155    DX1                      $CHAR5.                                  
      @160    DX2                      $CHAR5.                                  
      @165    DX3                      $CHAR5.                                  
      @170    DX4                      $CHAR5.                                  
      @175    DX5                      $CHAR5.                                  
      @180    DX6                      $CHAR5.                                  
      @185    DX7                      $CHAR5.                                  
      @190    DX8                      $CHAR5.                                  
      @195    DX9                      $CHAR5.                                  
      @200    DXCCS1                   N4PF.                                    
      @204    DXCCS2                   N4PF.                                    
      @208    DXCCS3                   N4PF.                                    
      @212    DXCCS4                   N4PF.                                    
      @216    DXCCS5                   N4PF.                                    
      @220    DXCCS6                   N4PF.                                    
      @224    DXCCS7                   N4PF.                                    
      @228    DXCCS8                   N4PF.                                    
      @232    DXCCS9                   N4PF.                                    
      @236    ECODE1                   $CHAR5.                                  
      @241    ECODE2                   $CHAR5.                                  
      @246    ECODE3                   $CHAR5.                                  
      @251    ECODE4                   $CHAR5.                                  
      @256    ECODE5                   $CHAR5.                                  
      @261    E_CCS1                   N4PF.                                    
      @265    E_CCS2                   N4PF.                                    
      @269    E_CCS3                   N4PF.                                    
      @273    E_CCS4                   N4PF.                                    
      @277    E_CCS5                   N4PF.                                    
      @281    FEMALE                   N2PF.                                    
      @283    HCUP_AS                  N2PF.                                    
      @285    HCUP_ED                  N2PF.                                    
      @287    HCUP_OS                  N2PF.                                    
      @289    HOSPBRTH                 N3PF.                                    
      @292    HOSPST                   $CHAR2.                                  
      @294    Homeless                 N2PF.                                    
      @296    KEY                      14.                                      
      @310    LOS                      N5PF.                                    
      @315    LOS_X                    N6PF.                                    
      @321    MEDINCSTQ                N2PF.                                    
      @323    NCPT                     N3PF.                                    
      @326    NDX                      N2PF.                                    
      @328    NECODE                   N2PF.                                    
      @330    NEOMAT                   N2PF.                                    
      @332    NPR                      N2PF.                                    
      @334    PAY1                     N2PF.                                    
      @336    PAY1_X                   $CHAR2.                                  
      @338    PAY2                     N2PF.                                    
      @340    PAY2_X                   $CHAR2.                                  
      @342    PAY3_X                   $CHAR2.                                  
      @344    PL_CBSA                  N3PF.                                    
      @347    PL_MSA1993               N3PF.                                    
      @350    PL_NCHS2006              N2PF.                                    
      @352    PL_RUCA10_2005           N2PF.                                    
      @354    PL_RUCA2005              N4P1F.                                   
      @358    PL_RUCA4_2005            N2PF.                                    
      @360    PL_RUCC2003              N2PF.                                    
      @362    PL_UIC2003               N2PF.                                    
      @364    PL_UR_CAT4               N2PF.                                    
      @366    PR1                      $CHAR4.                                  
      @370    PR2                      $CHAR4.                                  
      @374    PR3                      $CHAR4.                                  
      @378    PR4                      $CHAR4.                                  
      @382    PR5                      $CHAR4.                                  
      @386    PR6                      $CHAR4.                                  
      @390    PRCCS1                   N3PF.                                    
      @393    PRCCS2                   N3PF.                                    
      @396    PRCCS3                   N3PF.                                    
      @399    PRCCS4                   N3PF.                                    
      @402    PRCCS5                   N3PF.                                    
      @405    PRCCS6                   N3PF.                                    
      @408    PRDAY1                   N5PF.                                    
      @413    PROCTYPE                 N3PF.                                    
      @416    PSTATE                   $CHAR2.                                  
      @418    PSTCO2                   N5PF.                                    
      @423    STATE_AS                 N2PF.                                    
      @425    STATE_ED                 N2PF.                                    
      @427    STATE_OS                 N2PF.                                    
      @429    TOTCHG                   N10PF.                                   
      @439    TOTCHG_X                 N15P2F.                                  
      @454    YEAR                     N4PF.                                    
      @458    ZIPINC_QRTL              N3PF.                                    
      @461    ZIP                      $CHAR5.                                  
      @466    AYEAR                    N4PF.                                    
      @470    DMONTH                   N2PF.                                    
      @472    BMONTH                   N2PF.                                    
      @474    BYEAR                    N4PF.                                    
      @478    PRMONTH1                 N2PF.                                    
      @480    PRYEAR1                  N4PF.                                    
      ;                                                                         
                                                                                
                                                                                
RUN;
