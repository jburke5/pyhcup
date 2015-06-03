/*******************************************************************            
*   MD_SEDD_1999_CHGS.SAS:                                                      
*      THE SAS CODE SHOWN BELOW WILL LOAD THE ASCII                             
*      EMERGENCY DEPARTMENT CHGS FILE INTO SAS                                        
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
DATA MD_SEDDC_1999_CHGS;                                                        
INFILE 'MD_SEDD_1999_CHGS.ASC' LRECL = 398;                                     
                                                                                
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
      @207    REVCD1              $CHAR4.                                       
      @211    REVCD2              $CHAR4.                                       
      @215    REVCD3              $CHAR4.                                       
      @219    REVCD4              $CHAR4.                                       
      @223    REVCD5              $CHAR4.                                       
      @227    REVCD6              $CHAR4.                                       
      @231    REVCD7              $CHAR4.                                       
      @235    REVCD8              $CHAR4.                                       
      @239    REVCD9              $CHAR4.                                       
      @243    REVCD10             $CHAR4.                                       
      @247    REVCD11             $CHAR4.                                       
      @251    REVCD12             $CHAR4.                                       
      @255    REVCD13             $CHAR4.                                       
      @259    REVCD14             $CHAR4.                                       
      @263    REVCD15             $CHAR4.                                       
      @267    REVCD16             $CHAR4.                                       
      @271    UNIT1               N8PF.                                         
      @279    UNIT2               N8PF.                                         
      @287    UNIT3               N8PF.                                         
      @295    UNIT4               N8PF.                                         
      @303    UNIT5               N8PF.                                         
      @311    UNIT6               N8PF.                                         
      @319    UNIT7               N8PF.                                         
      @327    UNIT8               N8PF.                                         
      @335    UNIT9               N8PF.                                         
      @343    UNIT10              N8PF.                                         
      @351    UNIT11              N8PF.                                         
      @359    UNIT12              N8PF.                                         
      @367    UNIT13              N8PF.                                         
      @375    UNIT14              N8PF.                                         
      @383    UNIT15              N8PF.                                         
      @391    UNIT16              N8PF.                                         
      ;                                                                         
                                                                                
                                                                                
RUN;
