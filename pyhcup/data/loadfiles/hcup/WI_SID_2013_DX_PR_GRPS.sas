/*******************************************************************            
* Creation Date: 11/13/2014                                                     
*   WI_SID_2013_DX_PR_GRPS.SAS:                                                 
*      THE SAS CODE SHOWN BELOW WILL LOAD THE ASCII                             
*      INPATIENT STAY DX_PR_GRPS FILE INTO SAS                                  
*******************************************************************/            
                                                                                
                                                                                
***************************************************************;                
* ----------------------------------------------------------- *;                
* |  NOTICE: Use of HCUP data constitutes acceptance of the | *;                
* |  terms and conditions of the HCUP Data Use Agreement.   | *;                
* ----------------------------------------------------------- *;                
***************************************************************;                
                                                                                
                                                                                
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
  INVALUE N11P2F                                                                
    '-9999999.99' = .                                                           
    '-8888888.88' = .A                                                          
    '-6666666.66' = .C                                                          
    OTHER = (|11.2|)                                                            
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
DATA WI_SIDC_2013_DX_PR_GRPS;                                                   
INFILE 'WI_SID_2013_DX_PR_GRPS.ASC' FIRSTOBS=3 LRECL = 1478;                    
                                                                                
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
                                                                                
  KEY                        LENGTH=8                 FORMAT=Z15.               
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
                                                                                
  PCLASS38                   LENGTH=3                                           
  LABEL="Procedure class 38"                                                    
                                                                                
  PCLASS39                   LENGTH=3                                           
  LABEL="Procedure class 39"                                                    
                                                                                
  PCLASS40                   LENGTH=3                                           
  LABEL="Procedure class 40"                                                    
                                                                                
  PCLASS41                   LENGTH=3                                           
  LABEL="Procedure class 41"                                                    
                                                                                
  PCLASS42                   LENGTH=3                                           
  LABEL="Procedure class 42"                                                    
                                                                                
  PCLASS43                   LENGTH=3                                           
  LABEL="Procedure class 43"                                                    
                                                                                
  PCLASS44                   LENGTH=3                                           
  LABEL="Procedure class 44"                                                    
                                                                                
  PCLASS45                   LENGTH=3                                           
  LABEL="Procedure class 45"                                                    
                                                                                
  PCLASS46                   LENGTH=3                                           
  LABEL="Procedure class 46"                                                    
                                                                                
  PCLASS47                   LENGTH=3                                           
  LABEL="Procedure class 47"                                                    
                                                                                
  PCLASS48                   LENGTH=3                                           
  LABEL="Procedure class 48"                                                    
                                                                                
  PCLASS49                   LENGTH=3                                           
  LABEL="Procedure class 49"                                                    
                                                                                
  PCLASS50                   LENGTH=3                                           
  LABEL="Procedure class 50"                                                    
                                                                                
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
                                                                                
  PRMCCS38                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 38"                                        
                                                                                
  PRMCCS39                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 39"                                        
                                                                                
  PRMCCS40                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 40"                                        
                                                                                
  PRMCCS41                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 41"                                        
                                                                                
  PRMCCS42                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 42"                                        
                                                                                
  PRMCCS43                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 43"                                        
                                                                                
  PRMCCS44                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 44"                                        
                                                                                
  PRMCCS45                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 45"                                        
                                                                                
  PRMCCS46                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 46"                                        
                                                                                
  PRMCCS47                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 47"                                        
                                                                                
  PRMCCS48                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 48"                                        
                                                                                
  PRMCCS49                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 49"                                        
                                                                                
  PRMCCS50                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 50"                                        
                                                                                
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
      @101    CHRONB1                  N2PF.                                    
      @103    CHRONB2                  N2PF.                                    
      @105    CHRONB3                  N2PF.                                    
      @107    CHRONB4                  N2PF.                                    
      @109    CHRONB5                  N2PF.                                    
      @111    CHRONB6                  N2PF.                                    
      @113    CHRONB7                  N2PF.                                    
      @115    CHRONB8                  N2PF.                                    
      @117    CHRONB9                  N2PF.                                    
      @119    CHRONB10                 N2PF.                                    
      @121    CHRONB11                 N2PF.                                    
      @123    CHRONB12                 N2PF.                                    
      @125    CHRONB13                 N2PF.                                    
      @127    CHRONB14                 N2PF.                                    
      @129    CHRONB15                 N2PF.                                    
      @131    CHRONB16                 N2PF.                                    
      @133    CHRONB17                 N2PF.                                    
      @135    CHRONB18                 N2PF.                                    
      @137    CHRONB19                 N2PF.                                    
      @139    CHRONB20                 N2PF.                                    
      @141    CHRONB21                 N2PF.                                    
      @143    CHRONB22                 N2PF.                                    
      @145    CHRONB23                 N2PF.                                    
      @147    CHRONB24                 N2PF.                                    
      @149    CHRONB25                 N2PF.                                    
      @151    CHRONB26                 N2PF.                                    
      @153    CHRONB27                 N2PF.                                    
      @155    CHRONB28                 N2PF.                                    
      @157    CHRONB29                 N2PF.                                    
      @159    CHRONB30                 N2PF.                                    
      @161    CHRONB31                 N2PF.                                    
      @163    CHRONB32                 N2PF.                                    
      @165    CHRONB33                 N2PF.                                    
      @167    CHRONB34                 N2PF.                                    
      @169    CHRONB35                 N2PF.                                    
      @171    CHRONB36                 N2PF.                                    
      @173    CHRONB37                 N2PF.                                    
      @175    CHRONB38                 N2PF.                                    
      @177    CHRONB39                 N2PF.                                    
      @179    CHRONB40                 N2PF.                                    
      @181    CHRONB41                 N2PF.                                    
      @183    CHRONB42                 N2PF.                                    
      @185    CHRONB43                 N2PF.                                    
      @187    CHRONB44                 N2PF.                                    
      @189    CHRONB45                 N2PF.                                    
      @191    CHRONB46                 N2PF.                                    
      @193    CHRONB47                 N2PF.                                    
      @195    CHRONB48                 N2PF.                                    
      @197    CHRONB49                 N2PF.                                    
      @199    CHRONB50                 N2PF.                                    
      @201    DXMCCS1                  $CHAR11.                                 
      @212    DXMCCS2                  $CHAR11.                                 
      @223    DXMCCS3                  $CHAR11.                                 
      @234    DXMCCS4                  $CHAR11.                                 
      @245    DXMCCS5                  $CHAR11.                                 
      @256    DXMCCS6                  $CHAR11.                                 
      @267    DXMCCS7                  $CHAR11.                                 
      @278    DXMCCS8                  $CHAR11.                                 
      @289    DXMCCS9                  $CHAR11.                                 
      @300    DXMCCS10                 $CHAR11.                                 
      @311    DXMCCS11                 $CHAR11.                                 
      @322    DXMCCS12                 $CHAR11.                                 
      @333    DXMCCS13                 $CHAR11.                                 
      @344    DXMCCS14                 $CHAR11.                                 
      @355    DXMCCS15                 $CHAR11.                                 
      @366    DXMCCS16                 $CHAR11.                                 
      @377    DXMCCS17                 $CHAR11.                                 
      @388    DXMCCS18                 $CHAR11.                                 
      @399    DXMCCS19                 $CHAR11.                                 
      @410    DXMCCS20                 $CHAR11.                                 
      @421    DXMCCS21                 $CHAR11.                                 
      @432    DXMCCS22                 $CHAR11.                                 
      @443    DXMCCS23                 $CHAR11.                                 
      @454    DXMCCS24                 $CHAR11.                                 
      @465    DXMCCS25                 $CHAR11.                                 
      @476    DXMCCS26                 $CHAR11.                                 
      @487    DXMCCS27                 $CHAR11.                                 
      @498    DXMCCS28                 $CHAR11.                                 
      @509    DXMCCS29                 $CHAR11.                                 
      @520    DXMCCS30                 $CHAR11.                                 
      @531    DXMCCS31                 $CHAR11.                                 
      @542    DXMCCS32                 $CHAR11.                                 
      @553    DXMCCS33                 $CHAR11.                                 
      @564    DXMCCS34                 $CHAR11.                                 
      @575    DXMCCS35                 $CHAR11.                                 
      @586    DXMCCS36                 $CHAR11.                                 
      @597    DXMCCS37                 $CHAR11.                                 
      @608    DXMCCS38                 $CHAR11.                                 
      @619    DXMCCS39                 $CHAR11.                                 
      @630    DXMCCS40                 $CHAR11.                                 
      @641    DXMCCS41                 $CHAR11.                                 
      @652    DXMCCS42                 $CHAR11.                                 
      @663    DXMCCS43                 $CHAR11.                                 
      @674    DXMCCS44                 $CHAR11.                                 
      @685    DXMCCS45                 $CHAR11.                                 
      @696    DXMCCS46                 $CHAR11.                                 
      @707    DXMCCS47                 $CHAR11.                                 
      @718    DXMCCS48                 $CHAR11.                                 
      @729    DXMCCS49                 $CHAR11.                                 
      @740    DXMCCS50                 $CHAR11.                                 
      @751    E_MCCS1                  $CHAR11.                                 
      @762    E_MCCS2                  $CHAR11.                                 
      @773    E_MCCS3                  $CHAR11.                                 
      @784    E_MCCS4                  $CHAR11.                                 
      @795    E_MCCS5                  $CHAR11.                                 
      @806    E_MCCS6                  $CHAR11.                                 
      @817    E_MCCS7                  $CHAR11.                                 
      @828    E_MCCS8                  $CHAR11.                                 
      @839    E_MCCS9                  $CHAR11.                                 
      @850    E_MCCS10                 $CHAR11.                                 
      @861    E_MCCS11                 $CHAR11.                                 
      @872    INJURY                   N2PF.                                    
      @874    INJURY_CUT               N2PF.                                    
      @876    INJURY_DROWN             N2PF.                                    
      @878    INJURY_FALL              N2PF.                                    
      @880    INJURY_FIRE              N2PF.                                    
      @882    INJURY_FIREARM           N2PF.                                    
      @884    INJURY_MACHINERY         N2PF.                                    
      @886    INJURY_MVT               N2PF.                                    
      @888    INJURY_NATURE            N2PF.                                    
      @890    INJURY_POISON            N2PF.                                    
      @892    INJURY_STRUCK            N2PF.                                    
      @894    INJURY_SUFFOCATION       N2PF.                                    
      @896    INTENT_ASSAULT           N2PF.                                    
      @898    INTENT_SELF_HARM         N2PF.                                    
      @900    INTENT_UNINTENTIONAL     N2PF.                                    
      @902    KEY                      15.                                      
      @917    MULTINJURY               N2PF.                                    
      @919    PCLASS1                  N2PF.                                    
      @921    PCLASS2                  N2PF.                                    
      @923    PCLASS3                  N2PF.                                    
      @925    PCLASS4                  N2PF.                                    
      @927    PCLASS5                  N2PF.                                    
      @929    PCLASS6                  N2PF.                                    
      @931    PCLASS7                  N2PF.                                    
      @933    PCLASS8                  N2PF.                                    
      @935    PCLASS9                  N2PF.                                    
      @937    PCLASS10                 N2PF.                                    
      @939    PCLASS11                 N2PF.                                    
      @941    PCLASS12                 N2PF.                                    
      @943    PCLASS13                 N2PF.                                    
      @945    PCLASS14                 N2PF.                                    
      @947    PCLASS15                 N2PF.                                    
      @949    PCLASS16                 N2PF.                                    
      @951    PCLASS17                 N2PF.                                    
      @953    PCLASS18                 N2PF.                                    
      @955    PCLASS19                 N2PF.                                    
      @957    PCLASS20                 N2PF.                                    
      @959    PCLASS21                 N2PF.                                    
      @961    PCLASS22                 N2PF.                                    
      @963    PCLASS23                 N2PF.                                    
      @965    PCLASS24                 N2PF.                                    
      @967    PCLASS25                 N2PF.                                    
      @969    PCLASS26                 N2PF.                                    
      @971    PCLASS27                 N2PF.                                    
      @973    PCLASS28                 N2PF.                                    
      @975    PCLASS29                 N2PF.                                    
      @977    PCLASS30                 N2PF.                                    
      @979    PCLASS31                 N2PF.                                    
      @981    PCLASS32                 N2PF.                                    
      @983    PCLASS33                 N2PF.                                    
      @985    PCLASS34                 N2PF.                                    
      @987    PCLASS35                 N2PF.                                    
      @989    PCLASS36                 N2PF.                                    
      @991    PCLASS37                 N2PF.                                    
      @993    PCLASS38                 N2PF.                                    
      @995    PCLASS39                 N2PF.                                    
      @997    PCLASS40                 N2PF.                                    
      @999    PCLASS41                 N2PF.                                    
      @1001   PCLASS42                 N2PF.                                    
      @1003   PCLASS43                 N2PF.                                    
      @1005   PCLASS44                 N2PF.                                    
      @1007   PCLASS45                 N2PF.                                    
      @1009   PCLASS46                 N2PF.                                    
      @1011   PCLASS47                 N2PF.                                    
      @1013   PCLASS48                 N2PF.                                    
      @1015   PCLASS49                 N2PF.                                    
      @1017   PCLASS50                 N2PF.                                    
      @1019   PRMCCS1                  $CHAR8.                                  
      @1027   PRMCCS2                  $CHAR8.                                  
      @1035   PRMCCS3                  $CHAR8.                                  
      @1043   PRMCCS4                  $CHAR8.                                  
      @1051   PRMCCS5                  $CHAR8.                                  
      @1059   PRMCCS6                  $CHAR8.                                  
      @1067   PRMCCS7                  $CHAR8.                                  
      @1075   PRMCCS8                  $CHAR8.                                  
      @1083   PRMCCS9                  $CHAR8.                                  
      @1091   PRMCCS10                 $CHAR8.                                  
      @1099   PRMCCS11                 $CHAR8.                                  
      @1107   PRMCCS12                 $CHAR8.                                  
      @1115   PRMCCS13                 $CHAR8.                                  
      @1123   PRMCCS14                 $CHAR8.                                  
      @1131   PRMCCS15                 $CHAR8.                                  
      @1139   PRMCCS16                 $CHAR8.                                  
      @1147   PRMCCS17                 $CHAR8.                                  
      @1155   PRMCCS18                 $CHAR8.                                  
      @1163   PRMCCS19                 $CHAR8.                                  
      @1171   PRMCCS20                 $CHAR8.                                  
      @1179   PRMCCS21                 $CHAR8.                                  
      @1187   PRMCCS22                 $CHAR8.                                  
      @1195   PRMCCS23                 $CHAR8.                                  
      @1203   PRMCCS24                 $CHAR8.                                  
      @1211   PRMCCS25                 $CHAR8.                                  
      @1219   PRMCCS26                 $CHAR8.                                  
      @1227   PRMCCS27                 $CHAR8.                                  
      @1235   PRMCCS28                 $CHAR8.                                  
      @1243   PRMCCS29                 $CHAR8.                                  
      @1251   PRMCCS30                 $CHAR8.                                  
      @1259   PRMCCS31                 $CHAR8.                                  
      @1267   PRMCCS32                 $CHAR8.                                  
      @1275   PRMCCS33                 $CHAR8.                                  
      @1283   PRMCCS34                 $CHAR8.                                  
      @1291   PRMCCS35                 $CHAR8.                                  
      @1299   PRMCCS36                 $CHAR8.                                  
      @1307   PRMCCS37                 $CHAR8.                                  
      @1315   PRMCCS38                 $CHAR8.                                  
      @1323   PRMCCS39                 $CHAR8.                                  
      @1331   PRMCCS40                 $CHAR8.                                  
      @1339   PRMCCS41                 $CHAR8.                                  
      @1347   PRMCCS42                 $CHAR8.                                  
      @1355   PRMCCS43                 $CHAR8.                                  
      @1363   PRMCCS44                 $CHAR8.                                  
      @1371   PRMCCS45                 $CHAR8.                                  
      @1379   PRMCCS46                 $CHAR8.                                  
      @1387   PRMCCS47                 $CHAR8.                                  
      @1395   PRMCCS48                 $CHAR8.                                  
      @1403   PRMCCS49                 $CHAR8.                                  
      @1411   PRMCCS50                 $CHAR8.                                  
      @1419   U_BLOOD                  N2PF.                                    
      @1421   U_CATH                   N2PF.                                    
      @1423   U_CCU                    N2PF.                                    
      @1425   U_CHESTXRAY              N2PF.                                    
      @1427   U_CTSCAN                 N2PF.                                    
      @1429   U_DIALYSIS               N2PF.                                    
      @1431   U_ECHO                   N2PF.                                    
      @1433   U_ED                     N2PF.                                    
      @1435   U_EEG                    N2PF.                                    
      @1437   U_EKG                    N2PF.                                    
      @1439   U_EPO                    N2PF.                                    
      @1441   U_ICU                    N2PF.                                    
      @1443   U_LITHOTRIPSY            N2PF.                                    
      @1445   U_MHSA                   N2PF.                                    
      @1447   U_MRT                    N2PF.                                    
      @1449   U_NEWBN2L                N2PF.                                    
      @1451   U_NEWBN3L                N2PF.                                    
      @1453   U_NEWBN4L                N2PF.                                    
      @1455   U_NUCMED                 N2PF.                                    
      @1457   U_OBSERVATION            N2PF.                                    
      @1459   U_OCCTHERAPY             N2PF.                                    
      @1461   U_ORGANACQ               N2PF.                                    
      @1463   U_OTHIMPLANTS            N2PF.                                    
      @1465   U_PACEMAKER              N2PF.                                    
      @1467   U_PHYTHERAPY             N2PF.                                    
      @1469   U_RADTHERAPY             N2PF.                                    
      @1471   U_RESPTHERAPY            N2PF.                                    
      @1473   U_SPEECHTHERAPY          N2PF.                                    
      @1475   U_STRESS                 N2PF.                                    
      @1477   U_ULTRASOUND             N2PF.                                    
      ;                                                                         
                                                                                
                                                                                
RUN;
