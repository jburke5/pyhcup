/*******************************************************************            
*   NV_SID_2006_DX_PR_GRPS.SAS:                                                 
*      THE SAS CODE SHOWN BELOW WILL LOAD THE ASCII                             
*      INPATIENT STAY DX_PR_GRPS FILE INTO SAS                                  
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
DATA NV_SIDC_2006_DX_PR_GRPS;                                                   
INFILE 'NV_SID_2006_DX_PR_GRPS.ASC' LRECL = 274;                                
                                                                                
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
                                                                                
  PCLASS1                    LENGTH=3                                           
  LABEL="Principal procedure class"                                             
                                                                                
  PCLASS2                    LENGTH=3                                           
  LABEL="Procedure class 2"                                                     
                                                                                
  PCLASS3                    LENGTH=3                                           
  LABEL="Procedure class 3"                                                     
                                                                                
  PCLASS4                    LENGTH=3                                           
  LABEL="Procedure class 4"                                                     
                                                                                
  PCLASS5                    LENGTH=3                                           
  LABEL="Procedure class 5"                                                     
                                                                                
  PCLASS6                    LENGTH=3                                           
  LABEL="Procedure class 6"                                                     
                                                                                
  PCLASS7                    LENGTH=3                                           
  LABEL="Procedure class 7"                                                     
                                                                                
  PCLASS8                    LENGTH=3                                           
  LABEL="Procedure class 8"                                                     
                                                                                
  PCLASS9                    LENGTH=3                                           
  LABEL="Procedure class 9"                                                     
                                                                                
  PCLASS10                   LENGTH=3                                           
  LABEL="Procedure class 10"                                                    
                                                                                
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
      @60     CCSMSP1                  N4PF.                                    
      @64     CCSMSP2                  N4PF.                                    
      @68     CCSMSP3                  N4PF.                                    
      @72     CCSMSP4                  N4PF.                                    
      @76     CCSMSP5                  N4PF.                                    
      @80     CCSMSP6                  N4PF.                                    
      @84     CCSMSP7                  N4PF.                                    
      @88     CCSMSP8                  N4PF.                                    
      @92     CCSMSP9                  N4PF.                                    
      @96     CCSMSP10                 N4PF.                                    
      @100    CCSMSP11                 N4PF.                                    
      @104    CCSMSP12                 N4PF.                                    
      @108    CCSMSP13                 N4PF.                                    
      @112    CCSMSP14                 N4PF.                                    
      @116    CCSMSP15                 N4PF.                                    
      @120    CHRON1                   N2PF.                                    
      @122    CHRON2                   N2PF.                                    
      @124    CHRON3                   N2PF.                                    
      @126    CHRON4                   N2PF.                                    
      @128    CHRON5                   N2PF.                                    
      @130    CHRON6                   N2PF.                                    
      @132    CHRON7                   N2PF.                                    
      @134    CHRON8                   N2PF.                                    
      @136    CHRON9                   N2PF.                                    
      @138    CHRON10                  N2PF.                                    
      @140    CHRON11                  N2PF.                                    
      @142    CHRON12                  N2PF.                                    
      @144    CHRON13                  N2PF.                                    
      @146    CHRON14                  N2PF.                                    
      @148    CHRON15                  N2PF.                                    
      @150    CHRONB1                  N2PF.                                    
      @152    CHRONB2                  N2PF.                                    
      @154    CHRONB3                  N2PF.                                    
      @156    CHRONB4                  N2PF.                                    
      @158    CHRONB5                  N2PF.                                    
      @160    CHRONB6                  N2PF.                                    
      @162    CHRONB7                  N2PF.                                    
      @164    CHRONB8                  N2PF.                                    
      @166    CHRONB9                  N2PF.                                    
      @168    CHRONB10                 N2PF.                                    
      @170    CHRONB11                 N2PF.                                    
      @172    CHRONB12                 N2PF.                                    
      @174    CHRONB13                 N2PF.                                    
      @176    CHRONB14                 N2PF.                                    
      @178    CHRONB15                 N2PF.                                    
      @180    ECCSMGN1                 N3PF.                                    
      @183    ECCSMGN2                 N3PF.                                    
      @186    ECCSMGN3                 N3PF.                                    
      @189    ECCSMGN4                 N3PF.                                    
      @192    ECCSMGN5                 N3PF.                                    
      @195    PCLASS1                  N2PF.                                    
      @197    PCLASS2                  N2PF.                                    
      @199    PCLASS3                  N2PF.                                    
      @201    PCLASS4                  N2PF.                                    
      @203    PCLASS5                  N2PF.                                    
      @205    PCLASS6                  N2PF.                                    
      @207    PCLASS7                  N2PF.                                    
      @209    PCLASS8                  N2PF.                                    
      @211    PCLASS9                  N2PF.                                    
      @213    PCLASS10                 N2PF.                                    
      @215    U_BLOOD                  N2PF.                                    
      @217    U_CATH                   N2PF.                                    
      @219    U_CCU                    N2PF.                                    
      @221    U_CHESTXRAY              N2PF.                                    
      @223    U_CTSCAN                 N2PF.                                    
      @225    U_DIALYSIS               N2PF.                                    
      @227    U_ECHO                   N2PF.                                    
      @229    U_ED                     N2PF.                                    
      @231    U_EEG                    N2PF.                                    
      @233    U_EKG                    N2PF.                                    
      @235    U_EPO                    N2PF.                                    
      @237    U_ICU                    N2PF.                                    
      @239    U_LITHOTRIPSY            N2PF.                                    
      @241    U_MHSA                   N2PF.                                    
      @243    U_MRT                    N2PF.                                    
      @245    U_NEWBN2L                N2PF.                                    
      @247    U_NEWBN3L                N2PF.                                    
      @249    U_NEWBN4L                N2PF.                                    
      @251    U_NUCMED                 N2PF.                                    
      @253    U_OBSERVATION            N2PF.                                    
      @255    U_OCCTHERAPY             N2PF.                                    
      @257    U_ORGANACQ               N2PF.                                    
      @259    U_OTHIMPLANTS            N2PF.                                    
      @261    U_PACEMAKER              N2PF.                                    
      @263    U_PHYTHERAPY             N2PF.                                    
      @265    U_RADTHERAPY             N2PF.                                    
      @267    U_RESPTHERAPY            N2PF.                                    
      @269    U_SPEECHTHERAPY          N2PF.                                    
      @271    U_STRESS                 N2PF.                                    
      @273    U_ULTRASOUND             N2PF.                                    
      ;                                                                         
                                                                                
                                                                                
RUN;
