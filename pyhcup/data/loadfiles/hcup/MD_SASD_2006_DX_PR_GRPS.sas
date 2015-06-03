/*******************************************************************            
*   MD_SASD_2006_DX_PR_GRPS.SAS:                                                
*      THE SAS CODE SHOWN BELOW WILL LOAD THE ASCII                             
*      OUTPATIENT DX_PR_GRPS FILE INTO SAS                                      
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
DATA MD_SASDC_2006_DX_PR_GRPS;                                                  
INFILE 'MD_SASD_2006_DX_PR_GRPS.ASC' LRECL = 268;                               
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  KEY                        LENGTH=8                 FORMAT=Z14.               
  LABEL="HCUP record identifier"                                                
                                                                                
  CCSMGN1                    LENGTH=3                                           
  LABEL="CCS-MHSA general category: principal diagnosis"                        
                                                                                
  CCSMGN2                    LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 2"                                
                                                                                
  CCSMGN3                    LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 3"                                
                                                                                
  CCSMGN4                    LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 4"                                
                                                                                
  CCSMGN5                    LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 5"                                
                                                                                
  CCSMGN6                    LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 6"                                
                                                                                
  CCSMGN7                    LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 7"                                
                                                                                
  CCSMGN8                    LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 8"                                
                                                                                
  CCSMGN9                    LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 9"                                
                                                                                
  CCSMGN10                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 10"                               
                                                                                
  CCSMGN11                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 11"                               
                                                                                
  CCSMGN12                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 12"                               
                                                                                
  CCSMGN13                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 13"                               
                                                                                
  CCSMGN14                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 14"                               
                                                                                
  CCSMGN15                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 15"                               
                                                                                
  CCSMGN16                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 16"                               
                                                                                
  CCSMSP1                    LENGTH=3                                           
  LABEL="CCS-MHSA specific category: principal diagnosis"                       
                                                                                
  CCSMSP2                    LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 2"                               
                                                                                
  CCSMSP3                    LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 3"                               
                                                                                
  CCSMSP4                    LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 4"                               
                                                                                
  CCSMSP5                    LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 5"                               
                                                                                
  CCSMSP6                    LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 6"                               
                                                                                
  CCSMSP7                    LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 7"                               
                                                                                
  CCSMSP8                    LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 8"                               
                                                                                
  CCSMSP9                    LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 9"                               
                                                                                
  CCSMSP10                   LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 10"                              
                                                                                
  CCSMSP11                   LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 11"                              
                                                                                
  CCSMSP12                   LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 12"                              
                                                                                
  CCSMSP13                   LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 13"                              
                                                                                
  CCSMSP14                   LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 14"                              
                                                                                
  CCSMSP15                   LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 15"                              
                                                                                
  CCSMSP16                   LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 16"                              
                                                                                
  CHRON1                     LENGTH=3                                           
  LABEL="Chronic condition indicator 1"                                         
                                                                                
  CHRON2                     LENGTH=3                                           
  LABEL="Chronic condition indicator 2"                                         
                                                                                
  CHRON3                     LENGTH=3                                           
  LABEL="Chronic condition indicator 3"                                         
                                                                                
  CHRON4                     LENGTH=3                                           
  LABEL="Chronic condition indicator 4"                                         
                                                                                
  CHRON5                     LENGTH=3                                           
  LABEL="Chronic condition indicator 5"                                         
                                                                                
  CHRON6                     LENGTH=3                                           
  LABEL="Chronic condition indicator 6"                                         
                                                                                
  CHRON7                     LENGTH=3                                           
  LABEL="Chronic condition indicator 7"                                         
                                                                                
  CHRON8                     LENGTH=3                                           
  LABEL="Chronic condition indicator 8"                                         
                                                                                
  CHRON9                     LENGTH=3                                           
  LABEL="Chronic condition indicator 9"                                         
                                                                                
  CHRON10                    LENGTH=3                                           
  LABEL="Chronic condition indicator 10"                                        
                                                                                
  CHRON11                    LENGTH=3                                           
  LABEL="Chronic condition indicator 11"                                        
                                                                                
  CHRON12                    LENGTH=3                                           
  LABEL="Chronic condition indicator 12"                                        
                                                                                
  CHRON13                    LENGTH=3                                           
  LABEL="Chronic condition indicator 13"                                        
                                                                                
  CHRON14                    LENGTH=3                                           
  LABEL="Chronic condition indicator 14"                                        
                                                                                
  CHRON15                    LENGTH=3                                           
  LABEL="Chronic condition indicator 15"                                        
                                                                                
  CHRON16                    LENGTH=3                                           
  LABEL="Chronic condition indicator 16"                                        
                                                                                
  CHRONB1                    LENGTH=3                                           
  LABEL="Chronic condition body system 1"                                       
                                                                                
  CHRONB2                    LENGTH=3                                           
  LABEL="Chronic condition body system 2"                                       
                                                                                
  CHRONB3                    LENGTH=3                                           
  LABEL="Chronic condition body system 3"                                       
                                                                                
  CHRONB4                    LENGTH=3                                           
  LABEL="Chronic condition body system 4"                                       
                                                                                
  CHRONB5                    LENGTH=3                                           
  LABEL="Chronic condition body system 5"                                       
                                                                                
  CHRONB6                    LENGTH=3                                           
  LABEL="Chronic condition body system 6"                                       
                                                                                
  CHRONB7                    LENGTH=3                                           
  LABEL="Chronic condition body system 7"                                       
                                                                                
  CHRONB8                    LENGTH=3                                           
  LABEL="Chronic condition body system 8"                                       
                                                                                
  CHRONB9                    LENGTH=3                                           
  LABEL="Chronic condition body system 9"                                       
                                                                                
  CHRONB10                   LENGTH=3                                           
  LABEL="Chronic condition body system 10"                                      
                                                                                
  CHRONB11                   LENGTH=3                                           
  LABEL="Chronic condition body system 11"                                      
                                                                                
  CHRONB12                   LENGTH=3                                           
  LABEL="Chronic condition body system 12"                                      
                                                                                
  CHRONB13                   LENGTH=3                                           
  LABEL="Chronic condition body system 13"                                      
                                                                                
  CHRONB14                   LENGTH=3                                           
  LABEL="Chronic condition body system 14"                                      
                                                                                
  CHRONB15                   LENGTH=3                                           
  LABEL="Chronic condition body system 15"                                      
                                                                                
  CHRONB16                   LENGTH=3                                           
  LABEL="Chronic condition body system 16"                                      
                                                                                
  ECCSMGN1                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: E Code 1"                                   
                                                                                
  ECCSMGN2                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: E Code 2"                                   
                                                                                
  ECCSMGN3                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: E Code 3"                                   
                                                                                
  ECCSMGN4                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: E Code 4"                                   
                                                                                
  ECCSMGN5                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: E Code 5"                                   
                                                                                
  ECCSMGN6                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: E Code 6"                                   
                                                                                
  U_BLOOD                    LENGTH=3                                           
  LABEL="Utilization Flag: Blood"                                               
                                                                                
  U_CATH                     LENGTH=3                                           
  LABEL="Utilization Flag: Cardiac Catheterization Lab"                         
                                                                                
  U_CCU                      LENGTH=3                                           
  LABEL="Utilization Flag: Coronary Care Unit (CCU)"                            
                                                                                
  U_CHESTXRAY                LENGTH=3                                           
  LABEL="Utilization Flag: Chest X-Ray"                                         
                                                                                
  U_CTSCAN                   LENGTH=3                                           
  LABEL="Utilization Flag: Computed Tomography Scan"                            
                                                                                
  U_DIALYSIS                 LENGTH=3                                           
  LABEL="Utilization Flag: Renal Dialysis"                                      
                                                                                
  U_ECHO                     LENGTH=3                                           
  LABEL="Utilization Flag: Echocardiology"                                      
                                                                                
  U_ED                       LENGTH=3                                           
  LABEL="Utilization Flag: Emergency Room"                                      
                                                                                
  U_EEG                      LENGTH=3                                           
  LABEL="Utilization Flag: Electroencephalogram"                                
                                                                                
  U_EKG                      LENGTH=3                                           
  LABEL="Utilization Flag: Electrocardiogram"                                   
                                                                                
  U_EPO                      LENGTH=3                                           
  LABEL="Utilization Flag: EPO"                                                 
                                                                                
  U_ICU                      LENGTH=3                                           
  LABEL="Utilization Flag: Intensive Care Unit (ICU)"                           
                                                                                
  U_LITHOTRIPSY              LENGTH=3                                           
  LABEL="Utilization Flag: Lithotripsy"                                         
                                                                                
  U_MHSA                     LENGTH=3                                           
  LABEL="Utilization Flag: Mental Health and Substance Abuse"                   
                                                                                
  U_MRT                      LENGTH=3                                           
  LABEL="Utilization Flag: Medical Resonance Technology"                        
                                                                                
  U_NEWBN2L                  LENGTH=3                                           
  LABEL="Utilization Flag: Nursery Level II"                                    
                                                                                
  U_NEWBN3L                  LENGTH=3                                           
  LABEL="Utilization Flag: Nursery Level III"                                   
                                                                                
  U_NEWBN4L                  LENGTH=3                                           
  LABEL="Utilization Flag: Nursery Level IV"                                    
                                                                                
  U_NUCMED                   LENGTH=3                                           
  LABEL="Utilization Flag: Nuclear Medicine"                                    
                                                                                
  U_OBSERVATION              LENGTH=3                                           
  LABEL="Utilization Flag: Observation Room"                                    
                                                                                
  U_OCCTHERAPY               LENGTH=3                                           
  LABEL="Utilization Flag: Occupational Therapy"                                
                                                                                
  U_ORGANACQ                 LENGTH=3                                           
  LABEL="Utilization Flag: Organ Acquisition"                                   
                                                                                
  U_OTHIMPLANTS              LENGTH=3                                           
  LABEL="Utilization Flag: Other Implants"                                      
                                                                                
  U_PACEMAKER                LENGTH=3                                           
  LABEL="Utilization Flag: Pacemaker"                                           
                                                                                
  U_PHYTHERAPY               LENGTH=3                                           
  LABEL="Utilization Flag: Physical Therapy"                                    
                                                                                
  U_RADTHERAPY               LENGTH=3                                           
  LABEL=                                                                        
  "Utilization Flag: Radiology - Therapeutic and/or Chemotherapy Administration"
                                                                                
  U_RESPTHERAPY              LENGTH=3                                           
  LABEL="Utilization Flag: Respiratory Services"                                
                                                                                
  U_SPEECHTHERAPY            LENGTH=3                                           
  LABEL="Utilization Flag: Speech - Language Pathology"                         
                                                                                
  U_STRESS                   LENGTH=3                                           
  LABEL="Utilization Flag: Cardiac Stress Test"                                 
                                                                                
  U_ULTRASOUND               LENGTH=3                                           
  LABEL="Utilization Flag: Ultrasound"                                          
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      KEY                      14.                                      
      @15     CCSMGN1                  N3PF.                                    
      @18     CCSMGN2                  N3PF.                                    
      @21     CCSMGN3                  N3PF.                                    
      @24     CCSMGN4                  N3PF.                                    
      @27     CCSMGN5                  N3PF.                                    
      @30     CCSMGN6                  N3PF.                                    
      @33     CCSMGN7                  N3PF.                                    
      @36     CCSMGN8                  N3PF.                                    
      @39     CCSMGN9                  N3PF.                                    
      @42     CCSMGN10                 N3PF.                                    
      @45     CCSMGN11                 N3PF.                                    
      @48     CCSMGN12                 N3PF.                                    
      @51     CCSMGN13                 N3PF.                                    
      @54     CCSMGN14                 N3PF.                                    
      @57     CCSMGN15                 N3PF.                                    
      @60     CCSMGN16                 N3PF.                                    
      @63     CCSMSP1                  N4PF.                                    
      @67     CCSMSP2                  N4PF.                                    
      @71     CCSMSP3                  N4PF.                                    
      @75     CCSMSP4                  N4PF.                                    
      @79     CCSMSP5                  N4PF.                                    
      @83     CCSMSP6                  N4PF.                                    
      @87     CCSMSP7                  N4PF.                                    
      @91     CCSMSP8                  N4PF.                                    
      @95     CCSMSP9                  N4PF.                                    
      @99     CCSMSP10                 N4PF.                                    
      @103    CCSMSP11                 N4PF.                                    
      @107    CCSMSP12                 N4PF.                                    
      @111    CCSMSP13                 N4PF.                                    
      @115    CCSMSP14                 N4PF.                                    
      @119    CCSMSP15                 N4PF.                                    
      @123    CCSMSP16                 N4PF.                                    
      @127    CHRON1                   N2PF.                                    
      @129    CHRON2                   N2PF.                                    
      @131    CHRON3                   N2PF.                                    
      @133    CHRON4                   N2PF.                                    
      @135    CHRON5                   N2PF.                                    
      @137    CHRON6                   N2PF.                                    
      @139    CHRON7                   N2PF.                                    
      @141    CHRON8                   N2PF.                                    
      @143    CHRON9                   N2PF.                                    
      @145    CHRON10                  N2PF.                                    
      @147    CHRON11                  N2PF.                                    
      @149    CHRON12                  N2PF.                                    
      @151    CHRON13                  N2PF.                                    
      @153    CHRON14                  N2PF.                                    
      @155    CHRON15                  N2PF.                                    
      @157    CHRON16                  N2PF.                                    
      @159    CHRONB1                  N2PF.                                    
      @161    CHRONB2                  N2PF.                                    
      @163    CHRONB3                  N2PF.                                    
      @165    CHRONB4                  N2PF.                                    
      @167    CHRONB5                  N2PF.                                    
      @169    CHRONB6                  N2PF.                                    
      @171    CHRONB7                  N2PF.                                    
      @173    CHRONB8                  N2PF.                                    
      @175    CHRONB9                  N2PF.                                    
      @177    CHRONB10                 N2PF.                                    
      @179    CHRONB11                 N2PF.                                    
      @181    CHRONB12                 N2PF.                                    
      @183    CHRONB13                 N2PF.                                    
      @185    CHRONB14                 N2PF.                                    
      @187    CHRONB15                 N2PF.                                    
      @189    CHRONB16                 N2PF.                                    
      @191    ECCSMGN1                 N3PF.                                    
      @194    ECCSMGN2                 N3PF.                                    
      @197    ECCSMGN3                 N3PF.                                    
      @200    ECCSMGN4                 N3PF.                                    
      @203    ECCSMGN5                 N3PF.                                    
      @206    ECCSMGN6                 N3PF.                                    
      @209    U_BLOOD                  N2PF.                                    
      @211    U_CATH                   N2PF.                                    
      @213    U_CCU                    N2PF.                                    
      @215    U_CHESTXRAY              N2PF.                                    
      @217    U_CTSCAN                 N2PF.                                    
      @219    U_DIALYSIS               N2PF.                                    
      @221    U_ECHO                   N2PF.                                    
      @223    U_ED                     N2PF.                                    
      @225    U_EEG                    N2PF.                                    
      @227    U_EKG                    N2PF.                                    
      @229    U_EPO                    N2PF.                                    
      @231    U_ICU                    N2PF.                                    
      @233    U_LITHOTRIPSY            N2PF.                                    
      @235    U_MHSA                   N2PF.                                    
      @237    U_MRT                    N2PF.                                    
      @239    U_NEWBN2L                N2PF.                                    
      @241    U_NEWBN3L                N2PF.                                    
      @243    U_NEWBN4L                N2PF.                                    
      @245    U_NUCMED                 N2PF.                                    
      @247    U_OBSERVATION            N2PF.                                    
      @249    U_OCCTHERAPY             N2PF.                                    
      @251    U_ORGANACQ               N2PF.                                    
      @253    U_OTHIMPLANTS            N2PF.                                    
      @255    U_PACEMAKER              N2PF.                                    
      @257    U_PHYTHERAPY             N2PF.                                    
      @259    U_RADTHERAPY             N2PF.                                    
      @261    U_RESPTHERAPY            N2PF.                                    
      @263    U_SPEECHTHERAPY          N2PF.                                    
      @265    U_STRESS                 N2PF.                                    
      @267    U_ULTRASOUND             N2PF.                                    
      ;                                                                         
                                                                                
                                                                                
RUN;
