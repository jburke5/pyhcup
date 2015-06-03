/*******************************************************************            
*   MA_SID_1998_CHGS.SAS:                                                       
*      THE SAS CODE SHOWN BELOW WILL CONVERT THE ASCII                          
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
  INVALUE N8PF                                                                  
    '-9999999' = .                                                              
    '-8888888' = .A                                                             
    '-6666666' = .C                                                             
    OTHER = (|8.|)                                                              
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
DATA MA_SIDC_1998_CHGS;                                                         
INFILE 'MA_SIDC_1998_CHGS.ASC' LRECL = 2214;                                    
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  KEY                LENGTH=8                                                   
  LABEL="HCUP record identifier"                                   FORMAT=Z14.  
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
  CHG82              LENGTH=6                                                   
  LABEL="Detailed charges 82 (as received from source)"                         
  CHG83              LENGTH=6                                                   
  LABEL="Detailed charges 83 (as received from source)"                         
  CHG84              LENGTH=6                                                   
  LABEL="Detailed charges 84 (as received from source)"                         
  CHG85              LENGTH=6                                                   
  LABEL="Detailed charges 85 (as received from source)"                         
  CHG86              LENGTH=6                                                   
  LABEL="Detailed charges 86 (as received from source)"                         
  CHG87              LENGTH=6                                                   
  LABEL="Detailed charges 87 (as received from source)"                         
  CHG88              LENGTH=6                                                   
  LABEL="Detailed charges 88 (as received from source)"                         
  CHG89              LENGTH=6                                                   
  LABEL="Detailed charges 89 (as received from source)"                         
  CHG90              LENGTH=6                                                   
  LABEL="Detailed charges 90 (as received from source)"                         
  CHG91              LENGTH=6                                                   
  LABEL="Detailed charges 91 (as received from source)"                         
  CHG92              LENGTH=6                                                   
  LABEL="Detailed charges 92 (as received from source)"                         
  CHG93              LENGTH=6                                                   
  LABEL="Detailed charges 93 (as received from source)"                         
  CHG94              LENGTH=6                                                   
  LABEL="Detailed charges 94 (as received from source)"                         
  CHG95              LENGTH=6                                                   
  LABEL="Detailed charges 95 (as received from source)"                         
  CHG96              LENGTH=6                                                   
  LABEL="Detailed charges 96 (as received from source)"                         
  CHG97              LENGTH=6                                                   
  LABEL="Detailed charges 97 (as received from source)"                         
  CHG98              LENGTH=6                                                   
  LABEL="Detailed charges 98 (as received from source)"                         
  CHG99              LENGTH=6                                                   
  LABEL="Detailed charges 99 (as received from source)"                         
  CHG100             LENGTH=6                                                   
  LABEL="Detailed charges 100 (as received from source)"                        
  CHG101             LENGTH=6                                                   
  LABEL="Detailed charges 101 (as received from source)"                        
  CHG102             LENGTH=6                                                   
  LABEL="Detailed charges 102 (as received from source)"                        
  CHG103             LENGTH=6                                                   
  LABEL="Detailed charges 103 (as received from source)"                        
  CHG104             LENGTH=6                                                   
  LABEL="Detailed charges 104 (as received from source)"                        
  CHG105             LENGTH=6                                                   
  LABEL="Detailed charges 105 (as received from source)"                        
  CHG106             LENGTH=6                                                   
  LABEL="Detailed charges 106 (as received from source)"                        
  CHG107             LENGTH=6                                                   
  LABEL="Detailed charges 107 (as received from source)"                        
  CHG108             LENGTH=6                                                   
  LABEL="Detailed charges 108 (as received from source)"                        
  CHG109             LENGTH=6                                                   
  LABEL="Detailed charges 109 (as received from source)"                        
  CHG110             LENGTH=6                                                   
  LABEL="Detailed charges 110 (as received from source)"                        
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
  REVCD82            LENGTH=$4                                                  
  LABEL="Revenue code 82 (as received from source)"                             
  REVCD83            LENGTH=$4                                                  
  LABEL="Revenue code 83 (as received from source)"                             
  REVCD84            LENGTH=$4                                                  
  LABEL="Revenue code 84 (as received from source)"                             
  REVCD85            LENGTH=$4                                                  
  LABEL="Revenue code 85 (as received from source)"                             
  REVCD86            LENGTH=$4                                                  
  LABEL="Revenue code 86 (as received from source)"                             
  REVCD87            LENGTH=$4                                                  
  LABEL="Revenue code 87 (as received from source)"                             
  REVCD88            LENGTH=$4                                                  
  LABEL="Revenue code 88 (as received from source)"                             
  REVCD89            LENGTH=$4                                                  
  LABEL="Revenue code 89 (as received from source)"                             
  REVCD90            LENGTH=$4                                                  
  LABEL="Revenue code 90 (as received from source)"                             
  REVCD91            LENGTH=$4                                                  
  LABEL="Revenue code 91 (as received from source)"                             
  REVCD92            LENGTH=$4                                                  
  LABEL="Revenue code 92 (as received from source)"                             
  REVCD93            LENGTH=$4                                                  
  LABEL="Revenue code 93 (as received from source)"                             
  REVCD94            LENGTH=$4                                                  
  LABEL="Revenue code 94 (as received from source)"                             
  REVCD95            LENGTH=$4                                                  
  LABEL="Revenue code 95 (as received from source)"                             
  REVCD96            LENGTH=$4                                                  
  LABEL="Revenue code 96 (as received from source)"                             
  REVCD97            LENGTH=$4                                                  
  LABEL="Revenue code 97 (as received from source)"                             
  REVCD98            LENGTH=$4                                                  
  LABEL="Revenue code 98 (as received from source)"                             
  REVCD99            LENGTH=$4                                                  
  LABEL="Revenue code 99 (as received from source)"                             
  REVCD100           LENGTH=$4                                                  
  LABEL="Revenue code 100 (as received from source)"                            
  REVCD101           LENGTH=$4                                                  
  LABEL="Revenue code 101 (as received from source)"                            
  REVCD102           LENGTH=$4                                                  
  LABEL="Revenue code 102 (as received from source)"                            
  REVCD103           LENGTH=$4                                                  
  LABEL="Revenue code 103 (as received from source)"                            
  REVCD104           LENGTH=$4                                                  
  LABEL="Revenue code 104 (as received from source)"                            
  REVCD105           LENGTH=$4                                                  
  LABEL="Revenue code 105 (as received from source)"                            
  REVCD106           LENGTH=$4                                                  
  LABEL="Revenue code 106 (as received from source)"                            
  REVCD107           LENGTH=$4                                                  
  LABEL="Revenue code 107 (as received from source)"                            
  REVCD108           LENGTH=$4                                                  
  LABEL="Revenue code 108 (as received from source)"                            
  REVCD109           LENGTH=$4                                                  
  LABEL="Revenue code 109 (as received from source)"                            
  REVCD110           LENGTH=$4                                                  
  LABEL="Revenue code 110 (as received from source)"                            
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
  UNIT82             LENGTH=4                                                   
  LABEL="Units of service 82 (as received from source)"                         
  UNIT83             LENGTH=4                                                   
  LABEL="Units of service 83 (as received from source)"                         
  UNIT84             LENGTH=4                                                   
  LABEL="Units of service 84 (as received from source)"                         
  UNIT85             LENGTH=4                                                   
  LABEL="Units of service 85 (as received from source)"                         
  UNIT86             LENGTH=4                                                   
  LABEL="Units of service 86 (as received from source)"                         
  UNIT87             LENGTH=4                                                   
  LABEL="Units of service 87 (as received from source)"                         
  UNIT88             LENGTH=4                                                   
  LABEL="Units of service 88 (as received from source)"                         
  UNIT89             LENGTH=4                                                   
  LABEL="Units of service 89 (as received from source)"                         
  UNIT90             LENGTH=4                                                   
  LABEL="Units of service 90 (as received from source)"                         
  UNIT91             LENGTH=4                                                   
  LABEL="Units of service 91 (as received from source)"                         
  UNIT92             LENGTH=4                                                   
  LABEL="Units of service 92 (as received from source)"                         
  UNIT93             LENGTH=4                                                   
  LABEL="Units of service 93 (as received from source)"                         
  UNIT94             LENGTH=4                                                   
  LABEL="Units of service 94 (as received from source)"                         
  UNIT95             LENGTH=4                                                   
  LABEL="Units of service 95 (as received from source)"                         
  UNIT96             LENGTH=4                                                   
  LABEL="Units of service 96 (as received from source)"                         
  UNIT97             LENGTH=4                                                   
  LABEL="Units of service 97 (as received from source)"                         
  UNIT98             LENGTH=4                                                   
  LABEL="Units of service 98 (as received from source)"                         
  UNIT99             LENGTH=4                                                   
  LABEL="Units of service 99 (as received from source)"                         
  UNIT100            LENGTH=4                                                   
  LABEL="Units of service 100 (as received from source)"                        
  UNIT101            LENGTH=4                                                   
  LABEL="Units of service 101 (as received from source)"                        
  UNIT102            LENGTH=4                                                   
  LABEL="Units of service 102 (as received from source)"                        
  UNIT103            LENGTH=4                                                   
  LABEL="Units of service 103 (as received from source)"                        
  UNIT104            LENGTH=4                                                   
  LABEL="Units of service 104 (as received from source)"                        
  UNIT105            LENGTH=4                                                   
  LABEL="Units of service 105 (as received from source)"                        
  UNIT106            LENGTH=4                                                   
  LABEL="Units of service 106 (as received from source)"                        
  UNIT107            LENGTH=4                                                   
  LABEL="Units of service 107 (as received from source)"                        
  UNIT108            LENGTH=4                                                   
  LABEL="Units of service 108 (as received from source)"                        
  UNIT109            LENGTH=4                                                   
  LABEL="Units of service 109 (as received from source)"                        
  UNIT110            LENGTH=4                                                   
  LABEL="Units of service 110 (as received from source)"                        
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
      @987    CHG82               N12P2F.                                       
      @999    CHG83               N12P2F.                                       
      @1011   CHG84               N12P2F.                                       
      @1023   CHG85               N12P2F.                                       
      @1035   CHG86               N12P2F.                                       
      @1047   CHG87               N12P2F.                                       
      @1059   CHG88               N12P2F.                                       
      @1071   CHG89               N12P2F.                                       
      @1083   CHG90               N12P2F.                                       
      @1095   CHG91               N12P2F.                                       
      @1107   CHG92               N12P2F.                                       
      @1119   CHG93               N12P2F.                                       
      @1131   CHG94               N12P2F.                                       
      @1143   CHG95               N12P2F.                                       
      @1155   CHG96               N12P2F.                                       
      @1167   CHG97               N12P2F.                                       
      @1179   CHG98               N12P2F.                                       
      @1191   CHG99               N12P2F.                                       
      @1203   CHG100              N12P2F.                                       
      @1215   CHG101              N12P2F.                                       
      @1227   CHG102              N12P2F.                                       
      @1239   CHG103              N12P2F.                                       
      @1251   CHG104              N12P2F.                                       
      @1263   CHG105              N12P2F.                                       
      @1275   CHG106              N12P2F.                                       
      @1287   CHG107              N12P2F.                                       
      @1299   CHG108              N12P2F.                                       
      @1311   CHG109              N12P2F.                                       
      @1323   CHG110              N12P2F.                                       
      @1335   REVCD1              $CHAR4.                                       
      @1339   REVCD2              $CHAR4.                                       
      @1343   REVCD3              $CHAR4.                                       
      @1347   REVCD4              $CHAR4.                                       
      @1351   REVCD5              $CHAR4.                                       
      @1355   REVCD6              $CHAR4.                                       
      @1359   REVCD7              $CHAR4.                                       
      @1363   REVCD8              $CHAR4.                                       
      @1367   REVCD9              $CHAR4.                                       
      @1371   REVCD10             $CHAR4.                                       
      @1375   REVCD11             $CHAR4.                                       
      @1379   REVCD12             $CHAR4.                                       
      @1383   REVCD13             $CHAR4.                                       
      @1387   REVCD14             $CHAR4.                                       
      @1391   REVCD15             $CHAR4.                                       
      @1395   REVCD16             $CHAR4.                                       
      @1399   REVCD17             $CHAR4.                                       
      @1403   REVCD18             $CHAR4.                                       
      @1407   REVCD19             $CHAR4.                                       
      @1411   REVCD20             $CHAR4.                                       
      @1415   REVCD21             $CHAR4.                                       
      @1419   REVCD22             $CHAR4.                                       
      @1423   REVCD23             $CHAR4.                                       
      @1427   REVCD24             $CHAR4.                                       
      @1431   REVCD25             $CHAR4.                                       
      @1435   REVCD26             $CHAR4.                                       
      @1439   REVCD27             $CHAR4.                                       
      @1443   REVCD28             $CHAR4.                                       
      @1447   REVCD29             $CHAR4.                                       
      @1451   REVCD30             $CHAR4.                                       
      @1455   REVCD31             $CHAR4.                                       
      @1459   REVCD32             $CHAR4.                                       
      @1463   REVCD33             $CHAR4.                                       
      @1467   REVCD34             $CHAR4.                                       
      @1471   REVCD35             $CHAR4.                                       
      @1475   REVCD36             $CHAR4.                                       
      @1479   REVCD37             $CHAR4.                                       
      @1483   REVCD38             $CHAR4.                                       
      @1487   REVCD39             $CHAR4.                                       
      @1491   REVCD40             $CHAR4.                                       
      @1495   REVCD41             $CHAR4.                                       
      @1499   REVCD42             $CHAR4.                                       
      @1503   REVCD43             $CHAR4.                                       
      @1507   REVCD44             $CHAR4.                                       
      @1511   REVCD45             $CHAR4.                                       
      @1515   REVCD46             $CHAR4.                                       
      @1519   REVCD47             $CHAR4.                                       
      @1523   REVCD48             $CHAR4.                                       
      @1527   REVCD49             $CHAR4.                                       
      @1531   REVCD50             $CHAR4.                                       
      @1535   REVCD51             $CHAR4.                                       
      @1539   REVCD52             $CHAR4.                                       
      @1543   REVCD53             $CHAR4.                                       
      @1547   REVCD54             $CHAR4.                                       
      @1551   REVCD55             $CHAR4.                                       
      @1555   REVCD56             $CHAR4.                                       
      @1559   REVCD57             $CHAR4.                                       
      @1563   REVCD58             $CHAR4.                                       
      @1567   REVCD59             $CHAR4.                                       
      @1571   REVCD60             $CHAR4.                                       
      @1575   REVCD61             $CHAR4.                                       
      @1579   REVCD62             $CHAR4.                                       
      @1583   REVCD63             $CHAR4.                                       
      @1587   REVCD64             $CHAR4.                                       
      @1591   REVCD65             $CHAR4.                                       
      @1595   REVCD66             $CHAR4.                                       
      @1599   REVCD67             $CHAR4.                                       
      @1603   REVCD68             $CHAR4.                                       
      @1607   REVCD69             $CHAR4.                                       
      @1611   REVCD70             $CHAR4.                                       
      @1615   REVCD71             $CHAR4.                                       
      @1619   REVCD72             $CHAR4.                                       
      @1623   REVCD73             $CHAR4.                                       
      @1627   REVCD74             $CHAR4.                                       
      @1631   REVCD75             $CHAR4.                                       
      @1635   REVCD76             $CHAR4.                                       
      @1639   REVCD77             $CHAR4.                                       
      @1643   REVCD78             $CHAR4.                                       
      @1647   REVCD79             $CHAR4.                                       
      @1651   REVCD80             $CHAR4.                                       
      @1655   REVCD81             $CHAR4.                                       
      @1659   REVCD82             $CHAR4.                                       
      @1663   REVCD83             $CHAR4.                                       
      @1667   REVCD84             $CHAR4.                                       
      @1671   REVCD85             $CHAR4.                                       
      @1675   REVCD86             $CHAR4.                                       
      @1679   REVCD87             $CHAR4.                                       
      @1683   REVCD88             $CHAR4.                                       
      @1687   REVCD89             $CHAR4.                                       
      @1691   REVCD90             $CHAR4.                                       
      @1695   REVCD91             $CHAR4.                                       
      @1699   REVCD92             $CHAR4.                                       
      @1703   REVCD93             $CHAR4.                                       
      @1707   REVCD94             $CHAR4.                                       
      @1711   REVCD95             $CHAR4.                                       
      @1715   REVCD96             $CHAR4.                                       
      @1719   REVCD97             $CHAR4.                                       
      @1723   REVCD98             $CHAR4.                                       
      @1727   REVCD99             $CHAR4.                                       
      @1731   REVCD100            $CHAR4.                                       
      @1735   REVCD101            $CHAR4.                                       
      @1739   REVCD102            $CHAR4.                                       
      @1743   REVCD103            $CHAR4.                                       
      @1747   REVCD104            $CHAR4.                                       
      @1751   REVCD105            $CHAR4.                                       
      @1755   REVCD106            $CHAR4.                                       
      @1759   REVCD107            $CHAR4.                                       
      @1763   REVCD108            $CHAR4.                                       
      @1767   REVCD109            $CHAR4.                                       
      @1771   REVCD110            $CHAR4.                                       
      @1775   UNIT1               N4PF.                                         
      @1779   UNIT2               N4PF.                                         
      @1783   UNIT3               N4PF.                                         
      @1787   UNIT4               N4PF.                                         
      @1791   UNIT5               N4PF.                                         
      @1795   UNIT6               N4PF.                                         
      @1799   UNIT7               N4PF.                                         
      @1803   UNIT8               N4PF.                                         
      @1807   UNIT9               N4PF.                                         
      @1811   UNIT10              N4PF.                                         
      @1815   UNIT11              N4PF.                                         
      @1819   UNIT12              N4PF.                                         
      @1823   UNIT13              N4PF.                                         
      @1827   UNIT14              N4PF.                                         
      @1831   UNIT15              N4PF.                                         
      @1835   UNIT16              N4PF.                                         
      @1839   UNIT17              N4PF.                                         
      @1843   UNIT18              N4PF.                                         
      @1847   UNIT19              N4PF.                                         
      @1851   UNIT20              N4PF.                                         
      @1855   UNIT21              N4PF.                                         
      @1859   UNIT22              N4PF.                                         
      @1863   UNIT23              N4PF.                                         
      @1867   UNIT24              N4PF.                                         
      @1871   UNIT25              N4PF.                                         
      @1875   UNIT26              N4PF.                                         
      @1879   UNIT27              N4PF.                                         
      @1883   UNIT28              N4PF.                                         
      @1887   UNIT29              N4PF.                                         
      @1891   UNIT30              N4PF.                                         
      @1895   UNIT31              N4PF.                                         
      @1899   UNIT32              N4PF.                                         
      @1903   UNIT33              N4PF.                                         
      @1907   UNIT34              N4PF.                                         
      @1911   UNIT35              N4PF.                                         
      @1915   UNIT36              N4PF.                                         
      @1919   UNIT37              N4PF.                                         
      @1923   UNIT38              N4PF.                                         
      @1927   UNIT39              N4PF.                                         
      @1931   UNIT40              N4PF.                                         
      @1935   UNIT41              N4PF.                                         
      @1939   UNIT42              N4PF.                                         
      @1943   UNIT43              N4PF.                                         
      @1947   UNIT44              N4PF.                                         
      @1951   UNIT45              N4PF.                                         
      @1955   UNIT46              N4PF.                                         
      @1959   UNIT47              N4PF.                                         
      @1963   UNIT48              N4PF.                                         
      @1967   UNIT49              N4PF.                                         
      @1971   UNIT50              N4PF.                                         
      @1975   UNIT51              N4PF.                                         
      @1979   UNIT52              N4PF.                                         
      @1983   UNIT53              N4PF.                                         
      @1987   UNIT54              N4PF.                                         
      @1991   UNIT55              N4PF.                                         
      @1995   UNIT56              N4PF.                                         
      @1999   UNIT57              N4PF.                                         
      @2003   UNIT58              N4PF.                                         
      @2007   UNIT59              N4PF.                                         
      @2011   UNIT60              N4PF.                                         
      @2015   UNIT61              N4PF.                                         
      @2019   UNIT62              N4PF.                                         
      @2023   UNIT63              N4PF.                                         
      @2027   UNIT64              N4PF.                                         
      @2031   UNIT65              N4PF.                                         
      @2035   UNIT66              N4PF.                                         
      @2039   UNIT67              N4PF.                                         
      @2043   UNIT68              N4PF.                                         
      @2047   UNIT69              N4PF.                                         
      @2051   UNIT70              N4PF.                                         
      @2055   UNIT71              N4PF.                                         
      @2059   UNIT72              N4PF.                                         
      @2063   UNIT73              N4PF.                                         
      @2067   UNIT74              N4PF.                                         
      @2071   UNIT75              N4PF.                                         
      @2075   UNIT76              N4PF.                                         
      @2079   UNIT77              N4PF.                                         
      @2083   UNIT78              N4PF.                                         
      @2087   UNIT79              N4PF.                                         
      @2091   UNIT80              N4PF.                                         
      @2095   UNIT81              N4PF.                                         
      @2099   UNIT82              N4PF.                                         
      @2103   UNIT83              N4PF.                                         
      @2107   UNIT84              N4PF.                                         
      @2111   UNIT85              N4PF.                                         
      @2115   UNIT86              N4PF.                                         
      @2119   UNIT87              N4PF.                                         
      @2123   UNIT88              N4PF.                                         
      @2127   UNIT89              N4PF.                                         
      @2131   UNIT90              N4PF.                                         
      @2135   UNIT91              N4PF.                                         
      @2139   UNIT92              N4PF.                                         
      @2143   UNIT93              N4PF.                                         
      @2147   UNIT94              N4PF.                                         
      @2151   UNIT95              N4PF.                                         
      @2155   UNIT96              N4PF.                                         
      @2159   UNIT97              N4PF.                                         
      @2163   UNIT98              N4PF.                                         
      @2167   UNIT99              N4PF.                                         
      @2171   UNIT100             N4PF.                                         
      @2175   UNIT101             N4PF.                                         
      @2179   UNIT102             N4PF.                                         
      @2183   UNIT103             N4PF.                                         
      @2187   UNIT104             N4PF.                                         
      @2191   UNIT105             N4PF.                                         
      @2195   UNIT106             N4PF.                                         
      @2199   UNIT107             N4PF.                                         
      @2203   UNIT108             N4PF.                                         
      @2207   UNIT109             N4PF.                                         
      @2211   UNIT110             N4PF.                                         
;                                                                               
                                                                                
                                                                                
RUN;
