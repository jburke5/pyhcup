/*******************************************************************            
*   NY_SID_1992_CHGS.SAS:                                                       
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
DATA NY_SIDC_1992_CHGS;                                                         
INFILE 'NY_SID_1992_CHGS.ASC' LRECL = 503;                                      
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  PROCESS            LENGTH=6                                                   
  LABEL="I:HCUP-3 discharge processing ID number"                               
                                                                                
  REVCD1             LENGTH=$4                                                  
  LABEL="I:Revenue code 1 (from data source)"                                   
                                                                                
  REVCD2             LENGTH=$4                                                  
  LABEL="I:Revenue code 2 (from data source)"                                   
                                                                                
  REVCD3             LENGTH=$4                                                  
  LABEL="I:Revenue code 3 (from data source)"                                   
                                                                                
  REVCD4             LENGTH=$4                                                  
  LABEL="I:Revenue code 4 (from data source)"                                   
                                                                                
  REVCD5             LENGTH=$4                                                  
  LABEL="I:Revenue code 5 (from data source)"                                   
                                                                                
  REVCD6             LENGTH=$4                                                  
  LABEL="I:Revenue code 6 (from data source)"                                   
                                                                                
  REVCD7             LENGTH=$4                                                  
  LABEL="I:Revenue code 7 (from data source)"                                   
                                                                                
  REVCD8             LENGTH=$4                                                  
  LABEL="I:Revenue code 8 (from data source)"                                   
                                                                                
  REVCD9             LENGTH=$4                                                  
  LABEL="I:Revenue code 9 (from data source)"                                   
                                                                                
  REVCD10            LENGTH=$4                                                  
  LABEL="I:Revenue code 10 (from data source)"                                  
                                                                                
  REVCD11            LENGTH=$4                                                  
  LABEL="I:Revenue code 11 (from data source)"                                  
                                                                                
  REVCD12            LENGTH=$4                                                  
  LABEL="I:Revenue code 12 (from data source)"                                  
                                                                                
  REVCD13            LENGTH=$4                                                  
  LABEL="I:Revenue code 13 (from data source)"                                  
                                                                                
  REVCD14            LENGTH=$4                                                  
  LABEL="I:Revenue code 14 (from data source)"                                  
                                                                                
  REVCD15            LENGTH=$4                                                  
  LABEL="I:Revenue code 15 (from data source)"                                  
                                                                                
  REVCD16            LENGTH=$4                                                  
  LABEL="I:Revenue code 16 (from data source)"                                  
                                                                                
  REVCD17            LENGTH=$4                                                  
  LABEL="I:Revenue code 17 (from data source)"                                  
                                                                                
  REVCD18            LENGTH=$4                                                  
  LABEL="I:Revenue code 18 (from data source)"                                  
                                                                                
  REVCD19            LENGTH=$4                                                  
  LABEL="I:Revenue code 19 (from data source)"                                  
                                                                                
  REVCD20            LENGTH=$4                                                  
  LABEL="I:Revenue code 20 (from data source)"                                  
                                                                                
  REVCD21            LENGTH=$4                                                  
  LABEL="I:Revenue code 21 (from data source)"                                  
                                                                                
  REVCD22            LENGTH=$4                                                  
  LABEL="I:Revenue code 22 (from data source)"                                  
                                                                                
  REVCD23            LENGTH=$4                                                  
  LABEL="I:Revenue code 23 (from data source)"                                  
                                                                                
  REVCD24            LENGTH=$4                                                  
  LABEL="I:Revenue code 24 (from data source)"                                  
                                                                                
  REVCD25            LENGTH=$4                                                  
  LABEL="I:Revenue code 25 (from data source)"                                  
                                                                                
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
                                                                                
  RATE1              LENGTH=5                                                   
  LABEL="I:Daily rate 1 (from data source)"                                     
                                                                                
  RATE2              LENGTH=5                                                   
  LABEL="I:Daily rate 2 (from data source)"                                     
                                                                                
  RATE3              LENGTH=5                                                   
  LABEL="I:Daily rate 3 (from data source)"                                     
                                                                                
  RATE4              LENGTH=5                                                   
  LABEL="I:Daily rate 4 (from data source)"                                     
                                                                                
  RATE5              LENGTH=5                                                   
  LABEL="I:Daily rate 5 (from data source)"                                     
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      PROCESS             11.                                           
      @12     REVCD1              $CHAR4.                                       
      @16     REVCD2              $CHAR4.                                       
      @20     REVCD3              $CHAR4.                                       
      @24     REVCD4              $CHAR4.                                       
      @28     REVCD5              $CHAR4.                                       
      @32     REVCD6              $CHAR4.                                       
      @36     REVCD7              $CHAR4.                                       
      @40     REVCD8              $CHAR4.                                       
      @44     REVCD9              $CHAR4.                                       
      @48     REVCD10             $CHAR4.                                       
      @52     REVCD11             $CHAR4.                                       
      @56     REVCD12             $CHAR4.                                       
      @60     REVCD13             $CHAR4.                                       
      @64     REVCD14             $CHAR4.                                       
      @68     REVCD15             $CHAR4.                                       
      @72     REVCD16             $CHAR4.                                       
      @76     REVCD17             $CHAR4.                                       
      @80     REVCD18             $CHAR4.                                       
      @84     REVCD19             $CHAR4.                                       
      @88     REVCD20             $CHAR4.                                       
      @92     REVCD21             $CHAR4.                                       
      @96     REVCD22             $CHAR4.                                       
      @100    REVCD23             $CHAR4.                                       
      @104    REVCD24             $CHAR4.                                       
      @108    REVCD25             $CHAR4.                                       
      @112    UNIT1               N8PF.                                         
      @120    UNIT2               N8PF.                                         
      @128    UNIT3               N8PF.                                         
      @136    UNIT4               N8PF.                                         
      @144    UNIT5               N8PF.                                         
      @152    CHG1                N12P2F.                                       
      @164    CHG2                N12P2F.                                       
      @176    CHG3                N12P2F.                                       
      @188    CHG4                N12P2F.                                       
      @200    CHG5                N12P2F.                                       
      @212    CHG6                N12P2F.                                       
      @224    CHG7                N12P2F.                                       
      @236    CHG8                N12P2F.                                       
      @248    CHG9                N12P2F.                                       
      @260    CHG10               N12P2F.                                       
      @272    CHG11               N12P2F.                                       
      @284    CHG12               N12P2F.                                       
      @296    CHG13               N12P2F.                                       
      @308    CHG14               N12P2F.                                       
      @320    CHG15               N12P2F.                                       
      @332    CHG16               N12P2F.                                       
      @344    CHG17               N12P2F.                                       
      @356    CHG18               N12P2F.                                       
      @368    CHG19               N12P2F.                                       
      @380    CHG20               N12P2F.                                       
      @392    CHG21               N12P2F.                                       
      @404    CHG22               N12P2F.                                       
      @416    CHG23               N12P2F.                                       
      @428    CHG24               N12P2F.                                       
      @440    CHG25               N12P2F.                                       
      @452    CHG26               N12P2F.                                       
      @464    RATE1               N8P2F.                                        
      @472    RATE2               N8P2F.                                        
      @480    RATE3               N8P2F.                                        
      @488    RATE4               N8P2F.                                        
      @496    RATE5               N8P2F.                                        
      ;                                                                         
                                                                                
                                                                                
RUN;
