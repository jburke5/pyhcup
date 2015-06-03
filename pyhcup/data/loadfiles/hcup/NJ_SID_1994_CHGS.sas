/*******************************************************************            
*   NJ_SID_1994_CHGS.SAS:                                                       
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
    '-7' = .B                                                                   
    '-6' = .C                                                                   
    '-5' = .N                                                                   
    OTHER = (|2.|)                                                              
  ;                                                                             
  INVALUE N3PF                                                                  
    '-99' = .                                                                   
    '-88' = .A                                                                  
    '-77' = .B                                                                  
    '-66' = .C                                                                  
    OTHER = (|3.|)                                                              
  ;                                                                             
  INVALUE N4PF                                                                  
    '-999' = .                                                                  
    '-888' = .A                                                                 
    '-777' = .B                                                                 
    '-666' = .C                                                                 
    OTHER = (|4.|)                                                              
  ;                                                                             
  INVALUE N4P1F                                                                 
    '-9.9' = .                                                                  
    '-8.8' = .A                                                                 
    '-7.7' = .B                                                                 
    '-6.6' = .C                                                                 
    OTHER = (|4.1|)                                                             
  ;                                                                             
  INVALUE N5PF                                                                  
    '-9999' = .                                                                 
    '-8888' = .A                                                                
    '-7777' = .B                                                                
    '-6666' = .C                                                                
    OTHER = (|5.|)                                                              
  ;                                                                             
  INVALUE N6PF                                                                  
    '-99999' = .                                                                
    '-88888' = .A                                                               
    '-77777' = .B                                                               
    '-66666' = .C                                                               
    OTHER = (|6.|)                                                              
  ;                                                                             
  INVALUE N6P2F                                                                 
    '-99.99' = .                                                                
    '-88.88' = .A                                                               
    '-77.77' = .B                                                               
    '-66.66' = .C                                                               
    OTHER = (|6.2|)                                                             
  ;                                                                             
  INVALUE N7P2F                                                                 
    '-999.99' = .                                                               
    '-888.88' = .A                                                              
    '-777.77' = .B                                                              
    '-666.66' = .C                                                              
    OTHER = (|7.2|)                                                             
  ;                                                                             
  INVALUE N7P4F                                                                 
    '-9.9999' = .                                                               
    '-8.8888' = .A                                                              
    '-7.7777' = .B                                                              
    '-6.6666' = .C                                                              
    OTHER = (|7.4|)                                                             
  ;                                                                             
  INVALUE N8PF                                                                  
    '-9999999' = .                                                              
    '-8888888' = .A                                                             
    '-7777777' = .B                                                             
    '-6666666' = .C                                                             
    OTHER = (|8.|)                                                              
  ;                                                                             
  INVALUE N8P2F                                                                 
    '-9999.99' = .                                                              
    '-8888.88' = .A                                                             
    '-7777.77' = .B                                                             
    '-6666.66' = .C                                                             
    OTHER = (|8.2|)                                                             
  ;                                                                             
  INVALUE N10PF                                                                 
    '-999999999' = .                                                            
    '-888888888' = .A                                                           
    '-777777777' = .B                                                           
    '-666666666' = .C                                                           
    OTHER = (|10.|)                                                             
  ;                                                                             
  INVALUE N10P4F                                                                
    '-9999.9999' = .                                                            
    '-8888.8888' = .A                                                           
    '-7777.7777' = .B                                                           
    '-6666.6666' = .C                                                           
    OTHER = (|10.4|)                                                            
  ;                                                                             
  INVALUE DATE10F                                                               
    '-999999999' = .                                                            
    '-888888888' = .A                                                           
    '-777777777' = .B                                                           
    '-666666666' = .C                                                           
    OTHER = (|MMDDYY10.|)                                                       
  ;                                                                             
  INVALUE N12P2F                                                                
    '-99999999.99' = .                                                          
    '-88888888.88' = .A                                                         
    '-77777777.77' = .B                                                         
    '-66666666.66' = .C                                                         
    OTHER = (|12.2|)                                                            
  ;                                                                             
  INVALUE N15P2F                                                                
    '-99999999999.99' = .                                                       
    '-88888888888.88' = .A                                                      
    '-77777777777.77' = .B                                                      
    '-66666666666.66' = .C                                                      
    OTHER = (|15.2|)                                                            
  ;                                                                             
  RUN;                                                                          
                                                                                
                                                                                
*******************************;                                                
*  Data Step                  *;                                                
*******************************;                                                
DATA NJ_SIDC_1994_CHGS;                                                         
INFILE 'NJ_SID_1994_CHGS.ASC' LRECL = 724;                                      
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  SEQ_SID            LENGTH=7          FORMAT=Z13.                              
  LABEL="I:HCUP-3 SID record sequence number"                                   
                                                                                
  PROCESS            LENGTH=6                                                   
  LABEL="I:HCUP-3 discharge processing ID number"                               
                                                                                
  UNIT1              LENGTH=4                                                   
  LABEL="I:Units of service 1 (from data source)"                               
                                                                                
  UNIT2              LENGTH=4                                                   
  LABEL="I:Units of service 2 (from data source)"                               
                                                                                
  UNIT3              LENGTH=4                                                   
  LABEL="I:Units of service 3 (from data source)"                               
                                                                                
  UNIT4              LENGTH=4                                                   
  LABEL="I:Units of service 4 (from data source)"                               
                                                                                
  UNIT5              LENGTH=4                                                   
  LABEL="I:Units of service 5 (from data source)"                               
                                                                                
  UNIT6              LENGTH=4                                                   
  LABEL="I:Units of service 6 (from data source)"                               
                                                                                
  UNIT7              LENGTH=4                                                   
  LABEL="I:Units of service 7 (from data source)"                               
                                                                                
  UNIT8              LENGTH=4                                                   
  LABEL="I:Units of service 8 (from data source)"                               
                                                                                
  UNIT9              LENGTH=4                                                   
  LABEL="I:Units of service 9 (from data source)"                               
                                                                                
  UNIT10             LENGTH=4                                                   
  LABEL="I:Units of service 10 (from data source)"                              
                                                                                
  UNIT11             LENGTH=4                                                   
  LABEL="I:Units of service 11 (from data source)"                              
                                                                                
  UNIT12             LENGTH=4                                                   
  LABEL="I:Units of service 12 (from data source)"                              
                                                                                
  UNIT13             LENGTH=4                                                   
  LABEL="I:Units of service 13 (from data source)"                              
                                                                                
  UNIT14             LENGTH=4                                                   
  LABEL="I:Units of service 14 (from data source)"                              
                                                                                
  UNIT15             LENGTH=4                                                   
  LABEL="I:Units of service 15 (from data source)"                              
                                                                                
  UNIT16             LENGTH=4                                                   
  LABEL="I:Units of service 16 (from data source)"                              
                                                                                
  UNIT17             LENGTH=4                                                   
  LABEL="I:Units of service 17 (from data source)"                              
                                                                                
  UNIT18             LENGTH=4                                                   
  LABEL="I:Units of service 18 (from data source)"                              
                                                                                
  UNIT19             LENGTH=4                                                   
  LABEL="I:Units of service 19 (from data source)"                              
                                                                                
  UNIT20             LENGTH=4                                                   
  LABEL="I:Units of service 20 (from data source)"                              
                                                                                
  UNIT21             LENGTH=4                                                   
  LABEL="I:Units of service 21 (from data source)"                              
                                                                                
  UNIT22             LENGTH=4                                                   
  LABEL="I:Units of service 22 (from data source)"                              
                                                                                
  UNIT23             LENGTH=4                                                   
  LABEL="I:Units of service 23 (from data source)"                              
                                                                                
  UNIT24             LENGTH=4                                                   
  LABEL="I:Units of service 24 (from data source)"                              
                                                                                
  UNIT25             LENGTH=4                                                   
  LABEL="I:Units of service 25 (from data source)"                              
                                                                                
  UNIT26             LENGTH=4                                                   
  LABEL="I:Units of service 26 (from data source)"                              
                                                                                
  UNIT27             LENGTH=4                                                   
  LABEL="I:Units of service 27 (from data source)"                              
                                                                                
  UNIT28             LENGTH=4                                                   
  LABEL="I:Units of service 28 (from data source)"                              
                                                                                
  UNIT29             LENGTH=4                                                   
  LABEL="I:Units of service 29 (from data source)"                              
                                                                                
  UNIT30             LENGTH=4                                                   
  LABEL="I:Units of service 30 (from data source)"                              
                                                                                
  UNIT31             LENGTH=4                                                   
  LABEL="I:Units of service 31 (from data source)"                              
                                                                                
  UNIT32             LENGTH=4                                                   
  LABEL="I:Units of service 32 (from data source)"                              
                                                                                
  UNIT33             LENGTH=4                                                   
  LABEL="I:Units of service 33 (from data source)"                              
                                                                                
  UNIT34             LENGTH=4                                                   
  LABEL="I:Units of service 34 (from data source)"                              
                                                                                
  UNIT35             LENGTH=4                                                   
  LABEL="I:Units of service 35 (from data source)"                              
                                                                                
  CHG1               LENGTH=6                                                   
  LABEL="I:Detailed charges 1 (from data source)"                               
                                                                                
  CHG2               LENGTH=6                                                   
  LABEL="I:Detailed charges 2 (from data source)"                               
                                                                                
  CHG3               LENGTH=6                                                   
  LABEL="I:Detailed charges 3 (from data source)"                               
                                                                                
  CHG4               LENGTH=6                                                   
  LABEL="I:Detailed charges 4 (from data source)"                               
                                                                                
  CHG5               LENGTH=6                                                   
  LABEL="I:Detailed charges 5 (from data source)"                               
                                                                                
  CHG6               LENGTH=6                                                   
  LABEL="I:Detailed charges 6 (from data source)"                               
                                                                                
  CHG7               LENGTH=6                                                   
  LABEL="I:Detailed charges 7 (from data source)"                               
                                                                                
  CHG8               LENGTH=6                                                   
  LABEL="I:Detailed charges 8 (from data source)"                               
                                                                                
  CHG9               LENGTH=6                                                   
  LABEL="I:Detailed charges 9 (from data source)"                               
                                                                                
  CHG10              LENGTH=6                                                   
  LABEL="I:Detailed charges 10 (from data source)"                              
                                                                                
  CHG11              LENGTH=6                                                   
  LABEL="I:Detailed charges 11 (from data source)"                              
                                                                                
  CHG12              LENGTH=6                                                   
  LABEL="I:Detailed charges 12 (from data source)"                              
                                                                                
  CHG13              LENGTH=6                                                   
  LABEL="I:Detailed charges 13 (from data source)"                              
                                                                                
  CHG14              LENGTH=6                                                   
  LABEL="I:Detailed charges 14 (from data source)"                              
                                                                                
  CHG15              LENGTH=6                                                   
  LABEL="I:Detailed charges 15 (from data source)"                              
                                                                                
  CHG16              LENGTH=6                                                   
  LABEL="I:Detailed charges 16 (from data source)"                              
                                                                                
  CHG17              LENGTH=6                                                   
  LABEL="I:Detailed charges 17 (from data source)"                              
                                                                                
  CHG18              LENGTH=6                                                   
  LABEL="I:Detailed charges 18 (from data source)"                              
                                                                                
  CHG19              LENGTH=6                                                   
  LABEL="I:Detailed charges 19 (from data source)"                              
                                                                                
  CHG20              LENGTH=6                                                   
  LABEL="I:Detailed charges 20 (from data source)"                              
                                                                                
  CHG21              LENGTH=6                                                   
  LABEL="I:Detailed charges 21 (from data source)"                              
                                                                                
  CHG22              LENGTH=6                                                   
  LABEL="I:Detailed charges 22 (from data source)"                              
                                                                                
  CHG23              LENGTH=6                                                   
  LABEL="I:Detailed charges 23 (from data source)"                              
                                                                                
  CHG24              LENGTH=6                                                   
  LABEL="I:Detailed charges 24 (from data source)"                              
                                                                                
  CHG25              LENGTH=6                                                   
  LABEL="I:Detailed charges 25 (from data source)"                              
                                                                                
  CHG26              LENGTH=6                                                   
  LABEL="I:Detailed charges 26 (from data source)"                              
                                                                                
  CHG27              LENGTH=6                                                   
  LABEL="I:Detailed charges 27 (from data source)"                              
                                                                                
  CHG28              LENGTH=6                                                   
  LABEL="I:Detailed charges 28 (from data source)"                              
                                                                                
  CHG29              LENGTH=6                                                   
  LABEL="I:Detailed charges 29 (from data source)"                              
                                                                                
  CHG30              LENGTH=6                                                   
  LABEL="I:Detailed charges 30 (from data source)"                              
                                                                                
  CHG31              LENGTH=6                                                   
  LABEL="I:Detailed charges 31 (from data source)"                              
                                                                                
  CHG32              LENGTH=6                                                   
  LABEL="I:Detailed charges 32 (from data source)"                              
                                                                                
  CHG33              LENGTH=6                                                   
  LABEL="I:Detailed charges 33 (from data source)"                              
                                                                                
  CHG34              LENGTH=6                                                   
  LABEL="I:Detailed charges 34 (from data source)"                              
                                                                                
  CHG35              LENGTH=6                                                   
  LABEL="I:Detailed charges 35 (from data source)"                              
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      SEQ_SID             13.                                           
      @14     PROCESS             11.                                           
      @25     UNIT1               N8PF.                                         
      @33     UNIT2               N8PF.                                         
      @41     UNIT3               N8PF.                                         
      @49     UNIT4               N8PF.                                         
      @57     UNIT5               N8PF.                                         
      @65     UNIT6               N8PF.                                         
      @73     UNIT7               N8PF.                                         
      @81     UNIT8               N8PF.                                         
      @89     UNIT9               N8PF.                                         
      @97     UNIT10              N8PF.                                         
      @105    UNIT11              N8PF.                                         
      @113    UNIT12              N8PF.                                         
      @121    UNIT13              N8PF.                                         
      @129    UNIT14              N8PF.                                         
      @137    UNIT15              N8PF.                                         
      @145    UNIT16              N8PF.                                         
      @153    UNIT17              N8PF.                                         
      @161    UNIT18              N8PF.                                         
      @169    UNIT19              N8PF.                                         
      @177    UNIT20              N8PF.                                         
      @185    UNIT21              N8PF.                                         
      @193    UNIT22              N8PF.                                         
      @201    UNIT23              N8PF.                                         
      @209    UNIT24              N8PF.                                         
      @217    UNIT25              N8PF.                                         
      @225    UNIT26              N8PF.                                         
      @233    UNIT27              N8PF.                                         
      @241    UNIT28              N8PF.                                         
      @249    UNIT29              N8PF.                                         
      @257    UNIT30              N8PF.                                         
      @265    UNIT31              N8PF.                                         
      @273    UNIT32              N8PF.                                         
      @281    UNIT33              N8PF.                                         
      @289    UNIT34              N8PF.                                         
      @297    UNIT35              N8PF.                                         
      @305    CHG1                N12P2F.                                       
      @317    CHG2                N12P2F.                                       
      @329    CHG3                N12P2F.                                       
      @341    CHG4                N12P2F.                                       
      @353    CHG5                N12P2F.                                       
      @365    CHG6                N12P2F.                                       
      @377    CHG7                N12P2F.                                       
      @389    CHG8                N12P2F.                                       
      @401    CHG9                N12P2F.                                       
      @413    CHG10               N12P2F.                                       
      @425    CHG11               N12P2F.                                       
      @437    CHG12               N12P2F.                                       
      @449    CHG13               N12P2F.                                       
      @461    CHG14               N12P2F.                                       
      @473    CHG15               N12P2F.                                       
      @485    CHG16               N12P2F.                                       
      @497    CHG17               N12P2F.                                       
      @509    CHG18               N12P2F.                                       
      @521    CHG19               N12P2F.                                       
      @533    CHG20               N12P2F.                                       
      @545    CHG21               N12P2F.                                       
      @557    CHG22               N12P2F.                                       
      @569    CHG23               N12P2F.                                       
      @581    CHG24               N12P2F.                                       
      @593    CHG25               N12P2F.                                       
      @605    CHG26               N12P2F.                                       
      @617    CHG27               N12P2F.                                       
      @629    CHG28               N12P2F.                                       
      @641    CHG29               N12P2F.                                       
      @653    CHG30               N12P2F.                                       
      @665    CHG31               N12P2F.                                       
      @677    CHG32               N12P2F.                                       
      @689    CHG33               N12P2F.                                       
      @701    CHG34               N12P2F.                                       
      @713    CHG35               N12P2F.                                       
      ;                                                                         
                                                                                
                                                                                
RUN;
