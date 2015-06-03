/*******************************************************************            
*   SD_SID_2007_DX_PR_GRPS.SAS:                                                 
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
DATA SD_SIDC_2007_DX_PR_GRPS;                                                   
INFILE 'SD_SID_2007_DX_PR_GRPS.ASC' LRECL = 1738;                               
                                                                                
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
                                                                                
  CHRON63                    LENGTH=3                                           
  LABEL="Chronic condition indicator 63"                                        
                                                                                
  CHRON64                    LENGTH=3                                           
  LABEL="Chronic condition indicator 64"                                        
                                                                                
  CHRON65                    LENGTH=3                                           
  LABEL="Chronic condition indicator 65"                                        
                                                                                
  CHRON66                    LENGTH=3                                           
  LABEL="Chronic condition indicator 66"                                        
                                                                                
  CHRON67                    LENGTH=3                                           
  LABEL="Chronic condition indicator 67"                                        
                                                                                
  CHRON68                    LENGTH=3                                           
  LABEL="Chronic condition indicator 68"                                        
                                                                                
  CHRON69                    LENGTH=3                                           
  LABEL="Chronic condition indicator 69"                                        
                                                                                
  CHRON70                    LENGTH=3                                           
  LABEL="Chronic condition indicator 70"                                        
                                                                                
  CHRON71                    LENGTH=3                                           
  LABEL="Chronic condition indicator 71"                                        
                                                                                
  CHRON72                    LENGTH=3                                           
  LABEL="Chronic condition indicator 72"                                        
                                                                                
  CHRON73                    LENGTH=3                                           
  LABEL="Chronic condition indicator 73"                                        
                                                                                
  CHRON74                    LENGTH=3                                           
  LABEL="Chronic condition indicator 74"                                        
                                                                                
  CHRON75                    LENGTH=3                                           
  LABEL="Chronic condition indicator 75"                                        
                                                                                
  CHRON76                    LENGTH=3                                           
  LABEL="Chronic condition indicator 76"                                        
                                                                                
  CHRON77                    LENGTH=3                                           
  LABEL="Chronic condition indicator 77"                                        
                                                                                
  CHRON78                    LENGTH=3                                           
  LABEL="Chronic condition indicator 78"                                        
                                                                                
  CHRON79                    LENGTH=3                                           
  LABEL="Chronic condition indicator 79"                                        
                                                                                
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
                                                                                
  CHRONB63                   LENGTH=3                                           
  LABEL="Chronic condition body system 63"                                      
                                                                                
  CHRONB64                   LENGTH=3                                           
  LABEL="Chronic condition body system 64"                                      
                                                                                
  CHRONB65                   LENGTH=3                                           
  LABEL="Chronic condition body system 65"                                      
                                                                                
  CHRONB66                   LENGTH=3                                           
  LABEL="Chronic condition body system 66"                                      
                                                                                
  CHRONB67                   LENGTH=3                                           
  LABEL="Chronic condition body system 67"                                      
                                                                                
  CHRONB68                   LENGTH=3                                           
  LABEL="Chronic condition body system 68"                                      
                                                                                
  CHRONB69                   LENGTH=3                                           
  LABEL="Chronic condition body system 69"                                      
                                                                                
  CHRONB70                   LENGTH=3                                           
  LABEL="Chronic condition body system 70"                                      
                                                                                
  CHRONB71                   LENGTH=3                                           
  LABEL="Chronic condition body system 71"                                      
                                                                                
  CHRONB72                   LENGTH=3                                           
  LABEL="Chronic condition body system 72"                                      
                                                                                
  CHRONB73                   LENGTH=3                                           
  LABEL="Chronic condition body system 73"                                      
                                                                                
  CHRONB74                   LENGTH=3                                           
  LABEL="Chronic condition body system 74"                                      
                                                                                
  CHRONB75                   LENGTH=3                                           
  LABEL="Chronic condition body system 75"                                      
                                                                                
  CHRONB76                   LENGTH=3                                           
  LABEL="Chronic condition body system 76"                                      
                                                                                
  CHRONB77                   LENGTH=3                                           
  LABEL="Chronic condition body system 77"                                      
                                                                                
  CHRONB78                   LENGTH=3                                           
  LABEL="Chronic condition body system 78"                                      
                                                                                
  CHRONB79                   LENGTH=3                                           
  LABEL="Chronic condition body system 79"                                      
                                                                                
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
                                                                                
  DXMCCS63                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 63"                                        
                                                                                
  DXMCCS64                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 64"                                        
                                                                                
  DXMCCS65                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 65"                                        
                                                                                
  DXMCCS66                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 66"                                        
                                                                                
  DXMCCS67                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 67"                                        
                                                                                
  DXMCCS68                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 68"                                        
                                                                                
  DXMCCS69                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 69"                                        
                                                                                
  DXMCCS70                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 70"                                        
                                                                                
  DXMCCS71                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 71"                                        
                                                                                
  DXMCCS72                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 72"                                        
                                                                                
  DXMCCS73                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 73"                                        
                                                                                
  DXMCCS74                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 74"                                        
                                                                                
  DXMCCS75                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 75"                                        
                                                                                
  DXMCCS76                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 76"                                        
                                                                                
  DXMCCS77                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 77"                                        
                                                                                
  DXMCCS78                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 78"                                        
                                                                                
  DXMCCS79                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 79"                                        
                                                                                
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
      @125    CHRON63                  N2PF.                                    
      @127    CHRON64                  N2PF.                                    
      @129    CHRON65                  N2PF.                                    
      @131    CHRON66                  N2PF.                                    
      @133    CHRON67                  N2PF.                                    
      @135    CHRON68                  N2PF.                                    
      @137    CHRON69                  N2PF.                                    
      @139    CHRON70                  N2PF.                                    
      @141    CHRON71                  N2PF.                                    
      @143    CHRON72                  N2PF.                                    
      @145    CHRON73                  N2PF.                                    
      @147    CHRON74                  N2PF.                                    
      @149    CHRON75                  N2PF.                                    
      @151    CHRON76                  N2PF.                                    
      @153    CHRON77                  N2PF.                                    
      @155    CHRON78                  N2PF.                                    
      @157    CHRON79                  N2PF.                                    
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
      @191    CHRONB17                 N2PF.                                    
      @193    CHRONB18                 N2PF.                                    
      @195    CHRONB19                 N2PF.                                    
      @197    CHRONB20                 N2PF.                                    
      @199    CHRONB21                 N2PF.                                    
      @201    CHRONB22                 N2PF.                                    
      @203    CHRONB23                 N2PF.                                    
      @205    CHRONB24                 N2PF.                                    
      @207    CHRONB25                 N2PF.                                    
      @209    CHRONB26                 N2PF.                                    
      @211    CHRONB27                 N2PF.                                    
      @213    CHRONB28                 N2PF.                                    
      @215    CHRONB29                 N2PF.                                    
      @217    CHRONB30                 N2PF.                                    
      @219    CHRONB31                 N2PF.                                    
      @221    CHRONB32                 N2PF.                                    
      @223    CHRONB33                 N2PF.                                    
      @225    CHRONB34                 N2PF.                                    
      @227    CHRONB35                 N2PF.                                    
      @229    CHRONB36                 N2PF.                                    
      @231    CHRONB37                 N2PF.                                    
      @233    CHRONB38                 N2PF.                                    
      @235    CHRONB39                 N2PF.                                    
      @237    CHRONB40                 N2PF.                                    
      @239    CHRONB41                 N2PF.                                    
      @241    CHRONB42                 N2PF.                                    
      @243    CHRONB43                 N2PF.                                    
      @245    CHRONB44                 N2PF.                                    
      @247    CHRONB45                 N2PF.                                    
      @249    CHRONB46                 N2PF.                                    
      @251    CHRONB47                 N2PF.                                    
      @253    CHRONB48                 N2PF.                                    
      @255    CHRONB49                 N2PF.                                    
      @257    CHRONB50                 N2PF.                                    
      @259    CHRONB51                 N2PF.                                    
      @261    CHRONB52                 N2PF.                                    
      @263    CHRONB53                 N2PF.                                    
      @265    CHRONB54                 N2PF.                                    
      @267    CHRONB55                 N2PF.                                    
      @269    CHRONB56                 N2PF.                                    
      @271    CHRONB57                 N2PF.                                    
      @273    CHRONB58                 N2PF.                                    
      @275    CHRONB59                 N2PF.                                    
      @277    CHRONB60                 N2PF.                                    
      @279    CHRONB61                 N2PF.                                    
      @281    CHRONB62                 N2PF.                                    
      @283    CHRONB63                 N2PF.                                    
      @285    CHRONB64                 N2PF.                                    
      @287    CHRONB65                 N2PF.                                    
      @289    CHRONB66                 N2PF.                                    
      @291    CHRONB67                 N2PF.                                    
      @293    CHRONB68                 N2PF.                                    
      @295    CHRONB69                 N2PF.                                    
      @297    CHRONB70                 N2PF.                                    
      @299    CHRONB71                 N2PF.                                    
      @301    CHRONB72                 N2PF.                                    
      @303    CHRONB73                 N2PF.                                    
      @305    CHRONB74                 N2PF.                                    
      @307    CHRONB75                 N2PF.                                    
      @309    CHRONB76                 N2PF.                                    
      @311    CHRONB77                 N2PF.                                    
      @313    CHRONB78                 N2PF.                                    
      @315    CHRONB79                 N2PF.                                    
      @317    DXMCCS1                  $CHAR11.                                 
      @328    DXMCCS2                  $CHAR11.                                 
      @339    DXMCCS3                  $CHAR11.                                 
      @350    DXMCCS4                  $CHAR11.                                 
      @361    DXMCCS5                  $CHAR11.                                 
      @372    DXMCCS6                  $CHAR11.                                 
      @383    DXMCCS7                  $CHAR11.                                 
      @394    DXMCCS8                  $CHAR11.                                 
      @405    DXMCCS9                  $CHAR11.                                 
      @416    DXMCCS10                 $CHAR11.                                 
      @427    DXMCCS11                 $CHAR11.                                 
      @438    DXMCCS12                 $CHAR11.                                 
      @449    DXMCCS13                 $CHAR11.                                 
      @460    DXMCCS14                 $CHAR11.                                 
      @471    DXMCCS15                 $CHAR11.                                 
      @482    DXMCCS16                 $CHAR11.                                 
      @493    DXMCCS17                 $CHAR11.                                 
      @504    DXMCCS18                 $CHAR11.                                 
      @515    DXMCCS19                 $CHAR11.                                 
      @526    DXMCCS20                 $CHAR11.                                 
      @537    DXMCCS21                 $CHAR11.                                 
      @548    DXMCCS22                 $CHAR11.                                 
      @559    DXMCCS23                 $CHAR11.                                 
      @570    DXMCCS24                 $CHAR11.                                 
      @581    DXMCCS25                 $CHAR11.                                 
      @592    DXMCCS26                 $CHAR11.                                 
      @603    DXMCCS27                 $CHAR11.                                 
      @614    DXMCCS28                 $CHAR11.                                 
      @625    DXMCCS29                 $CHAR11.                                 
      @636    DXMCCS30                 $CHAR11.                                 
      @647    DXMCCS31                 $CHAR11.                                 
      @658    DXMCCS32                 $CHAR11.                                 
      @669    DXMCCS33                 $CHAR11.                                 
      @680    DXMCCS34                 $CHAR11.                                 
      @691    DXMCCS35                 $CHAR11.                                 
      @702    DXMCCS36                 $CHAR11.                                 
      @713    DXMCCS37                 $CHAR11.                                 
      @724    DXMCCS38                 $CHAR11.                                 
      @735    DXMCCS39                 $CHAR11.                                 
      @746    DXMCCS40                 $CHAR11.                                 
      @757    DXMCCS41                 $CHAR11.                                 
      @768    DXMCCS42                 $CHAR11.                                 
      @779    DXMCCS43                 $CHAR11.                                 
      @790    DXMCCS44                 $CHAR11.                                 
      @801    DXMCCS45                 $CHAR11.                                 
      @812    DXMCCS46                 $CHAR11.                                 
      @823    DXMCCS47                 $CHAR11.                                 
      @834    DXMCCS48                 $CHAR11.                                 
      @845    DXMCCS49                 $CHAR11.                                 
      @856    DXMCCS50                 $CHAR11.                                 
      @867    DXMCCS51                 $CHAR11.                                 
      @878    DXMCCS52                 $CHAR11.                                 
      @889    DXMCCS53                 $CHAR11.                                 
      @900    DXMCCS54                 $CHAR11.                                 
      @911    DXMCCS55                 $CHAR11.                                 
      @922    DXMCCS56                 $CHAR11.                                 
      @933    DXMCCS57                 $CHAR11.                                 
      @944    DXMCCS58                 $CHAR11.                                 
      @955    DXMCCS59                 $CHAR11.                                 
      @966    DXMCCS60                 $CHAR11.                                 
      @977    DXMCCS61                 $CHAR11.                                 
      @988    DXMCCS62                 $CHAR11.                                 
      @999    DXMCCS63                 $CHAR11.                                 
      @1010   DXMCCS64                 $CHAR11.                                 
      @1021   DXMCCS65                 $CHAR11.                                 
      @1032   DXMCCS66                 $CHAR11.                                 
      @1043   DXMCCS67                 $CHAR11.                                 
      @1054   DXMCCS68                 $CHAR11.                                 
      @1065   DXMCCS69                 $CHAR11.                                 
      @1076   DXMCCS70                 $CHAR11.                                 
      @1087   DXMCCS71                 $CHAR11.                                 
      @1098   DXMCCS72                 $CHAR11.                                 
      @1109   DXMCCS73                 $CHAR11.                                 
      @1120   DXMCCS74                 $CHAR11.                                 
      @1131   DXMCCS75                 $CHAR11.                                 
      @1142   DXMCCS76                 $CHAR11.                                 
      @1153   DXMCCS77                 $CHAR11.                                 
      @1164   DXMCCS78                 $CHAR11.                                 
      @1175   DXMCCS79                 $CHAR11.                                 
      @1186   E_MCCS1                  $CHAR11.                                 
      @1197   E_MCCS2                  $CHAR11.                                 
      @1208   E_MCCS3                  $CHAR11.                                 
      @1219   E_MCCS4                  $CHAR11.                                 
      @1230   E_MCCS5                  $CHAR11.                                 
      @1241   E_MCCS6                  $CHAR11.                                 
      @1252   E_MCCS7                  $CHAR11.                                 
      @1263   E_MCCS8                  $CHAR11.                                 
      @1274   E_MCCS9                  $CHAR11.                                 
      @1285   KEY                      14.                                      
      @1299   PCLASS1                  N2PF.                                    
      @1301   PCLASS2                  N2PF.                                    
      @1303   PCLASS3                  N2PF.                                    
      @1305   PCLASS4                  N2PF.                                    
      @1307   PCLASS5                  N2PF.                                    
      @1309   PCLASS6                  N2PF.                                    
      @1311   PCLASS7                  N2PF.                                    
      @1313   PCLASS8                  N2PF.                                    
      @1315   PCLASS9                  N2PF.                                    
      @1317   PCLASS10                 N2PF.                                    
      @1319   PCLASS11                 N2PF.                                    
      @1321   PCLASS12                 N2PF.                                    
      @1323   PCLASS13                 N2PF.                                    
      @1325   PCLASS14                 N2PF.                                    
      @1327   PCLASS15                 N2PF.                                    
      @1329   PCLASS16                 N2PF.                                    
      @1331   PCLASS17                 N2PF.                                    
      @1333   PCLASS18                 N2PF.                                    
      @1335   PCLASS19                 N2PF.                                    
      @1337   PCLASS20                 N2PF.                                    
      @1339   PCLASS21                 N2PF.                                    
      @1341   PCLASS22                 N2PF.                                    
      @1343   PCLASS23                 N2PF.                                    
      @1345   PCLASS24                 N2PF.                                    
      @1347   PCLASS25                 N2PF.                                    
      @1349   PCLASS26                 N2PF.                                    
      @1351   PCLASS27                 N2PF.                                    
      @1353   PCLASS28                 N2PF.                                    
      @1355   PCLASS29                 N2PF.                                    
      @1357   PCLASS30                 N2PF.                                    
      @1359   PCLASS31                 N2PF.                                    
      @1361   PCLASS32                 N2PF.                                    
      @1363   PCLASS33                 N2PF.                                    
      @1365   PCLASS34                 N2PF.                                    
      @1367   PCLASS35                 N2PF.                                    
      @1369   PCLASS36                 N2PF.                                    
      @1371   PCLASS37                 N2PF.                                    
      @1373   PCLASS38                 N2PF.                                    
      @1375   PCLASS39                 N2PF.                                    
      @1377   PCLASS40                 N2PF.                                    
      @1379   PCLASS41                 N2PF.                                    
      @1381   PCLASS42                 N2PF.                                    
      @1383   PCLASS43                 N2PF.                                    
      @1385   PCLASS44                 N2PF.                                    
      @1387   PRMCCS1                  $CHAR8.                                  
      @1395   PRMCCS2                  $CHAR8.                                  
      @1403   PRMCCS3                  $CHAR8.                                  
      @1411   PRMCCS4                  $CHAR8.                                  
      @1419   PRMCCS5                  $CHAR8.                                  
      @1427   PRMCCS6                  $CHAR8.                                  
      @1435   PRMCCS7                  $CHAR8.                                  
      @1443   PRMCCS8                  $CHAR8.                                  
      @1451   PRMCCS9                  $CHAR8.                                  
      @1459   PRMCCS10                 $CHAR8.                                  
      @1467   PRMCCS11                 $CHAR8.                                  
      @1475   PRMCCS12                 $CHAR8.                                  
      @1483   PRMCCS13                 $CHAR8.                                  
      @1491   PRMCCS14                 $CHAR8.                                  
      @1499   PRMCCS15                 $CHAR8.                                  
      @1507   PRMCCS16                 $CHAR8.                                  
      @1515   PRMCCS17                 $CHAR8.                                  
      @1523   PRMCCS18                 $CHAR8.                                  
      @1531   PRMCCS19                 $CHAR8.                                  
      @1539   PRMCCS20                 $CHAR8.                                  
      @1547   PRMCCS21                 $CHAR8.                                  
      @1555   PRMCCS22                 $CHAR8.                                  
      @1563   PRMCCS23                 $CHAR8.                                  
      @1571   PRMCCS24                 $CHAR8.                                  
      @1579   PRMCCS25                 $CHAR8.                                  
      @1587   PRMCCS26                 $CHAR8.                                  
      @1595   PRMCCS27                 $CHAR8.                                  
      @1603   PRMCCS28                 $CHAR8.                                  
      @1611   PRMCCS29                 $CHAR8.                                  
      @1619   PRMCCS30                 $CHAR8.                                  
      @1627   PRMCCS31                 $CHAR8.                                  
      @1635   PRMCCS32                 $CHAR8.                                  
      @1643   PRMCCS33                 $CHAR8.                                  
      @1651   PRMCCS34                 $CHAR8.                                  
      @1659   PRMCCS35                 $CHAR8.                                  
      @1667   PRMCCS36                 $CHAR8.                                  
      @1675   PRMCCS37                 $CHAR8.                                  
      @1683   PRMCCS38                 $CHAR8.                                  
      @1691   PRMCCS39                 $CHAR8.                                  
      @1699   PRMCCS40                 $CHAR8.                                  
      @1707   PRMCCS41                 $CHAR8.                                  
      @1715   PRMCCS42                 $CHAR8.                                  
      @1723   PRMCCS43                 $CHAR8.                                  
      @1731   PRMCCS44                 $CHAR8.                                  
      ;                                                                         
                                                                                
                                                                                
RUN;
