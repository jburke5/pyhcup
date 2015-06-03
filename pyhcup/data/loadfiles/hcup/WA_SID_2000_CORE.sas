/*******************************************************************            
*   WA_SID_2000_CORE.SAS:                                                       
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
DATA WA_SIDC_2000_CORE;                                                         
INFILE 'WA_SIDC_2000_CORE.ASC' LRECL = 328;                                     
                                                                                
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
  ASOURCE            LENGTH=3                                                   
  LABEL="Admission source (uniform)"                                            
  ASOURCE_X          LENGTH=$1                                                  
  LABEL="Admission source (as received from source)"                            
  ATYPE              LENGTH=3                                                   
  LABEL="Admission type"                                                        
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
  MDID_S             LENGTH=$16                                                 
  LABEL="Attending physician number (synthetic)"                                
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
  PAY1_X             LENGTH=$3                                                  
  LABEL="Primary expected payer (as received from source)"                      
  PAY2_X             LENGTH=$3                                                  
  LABEL="Secondary expected payer (as received from source)"                    
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
  RDRG               LENGTH=$4                                                  
  LABEL="Refined DRG"                                                           
  RDRGWT             LENGTH=5                                                   
  LABEL="Refined DRG weight"                                                    
  SURGID_S           LENGTH=$16                                                 
  LABEL="Primary surgeon number (synthetic)"                                    
  TOTCHG             LENGTH=6                                                   
  LABEL="Total charges (cleaned)"                                               
  TOTCHG_X           LENGTH=7                                                   
  LABEL="Total charges (as received from source)"                               
  YEAR               LENGTH=3                                                   
  LABEL="Calendar year"                                                         
  ZIP                LENGTH=$5                                                  
  LABEL="Patient zip code"                                                      
  AYEAR              LENGTH=3                                                   
  LABEL="Admission year"                                                        
;                                                                               
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      KEY                 14.                                           
      @15     AGE                 N3PF.                                         
      @18     AGEDAY              N3PF.                                         
      @21     AGEMONTH            N3PF.                                         
      @24     AMONTH              N2PF.                                         
      @26     ASOURCE             N2PF.                                         
      @28     ASOURCE_X           $CHAR1.                                       
      @29     ATYPE               N2PF.                                         
      @31     AWEEKEND            N2PF.                                         
      @33     DIED                N2PF.                                         
      @35     DISP_X              $CHAR2.                                       
      @37     DISPUB92            N2PF.                                         
      @39     DISPUNIFORM         N2PF.                                         
      @41     DQTR                N2PF.                                         
      @43     DRG                 N3PF.                                         
      @46     DRG18               N3PF.                                         
      @49     DRGVER              N2PF.                                         
      @51     DSHOSPID            $CHAR13.                                      
      @64     DX1                 $CHAR5.                                       
      @69     DX2                 $CHAR5.                                       
      @74     DX3                 $CHAR5.                                       
      @79     DX4                 $CHAR5.                                       
      @84     DX5                 $CHAR5.                                       
      @89     DX6                 $CHAR5.                                       
      @94     DX7                 $CHAR5.                                       
      @99     DX8                 $CHAR5.                                       
      @104    DX9                 $CHAR5.                                       
      @109    DX10                $CHAR5.                                       
      @114    DXCCS1              N4PF.                                         
      @118    DXCCS2              N4PF.                                         
      @122    DXCCS3              N4PF.                                         
      @126    DXCCS4              N4PF.                                         
      @130    DXCCS5              N4PF.                                         
      @134    DXCCS6              N4PF.                                         
      @138    DXCCS7              N4PF.                                         
      @142    DXCCS8              N4PF.                                         
      @146    DXCCS9              N4PF.                                         
      @150    DXCCS10             N4PF.                                         
      @154    FEMALE              N2PF.                                         
      @156    HOSPST              $CHAR2.                                       
      @158    LOS                 N5PF.                                         
      @163    LOS_X               N6PF.                                         
      @169    MDC                 N2PF.                                         
      @171    MDC18               N2PF.                                         
      @173    MDID_S              $CHAR16.                                      
      @189    NDX                 N2PF.                                         
      @191    NEOMAT              N2PF.                                         
      @193    NPR                 N2PF.                                         
      @195    PAY1                N2PF.                                         
      @197    PAY2                N2PF.                                         
      @199    PAY1_X              $CHAR3.                                       
      @202    PAY2_X              $CHAR3.                                       
      @205    PNUM_S              $CHAR17.                                      
      @222    PR1                 $CHAR4.                                       
      @226    PR2                 $CHAR4.                                       
      @230    PR3                 $CHAR4.                                       
      @234    PR4                 $CHAR4.                                       
      @238    PR5                 $CHAR4.                                       
      @242    PR6                 $CHAR4.                                       
      @246    PRCCS1              N3PF.                                         
      @249    PRCCS2              N3PF.                                         
      @252    PRCCS3              N3PF.                                         
      @255    PRCCS4              N3PF.                                         
      @258    PRCCS5              N3PF.                                         
      @261    PRCCS6              N3PF.                                         
      @264    RDRG                $CHAR4.                                       
      @268    RDRGWT              N7P2F.                                        
      @275    SURGID_S            $CHAR16.                                      
      @291    TOTCHG              N10PF.                                        
      @301    TOTCHG_X            N15P2F.                                       
      @316    YEAR                N4PF.                                         
      @320    ZIP                 $CHAR5.                                       
      @325    AYEAR               N4PF.                                         
;                                                                               
                                                                                
                                                                                
RUN;
