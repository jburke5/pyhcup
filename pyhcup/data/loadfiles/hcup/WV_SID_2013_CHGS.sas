/*******************************************************************            
* Creation Date: 02/13/2015                                                     
*   WV_SID_2013_CHGS.SAS:                                                       
*      THE SAS CODE SHOWN BELOW WILL LOAD THE ASCII                             
*      INPATIENT STAY CHGS FILE INTO SAS                                        
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
DATA WV_SIDC_2013_CHGS;                                                         
INFILE 'WV_SID_2013_CHGS.ASC' FIRSTOBS=3 LRECL = 2658;                          
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  KEY                        LENGTH=8                      FORMAT=Z15.          
  LABEL="HCUP record identifier"                                                
                                                                                
  NREVCD                     LENGTH=3                                           
  LABEL="Number of revenue codes for this discharge"                            
                                                                                
  REVCD1                     LENGTH=$4                                          
  LABEL="Revenue code 1 (as received from source)"                              
                                                                                
  REVCD2                     LENGTH=$4                                          
  LABEL="Revenue code 2 (as received from source)"                              
                                                                                
  REVCD3                     LENGTH=$4                                          
  LABEL="Revenue code 3 (as received from source)"                              
                                                                                
  REVCD4                     LENGTH=$4                                          
  LABEL="Revenue code 4 (as received from source)"                              
                                                                                
  REVCD5                     LENGTH=$4                                          
  LABEL="Revenue code 5 (as received from source)"                              
                                                                                
  REVCD6                     LENGTH=$4                                          
  LABEL="Revenue code 6 (as received from source)"                              
                                                                                
  REVCD7                     LENGTH=$4                                          
  LABEL="Revenue code 7 (as received from source)"                              
                                                                                
  REVCD8                     LENGTH=$4                                          
  LABEL="Revenue code 8 (as received from source)"                              
                                                                                
  REVCD9                     LENGTH=$4                                          
  LABEL="Revenue code 9 (as received from source)"                              
                                                                                
  REVCD10                    LENGTH=$4                                          
  LABEL="Revenue code 10 (as received from source)"                             
                                                                                
  REVCD11                    LENGTH=$4                                          
  LABEL="Revenue code 11 (as received from source)"                             
                                                                                
  REVCD12                    LENGTH=$4                                          
  LABEL="Revenue code 12 (as received from source)"                             
                                                                                
  REVCD13                    LENGTH=$4                                          
  LABEL="Revenue code 13 (as received from source)"                             
                                                                                
  REVCD14                    LENGTH=$4                                          
  LABEL="Revenue code 14 (as received from source)"                             
                                                                                
  REVCD15                    LENGTH=$4                                          
  LABEL="Revenue code 15 (as received from source)"                             
                                                                                
  REVCD16                    LENGTH=$4                                          
  LABEL="Revenue code 16 (as received from source)"                             
                                                                                
  REVCD17                    LENGTH=$4                                          
  LABEL="Revenue code 17 (as received from source)"                             
                                                                                
  REVCD18                    LENGTH=$4                                          
  LABEL="Revenue code 18 (as received from source)"                             
                                                                                
  REVCD19                    LENGTH=$4                                          
  LABEL="Revenue code 19 (as received from source)"                             
                                                                                
  REVCD20                    LENGTH=$4                                          
  LABEL="Revenue code 20 (as received from source)"                             
                                                                                
  REVCD21                    LENGTH=$4                                          
  LABEL="Revenue code 21 (as received from source)"                             
                                                                                
  REVCD22                    LENGTH=$4                                          
  LABEL="Revenue code 22 (as received from source)"                             
                                                                                
  REVCD23                    LENGTH=$4                                          
  LABEL="Revenue code 23 (as received from source)"                             
                                                                                
  REVCD24                    LENGTH=$4                                          
  LABEL="Revenue code 24 (as received from source)"                             
                                                                                
  REVCD25                    LENGTH=$4                                          
  LABEL="Revenue code 25 (as received from source)"                             
                                                                                
  REVCD26                    LENGTH=$4                                          
  LABEL="Revenue code 26 (as received from source)"                             
                                                                                
  REVCD27                    LENGTH=$4                                          
  LABEL="Revenue code 27 (as received from source)"                             
                                                                                
  REVCD28                    LENGTH=$4                                          
  LABEL="Revenue code 28 (as received from source)"                             
                                                                                
  REVCD29                    LENGTH=$4                                          
  LABEL="Revenue code 29 (as received from source)"                             
                                                                                
  REVCD30                    LENGTH=$4                                          
  LABEL="Revenue code 30 (as received from source)"                             
                                                                                
  REVCD31                    LENGTH=$4                                          
  LABEL="Revenue code 31 (as received from source)"                             
                                                                                
  REVCD32                    LENGTH=$4                                          
  LABEL="Revenue code 32 (as received from source)"                             
                                                                                
  REVCD33                    LENGTH=$4                                          
  LABEL="Revenue code 33 (as received from source)"                             
                                                                                
  REVCD34                    LENGTH=$4                                          
  LABEL="Revenue code 34 (as received from source)"                             
                                                                                
  REVCD35                    LENGTH=$4                                          
  LABEL="Revenue code 35 (as received from source)"                             
                                                                                
  REVCD36                    LENGTH=$4                                          
  LABEL="Revenue code 36 (as received from source)"                             
                                                                                
  REVCD37                    LENGTH=$4                                          
  LABEL="Revenue code 37 (as received from source)"                             
                                                                                
  REVCD38                    LENGTH=$4                                          
  LABEL="Revenue code 38 (as received from source)"                             
                                                                                
  REVCD39                    LENGTH=$4                                          
  LABEL="Revenue code 39 (as received from source)"                             
                                                                                
  REVCD40                    LENGTH=$4                                          
  LABEL="Revenue code 40 (as received from source)"                             
                                                                                
  REVCD41                    LENGTH=$4                                          
  LABEL="Revenue code 41 (as received from source)"                             
                                                                                
  REVCD42                    LENGTH=$4                                          
  LABEL="Revenue code 42 (as received from source)"                             
                                                                                
  REVCD43                    LENGTH=$4                                          
  LABEL="Revenue code 43 (as received from source)"                             
                                                                                
  REVCD44                    LENGTH=$4                                          
  LABEL="Revenue code 44 (as received from source)"                             
                                                                                
  REVCD45                    LENGTH=$4                                          
  LABEL="Revenue code 45 (as received from source)"                             
                                                                                
  REVCD46                    LENGTH=$4                                          
  LABEL="Revenue code 46 (as received from source)"                             
                                                                                
  REVCD47                    LENGTH=$4                                          
  LABEL="Revenue code 47 (as received from source)"                             
                                                                                
  REVCD48                    LENGTH=$4                                          
  LABEL="Revenue code 48 (as received from source)"                             
                                                                                
  REVCD49                    LENGTH=$4                                          
  LABEL="Revenue code 49 (as received from source)"                             
                                                                                
  REVCD50                    LENGTH=$4                                          
  LABEL="Revenue code 50 (as received from source)"                             
                                                                                
  REVCD51                    LENGTH=$4                                          
  LABEL="Revenue code 51 (as received from source)"                             
                                                                                
  REVCD52                    LENGTH=$4                                          
  LABEL="Revenue code 52 (as received from source)"                             
                                                                                
  REVCD53                    LENGTH=$4                                          
  LABEL="Revenue code 53 (as received from source)"                             
                                                                                
  REVCD54                    LENGTH=$4                                          
  LABEL="Revenue code 54 (as received from source)"                             
                                                                                
  REVCD55                    LENGTH=$4                                          
  LABEL="Revenue code 55 (as received from source)"                             
                                                                                
  REVCD56                    LENGTH=$4                                          
  LABEL="Revenue code 56 (as received from source)"                             
                                                                                
  REVCD57                    LENGTH=$4                                          
  LABEL="Revenue code 57 (as received from source)"                             
                                                                                
  REVCD58                    LENGTH=$4                                          
  LABEL="Revenue code 58 (as received from source)"                             
                                                                                
  REVCD59                    LENGTH=$4                                          
  LABEL="Revenue code 59 (as received from source)"                             
                                                                                
  REVCD60                    LENGTH=$4                                          
  LABEL="Revenue code 60 (as received from source)"                             
                                                                                
  REVCD61                    LENGTH=$4                                          
  LABEL="Revenue code 61 (as received from source)"                             
                                                                                
  REVCD62                    LENGTH=$4                                          
  LABEL="Revenue code 62 (as received from source)"                             
                                                                                
  REVCD63                    LENGTH=$4                                          
  LABEL="Revenue code 63 (as received from source)"                             
                                                                                
  REVCD64                    LENGTH=$4                                          
  LABEL="Revenue code 64 (as received from source)"                             
                                                                                
  REVCD65                    LENGTH=$4                                          
  LABEL="Revenue code 65 (as received from source)"                             
                                                                                
  REVCD66                    LENGTH=$4                                          
  LABEL="Revenue code 66 (as received from source)"                             
                                                                                
  REVCD67                    LENGTH=$4                                          
  LABEL="Revenue code 67 (as received from source)"                             
                                                                                
  REVCD68                    LENGTH=$4                                          
  LABEL="Revenue code 68 (as received from source)"                             
                                                                                
  REVCD69                    LENGTH=$4                                          
  LABEL="Revenue code 69 (as received from source)"                             
                                                                                
  REVCD70                    LENGTH=$4                                          
  LABEL="Revenue code 70 (as received from source)"                             
                                                                                
  REVCD71                    LENGTH=$4                                          
  LABEL="Revenue code 71 (as received from source)"                             
                                                                                
  REVCD72                    LENGTH=$4                                          
  LABEL="Revenue code 72 (as received from source)"                             
                                                                                
  REVCD73                    LENGTH=$4                                          
  LABEL="Revenue code 73 (as received from source)"                             
                                                                                
  REVCD74                    LENGTH=$4                                          
  LABEL="Revenue code 74 (as received from source)"                             
                                                                                
  REVCD75                    LENGTH=$4                                          
  LABEL="Revenue code 75 (as received from source)"                             
                                                                                
  REVCD76                    LENGTH=$4                                          
  LABEL="Revenue code 76 (as received from source)"                             
                                                                                
  REVCD77                    LENGTH=$4                                          
  LABEL="Revenue code 77 (as received from source)"                             
                                                                                
  REVCD78                    LENGTH=$4                                          
  LABEL="Revenue code 78 (as received from source)"                             
                                                                                
  REVCD79                    LENGTH=$4                                          
  LABEL="Revenue code 79 (as received from source)"                             
                                                                                
  REVCD80                    LENGTH=$4                                          
  LABEL="Revenue code 80 (as received from source)"                             
                                                                                
  REVCD81                    LENGTH=$4                                          
  LABEL="Revenue code 81 (as received from source)"                             
                                                                                
  REVCD82                    LENGTH=$4                                          
  LABEL="Revenue code 82 (as received from source)"                             
                                                                                
  REVCD83                    LENGTH=$4                                          
  LABEL="Revenue code 83 (as received from source)"                             
                                                                                
  REVCD84                    LENGTH=$4                                          
  LABEL="Revenue code 84 (as received from source)"                             
                                                                                
  REVCD85                    LENGTH=$4                                          
  LABEL="Revenue code 85 (as received from source)"                             
                                                                                
  REVCD86                    LENGTH=$4                                          
  LABEL="Revenue code 86 (as received from source)"                             
                                                                                
  REVCD87                    LENGTH=$4                                          
  LABEL="Revenue code 87 (as received from source)"                             
                                                                                
  REVCD88                    LENGTH=$4                                          
  LABEL="Revenue code 88 (as received from source)"                             
                                                                                
  REVCD89                    LENGTH=$4                                          
  LABEL="Revenue code 89 (as received from source)"                             
                                                                                
  REVCD90                    LENGTH=$4                                          
  LABEL="Revenue code 90 (as received from source)"                             
                                                                                
  REVCD91                    LENGTH=$4                                          
  LABEL="Revenue code 91 (as received from source)"                             
                                                                                
  REVCD92                    LENGTH=$4                                          
  LABEL="Revenue code 92 (as received from source)"                             
                                                                                
  REVCD93                    LENGTH=$4                                          
  LABEL="Revenue code 93 (as received from source)"                             
                                                                                
  REVCD94                    LENGTH=$4                                          
  LABEL="Revenue code 94 (as received from source)"                             
                                                                                
  REVCD95                    LENGTH=$4                                          
  LABEL="Revenue code 95 (as received from source)"                             
                                                                                
  REVCD96                    LENGTH=$4                                          
  LABEL="Revenue code 96 (as received from source)"                             
                                                                                
  REVCD97                    LENGTH=$4                                          
  LABEL="Revenue code 97 (as received from source)"                             
                                                                                
  REVCD98                    LENGTH=$4                                          
  LABEL="Revenue code 98 (as received from source)"                             
                                                                                
  REVCD99                    LENGTH=$4                                          
  LABEL="Revenue code 99 (as received from source)"                             
                                                                                
  REVCD100                   LENGTH=$4                                          
  LABEL="Revenue code 100 (as received from source)"                            
                                                                                
  REVCD101                   LENGTH=$4                                          
  LABEL="Revenue code 101 (as received from source)"                            
                                                                                
  REVCD102                   LENGTH=$4                                          
  LABEL="Revenue code 102 (as received from source)"                            
                                                                                
  REVCD103                   LENGTH=$4                                          
  LABEL="Revenue code 103 (as received from source)"                            
                                                                                
  REVCD104                   LENGTH=$4                                          
  LABEL="Revenue code 104 (as received from source)"                            
                                                                                
  REVCD105                   LENGTH=$4                                          
  LABEL="Revenue code 105 (as received from source)"                            
                                                                                
  REVCD106                   LENGTH=$4                                          
  LABEL="Revenue code 106 (as received from source)"                            
                                                                                
  REVCD107                   LENGTH=$4                                          
  LABEL="Revenue code 107 (as received from source)"                            
                                                                                
  REVCD108                   LENGTH=$4                                          
  LABEL="Revenue code 108 (as received from source)"                            
                                                                                
  REVCD109                   LENGTH=$4                                          
  LABEL="Revenue code 109 (as received from source)"                            
                                                                                
  REVCD110                   LENGTH=$4                                          
  LABEL="Revenue code 110 (as received from source)"                            
                                                                                
  REVCHG1                    LENGTH=6                                           
  LABEL="Detailed charges for revenue code 1 (as received from source)"         
                                                                                
  REVCHG2                    LENGTH=6                                           
  LABEL="Detailed charges for revenue code 2 (as received from source)"         
                                                                                
  REVCHG3                    LENGTH=6                                           
  LABEL="Detailed charges for revenue code 3 (as received from source)"         
                                                                                
  REVCHG4                    LENGTH=6                                           
  LABEL="Detailed charges for revenue code 4 (as received from source)"         
                                                                                
  REVCHG5                    LENGTH=6                                           
  LABEL="Detailed charges for revenue code 5 (as received from source)"         
                                                                                
  REVCHG6                    LENGTH=6                                           
  LABEL="Detailed charges for revenue code 6 (as received from source)"         
                                                                                
  REVCHG7                    LENGTH=6                                           
  LABEL="Detailed charges for revenue code 7 (as received from source)"         
                                                                                
  REVCHG8                    LENGTH=6                                           
  LABEL="Detailed charges for revenue code 8 (as received from source)"         
                                                                                
  REVCHG9                    LENGTH=6                                           
  LABEL="Detailed charges for revenue code 9 (as received from source)"         
                                                                                
  REVCHG10                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 10 (as received from source)"        
                                                                                
  REVCHG11                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 11 (as received from source)"        
                                                                                
  REVCHG12                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 12 (as received from source)"        
                                                                                
  REVCHG13                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 13 (as received from source)"        
                                                                                
  REVCHG14                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 14 (as received from source)"        
                                                                                
  REVCHG15                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 15 (as received from source)"        
                                                                                
  REVCHG16                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 16 (as received from source)"        
                                                                                
  REVCHG17                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 17 (as received from source)"        
                                                                                
  REVCHG18                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 18 (as received from source)"        
                                                                                
  REVCHG19                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 19 (as received from source)"        
                                                                                
  REVCHG20                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 20 (as received from source)"        
                                                                                
  REVCHG21                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 21 (as received from source)"        
                                                                                
  REVCHG22                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 22 (as received from source)"        
                                                                                
  REVCHG23                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 23 (as received from source)"        
                                                                                
  REVCHG24                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 24 (as received from source)"        
                                                                                
  REVCHG25                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 25 (as received from source)"        
                                                                                
  REVCHG26                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 26 (as received from source)"        
                                                                                
  REVCHG27                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 27 (as received from source)"        
                                                                                
  REVCHG28                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 28 (as received from source)"        
                                                                                
  REVCHG29                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 29 (as received from source)"        
                                                                                
  REVCHG30                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 30 (as received from source)"        
                                                                                
  REVCHG31                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 31 (as received from source)"        
                                                                                
  REVCHG32                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 32 (as received from source)"        
                                                                                
  REVCHG33                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 33 (as received from source)"        
                                                                                
  REVCHG34                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 34 (as received from source)"        
                                                                                
  REVCHG35                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 35 (as received from source)"        
                                                                                
  REVCHG36                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 36 (as received from source)"        
                                                                                
  REVCHG37                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 37 (as received from source)"        
                                                                                
  REVCHG38                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 38 (as received from source)"        
                                                                                
  REVCHG39                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 39 (as received from source)"        
                                                                                
  REVCHG40                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 40 (as received from source)"        
                                                                                
  REVCHG41                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 41 (as received from source)"        
                                                                                
  REVCHG42                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 42 (as received from source)"        
                                                                                
  REVCHG43                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 43 (as received from source)"        
                                                                                
  REVCHG44                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 44 (as received from source)"        
                                                                                
  REVCHG45                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 45 (as received from source)"        
                                                                                
  REVCHG46                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 46 (as received from source)"        
                                                                                
  REVCHG47                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 47 (as received from source)"        
                                                                                
  REVCHG48                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 48 (as received from source)"        
                                                                                
  REVCHG49                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 49 (as received from source)"        
                                                                                
  REVCHG50                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 50 (as received from source)"        
                                                                                
  REVCHG51                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 51 (as received from source)"        
                                                                                
  REVCHG52                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 52 (as received from source)"        
                                                                                
  REVCHG53                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 53 (as received from source)"        
                                                                                
  REVCHG54                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 54 (as received from source)"        
                                                                                
  REVCHG55                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 55 (as received from source)"        
                                                                                
  REVCHG56                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 56 (as received from source)"        
                                                                                
  REVCHG57                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 57 (as received from source)"        
                                                                                
  REVCHG58                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 58 (as received from source)"        
                                                                                
  REVCHG59                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 59 (as received from source)"        
                                                                                
  REVCHG60                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 60 (as received from source)"        
                                                                                
  REVCHG61                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 61 (as received from source)"        
                                                                                
  REVCHG62                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 62 (as received from source)"        
                                                                                
  REVCHG63                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 63 (as received from source)"        
                                                                                
  REVCHG64                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 64 (as received from source)"        
                                                                                
  REVCHG65                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 65 (as received from source)"        
                                                                                
  REVCHG66                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 66 (as received from source)"        
                                                                                
  REVCHG67                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 67 (as received from source)"        
                                                                                
  REVCHG68                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 68 (as received from source)"        
                                                                                
  REVCHG69                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 69 (as received from source)"        
                                                                                
  REVCHG70                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 70 (as received from source)"        
                                                                                
  REVCHG71                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 71 (as received from source)"        
                                                                                
  REVCHG72                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 72 (as received from source)"        
                                                                                
  REVCHG73                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 73 (as received from source)"        
                                                                                
  REVCHG74                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 74 (as received from source)"        
                                                                                
  REVCHG75                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 75 (as received from source)"        
                                                                                
  REVCHG76                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 76 (as received from source)"        
                                                                                
  REVCHG77                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 77 (as received from source)"        
                                                                                
  REVCHG78                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 78 (as received from source)"        
                                                                                
  REVCHG79                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 79 (as received from source)"        
                                                                                
  REVCHG80                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 80 (as received from source)"        
                                                                                
  REVCHG81                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 81 (as received from source)"        
                                                                                
  REVCHG82                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 82 (as received from source)"        
                                                                                
  REVCHG83                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 83 (as received from source)"        
                                                                                
  REVCHG84                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 84 (as received from source)"        
                                                                                
  REVCHG85                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 85 (as received from source)"        
                                                                                
  REVCHG86                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 86 (as received from source)"        
                                                                                
  REVCHG87                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 87 (as received from source)"        
                                                                                
  REVCHG88                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 88 (as received from source)"        
                                                                                
  REVCHG89                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 89 (as received from source)"        
                                                                                
  REVCHG90                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 90 (as received from source)"        
                                                                                
  REVCHG91                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 91 (as received from source)"        
                                                                                
  REVCHG92                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 92 (as received from source)"        
                                                                                
  REVCHG93                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 93 (as received from source)"        
                                                                                
  REVCHG94                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 94 (as received from source)"        
                                                                                
  REVCHG95                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 95 (as received from source)"        
                                                                                
  REVCHG96                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 96 (as received from source)"        
                                                                                
  REVCHG97                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 97 (as received from source)"        
                                                                                
  REVCHG98                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 98 (as received from source)"        
                                                                                
  REVCHG99                   LENGTH=6                                           
  LABEL="Detailed charges for revenue code 99 (as received from source)"        
                                                                                
  REVCHG100                  LENGTH=6                                           
  LABEL="Detailed charges for revenue code 100 (as received from source)"       
                                                                                
  REVCHG101                  LENGTH=6                                           
  LABEL="Detailed charges for revenue code 101 (as received from source)"       
                                                                                
  REVCHG102                  LENGTH=6                                           
  LABEL="Detailed charges for revenue code 102 (as received from source)"       
                                                                                
  REVCHG103                  LENGTH=6                                           
  LABEL="Detailed charges for revenue code 103 (as received from source)"       
                                                                                
  REVCHG104                  LENGTH=6                                           
  LABEL="Detailed charges for revenue code 104 (as received from source)"       
                                                                                
  REVCHG105                  LENGTH=6                                           
  LABEL="Detailed charges for revenue code 105 (as received from source)"       
                                                                                
  REVCHG106                  LENGTH=6                                           
  LABEL="Detailed charges for revenue code 106 (as received from source)"       
                                                                                
  REVCHG107                  LENGTH=6                                           
  LABEL="Detailed charges for revenue code 107 (as received from source)"       
                                                                                
  REVCHG108                  LENGTH=6                                           
  LABEL="Detailed charges for revenue code 108 (as received from source)"       
                                                                                
  REVCHG109                  LENGTH=6                                           
  LABEL="Detailed charges for revenue code 109 (as received from source)"       
                                                                                
  REVCHG110                  LENGTH=6                                           
  LABEL="Detailed charges for revenue code 110 (as received from source)"       
                                                                                
  UNIT1                      LENGTH=4                                           
  LABEL="Units of service 1 (as received from source)"                          
                                                                                
  UNIT2                      LENGTH=4                                           
  LABEL="Units of service 2 (as received from source)"                          
                                                                                
  UNIT3                      LENGTH=4                                           
  LABEL="Units of service 3 (as received from source)"                          
                                                                                
  UNIT4                      LENGTH=4                                           
  LABEL="Units of service 4 (as received from source)"                          
                                                                                
  UNIT5                      LENGTH=4                                           
  LABEL="Units of service 5 (as received from source)"                          
                                                                                
  UNIT6                      LENGTH=4                                           
  LABEL="Units of service 6 (as received from source)"                          
                                                                                
  UNIT7                      LENGTH=4                                           
  LABEL="Units of service 7 (as received from source)"                          
                                                                                
  UNIT8                      LENGTH=4                                           
  LABEL="Units of service 8 (as received from source)"                          
                                                                                
  UNIT9                      LENGTH=4                                           
  LABEL="Units of service 9 (as received from source)"                          
                                                                                
  UNIT10                     LENGTH=4                                           
  LABEL="Units of service 10 (as received from source)"                         
                                                                                
  UNIT11                     LENGTH=4                                           
  LABEL="Units of service 11 (as received from source)"                         
                                                                                
  UNIT12                     LENGTH=4                                           
  LABEL="Units of service 12 (as received from source)"                         
                                                                                
  UNIT13                     LENGTH=4                                           
  LABEL="Units of service 13 (as received from source)"                         
                                                                                
  UNIT14                     LENGTH=4                                           
  LABEL="Units of service 14 (as received from source)"                         
                                                                                
  UNIT15                     LENGTH=4                                           
  LABEL="Units of service 15 (as received from source)"                         
                                                                                
  UNIT16                     LENGTH=4                                           
  LABEL="Units of service 16 (as received from source)"                         
                                                                                
  UNIT17                     LENGTH=4                                           
  LABEL="Units of service 17 (as received from source)"                         
                                                                                
  UNIT18                     LENGTH=4                                           
  LABEL="Units of service 18 (as received from source)"                         
                                                                                
  UNIT19                     LENGTH=4                                           
  LABEL="Units of service 19 (as received from source)"                         
                                                                                
  UNIT20                     LENGTH=4                                           
  LABEL="Units of service 20 (as received from source)"                         
                                                                                
  UNIT21                     LENGTH=4                                           
  LABEL="Units of service 21 (as received from source)"                         
                                                                                
  UNIT22                     LENGTH=4                                           
  LABEL="Units of service 22 (as received from source)"                         
                                                                                
  UNIT23                     LENGTH=4                                           
  LABEL="Units of service 23 (as received from source)"                         
                                                                                
  UNIT24                     LENGTH=4                                           
  LABEL="Units of service 24 (as received from source)"                         
                                                                                
  UNIT25                     LENGTH=4                                           
  LABEL="Units of service 25 (as received from source)"                         
                                                                                
  UNIT26                     LENGTH=4                                           
  LABEL="Units of service 26 (as received from source)"                         
                                                                                
  UNIT27                     LENGTH=4                                           
  LABEL="Units of service 27 (as received from source)"                         
                                                                                
  UNIT28                     LENGTH=4                                           
  LABEL="Units of service 28 (as received from source)"                         
                                                                                
  UNIT29                     LENGTH=4                                           
  LABEL="Units of service 29 (as received from source)"                         
                                                                                
  UNIT30                     LENGTH=4                                           
  LABEL="Units of service 30 (as received from source)"                         
                                                                                
  UNIT31                     LENGTH=4                                           
  LABEL="Units of service 31 (as received from source)"                         
                                                                                
  UNIT32                     LENGTH=4                                           
  LABEL="Units of service 32 (as received from source)"                         
                                                                                
  UNIT33                     LENGTH=4                                           
  LABEL="Units of service 33 (as received from source)"                         
                                                                                
  UNIT34                     LENGTH=4                                           
  LABEL="Units of service 34 (as received from source)"                         
                                                                                
  UNIT35                     LENGTH=4                                           
  LABEL="Units of service 35 (as received from source)"                         
                                                                                
  UNIT36                     LENGTH=4                                           
  LABEL="Units of service 36 (as received from source)"                         
                                                                                
  UNIT37                     LENGTH=4                                           
  LABEL="Units of service 37 (as received from source)"                         
                                                                                
  UNIT38                     LENGTH=4                                           
  LABEL="Units of service 38 (as received from source)"                         
                                                                                
  UNIT39                     LENGTH=4                                           
  LABEL="Units of service 39 (as received from source)"                         
                                                                                
  UNIT40                     LENGTH=4                                           
  LABEL="Units of service 40 (as received from source)"                         
                                                                                
  UNIT41                     LENGTH=4                                           
  LABEL="Units of service 41 (as received from source)"                         
                                                                                
  UNIT42                     LENGTH=4                                           
  LABEL="Units of service 42 (as received from source)"                         
                                                                                
  UNIT43                     LENGTH=4                                           
  LABEL="Units of service 43 (as received from source)"                         
                                                                                
  UNIT44                     LENGTH=4                                           
  LABEL="Units of service 44 (as received from source)"                         
                                                                                
  UNIT45                     LENGTH=4                                           
  LABEL="Units of service 45 (as received from source)"                         
                                                                                
  UNIT46                     LENGTH=4                                           
  LABEL="Units of service 46 (as received from source)"                         
                                                                                
  UNIT47                     LENGTH=4                                           
  LABEL="Units of service 47 (as received from source)"                         
                                                                                
  UNIT48                     LENGTH=4                                           
  LABEL="Units of service 48 (as received from source)"                         
                                                                                
  UNIT49                     LENGTH=4                                           
  LABEL="Units of service 49 (as received from source)"                         
                                                                                
  UNIT50                     LENGTH=4                                           
  LABEL="Units of service 50 (as received from source)"                         
                                                                                
  UNIT51                     LENGTH=4                                           
  LABEL="Units of service 51 (as received from source)"                         
                                                                                
  UNIT52                     LENGTH=4                                           
  LABEL="Units of service 52 (as received from source)"                         
                                                                                
  UNIT53                     LENGTH=4                                           
  LABEL="Units of service 53 (as received from source)"                         
                                                                                
  UNIT54                     LENGTH=4                                           
  LABEL="Units of service 54 (as received from source)"                         
                                                                                
  UNIT55                     LENGTH=4                                           
  LABEL="Units of service 55 (as received from source)"                         
                                                                                
  UNIT56                     LENGTH=4                                           
  LABEL="Units of service 56 (as received from source)"                         
                                                                                
  UNIT57                     LENGTH=4                                           
  LABEL="Units of service 57 (as received from source)"                         
                                                                                
  UNIT58                     LENGTH=4                                           
  LABEL="Units of service 58 (as received from source)"                         
                                                                                
  UNIT59                     LENGTH=4                                           
  LABEL="Units of service 59 (as received from source)"                         
                                                                                
  UNIT60                     LENGTH=4                                           
  LABEL="Units of service 60 (as received from source)"                         
                                                                                
  UNIT61                     LENGTH=4                                           
  LABEL="Units of service 61 (as received from source)"                         
                                                                                
  UNIT62                     LENGTH=4                                           
  LABEL="Units of service 62 (as received from source)"                         
                                                                                
  UNIT63                     LENGTH=4                                           
  LABEL="Units of service 63 (as received from source)"                         
                                                                                
  UNIT64                     LENGTH=4                                           
  LABEL="Units of service 64 (as received from source)"                         
                                                                                
  UNIT65                     LENGTH=4                                           
  LABEL="Units of service 65 (as received from source)"                         
                                                                                
  UNIT66                     LENGTH=4                                           
  LABEL="Units of service 66 (as received from source)"                         
                                                                                
  UNIT67                     LENGTH=4                                           
  LABEL="Units of service 67 (as received from source)"                         
                                                                                
  UNIT68                     LENGTH=4                                           
  LABEL="Units of service 68 (as received from source)"                         
                                                                                
  UNIT69                     LENGTH=4                                           
  LABEL="Units of service 69 (as received from source)"                         
                                                                                
  UNIT70                     LENGTH=4                                           
  LABEL="Units of service 70 (as received from source)"                         
                                                                                
  UNIT71                     LENGTH=4                                           
  LABEL="Units of service 71 (as received from source)"                         
                                                                                
  UNIT72                     LENGTH=4                                           
  LABEL="Units of service 72 (as received from source)"                         
                                                                                
  UNIT73                     LENGTH=4                                           
  LABEL="Units of service 73 (as received from source)"                         
                                                                                
  UNIT74                     LENGTH=4                                           
  LABEL="Units of service 74 (as received from source)"                         
                                                                                
  UNIT75                     LENGTH=4                                           
  LABEL="Units of service 75 (as received from source)"                         
                                                                                
  UNIT76                     LENGTH=4                                           
  LABEL="Units of service 76 (as received from source)"                         
                                                                                
  UNIT77                     LENGTH=4                                           
  LABEL="Units of service 77 (as received from source)"                         
                                                                                
  UNIT78                     LENGTH=4                                           
  LABEL="Units of service 78 (as received from source)"                         
                                                                                
  UNIT79                     LENGTH=4                                           
  LABEL="Units of service 79 (as received from source)"                         
                                                                                
  UNIT80                     LENGTH=4                                           
  LABEL="Units of service 80 (as received from source)"                         
                                                                                
  UNIT81                     LENGTH=4                                           
  LABEL="Units of service 81 (as received from source)"                         
                                                                                
  UNIT82                     LENGTH=4                                           
  LABEL="Units of service 82 (as received from source)"                         
                                                                                
  UNIT83                     LENGTH=4                                           
  LABEL="Units of service 83 (as received from source)"                         
                                                                                
  UNIT84                     LENGTH=4                                           
  LABEL="Units of service 84 (as received from source)"                         
                                                                                
  UNIT85                     LENGTH=4                                           
  LABEL="Units of service 85 (as received from source)"                         
                                                                                
  UNIT86                     LENGTH=4                                           
  LABEL="Units of service 86 (as received from source)"                         
                                                                                
  UNIT87                     LENGTH=4                                           
  LABEL="Units of service 87 (as received from source)"                         
                                                                                
  UNIT88                     LENGTH=4                                           
  LABEL="Units of service 88 (as received from source)"                         
                                                                                
  UNIT89                     LENGTH=4                                           
  LABEL="Units of service 89 (as received from source)"                         
                                                                                
  UNIT90                     LENGTH=4                                           
  LABEL="Units of service 90 (as received from source)"                         
                                                                                
  UNIT91                     LENGTH=4                                           
  LABEL="Units of service 91 (as received from source)"                         
                                                                                
  UNIT92                     LENGTH=4                                           
  LABEL="Units of service 92 (as received from source)"                         
                                                                                
  UNIT93                     LENGTH=4                                           
  LABEL="Units of service 93 (as received from source)"                         
                                                                                
  UNIT94                     LENGTH=4                                           
  LABEL="Units of service 94 (as received from source)"                         
                                                                                
  UNIT95                     LENGTH=4                                           
  LABEL="Units of service 95 (as received from source)"                         
                                                                                
  UNIT96                     LENGTH=4                                           
  LABEL="Units of service 96 (as received from source)"                         
                                                                                
  UNIT97                     LENGTH=4                                           
  LABEL="Units of service 97 (as received from source)"                         
                                                                                
  UNIT98                     LENGTH=4                                           
  LABEL="Units of service 98 (as received from source)"                         
                                                                                
  UNIT99                     LENGTH=4                                           
  LABEL="Units of service 99 (as received from source)"                         
                                                                                
  UNIT100                    LENGTH=4                                           
  LABEL="Units of service 100 (as received from source)"                        
                                                                                
  UNIT101                    LENGTH=4                                           
  LABEL="Units of service 101 (as received from source)"                        
                                                                                
  UNIT102                    LENGTH=4                                           
  LABEL="Units of service 102 (as received from source)"                        
                                                                                
  UNIT103                    LENGTH=4                                           
  LABEL="Units of service 103 (as received from source)"                        
                                                                                
  UNIT104                    LENGTH=4                                           
  LABEL="Units of service 104 (as received from source)"                        
                                                                                
  UNIT105                    LENGTH=4                                           
  LABEL="Units of service 105 (as received from source)"                        
                                                                                
  UNIT106                    LENGTH=4                                           
  LABEL="Units of service 106 (as received from source)"                        
                                                                                
  UNIT107                    LENGTH=4                                           
  LABEL="Units of service 107 (as received from source)"                        
                                                                                
  UNIT108                    LENGTH=4                                           
  LABEL="Units of service 108 (as received from source)"                        
                                                                                
  UNIT109                    LENGTH=4                                           
  LABEL="Units of service 109 (as received from source)"                        
                                                                                
  UNIT110                    LENGTH=4                                           
  LABEL="Units of service 110 (as received from source)"                        
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      KEY                           15.                                 
      @16     NREVCD                        N3PF.                               
      @19     REVCD1                        $CHAR4.                             
      @23     REVCD2                        $CHAR4.                             
      @27     REVCD3                        $CHAR4.                             
      @31     REVCD4                        $CHAR4.                             
      @35     REVCD5                        $CHAR4.                             
      @39     REVCD6                        $CHAR4.                             
      @43     REVCD7                        $CHAR4.                             
      @47     REVCD8                        $CHAR4.                             
      @51     REVCD9                        $CHAR4.                             
      @55     REVCD10                       $CHAR4.                             
      @59     REVCD11                       $CHAR4.                             
      @63     REVCD12                       $CHAR4.                             
      @67     REVCD13                       $CHAR4.                             
      @71     REVCD14                       $CHAR4.                             
      @75     REVCD15                       $CHAR4.                             
      @79     REVCD16                       $CHAR4.                             
      @83     REVCD17                       $CHAR4.                             
      @87     REVCD18                       $CHAR4.                             
      @91     REVCD19                       $CHAR4.                             
      @95     REVCD20                       $CHAR4.                             
      @99     REVCD21                       $CHAR4.                             
      @103    REVCD22                       $CHAR4.                             
      @107    REVCD23                       $CHAR4.                             
      @111    REVCD24                       $CHAR4.                             
      @115    REVCD25                       $CHAR4.                             
      @119    REVCD26                       $CHAR4.                             
      @123    REVCD27                       $CHAR4.                             
      @127    REVCD28                       $CHAR4.                             
      @131    REVCD29                       $CHAR4.                             
      @135    REVCD30                       $CHAR4.                             
      @139    REVCD31                       $CHAR4.                             
      @143    REVCD32                       $CHAR4.                             
      @147    REVCD33                       $CHAR4.                             
      @151    REVCD34                       $CHAR4.                             
      @155    REVCD35                       $CHAR4.                             
      @159    REVCD36                       $CHAR4.                             
      @163    REVCD37                       $CHAR4.                             
      @167    REVCD38                       $CHAR4.                             
      @171    REVCD39                       $CHAR4.                             
      @175    REVCD40                       $CHAR4.                             
      @179    REVCD41                       $CHAR4.                             
      @183    REVCD42                       $CHAR4.                             
      @187    REVCD43                       $CHAR4.                             
      @191    REVCD44                       $CHAR4.                             
      @195    REVCD45                       $CHAR4.                             
      @199    REVCD46                       $CHAR4.                             
      @203    REVCD47                       $CHAR4.                             
      @207    REVCD48                       $CHAR4.                             
      @211    REVCD49                       $CHAR4.                             
      @215    REVCD50                       $CHAR4.                             
      @219    REVCD51                       $CHAR4.                             
      @223    REVCD52                       $CHAR4.                             
      @227    REVCD53                       $CHAR4.                             
      @231    REVCD54                       $CHAR4.                             
      @235    REVCD55                       $CHAR4.                             
      @239    REVCD56                       $CHAR4.                             
      @243    REVCD57                       $CHAR4.                             
      @247    REVCD58                       $CHAR4.                             
      @251    REVCD59                       $CHAR4.                             
      @255    REVCD60                       $CHAR4.                             
      @259    REVCD61                       $CHAR4.                             
      @263    REVCD62                       $CHAR4.                             
      @267    REVCD63                       $CHAR4.                             
      @271    REVCD64                       $CHAR4.                             
      @275    REVCD65                       $CHAR4.                             
      @279    REVCD66                       $CHAR4.                             
      @283    REVCD67                       $CHAR4.                             
      @287    REVCD68                       $CHAR4.                             
      @291    REVCD69                       $CHAR4.                             
      @295    REVCD70                       $CHAR4.                             
      @299    REVCD71                       $CHAR4.                             
      @303    REVCD72                       $CHAR4.                             
      @307    REVCD73                       $CHAR4.                             
      @311    REVCD74                       $CHAR4.                             
      @315    REVCD75                       $CHAR4.                             
      @319    REVCD76                       $CHAR4.                             
      @323    REVCD77                       $CHAR4.                             
      @327    REVCD78                       $CHAR4.                             
      @331    REVCD79                       $CHAR4.                             
      @335    REVCD80                       $CHAR4.                             
      @339    REVCD81                       $CHAR4.                             
      @343    REVCD82                       $CHAR4.                             
      @347    REVCD83                       $CHAR4.                             
      @351    REVCD84                       $CHAR4.                             
      @355    REVCD85                       $CHAR4.                             
      @359    REVCD86                       $CHAR4.                             
      @363    REVCD87                       $CHAR4.                             
      @367    REVCD88                       $CHAR4.                             
      @371    REVCD89                       $CHAR4.                             
      @375    REVCD90                       $CHAR4.                             
      @379    REVCD91                       $CHAR4.                             
      @383    REVCD92                       $CHAR4.                             
      @387    REVCD93                       $CHAR4.                             
      @391    REVCD94                       $CHAR4.                             
      @395    REVCD95                       $CHAR4.                             
      @399    REVCD96                       $CHAR4.                             
      @403    REVCD97                       $CHAR4.                             
      @407    REVCD98                       $CHAR4.                             
      @411    REVCD99                       $CHAR4.                             
      @415    REVCD100                      $CHAR4.                             
      @419    REVCD101                      $CHAR4.                             
      @423    REVCD102                      $CHAR4.                             
      @427    REVCD103                      $CHAR4.                             
      @431    REVCD104                      $CHAR4.                             
      @435    REVCD105                      $CHAR4.                             
      @439    REVCD106                      $CHAR4.                             
      @443    REVCD107                      $CHAR4.                             
      @447    REVCD108                      $CHAR4.                             
      @451    REVCD109                      $CHAR4.                             
      @455    REVCD110                      $CHAR4.                             
      @459    REVCHG1                       N12P2F.                             
      @471    REVCHG2                       N12P2F.                             
      @483    REVCHG3                       N12P2F.                             
      @495    REVCHG4                       N12P2F.                             
      @507    REVCHG5                       N12P2F.                             
      @519    REVCHG6                       N12P2F.                             
      @531    REVCHG7                       N12P2F.                             
      @543    REVCHG8                       N12P2F.                             
      @555    REVCHG9                       N12P2F.                             
      @567    REVCHG10                      N12P2F.                             
      @579    REVCHG11                      N12P2F.                             
      @591    REVCHG12                      N12P2F.                             
      @603    REVCHG13                      N12P2F.                             
      @615    REVCHG14                      N12P2F.                             
      @627    REVCHG15                      N12P2F.                             
      @639    REVCHG16                      N12P2F.                             
      @651    REVCHG17                      N12P2F.                             
      @663    REVCHG18                      N12P2F.                             
      @675    REVCHG19                      N12P2F.                             
      @687    REVCHG20                      N12P2F.                             
      @699    REVCHG21                      N12P2F.                             
      @711    REVCHG22                      N12P2F.                             
      @723    REVCHG23                      N12P2F.                             
      @735    REVCHG24                      N12P2F.                             
      @747    REVCHG25                      N12P2F.                             
      @759    REVCHG26                      N12P2F.                             
      @771    REVCHG27                      N12P2F.                             
      @783    REVCHG28                      N12P2F.                             
      @795    REVCHG29                      N12P2F.                             
      @807    REVCHG30                      N12P2F.                             
      @819    REVCHG31                      N12P2F.                             
      @831    REVCHG32                      N12P2F.                             
      @843    REVCHG33                      N12P2F.                             
      @855    REVCHG34                      N12P2F.                             
      @867    REVCHG35                      N12P2F.                             
      @879    REVCHG36                      N12P2F.                             
      @891    REVCHG37                      N12P2F.                             
      @903    REVCHG38                      N12P2F.                             
      @915    REVCHG39                      N12P2F.                             
      @927    REVCHG40                      N12P2F.                             
      @939    REVCHG41                      N12P2F.                             
      @951    REVCHG42                      N12P2F.                             
      @963    REVCHG43                      N12P2F.                             
      @975    REVCHG44                      N12P2F.                             
      @987    REVCHG45                      N12P2F.                             
      @999    REVCHG46                      N12P2F.                             
      @1011   REVCHG47                      N12P2F.                             
      @1023   REVCHG48                      N12P2F.                             
      @1035   REVCHG49                      N12P2F.                             
      @1047   REVCHG50                      N12P2F.                             
      @1059   REVCHG51                      N12P2F.                             
      @1071   REVCHG52                      N12P2F.                             
      @1083   REVCHG53                      N12P2F.                             
      @1095   REVCHG54                      N12P2F.                             
      @1107   REVCHG55                      N12P2F.                             
      @1119   REVCHG56                      N12P2F.                             
      @1131   REVCHG57                      N12P2F.                             
      @1143   REVCHG58                      N12P2F.                             
      @1155   REVCHG59                      N12P2F.                             
      @1167   REVCHG60                      N12P2F.                             
      @1179   REVCHG61                      N12P2F.                             
      @1191   REVCHG62                      N12P2F.                             
      @1203   REVCHG63                      N12P2F.                             
      @1215   REVCHG64                      N12P2F.                             
      @1227   REVCHG65                      N12P2F.                             
      @1239   REVCHG66                      N12P2F.                             
      @1251   REVCHG67                      N12P2F.                             
      @1263   REVCHG68                      N12P2F.                             
      @1275   REVCHG69                      N12P2F.                             
      @1287   REVCHG70                      N12P2F.                             
      @1299   REVCHG71                      N12P2F.                             
      @1311   REVCHG72                      N12P2F.                             
      @1323   REVCHG73                      N12P2F.                             
      @1335   REVCHG74                      N12P2F.                             
      @1347   REVCHG75                      N12P2F.                             
      @1359   REVCHG76                      N12P2F.                             
      @1371   REVCHG77                      N12P2F.                             
      @1383   REVCHG78                      N12P2F.                             
      @1395   REVCHG79                      N12P2F.                             
      @1407   REVCHG80                      N12P2F.                             
      @1419   REVCHG81                      N12P2F.                             
      @1431   REVCHG82                      N12P2F.                             
      @1443   REVCHG83                      N12P2F.                             
      @1455   REVCHG84                      N12P2F.                             
      @1467   REVCHG85                      N12P2F.                             
      @1479   REVCHG86                      N12P2F.                             
      @1491   REVCHG87                      N12P2F.                             
      @1503   REVCHG88                      N12P2F.                             
      @1515   REVCHG89                      N12P2F.                             
      @1527   REVCHG90                      N12P2F.                             
      @1539   REVCHG91                      N12P2F.                             
      @1551   REVCHG92                      N12P2F.                             
      @1563   REVCHG93                      N12P2F.                             
      @1575   REVCHG94                      N12P2F.                             
      @1587   REVCHG95                      N12P2F.                             
      @1599   REVCHG96                      N12P2F.                             
      @1611   REVCHG97                      N12P2F.                             
      @1623   REVCHG98                      N12P2F.                             
      @1635   REVCHG99                      N12P2F.                             
      @1647   REVCHG100                     N12P2F.                             
      @1659   REVCHG101                     N12P2F.                             
      @1671   REVCHG102                     N12P2F.                             
      @1683   REVCHG103                     N12P2F.                             
      @1695   REVCHG104                     N12P2F.                             
      @1707   REVCHG105                     N12P2F.                             
      @1719   REVCHG106                     N12P2F.                             
      @1731   REVCHG107                     N12P2F.                             
      @1743   REVCHG108                     N12P2F.                             
      @1755   REVCHG109                     N12P2F.                             
      @1767   REVCHG110                     N12P2F.                             
      @1779   UNIT1                         N8P2F.                              
      @1787   UNIT2                         N8P2F.                              
      @1795   UNIT3                         N8P2F.                              
      @1803   UNIT4                         N8P2F.                              
      @1811   UNIT5                         N8P2F.                              
      @1819   UNIT6                         N8P2F.                              
      @1827   UNIT7                         N8P2F.                              
      @1835   UNIT8                         N8P2F.                              
      @1843   UNIT9                         N8P2F.                              
      @1851   UNIT10                        N8P2F.                              
      @1859   UNIT11                        N8P2F.                              
      @1867   UNIT12                        N8P2F.                              
      @1875   UNIT13                        N8P2F.                              
      @1883   UNIT14                        N8P2F.                              
      @1891   UNIT15                        N8P2F.                              
      @1899   UNIT16                        N8P2F.                              
      @1907   UNIT17                        N8P2F.                              
      @1915   UNIT18                        N8P2F.                              
      @1923   UNIT19                        N8P2F.                              
      @1931   UNIT20                        N8P2F.                              
      @1939   UNIT21                        N8P2F.                              
      @1947   UNIT22                        N8P2F.                              
      @1955   UNIT23                        N8P2F.                              
      @1963   UNIT24                        N8P2F.                              
      @1971   UNIT25                        N8P2F.                              
      @1979   UNIT26                        N8P2F.                              
      @1987   UNIT27                        N8P2F.                              
      @1995   UNIT28                        N8P2F.                              
      @2003   UNIT29                        N8P2F.                              
      @2011   UNIT30                        N8P2F.                              
      @2019   UNIT31                        N8P2F.                              
      @2027   UNIT32                        N8P2F.                              
      @2035   UNIT33                        N8P2F.                              
      @2043   UNIT34                        N8P2F.                              
      @2051   UNIT35                        N8P2F.                              
      @2059   UNIT36                        N8P2F.                              
      @2067   UNIT37                        N8P2F.                              
      @2075   UNIT38                        N8P2F.                              
      @2083   UNIT39                        N8P2F.                              
      @2091   UNIT40                        N8P2F.                              
      @2099   UNIT41                        N8P2F.                              
      @2107   UNIT42                        N8P2F.                              
      @2115   UNIT43                        N8P2F.                              
      @2123   UNIT44                        N8P2F.                              
      @2131   UNIT45                        N8P2F.                              
      @2139   UNIT46                        N8P2F.                              
      @2147   UNIT47                        N8P2F.                              
      @2155   UNIT48                        N8P2F.                              
      @2163   UNIT49                        N8P2F.                              
      @2171   UNIT50                        N8P2F.                              
      @2179   UNIT51                        N8P2F.                              
      @2187   UNIT52                        N8P2F.                              
      @2195   UNIT53                        N8P2F.                              
      @2203   UNIT54                        N8P2F.                              
      @2211   UNIT55                        N8P2F.                              
      @2219   UNIT56                        N8P2F.                              
      @2227   UNIT57                        N8P2F.                              
      @2235   UNIT58                        N8P2F.                              
      @2243   UNIT59                        N8P2F.                              
      @2251   UNIT60                        N8P2F.                              
      @2259   UNIT61                        N8P2F.                              
      @2267   UNIT62                        N8P2F.                              
      @2275   UNIT63                        N8P2F.                              
      @2283   UNIT64                        N8P2F.                              
      @2291   UNIT65                        N8P2F.                              
      @2299   UNIT66                        N8P2F.                              
      @2307   UNIT67                        N8P2F.                              
      @2315   UNIT68                        N8P2F.                              
      @2323   UNIT69                        N8P2F.                              
      @2331   UNIT70                        N8P2F.                              
      @2339   UNIT71                        N8P2F.                              
      @2347   UNIT72                        N8P2F.                              
      @2355   UNIT73                        N8P2F.                              
      @2363   UNIT74                        N8P2F.                              
      @2371   UNIT75                        N8P2F.                              
      @2379   UNIT76                        N8P2F.                              
      @2387   UNIT77                        N8P2F.                              
      @2395   UNIT78                        N8P2F.                              
      @2403   UNIT79                        N8P2F.                              
      @2411   UNIT80                        N8P2F.                              
      @2419   UNIT81                        N8P2F.                              
      @2427   UNIT82                        N8P2F.                              
      @2435   UNIT83                        N8P2F.                              
      @2443   UNIT84                        N8P2F.                              
      @2451   UNIT85                        N8P2F.                              
      @2459   UNIT86                        N8P2F.                              
      @2467   UNIT87                        N8P2F.                              
      @2475   UNIT88                        N8P2F.                              
      @2483   UNIT89                        N8P2F.                              
      @2491   UNIT90                        N8P2F.                              
      @2499   UNIT91                        N8P2F.                              
      @2507   UNIT92                        N8P2F.                              
      @2515   UNIT93                        N8P2F.                              
      @2523   UNIT94                        N8P2F.                              
      @2531   UNIT95                        N8P2F.                              
      @2539   UNIT96                        N8P2F.                              
      @2547   UNIT97                        N8P2F.                              
      @2555   UNIT98                        N8P2F.                              
      @2563   UNIT99                        N8P2F.                              
      @2571   UNIT100                       N8P2F.                              
      @2579   UNIT101                       N8P2F.                              
      @2587   UNIT102                       N8P2F.                              
      @2595   UNIT103                       N8P2F.                              
      @2603   UNIT104                       N8P2F.                              
      @2611   UNIT105                       N8P2F.                              
      @2619   UNIT106                       N8P2F.                              
      @2627   UNIT107                       N8P2F.                              
      @2635   UNIT108                       N8P2F.                              
      @2643   UNIT109                       N8P2F.                              
      @2651   UNIT110                       N8P2F.                              
      ;                                                                         
                                                                                
                                                                                
RUN;
