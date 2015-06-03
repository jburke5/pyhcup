/*******************************************************************            
*   NY_SID_1998_CHGS.SAS:                                                       
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
DATA NY_SIDC_1998_CHGS;                                                         
INFILE 'NY_SIDC_1998_CHGS.ASC' LRECL = 474;                                     
                                                                                
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
                                                                                
  RATE1              LENGTH=5                                                   
  LABEL="Daily rate 1 (as received from source)"                                
                                                                                
  RATE2              LENGTH=5                                                   
  LABEL="Daily rate 2 (as received from source)"                                
                                                                                
  RATE3              LENGTH=5                                                   
  LABEL="Daily rate 3 (as received from source)"                                
                                                                                
  RATE4              LENGTH=5                                                   
  LABEL="Daily rate 4 (as received from source)"                                
                                                                                
  RATE5              LENGTH=5                                                   
  LABEL="Daily rate 5 (as received from source)"                                
                                                                                
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
      @315    RATE1               N8P2F.                                        
      @323    RATE2               N8P2F.                                        
      @331    RATE3               N8P2F.                                        
      @339    RATE4               N8P2F.                                        
      @347    RATE5               N8P2F.                                        
      @355    REVCD1              $CHAR4.                                       
      @359    REVCD2              $CHAR4.                                       
      @363    REVCD3              $CHAR4.                                       
      @367    REVCD4              $CHAR4.                                       
      @371    REVCD5              $CHAR4.                                       
      @375    REVCD6              $CHAR4.                                       
      @379    REVCD7              $CHAR4.                                       
      @383    REVCD8              $CHAR4.                                       
      @387    REVCD9              $CHAR4.                                       
      @391    REVCD10             $CHAR4.                                       
      @395    REVCD11             $CHAR4.                                       
      @399    REVCD12             $CHAR4.                                       
      @403    REVCD13             $CHAR4.                                       
      @407    REVCD14             $CHAR4.                                       
      @411    REVCD15             $CHAR4.                                       
      @415    REVCD16             $CHAR4.                                       
      @419    REVCD17             $CHAR4.                                       
      @423    REVCD18             $CHAR4.                                       
      @427    REVCD19             $CHAR4.                                       
      @431    REVCD20             $CHAR4.                                       
      @435    REVCD21             $CHAR4.                                       
      @439    REVCD22             $CHAR4.                                       
      @443    REVCD23             $CHAR4.                                       
      @447    REVCD24             $CHAR4.                                       
      @451    REVCD25             $CHAR4.                                       
      @455    UNIT1               N4PF.                                         
      @459    UNIT2               N4PF.                                         
      @463    UNIT3               N4PF.                                         
      @467    UNIT4               N4PF.                                         
      @471    UNIT5               N4PF.                                         
      ;                                                                         
                                                                                
                                                                                
RUN;
