/*******************************************************************            
*   ME_SID_2000_CORE.SAS:                                                       
*      THE SAS CODE SHOWN BELOW WILL CONVERT THE ASCII                          
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
DATA ME_SIDC_2000_CORE;                                                         
INFILE 'ME_SIDC_2000_CORE.ASC' LRECL = 359;                                     
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  KEY                LENGTH=8                                                   
  LABEL="HCUP record identifier"                                   FORMAT=Z14.  
  ADRG               LENGTH=3                                                   
  LABEL="All Patient Refined DRG"                                               
  AGE                LENGTH=3                                                   
  LABEL="Age in years at admission"                                             
  AGEDAY             LENGTH=3                                                   
  LABEL="Age in days (when age < 1 year)"                                       
  AGEMONTH           LENGTH=3                                                   
  LABEL="Age in months (when age < 11 years)"                                   
  AMDC               LENGTH=3                                                   
  LABEL="All Patient Refined MDC"                                               
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
  FEMALE             LENGTH=3                                                   
  LABEL="Indicator of sex"                                                      
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
  MDSPEC             LENGTH=$2                                                  
  LABEL="Attending Physician specialty (as received from source)"               
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
  PSTCO              LENGTH=4                                                   
  LABEL="Patient state/county FIPS code"                                        
  SURGSPEC           LENGTH=$2                                                  
  LABEL="Primary surgeon specialty code (as received from source)"              
  TOTCHG             LENGTH=6                                                   
  LABEL="Total charges (cleaned)"                                               
  TOTCHG_X           LENGTH=7                                                   
  LABEL="Total charges (as received from source)"                               
  YEAR               LENGTH=3                                                   
  LABEL="Calendar year"                                                         
  ZIP_S              LENGTH=$5                                                  
  LABEL="Patient zip code (synthetic)"                                          
  AYEAR              LENGTH=3                                                   
  LABEL="Admission year"                                                        
  DMONTH             LENGTH=3                                                   
  LABEL="Discharge month"                                                       
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
;                                                                               
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      KEY                 14.                                           
      @15     ADRG                N3PF.                                         
      @18     AGE                 N3PF.                                         
      @21     AGEDAY              N3PF.                                         
      @24     AGEMONTH            N3PF.                                         
      @27     AMDC                N2PF.                                         
      @29     AMONTH              N2PF.                                         
      @31     ASOURCE             N2PF.                                         
      @33     ASOURCE_X           $CHAR1.                                       
      @34     ATYPE               N2PF.                                         
      @36     AWEEKEND            N2PF.                                         
      @38     BWT                 N4PF.                                         
      @42     DIED                N2PF.                                         
      @44     DISP_X              $CHAR2.                                       
      @46     DISPUB92            N2PF.                                         
      @48     DISPUNIFORM         N2PF.                                         
      @50     DQTR                N2PF.                                         
      @52     DRG                 N3PF.                                         
      @55     DRG18               N3PF.                                         
      @58     DRGVER              N2PF.                                         
      @60     DSHOSPID            $CHAR13.                                      
      @73     DX1                 $CHAR5.                                       
      @78     DX2                 $CHAR5.                                       
      @83     DX3                 $CHAR5.                                       
      @88     DX4                 $CHAR5.                                       
      @93     DX5                 $CHAR5.                                       
      @98     DX6                 $CHAR5.                                       
      @103    DX7                 $CHAR5.                                       
      @108    DX8                 $CHAR5.                                       
      @113    DX9                 $CHAR5.                                       
      @118    DX10                $CHAR5.                                       
      @123    DXCCS1              N4PF.                                         
      @127    DXCCS2              N4PF.                                         
      @131    DXCCS3              N4PF.                                         
      @135    DXCCS4              N4PF.                                         
      @139    DXCCS5              N4PF.                                         
      @143    DXCCS6              N4PF.                                         
      @147    DXCCS7              N4PF.                                         
      @151    DXCCS8              N4PF.                                         
      @155    DXCCS9              N4PF.                                         
      @159    DXCCS10             N4PF.                                         
      @163    FEMALE              N2PF.                                         
      @165    HOSPST              $CHAR2.                                       
      @167    LOS                 N5PF.                                         
      @172    LOS_X               N6PF.                                         
      @178    MDC                 N2PF.                                         
      @180    MDC18               N2PF.                                         
      @182    MDSPEC              $CHAR2.                                       
      @184    MRN_S               $CHAR17.                                      
      @201    NDX                 N2PF.                                         
      @203    NEOMAT              N2PF.                                         
      @205    NPR                 N2PF.                                         
      @207    PAY1                N2PF.                                         
      @209    PAY2                N2PF.                                         
      @211    PAY1_X              $CHAR2.                                       
      @213    PAY2_X              $CHAR2.                                       
      @215    PAY3_X              $CHAR2.                                       
      @217    PR1                 $CHAR4.                                       
      @221    PR2                 $CHAR4.                                       
      @225    PR3                 $CHAR4.                                       
      @229    PR4                 $CHAR4.                                       
      @233    PR5                 $CHAR4.                                       
      @237    PR6                 $CHAR4.                                       
      @241    PRCCS1              N3PF.                                         
      @244    PRCCS2              N3PF.                                         
      @247    PRCCS3              N3PF.                                         
      @250    PRCCS4              N3PF.                                         
      @253    PRCCS5              N3PF.                                         
      @256    PRCCS6              N3PF.                                         
      @259    PRDAY1              N3PF.                                         
      @262    PRDAY2              N3PF.                                         
      @265    PRDAY3              N3PF.                                         
      @268    PRDAY4              N3PF.                                         
      @271    PRDAY5              N3PF.                                         
      @274    PRDAY6              N3PF.                                         
      @277    PSTCO               N5PF.                                         
      @282    SURGSPEC            $CHAR2.                                       
      @284    TOTCHG              N10PF.                                        
      @294    TOTCHG_X            N15P2F.                                       
      @309    YEAR                N4PF.                                         
      @313    ZIP_S               $CHAR5.                                       
      @318    AYEAR               N4PF.                                         
      @322    DMONTH              N2PF.                                         
      @324    PRMONTH1            N2PF.                                         
      @326    PRMONTH2            N2PF.                                         
      @328    PRMONTH3            N2PF.                                         
      @330    PRMONTH4            N2PF.                                         
      @332    PRMONTH5            N2PF.                                         
      @334    PRMONTH6            N2PF.                                         
      @336    PRYEAR1             N4PF.                                         
      @340    PRYEAR2             N4PF.                                         
      @344    PRYEAR3             N4PF.                                         
      @348    PRYEAR4             N4PF.                                         
      @352    PRYEAR5             N4PF.                                         
      @356    PRYEAR6             N4PF.                                         
;                                                                               
                                                                                
                                                                                
RUN;
