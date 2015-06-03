/*******************************************************************            
*   IA_SID_2009_DX_PR_GRPS.SAS:                                                 
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
DATA IA_SIDC_2009_DX_PR_GRPS;                                                   
INFILE 'IA_SID_2009_DX_PR_GRPS.ASC' LRECL = 1510;                               
                                                                                
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
                                                                                
  CHRON32                    LENGTH=3                                           
  LABEL="Chronic condition indicator 32"                                        
                                                                                
  CHRON33                    LENGTH=3                                           
  LABEL="Chronic condition indicator 33"                                        
                                                                                
  CHRON34                    LENGTH=3                                           
  LABEL="Chronic condition indicator 34"                                        
                                                                                
  CHRON35                    LENGTH=3                                           
  LABEL="Chronic condition indicator 35"                                        
                                                                                
  CHRON36                    LENGTH=3                                           
  LABEL="Chronic condition indicator 36"                                        
                                                                                
  CHRON37                    LENGTH=3                                           
  LABEL="Chronic condition indicator 37"                                        
                                                                                
  CHRON38                    LENGTH=3                                           
  LABEL="Chronic condition indicator 38"                                        
                                                                                
  CHRON39                    LENGTH=3                                           
  LABEL="Chronic condition indicator 39"                                        
                                                                                
  CHRON40                    LENGTH=3                                           
  LABEL="Chronic condition indicator 40"                                        
                                                                                
  CHRON41                    LENGTH=3                                           
  LABEL="Chronic condition indicator 41"                                        
                                                                                
  CHRON42                    LENGTH=3                                           
  LABEL="Chronic condition indicator 42"                                        
                                                                                
  CHRON43                    LENGTH=3                                           
  LABEL="Chronic condition indicator 43"                                        
                                                                                
  CHRON44                    LENGTH=3                                           
  LABEL="Chronic condition indicator 44"                                        
                                                                                
  CHRON45                    LENGTH=3                                           
  LABEL="Chronic condition indicator 45"                                        
                                                                                
  CHRON46                    LENGTH=3                                           
  LABEL="Chronic condition indicator 46"                                        
                                                                                
  CHRON47                    LENGTH=3                                           
  LABEL="Chronic condition indicator 47"                                        
                                                                                
  CHRON48                    LENGTH=3                                           
  LABEL="Chronic condition indicator 48"                                        
                                                                                
  CHRON49                    LENGTH=3                                           
  LABEL="Chronic condition indicator 49"                                        
                                                                                
  CHRON50                    LENGTH=3                                           
  LABEL="Chronic condition indicator 50"                                        
                                                                                
  CHRON51                    LENGTH=3                                           
  LABEL="Chronic condition indicator 51"                                        
                                                                                
  CHRON52                    LENGTH=3                                           
  LABEL="Chronic condition indicator 52"                                        
                                                                                
  CHRON53                    LENGTH=3                                           
  LABEL="Chronic condition indicator 53"                                        
                                                                                
  CHRON54                    LENGTH=3                                           
  LABEL="Chronic condition indicator 54"                                        
                                                                                
  CHRON55                    LENGTH=3                                           
  LABEL="Chronic condition indicator 55"                                        
                                                                                
  CHRON56                    LENGTH=3                                           
  LABEL="Chronic condition indicator 56"                                        
                                                                                
  CHRON57                    LENGTH=3                                           
  LABEL="Chronic condition indicator 57"                                        
                                                                                
  CHRON58                    LENGTH=3                                           
  LABEL="Chronic condition indicator 58"                                        
                                                                                
  CHRON59                    LENGTH=3                                           
  LABEL="Chronic condition indicator 59"                                        
                                                                                
  CHRON60                    LENGTH=3                                           
  LABEL="Chronic condition indicator 60"                                        
                                                                                
  CHRON61                    LENGTH=3                                           
  LABEL="Chronic condition indicator 61"                                        
                                                                                
  CHRON62                    LENGTH=3                                           
  LABEL="Chronic condition indicator 62"                                        
                                                                                
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
                                                                                
  CHRONB32                   LENGTH=3                                           
  LABEL="Chronic condition body system 32"                                      
                                                                                
  CHRONB33                   LENGTH=3                                           
  LABEL="Chronic condition body system 33"                                      
                                                                                
  CHRONB34                   LENGTH=3                                           
  LABEL="Chronic condition body system 34"                                      
                                                                                
  CHRONB35                   LENGTH=3                                           
  LABEL="Chronic condition body system 35"                                      
                                                                                
  CHRONB36                   LENGTH=3                                           
  LABEL="Chronic condition body system 36"                                      
                                                                                
  CHRONB37                   LENGTH=3                                           
  LABEL="Chronic condition body system 37"                                      
                                                                                
  CHRONB38                   LENGTH=3                                           
  LABEL="Chronic condition body system 38"                                      
                                                                                
  CHRONB39                   LENGTH=3                                           
  LABEL="Chronic condition body system 39"                                      
                                                                                
  CHRONB40                   LENGTH=3                                           
  LABEL="Chronic condition body system 40"                                      
                                                                                
  CHRONB41                   LENGTH=3                                           
  LABEL="Chronic condition body system 41"                                      
                                                                                
  CHRONB42                   LENGTH=3                                           
  LABEL="Chronic condition body system 42"                                      
                                                                                
  CHRONB43                   LENGTH=3                                           
  LABEL="Chronic condition body system 43"                                      
                                                                                
  CHRONB44                   LENGTH=3                                           
  LABEL="Chronic condition body system 44"                                      
                                                                                
  CHRONB45                   LENGTH=3                                           
  LABEL="Chronic condition body system 45"                                      
                                                                                
  CHRONB46                   LENGTH=3                                           
  LABEL="Chronic condition body system 46"                                      
                                                                                
  CHRONB47                   LENGTH=3                                           
  LABEL="Chronic condition body system 47"                                      
                                                                                
  CHRONB48                   LENGTH=3                                           
  LABEL="Chronic condition body system 48"                                      
                                                                                
  CHRONB49                   LENGTH=3                                           
  LABEL="Chronic condition body system 49"                                      
                                                                                
  CHRONB50                   LENGTH=3                                           
  LABEL="Chronic condition body system 50"                                      
                                                                                
  CHRONB51                   LENGTH=3                                           
  LABEL="Chronic condition body system 51"                                      
                                                                                
  CHRONB52                   LENGTH=3                                           
  LABEL="Chronic condition body system 52"                                      
                                                                                
  CHRONB53                   LENGTH=3                                           
  LABEL="Chronic condition body system 53"                                      
                                                                                
  CHRONB54                   LENGTH=3                                           
  LABEL="Chronic condition body system 54"                                      
                                                                                
  CHRONB55                   LENGTH=3                                           
  LABEL="Chronic condition body system 55"                                      
                                                                                
  CHRONB56                   LENGTH=3                                           
  LABEL="Chronic condition body system 56"                                      
                                                                                
  CHRONB57                   LENGTH=3                                           
  LABEL="Chronic condition body system 57"                                      
                                                                                
  CHRONB58                   LENGTH=3                                           
  LABEL="Chronic condition body system 58"                                      
                                                                                
  CHRONB59                   LENGTH=3                                           
  LABEL="Chronic condition body system 59"                                      
                                                                                
  CHRONB60                   LENGTH=3                                           
  LABEL="Chronic condition body system 60"                                      
                                                                                
  CHRONB61                   LENGTH=3                                           
  LABEL="Chronic condition body system 61"                                      
                                                                                
  CHRONB62                   LENGTH=3                                           
  LABEL="Chronic condition body system 62"                                      
                                                                                
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
                                                                                
  DXMCCS7                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 7"                                         
                                                                                
  DXMCCS8                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 8"                                         
                                                                                
  DXMCCS9                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 9"                                         
                                                                                
  DXMCCS10                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 10"                                        
                                                                                
  DXMCCS11                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 11"                                        
                                                                                
  DXMCCS12                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 12"                                        
                                                                                
  DXMCCS13                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 13"                                        
                                                                                
  DXMCCS14                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 14"                                        
                                                                                
  DXMCCS15                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 15"                                        
                                                                                
  DXMCCS16                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 16"                                        
                                                                                
  DXMCCS17                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 17"                                        
                                                                                
  DXMCCS18                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 18"                                        
                                                                                
  DXMCCS19                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 19"                                        
                                                                                
  DXMCCS20                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 20"                                        
                                                                                
  DXMCCS21                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 21"                                        
                                                                                
  DXMCCS22                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 22"                                        
                                                                                
  DXMCCS23                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 23"                                        
                                                                                
  DXMCCS24                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 24"                                        
                                                                                
  DXMCCS25                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 25"                                        
                                                                                
  DXMCCS26                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 26"                                        
                                                                                
  DXMCCS27                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 27"                                        
                                                                                
  DXMCCS28                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 28"                                        
                                                                                
  DXMCCS29                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 29"                                        
                                                                                
  DXMCCS30                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 30"                                        
                                                                                
  DXMCCS31                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 31"                                        
                                                                                
  DXMCCS32                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 32"                                        
                                                                                
  DXMCCS33                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 33"                                        
                                                                                
  DXMCCS34                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 34"                                        
                                                                                
  DXMCCS35                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 35"                                        
                                                                                
  DXMCCS36                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 36"                                        
                                                                                
  DXMCCS37                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 37"                                        
                                                                                
  DXMCCS38                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 38"                                        
                                                                                
  DXMCCS39                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 39"                                        
                                                                                
  DXMCCS40                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 40"                                        
                                                                                
  DXMCCS41                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 41"                                        
                                                                                
  DXMCCS42                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 42"                                        
                                                                                
  DXMCCS43                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 43"                                        
                                                                                
  DXMCCS44                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 44"                                        
                                                                                
  DXMCCS45                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 45"                                        
                                                                                
  DXMCCS46                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 46"                                        
                                                                                
  DXMCCS47                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 47"                                        
                                                                                
  DXMCCS48                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 48"                                        
                                                                                
  DXMCCS49                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 49"                                        
                                                                                
  DXMCCS50                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 50"                                        
                                                                                
  DXMCCS51                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 51"                                        
                                                                                
  DXMCCS52                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 52"                                        
                                                                                
  DXMCCS53                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 53"                                        
                                                                                
  DXMCCS54                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 54"                                        
                                                                                
  DXMCCS55                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 55"                                        
                                                                                
  DXMCCS56                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 56"                                        
                                                                                
  DXMCCS57                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 57"                                        
                                                                                
  DXMCCS58                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 58"                                        
                                                                                
  DXMCCS59                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 59"                                        
                                                                                
  DXMCCS60                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 60"                                        
                                                                                
  DXMCCS61                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 61"                                        
                                                                                
  DXMCCS62                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 62"                                        
                                                                                
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
                                                                                
  E_MCCS7                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  E Code 7"                                            
                                                                                
  E_MCCS8                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  E Code 8"                                            
                                                                                
  E_MCCS9                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  E Code 9"                                            
                                                                                
  E_MCCS10                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  E Code 10"                                           
                                                                                
  E_MCCS11                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  E Code 11"                                           
                                                                                
  E_MCCS12                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  E Code 12"                                           
                                                                                
  KEY                        LENGTH=8                 FORMAT=Z18.               
  LABEL="HCUP record identifier"                                                
                                                                                
  PCLASS1                    LENGTH=3                                           
  LABEL="Procedure class 1"                                                     
                                                                                
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
                                                                                
  PCLASS32                   LENGTH=3                                           
  LABEL="Procedure class 32"                                                    
                                                                                
  PCLASS33                   LENGTH=3                                           
  LABEL="Procedure class 33"                                                    
                                                                                
  PCLASS34                   LENGTH=3                                           
  LABEL="Procedure class 34"                                                    
                                                                                
  PCLASS35                   LENGTH=3                                           
  LABEL="Procedure class 35"                                                    
                                                                                
  PCLASS36                   LENGTH=3                                           
  LABEL="Procedure class 36"                                                    
                                                                                
  PCLASS37                   LENGTH=3                                           
  LABEL="Procedure class 37"                                                    
                                                                                
  PRMCCS1                    LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 1"                                         
                                                                                
  PRMCCS2                    LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 2"                                         
                                                                                
  PRMCCS3                    LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 3"                                         
                                                                                
  PRMCCS4                    LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 4"                                         
                                                                                
  PRMCCS5                    LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 5"                                         
                                                                                
  PRMCCS6                    LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 6"                                         
                                                                                
  PRMCCS7                    LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 7"                                         
                                                                                
  PRMCCS8                    LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 8"                                         
                                                                                
  PRMCCS9                    LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 9"                                         
                                                                                
  PRMCCS10                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 10"                                        
                                                                                
  PRMCCS11                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 11"                                        
                                                                                
  PRMCCS12                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 12"                                        
                                                                                
  PRMCCS13                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 13"                                        
                                                                                
  PRMCCS14                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 14"                                        
                                                                                
  PRMCCS15                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 15"                                        
                                                                                
  PRMCCS16                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 16"                                        
                                                                                
  PRMCCS17                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 17"                                        
                                                                                
  PRMCCS18                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 18"                                        
                                                                                
  PRMCCS19                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 19"                                        
                                                                                
  PRMCCS20                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 20"                                        
                                                                                
  PRMCCS21                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 21"                                        
                                                                                
  PRMCCS22                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 22"                                        
                                                                                
  PRMCCS23                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 23"                                        
                                                                                
  PRMCCS24                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 24"                                        
                                                                                
  PRMCCS25                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 25"                                        
                                                                                
  PRMCCS26                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 26"                                        
                                                                                
  PRMCCS27                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 27"                                        
                                                                                
  PRMCCS28                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 28"                                        
                                                                                
  PRMCCS29                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 29"                                        
                                                                                
  PRMCCS30                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 30"                                        
                                                                                
  PRMCCS31                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 31"                                        
                                                                                
  PRMCCS32                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 32"                                        
                                                                                
  PRMCCS33                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 33"                                        
                                                                                
  PRMCCS34                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 34"                                        
                                                                                
  PRMCCS35                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 35"                                        
                                                                                
  PRMCCS36                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 36"                                        
                                                                                
  PRMCCS37                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 37"                                        
                                                                                
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
      @1      CHRON1                   N2PF.                                    
      @3      CHRON2                   N2PF.                                    
      @5      CHRON3                   N2PF.                                    
      @7      CHRON4                   N2PF.                                    
      @9      CHRON5                   N2PF.                                    
      @11     CHRON6                   N2PF.                                    
      @13     CHRON7                   N2PF.                                    
      @15     CHRON8                   N2PF.                                    
      @17     CHRON9                   N2PF.                                    
      @19     CHRON10                  N2PF.                                    
      @21     CHRON11                  N2PF.                                    
      @23     CHRON12                  N2PF.                                    
      @25     CHRON13                  N2PF.                                    
      @27     CHRON14                  N2PF.                                    
      @29     CHRON15                  N2PF.                                    
      @31     CHRON16                  N2PF.                                    
      @33     CHRON17                  N2PF.                                    
      @35     CHRON18                  N2PF.                                    
      @37     CHRON19                  N2PF.                                    
      @39     CHRON20                  N2PF.                                    
      @41     CHRON21                  N2PF.                                    
      @43     CHRON22                  N2PF.                                    
      @45     CHRON23                  N2PF.                                    
      @47     CHRON24                  N2PF.                                    
      @49     CHRON25                  N2PF.                                    
      @51     CHRON26                  N2PF.                                    
      @53     CHRON27                  N2PF.                                    
      @55     CHRON28                  N2PF.                                    
      @57     CHRON29                  N2PF.                                    
      @59     CHRON30                  N2PF.                                    
      @61     CHRON31                  N2PF.                                    
      @63     CHRON32                  N2PF.                                    
      @65     CHRON33                  N2PF.                                    
      @67     CHRON34                  N2PF.                                    
      @69     CHRON35                  N2PF.                                    
      @71     CHRON36                  N2PF.                                    
      @73     CHRON37                  N2PF.                                    
      @75     CHRON38                  N2PF.                                    
      @77     CHRON39                  N2PF.                                    
      @79     CHRON40                  N2PF.                                    
      @81     CHRON41                  N2PF.                                    
      @83     CHRON42                  N2PF.                                    
      @85     CHRON43                  N2PF.                                    
      @87     CHRON44                  N2PF.                                    
      @89     CHRON45                  N2PF.                                    
      @91     CHRON46                  N2PF.                                    
      @93     CHRON47                  N2PF.                                    
      @95     CHRON48                  N2PF.                                    
      @97     CHRON49                  N2PF.                                    
      @99     CHRON50                  N2PF.                                    
      @101    CHRON51                  N2PF.                                    
      @103    CHRON52                  N2PF.                                    
      @105    CHRON53                  N2PF.                                    
      @107    CHRON54                  N2PF.                                    
      @109    CHRON55                  N2PF.                                    
      @111    CHRON56                  N2PF.                                    
      @113    CHRON57                  N2PF.                                    
      @115    CHRON58                  N2PF.                                    
      @117    CHRON59                  N2PF.                                    
      @119    CHRON60                  N2PF.                                    
      @121    CHRON61                  N2PF.                                    
      @123    CHRON62                  N2PF.                                    
      @125    CHRONB1                  N2PF.                                    
      @127    CHRONB2                  N2PF.                                    
      @129    CHRONB3                  N2PF.                                    
      @131    CHRONB4                  N2PF.                                    
      @133    CHRONB5                  N2PF.                                    
      @135    CHRONB6                  N2PF.                                    
      @137    CHRONB7                  N2PF.                                    
      @139    CHRONB8                  N2PF.                                    
      @141    CHRONB9                  N2PF.                                    
      @143    CHRONB10                 N2PF.                                    
      @145    CHRONB11                 N2PF.                                    
      @147    CHRONB12                 N2PF.                                    
      @149    CHRONB13                 N2PF.                                    
      @151    CHRONB14                 N2PF.                                    
      @153    CHRONB15                 N2PF.                                    
      @155    CHRONB16                 N2PF.                                    
      @157    CHRONB17                 N2PF.                                    
      @159    CHRONB18                 N2PF.                                    
      @161    CHRONB19                 N2PF.                                    
      @163    CHRONB20                 N2PF.                                    
      @165    CHRONB21                 N2PF.                                    
      @167    CHRONB22                 N2PF.                                    
      @169    CHRONB23                 N2PF.                                    
      @171    CHRONB24                 N2PF.                                    
      @173    CHRONB25                 N2PF.                                    
      @175    CHRONB26                 N2PF.                                    
      @177    CHRONB27                 N2PF.                                    
      @179    CHRONB28                 N2PF.                                    
      @181    CHRONB29                 N2PF.                                    
      @183    CHRONB30                 N2PF.                                    
      @185    CHRONB31                 N2PF.                                    
      @187    CHRONB32                 N2PF.                                    
      @189    CHRONB33                 N2PF.                                    
      @191    CHRONB34                 N2PF.                                    
      @193    CHRONB35                 N2PF.                                    
      @195    CHRONB36                 N2PF.                                    
      @197    CHRONB37                 N2PF.                                    
      @199    CHRONB38                 N2PF.                                    
      @201    CHRONB39                 N2PF.                                    
      @203    CHRONB40                 N2PF.                                    
      @205    CHRONB41                 N2PF.                                    
      @207    CHRONB42                 N2PF.                                    
      @209    CHRONB43                 N2PF.                                    
      @211    CHRONB44                 N2PF.                                    
      @213    CHRONB45                 N2PF.                                    
      @215    CHRONB46                 N2PF.                                    
      @217    CHRONB47                 N2PF.                                    
      @219    CHRONB48                 N2PF.                                    
      @221    CHRONB49                 N2PF.                                    
      @223    CHRONB50                 N2PF.                                    
      @225    CHRONB51                 N2PF.                                    
      @227    CHRONB52                 N2PF.                                    
      @229    CHRONB53                 N2PF.                                    
      @231    CHRONB54                 N2PF.                                    
      @233    CHRONB55                 N2PF.                                    
      @235    CHRONB56                 N2PF.                                    
      @237    CHRONB57                 N2PF.                                    
      @239    CHRONB58                 N2PF.                                    
      @241    CHRONB59                 N2PF.                                    
      @243    CHRONB60                 N2PF.                                    
      @245    CHRONB61                 N2PF.                                    
      @247    CHRONB62                 N2PF.                                    
      @249    DXMCCS1                  $CHAR11.                                 
      @260    DXMCCS2                  $CHAR11.                                 
      @271    DXMCCS3                  $CHAR11.                                 
      @282    DXMCCS4                  $CHAR11.                                 
      @293    DXMCCS5                  $CHAR11.                                 
      @304    DXMCCS6                  $CHAR11.                                 
      @315    DXMCCS7                  $CHAR11.                                 
      @326    DXMCCS8                  $CHAR11.                                 
      @337    DXMCCS9                  $CHAR11.                                 
      @348    DXMCCS10                 $CHAR11.                                 
      @359    DXMCCS11                 $CHAR11.                                 
      @370    DXMCCS12                 $CHAR11.                                 
      @381    DXMCCS13                 $CHAR11.                                 
      @392    DXMCCS14                 $CHAR11.                                 
      @403    DXMCCS15                 $CHAR11.                                 
      @414    DXMCCS16                 $CHAR11.                                 
      @425    DXMCCS17                 $CHAR11.                                 
      @436    DXMCCS18                 $CHAR11.                                 
      @447    DXMCCS19                 $CHAR11.                                 
      @458    DXMCCS20                 $CHAR11.                                 
      @469    DXMCCS21                 $CHAR11.                                 
      @480    DXMCCS22                 $CHAR11.                                 
      @491    DXMCCS23                 $CHAR11.                                 
      @502    DXMCCS24                 $CHAR11.                                 
      @513    DXMCCS25                 $CHAR11.                                 
      @524    DXMCCS26                 $CHAR11.                                 
      @535    DXMCCS27                 $CHAR11.                                 
      @546    DXMCCS28                 $CHAR11.                                 
      @557    DXMCCS29                 $CHAR11.                                 
      @568    DXMCCS30                 $CHAR11.                                 
      @579    DXMCCS31                 $CHAR11.                                 
      @590    DXMCCS32                 $CHAR11.                                 
      @601    DXMCCS33                 $CHAR11.                                 
      @612    DXMCCS34                 $CHAR11.                                 
      @623    DXMCCS35                 $CHAR11.                                 
      @634    DXMCCS36                 $CHAR11.                                 
      @645    DXMCCS37                 $CHAR11.                                 
      @656    DXMCCS38                 $CHAR11.                                 
      @667    DXMCCS39                 $CHAR11.                                 
      @678    DXMCCS40                 $CHAR11.                                 
      @689    DXMCCS41                 $CHAR11.                                 
      @700    DXMCCS42                 $CHAR11.                                 
      @711    DXMCCS43                 $CHAR11.                                 
      @722    DXMCCS44                 $CHAR11.                                 
      @733    DXMCCS45                 $CHAR11.                                 
      @744    DXMCCS46                 $CHAR11.                                 
      @755    DXMCCS47                 $CHAR11.                                 
      @766    DXMCCS48                 $CHAR11.                                 
      @777    DXMCCS49                 $CHAR11.                                 
      @788    DXMCCS50                 $CHAR11.                                 
      @799    DXMCCS51                 $CHAR11.                                 
      @810    DXMCCS52                 $CHAR11.                                 
      @821    DXMCCS53                 $CHAR11.                                 
      @832    DXMCCS54                 $CHAR11.                                 
      @843    DXMCCS55                 $CHAR11.                                 
      @854    DXMCCS56                 $CHAR11.                                 
      @865    DXMCCS57                 $CHAR11.                                 
      @876    DXMCCS58                 $CHAR11.                                 
      @887    DXMCCS59                 $CHAR11.                                 
      @898    DXMCCS60                 $CHAR11.                                 
      @909    DXMCCS61                 $CHAR11.                                 
      @920    DXMCCS62                 $CHAR11.                                 
      @931    E_MCCS1                  $CHAR11.                                 
      @942    E_MCCS2                  $CHAR11.                                 
      @953    E_MCCS3                  $CHAR11.                                 
      @964    E_MCCS4                  $CHAR11.                                 
      @975    E_MCCS5                  $CHAR11.                                 
      @986    E_MCCS6                  $CHAR11.                                 
      @997    E_MCCS7                  $CHAR11.                                 
      @1008   E_MCCS8                  $CHAR11.                                 
      @1019   E_MCCS9                  $CHAR11.                                 
      @1030   E_MCCS10                 $CHAR11.                                 
      @1041   E_MCCS11                 $CHAR11.                                 
      @1052   E_MCCS12                 $CHAR11.                                 
      @1063   KEY                      18.                                      
      @1081   PCLASS1                  N2PF.                                    
      @1083   PCLASS2                  N2PF.                                    
      @1085   PCLASS3                  N2PF.                                    
      @1087   PCLASS4                  N2PF.                                    
      @1089   PCLASS5                  N2PF.                                    
      @1091   PCLASS6                  N2PF.                                    
      @1093   PCLASS7                  N2PF.                                    
      @1095   PCLASS8                  N2PF.                                    
      @1097   PCLASS9                  N2PF.                                    
      @1099   PCLASS10                 N2PF.                                    
      @1101   PCLASS11                 N2PF.                                    
      @1103   PCLASS12                 N2PF.                                    
      @1105   PCLASS13                 N2PF.                                    
      @1107   PCLASS14                 N2PF.                                    
      @1109   PCLASS15                 N2PF.                                    
      @1111   PCLASS16                 N2PF.                                    
      @1113   PCLASS17                 N2PF.                                    
      @1115   PCLASS18                 N2PF.                                    
      @1117   PCLASS19                 N2PF.                                    
      @1119   PCLASS20                 N2PF.                                    
      @1121   PCLASS21                 N2PF.                                    
      @1123   PCLASS22                 N2PF.                                    
      @1125   PCLASS23                 N2PF.                                    
      @1127   PCLASS24                 N2PF.                                    
      @1129   PCLASS25                 N2PF.                                    
      @1131   PCLASS26                 N2PF.                                    
      @1133   PCLASS27                 N2PF.                                    
      @1135   PCLASS28                 N2PF.                                    
      @1137   PCLASS29                 N2PF.                                    
      @1139   PCLASS30                 N2PF.                                    
      @1141   PCLASS31                 N2PF.                                    
      @1143   PCLASS32                 N2PF.                                    
      @1145   PCLASS33                 N2PF.                                    
      @1147   PCLASS34                 N2PF.                                    
      @1149   PCLASS35                 N2PF.                                    
      @1151   PCLASS36                 N2PF.                                    
      @1153   PCLASS37                 N2PF.                                    
      @1155   PRMCCS1                  $CHAR8.                                  
      @1163   PRMCCS2                  $CHAR8.                                  
      @1171   PRMCCS3                  $CHAR8.                                  
      @1179   PRMCCS4                  $CHAR8.                                  
      @1187   PRMCCS5                  $CHAR8.                                  
      @1195   PRMCCS6                  $CHAR8.                                  
      @1203   PRMCCS7                  $CHAR8.                                  
      @1211   PRMCCS8                  $CHAR8.                                  
      @1219   PRMCCS9                  $CHAR8.                                  
      @1227   PRMCCS10                 $CHAR8.                                  
      @1235   PRMCCS11                 $CHAR8.                                  
      @1243   PRMCCS12                 $CHAR8.                                  
      @1251   PRMCCS13                 $CHAR8.                                  
      @1259   PRMCCS14                 $CHAR8.                                  
      @1267   PRMCCS15                 $CHAR8.                                  
      @1275   PRMCCS16                 $CHAR8.                                  
      @1283   PRMCCS17                 $CHAR8.                                  
      @1291   PRMCCS18                 $CHAR8.                                  
      @1299   PRMCCS19                 $CHAR8.                                  
      @1307   PRMCCS20                 $CHAR8.                                  
      @1315   PRMCCS21                 $CHAR8.                                  
      @1323   PRMCCS22                 $CHAR8.                                  
      @1331   PRMCCS23                 $CHAR8.                                  
      @1339   PRMCCS24                 $CHAR8.                                  
      @1347   PRMCCS25                 $CHAR8.                                  
      @1355   PRMCCS26                 $CHAR8.                                  
      @1363   PRMCCS27                 $CHAR8.                                  
      @1371   PRMCCS28                 $CHAR8.                                  
      @1379   PRMCCS29                 $CHAR8.                                  
      @1387   PRMCCS30                 $CHAR8.                                  
      @1395   PRMCCS31                 $CHAR8.                                  
      @1403   PRMCCS32                 $CHAR8.                                  
      @1411   PRMCCS33                 $CHAR8.                                  
      @1419   PRMCCS34                 $CHAR8.                                  
      @1427   PRMCCS35                 $CHAR8.                                  
      @1435   PRMCCS36                 $CHAR8.                                  
      @1443   PRMCCS37                 $CHAR8.                                  
      @1451   U_BLOOD                  N2PF.                                    
      @1453   U_CATH                   N2PF.                                    
      @1455   U_CCU                    N2PF.                                    
      @1457   U_CHESTXRAY              N2PF.                                    
      @1459   U_CTSCAN                 N2PF.                                    
      @1461   U_DIALYSIS               N2PF.                                    
      @1463   U_ECHO                   N2PF.                                    
      @1465   U_ED                     N2PF.                                    
      @1467   U_EEG                    N2PF.                                    
      @1469   U_EKG                    N2PF.                                    
      @1471   U_EPO                    N2PF.                                    
      @1473   U_ICU                    N2PF.                                    
      @1475   U_LITHOTRIPSY            N2PF.                                    
      @1477   U_MHSA                   N2PF.                                    
      @1479   U_MRT                    N2PF.                                    
      @1481   U_NEWBN2L                N2PF.                                    
      @1483   U_NEWBN3L                N2PF.                                    
      @1485   U_NEWBN4L                N2PF.                                    
      @1487   U_NUCMED                 N2PF.                                    
      @1489   U_OBSERVATION            N2PF.                                    
      @1491   U_OCCTHERAPY             N2PF.                                    
      @1493   U_ORGANACQ               N2PF.                                    
      @1495   U_OTHIMPLANTS            N2PF.                                    
      @1497   U_PACEMAKER              N2PF.                                    
      @1499   U_PHYTHERAPY             N2PF.                                    
      @1501   U_RADTHERAPY             N2PF.                                    
      @1503   U_RESPTHERAPY            N2PF.                                    
      @1505   U_SPEECHTHERAPY          N2PF.                                    
      @1507   U_STRESS                 N2PF.                                    
      @1509   U_ULTRASOUND             N2PF.                                    
      ;                                                                         
                                                                                
                                                                                
RUN;
