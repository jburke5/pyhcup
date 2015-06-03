/*******************************************************************            
*   MA_SID_1998_CORE.SAS:                                                       
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
DATA MA_SIDC_1998_CORE;                                                         
INFILE 'MA_SIDC_1998_CORE.ASC' LRECL = 337;                                     
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  KEY                LENGTH=8                                                   
  LABEL="HCUP record identifier"                                   FORMAT=Z14.  
  ADRG               LENGTH=3                                                   
  LABEL="All Patient Refined DRG"                                               
  ADRGRISKMORTALITY  LENGTH=3                                                   
  LABEL="All Patient Refined DRG mortality risk"                                
  ADRGSEV            LENGTH=3                                                   
  LABEL="All Patient Refined DRG severity level"                                
  AGE                LENGTH=3                                                   
  LABEL="Age in years at admission"                                             
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
  LABEL="Length of stay (uncleaned)"                                            
  MDC                LENGTH=3                                                   
  LABEL="MDC in effect on discharge date"                                       
  MDC10              LENGTH=3                                                   
  LABEL="MDC, version 10"                                                       
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
  PAY2               LENGTH=3                                                   
  LABEL="Secondary expected payer (uniform)"                                    
  PAY1_X             LENGTH=$1                                                  
  LABEL="Primary expected payer (as received from source)"                      
  PAY2_X             LENGTH=$1                                                  
  LABEL="Secondary expected payer (as received from source)"                    
  PAYER1_X           LENGTH=$3                                                  
  LABEL="Primary expected payer plan identifier (as received from source)"      
  PAYER2_X           LENGTH=$3                                                  
  LABEL="Secondary expected payer plan identifier (as received from source)"    
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
  PRDAY1             LENGTH=4                                                   
  LABEL="Number of days from admission to PR1"                                  
  PRDAY2             LENGTH=4                                                   
  LABEL="Number of days from admission to PR2"                                  
  PRDAY3             LENGTH=4                                                   
  LABEL="Number of days from admission to PR3"                                  
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
  PRYEAR1            LENGTH=3                                                   
  LABEL="Year of procedure 1"                                                   
  PRYEAR2            LENGTH=3                                                   
  LABEL="Year of procedure 2"                                                   
  PRYEAR3            LENGTH=3                                                   
  LABEL="Year of procedure 3"                                                   
;                                                                               
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      KEY                 14.                                           
      @15     ADRG                N3PF.                                         
      @18     ADRGRISKMORTALITY   N2PF.                                         
      @20     ADRGSEV             N2PF.                                         
      @22     AGE                 N3PF.                                         
      @25     AMDC                N2PF.                                         
      @27     AMONTH              N2PF.                                         
      @29     ASOURCE             N2PF.                                         
      @31     ASOURCE_X           $CHAR1.                                       
      @32     ATYPE               N2PF.                                         
      @34     AWEEKEND            N2PF.                                         
      @36     BWT                 N4PF.                                         
      @40     DIED                N2PF.                                         
      @42     DISPUB92            N2PF.                                         
      @44     DISPUNIFORM         N2PF.                                         
      @46     DISP_X              $CHAR2.                                       
      @48     DQTR                N2PF.                                         
      @50     DRG                 N3PF.                                         
      @53     DRG10               N3PF.                                         
      @56     DRG18               N3PF.                                         
      @59     DRGVER              N2PF.                                         
      @61     DSHOSPID            $CHAR13.                                      
      @74     DX1                 $CHAR5.                                       
      @79     DX2                 $CHAR5.                                       
      @84     DX3                 $CHAR5.                                       
      @89     DX4                 $CHAR5.                                       
      @94     DX5                 $CHAR5.                                       
      @99     DX6                 $CHAR5.                                       
      @104    DX7                 $CHAR5.                                       
      @109    DX8                 $CHAR5.                                       
      @114    DX9                 $CHAR5.                                       
      @119    DX10                $CHAR5.                                       
      @124    DXCCS1              N4PF.                                         
      @128    DXCCS2              N4PF.                                         
      @132    DXCCS3              N4PF.                                         
      @136    DXCCS4              N4PF.                                         
      @140    DXCCS5              N4PF.                                         
      @144    DXCCS6              N4PF.                                         
      @148    DXCCS7              N4PF.                                         
      @152    DXCCS8              N4PF.                                         
      @156    DXCCS9              N4PF.                                         
      @160    DXCCS10             N4PF.                                         
      @164    FEMALE              N2PF.                                         
      @166    HOSPST              $CHAR2.                                       
      @168    LOS                 N5PF.                                         
      @173    LOS_X               N6PF.                                         
      @179    MDC                 N2PF.                                         
      @181    MDC10               N2PF.                                         
      @183    MDC18               N2PF.                                         
      @185    NDX                 N2PF.                                         
      @187    NEOMAT              N2PF.                                         
      @189    NPR                 N2PF.                                         
      @191    PAY1                N2PF.                                         
      @193    PAY2                N2PF.                                         
      @195    PAY1_X              $CHAR1.                                       
      @196    PAY2_X              $CHAR1.                                       
      @197    PAYER1_X            $CHAR3.                                       
      @200    PAYER2_X            $CHAR3.                                       
      @203    PR1                 $CHAR4.                                       
      @207    PR2                 $CHAR4.                                       
      @211    PR3                 $CHAR4.                                       
      @215    PR4                 $CHAR4.                                       
      @219    PR5                 $CHAR4.                                       
      @223    PR6                 $CHAR4.                                       
      @227    PR7                 $CHAR4.                                       
      @231    PR8                 $CHAR4.                                       
      @235    PR9                 $CHAR4.                                       
      @239    PR10                $CHAR4.                                       
      @243    PRCCS1              N3PF.                                         
      @246    PRCCS2              N3PF.                                         
      @249    PRCCS3              N3PF.                                         
      @252    PRCCS4              N3PF.                                         
      @255    PRCCS5              N3PF.                                         
      @258    PRCCS6              N3PF.                                         
      @261    PRCCS7              N3PF.                                         
      @264    PRCCS8              N3PF.                                         
      @267    PRCCS9              N3PF.                                         
      @270    PRCCS10             N3PF.                                         
      @273    PRDAY1              N3PF.                                         
      @276    PRDAY2              N3PF.                                         
      @279    PRDAY3              N3PF.                                         
      @282    RACE                N2PF.                                         
      @284    RACE_X              $CHAR1.                                       
      @285    TOTCHG              N10PF.                                        
      @295    TOTCHG_X            N15P2F.                                       
      @310    YEAR                N4PF.                                         
      @314    AYEAR               N4PF.                                         
      @318    DMONTH              N2PF.                                         
      @320    PRMONTH1            N2PF.                                         
      @322    PRMONTH2            N2PF.                                         
      @324    PRMONTH3            N2PF.                                         
      @326    PRYEAR1             N4PF.                                         
      @330    PRYEAR2             N4PF.                                         
      @334    PRYEAR3             N4PF.                                         
;                                                                               
                                                                                
                                                                                
RUN;
