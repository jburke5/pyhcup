/*******************************************************************            
*   MA_SID_1999_CORE.SAS:                                                       
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
DATA MA_SIDC_1999_CORE;                                                         
INFILE 'MA_SIDC_1999_CORE.ASC' LRECL = 426;                                     
                                                                                
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
      @124    DX11                $CHAR5.                                       
      @129    DX12                $CHAR5.                                       
      @134    DX13                $CHAR5.                                       
      @139    DX14                $CHAR5.                                       
      @144    DX15                $CHAR5.                                       
      @149    DX16                $CHAR5.                                       
      @154    DXCCS1              N4PF.                                         
      @158    DXCCS2              N4PF.                                         
      @162    DXCCS3              N4PF.                                         
      @166    DXCCS4              N4PF.                                         
      @170    DXCCS5              N4PF.                                         
      @174    DXCCS6              N4PF.                                         
      @178    DXCCS7              N4PF.                                         
      @182    DXCCS8              N4PF.                                         
      @186    DXCCS9              N4PF.                                         
      @190    DXCCS10             N4PF.                                         
      @194    DXCCS11             N4PF.                                         
      @198    DXCCS12             N4PF.                                         
      @202    DXCCS13             N4PF.                                         
      @206    DXCCS14             N4PF.                                         
      @210    DXCCS15             N4PF.                                         
      @214    DXCCS16             N4PF.                                         
      @218    FEMALE              N2PF.                                         
      @220    HOSPST              $CHAR2.                                       
      @222    LOS                 N5PF.                                         
      @227    LOS_X               N6PF.                                         
      @233    MDC                 N2PF.                                         
      @235    MDC10               N2PF.                                         
      @237    MDC18               N2PF.                                         
      @239    NDX                 N2PF.                                         
      @241    NEOMAT              N2PF.                                         
      @243    NPR                 N2PF.                                         
      @245    PAY1                N2PF.                                         
      @247    PAY2                N2PF.                                         
      @249    PAY1_X              $CHAR1.                                       
      @250    PAY2_X              $CHAR1.                                       
      @251    PAYER1_X            $CHAR3.                                       
      @254    PAYER2_X            $CHAR3.                                       
      @257    PR1                 $CHAR4.                                       
      @261    PR2                 $CHAR4.                                       
      @265    PR3                 $CHAR4.                                       
      @269    PR4                 $CHAR4.                                       
      @273    PR5                 $CHAR4.                                       
      @277    PR6                 $CHAR4.                                       
      @281    PR7                 $CHAR4.                                       
      @285    PR8                 $CHAR4.                                       
      @289    PR9                 $CHAR4.                                       
      @293    PR10                $CHAR4.                                       
      @297    PR11                $CHAR4.                                       
      @301    PR12                $CHAR4.                                       
      @305    PR13                $CHAR4.                                       
      @309    PR14                $CHAR4.                                       
      @313    PR15                $CHAR4.                                       
      @317    PRCCS1              N3PF.                                         
      @320    PRCCS2              N3PF.                                         
      @323    PRCCS3              N3PF.                                         
      @326    PRCCS4              N3PF.                                         
      @329    PRCCS5              N3PF.                                         
      @332    PRCCS6              N3PF.                                         
      @335    PRCCS7              N3PF.                                         
      @338    PRCCS8              N3PF.                                         
      @341    PRCCS9              N3PF.                                         
      @344    PRCCS10             N3PF.                                         
      @347    PRCCS11             N3PF.                                         
      @350    PRCCS12             N3PF.                                         
      @353    PRCCS13             N3PF.                                         
      @356    PRCCS14             N3PF.                                         
      @359    PRCCS15             N3PF.                                         
      @362    PRDAY1              N3PF.                                         
      @365    PRDAY2              N3PF.                                         
      @368    PRDAY3              N3PF.                                         
      @371    RACE                N2PF.                                         
      @373    RACE_X              $CHAR1.                                       
      @374    TOTCHG              N10PF.                                        
      @384    TOTCHG_X            N15P2F.                                       
      @399    YEAR                N4PF.                                         
      @403    AYEAR               N4PF.                                         
      @407    DMONTH              N2PF.                                         
      @409    PRMONTH1            N2PF.                                         
      @411    PRMONTH2            N2PF.                                         
      @413    PRMONTH3            N2PF.                                         
      @415    PRYEAR1             N4PF.                                         
      @419    PRYEAR2             N4PF.                                         
      @423    PRYEAR3             N4PF.                                         
;                                                                               
                                                                                
                                                                                
RUN;
