/*******************************************************************            
*   NY_SASD_2000_CORE.SAS:                                                      
*      THE SAS CODE SHOWN BELOW WILL CONVERT THE ASCII                          
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
DATA NY_SASDC_2000_CORE;                                                        
INFILE 'NY_SASDC_2000_CORE.ASC' LRECL = 220;                                    
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  KEY                LENGTH=8                                                   
  LABEL="HCUP record identifier"                                   FORMAT=Z14.  
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
  AWEEKEND           LENGTH=3                                                   
  LABEL="Admission day is a weekend"                                            
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
  FEMALE             LENGTH=3                                                   
  LABEL="Indicator of sex"                                                      
  HOSPST             LENGTH=$2                                                  
  LABEL="Hospital state postal code"                                            
  LOS                LENGTH=4                                                   
  LABEL="Length of stay (cleaned)"                                              
  LOS_X              LENGTH=4                                                   
  LABEL="Length of stay (as received from source)"                              
  NDX                LENGTH=3                                                   
  LABEL="Number of diagnoses on this record"                                    
  NEOMAT             LENGTH=3                                                   
  LABEL="Neonatal and/or maternal DX and/or PR"                                 
  NPR                LENGTH=3                                                   
  LABEL="Number of procedures on this record"                                   
  ORTIME             LENGTH=4                                                   
  LABEL="Operating room time"                                                   
  PAY1               LENGTH=3                                                   
  LABEL="Primary expected payer (uniform)"                                      
  PAY1_X             LENGTH=$2                                                  
  LABEL="Primary expected payer (as received from source)"                      
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
  PSTCO              LENGTH=4                                                   
  LABEL="Patient state/county FIPS code"                                        
  SURGID_S           LENGTH=$16                                                 
  LABEL="Primary surgeon number (synthetic)"                                    
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
;                                                                               
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      KEY                 14.                                           
      @15     AGE                 N3PF.                                         
      @18     AGEDAY              N3PF.                                         
      @21     AGEMONTH            N3PF.                                         
      @24     AMONTH              N2PF.                                         
      @26     ANESTH              N3PF.                                         
      @29     AWEEKEND            N2PF.                                         
      @31     DIED                N2PF.                                         
      @33     DISP_X              $CHAR2.                                       
      @35     DISPUB92            N2PF.                                         
      @37     DISPUNIFORM         N2PF.                                         
      @39     DQTR                N2PF.                                         
      @41     DSHOSPID            $CHAR13.                                      
      @54     DX1                 $CHAR5.                                       
      @59     DX2                 $CHAR5.                                       
      @64     DX3                 $CHAR5.                                       
      @69     DX4                 $CHAR5.                                       
      @74     DX5                 $CHAR5.                                       
      @79     DX6                 $CHAR5.                                       
      @84     DXCCS1              N4PF.                                         
      @88     DXCCS2              N4PF.                                         
      @92     DXCCS3              N4PF.                                         
      @96     DXCCS4              N4PF.                                         
      @100    DXCCS5              N4PF.                                         
      @104    DXCCS6              N4PF.                                         
      @108    FEMALE              N2PF.                                         
      @110    HOSPST              $CHAR2.                                       
      @112    LOS                 N5PF.                                         
      @117    LOS_X               N6PF.                                         
      @123    NDX                 N2PF.                                         
      @125    NEOMAT              N2PF.                                         
      @127    NPR                 N2PF.                                         
      @129    ORTIME              N4PF.                                         
      @133    PAY1                N2PF.                                         
      @135    PAY1_X              $CHAR2.                                       
      @137    PR1                 $CHAR4.                                       
      @141    PR2                 $CHAR4.                                       
      @145    PR3                 $CHAR4.                                       
      @149    PR4                 $CHAR4.                                       
      @153    PR5                 $CHAR4.                                       
      @157    PR6                 $CHAR4.                                       
      @161    PRCCS1              N3PF.                                         
      @164    PRCCS2              N3PF.                                         
      @167    PRCCS3              N3PF.                                         
      @170    PRCCS4              N3PF.                                         
      @173    PRCCS5              N3PF.                                         
      @176    PRCCS6              N3PF.                                         
      @179    PSTCO               N5PF.                                         
      @184    SURGID_S            $CHAR16.                                      
      @200    YEAR                N4PF.                                         
      @204    ZIP                 $CHAR5.                                       
      @209    AYEAR               N4PF.                                         
      @213    DMONTH              N2PF.                                         
      @215    BMONTH              N2PF.                                         
      @217    BYEAR               N4PF.                                         
;                                                                               
                                                                                
                                                                                
RUN;
