/*******************************************************************            
*   KY_SID_2001_CHGS.SAS:                                                       
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
  INVALUE N8P2F                                                                 
    '-9999.99' = .                                                              
    '-8888.88' = .A                                                             
    '-6666.66' = .C                                                             
    OTHER = (|8.2|)                                                             
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
DATA KY_SIDC_2001_CHGS;                                                         
INFILE 'KY_SIDC_2001_CHGS.ASC' LRECL = 1114;                                    
                                                                                
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
      @675    REVCD1              $CHAR4.                                       
      @679    REVCD2              $CHAR4.                                       
      @683    REVCD3              $CHAR4.                                       
      @687    REVCD4              $CHAR4.                                       
      @691    REVCD5              $CHAR4.                                       
      @695    REVCD6              $CHAR4.                                       
      @699    REVCD7              $CHAR4.                                       
      @703    REVCD8              $CHAR4.                                       
      @707    REVCD9              $CHAR4.                                       
      @711    REVCD10             $CHAR4.                                       
      @715    REVCD11             $CHAR4.                                       
      @719    REVCD12             $CHAR4.                                       
      @723    REVCD13             $CHAR4.                                       
      @727    REVCD14             $CHAR4.                                       
      @731    REVCD15             $CHAR4.                                       
      @735    REVCD16             $CHAR4.                                       
      @739    REVCD17             $CHAR4.                                       
      @743    REVCD18             $CHAR4.                                       
      @747    REVCD19             $CHAR4.                                       
      @751    REVCD20             $CHAR4.                                       
      @755    REVCD21             $CHAR4.                                       
      @759    REVCD22             $CHAR4.                                       
      @763    REVCD23             $CHAR4.                                       
      @767    REVCD24             $CHAR4.                                       
      @771    REVCD25             $CHAR4.                                       
      @775    REVCD26             $CHAR4.                                       
      @779    REVCD27             $CHAR4.                                       
      @783    REVCD28             $CHAR4.                                       
      @787    REVCD29             $CHAR4.                                       
      @791    REVCD30             $CHAR4.                                       
      @795    REVCD31             $CHAR4.                                       
      @799    REVCD32             $CHAR4.                                       
      @803    REVCD33             $CHAR4.                                       
      @807    REVCD34             $CHAR4.                                       
      @811    REVCD35             $CHAR4.                                       
      @815    REVCD36             $CHAR4.                                       
      @819    REVCD37             $CHAR4.                                       
      @823    REVCD38             $CHAR4.                                       
      @827    REVCD39             $CHAR4.                                       
      @831    REVCD40             $CHAR4.                                       
      @835    REVCD41             $CHAR4.                                       
      @839    REVCD42             $CHAR4.                                       
      @843    REVCD43             $CHAR4.                                       
      @847    REVCD44             $CHAR4.                                       
      @851    REVCD45             $CHAR4.                                       
      @855    REVCD46             $CHAR4.                                       
      @859    REVCD47             $CHAR4.                                       
      @863    REVCD48             $CHAR4.                                       
      @867    REVCD49             $CHAR4.                                       
      @871    REVCD50             $CHAR4.                                       
      @875    REVCD51             $CHAR4.                                       
      @879    REVCD52             $CHAR4.                                       
      @883    REVCD53             $CHAR4.                                       
      @887    REVCD54             $CHAR4.                                       
      @891    REVCD55             $CHAR4.                                       
      @895    UNIT1               N4PF.                                         
      @899    UNIT2               N4PF.                                         
      @903    UNIT3               N4PF.                                         
      @907    UNIT4               N4PF.                                         
      @911    UNIT5               N4PF.                                         
      @915    UNIT6               N4PF.                                         
      @919    UNIT7               N4PF.                                         
      @923    UNIT8               N4PF.                                         
      @927    UNIT9               N4PF.                                         
      @931    UNIT10              N4PF.                                         
      @935    UNIT11              N4PF.                                         
      @939    UNIT12              N4PF.                                         
      @943    UNIT13              N4PF.                                         
      @947    UNIT14              N4PF.                                         
      @951    UNIT15              N4PF.                                         
      @955    UNIT16              N4PF.                                         
      @959    UNIT17              N4PF.                                         
      @963    UNIT18              N4PF.                                         
      @967    UNIT19              N4PF.                                         
      @971    UNIT20              N4PF.                                         
      @975    UNIT21              N4PF.                                         
      @979    UNIT22              N4PF.                                         
      @983    UNIT23              N4PF.                                         
      @987    UNIT24              N4PF.                                         
      @991    UNIT25              N4PF.                                         
      @995    UNIT26              N4PF.                                         
      @999    UNIT27              N4PF.                                         
      @1003   UNIT28              N4PF.                                         
      @1007   UNIT29              N4PF.                                         
      @1011   UNIT30              N4PF.                                         
      @1015   UNIT31              N4PF.                                         
      @1019   UNIT32              N4PF.                                         
      @1023   UNIT33              N4PF.                                         
      @1027   UNIT34              N4PF.                                         
      @1031   UNIT35              N4PF.                                         
      @1035   UNIT36              N4PF.                                         
      @1039   UNIT37              N4PF.                                         
      @1043   UNIT38              N4PF.                                         
      @1047   UNIT39              N4PF.                                         
      @1051   UNIT40              N4PF.                                         
      @1055   UNIT41              N4PF.                                         
      @1059   UNIT42              N4PF.                                         
      @1063   UNIT43              N4PF.                                         
      @1067   UNIT44              N4PF.                                         
      @1071   UNIT45              N4PF.                                         
      @1075   UNIT46              N4PF.                                         
      @1079   UNIT47              N4PF.                                         
      @1083   UNIT48              N4PF.                                         
      @1087   UNIT49              N4PF.                                         
      @1091   UNIT50              N4PF.                                         
      @1095   UNIT51              N4PF.                                         
      @1099   UNIT52              N4PF.                                         
      @1103   UNIT53              N4PF.                                         
      @1107   UNIT54              N4PF.                                         
      @1111   UNIT55              N4PF.                                         
      ;                                                                         
                                                                                
                                                                                
RUN;
