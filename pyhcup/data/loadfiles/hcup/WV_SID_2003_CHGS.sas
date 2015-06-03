/*******************************************************************            
*   WV_SID_2003_CHGS.SAS:                                                       
*      THE SAS CODE SHOWN BELOW WILL LOAD THE ASCII                             
*      INPATIENT STAY CHGS FILE INTO SAS                                        
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
DATA WV_SIDC_2003_CHGS;                                                         
INFILE 'WV_SID_2003_CHGS.ASC' LRECL = 1958;                                     
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  KEY                LENGTH=8          FORMAT=Z14.                              
  LABEL="HCUP record identifier"                                                
                                                                                
  CHG1               LENGTH=6                                                   
  LABEL="Detailed charges 1 (as received from source)"                          
                                                                                
  CHG2               LENGTH=6                                                   
  LABEL="Detailed charges 2 (as received from source)"                          
                                                                                
  CHG3               LENGTH=6                                                   
  LABEL="Detailed charges 3 (as received from source)"                          
                                                                                
  CHG4               LENGTH=6                                                   
  LABEL="Detailed charges 4 (as received from source)"                          
                                                                                
  CHG5               LENGTH=6                                                   
  LABEL="Detailed charges 5 (as received from source)"                          
                                                                                
  CHG6               LENGTH=6                                                   
  LABEL="Detailed charges 6 (as received from source)"                          
                                                                                
  CHG7               LENGTH=6                                                   
  LABEL="Detailed charges 7 (as received from source)"                          
                                                                                
  CHG8               LENGTH=6                                                   
  LABEL="Detailed charges 8 (as received from source)"                          
                                                                                
  CHG9               LENGTH=6                                                   
  LABEL="Detailed charges 9 (as received from source)"                          
                                                                                
  CHG10              LENGTH=6                                                   
  LABEL="Detailed charges 10 (as received from source)"                         
                                                                                
  CHG11              LENGTH=6                                                   
  LABEL="Detailed charges 11 (as received from source)"                         
                                                                                
  CHG12              LENGTH=6                                                   
  LABEL="Detailed charges 12 (as received from source)"                         
                                                                                
  CHG13              LENGTH=6                                                   
  LABEL="Detailed charges 13 (as received from source)"                         
                                                                                
  CHG14              LENGTH=6                                                   
  LABEL="Detailed charges 14 (as received from source)"                         
                                                                                
  CHG15              LENGTH=6                                                   
  LABEL="Detailed charges 15 (as received from source)"                         
                                                                                
  CHG16              LENGTH=6                                                   
  LABEL="Detailed charges 16 (as received from source)"                         
                                                                                
  CHG17              LENGTH=6                                                   
  LABEL="Detailed charges 17 (as received from source)"                         
                                                                                
  CHG18              LENGTH=6                                                   
  LABEL="Detailed charges 18 (as received from source)"                         
                                                                                
  CHG19              LENGTH=6                                                   
  LABEL="Detailed charges 19 (as received from source)"                         
                                                                                
  CHG20              LENGTH=6                                                   
  LABEL="Detailed charges 20 (as received from source)"                         
                                                                                
  CHG21              LENGTH=6                                                   
  LABEL="Detailed charges 21 (as received from source)"                         
                                                                                
  CHG22              LENGTH=6                                                   
  LABEL="Detailed charges 22 (as received from source)"                         
                                                                                
  CHG23              LENGTH=6                                                   
  LABEL="Detailed charges 23 (as received from source)"                         
                                                                                
  CHG24              LENGTH=6                                                   
  LABEL="Detailed charges 24 (as received from source)"                         
                                                                                
  CHG25              LENGTH=6                                                   
  LABEL="Detailed charges 25 (as received from source)"                         
                                                                                
  CHG26              LENGTH=6                                                   
  LABEL="Detailed charges 26 (as received from source)"                         
                                                                                
  CHG27              LENGTH=6                                                   
  LABEL="Detailed charges 27 (as received from source)"                         
                                                                                
  CHG28              LENGTH=6                                                   
  LABEL="Detailed charges 28 (as received from source)"                         
                                                                                
  CHG29              LENGTH=6                                                   
  LABEL="Detailed charges 29 (as received from source)"                         
                                                                                
  CHG30              LENGTH=6                                                   
  LABEL="Detailed charges 30 (as received from source)"                         
                                                                                
  CHG31              LENGTH=6                                                   
  LABEL="Detailed charges 31 (as received from source)"                         
                                                                                
  CHG32              LENGTH=6                                                   
  LABEL="Detailed charges 32 (as received from source)"                         
                                                                                
  CHG33              LENGTH=6                                                   
  LABEL="Detailed charges 33 (as received from source)"                         
                                                                                
  CHG34              LENGTH=6                                                   
  LABEL="Detailed charges 34 (as received from source)"                         
                                                                                
  CHG35              LENGTH=6                                                   
  LABEL="Detailed charges 35 (as received from source)"                         
                                                                                
  CHG36              LENGTH=6                                                   
  LABEL="Detailed charges 36 (as received from source)"                         
                                                                                
  CHG37              LENGTH=6                                                   
  LABEL="Detailed charges 37 (as received from source)"                         
                                                                                
  CHG38              LENGTH=6                                                   
  LABEL="Detailed charges 38 (as received from source)"                         
                                                                                
  CHG39              LENGTH=6                                                   
  LABEL="Detailed charges 39 (as received from source)"                         
                                                                                
  CHG40              LENGTH=6                                                   
  LABEL="Detailed charges 40 (as received from source)"                         
                                                                                
  CHG41              LENGTH=6                                                   
  LABEL="Detailed charges 41 (as received from source)"                         
                                                                                
  CHG42              LENGTH=6                                                   
  LABEL="Detailed charges 42 (as received from source)"                         
                                                                                
  CHG43              LENGTH=6                                                   
  LABEL="Detailed charges 43 (as received from source)"                         
                                                                                
  CHG44              LENGTH=6                                                   
  LABEL="Detailed charges 44 (as received from source)"                         
                                                                                
  CHG45              LENGTH=6                                                   
  LABEL="Detailed charges 45 (as received from source)"                         
                                                                                
  CHG46              LENGTH=6                                                   
  LABEL="Detailed charges 46 (as received from source)"                         
                                                                                
  CHG47              LENGTH=6                                                   
  LABEL="Detailed charges 47 (as received from source)"                         
                                                                                
  CHG48              LENGTH=6                                                   
  LABEL="Detailed charges 48 (as received from source)"                         
                                                                                
  CHG49              LENGTH=6                                                   
  LABEL="Detailed charges 49 (as received from source)"                         
                                                                                
  CHG50              LENGTH=6                                                   
  LABEL="Detailed charges 50 (as received from source)"                         
                                                                                
  CHG51              LENGTH=6                                                   
  LABEL="Detailed charges 51 (as received from source)"                         
                                                                                
  CHG52              LENGTH=6                                                   
  LABEL="Detailed charges 52 (as received from source)"                         
                                                                                
  CHG53              LENGTH=6                                                   
  LABEL="Detailed charges 53 (as received from source)"                         
                                                                                
  CHG54              LENGTH=6                                                   
  LABEL="Detailed charges 54 (as received from source)"                         
                                                                                
  CHG55              LENGTH=6                                                   
  LABEL="Detailed charges 55 (as received from source)"                         
                                                                                
  CHG56              LENGTH=6                                                   
  LABEL="Detailed charges 56 (as received from source)"                         
                                                                                
  CHG57              LENGTH=6                                                   
  LABEL="Detailed charges 57 (as received from source)"                         
                                                                                
  CHG58              LENGTH=6                                                   
  LABEL="Detailed charges 58 (as received from source)"                         
                                                                                
  CHG59              LENGTH=6                                                   
  LABEL="Detailed charges 59 (as received from source)"                         
                                                                                
  CHG60              LENGTH=6                                                   
  LABEL="Detailed charges 60 (as received from source)"                         
                                                                                
  CHG61              LENGTH=6                                                   
  LABEL="Detailed charges 61 (as received from source)"                         
                                                                                
  CHG62              LENGTH=6                                                   
  LABEL="Detailed charges 62 (as received from source)"                         
                                                                                
  CHG63              LENGTH=6                                                   
  LABEL="Detailed charges 63 (as received from source)"                         
                                                                                
  CHG64              LENGTH=6                                                   
  LABEL="Detailed charges 64 (as received from source)"                         
                                                                                
  CHG65              LENGTH=6                                                   
  LABEL="Detailed charges 65 (as received from source)"                         
                                                                                
  CHG66              LENGTH=6                                                   
  LABEL="Detailed charges 66 (as received from source)"                         
                                                                                
  CHG67              LENGTH=6                                                   
  LABEL="Detailed charges 67 (as received from source)"                         
                                                                                
  CHG68              LENGTH=6                                                   
  LABEL="Detailed charges 68 (as received from source)"                         
                                                                                
  CHG69              LENGTH=6                                                   
  LABEL="Detailed charges 69 (as received from source)"                         
                                                                                
  CHG70              LENGTH=6                                                   
  LABEL="Detailed charges 70 (as received from source)"                         
                                                                                
  CHG71              LENGTH=6                                                   
  LABEL="Detailed charges 71 (as received from source)"                         
                                                                                
  CHG72              LENGTH=6                                                   
  LABEL="Detailed charges 72 (as received from source)"                         
                                                                                
  CHG73              LENGTH=6                                                   
  LABEL="Detailed charges 73 (as received from source)"                         
                                                                                
  CHG74              LENGTH=6                                                   
  LABEL="Detailed charges 74 (as received from source)"                         
                                                                                
  CHG75              LENGTH=6                                                   
  LABEL="Detailed charges 75 (as received from source)"                         
                                                                                
  CHG76              LENGTH=6                                                   
  LABEL="Detailed charges 76 (as received from source)"                         
                                                                                
  CHG77              LENGTH=6                                                   
  LABEL="Detailed charges 77 (as received from source)"                         
                                                                                
  CHG78              LENGTH=6                                                   
  LABEL="Detailed charges 78 (as received from source)"                         
                                                                                
  CHG79              LENGTH=6                                                   
  LABEL="Detailed charges 79 (as received from source)"                         
                                                                                
  CHG80              LENGTH=6                                                   
  LABEL="Detailed charges 80 (as received from source)"                         
                                                                                
  CHG81              LENGTH=6                                                   
  LABEL="Detailed charges 81 (as received from source)"                         
                                                                                
  REVCD1             LENGTH=$4                                                  
  LABEL="Revenue code 1 (as received from source)"                              
                                                                                
  REVCD2             LENGTH=$4                                                  
  LABEL="Revenue code 2 (as received from source)"                              
                                                                                
  REVCD3             LENGTH=$4                                                  
  LABEL="Revenue code 3 (as received from source)"                              
                                                                                
  REVCD4             LENGTH=$4                                                  
  LABEL="Revenue code 4 (as received from source)"                              
                                                                                
  REVCD5             LENGTH=$4                                                  
  LABEL="Revenue code 5 (as received from source)"                              
                                                                                
  REVCD6             LENGTH=$4                                                  
  LABEL="Revenue code 6 (as received from source)"                              
                                                                                
  REVCD7             LENGTH=$4                                                  
  LABEL="Revenue code 7 (as received from source)"                              
                                                                                
  REVCD8             LENGTH=$4                                                  
  LABEL="Revenue code 8 (as received from source)"                              
                                                                                
  REVCD9             LENGTH=$4                                                  
  LABEL="Revenue code 9 (as received from source)"                              
                                                                                
  REVCD10            LENGTH=$4                                                  
  LABEL="Revenue code 10 (as received from source)"                             
                                                                                
  REVCD11            LENGTH=$4                                                  
  LABEL="Revenue code 11 (as received from source)"                             
                                                                                
  REVCD12            LENGTH=$4                                                  
  LABEL="Revenue code 12 (as received from source)"                             
                                                                                
  REVCD13            LENGTH=$4                                                  
  LABEL="Revenue code 13 (as received from source)"                             
                                                                                
  REVCD14            LENGTH=$4                                                  
  LABEL="Revenue code 14 (as received from source)"                             
                                                                                
  REVCD15            LENGTH=$4                                                  
  LABEL="Revenue code 15 (as received from source)"                             
                                                                                
  REVCD16            LENGTH=$4                                                  
  LABEL="Revenue code 16 (as received from source)"                             
                                                                                
  REVCD17            LENGTH=$4                                                  
  LABEL="Revenue code 17 (as received from source)"                             
                                                                                
  REVCD18            LENGTH=$4                                                  
  LABEL="Revenue code 18 (as received from source)"                             
                                                                                
  REVCD19            LENGTH=$4                                                  
  LABEL="Revenue code 19 (as received from source)"                             
                                                                                
  REVCD20            LENGTH=$4                                                  
  LABEL="Revenue code 20 (as received from source)"                             
                                                                                
  REVCD21            LENGTH=$4                                                  
  LABEL="Revenue code 21 (as received from source)"                             
                                                                                
  REVCD22            LENGTH=$4                                                  
  LABEL="Revenue code 22 (as received from source)"                             
                                                                                
  REVCD23            LENGTH=$4                                                  
  LABEL="Revenue code 23 (as received from source)"                             
                                                                                
  REVCD24            LENGTH=$4                                                  
  LABEL="Revenue code 24 (as received from source)"                             
                                                                                
  REVCD25            LENGTH=$4                                                  
  LABEL="Revenue code 25 (as received from source)"                             
                                                                                
  REVCD26            LENGTH=$4                                                  
  LABEL="Revenue code 26 (as received from source)"                             
                                                                                
  REVCD27            LENGTH=$4                                                  
  LABEL="Revenue code 27 (as received from source)"                             
                                                                                
  REVCD28            LENGTH=$4                                                  
  LABEL="Revenue code 28 (as received from source)"                             
                                                                                
  REVCD29            LENGTH=$4                                                  
  LABEL="Revenue code 29 (as received from source)"                             
                                                                                
  REVCD30            LENGTH=$4                                                  
  LABEL="Revenue code 30 (as received from source)"                             
                                                                                
  REVCD31            LENGTH=$4                                                  
  LABEL="Revenue code 31 (as received from source)"                             
                                                                                
  REVCD32            LENGTH=$4                                                  
  LABEL="Revenue code 32 (as received from source)"                             
                                                                                
  REVCD33            LENGTH=$4                                                  
  LABEL="Revenue code 33 (as received from source)"                             
                                                                                
  REVCD34            LENGTH=$4                                                  
  LABEL="Revenue code 34 (as received from source)"                             
                                                                                
  REVCD35            LENGTH=$4                                                  
  LABEL="Revenue code 35 (as received from source)"                             
                                                                                
  REVCD36            LENGTH=$4                                                  
  LABEL="Revenue code 36 (as received from source)"                             
                                                                                
  REVCD37            LENGTH=$4                                                  
  LABEL="Revenue code 37 (as received from source)"                             
                                                                                
  REVCD38            LENGTH=$4                                                  
  LABEL="Revenue code 38 (as received from source)"                             
                                                                                
  REVCD39            LENGTH=$4                                                  
  LABEL="Revenue code 39 (as received from source)"                             
                                                                                
  REVCD40            LENGTH=$4                                                  
  LABEL="Revenue code 40 (as received from source)"                             
                                                                                
  REVCD41            LENGTH=$4                                                  
  LABEL="Revenue code 41 (as received from source)"                             
                                                                                
  REVCD42            LENGTH=$4                                                  
  LABEL="Revenue code 42 (as received from source)"                             
                                                                                
  REVCD43            LENGTH=$4                                                  
  LABEL="Revenue code 43 (as received from source)"                             
                                                                                
  REVCD44            LENGTH=$4                                                  
  LABEL="Revenue code 44 (as received from source)"                             
                                                                                
  REVCD45            LENGTH=$4                                                  
  LABEL="Revenue code 45 (as received from source)"                             
                                                                                
  REVCD46            LENGTH=$4                                                  
  LABEL="Revenue code 46 (as received from source)"                             
                                                                                
  REVCD47            LENGTH=$4                                                  
  LABEL="Revenue code 47 (as received from source)"                             
                                                                                
  REVCD48            LENGTH=$4                                                  
  LABEL="Revenue code 48 (as received from source)"                             
                                                                                
  REVCD49            LENGTH=$4                                                  
  LABEL="Revenue code 49 (as received from source)"                             
                                                                                
  REVCD50            LENGTH=$4                                                  
  LABEL="Revenue code 50 (as received from source)"                             
                                                                                
  REVCD51            LENGTH=$4                                                  
  LABEL="Revenue code 51 (as received from source)"                             
                                                                                
  REVCD52            LENGTH=$4                                                  
  LABEL="Revenue code 52 (as received from source)"                             
                                                                                
  REVCD53            LENGTH=$4                                                  
  LABEL="Revenue code 53 (as received from source)"                             
                                                                                
  REVCD54            LENGTH=$4                                                  
  LABEL="Revenue code 54 (as received from source)"                             
                                                                                
  REVCD55            LENGTH=$4                                                  
  LABEL="Revenue code 55 (as received from source)"                             
                                                                                
  REVCD56            LENGTH=$4                                                  
  LABEL="Revenue code 56 (as received from source)"                             
                                                                                
  REVCD57            LENGTH=$4                                                  
  LABEL="Revenue code 57 (as received from source)"                             
                                                                                
  REVCD58            LENGTH=$4                                                  
  LABEL="Revenue code 58 (as received from source)"                             
                                                                                
  REVCD59            LENGTH=$4                                                  
  LABEL="Revenue code 59 (as received from source)"                             
                                                                                
  REVCD60            LENGTH=$4                                                  
  LABEL="Revenue code 60 (as received from source)"                             
                                                                                
  REVCD61            LENGTH=$4                                                  
  LABEL="Revenue code 61 (as received from source)"                             
                                                                                
  REVCD62            LENGTH=$4                                                  
  LABEL="Revenue code 62 (as received from source)"                             
                                                                                
  REVCD63            LENGTH=$4                                                  
  LABEL="Revenue code 63 (as received from source)"                             
                                                                                
  REVCD64            LENGTH=$4                                                  
  LABEL="Revenue code 64 (as received from source)"                             
                                                                                
  REVCD65            LENGTH=$4                                                  
  LABEL="Revenue code 65 (as received from source)"                             
                                                                                
  REVCD66            LENGTH=$4                                                  
  LABEL="Revenue code 66 (as received from source)"                             
                                                                                
  REVCD67            LENGTH=$4                                                  
  LABEL="Revenue code 67 (as received from source)"                             
                                                                                
  REVCD68            LENGTH=$4                                                  
  LABEL="Revenue code 68 (as received from source)"                             
                                                                                
  REVCD69            LENGTH=$4                                                  
  LABEL="Revenue code 69 (as received from source)"                             
                                                                                
  REVCD70            LENGTH=$4                                                  
  LABEL="Revenue code 70 (as received from source)"                             
                                                                                
  REVCD71            LENGTH=$4                                                  
  LABEL="Revenue code 71 (as received from source)"                             
                                                                                
  REVCD72            LENGTH=$4                                                  
  LABEL="Revenue code 72 (as received from source)"                             
                                                                                
  REVCD73            LENGTH=$4                                                  
  LABEL="Revenue code 73 (as received from source)"                             
                                                                                
  REVCD74            LENGTH=$4                                                  
  LABEL="Revenue code 74 (as received from source)"                             
                                                                                
  REVCD75            LENGTH=$4                                                  
  LABEL="Revenue code 75 (as received from source)"                             
                                                                                
  REVCD76            LENGTH=$4                                                  
  LABEL="Revenue code 76 (as received from source)"                             
                                                                                
  REVCD77            LENGTH=$4                                                  
  LABEL="Revenue code 77 (as received from source)"                             
                                                                                
  REVCD78            LENGTH=$4                                                  
  LABEL="Revenue code 78 (as received from source)"                             
                                                                                
  REVCD79            LENGTH=$4                                                  
  LABEL="Revenue code 79 (as received from source)"                             
                                                                                
  REVCD80            LENGTH=$4                                                  
  LABEL="Revenue code 80 (as received from source)"                             
                                                                                
  REVCD81            LENGTH=$4                                                  
  LABEL="Revenue code 81 (as received from source)"                             
                                                                                
  UNIT1              LENGTH=4                                                   
  LABEL="Units of service 1 (as received from source)"                          
                                                                                
  UNIT2              LENGTH=4                                                   
  LABEL="Units of service 2 (as received from source)"                          
                                                                                
  UNIT3              LENGTH=4                                                   
  LABEL="Units of service 3 (as received from source)"                          
                                                                                
  UNIT4              LENGTH=4                                                   
  LABEL="Units of service 4 (as received from source)"                          
                                                                                
  UNIT5              LENGTH=4                                                   
  LABEL="Units of service 5 (as received from source)"                          
                                                                                
  UNIT6              LENGTH=4                                                   
  LABEL="Units of service 6 (as received from source)"                          
                                                                                
  UNIT7              LENGTH=4                                                   
  LABEL="Units of service 7 (as received from source)"                          
                                                                                
  UNIT8              LENGTH=4                                                   
  LABEL="Units of service 8 (as received from source)"                          
                                                                                
  UNIT9              LENGTH=4                                                   
  LABEL="Units of service 9 (as received from source)"                          
                                                                                
  UNIT10             LENGTH=4                                                   
  LABEL="Units of service 10 (as received from source)"                         
                                                                                
  UNIT11             LENGTH=4                                                   
  LABEL="Units of service 11 (as received from source)"                         
                                                                                
  UNIT12             LENGTH=4                                                   
  LABEL="Units of service 12 (as received from source)"                         
                                                                                
  UNIT13             LENGTH=4                                                   
  LABEL="Units of service 13 (as received from source)"                         
                                                                                
  UNIT14             LENGTH=4                                                   
  LABEL="Units of service 14 (as received from source)"                         
                                                                                
  UNIT15             LENGTH=4                                                   
  LABEL="Units of service 15 (as received from source)"                         
                                                                                
  UNIT16             LENGTH=4                                                   
  LABEL="Units of service 16 (as received from source)"                         
                                                                                
  UNIT17             LENGTH=4                                                   
  LABEL="Units of service 17 (as received from source)"                         
                                                                                
  UNIT18             LENGTH=4                                                   
  LABEL="Units of service 18 (as received from source)"                         
                                                                                
  UNIT19             LENGTH=4                                                   
  LABEL="Units of service 19 (as received from source)"                         
                                                                                
  UNIT20             LENGTH=4                                                   
  LABEL="Units of service 20 (as received from source)"                         
                                                                                
  UNIT21             LENGTH=4                                                   
  LABEL="Units of service 21 (as received from source)"                         
                                                                                
  UNIT22             LENGTH=4                                                   
  LABEL="Units of service 22 (as received from source)"                         
                                                                                
  UNIT23             LENGTH=4                                                   
  LABEL="Units of service 23 (as received from source)"                         
                                                                                
  UNIT24             LENGTH=4                                                   
  LABEL="Units of service 24 (as received from source)"                         
                                                                                
  UNIT25             LENGTH=4                                                   
  LABEL="Units of service 25 (as received from source)"                         
                                                                                
  UNIT26             LENGTH=4                                                   
  LABEL="Units of service 26 (as received from source)"                         
                                                                                
  UNIT27             LENGTH=4                                                   
  LABEL="Units of service 27 (as received from source)"                         
                                                                                
  UNIT28             LENGTH=4                                                   
  LABEL="Units of service 28 (as received from source)"                         
                                                                                
  UNIT29             LENGTH=4                                                   
  LABEL="Units of service 29 (as received from source)"                         
                                                                                
  UNIT30             LENGTH=4                                                   
  LABEL="Units of service 30 (as received from source)"                         
                                                                                
  UNIT31             LENGTH=4                                                   
  LABEL="Units of service 31 (as received from source)"                         
                                                                                
  UNIT32             LENGTH=4                                                   
  LABEL="Units of service 32 (as received from source)"                         
                                                                                
  UNIT33             LENGTH=4                                                   
  LABEL="Units of service 33 (as received from source)"                         
                                                                                
  UNIT34             LENGTH=4                                                   
  LABEL="Units of service 34 (as received from source)"                         
                                                                                
  UNIT35             LENGTH=4                                                   
  LABEL="Units of service 35 (as received from source)"                         
                                                                                
  UNIT36             LENGTH=4                                                   
  LABEL="Units of service 36 (as received from source)"                         
                                                                                
  UNIT37             LENGTH=4                                                   
  LABEL="Units of service 37 (as received from source)"                         
                                                                                
  UNIT38             LENGTH=4                                                   
  LABEL="Units of service 38 (as received from source)"                         
                                                                                
  UNIT39             LENGTH=4                                                   
  LABEL="Units of service 39 (as received from source)"                         
                                                                                
  UNIT40             LENGTH=4                                                   
  LABEL="Units of service 40 (as received from source)"                         
                                                                                
  UNIT41             LENGTH=4                                                   
  LABEL="Units of service 41 (as received from source)"                         
                                                                                
  UNIT42             LENGTH=4                                                   
  LABEL="Units of service 42 (as received from source)"                         
                                                                                
  UNIT43             LENGTH=4                                                   
  LABEL="Units of service 43 (as received from source)"                         
                                                                                
  UNIT44             LENGTH=4                                                   
  LABEL="Units of service 44 (as received from source)"                         
                                                                                
  UNIT45             LENGTH=4                                                   
  LABEL="Units of service 45 (as received from source)"                         
                                                                                
  UNIT46             LENGTH=4                                                   
  LABEL="Units of service 46 (as received from source)"                         
                                                                                
  UNIT47             LENGTH=4                                                   
  LABEL="Units of service 47 (as received from source)"                         
                                                                                
  UNIT48             LENGTH=4                                                   
  LABEL="Units of service 48 (as received from source)"                         
                                                                                
  UNIT49             LENGTH=4                                                   
  LABEL="Units of service 49 (as received from source)"                         
                                                                                
  UNIT50             LENGTH=4                                                   
  LABEL="Units of service 50 (as received from source)"                         
                                                                                
  UNIT51             LENGTH=4                                                   
  LABEL="Units of service 51 (as received from source)"                         
                                                                                
  UNIT52             LENGTH=4                                                   
  LABEL="Units of service 52 (as received from source)"                         
                                                                                
  UNIT53             LENGTH=4                                                   
  LABEL="Units of service 53 (as received from source)"                         
                                                                                
  UNIT54             LENGTH=4                                                   
  LABEL="Units of service 54 (as received from source)"                         
                                                                                
  UNIT55             LENGTH=4                                                   
  LABEL="Units of service 55 (as received from source)"                         
                                                                                
  UNIT56             LENGTH=4                                                   
  LABEL="Units of service 56 (as received from source)"                         
                                                                                
  UNIT57             LENGTH=4                                                   
  LABEL="Units of service 57 (as received from source)"                         
                                                                                
  UNIT58             LENGTH=4                                                   
  LABEL="Units of service 58 (as received from source)"                         
                                                                                
  UNIT59             LENGTH=4                                                   
  LABEL="Units of service 59 (as received from source)"                         
                                                                                
  UNIT60             LENGTH=4                                                   
  LABEL="Units of service 60 (as received from source)"                         
                                                                                
  UNIT61             LENGTH=4                                                   
  LABEL="Units of service 61 (as received from source)"                         
                                                                                
  UNIT62             LENGTH=4                                                   
  LABEL="Units of service 62 (as received from source)"                         
                                                                                
  UNIT63             LENGTH=4                                                   
  LABEL="Units of service 63 (as received from source)"                         
                                                                                
  UNIT64             LENGTH=4                                                   
  LABEL="Units of service 64 (as received from source)"                         
                                                                                
  UNIT65             LENGTH=4                                                   
  LABEL="Units of service 65 (as received from source)"                         
                                                                                
  UNIT66             LENGTH=4                                                   
  LABEL="Units of service 66 (as received from source)"                         
                                                                                
  UNIT67             LENGTH=4                                                   
  LABEL="Units of service 67 (as received from source)"                         
                                                                                
  UNIT68             LENGTH=4                                                   
  LABEL="Units of service 68 (as received from source)"                         
                                                                                
  UNIT69             LENGTH=4                                                   
  LABEL="Units of service 69 (as received from source)"                         
                                                                                
  UNIT70             LENGTH=4                                                   
  LABEL="Units of service 70 (as received from source)"                         
                                                                                
  UNIT71             LENGTH=4                                                   
  LABEL="Units of service 71 (as received from source)"                         
                                                                                
  UNIT72             LENGTH=4                                                   
  LABEL="Units of service 72 (as received from source)"                         
                                                                                
  UNIT73             LENGTH=4                                                   
  LABEL="Units of service 73 (as received from source)"                         
                                                                                
  UNIT74             LENGTH=4                                                   
  LABEL="Units of service 74 (as received from source)"                         
                                                                                
  UNIT75             LENGTH=4                                                   
  LABEL="Units of service 75 (as received from source)"                         
                                                                                
  UNIT76             LENGTH=4                                                   
  LABEL="Units of service 76 (as received from source)"                         
                                                                                
  UNIT77             LENGTH=4                                                   
  LABEL="Units of service 77 (as received from source)"                         
                                                                                
  UNIT78             LENGTH=4                                                   
  LABEL="Units of service 78 (as received from source)"                         
                                                                                
  UNIT79             LENGTH=4                                                   
  LABEL="Units of service 79 (as received from source)"                         
                                                                                
  UNIT80             LENGTH=4                                                   
  LABEL="Units of service 80 (as received from source)"                         
                                                                                
  UNIT81             LENGTH=4                                                   
  LABEL="Units of service 81 (as received from source)"                         
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      KEY                 14.                                           
      @15     CHG1                N12P2F.                                       
      @27     CHG2                N12P2F.                                       
      @39     CHG3                N12P2F.                                       
      @51     CHG4                N12P2F.                                       
      @63     CHG5                N12P2F.                                       
      @75     CHG6                N12P2F.                                       
      @87     CHG7                N12P2F.                                       
      @99     CHG8                N12P2F.                                       
      @111    CHG9                N12P2F.                                       
      @123    CHG10               N12P2F.                                       
      @135    CHG11               N12P2F.                                       
      @147    CHG12               N12P2F.                                       
      @159    CHG13               N12P2F.                                       
      @171    CHG14               N12P2F.                                       
      @183    CHG15               N12P2F.                                       
      @195    CHG16               N12P2F.                                       
      @207    CHG17               N12P2F.                                       
      @219    CHG18               N12P2F.                                       
      @231    CHG19               N12P2F.                                       
      @243    CHG20               N12P2F.                                       
      @255    CHG21               N12P2F.                                       
      @267    CHG22               N12P2F.                                       
      @279    CHG23               N12P2F.                                       
      @291    CHG24               N12P2F.                                       
      @303    CHG25               N12P2F.                                       
      @315    CHG26               N12P2F.                                       
      @327    CHG27               N12P2F.                                       
      @339    CHG28               N12P2F.                                       
      @351    CHG29               N12P2F.                                       
      @363    CHG30               N12P2F.                                       
      @375    CHG31               N12P2F.                                       
      @387    CHG32               N12P2F.                                       
      @399    CHG33               N12P2F.                                       
      @411    CHG34               N12P2F.                                       
      @423    CHG35               N12P2F.                                       
      @435    CHG36               N12P2F.                                       
      @447    CHG37               N12P2F.                                       
      @459    CHG38               N12P2F.                                       
      @471    CHG39               N12P2F.                                       
      @483    CHG40               N12P2F.                                       
      @495    CHG41               N12P2F.                                       
      @507    CHG42               N12P2F.                                       
      @519    CHG43               N12P2F.                                       
      @531    CHG44               N12P2F.                                       
      @543    CHG45               N12P2F.                                       
      @555    CHG46               N12P2F.                                       
      @567    CHG47               N12P2F.                                       
      @579    CHG48               N12P2F.                                       
      @591    CHG49               N12P2F.                                       
      @603    CHG50               N12P2F.                                       
      @615    CHG51               N12P2F.                                       
      @627    CHG52               N12P2F.                                       
      @639    CHG53               N12P2F.                                       
      @651    CHG54               N12P2F.                                       
      @663    CHG55               N12P2F.                                       
      @675    CHG56               N12P2F.                                       
      @687    CHG57               N12P2F.                                       
      @699    CHG58               N12P2F.                                       
      @711    CHG59               N12P2F.                                       
      @723    CHG60               N12P2F.                                       
      @735    CHG61               N12P2F.                                       
      @747    CHG62               N12P2F.                                       
      @759    CHG63               N12P2F.                                       
      @771    CHG64               N12P2F.                                       
      @783    CHG65               N12P2F.                                       
      @795    CHG66               N12P2F.                                       
      @807    CHG67               N12P2F.                                       
      @819    CHG68               N12P2F.                                       
      @831    CHG69               N12P2F.                                       
      @843    CHG70               N12P2F.                                       
      @855    CHG71               N12P2F.                                       
      @867    CHG72               N12P2F.                                       
      @879    CHG73               N12P2F.                                       
      @891    CHG74               N12P2F.                                       
      @903    CHG75               N12P2F.                                       
      @915    CHG76               N12P2F.                                       
      @927    CHG77               N12P2F.                                       
      @939    CHG78               N12P2F.                                       
      @951    CHG79               N12P2F.                                       
      @963    CHG80               N12P2F.                                       
      @975    CHG81               N12P2F.                                       
      @987    REVCD1              $CHAR4.                                       
      @991    REVCD2              $CHAR4.                                       
      @995    REVCD3              $CHAR4.                                       
      @999    REVCD4              $CHAR4.                                       
      @1003   REVCD5              $CHAR4.                                       
      @1007   REVCD6              $CHAR4.                                       
      @1011   REVCD7              $CHAR4.                                       
      @1015   REVCD8              $CHAR4.                                       
      @1019   REVCD9              $CHAR4.                                       
      @1023   REVCD10             $CHAR4.                                       
      @1027   REVCD11             $CHAR4.                                       
      @1031   REVCD12             $CHAR4.                                       
      @1035   REVCD13             $CHAR4.                                       
      @1039   REVCD14             $CHAR4.                                       
      @1043   REVCD15             $CHAR4.                                       
      @1047   REVCD16             $CHAR4.                                       
      @1051   REVCD17             $CHAR4.                                       
      @1055   REVCD18             $CHAR4.                                       
      @1059   REVCD19             $CHAR4.                                       
      @1063   REVCD20             $CHAR4.                                       
      @1067   REVCD21             $CHAR4.                                       
      @1071   REVCD22             $CHAR4.                                       
      @1075   REVCD23             $CHAR4.                                       
      @1079   REVCD24             $CHAR4.                                       
      @1083   REVCD25             $CHAR4.                                       
      @1087   REVCD26             $CHAR4.                                       
      @1091   REVCD27             $CHAR4.                                       
      @1095   REVCD28             $CHAR4.                                       
      @1099   REVCD29             $CHAR4.                                       
      @1103   REVCD30             $CHAR4.                                       
      @1107   REVCD31             $CHAR4.                                       
      @1111   REVCD32             $CHAR4.                                       
      @1115   REVCD33             $CHAR4.                                       
      @1119   REVCD34             $CHAR4.                                       
      @1123   REVCD35             $CHAR4.                                       
      @1127   REVCD36             $CHAR4.                                       
      @1131   REVCD37             $CHAR4.                                       
      @1135   REVCD38             $CHAR4.                                       
      @1139   REVCD39             $CHAR4.                                       
      @1143   REVCD40             $CHAR4.                                       
      @1147   REVCD41             $CHAR4.                                       
      @1151   REVCD42             $CHAR4.                                       
      @1155   REVCD43             $CHAR4.                                       
      @1159   REVCD44             $CHAR4.                                       
      @1163   REVCD45             $CHAR4.                                       
      @1167   REVCD46             $CHAR4.                                       
      @1171   REVCD47             $CHAR4.                                       
      @1175   REVCD48             $CHAR4.                                       
      @1179   REVCD49             $CHAR4.                                       
      @1183   REVCD50             $CHAR4.                                       
      @1187   REVCD51             $CHAR4.                                       
      @1191   REVCD52             $CHAR4.                                       
      @1195   REVCD53             $CHAR4.                                       
      @1199   REVCD54             $CHAR4.                                       
      @1203   REVCD55             $CHAR4.                                       
      @1207   REVCD56             $CHAR4.                                       
      @1211   REVCD57             $CHAR4.                                       
      @1215   REVCD58             $CHAR4.                                       
      @1219   REVCD59             $CHAR4.                                       
      @1223   REVCD60             $CHAR4.                                       
      @1227   REVCD61             $CHAR4.                                       
      @1231   REVCD62             $CHAR4.                                       
      @1235   REVCD63             $CHAR4.                                       
      @1239   REVCD64             $CHAR4.                                       
      @1243   REVCD65             $CHAR4.                                       
      @1247   REVCD66             $CHAR4.                                       
      @1251   REVCD67             $CHAR4.                                       
      @1255   REVCD68             $CHAR4.                                       
      @1259   REVCD69             $CHAR4.                                       
      @1263   REVCD70             $CHAR4.                                       
      @1267   REVCD71             $CHAR4.                                       
      @1271   REVCD72             $CHAR4.                                       
      @1275   REVCD73             $CHAR4.                                       
      @1279   REVCD74             $CHAR4.                                       
      @1283   REVCD75             $CHAR4.                                       
      @1287   REVCD76             $CHAR4.                                       
      @1291   REVCD77             $CHAR4.                                       
      @1295   REVCD78             $CHAR4.                                       
      @1299   REVCD79             $CHAR4.                                       
      @1303   REVCD80             $CHAR4.                                       
      @1307   REVCD81             $CHAR4.                                       
      @1311   UNIT1               N8PF.                                         
      @1319   UNIT2               N8PF.                                         
      @1327   UNIT3               N8PF.                                         
      @1335   UNIT4               N8PF.                                         
      @1343   UNIT5               N8PF.                                         
      @1351   UNIT6               N8PF.                                         
      @1359   UNIT7               N8PF.                                         
      @1367   UNIT8               N8PF.                                         
      @1375   UNIT9               N8PF.                                         
      @1383   UNIT10              N8PF.                                         
      @1391   UNIT11              N8PF.                                         
      @1399   UNIT12              N8PF.                                         
      @1407   UNIT13              N8PF.                                         
      @1415   UNIT14              N8PF.                                         
      @1423   UNIT15              N8PF.                                         
      @1431   UNIT16              N8PF.                                         
      @1439   UNIT17              N8PF.                                         
      @1447   UNIT18              N8PF.                                         
      @1455   UNIT19              N8PF.                                         
      @1463   UNIT20              N8PF.                                         
      @1471   UNIT21              N8PF.                                         
      @1479   UNIT22              N8PF.                                         
      @1487   UNIT23              N8PF.                                         
      @1495   UNIT24              N8PF.                                         
      @1503   UNIT25              N8PF.                                         
      @1511   UNIT26              N8PF.                                         
      @1519   UNIT27              N8PF.                                         
      @1527   UNIT28              N8PF.                                         
      @1535   UNIT29              N8PF.                                         
      @1543   UNIT30              N8PF.                                         
      @1551   UNIT31              N8PF.                                         
      @1559   UNIT32              N8PF.                                         
      @1567   UNIT33              N8PF.                                         
      @1575   UNIT34              N8PF.                                         
      @1583   UNIT35              N8PF.                                         
      @1591   UNIT36              N8PF.                                         
      @1599   UNIT37              N8PF.                                         
      @1607   UNIT38              N8PF.                                         
      @1615   UNIT39              N8PF.                                         
      @1623   UNIT40              N8PF.                                         
      @1631   UNIT41              N8PF.                                         
      @1639   UNIT42              N8PF.                                         
      @1647   UNIT43              N8PF.                                         
      @1655   UNIT44              N8PF.                                         
      @1663   UNIT45              N8PF.                                         
      @1671   UNIT46              N8PF.                                         
      @1679   UNIT47              N8PF.                                         
      @1687   UNIT48              N8PF.                                         
      @1695   UNIT49              N8PF.                                         
      @1703   UNIT50              N8PF.                                         
      @1711   UNIT51              N8PF.                                         
      @1719   UNIT52              N8PF.                                         
      @1727   UNIT53              N8PF.                                         
      @1735   UNIT54              N8PF.                                         
      @1743   UNIT55              N8PF.                                         
      @1751   UNIT56              N8PF.                                         
      @1759   UNIT57              N8PF.                                         
      @1767   UNIT58              N8PF.                                         
      @1775   UNIT59              N8PF.                                         
      @1783   UNIT60              N8PF.                                         
      @1791   UNIT61              N8PF.                                         
      @1799   UNIT62              N8PF.                                         
      @1807   UNIT63              N8PF.                                         
      @1815   UNIT64              N8PF.                                         
      @1823   UNIT65              N8PF.                                         
      @1831   UNIT66              N8PF.                                         
      @1839   UNIT67              N8PF.                                         
      @1847   UNIT68              N8PF.                                         
      @1855   UNIT69              N8PF.                                         
      @1863   UNIT70              N8PF.                                         
      @1871   UNIT71              N8PF.                                         
      @1879   UNIT72              N8PF.                                         
      @1887   UNIT73              N8PF.                                         
      @1895   UNIT74              N8PF.                                         
      @1903   UNIT75              N8PF.                                         
      @1911   UNIT76              N8PF.                                         
      @1919   UNIT77              N8PF.                                         
      @1927   UNIT78              N8PF.                                         
      @1935   UNIT79              N8PF.                                         
      @1943   UNIT80              N8PF.                                         
      @1951   UNIT81              N8PF.                                         
      ;                                                                         
                                                                                
                                                                                
RUN;
