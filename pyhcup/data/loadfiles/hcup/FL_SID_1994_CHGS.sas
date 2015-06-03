/*******************************************************************            
*   FL_SID_1994_CHGS.SAS:                                                       
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
DATA FL_SIDC_1994_CHGS;                                                         
INFILE 'FL_SID_1994_CHGS.ASC' LRECL = 301;                                      
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  SEQ_SID            LENGTH=8          FORMAT=Z13.                              
  LABEL="I:HCUP-3 SID record sequence number"                                   
                                                                                
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
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      SEQ_SID             13.                                           
      @14     CHG1                N12P2F.                                       
      @26     CHG2                N12P2F.                                       
      @38     CHG3                N12P2F.                                       
      @50     CHG4                N12P2F.                                       
      @62     CHG5                N12P2F.                                       
      @74     CHG6                N12P2F.                                       
      @86     CHG7                N12P2F.                                       
      @98     CHG8                N12P2F.                                       
      @110    CHG9                N12P2F.                                       
      @122    CHG10               N12P2F.                                       
      @134    CHG11               N12P2F.                                       
      @146    CHG12               N12P2F.                                       
      @158    CHG13               N12P2F.                                       
      @170    CHG14               N12P2F.                                       
      @182    CHG15               N12P2F.                                       
      @194    CHG16               N12P2F.                                       
      @206    CHG17               N12P2F.                                       
      @218    CHG18               N12P2F.                                       
      @230    CHG19               N12P2F.                                       
      @242    CHG20               N12P2F.                                       
      @254    CHG21               N12P2F.                                       
      @266    CHG22               N12P2F.                                       
      @278    CHG23               N12P2F.                                       
      @290    CHG24               N12P2F.                                       
      ;                                                                         
                                                                                
                                                                                
RUN;
