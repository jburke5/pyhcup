/*******************************************************************            
*   MD_SASD_2000_CORE.SAS:                                                      
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
DATA MD_SASDC_2000_CORE;                                                        
INFILE 'MD_SASDC_2000_CORE.ASC' LRECL = 324;                                    
                                                                                
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
  AWEEKEND           LENGTH=3                                                   
  LABEL="Admission day is a weekend"                                            
  CPT1               LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 1"                                            
  CPT2               LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 2"                                            
  CPT3               LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 3"                                            
  CPT4               LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 4"                                            
  CPT5               LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 5"                                            
  CPT6               LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 6"                                            
  CPT7               LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 7"                                            
  CPT8               LENGTH=$5                                                  
  LABEL="CPT/HCPCS procedure code 8"                                            
  DIED               LENGTH=3                                                   
  LABEL="Died during hospitalization"                                           
  DISP_X             LENGTH=$2                                                  
  LABEL="Disposition of patient (as received from source)"                      
  DISPUNIFORM        LENGTH=3                                                   
  LABEL="Disposition of patient, uniform"                                       
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
  DX7                LENGTH=$5                                                  
  LABEL="Diagnosis 7"                                                           
  DX8                LENGTH=$5                                                  
  LABEL="Diagnosis 8"                                                           
  DX9                LENGTH=$5                                                  
  LABEL="Diagnosis 9"                                                           
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
  MRN_S              LENGTH=$17                                                 
  LABEL="Medical record number (synthetic)"                                     
  NCPT               LENGTH=3                                                   
  LABEL="Number of CPT/HCPCS procedures on this record"                         
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
      @24     AWEEKEND            N2PF.                                         
      @26     CPT1                $CHAR5.                                       
      @31     CPT2                $CHAR5.                                       
      @36     CPT3                $CHAR5.                                       
      @41     CPT4                $CHAR5.                                       
      @46     CPT5                $CHAR5.                                       
      @51     CPT6                $CHAR5.                                       
      @56     CPT7                $CHAR5.                                       
      @61     CPT8                $CHAR5.                                       
      @66     DIED                N2PF.                                         
      @68     DISP_X              $CHAR2.                                       
      @70     DISPUNIFORM         N2PF.                                         
      @72     DQTR                N2PF.                                         
      @74     DSHOSPID            $CHAR13.                                      
      @87     DX1                 $CHAR5.                                       
      @92     DX2                 $CHAR5.                                       
      @97     DX3                 $CHAR5.                                       
      @102    DX4                 $CHAR5.                                       
      @107    DX5                 $CHAR5.                                       
      @112    DX6                 $CHAR5.                                       
      @117    DX7                 $CHAR5.                                       
      @122    DX8                 $CHAR5.                                       
      @127    DX9                 $CHAR5.                                       
      @132    DXCCS1              N4PF.                                         
      @136    DXCCS2              N4PF.                                         
      @140    DXCCS3              N4PF.                                         
      @144    DXCCS4              N4PF.                                         
      @148    DXCCS5              N4PF.                                         
      @152    DXCCS6              N4PF.                                         
      @156    DXCCS7              N4PF.                                         
      @160    DXCCS8              N4PF.                                         
      @164    DXCCS9              N4PF.                                         
      @168    FEMALE              N2PF.                                         
      @170    HISPANIC_X          $CHAR1.                                       
      @171    HOSPST              $CHAR2.                                       
      @173    LOS                 N5PF.                                         
      @178    LOS_X               N6PF.                                         
      @184    MRN_S               $CHAR17.                                      
      @201    NCPT                N2PF.                                         
      @203    NDX                 N2PF.                                         
      @205    NEOMAT              N2PF.                                         
      @207    NPR                 N2PF.                                         
      @209    PAY1                N2PF.                                         
      @211    PAY2                N2PF.                                         
      @213    PAY1_X              $CHAR2.                                       
      @215    PAY2_X              $CHAR2.                                       
      @217    PAYER1_X            $CHAR2.                                       
      @219    PAYER2_X            $CHAR2.                                       
      @221    PR1                 $CHAR4.                                       
      @225    PR2                 $CHAR4.                                       
      @229    PR3                 $CHAR4.                                       
      @233    PR4                 $CHAR4.                                       
      @237    PR5                 $CHAR4.                                       
      @241    PR6                 $CHAR4.                                       
      @245    PR7                 $CHAR4.                                       
      @249    PR8                 $CHAR4.                                       
      @253    PRCCS1              N3PF.                                         
      @256    PRCCS2              N3PF.                                         
      @259    PRCCS3              N3PF.                                         
      @262    PRCCS4              N3PF.                                         
      @265    PRCCS5              N3PF.                                         
      @268    PRCCS6              N3PF.                                         
      @271    PRCCS7              N3PF.                                         
      @274    PRCCS8              N3PF.                                         
      @277    RACE                N2PF.                                         
      @279    RACE_X              $CHAR1.                                       
      @280    SURGID_S            $CHAR16.                                      
      @296    TOTCHG              N10PF.                                        
      @306    TOTCHG_X            N15P2F.                                       
      @321    YEAR                N4PF.                                         
;                                                                               
                                                                                
                                                                                
RUN;
