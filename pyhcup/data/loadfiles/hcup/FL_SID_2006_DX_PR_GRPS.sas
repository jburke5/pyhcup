/*******************************************************************            
*   FL_SID_2006_DX_PR_GRPS.SAS:                                                 
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
DATA FL_SIDC_2006_DX_PR_GRPS;                                                   
INFILE 'FL_SID_2006_DX_PR_GRPS.ASC' LRECL = 426;                                
                                                                                
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
                                                                                
  CCSMGN17                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 17"                               
                                                                                
  CCSMGN18                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 18"                               
                                                                                
  CCSMGN19                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 19"                               
                                                                                
  CCSMGN20                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 20"                               
                                                                                
  CCSMGN21                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 21"                               
                                                                                
  CCSMGN22                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 22"                               
                                                                                
  CCSMGN23                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 23"                               
                                                                                
  CCSMGN24                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 24"                               
                                                                                
  CCSMGN25                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 25"                               
                                                                                
  CCSMGN26                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 26"                               
                                                                                
  CCSMGN27                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 27"                               
                                                                                
  CCSMGN28                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 28"                               
                                                                                
  CCSMGN29                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 29"                               
                                                                                
  CCSMGN30                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 30"                               
                                                                                
  CCSMGN31                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 31"                               
                                                                                
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
                                                                                
  CCSMSP17                   LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 17"                              
                                                                                
  CCSMSP18                   LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 18"                              
                                                                                
  CCSMSP19                   LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 19"                              
                                                                                
  CCSMSP20                   LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 20"                              
                                                                                
  CCSMSP21                   LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 21"                              
                                                                                
  CCSMSP22                   LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 22"                              
                                                                                
  CCSMSP23                   LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 23"                              
                                                                                
  CCSMSP24                   LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 24"                              
                                                                                
  CCSMSP25                   LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 25"                              
                                                                                
  CCSMSP26                   LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 26"                              
                                                                                
  CCSMSP27                   LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 27"                              
                                                                                
  CCSMSP28                   LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 28"                              
                                                                                
  CCSMSP29                   LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 29"                              
                                                                                
  CCSMSP30                   LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 30"                              
                                                                                
  CCSMSP31                   LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 31"                              
                                                                                
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
                                                                                
  CHRON17                    LENGTH=3                                           
  LABEL="Chronic condition indicator 17"                                        
                                                                                
  CHRON18                    LENGTH=3                                           
  LABEL="Chronic condition indicator 18"                                        
                                                                                
  CHRON19                    LENGTH=3                                           
  LABEL="Chronic condition indicator 19"                                        
                                                                                
  CHRON20                    LENGTH=3                                           
  LABEL="Chronic condition indicator 20"                                        
                                                                                
  CHRON21                    LENGTH=3                                           
  LABEL="Chronic condition indicator 21"                                        
                                                                                
  CHRON22                    LENGTH=3                                           
  LABEL="Chronic condition indicator 22"                                        
                                                                                
  CHRON23                    LENGTH=3                                           
  LABEL="Chronic condition indicator 23"                                        
                                                                                
  CHRON24                    LENGTH=3                                           
  LABEL="Chronic condition indicator 24"                                        
                                                                                
  CHRON25                    LENGTH=3                                           
  LABEL="Chronic condition indicator 25"                                        
                                                                                
  CHRON26                    LENGTH=3                                           
  LABEL="Chronic condition indicator 26"                                        
                                                                                
  CHRON27                    LENGTH=3                                           
  LABEL="Chronic condition indicator 27"                                        
                                                                                
  CHRON28                    LENGTH=3                                           
  LABEL="Chronic condition indicator 28"                                        
                                                                                
  CHRON29                    LENGTH=3                                           
  LABEL="Chronic condition indicator 29"                                        
                                                                                
  CHRON30                    LENGTH=3                                           
  LABEL="Chronic condition indicator 30"                                        
                                                                                
  CHRON31                    LENGTH=3                                           
  LABEL="Chronic condition indicator 31"                                        
                                                                                
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
                                                                                
  CHRONB17                   LENGTH=3                                           
  LABEL="Chronic condition body system 17"                                      
                                                                                
  CHRONB18                   LENGTH=3                                           
  LABEL="Chronic condition body system 18"                                      
                                                                                
  CHRONB19                   LENGTH=3                                           
  LABEL="Chronic condition body system 19"                                      
                                                                                
  CHRONB20                   LENGTH=3                                           
  LABEL="Chronic condition body system 20"                                      
                                                                                
  CHRONB21                   LENGTH=3                                           
  LABEL="Chronic condition body system 21"                                      
                                                                                
  CHRONB22                   LENGTH=3                                           
  LABEL="Chronic condition body system 22"                                      
                                                                                
  CHRONB23                   LENGTH=3                                           
  LABEL="Chronic condition body system 23"                                      
                                                                                
  CHRONB24                   LENGTH=3                                           
  LABEL="Chronic condition body system 24"                                      
                                                                                
  CHRONB25                   LENGTH=3                                           
  LABEL="Chronic condition body system 25"                                      
                                                                                
  CHRONB26                   LENGTH=3                                           
  LABEL="Chronic condition body system 26"                                      
                                                                                
  CHRONB27                   LENGTH=3                                           
  LABEL="Chronic condition body system 27"                                      
                                                                                
  CHRONB28                   LENGTH=3                                           
  LABEL="Chronic condition body system 28"                                      
                                                                                
  CHRONB29                   LENGTH=3                                           
  LABEL="Chronic condition body system 29"                                      
                                                                                
  CHRONB30                   LENGTH=3                                           
  LABEL="Chronic condition body system 30"                                      
                                                                                
  CHRONB31                   LENGTH=3                                           
  LABEL="Chronic condition body system 31"                                      
                                                                                
  ECCSMGN1                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: E Code 1"                                   
                                                                                
  ECCSMGN2                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: E Code 2"                                   
                                                                                
  ECCSMGN3                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: E Code 3"                                   
                                                                                
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
                                                                                
  PCLASS11                   LENGTH=3                                           
  LABEL="Procedure class 11"                                                    
                                                                                
  PCLASS12                   LENGTH=3                                           
  LABEL="Procedure class 12"                                                    
                                                                                
  PCLASS13                   LENGTH=3                                           
  LABEL="Procedure class 13"                                                    
                                                                                
  PCLASS14                   LENGTH=3                                           
  LABEL="Procedure class 14"                                                    
                                                                                
  PCLASS15                   LENGTH=3                                           
  LABEL="Procedure class 15"                                                    
                                                                                
  PCLASS16                   LENGTH=3                                           
  LABEL="Procedure class 16"                                                    
                                                                                
  PCLASS17                   LENGTH=3                                           
  LABEL="Procedure class 17"                                                    
                                                                                
  PCLASS18                   LENGTH=3                                           
  LABEL="Procedure class 18"                                                    
                                                                                
  PCLASS19                   LENGTH=3                                           
  LABEL="Procedure class 19"                                                    
                                                                                
  PCLASS20                   LENGTH=3                                           
  LABEL="Procedure class 20"                                                    
                                                                                
  PCLASS21                   LENGTH=3                                           
  LABEL="Procedure class 21"                                                    
                                                                                
  PCLASS22                   LENGTH=3                                           
  LABEL="Procedure class 22"                                                    
                                                                                
  PCLASS23                   LENGTH=3                                           
  LABEL="Procedure class 23"                                                    
                                                                                
  PCLASS24                   LENGTH=3                                           
  LABEL="Procedure class 24"                                                    
                                                                                
  PCLASS25                   LENGTH=3                                           
  LABEL="Procedure class 25"                                                    
                                                                                
  PCLASS26                   LENGTH=3                                           
  LABEL="Procedure class 26"                                                    
                                                                                
  PCLASS27                   LENGTH=3                                           
  LABEL="Procedure class 27"                                                    
                                                                                
  PCLASS28                   LENGTH=3                                           
  LABEL="Procedure class 28"                                                    
                                                                                
  PCLASS29                   LENGTH=3                                           
  LABEL="Procedure class 29"                                                    
                                                                                
  PCLASS30                   LENGTH=3                                           
  LABEL="Procedure class 30"                                                    
                                                                                
  PCLASS31                   LENGTH=3                                           
  LABEL="Procedure class 31"                                                    
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
      @63     CCSMGN17                 N3PF.                                    
      @66     CCSMGN18                 N3PF.                                    
      @69     CCSMGN19                 N3PF.                                    
      @72     CCSMGN20                 N3PF.                                    
      @75     CCSMGN21                 N3PF.                                    
      @78     CCSMGN22                 N3PF.                                    
      @81     CCSMGN23                 N3PF.                                    
      @84     CCSMGN24                 N3PF.                                    
      @87     CCSMGN25                 N3PF.                                    
      @90     CCSMGN26                 N3PF.                                    
      @93     CCSMGN27                 N3PF.                                    
      @96     CCSMGN28                 N3PF.                                    
      @99     CCSMGN29                 N3PF.                                    
      @102    CCSMGN30                 N3PF.                                    
      @105    CCSMGN31                 N3PF.                                    
      @108    CCSMSP1                  N4PF.                                    
      @112    CCSMSP2                  N4PF.                                    
      @116    CCSMSP3                  N4PF.                                    
      @120    CCSMSP4                  N4PF.                                    
      @124    CCSMSP5                  N4PF.                                    
      @128    CCSMSP6                  N4PF.                                    
      @132    CCSMSP7                  N4PF.                                    
      @136    CCSMSP8                  N4PF.                                    
      @140    CCSMSP9                  N4PF.                                    
      @144    CCSMSP10                 N4PF.                                    
      @148    CCSMSP11                 N4PF.                                    
      @152    CCSMSP12                 N4PF.                                    
      @156    CCSMSP13                 N4PF.                                    
      @160    CCSMSP14                 N4PF.                                    
      @164    CCSMSP15                 N4PF.                                    
      @168    CCSMSP16                 N4PF.                                    
      @172    CCSMSP17                 N4PF.                                    
      @176    CCSMSP18                 N4PF.                                    
      @180    CCSMSP19                 N4PF.                                    
      @184    CCSMSP20                 N4PF.                                    
      @188    CCSMSP21                 N4PF.                                    
      @192    CCSMSP22                 N4PF.                                    
      @196    CCSMSP23                 N4PF.                                    
      @200    CCSMSP24                 N4PF.                                    
      @204    CCSMSP25                 N4PF.                                    
      @208    CCSMSP26                 N4PF.                                    
      @212    CCSMSP27                 N4PF.                                    
      @216    CCSMSP28                 N4PF.                                    
      @220    CCSMSP29                 N4PF.                                    
      @224    CCSMSP30                 N4PF.                                    
      @228    CCSMSP31                 N4PF.                                    
      @232    CHRON1                   N2PF.                                    
      @234    CHRON2                   N2PF.                                    
      @236    CHRON3                   N2PF.                                    
      @238    CHRON4                   N2PF.                                    
      @240    CHRON5                   N2PF.                                    
      @242    CHRON6                   N2PF.                                    
      @244    CHRON7                   N2PF.                                    
      @246    CHRON8                   N2PF.                                    
      @248    CHRON9                   N2PF.                                    
      @250    CHRON10                  N2PF.                                    
      @252    CHRON11                  N2PF.                                    
      @254    CHRON12                  N2PF.                                    
      @256    CHRON13                  N2PF.                                    
      @258    CHRON14                  N2PF.                                    
      @260    CHRON15                  N2PF.                                    
      @262    CHRON16                  N2PF.                                    
      @264    CHRON17                  N2PF.                                    
      @266    CHRON18                  N2PF.                                    
      @268    CHRON19                  N2PF.                                    
      @270    CHRON20                  N2PF.                                    
      @272    CHRON21                  N2PF.                                    
      @274    CHRON22                  N2PF.                                    
      @276    CHRON23                  N2PF.                                    
      @278    CHRON24                  N2PF.                                    
      @280    CHRON25                  N2PF.                                    
      @282    CHRON26                  N2PF.                                    
      @284    CHRON27                  N2PF.                                    
      @286    CHRON28                  N2PF.                                    
      @288    CHRON29                  N2PF.                                    
      @290    CHRON30                  N2PF.                                    
      @292    CHRON31                  N2PF.                                    
      @294    CHRONB1                  N2PF.                                    
      @296    CHRONB2                  N2PF.                                    
      @298    CHRONB3                  N2PF.                                    
      @300    CHRONB4                  N2PF.                                    
      @302    CHRONB5                  N2PF.                                    
      @304    CHRONB6                  N2PF.                                    
      @306    CHRONB7                  N2PF.                                    
      @308    CHRONB8                  N2PF.                                    
      @310    CHRONB9                  N2PF.                                    
      @312    CHRONB10                 N2PF.                                    
      @314    CHRONB11                 N2PF.                                    
      @316    CHRONB12                 N2PF.                                    
      @318    CHRONB13                 N2PF.                                    
      @320    CHRONB14                 N2PF.                                    
      @322    CHRONB15                 N2PF.                                    
      @324    CHRONB16                 N2PF.                                    
      @326    CHRONB17                 N2PF.                                    
      @328    CHRONB18                 N2PF.                                    
      @330    CHRONB19                 N2PF.                                    
      @332    CHRONB20                 N2PF.                                    
      @334    CHRONB21                 N2PF.                                    
      @336    CHRONB22                 N2PF.                                    
      @338    CHRONB23                 N2PF.                                    
      @340    CHRONB24                 N2PF.                                    
      @342    CHRONB25                 N2PF.                                    
      @344    CHRONB26                 N2PF.                                    
      @346    CHRONB27                 N2PF.                                    
      @348    CHRONB28                 N2PF.                                    
      @350    CHRONB29                 N2PF.                                    
      @352    CHRONB30                 N2PF.                                    
      @354    CHRONB31                 N2PF.                                    
      @356    ECCSMGN1                 N3PF.                                    
      @359    ECCSMGN2                 N3PF.                                    
      @362    ECCSMGN3                 N3PF.                                    
      @365    PCLASS1                  N2PF.                                    
      @367    PCLASS2                  N2PF.                                    
      @369    PCLASS3                  N2PF.                                    
      @371    PCLASS4                  N2PF.                                    
      @373    PCLASS5                  N2PF.                                    
      @375    PCLASS6                  N2PF.                                    
      @377    PCLASS7                  N2PF.                                    
      @379    PCLASS8                  N2PF.                                    
      @381    PCLASS9                  N2PF.                                    
      @383    PCLASS10                 N2PF.                                    
      @385    PCLASS11                 N2PF.                                    
      @387    PCLASS12                 N2PF.                                    
      @389    PCLASS13                 N2PF.                                    
      @391    PCLASS14                 N2PF.                                    
      @393    PCLASS15                 N2PF.                                    
      @395    PCLASS16                 N2PF.                                    
      @397    PCLASS17                 N2PF.                                    
      @399    PCLASS18                 N2PF.                                    
      @401    PCLASS19                 N2PF.                                    
      @403    PCLASS20                 N2PF.                                    
      @405    PCLASS21                 N2PF.                                    
      @407    PCLASS22                 N2PF.                                    
      @409    PCLASS23                 N2PF.                                    
      @411    PCLASS24                 N2PF.                                    
      @413    PCLASS25                 N2PF.                                    
      @415    PCLASS26                 N2PF.                                    
      @417    PCLASS27                 N2PF.                                    
      @419    PCLASS28                 N2PF.                                    
      @421    PCLASS29                 N2PF.                                    
      @423    PCLASS30                 N2PF.                                    
      @425    PCLASS31                 N2PF.                                    
      ;                                                                         
                                                                                
                                                                                
RUN;
