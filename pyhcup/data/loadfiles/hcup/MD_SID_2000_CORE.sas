/*******************************************************************            
*   MD_SID_2000_CORE.SAS:                                                       
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
DATA MD_SIDC_2000_CORE;                                                         
INFILE 'MD_SIDC_2000_CORE.ASC' LRECL = 483;                                     
                                                                                
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
  ASOURCE            LENGTH=3                                                   
  LABEL="Admission source (uniform)"                                            
  ASOURCE_X          LENGTH=$2                                                  
  LABEL="Admission source (as received from source)"                            
  ATYPE              LENGTH=3                                                   
  LABEL="Admission type"                                                        
  AWEEKEND           LENGTH=3                                                   
  LABEL="Admission day is a weekend"                                            
  BWT                LENGTH=4                                                   
  LABEL="Birth weight in grams"                                                 
  DaysBurnUnit       LENGTH=3                                                   
  LABEL="Days in burn care unit (as received from the source)"                  
  DaysCCU            LENGTH=3                                                   
  LABEL="Days in coronary care unit (as received from the source)"              
  DaysICU            LENGTH=3                                                   
  LABEL="                                                                       
Days in medical/surgical intensive care unit (as received from the source)"     
  DaysNICU           LENGTH=3                                                   
  LABEL="Days in neonetal care unit (as received from the source)"              
  DaysPICU           LENGTH=3                                                   
  LABEL="Days in pediatric care unit (as received from the source)"             
  DaysShockUnit      LENGTH=3                                                   
  LABEL="Days in shock trauma unit (as received from the source)"               
  DIED               LENGTH=3                                                   
  LABEL="Died during hospitalization"                                           
  DISP_X             LENGTH=$2                                                  
  LABEL="Disposition of patient (as received from source)"                      
  DISPUNIFORM        LENGTH=3                                                   
  LABEL="Disposition of patient, uniform"                                       
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
  FEMALE             LENGTH=3                                                   
  LABEL="Indicator of sex"                                                      
  HISPANIC_X         LENGTH=$1                                                  
  LABEL="Hispanic ethnicity (as received from source)"                          
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
  MDID_S             LENGTH=$16                                                 
  LABEL="Attending physician number (synthetic)"                                
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
  PAYER1_X           LENGTH=$2                                                  
  LABEL="Primary expected payer plan identifier (as received from source)"      
  PAYER2_X           LENGTH=$2                                                  
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
  RACE               LENGTH=3                                                   
  LABEL="Race (uniform)"                                                        
  RACE_X             LENGTH=$1                                                  
  LABEL="Race (as received from source)"                                        
  SURGID_S           LENGTH=$16                                                 
  LABEL="Primary surgeon number (synthetic)"                                    
  TOTCHG             LENGTH=6                                                   
  LABEL="Total charges (cleaned)"                                               
  TOTCHG_X           LENGTH=7                                                   
  LABEL="Total charges (as received from source)"                               
  YEAR               LENGTH=3                                                   
  LABEL="Calendar year"                                                         
;                                                                               
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      KEY                 14.                                           
      @15     AGE                 N3PF.                                         
      @18     AGEDAY              N3PF.                                         
      @21     AGEMONTH            N3PF.                                         
      @24     ASOURCE             N2PF.                                         
      @26     ASOURCE_X           $CHAR2.                                       
      @28     ATYPE               N2PF.                                         
      @30     AWEEKEND            N2PF.                                         
      @32     BWT                 N4PF.                                         
      @36     DaysBurnUnit        N3PF.                                         
      @39     DaysCCU             N3PF.                                         
      @42     DaysICU             N3PF.                                         
      @45     DaysNICU            N3PF.                                         
      @48     DaysPICU            N3PF.                                         
      @51     DaysShockUnit       N3PF.                                         
      @54     DIED                N2PF.                                         
      @56     DISP_X              $CHAR2.                                       
      @58     DISPUNIFORM         N2PF.                                         
      @60     DQTR                N2PF.                                         
      @62     DRG                 N3PF.                                         
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
      @163    DXCCS1              N4PF.                                         
      @167    DXCCS2              N4PF.                                         
      @171    DXCCS3              N4PF.                                         
      @175    DXCCS4              N4PF.                                         
      @179    DXCCS5              N4PF.                                         
      @183    DXCCS6              N4PF.                                         
      @187    DXCCS7              N4PF.                                         
      @191    DXCCS8              N4PF.                                         
      @195    DXCCS9              N4PF.                                         
      @199    DXCCS10             N4PF.                                         
      @203    DXCCS11             N4PF.                                         
      @207    DXCCS12             N4PF.                                         
      @211    DXCCS13             N4PF.                                         
      @215    DXCCS14             N4PF.                                         
      @219    DXCCS15             N4PF.                                         
      @223    DXCCS16             N4PF.                                         
      @227    FEMALE              N2PF.                                         
      @229    HISPANIC_X          $CHAR1.                                       
      @230    HOSPST              $CHAR2.                                       
      @232    LOS                 N5PF.                                         
      @237    LOS_X               N6PF.                                         
      @243    MDC                 N2PF.                                         
      @245    MDC18               N2PF.                                         
      @247    MDID_S              $CHAR16.                                      
      @263    MRN_S               $CHAR17.                                      
      @280    NDX                 N2PF.                                         
      @282    NEOMAT              N2PF.                                         
      @284    NPR                 N2PF.                                         
      @286    PAY1                N2PF.                                         
      @288    PAY2                N2PF.                                         
      @290    PAY1_X              $CHAR2.                                       
      @292    PAY2_X              $CHAR2.                                       
      @294    PAYER1_X            $CHAR2.                                       
      @296    PAYER2_X            $CHAR2.                                       
      @298    PR1                 $CHAR4.                                       
      @302    PR2                 $CHAR4.                                       
      @306    PR3                 $CHAR4.                                       
      @310    PR4                 $CHAR4.                                       
      @314    PR5                 $CHAR4.                                       
      @318    PR6                 $CHAR4.                                       
      @322    PR7                 $CHAR4.                                       
      @326    PR8                 $CHAR4.                                       
      @330    PR9                 $CHAR4.                                       
      @334    PR10                $CHAR4.                                       
      @338    PR11                $CHAR4.                                       
      @342    PR12                $CHAR4.                                       
      @346    PR13                $CHAR4.                                       
      @350    PR14                $CHAR4.                                       
      @354    PR15                $CHAR4.                                       
      @358    PRCCS1              N3PF.                                         
      @361    PRCCS2              N3PF.                                         
      @364    PRCCS3              N3PF.                                         
      @367    PRCCS4              N3PF.                                         
      @370    PRCCS5              N3PF.                                         
      @373    PRCCS6              N3PF.                                         
      @376    PRCCS7              N3PF.                                         
      @379    PRCCS8              N3PF.                                         
      @382    PRCCS9              N3PF.                                         
      @385    PRCCS10             N3PF.                                         
      @388    PRCCS11             N3PF.                                         
      @391    PRCCS12             N3PF.                                         
      @394    PRCCS13             N3PF.                                         
      @397    PRCCS14             N3PF.                                         
      @400    PRCCS15             N3PF.                                         
      @403    PRDAY1              N3PF.                                         
      @406    PRDAY2              N3PF.                                         
      @409    PRDAY3              N3PF.                                         
      @412    PRDAY4              N3PF.                                         
      @415    PRDAY5              N3PF.                                         
      @418    PRDAY6              N3PF.                                         
      @421    PRDAY7              N3PF.                                         
      @424    PRDAY8              N3PF.                                         
      @427    PRDAY9              N3PF.                                         
      @430    PRDAY10             N3PF.                                         
      @433    PRDAY11             N3PF.                                         
      @436    RACE                N2PF.                                         
      @438    RACE_X              $CHAR1.                                       
      @439    SURGID_S            $CHAR16.                                      
      @455    TOTCHG              N10PF.                                        
      @465    TOTCHG_X            N15P2F.                                       
      @480    YEAR                N4PF.                                         
;                                                                               
                                                                                
                                                                                
RUN;
