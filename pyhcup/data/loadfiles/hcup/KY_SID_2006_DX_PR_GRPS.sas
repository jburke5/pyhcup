/*******************************************************************            
*   KY_SID_2006_DX_PR_GRPS.SAS:                                                 
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
DATA KY_SIDC_2006_DX_PR_GRPS;                                                   
INFILE 'KY_SID_2006_DX_PR_GRPS.ASC' LRECL = 200;                                
                                                                                
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
      @42     CCSMSP1                  N4PF.                                    
      @46     CCSMSP2                  N4PF.                                    
      @50     CCSMSP3                  N4PF.                                    
      @54     CCSMSP4                  N4PF.                                    
      @58     CCSMSP5                  N4PF.                                    
      @62     CCSMSP6                  N4PF.                                    
      @66     CCSMSP7                  N4PF.                                    
      @70     CCSMSP8                  N4PF.                                    
      @74     CCSMSP9                  N4PF.                                    
      @78     CHRON1                   N2PF.                                    
      @80     CHRON2                   N2PF.                                    
      @82     CHRON3                   N2PF.                                    
      @84     CHRON4                   N2PF.                                    
      @86     CHRON5                   N2PF.                                    
      @88     CHRON6                   N2PF.                                    
      @90     CHRON7                   N2PF.                                    
      @92     CHRON8                   N2PF.                                    
      @94     CHRON9                   N2PF.                                    
      @96     CHRONB1                  N2PF.                                    
      @98     CHRONB2                  N2PF.                                    
      @100    CHRONB3                  N2PF.                                    
      @102    CHRONB4                  N2PF.                                    
      @104    CHRONB5                  N2PF.                                    
      @106    CHRONB6                  N2PF.                                    
      @108    CHRONB7                  N2PF.                                    
      @110    CHRONB8                  N2PF.                                    
      @112    CHRONB9                  N2PF.                                    
      @114    ECCSMGN1                 N3PF.                                    
      @117    ECCSMGN2                 N3PF.                                    
      @120    ECCSMGN3                 N3PF.                                    
      @123    ECCSMGN4                 N3PF.                                    
      @126    ECCSMGN5                 N3PF.                                    
      @129    PCLASS1                  N2PF.                                    
      @131    PCLASS2                  N2PF.                                    
      @133    PCLASS3                  N2PF.                                    
      @135    PCLASS4                  N2PF.                                    
      @137    PCLASS5                  N2PF.                                    
      @139    PCLASS6                  N2PF.                                    
      @141    U_BLOOD                  N2PF.                                    
      @143    U_CATH                   N2PF.                                    
      @145    U_CCU                    N2PF.                                    
      @147    U_CHESTXRAY              N2PF.                                    
      @149    U_CTSCAN                 N2PF.                                    
      @151    U_DIALYSIS               N2PF.                                    
      @153    U_ECHO                   N2PF.                                    
      @155    U_ED                     N2PF.                                    
      @157    U_EEG                    N2PF.                                    
      @159    U_EKG                    N2PF.                                    
      @161    U_EPO                    N2PF.                                    
      @163    U_ICU                    N2PF.                                    
      @165    U_LITHOTRIPSY            N2PF.                                    
      @167    U_MHSA                   N2PF.                                    
      @169    U_MRT                    N2PF.                                    
      @171    U_NEWBN2L                N2PF.                                    
      @173    U_NEWBN3L                N2PF.                                    
      @175    U_NEWBN4L                N2PF.                                    
      @177    U_NUCMED                 N2PF.                                    
      @179    U_OBSERVATION            N2PF.                                    
      @181    U_OCCTHERAPY             N2PF.                                    
      @183    U_ORGANACQ               N2PF.                                    
      @185    U_OTHIMPLANTS            N2PF.                                    
      @187    U_PACEMAKER              N2PF.                                    
      @189    U_PHYTHERAPY             N2PF.                                    
      @191    U_RADTHERAPY             N2PF.                                    
      @193    U_RESPTHERAPY            N2PF.                                    
      @195    U_SPEECHTHERAPY          N2PF.                                    
      @197    U_STRESS                 N2PF.                                    
      @199    U_ULTRASOUND             N2PF.                                    
      ;                                                                         
                                                                                
                                                                                
RUN;
