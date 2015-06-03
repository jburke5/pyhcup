/*******************************************************************            
*   NJ_SID_1990_CHGS.SAS:                                                       
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
DATA NJ_SIDC_1990_CHGS;                                                         
INFILE 'NJ_SID_1990_CHGS.ASC' LRECL = 711;                                      
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
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
      @1      PROCESS             11.                                           
      @12     UNIT1               N8PF.                                         
      @20     UNIT2               N8PF.                                         
      @28     UNIT3               N8PF.                                         
      @36     UNIT4               N8PF.                                         
      @44     UNIT5               N8PF.                                         
      @52     UNIT6               N8PF.                                         
      @60     UNIT7               N8PF.                                         
      @68     UNIT8               N8PF.                                         
      @76     UNIT9               N8PF.                                         
      @84     UNIT10              N8PF.                                         
      @92     UNIT11              N8PF.                                         
      @100    UNIT12              N8PF.                                         
      @108    UNIT13              N8PF.                                         
      @116    UNIT14              N8PF.                                         
      @124    UNIT15              N8PF.                                         
      @132    UNIT16              N8PF.                                         
      @140    UNIT17              N8PF.                                         
      @148    UNIT18              N8PF.                                         
      @156    UNIT19              N8PF.                                         
      @164    UNIT20              N8PF.                                         
      @172    UNIT21              N8PF.                                         
      @180    UNIT22              N8PF.                                         
      @188    UNIT23              N8PF.                                         
      @196    UNIT24              N8PF.                                         
      @204    UNIT25              N8PF.                                         
      @212    UNIT26              N8PF.                                         
      @220    UNIT27              N8PF.                                         
      @228    UNIT28              N8PF.                                         
      @236    UNIT29              N8PF.                                         
      @244    UNIT30              N8PF.                                         
      @252    UNIT31              N8PF.                                         
      @260    UNIT32              N8PF.                                         
      @268    UNIT33              N8PF.                                         
      @276    UNIT34              N8PF.                                         
      @284    UNIT35              N8PF.                                         
      @292    CHG1                N12P2F.                                       
      @304    CHG2                N12P2F.                                       
      @316    CHG3                N12P2F.                                       
      @328    CHG4                N12P2F.                                       
      @340    CHG5                N12P2F.                                       
      @352    CHG6                N12P2F.                                       
      @364    CHG7                N12P2F.                                       
      @376    CHG8                N12P2F.                                       
      @388    CHG9                N12P2F.                                       
      @400    CHG10               N12P2F.                                       
      @412    CHG11               N12P2F.                                       
      @424    CHG12               N12P2F.                                       
      @436    CHG13               N12P2F.                                       
      @448    CHG14               N12P2F.                                       
      @460    CHG15               N12P2F.                                       
      @472    CHG16               N12P2F.                                       
      @484    CHG17               N12P2F.                                       
      @496    CHG18               N12P2F.                                       
      @508    CHG19               N12P2F.                                       
      @520    CHG20               N12P2F.                                       
      @532    CHG21               N12P2F.                                       
      @544    CHG22               N12P2F.                                       
      @556    CHG23               N12P2F.                                       
      @568    CHG24               N12P2F.                                       
      @580    CHG25               N12P2F.                                       
      @592    CHG26               N12P2F.                                       
      @604    CHG27               N12P2F.                                       
      @616    CHG28               N12P2F.                                       
      @628    CHG29               N12P2F.                                       
      @640    CHG30               N12P2F.                                       
      @652    CHG31               N12P2F.                                       
      @664    CHG32               N12P2F.                                       
      @676    CHG33               N12P2F.                                       
      @688    CHG34               N12P2F.                                       
      @700    CHG35               N12P2F.                                       
      ;                                                                         
                                                                                
                                                                                
RUN;
