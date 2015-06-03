/*******************************************************************            
*   MA_SEDD_2011_DX_PR_GRPS.SAS:                                                
*      THE SAS CODE SHOWN BELOW WILL LOAD THE ASCII                             
*      OUTPATIENT SEDD DX_PR_GRPS FILE INTO SAS                                 
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
  INVALUE N11PF                                                                 
    '-9999999999' = .                                                           
    '-8888888888' = .A                                                          
    '-6666666666' = .C                                                          
    OTHER = (|11.|)                                                             
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
  INVALUE N13PF                                                                 
    '-999999999999' = .                                                         
    '-888888888888' = .A                                                        
    '-666666666666' = .C                                                        
    OTHER = (|13.|)                                                             
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
DATA MA_SEDDC_2011_DX_PR_GRPS;                                                  
INFILE 'MA_SEDD_2011_DX_PR_GRPS.ASC' LRECL = 246;                               
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
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
                                                                                
  DXMCCS1                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 1"                                         
                                                                                
  DXMCCS2                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 2"                                         
                                                                                
  DXMCCS3                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 3"                                         
                                                                                
  DXMCCS4                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 4"                                         
                                                                                
  DXMCCS5                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 5"                                         
                                                                                
  DXMCCS6                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 6"                                         
                                                                                
  E_MCCS1                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  E Code 1"                                            
                                                                                
  E_MCCS2                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  E Code 2"                                            
                                                                                
  E_MCCS3                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  E Code 3"                                            
                                                                                
  E_MCCS4                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  E Code 4"                                            
                                                                                
  E_MCCS5                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  E Code 5"                                            
                                                                                
  E_MCCS6                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  E Code 6"                                            
                                                                                
  INJURY                     LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Injury diagnosis reported on record (1:DX1 is an injury; 2:DX2+ is an injury; 0
:No injury)"                                                                    
                                                                                
  INJURY_CUT                 LENGTH=3                                           
  LABEL="Injury by cutting or piercing (by E codes)"                            
                                                                                
  INJURY_DROWN               LENGTH=3                                           
  LABEL="Injury by drowning or submersion (by E codes)"                         
                                                                                
  INJURY_FALL                LENGTH=3                                           
  LABEL="Injury by falling (by E codes)"                                        
                                                                                
  INJURY_FIRE                LENGTH=3                                           
  LABEL="Injury by fire, flame or hot object (by E codes)"                      
                                                                                
  INJURY_FIREARM             LENGTH=3                                           
  LABEL="Injury by firearm (by E codes)"                                        
                                                                                
  INJURY_MACHINERY           LENGTH=3                                           
  LABEL="Injury by machinery (by E codes)"                                      
                                                                                
  INJURY_MVT                 LENGTH=3                                           
  LABEL="Injury involving motor vehicle traffic (by E codes)"                   
                                                                                
  INJURY_NATURE              LENGTH=3                                           
  LABEL="Injury involving nature or environmental factors (by E codes)"         
                                                                                
  INJURY_POISON              LENGTH=3                                           
  LABEL="Injury by poison (by E codes)"                                         
                                                                                
  INJURY_STRUCK              LENGTH=3                                           
  LABEL="Injury from being struck by or against (by E codes)"                   
                                                                                
  INJURY_SUFFOCATION         LENGTH=3                                           
  LABEL="Injury by suffocation (by E codes)"                                    
                                                                                
  INTENT_ASSAULT             LENGTH=3                                           
  LABEL="Injury by assault indicated on the record (by E codes)"                
                                                                                
  INTENT_SELF_HARM           LENGTH=3                                           
  LABEL=                                                                        
  "Intentional self harm indicated on the record (by diagnosis and/or E codes)" 
                                                                                
  INTENT_UNINTENTIONAL       LENGTH=3                                           
  LABEL="Unintentional injury indicated on the record (by E codes)"             
                                                                                
  KEY                        LENGTH=8                 FORMAT=Z18.               
  LABEL="HCUP record identifier"                                                
                                                                                
  MULTINJURY                 LENGTH=3                                           
  LABEL="More than one injury diagnosis reported on record"                     
                                                                                
  PCLASS1                    LENGTH=3                                           
  LABEL="Procedure class 1"                                                     
                                                                                
  PCLASS2                    LENGTH=3                                           
  LABEL="Procedure class 2"                                                     
                                                                                
  PCLASS3                    LENGTH=3                                           
  LABEL="Procedure class 3"                                                     
                                                                                
  PCLASS4                    LENGTH=3                                           
  LABEL="Procedure class 4"                                                     
                                                                                
  PRMCCS1                    LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 1"                                         
                                                                                
  PRMCCS2                    LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 2"                                         
                                                                                
  PRMCCS3                    LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 3"                                         
                                                                                
  PRMCCS4                    LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 4"                                         
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      CHRON1                   N2PF.                                    
      @3      CHRON2                   N2PF.                                    
      @5      CHRON3                   N2PF.                                    
      @7      CHRON4                   N2PF.                                    
      @9      CHRON5                   N2PF.                                    
      @11     CHRON6                   N2PF.                                    
      @13     CHRONB1                  N2PF.                                    
      @15     CHRONB2                  N2PF.                                    
      @17     CHRONB3                  N2PF.                                    
      @19     CHRONB4                  N2PF.                                    
      @21     CHRONB5                  N2PF.                                    
      @23     CHRONB6                  N2PF.                                    
      @25     DXMCCS1                  $CHAR11.                                 
      @36     DXMCCS2                  $CHAR11.                                 
      @47     DXMCCS3                  $CHAR11.                                 
      @58     DXMCCS4                  $CHAR11.                                 
      @69     DXMCCS5                  $CHAR11.                                 
      @80     DXMCCS6                  $CHAR11.                                 
      @91     E_MCCS1                  $CHAR11.                                 
      @102    E_MCCS2                  $CHAR11.                                 
      @113    E_MCCS3                  $CHAR11.                                 
      @124    E_MCCS4                  $CHAR11.                                 
      @135    E_MCCS5                  $CHAR11.                                 
      @146    E_MCCS6                  $CHAR11.                                 
      @157    INJURY                   N2PF.                                    
      @159    INJURY_CUT               N2PF.                                    
      @161    INJURY_DROWN             N2PF.                                    
      @163    INJURY_FALL              N2PF.                                    
      @165    INJURY_FIRE              N2PF.                                    
      @167    INJURY_FIREARM           N2PF.                                    
      @169    INJURY_MACHINERY         N2PF.                                    
      @171    INJURY_MVT               N2PF.                                    
      @173    INJURY_NATURE            N2PF.                                    
      @175    INJURY_POISON            N2PF.                                    
      @177    INJURY_STRUCK            N2PF.                                    
      @179    INJURY_SUFFOCATION       N2PF.                                    
      @181    INTENT_ASSAULT           N2PF.                                    
      @183    INTENT_SELF_HARM         N2PF.                                    
      @185    INTENT_UNINTENTIONAL     N2PF.                                    
      @187    KEY                      18.                                      
      @205    MULTINJURY               N2PF.                                    
      @207    PCLASS1                  N2PF.                                    
      @209    PCLASS2                  N2PF.                                    
      @211    PCLASS3                  N2PF.                                    
      @213    PCLASS4                  N2PF.                                    
      @215    PRMCCS1                  $CHAR8.                                  
      @223    PRMCCS2                  $CHAR8.                                  
      @231    PRMCCS3                  $CHAR8.                                  
      @239    PRMCCS4                  $CHAR8.                                  
      ;                                                                         
                                                                                
                                                                                
RUN;
