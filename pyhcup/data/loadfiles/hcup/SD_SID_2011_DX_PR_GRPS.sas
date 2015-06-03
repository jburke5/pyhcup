/*******************************************************************            
*   SD_SID_2011_DX_PR_GRPS.SAS:                                                 
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
DATA SD_SIDC_2011_DX_PR_GRPS;                                                   
INFILE 'SD_SID_2011_DX_PR_GRPS.ASC' LRECL = 2077;                               
                                                                                
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
                                                                                
  CHRON84                    LENGTH=3                                           
  LABEL="Chronic condition indicator 84"                                        
                                                                                
  CHRON85                    LENGTH=3                                           
  LABEL="Chronic condition indicator 85"                                        
                                                                                
  CHRON86                    LENGTH=3                                           
  LABEL="Chronic condition indicator 86"                                        
                                                                                
  CHRON87                    LENGTH=3                                           
  LABEL="Chronic condition indicator 87"                                        
                                                                                
  CHRON88                    LENGTH=3                                           
  LABEL="Chronic condition indicator 88"                                        
                                                                                
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
                                                                                
  CHRONB84                   LENGTH=3                                           
  LABEL="Chronic condition body system 84"                                      
                                                                                
  CHRONB85                   LENGTH=3                                           
  LABEL="Chronic condition body system 85"                                      
                                                                                
  CHRONB86                   LENGTH=3                                           
  LABEL="Chronic condition body system 86"                                      
                                                                                
  CHRONB87                   LENGTH=3                                           
  LABEL="Chronic condition body system 87"                                      
                                                                                
  CHRONB88                   LENGTH=3                                           
  LABEL="Chronic condition body system 88"                                      
                                                                                
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
                                                                                
  DXMCCS84                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 84"                                        
                                                                                
  DXMCCS85                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 85"                                        
                                                                                
  DXMCCS86                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 86"                                        
                                                                                
  DXMCCS87                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 87"                                        
                                                                                
  DXMCCS88                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 88"                                        
                                                                                
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
                                                                                
  PCLASS51                   LENGTH=3                                           
  LABEL="Procedure class 51"                                                    
                                                                                
  PCLASS52                   LENGTH=3                                           
  LABEL="Procedure class 52"                                                    
                                                                                
  PCLASS53                   LENGTH=3                                           
  LABEL="Procedure class 53"                                                    
                                                                                
  PCLASS54                   LENGTH=3                                           
  LABEL="Procedure class 54"                                                    
                                                                                
  PCLASS55                   LENGTH=3                                           
  LABEL="Procedure class 55"                                                    
                                                                                
  PCLASS56                   LENGTH=3                                           
  LABEL="Procedure class 56"                                                    
                                                                                
  PCLASS57                   LENGTH=3                                           
  LABEL="Procedure class 57"                                                    
                                                                                
  PCLASS58                   LENGTH=3                                           
  LABEL="Procedure class 58"                                                    
                                                                                
  PCLASS59                   LENGTH=3                                           
  LABEL="Procedure class 59"                                                    
                                                                                
  PCLASS60                   LENGTH=3                                           
  LABEL="Procedure class 60"                                                    
                                                                                
  PCLASS61                   LENGTH=3                                           
  LABEL="Procedure class 61"                                                    
                                                                                
  PCLASS62                   LENGTH=3                                           
  LABEL="Procedure class 62"                                                    
                                                                                
  PCLASS63                   LENGTH=3                                           
  LABEL="Procedure class 63"                                                    
                                                                                
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
                                                                                
  PRMCCS51                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 51"                                        
                                                                                
  PRMCCS52                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 52"                                        
                                                                                
  PRMCCS53                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 53"                                        
                                                                                
  PRMCCS54                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 54"                                        
                                                                                
  PRMCCS55                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 55"                                        
                                                                                
  PRMCCS56                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 56"                                        
                                                                                
  PRMCCS57                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 57"                                        
                                                                                
  PRMCCS58                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 58"                                        
                                                                                
  PRMCCS59                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 59"                                        
                                                                                
  PRMCCS60                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 60"                                        
                                                                                
  PRMCCS61                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 61"                                        
                                                                                
  PRMCCS62                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 62"                                        
                                                                                
  PRMCCS63                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 63"                                        
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
      @167    CHRON84                  N2PF.                                    
      @169    CHRON85                  N2PF.                                    
      @171    CHRON86                  N2PF.                                    
      @173    CHRON87                  N2PF.                                    
      @175    CHRON88                  N2PF.                                    
      @177    CHRONB1                  N2PF.                                    
      @179    CHRONB2                  N2PF.                                    
      @181    CHRONB3                  N2PF.                                    
      @183    CHRONB4                  N2PF.                                    
      @185    CHRONB5                  N2PF.                                    
      @187    CHRONB6                  N2PF.                                    
      @189    CHRONB7                  N2PF.                                    
      @191    CHRONB8                  N2PF.                                    
      @193    CHRONB9                  N2PF.                                    
      @195    CHRONB10                 N2PF.                                    
      @197    CHRONB11                 N2PF.                                    
      @199    CHRONB12                 N2PF.                                    
      @201    CHRONB13                 N2PF.                                    
      @203    CHRONB14                 N2PF.                                    
      @205    CHRONB15                 N2PF.                                    
      @207    CHRONB16                 N2PF.                                    
      @209    CHRONB17                 N2PF.                                    
      @211    CHRONB18                 N2PF.                                    
      @213    CHRONB19                 N2PF.                                    
      @215    CHRONB20                 N2PF.                                    
      @217    CHRONB21                 N2PF.                                    
      @219    CHRONB22                 N2PF.                                    
      @221    CHRONB23                 N2PF.                                    
      @223    CHRONB24                 N2PF.                                    
      @225    CHRONB25                 N2PF.                                    
      @227    CHRONB26                 N2PF.                                    
      @229    CHRONB27                 N2PF.                                    
      @231    CHRONB28                 N2PF.                                    
      @233    CHRONB29                 N2PF.                                    
      @235    CHRONB30                 N2PF.                                    
      @237    CHRONB31                 N2PF.                                    
      @239    CHRONB32                 N2PF.                                    
      @241    CHRONB33                 N2PF.                                    
      @243    CHRONB34                 N2PF.                                    
      @245    CHRONB35                 N2PF.                                    
      @247    CHRONB36                 N2PF.                                    
      @249    CHRONB37                 N2PF.                                    
      @251    CHRONB38                 N2PF.                                    
      @253    CHRONB39                 N2PF.                                    
      @255    CHRONB40                 N2PF.                                    
      @257    CHRONB41                 N2PF.                                    
      @259    CHRONB42                 N2PF.                                    
      @261    CHRONB43                 N2PF.                                    
      @263    CHRONB44                 N2PF.                                    
      @265    CHRONB45                 N2PF.                                    
      @267    CHRONB46                 N2PF.                                    
      @269    CHRONB47                 N2PF.                                    
      @271    CHRONB48                 N2PF.                                    
      @273    CHRONB49                 N2PF.                                    
      @275    CHRONB50                 N2PF.                                    
      @277    CHRONB51                 N2PF.                                    
      @279    CHRONB52                 N2PF.                                    
      @281    CHRONB53                 N2PF.                                    
      @283    CHRONB54                 N2PF.                                    
      @285    CHRONB55                 N2PF.                                    
      @287    CHRONB56                 N2PF.                                    
      @289    CHRONB57                 N2PF.                                    
      @291    CHRONB58                 N2PF.                                    
      @293    CHRONB59                 N2PF.                                    
      @295    CHRONB60                 N2PF.                                    
      @297    CHRONB61                 N2PF.                                    
      @299    CHRONB62                 N2PF.                                    
      @301    CHRONB63                 N2PF.                                    
      @303    CHRONB64                 N2PF.                                    
      @305    CHRONB65                 N2PF.                                    
      @307    CHRONB66                 N2PF.                                    
      @309    CHRONB67                 N2PF.                                    
      @311    CHRONB68                 N2PF.                                    
      @313    CHRONB69                 N2PF.                                    
      @315    CHRONB70                 N2PF.                                    
      @317    CHRONB71                 N2PF.                                    
      @319    CHRONB72                 N2PF.                                    
      @321    CHRONB73                 N2PF.                                    
      @323    CHRONB74                 N2PF.                                    
      @325    CHRONB75                 N2PF.                                    
      @327    CHRONB76                 N2PF.                                    
      @329    CHRONB77                 N2PF.                                    
      @331    CHRONB78                 N2PF.                                    
      @333    CHRONB79                 N2PF.                                    
      @335    CHRONB80                 N2PF.                                    
      @337    CHRONB81                 N2PF.                                    
      @339    CHRONB82                 N2PF.                                    
      @341    CHRONB83                 N2PF.                                    
      @343    CHRONB84                 N2PF.                                    
      @345    CHRONB85                 N2PF.                                    
      @347    CHRONB86                 N2PF.                                    
      @349    CHRONB87                 N2PF.                                    
      @351    CHRONB88                 N2PF.                                    
      @353    DXMCCS1                  $CHAR11.                                 
      @364    DXMCCS2                  $CHAR11.                                 
      @375    DXMCCS3                  $CHAR11.                                 
      @386    DXMCCS4                  $CHAR11.                                 
      @397    DXMCCS5                  $CHAR11.                                 
      @408    DXMCCS6                  $CHAR11.                                 
      @419    DXMCCS7                  $CHAR11.                                 
      @430    DXMCCS8                  $CHAR11.                                 
      @441    DXMCCS9                  $CHAR11.                                 
      @452    DXMCCS10                 $CHAR11.                                 
      @463    DXMCCS11                 $CHAR11.                                 
      @474    DXMCCS12                 $CHAR11.                                 
      @485    DXMCCS13                 $CHAR11.                                 
      @496    DXMCCS14                 $CHAR11.                                 
      @507    DXMCCS15                 $CHAR11.                                 
      @518    DXMCCS16                 $CHAR11.                                 
      @529    DXMCCS17                 $CHAR11.                                 
      @540    DXMCCS18                 $CHAR11.                                 
      @551    DXMCCS19                 $CHAR11.                                 
      @562    DXMCCS20                 $CHAR11.                                 
      @573    DXMCCS21                 $CHAR11.                                 
      @584    DXMCCS22                 $CHAR11.                                 
      @595    DXMCCS23                 $CHAR11.                                 
      @606    DXMCCS24                 $CHAR11.                                 
      @617    DXMCCS25                 $CHAR11.                                 
      @628    DXMCCS26                 $CHAR11.                                 
      @639    DXMCCS27                 $CHAR11.                                 
      @650    DXMCCS28                 $CHAR11.                                 
      @661    DXMCCS29                 $CHAR11.                                 
      @672    DXMCCS30                 $CHAR11.                                 
      @683    DXMCCS31                 $CHAR11.                                 
      @694    DXMCCS32                 $CHAR11.                                 
      @705    DXMCCS33                 $CHAR11.                                 
      @716    DXMCCS34                 $CHAR11.                                 
      @727    DXMCCS35                 $CHAR11.                                 
      @738    DXMCCS36                 $CHAR11.                                 
      @749    DXMCCS37                 $CHAR11.                                 
      @760    DXMCCS38                 $CHAR11.                                 
      @771    DXMCCS39                 $CHAR11.                                 
      @782    DXMCCS40                 $CHAR11.                                 
      @793    DXMCCS41                 $CHAR11.                                 
      @804    DXMCCS42                 $CHAR11.                                 
      @815    DXMCCS43                 $CHAR11.                                 
      @826    DXMCCS44                 $CHAR11.                                 
      @837    DXMCCS45                 $CHAR11.                                 
      @848    DXMCCS46                 $CHAR11.                                 
      @859    DXMCCS47                 $CHAR11.                                 
      @870    DXMCCS48                 $CHAR11.                                 
      @881    DXMCCS49                 $CHAR11.                                 
      @892    DXMCCS50                 $CHAR11.                                 
      @903    DXMCCS51                 $CHAR11.                                 
      @914    DXMCCS52                 $CHAR11.                                 
      @925    DXMCCS53                 $CHAR11.                                 
      @936    DXMCCS54                 $CHAR11.                                 
      @947    DXMCCS55                 $CHAR11.                                 
      @958    DXMCCS56                 $CHAR11.                                 
      @969    DXMCCS57                 $CHAR11.                                 
      @980    DXMCCS58                 $CHAR11.                                 
      @991    DXMCCS59                 $CHAR11.                                 
      @1002   DXMCCS60                 $CHAR11.                                 
      @1013   DXMCCS61                 $CHAR11.                                 
      @1024   DXMCCS62                 $CHAR11.                                 
      @1035   DXMCCS63                 $CHAR11.                                 
      @1046   DXMCCS64                 $CHAR11.                                 
      @1057   DXMCCS65                 $CHAR11.                                 
      @1068   DXMCCS66                 $CHAR11.                                 
      @1079   DXMCCS67                 $CHAR11.                                 
      @1090   DXMCCS68                 $CHAR11.                                 
      @1101   DXMCCS69                 $CHAR11.                                 
      @1112   DXMCCS70                 $CHAR11.                                 
      @1123   DXMCCS71                 $CHAR11.                                 
      @1134   DXMCCS72                 $CHAR11.                                 
      @1145   DXMCCS73                 $CHAR11.                                 
      @1156   DXMCCS74                 $CHAR11.                                 
      @1167   DXMCCS75                 $CHAR11.                                 
      @1178   DXMCCS76                 $CHAR11.                                 
      @1189   DXMCCS77                 $CHAR11.                                 
      @1200   DXMCCS78                 $CHAR11.                                 
      @1211   DXMCCS79                 $CHAR11.                                 
      @1222   DXMCCS80                 $CHAR11.                                 
      @1233   DXMCCS81                 $CHAR11.                                 
      @1244   DXMCCS82                 $CHAR11.                                 
      @1255   DXMCCS83                 $CHAR11.                                 
      @1266   DXMCCS84                 $CHAR11.                                 
      @1277   DXMCCS85                 $CHAR11.                                 
      @1288   DXMCCS86                 $CHAR11.                                 
      @1299   DXMCCS87                 $CHAR11.                                 
      @1310   DXMCCS88                 $CHAR11.                                 
      @1321   E_MCCS1                  $CHAR11.                                 
      @1332   E_MCCS2                  $CHAR11.                                 
      @1343   E_MCCS3                  $CHAR11.                                 
      @1354   E_MCCS4                  $CHAR11.                                 
      @1365   E_MCCS5                  $CHAR11.                                 
      @1376   E_MCCS6                  $CHAR11.                                 
      @1387   E_MCCS7                  $CHAR11.                                 
      @1398   INJURY                   N2PF.                                    
      @1400   INJURY_CUT               N2PF.                                    
      @1402   INJURY_DROWN             N2PF.                                    
      @1404   INJURY_FALL              N2PF.                                    
      @1406   INJURY_FIRE              N2PF.                                    
      @1408   INJURY_FIREARM           N2PF.                                    
      @1410   INJURY_MACHINERY         N2PF.                                    
      @1412   INJURY_MVT               N2PF.                                    
      @1414   INJURY_NATURE            N2PF.                                    
      @1416   INJURY_POISON            N2PF.                                    
      @1418   INJURY_STRUCK            N2PF.                                    
      @1420   INJURY_SUFFOCATION       N2PF.                                    
      @1422   INTENT_ASSAULT           N2PF.                                    
      @1424   INTENT_SELF_HARM         N2PF.                                    
      @1426   INTENT_UNINTENTIONAL     N2PF.                                    
      @1428   KEY                      18.                                      
      @1446   MULTINJURY               N2PF.                                    
      @1448   PCLASS1                  N2PF.                                    
      @1450   PCLASS2                  N2PF.                                    
      @1452   PCLASS3                  N2PF.                                    
      @1454   PCLASS4                  N2PF.                                    
      @1456   PCLASS5                  N2PF.                                    
      @1458   PCLASS6                  N2PF.                                    
      @1460   PCLASS7                  N2PF.                                    
      @1462   PCLASS8                  N2PF.                                    
      @1464   PCLASS9                  N2PF.                                    
      @1466   PCLASS10                 N2PF.                                    
      @1468   PCLASS11                 N2PF.                                    
      @1470   PCLASS12                 N2PF.                                    
      @1472   PCLASS13                 N2PF.                                    
      @1474   PCLASS14                 N2PF.                                    
      @1476   PCLASS15                 N2PF.                                    
      @1478   PCLASS16                 N2PF.                                    
      @1480   PCLASS17                 N2PF.                                    
      @1482   PCLASS18                 N2PF.                                    
      @1484   PCLASS19                 N2PF.                                    
      @1486   PCLASS20                 N2PF.                                    
      @1488   PCLASS21                 N2PF.                                    
      @1490   PCLASS22                 N2PF.                                    
      @1492   PCLASS23                 N2PF.                                    
      @1494   PCLASS24                 N2PF.                                    
      @1496   PCLASS25                 N2PF.                                    
      @1498   PCLASS26                 N2PF.                                    
      @1500   PCLASS27                 N2PF.                                    
      @1502   PCLASS28                 N2PF.                                    
      @1504   PCLASS29                 N2PF.                                    
      @1506   PCLASS30                 N2PF.                                    
      @1508   PCLASS31                 N2PF.                                    
      @1510   PCLASS32                 N2PF.                                    
      @1512   PCLASS33                 N2PF.                                    
      @1514   PCLASS34                 N2PF.                                    
      @1516   PCLASS35                 N2PF.                                    
      @1518   PCLASS36                 N2PF.                                    
      @1520   PCLASS37                 N2PF.                                    
      @1522   PCLASS38                 N2PF.                                    
      @1524   PCLASS39                 N2PF.                                    
      @1526   PCLASS40                 N2PF.                                    
      @1528   PCLASS41                 N2PF.                                    
      @1530   PCLASS42                 N2PF.                                    
      @1532   PCLASS43                 N2PF.                                    
      @1534   PCLASS44                 N2PF.                                    
      @1536   PCLASS45                 N2PF.                                    
      @1538   PCLASS46                 N2PF.                                    
      @1540   PCLASS47                 N2PF.                                    
      @1542   PCLASS48                 N2PF.                                    
      @1544   PCLASS49                 N2PF.                                    
      @1546   PCLASS50                 N2PF.                                    
      @1548   PCLASS51                 N2PF.                                    
      @1550   PCLASS52                 N2PF.                                    
      @1552   PCLASS53                 N2PF.                                    
      @1554   PCLASS54                 N2PF.                                    
      @1556   PCLASS55                 N2PF.                                    
      @1558   PCLASS56                 N2PF.                                    
      @1560   PCLASS57                 N2PF.                                    
      @1562   PCLASS58                 N2PF.                                    
      @1564   PCLASS59                 N2PF.                                    
      @1566   PCLASS60                 N2PF.                                    
      @1568   PCLASS61                 N2PF.                                    
      @1570   PCLASS62                 N2PF.                                    
      @1572   PCLASS63                 N2PF.                                    
      @1574   PRMCCS1                  $CHAR8.                                  
      @1582   PRMCCS2                  $CHAR8.                                  
      @1590   PRMCCS3                  $CHAR8.                                  
      @1598   PRMCCS4                  $CHAR8.                                  
      @1606   PRMCCS5                  $CHAR8.                                  
      @1614   PRMCCS6                  $CHAR8.                                  
      @1622   PRMCCS7                  $CHAR8.                                  
      @1630   PRMCCS8                  $CHAR8.                                  
      @1638   PRMCCS9                  $CHAR8.                                  
      @1646   PRMCCS10                 $CHAR8.                                  
      @1654   PRMCCS11                 $CHAR8.                                  
      @1662   PRMCCS12                 $CHAR8.                                  
      @1670   PRMCCS13                 $CHAR8.                                  
      @1678   PRMCCS14                 $CHAR8.                                  
      @1686   PRMCCS15                 $CHAR8.                                  
      @1694   PRMCCS16                 $CHAR8.                                  
      @1702   PRMCCS17                 $CHAR8.                                  
      @1710   PRMCCS18                 $CHAR8.                                  
      @1718   PRMCCS19                 $CHAR8.                                  
      @1726   PRMCCS20                 $CHAR8.                                  
      @1734   PRMCCS21                 $CHAR8.                                  
      @1742   PRMCCS22                 $CHAR8.                                  
      @1750   PRMCCS23                 $CHAR8.                                  
      @1758   PRMCCS24                 $CHAR8.                                  
      @1766   PRMCCS25                 $CHAR8.                                  
      @1774   PRMCCS26                 $CHAR8.                                  
      @1782   PRMCCS27                 $CHAR8.                                  
      @1790   PRMCCS28                 $CHAR8.                                  
      @1798   PRMCCS29                 $CHAR8.                                  
      @1806   PRMCCS30                 $CHAR8.                                  
      @1814   PRMCCS31                 $CHAR8.                                  
      @1822   PRMCCS32                 $CHAR8.                                  
      @1830   PRMCCS33                 $CHAR8.                                  
      @1838   PRMCCS34                 $CHAR8.                                  
      @1846   PRMCCS35                 $CHAR8.                                  
      @1854   PRMCCS36                 $CHAR8.                                  
      @1862   PRMCCS37                 $CHAR8.                                  
      @1870   PRMCCS38                 $CHAR8.                                  
      @1878   PRMCCS39                 $CHAR8.                                  
      @1886   PRMCCS40                 $CHAR8.                                  
      @1894   PRMCCS41                 $CHAR8.                                  
      @1902   PRMCCS42                 $CHAR8.                                  
      @1910   PRMCCS43                 $CHAR8.                                  
      @1918   PRMCCS44                 $CHAR8.                                  
      @1926   PRMCCS45                 $CHAR8.                                  
      @1934   PRMCCS46                 $CHAR8.                                  
      @1942   PRMCCS47                 $CHAR8.                                  
      @1950   PRMCCS48                 $CHAR8.                                  
      @1958   PRMCCS49                 $CHAR8.                                  
      @1966   PRMCCS50                 $CHAR8.                                  
      @1974   PRMCCS51                 $CHAR8.                                  
      @1982   PRMCCS52                 $CHAR8.                                  
      @1990   PRMCCS53                 $CHAR8.                                  
      @1998   PRMCCS54                 $CHAR8.                                  
      @2006   PRMCCS55                 $CHAR8.                                  
      @2014   PRMCCS56                 $CHAR8.                                  
      @2022   PRMCCS57                 $CHAR8.                                  
      @2030   PRMCCS58                 $CHAR8.                                  
      @2038   PRMCCS59                 $CHAR8.                                  
      @2046   PRMCCS60                 $CHAR8.                                  
      @2054   PRMCCS61                 $CHAR8.                                  
      @2062   PRMCCS62                 $CHAR8.                                  
      @2070   PRMCCS63                 $CHAR8.                                  
      ;                                                                         
                                                                                
                                                                                
RUN;
