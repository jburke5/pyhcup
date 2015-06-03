/*******************************************************************            
*   SD_SID_2008_DX_PR_GRPS.SAS:                                                 
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
DATA SD_SIDC_2008_DX_PR_GRPS;                                                   
INFILE 'SD_SID_2008_DX_PR_GRPS.ASC' LRECL = 1455;                               
                                                                                
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
                                                                                
  KEY                        LENGTH=8                 FORMAT=Z14.               
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
      @123    CHRONB1                  N2PF.                                    
      @125    CHRONB2                  N2PF.                                    
      @127    CHRONB3                  N2PF.                                    
      @129    CHRONB4                  N2PF.                                    
      @131    CHRONB5                  N2PF.                                    
      @133    CHRONB6                  N2PF.                                    
      @135    CHRONB7                  N2PF.                                    
      @137    CHRONB8                  N2PF.                                    
      @139    CHRONB9                  N2PF.                                    
      @141    CHRONB10                 N2PF.                                    
      @143    CHRONB11                 N2PF.                                    
      @145    CHRONB12                 N2PF.                                    
      @147    CHRONB13                 N2PF.                                    
      @149    CHRONB14                 N2PF.                                    
      @151    CHRONB15                 N2PF.                                    
      @153    CHRONB16                 N2PF.                                    
      @155    CHRONB17                 N2PF.                                    
      @157    CHRONB18                 N2PF.                                    
      @159    CHRONB19                 N2PF.                                    
      @161    CHRONB20                 N2PF.                                    
      @163    CHRONB21                 N2PF.                                    
      @165    CHRONB22                 N2PF.                                    
      @167    CHRONB23                 N2PF.                                    
      @169    CHRONB24                 N2PF.                                    
      @171    CHRONB25                 N2PF.                                    
      @173    CHRONB26                 N2PF.                                    
      @175    CHRONB27                 N2PF.                                    
      @177    CHRONB28                 N2PF.                                    
      @179    CHRONB29                 N2PF.                                    
      @181    CHRONB30                 N2PF.                                    
      @183    CHRONB31                 N2PF.                                    
      @185    CHRONB32                 N2PF.                                    
      @187    CHRONB33                 N2PF.                                    
      @189    CHRONB34                 N2PF.                                    
      @191    CHRONB35                 N2PF.                                    
      @193    CHRONB36                 N2PF.                                    
      @195    CHRONB37                 N2PF.                                    
      @197    CHRONB38                 N2PF.                                    
      @199    CHRONB39                 N2PF.                                    
      @201    CHRONB40                 N2PF.                                    
      @203    CHRONB41                 N2PF.                                    
      @205    CHRONB42                 N2PF.                                    
      @207    CHRONB43                 N2PF.                                    
      @209    CHRONB44                 N2PF.                                    
      @211    CHRONB45                 N2PF.                                    
      @213    CHRONB46                 N2PF.                                    
      @215    CHRONB47                 N2PF.                                    
      @217    CHRONB48                 N2PF.                                    
      @219    CHRONB49                 N2PF.                                    
      @221    CHRONB50                 N2PF.                                    
      @223    CHRONB51                 N2PF.                                    
      @225    CHRONB52                 N2PF.                                    
      @227    CHRONB53                 N2PF.                                    
      @229    CHRONB54                 N2PF.                                    
      @231    CHRONB55                 N2PF.                                    
      @233    CHRONB56                 N2PF.                                    
      @235    CHRONB57                 N2PF.                                    
      @237    CHRONB58                 N2PF.                                    
      @239    CHRONB59                 N2PF.                                    
      @241    CHRONB60                 N2PF.                                    
      @243    CHRONB61                 N2PF.                                    
      @245    DXMCCS1                  $CHAR11.                                 
      @256    DXMCCS2                  $CHAR11.                                 
      @267    DXMCCS3                  $CHAR11.                                 
      @278    DXMCCS4                  $CHAR11.                                 
      @289    DXMCCS5                  $CHAR11.                                 
      @300    DXMCCS6                  $CHAR11.                                 
      @311    DXMCCS7                  $CHAR11.                                 
      @322    DXMCCS8                  $CHAR11.                                 
      @333    DXMCCS9                  $CHAR11.                                 
      @344    DXMCCS10                 $CHAR11.                                 
      @355    DXMCCS11                 $CHAR11.                                 
      @366    DXMCCS12                 $CHAR11.                                 
      @377    DXMCCS13                 $CHAR11.                                 
      @388    DXMCCS14                 $CHAR11.                                 
      @399    DXMCCS15                 $CHAR11.                                 
      @410    DXMCCS16                 $CHAR11.                                 
      @421    DXMCCS17                 $CHAR11.                                 
      @432    DXMCCS18                 $CHAR11.                                 
      @443    DXMCCS19                 $CHAR11.                                 
      @454    DXMCCS20                 $CHAR11.                                 
      @465    DXMCCS21                 $CHAR11.                                 
      @476    DXMCCS22                 $CHAR11.                                 
      @487    DXMCCS23                 $CHAR11.                                 
      @498    DXMCCS24                 $CHAR11.                                 
      @509    DXMCCS25                 $CHAR11.                                 
      @520    DXMCCS26                 $CHAR11.                                 
      @531    DXMCCS27                 $CHAR11.                                 
      @542    DXMCCS28                 $CHAR11.                                 
      @553    DXMCCS29                 $CHAR11.                                 
      @564    DXMCCS30                 $CHAR11.                                 
      @575    DXMCCS31                 $CHAR11.                                 
      @586    DXMCCS32                 $CHAR11.                                 
      @597    DXMCCS33                 $CHAR11.                                 
      @608    DXMCCS34                 $CHAR11.                                 
      @619    DXMCCS35                 $CHAR11.                                 
      @630    DXMCCS36                 $CHAR11.                                 
      @641    DXMCCS37                 $CHAR11.                                 
      @652    DXMCCS38                 $CHAR11.                                 
      @663    DXMCCS39                 $CHAR11.                                 
      @674    DXMCCS40                 $CHAR11.                                 
      @685    DXMCCS41                 $CHAR11.                                 
      @696    DXMCCS42                 $CHAR11.                                 
      @707    DXMCCS43                 $CHAR11.                                 
      @718    DXMCCS44                 $CHAR11.                                 
      @729    DXMCCS45                 $CHAR11.                                 
      @740    DXMCCS46                 $CHAR11.                                 
      @751    DXMCCS47                 $CHAR11.                                 
      @762    DXMCCS48                 $CHAR11.                                 
      @773    DXMCCS49                 $CHAR11.                                 
      @784    DXMCCS50                 $CHAR11.                                 
      @795    DXMCCS51                 $CHAR11.                                 
      @806    DXMCCS52                 $CHAR11.                                 
      @817    DXMCCS53                 $CHAR11.                                 
      @828    DXMCCS54                 $CHAR11.                                 
      @839    DXMCCS55                 $CHAR11.                                 
      @850    DXMCCS56                 $CHAR11.                                 
      @861    DXMCCS57                 $CHAR11.                                 
      @872    DXMCCS58                 $CHAR11.                                 
      @883    DXMCCS59                 $CHAR11.                                 
      @894    DXMCCS60                 $CHAR11.                                 
      @905    DXMCCS61                 $CHAR11.                                 
      @916    E_MCCS1                  $CHAR11.                                 
      @927    E_MCCS2                  $CHAR11.                                 
      @938    E_MCCS3                  $CHAR11.                                 
      @949    E_MCCS4                  $CHAR11.                                 
      @960    E_MCCS5                  $CHAR11.                                 
      @971    E_MCCS6                  $CHAR11.                                 
      @982    KEY                      14.                                      
      @996    PCLASS1                  N2PF.                                    
      @998    PCLASS2                  N2PF.                                    
      @1000   PCLASS3                  N2PF.                                    
      @1002   PCLASS4                  N2PF.                                    
      @1004   PCLASS5                  N2PF.                                    
      @1006   PCLASS6                  N2PF.                                    
      @1008   PCLASS7                  N2PF.                                    
      @1010   PCLASS8                  N2PF.                                    
      @1012   PCLASS9                  N2PF.                                    
      @1014   PCLASS10                 N2PF.                                    
      @1016   PCLASS11                 N2PF.                                    
      @1018   PCLASS12                 N2PF.                                    
      @1020   PCLASS13                 N2PF.                                    
      @1022   PCLASS14                 N2PF.                                    
      @1024   PCLASS15                 N2PF.                                    
      @1026   PCLASS16                 N2PF.                                    
      @1028   PCLASS17                 N2PF.                                    
      @1030   PCLASS18                 N2PF.                                    
      @1032   PCLASS19                 N2PF.                                    
      @1034   PCLASS20                 N2PF.                                    
      @1036   PCLASS21                 N2PF.                                    
      @1038   PCLASS22                 N2PF.                                    
      @1040   PCLASS23                 N2PF.                                    
      @1042   PCLASS24                 N2PF.                                    
      @1044   PCLASS25                 N2PF.                                    
      @1046   PCLASS26                 N2PF.                                    
      @1048   PCLASS27                 N2PF.                                    
      @1050   PCLASS28                 N2PF.                                    
      @1052   PCLASS29                 N2PF.                                    
      @1054   PCLASS30                 N2PF.                                    
      @1056   PCLASS31                 N2PF.                                    
      @1058   PCLASS32                 N2PF.                                    
      @1060   PCLASS33                 N2PF.                                    
      @1062   PCLASS34                 N2PF.                                    
      @1064   PCLASS35                 N2PF.                                    
      @1066   PCLASS36                 N2PF.                                    
      @1068   PCLASS37                 N2PF.                                    
      @1070   PCLASS38                 N2PF.                                    
      @1072   PCLASS39                 N2PF.                                    
      @1074   PCLASS40                 N2PF.                                    
      @1076   PCLASS41                 N2PF.                                    
      @1078   PCLASS42                 N2PF.                                    
      @1080   PCLASS43                 N2PF.                                    
      @1082   PCLASS44                 N2PF.                                    
      @1084   PCLASS45                 N2PF.                                    
      @1086   PCLASS46                 N2PF.                                    
      @1088   PRMCCS1                  $CHAR8.                                  
      @1096   PRMCCS2                  $CHAR8.                                  
      @1104   PRMCCS3                  $CHAR8.                                  
      @1112   PRMCCS4                  $CHAR8.                                  
      @1120   PRMCCS5                  $CHAR8.                                  
      @1128   PRMCCS6                  $CHAR8.                                  
      @1136   PRMCCS7                  $CHAR8.                                  
      @1144   PRMCCS8                  $CHAR8.                                  
      @1152   PRMCCS9                  $CHAR8.                                  
      @1160   PRMCCS10                 $CHAR8.                                  
      @1168   PRMCCS11                 $CHAR8.                                  
      @1176   PRMCCS12                 $CHAR8.                                  
      @1184   PRMCCS13                 $CHAR8.                                  
      @1192   PRMCCS14                 $CHAR8.                                  
      @1200   PRMCCS15                 $CHAR8.                                  
      @1208   PRMCCS16                 $CHAR8.                                  
      @1216   PRMCCS17                 $CHAR8.                                  
      @1224   PRMCCS18                 $CHAR8.                                  
      @1232   PRMCCS19                 $CHAR8.                                  
      @1240   PRMCCS20                 $CHAR8.                                  
      @1248   PRMCCS21                 $CHAR8.                                  
      @1256   PRMCCS22                 $CHAR8.                                  
      @1264   PRMCCS23                 $CHAR8.                                  
      @1272   PRMCCS24                 $CHAR8.                                  
      @1280   PRMCCS25                 $CHAR8.                                  
      @1288   PRMCCS26                 $CHAR8.                                  
      @1296   PRMCCS27                 $CHAR8.                                  
      @1304   PRMCCS28                 $CHAR8.                                  
      @1312   PRMCCS29                 $CHAR8.                                  
      @1320   PRMCCS30                 $CHAR8.                                  
      @1328   PRMCCS31                 $CHAR8.                                  
      @1336   PRMCCS32                 $CHAR8.                                  
      @1344   PRMCCS33                 $CHAR8.                                  
      @1352   PRMCCS34                 $CHAR8.                                  
      @1360   PRMCCS35                 $CHAR8.                                  
      @1368   PRMCCS36                 $CHAR8.                                  
      @1376   PRMCCS37                 $CHAR8.                                  
      @1384   PRMCCS38                 $CHAR8.                                  
      @1392   PRMCCS39                 $CHAR8.                                  
      @1400   PRMCCS40                 $CHAR8.                                  
      @1408   PRMCCS41                 $CHAR8.                                  
      @1416   PRMCCS42                 $CHAR8.                                  
      @1424   PRMCCS43                 $CHAR8.                                  
      @1432   PRMCCS44                 $CHAR8.                                  
      @1440   PRMCCS45                 $CHAR8.                                  
      @1448   PRMCCS46                 $CHAR8.                                  
      ;                                                                         
                                                                                
                                                                                
RUN;
