/*******************************************************************            
*   SD_SID_2010_DX_PR_GRPS.SAS:                                                 
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
DATA SD_SIDC_2010_DX_PR_GRPS;                                                   
INFILE 'SD_SID_2010_DX_PR_GRPS.ASC' LRECL = 1821;                               
                                                                                
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
                                                                                
  CHRON80                    LENGTH=3                                           
  LABEL="Chronic condition indicator 80"                                        
                                                                                
  CHRON81                    LENGTH=3                                           
  LABEL="Chronic condition indicator 81"                                        
                                                                                
  CHRON82                    LENGTH=3                                           
  LABEL="Chronic condition indicator 82"                                        
                                                                                
  CHRON83                    LENGTH=3                                           
  LABEL="Chronic condition indicator 83"                                        
                                                                                
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
                                                                                
  CHRONB80                   LENGTH=3                                           
  LABEL="Chronic condition body system 80"                                      
                                                                                
  CHRONB81                   LENGTH=3                                           
  LABEL="Chronic condition body system 81"                                      
                                                                                
  CHRONB82                   LENGTH=3                                           
  LABEL="Chronic condition body system 82"                                      
                                                                                
  CHRONB83                   LENGTH=3                                           
  LABEL="Chronic condition body system 83"                                      
                                                                                
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
                                                                                
  DXMCCS80                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 80"                                        
                                                                                
  DXMCCS81                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 81"                                        
                                                                                
  DXMCCS82                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 82"                                        
                                                                                
  DXMCCS83                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 83"                                        
                                                                                
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
      @159    CHRON80                  N2PF.                                    
      @161    CHRON81                  N2PF.                                    
      @163    CHRON82                  N2PF.                                    
      @165    CHRON83                  N2PF.                                    
      @167    CHRONB1                  N2PF.                                    
      @169    CHRONB2                  N2PF.                                    
      @171    CHRONB3                  N2PF.                                    
      @173    CHRONB4                  N2PF.                                    
      @175    CHRONB5                  N2PF.                                    
      @177    CHRONB6                  N2PF.                                    
      @179    CHRONB7                  N2PF.                                    
      @181    CHRONB8                  N2PF.                                    
      @183    CHRONB9                  N2PF.                                    
      @185    CHRONB10                 N2PF.                                    
      @187    CHRONB11                 N2PF.                                    
      @189    CHRONB12                 N2PF.                                    
      @191    CHRONB13                 N2PF.                                    
      @193    CHRONB14                 N2PF.                                    
      @195    CHRONB15                 N2PF.                                    
      @197    CHRONB16                 N2PF.                                    
      @199    CHRONB17                 N2PF.                                    
      @201    CHRONB18                 N2PF.                                    
      @203    CHRONB19                 N2PF.                                    
      @205    CHRONB20                 N2PF.                                    
      @207    CHRONB21                 N2PF.                                    
      @209    CHRONB22                 N2PF.                                    
      @211    CHRONB23                 N2PF.                                    
      @213    CHRONB24                 N2PF.                                    
      @215    CHRONB25                 N2PF.                                    
      @217    CHRONB26                 N2PF.                                    
      @219    CHRONB27                 N2PF.                                    
      @221    CHRONB28                 N2PF.                                    
      @223    CHRONB29                 N2PF.                                    
      @225    CHRONB30                 N2PF.                                    
      @227    CHRONB31                 N2PF.                                    
      @229    CHRONB32                 N2PF.                                    
      @231    CHRONB33                 N2PF.                                    
      @233    CHRONB34                 N2PF.                                    
      @235    CHRONB35                 N2PF.                                    
      @237    CHRONB36                 N2PF.                                    
      @239    CHRONB37                 N2PF.                                    
      @241    CHRONB38                 N2PF.                                    
      @243    CHRONB39                 N2PF.                                    
      @245    CHRONB40                 N2PF.                                    
      @247    CHRONB41                 N2PF.                                    
      @249    CHRONB42                 N2PF.                                    
      @251    CHRONB43                 N2PF.                                    
      @253    CHRONB44                 N2PF.                                    
      @255    CHRONB45                 N2PF.                                    
      @257    CHRONB46                 N2PF.                                    
      @259    CHRONB47                 N2PF.                                    
      @261    CHRONB48                 N2PF.                                    
      @263    CHRONB49                 N2PF.                                    
      @265    CHRONB50                 N2PF.                                    
      @267    CHRONB51                 N2PF.                                    
      @269    CHRONB52                 N2PF.                                    
      @271    CHRONB53                 N2PF.                                    
      @273    CHRONB54                 N2PF.                                    
      @275    CHRONB55                 N2PF.                                    
      @277    CHRONB56                 N2PF.                                    
      @279    CHRONB57                 N2PF.                                    
      @281    CHRONB58                 N2PF.                                    
      @283    CHRONB59                 N2PF.                                    
      @285    CHRONB60                 N2PF.                                    
      @287    CHRONB61                 N2PF.                                    
      @289    CHRONB62                 N2PF.                                    
      @291    CHRONB63                 N2PF.                                    
      @293    CHRONB64                 N2PF.                                    
      @295    CHRONB65                 N2PF.                                    
      @297    CHRONB66                 N2PF.                                    
      @299    CHRONB67                 N2PF.                                    
      @301    CHRONB68                 N2PF.                                    
      @303    CHRONB69                 N2PF.                                    
      @305    CHRONB70                 N2PF.                                    
      @307    CHRONB71                 N2PF.                                    
      @309    CHRONB72                 N2PF.                                    
      @311    CHRONB73                 N2PF.                                    
      @313    CHRONB74                 N2PF.                                    
      @315    CHRONB75                 N2PF.                                    
      @317    CHRONB76                 N2PF.                                    
      @319    CHRONB77                 N2PF.                                    
      @321    CHRONB78                 N2PF.                                    
      @323    CHRONB79                 N2PF.                                    
      @325    CHRONB80                 N2PF.                                    
      @327    CHRONB81                 N2PF.                                    
      @329    CHRONB82                 N2PF.                                    
      @331    CHRONB83                 N2PF.                                    
      @333    DXMCCS1                  $CHAR11.                                 
      @344    DXMCCS2                  $CHAR11.                                 
      @355    DXMCCS3                  $CHAR11.                                 
      @366    DXMCCS4                  $CHAR11.                                 
      @377    DXMCCS5                  $CHAR11.                                 
      @388    DXMCCS6                  $CHAR11.                                 
      @399    DXMCCS7                  $CHAR11.                                 
      @410    DXMCCS8                  $CHAR11.                                 
      @421    DXMCCS9                  $CHAR11.                                 
      @432    DXMCCS10                 $CHAR11.                                 
      @443    DXMCCS11                 $CHAR11.                                 
      @454    DXMCCS12                 $CHAR11.                                 
      @465    DXMCCS13                 $CHAR11.                                 
      @476    DXMCCS14                 $CHAR11.                                 
      @487    DXMCCS15                 $CHAR11.                                 
      @498    DXMCCS16                 $CHAR11.                                 
      @509    DXMCCS17                 $CHAR11.                                 
      @520    DXMCCS18                 $CHAR11.                                 
      @531    DXMCCS19                 $CHAR11.                                 
      @542    DXMCCS20                 $CHAR11.                                 
      @553    DXMCCS21                 $CHAR11.                                 
      @564    DXMCCS22                 $CHAR11.                                 
      @575    DXMCCS23                 $CHAR11.                                 
      @586    DXMCCS24                 $CHAR11.                                 
      @597    DXMCCS25                 $CHAR11.                                 
      @608    DXMCCS26                 $CHAR11.                                 
      @619    DXMCCS27                 $CHAR11.                                 
      @630    DXMCCS28                 $CHAR11.                                 
      @641    DXMCCS29                 $CHAR11.                                 
      @652    DXMCCS30                 $CHAR11.                                 
      @663    DXMCCS31                 $CHAR11.                                 
      @674    DXMCCS32                 $CHAR11.                                 
      @685    DXMCCS33                 $CHAR11.                                 
      @696    DXMCCS34                 $CHAR11.                                 
      @707    DXMCCS35                 $CHAR11.                                 
      @718    DXMCCS36                 $CHAR11.                                 
      @729    DXMCCS37                 $CHAR11.                                 
      @740    DXMCCS38                 $CHAR11.                                 
      @751    DXMCCS39                 $CHAR11.                                 
      @762    DXMCCS40                 $CHAR11.                                 
      @773    DXMCCS41                 $CHAR11.                                 
      @784    DXMCCS42                 $CHAR11.                                 
      @795    DXMCCS43                 $CHAR11.                                 
      @806    DXMCCS44                 $CHAR11.                                 
      @817    DXMCCS45                 $CHAR11.                                 
      @828    DXMCCS46                 $CHAR11.                                 
      @839    DXMCCS47                 $CHAR11.                                 
      @850    DXMCCS48                 $CHAR11.                                 
      @861    DXMCCS49                 $CHAR11.                                 
      @872    DXMCCS50                 $CHAR11.                                 
      @883    DXMCCS51                 $CHAR11.                                 
      @894    DXMCCS52                 $CHAR11.                                 
      @905    DXMCCS53                 $CHAR11.                                 
      @916    DXMCCS54                 $CHAR11.                                 
      @927    DXMCCS55                 $CHAR11.                                 
      @938    DXMCCS56                 $CHAR11.                                 
      @949    DXMCCS57                 $CHAR11.                                 
      @960    DXMCCS58                 $CHAR11.                                 
      @971    DXMCCS59                 $CHAR11.                                 
      @982    DXMCCS60                 $CHAR11.                                 
      @993    DXMCCS61                 $CHAR11.                                 
      @1004   DXMCCS62                 $CHAR11.                                 
      @1015   DXMCCS63                 $CHAR11.                                 
      @1026   DXMCCS64                 $CHAR11.                                 
      @1037   DXMCCS65                 $CHAR11.                                 
      @1048   DXMCCS66                 $CHAR11.                                 
      @1059   DXMCCS67                 $CHAR11.                                 
      @1070   DXMCCS68                 $CHAR11.                                 
      @1081   DXMCCS69                 $CHAR11.                                 
      @1092   DXMCCS70                 $CHAR11.                                 
      @1103   DXMCCS71                 $CHAR11.                                 
      @1114   DXMCCS72                 $CHAR11.                                 
      @1125   DXMCCS73                 $CHAR11.                                 
      @1136   DXMCCS74                 $CHAR11.                                 
      @1147   DXMCCS75                 $CHAR11.                                 
      @1158   DXMCCS76                 $CHAR11.                                 
      @1169   DXMCCS77                 $CHAR11.                                 
      @1180   DXMCCS78                 $CHAR11.                                 
      @1191   DXMCCS79                 $CHAR11.                                 
      @1202   DXMCCS80                 $CHAR11.                                 
      @1213   DXMCCS81                 $CHAR11.                                 
      @1224   DXMCCS82                 $CHAR11.                                 
      @1235   DXMCCS83                 $CHAR11.                                 
      @1246   E_MCCS1                  $CHAR11.                                 
      @1257   E_MCCS2                  $CHAR11.                                 
      @1268   E_MCCS3                  $CHAR11.                                 
      @1279   E_MCCS4                  $CHAR11.                                 
      @1290   E_MCCS5                  $CHAR11.                                 
      @1301   E_MCCS6                  $CHAR11.                                 
      @1312   E_MCCS7                  $CHAR11.                                 
      @1323   E_MCCS8                  $CHAR11.                                 
      @1334   KEY                      18.                                      
      @1352   PCLASS1                  N2PF.                                    
      @1354   PCLASS2                  N2PF.                                    
      @1356   PCLASS3                  N2PF.                                    
      @1358   PCLASS4                  N2PF.                                    
      @1360   PCLASS5                  N2PF.                                    
      @1362   PCLASS6                  N2PF.                                    
      @1364   PCLASS7                  N2PF.                                    
      @1366   PCLASS8                  N2PF.                                    
      @1368   PCLASS9                  N2PF.                                    
      @1370   PCLASS10                 N2PF.                                    
      @1372   PCLASS11                 N2PF.                                    
      @1374   PCLASS12                 N2PF.                                    
      @1376   PCLASS13                 N2PF.                                    
      @1378   PCLASS14                 N2PF.                                    
      @1380   PCLASS15                 N2PF.                                    
      @1382   PCLASS16                 N2PF.                                    
      @1384   PCLASS17                 N2PF.                                    
      @1386   PCLASS18                 N2PF.                                    
      @1388   PCLASS19                 N2PF.                                    
      @1390   PCLASS20                 N2PF.                                    
      @1392   PCLASS21                 N2PF.                                    
      @1394   PCLASS22                 N2PF.                                    
      @1396   PCLASS23                 N2PF.                                    
      @1398   PCLASS24                 N2PF.                                    
      @1400   PCLASS25                 N2PF.                                    
      @1402   PCLASS26                 N2PF.                                    
      @1404   PCLASS27                 N2PF.                                    
      @1406   PCLASS28                 N2PF.                                    
      @1408   PCLASS29                 N2PF.                                    
      @1410   PCLASS30                 N2PF.                                    
      @1412   PCLASS31                 N2PF.                                    
      @1414   PCLASS32                 N2PF.                                    
      @1416   PCLASS33                 N2PF.                                    
      @1418   PCLASS34                 N2PF.                                    
      @1420   PCLASS35                 N2PF.                                    
      @1422   PCLASS36                 N2PF.                                    
      @1424   PCLASS37                 N2PF.                                    
      @1426   PCLASS38                 N2PF.                                    
      @1428   PCLASS39                 N2PF.                                    
      @1430   PCLASS40                 N2PF.                                    
      @1432   PCLASS41                 N2PF.                                    
      @1434   PCLASS42                 N2PF.                                    
      @1436   PCLASS43                 N2PF.                                    
      @1438   PCLASS44                 N2PF.                                    
      @1440   PCLASS45                 N2PF.                                    
      @1442   PCLASS46                 N2PF.                                    
      @1444   PCLASS47                 N2PF.                                    
      @1446   PRMCCS1                  $CHAR8.                                  
      @1454   PRMCCS2                  $CHAR8.                                  
      @1462   PRMCCS3                  $CHAR8.                                  
      @1470   PRMCCS4                  $CHAR8.                                  
      @1478   PRMCCS5                  $CHAR8.                                  
      @1486   PRMCCS6                  $CHAR8.                                  
      @1494   PRMCCS7                  $CHAR8.                                  
      @1502   PRMCCS8                  $CHAR8.                                  
      @1510   PRMCCS9                  $CHAR8.                                  
      @1518   PRMCCS10                 $CHAR8.                                  
      @1526   PRMCCS11                 $CHAR8.                                  
      @1534   PRMCCS12                 $CHAR8.                                  
      @1542   PRMCCS13                 $CHAR8.                                  
      @1550   PRMCCS14                 $CHAR8.                                  
      @1558   PRMCCS15                 $CHAR8.                                  
      @1566   PRMCCS16                 $CHAR8.                                  
      @1574   PRMCCS17                 $CHAR8.                                  
      @1582   PRMCCS18                 $CHAR8.                                  
      @1590   PRMCCS19                 $CHAR8.                                  
      @1598   PRMCCS20                 $CHAR8.                                  
      @1606   PRMCCS21                 $CHAR8.                                  
      @1614   PRMCCS22                 $CHAR8.                                  
      @1622   PRMCCS23                 $CHAR8.                                  
      @1630   PRMCCS24                 $CHAR8.                                  
      @1638   PRMCCS25                 $CHAR8.                                  
      @1646   PRMCCS26                 $CHAR8.                                  
      @1654   PRMCCS27                 $CHAR8.                                  
      @1662   PRMCCS28                 $CHAR8.                                  
      @1670   PRMCCS29                 $CHAR8.                                  
      @1678   PRMCCS30                 $CHAR8.                                  
      @1686   PRMCCS31                 $CHAR8.                                  
      @1694   PRMCCS32                 $CHAR8.                                  
      @1702   PRMCCS33                 $CHAR8.                                  
      @1710   PRMCCS34                 $CHAR8.                                  
      @1718   PRMCCS35                 $CHAR8.                                  
      @1726   PRMCCS36                 $CHAR8.                                  
      @1734   PRMCCS37                 $CHAR8.                                  
      @1742   PRMCCS38                 $CHAR8.                                  
      @1750   PRMCCS39                 $CHAR8.                                  
      @1758   PRMCCS40                 $CHAR8.                                  
      @1766   PRMCCS41                 $CHAR8.                                  
      @1774   PRMCCS42                 $CHAR8.                                  
      @1782   PRMCCS43                 $CHAR8.                                  
      @1790   PRMCCS44                 $CHAR8.                                  
      @1798   PRMCCS45                 $CHAR8.                                  
      @1806   PRMCCS46                 $CHAR8.                                  
      @1814   PRMCCS47                 $CHAR8.                                  
      ;                                                                         
                                                                                
                                                                                
RUN;
