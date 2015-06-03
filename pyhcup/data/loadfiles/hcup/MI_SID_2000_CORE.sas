/*******************************************************************            
*   MI_SID_2000_CORE.SAS:                                                       
*      THE SAS CODE SHOWN BELOW WILL LOAD THE ASCII                             
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
  INVALUE N8P2F                                                                 
    '-9999.99' = .                                                              
    '-8888.88' = .A                                                             
    '-6666.66' = .C                                                             
    OTHER = (|8.2|)                                                             
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
DATA MI_SIDC_2000_CORE;                                                         
INFILE 'MI_SID_2000_CORE.ASC' LRECL = 676;                                      
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  HOSPID             LENGTH=4          FORMAT=Z5.                               
  LABEL="HCUP hospital identification number (SSHHH)"                           
                                                                                
  HOSPST             LENGTH=$2                                                  
  LABEL="Hospital state postal code"                                            
                                                                                
  KEY                LENGTH=8          FORMAT=Z14.                              
  LABEL="HCUP record identifier"                                                
                                                                                
  AGE                LENGTH=3                                                   
  LABEL="Age in years at admission"                                             
                                                                                
  AGEDAY             LENGTH=3                                                   
  LABEL="Age in days (when age < 1 year)"                                       
                                                                                
  AGEMONTH           LENGTH=3                                                   
  LABEL="Age in months (when age < 11 years)"                                   
                                                                                
  ASOURCE            LENGTH=3                                                   
  LABEL="Admission source (uniform)"                                            
                                                                                
  ASOURCE_X          LENGTH=$8                                                  
  LABEL="Admission source (as received from source)"                            
                                                                                
  ATYPE              LENGTH=3                                                   
  LABEL="Admission type"                                                        
                                                                                
  AWEEKEND           LENGTH=3                                                   
  LABEL="Admission day is a weekend"                                            
                                                                                
  DaysCCU            LENGTH=3                                                   
  LABEL="Days in coronary care unit (as received from the source)"              
                                                                                
  DaysICU            LENGTH=3                                                   
  LABEL=                                                                        
  "Days in medical/surgical intensive care unit (as received from the source)"  
                                                                                
  DIED               LENGTH=3                                                   
  LABEL="Died during hospitalization"                                           
                                                                                
  DISP_X             LENGTH=$8                                                  
  LABEL="Disposition of patient (as received from source)"                      
                                                                                
  DISPUB92           LENGTH=3                                                   
  LABEL="Disposition of patient (UB-92 standard coding)"                        
                                                                                
  DISPUNIFORM        LENGTH=3                                                   
  LABEL="Disposition of patient (uniform)"                                      
                                                                                
  DRG                LENGTH=3                                                   
  LABEL="DRG in effect on discharge date"                                       
                                                                                
  DRG18              LENGTH=3                                                   
  LABEL="DRG, version 18"                                                       
                                                                                
  DRGVER             LENGTH=3                                                   
  LABEL="DRG grouper version used on discharge date"                            
                                                                                
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
                                                                                
  DX17               LENGTH=$5                                                  
  LABEL="Diagnosis 17"                                                          
                                                                                
  DX18               LENGTH=$5                                                  
  LABEL="Diagnosis 18"                                                          
                                                                                
  DX19               LENGTH=$5                                                  
  LABEL="Diagnosis 19"                                                          
                                                                                
  DX20               LENGTH=$5                                                  
  LABEL="Diagnosis 20"                                                          
                                                                                
  DX21               LENGTH=$5                                                  
  LABEL="Diagnosis 21"                                                          
                                                                                
  DX22               LENGTH=$5                                                  
  LABEL="Diagnosis 22"                                                          
                                                                                
  DX23               LENGTH=$5                                                  
  LABEL="Diagnosis 23"                                                          
                                                                                
  DX24               LENGTH=$5                                                  
  LABEL="Diagnosis 24"                                                          
                                                                                
  DX25               LENGTH=$5                                                  
  LABEL="Diagnosis 25"                                                          
                                                                                
  DX26               LENGTH=$5                                                  
  LABEL="Diagnosis 26"                                                          
                                                                                
  DX27               LENGTH=$5                                                  
  LABEL="Diagnosis 27"                                                          
                                                                                
  DX28               LENGTH=$5                                                  
  LABEL="Diagnosis 28"                                                          
                                                                                
  DX29               LENGTH=$5                                                  
  LABEL="Diagnosis 29"                                                          
                                                                                
  DX30               LENGTH=$5                                                  
  LABEL="Diagnosis 30"                                                          
                                                                                
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
                                                                                
  DXCCS17            LENGTH=4                                                   
  LABEL="CCS: diagnosis 17"                                                     
                                                                                
  DXCCS18            LENGTH=4                                                   
  LABEL="CCS: diagnosis 18"                                                     
                                                                                
  DXCCS19            LENGTH=4                                                   
  LABEL="CCS: diagnosis 19"                                                     
                                                                                
  DXCCS20            LENGTH=4                                                   
  LABEL="CCS: diagnosis 20"                                                     
                                                                                
  DXCCS21            LENGTH=4                                                   
  LABEL="CCS: diagnosis 21"                                                     
                                                                                
  DXCCS22            LENGTH=4                                                   
  LABEL="CCS: diagnosis 22"                                                     
                                                                                
  DXCCS23            LENGTH=4                                                   
  LABEL="CCS: diagnosis 23"                                                     
                                                                                
  DXCCS24            LENGTH=4                                                   
  LABEL="CCS: diagnosis 24"                                                     
                                                                                
  DXCCS25            LENGTH=4                                                   
  LABEL="CCS: diagnosis 25"                                                     
                                                                                
  DXCCS26            LENGTH=4                                                   
  LABEL="CCS: diagnosis 26"                                                     
                                                                                
  DXCCS27            LENGTH=4                                                   
  LABEL="CCS: diagnosis 27"                                                     
                                                                                
  DXCCS28            LENGTH=4                                                   
  LABEL="CCS: diagnosis 28"                                                     
                                                                                
  DXCCS29            LENGTH=4                                                   
  LABEL="CCS: diagnosis 29"                                                     
                                                                                
  DXCCS30            LENGTH=4                                                   
  LABEL="CCS: diagnosis 30"                                                     
                                                                                
  FEMALE             LENGTH=3                                                   
  LABEL="Indicator of sex"                                                      
                                                                                
  HISPANIC_X         LENGTH=$8                                                  
  LABEL="Hispanic ethnicity (as received from source)"                          
                                                                                
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
                                                                                
  PAY1_X             LENGTH=$8                                                  
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PAY2_X             LENGTH=$8                                                  
  LABEL="Secondary expected payer (as received from source)"                    
                                                                                
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
                                                                                
  PR16               LENGTH=$4                                                  
  LABEL="Procedure 16"                                                          
                                                                                
  PR17               LENGTH=$4                                                  
  LABEL="Procedure 17"                                                          
                                                                                
  PR18               LENGTH=$4                                                  
  LABEL="Procedure 18"                                                          
                                                                                
  PR19               LENGTH=$4                                                  
  LABEL="Procedure 19"                                                          
                                                                                
  PR20               LENGTH=$4                                                  
  LABEL="Procedure 20"                                                          
                                                                                
  PR21               LENGTH=$4                                                  
  LABEL="Procedure 21"                                                          
                                                                                
  PR22               LENGTH=$4                                                  
  LABEL="Procedure 22"                                                          
                                                                                
  PR23               LENGTH=$4                                                  
  LABEL="Procedure 23"                                                          
                                                                                
  PR24               LENGTH=$4                                                  
  LABEL="Procedure 24"                                                          
                                                                                
  PR25               LENGTH=$4                                                  
  LABEL="Procedure 25"                                                          
                                                                                
  PR26               LENGTH=$4                                                  
  LABEL="Procedure 26"                                                          
                                                                                
  PR27               LENGTH=$4                                                  
  LABEL="Procedure 27"                                                          
                                                                                
  PR28               LENGTH=$4                                                  
  LABEL="Procedure 28"                                                          
                                                                                
  PR29               LENGTH=$4                                                  
  LABEL="Procedure 29"                                                          
                                                                                
  PR30               LENGTH=$4                                                  
  LABEL="Procedure 30"                                                          
                                                                                
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
                                                                                
  PRCCS16            LENGTH=3                                                   
  LABEL="CCS: procedure 16"                                                     
                                                                                
  PRCCS17            LENGTH=3                                                   
  LABEL="CCS: procedure 17"                                                     
                                                                                
  PRCCS18            LENGTH=3                                                   
  LABEL="CCS: procedure 18"                                                     
                                                                                
  PRCCS19            LENGTH=3                                                   
  LABEL="CCS: procedure 19"                                                     
                                                                                
  PRCCS20            LENGTH=3                                                   
  LABEL="CCS: procedure 20"                                                     
                                                                                
  PRCCS21            LENGTH=3                                                   
  LABEL="CCS: procedure 21"                                                     
                                                                                
  PRCCS22            LENGTH=3                                                   
  LABEL="CCS: procedure 22"                                                     
                                                                                
  PRCCS23            LENGTH=3                                                   
  LABEL="CCS: procedure 23"                                                     
                                                                                
  PRCCS24            LENGTH=3                                                   
  LABEL="CCS: procedure 24"                                                     
                                                                                
  PRCCS25            LENGTH=3                                                   
  LABEL="CCS: procedure 25"                                                     
                                                                                
  PRCCS26            LENGTH=3                                                   
  LABEL="CCS: procedure 26"                                                     
                                                                                
  PRCCS27            LENGTH=3                                                   
  LABEL="CCS: procedure 27"                                                     
                                                                                
  PRCCS28            LENGTH=3                                                   
  LABEL="CCS: procedure 28"                                                     
                                                                                
  PRCCS29            LENGTH=3                                                   
  LABEL="CCS: procedure 29"                                                     
                                                                                
  PRCCS30            LENGTH=3                                                   
  LABEL="CCS: procedure 30"                                                     
                                                                                
  PRDAY1             LENGTH=4                                                   
  LABEL="Number of days from admission to PR1"                                  
                                                                                
  RACE               LENGTH=3                                                   
  LABEL="Race (uniform)"                                                        
                                                                                
  RACE_X             LENGTH=$8                                                  
  LABEL="Race (as received from source)"                                        
                                                                                
  SURGID_S           LENGTH=$16                                                 
  LABEL="Primary surgeon number (synthetic)"                                    
                                                                                
  YEAR               LENGTH=3                                                   
  LABEL="Calendar year"                                                         
                                                                                
  ZIP                LENGTH=$5                                                  
  LABEL="Patient zip code"                                                      
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      HOSPID              N5PF.                                         
      @6      HOSPST              $CHAR2.                                       
      @8      KEY                 14.                                           
      @22     AGE                 N3PF.                                         
      @25     AGEDAY              N3PF.                                         
      @28     AGEMONTH            N3PF.                                         
      @31     ASOURCE             N2PF.                                         
      @33     ASOURCE_X           $CHAR8.                                       
      @41     ATYPE               N2PF.                                         
      @43     AWEEKEND            N2PF.                                         
      @45     DaysCCU             N3PF.                                         
      @48     DaysICU             N3PF.                                         
      @51     DIED                N2PF.                                         
      @53     DISP_X              $CHAR8.                                       
      @61     DISPUB92            N2PF.                                         
      @63     DISPUNIFORM         N2PF.                                         
      @65     DRG                 N3PF.                                         
      @68     DRG18               N3PF.                                         
      @71     DRGVER              N2PF.                                         
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
      @123    DX11                $CHAR5.                                       
      @128    DX12                $CHAR5.                                       
      @133    DX13                $CHAR5.                                       
      @138    DX14                $CHAR5.                                       
      @143    DX15                $CHAR5.                                       
      @148    DX16                $CHAR5.                                       
      @153    DX17                $CHAR5.                                       
      @158    DX18                $CHAR5.                                       
      @163    DX19                $CHAR5.                                       
      @168    DX20                $CHAR5.                                       
      @173    DX21                $CHAR5.                                       
      @178    DX22                $CHAR5.                                       
      @183    DX23                $CHAR5.                                       
      @188    DX24                $CHAR5.                                       
      @193    DX25                $CHAR5.                                       
      @198    DX26                $CHAR5.                                       
      @203    DX27                $CHAR5.                                       
      @208    DX28                $CHAR5.                                       
      @213    DX29                $CHAR5.                                       
      @218    DX30                $CHAR5.                                       
      @223    DXCCS1              N4PF.                                         
      @227    DXCCS2              N4PF.                                         
      @231    DXCCS3              N4PF.                                         
      @235    DXCCS4              N4PF.                                         
      @239    DXCCS5              N4PF.                                         
      @243    DXCCS6              N4PF.                                         
      @247    DXCCS7              N4PF.                                         
      @251    DXCCS8              N4PF.                                         
      @255    DXCCS9              N4PF.                                         
      @259    DXCCS10             N4PF.                                         
      @263    DXCCS11             N4PF.                                         
      @267    DXCCS12             N4PF.                                         
      @271    DXCCS13             N4PF.                                         
      @275    DXCCS14             N4PF.                                         
      @279    DXCCS15             N4PF.                                         
      @283    DXCCS16             N4PF.                                         
      @287    DXCCS17             N4PF.                                         
      @291    DXCCS18             N4PF.                                         
      @295    DXCCS19             N4PF.                                         
      @299    DXCCS20             N4PF.                                         
      @303    DXCCS21             N4PF.                                         
      @307    DXCCS22             N4PF.                                         
      @311    DXCCS23             N4PF.                                         
      @315    DXCCS24             N4PF.                                         
      @319    DXCCS25             N4PF.                                         
      @323    DXCCS26             N4PF.                                         
      @327    DXCCS27             N4PF.                                         
      @331    DXCCS28             N4PF.                                         
      @335    DXCCS29             N4PF.                                         
      @339    DXCCS30             N4PF.                                         
      @343    FEMALE              N2PF.                                         
      @345    HISPANIC_X          $CHAR8.                                       
      @353    LOS                 N5PF.                                         
      @358    LOS_X               N6PF.                                         
      @364    MDC                 N2PF.                                         
      @366    MDC18               N2PF.                                         
      @368    MDID_S              $CHAR16.                                      
      @384    MRN_S               $CHAR17.                                      
      @401    NDX                 N2PF.                                         
      @403    NEOMAT              N2PF.                                         
      @405    NPR                 N2PF.                                         
      @407    PAY1                N2PF.                                         
      @409    PAY2                N2PF.                                         
      @411    PAY1_X              $CHAR8.                                       
      @419    PAY2_X              $CHAR8.                                       
      @427    PR1                 $CHAR4.                                       
      @431    PR2                 $CHAR4.                                       
      @435    PR3                 $CHAR4.                                       
      @439    PR4                 $CHAR4.                                       
      @443    PR5                 $CHAR4.                                       
      @447    PR6                 $CHAR4.                                       
      @451    PR7                 $CHAR4.                                       
      @455    PR8                 $CHAR4.                                       
      @459    PR9                 $CHAR4.                                       
      @463    PR10                $CHAR4.                                       
      @467    PR11                $CHAR4.                                       
      @471    PR12                $CHAR4.                                       
      @475    PR13                $CHAR4.                                       
      @479    PR14                $CHAR4.                                       
      @483    PR15                $CHAR4.                                       
      @487    PR16                $CHAR4.                                       
      @491    PR17                $CHAR4.                                       
      @495    PR18                $CHAR4.                                       
      @499    PR19                $CHAR4.                                       
      @503    PR20                $CHAR4.                                       
      @507    PR21                $CHAR4.                                       
      @511    PR22                $CHAR4.                                       
      @515    PR23                $CHAR4.                                       
      @519    PR24                $CHAR4.                                       
      @523    PR25                $CHAR4.                                       
      @527    PR26                $CHAR4.                                       
      @531    PR27                $CHAR4.                                       
      @535    PR28                $CHAR4.                                       
      @539    PR29                $CHAR4.                                       
      @543    PR30                $CHAR4.                                       
      @547    PRCCS1              N3PF.                                         
      @550    PRCCS2              N3PF.                                         
      @553    PRCCS3              N3PF.                                         
      @556    PRCCS4              N3PF.                                         
      @559    PRCCS5              N3PF.                                         
      @562    PRCCS6              N3PF.                                         
      @565    PRCCS7              N3PF.                                         
      @568    PRCCS8              N3PF.                                         
      @571    PRCCS9              N3PF.                                         
      @574    PRCCS10             N3PF.                                         
      @577    PRCCS11             N3PF.                                         
      @580    PRCCS12             N3PF.                                         
      @583    PRCCS13             N3PF.                                         
      @586    PRCCS14             N3PF.                                         
      @589    PRCCS15             N3PF.                                         
      @592    PRCCS16             N3PF.                                         
      @595    PRCCS17             N3PF.                                         
      @598    PRCCS18             N3PF.                                         
      @601    PRCCS19             N3PF.                                         
      @604    PRCCS20             N3PF.                                         
      @607    PRCCS21             N3PF.                                         
      @610    PRCCS22             N3PF.                                         
      @613    PRCCS23             N3PF.                                         
      @616    PRCCS24             N3PF.                                         
      @619    PRCCS25             N3PF.                                         
      @622    PRCCS26             N3PF.                                         
      @625    PRCCS27             N3PF.                                         
      @628    PRCCS28             N3PF.                                         
      @631    PRCCS29             N3PF.                                         
      @634    PRCCS30             N3PF.                                         
      @637    PRDAY1              N5PF.                                         
      @642    RACE                N2PF.                                         
      @644    RACE_X              $CHAR8.                                       
      @652    SURGID_S            $CHAR16.                                      
      @668    YEAR                N4PF.                                         
      @672    ZIP                 $CHAR5.                                       
      ;                                                                         
                                                                                
                                                                                
RUN;
