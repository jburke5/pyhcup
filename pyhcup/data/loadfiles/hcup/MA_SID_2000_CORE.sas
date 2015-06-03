/*******************************************************************            
*   MA_SID_2000_CORE.SAS:                                                       
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
DATA MA_SIDC_2000_CORE;                                                         
INFILE 'MA_SIDC_2000_CORE.ASC' LRECL = 412;                                     
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  KEY                LENGTH=8                                                   
  LABEL="HCUP record identifier"                                   FORMAT=Z14.  
  AGE                LENGTH=3                                                   
  LABEL="Age in years at admission"                                             
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
  LABEL="Length of stay (as received from source)"                              
  MDC                LENGTH=3                                                   
  LABEL="MDC in effect on discharge date"                                       
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
      @15     AGE                 N3PF.                                         
      @18     AMONTH              N2PF.                                         
      @20     ASOURCE             N2PF.                                         
      @22     ASOURCE_X           $CHAR1.                                       
      @23     ATYPE               N2PF.                                         
      @25     AWEEKEND            N2PF.                                         
      @27     BWT                 N4PF.                                         
      @31     DIED                N2PF.                                         
      @33     DISP_X              $CHAR2.                                       
      @35     DISPUB92            N2PF.                                         
      @37     DISPUNIFORM         N2PF.                                         
      @39     DQTR                N2PF.                                         
      @41     DRG                 N3PF.                                         
      @44     DRG18               N3PF.                                         
      @47     DRGVER              N2PF.                                         
      @49     DSHOSPID            $CHAR13.                                      
      @62     DX1                 $CHAR5.                                       
      @67     DX2                 $CHAR5.                                       
      @72     DX3                 $CHAR5.                                       
      @77     DX4                 $CHAR5.                                       
      @82     DX5                 $CHAR5.                                       
      @87     DX6                 $CHAR5.                                       
      @92     DX7                 $CHAR5.                                       
      @97     DX8                 $CHAR5.                                       
      @102    DX9                 $CHAR5.                                       
      @107    DX10                $CHAR5.                                       
      @112    DX11                $CHAR5.                                       
      @117    DX12                $CHAR5.                                       
      @122    DX13                $CHAR5.                                       
      @127    DX14                $CHAR5.                                       
      @132    DX15                $CHAR5.                                       
      @137    DX16                $CHAR5.                                       
      @142    DXCCS1              N4PF.                                         
      @146    DXCCS2              N4PF.                                         
      @150    DXCCS3              N4PF.                                         
      @154    DXCCS4              N4PF.                                         
      @158    DXCCS5              N4PF.                                         
      @162    DXCCS6              N4PF.                                         
      @166    DXCCS7              N4PF.                                         
      @170    DXCCS8              N4PF.                                         
      @174    DXCCS9              N4PF.                                         
      @178    DXCCS10             N4PF.                                         
      @182    DXCCS11             N4PF.                                         
      @186    DXCCS12             N4PF.                                         
      @190    DXCCS13             N4PF.                                         
      @194    DXCCS14             N4PF.                                         
      @198    DXCCS15             N4PF.                                         
      @202    DXCCS16             N4PF.                                         
      @206    FEMALE              N2PF.                                         
      @208    HOSPST              $CHAR2.                                       
      @210    LOS                 N5PF.                                         
      @215    LOS_X               N6PF.                                         
      @221    MDC                 N2PF.                                         
      @223    MDC18               N2PF.                                         
      @225    NDX                 N2PF.                                         
      @227    NEOMAT              N2PF.                                         
      @229    NPR                 N2PF.                                         
      @231    PAY1                N2PF.                                         
      @233    PAY2                N2PF.                                         
      @235    PAY1_X              $CHAR1.                                       
      @236    PAY2_X              $CHAR1.                                       
      @237    PAYER1_X            $CHAR3.                                       
      @240    PAYER2_X            $CHAR3.                                       
      @243    PR1                 $CHAR4.                                       
      @247    PR2                 $CHAR4.                                       
      @251    PR3                 $CHAR4.                                       
      @255    PR4                 $CHAR4.                                       
      @259    PR5                 $CHAR4.                                       
      @263    PR6                 $CHAR4.                                       
      @267    PR7                 $CHAR4.                                       
      @271    PR8                 $CHAR4.                                       
      @275    PR9                 $CHAR4.                                       
      @279    PR10                $CHAR4.                                       
      @283    PR11                $CHAR4.                                       
      @287    PR12                $CHAR4.                                       
      @291    PR13                $CHAR4.                                       
      @295    PR14                $CHAR4.                                       
      @299    PR15                $CHAR4.                                       
      @303    PRCCS1              N3PF.                                         
      @306    PRCCS2              N3PF.                                         
      @309    PRCCS3              N3PF.                                         
      @312    PRCCS4              N3PF.                                         
      @315    PRCCS5              N3PF.                                         
      @318    PRCCS6              N3PF.                                         
      @321    PRCCS7              N3PF.                                         
      @324    PRCCS8              N3PF.                                         
      @327    PRCCS9              N3PF.                                         
      @330    PRCCS10             N3PF.                                         
      @333    PRCCS11             N3PF.                                         
      @336    PRCCS12             N3PF.                                         
      @339    PRCCS13             N3PF.                                         
      @342    PRCCS14             N3PF.                                         
      @345    PRCCS15             N3PF.                                         
      @348    PRDAY1              N3PF.                                         
      @351    PRDAY2              N3PF.                                         
      @354    PRDAY3              N3PF.                                         
      @357    RACE                N2PF.                                         
      @359    RACE_X              $CHAR1.                                       
      @360    TOTCHG              N10PF.                                        
      @370    TOTCHG_X            N15P2F.                                       
      @385    YEAR                N4PF.                                         
      @389    AYEAR               N4PF.                                         
      @393    DMONTH              N2PF.                                         
      @395    PRMONTH1            N2PF.                                         
      @397    PRMONTH2            N2PF.                                         
      @399    PRMONTH3            N2PF.                                         
      @401    PRYEAR1             N4PF.                                         
      @405    PRYEAR2             N4PF.                                         
      @409    PRYEAR3             N4PF.                                         
;                                                                               
                                                                                
                                                                                
RUN;
