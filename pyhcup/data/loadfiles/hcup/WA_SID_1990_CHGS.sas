/*******************************************************************            
*   WA_SID_1990_CHGS.SAS:                                                       
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
DATA WA_SIDC_1990_CHGS;                                                         
INFILE 'WA_SID_1990_CHGS.ASC' LRECL = 971;                                      
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  PROCESS            LENGTH=7                                                   
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
                                                                                
  REVCD26            LENGTH=$4                                                  
  LABEL="I:Revenue code 26 (from data source)"                                  
                                                                                
  REVCD27            LENGTH=$4                                                  
  LABEL="I:Revenue code 27 (from data source)"                                  
                                                                                
  REVCD28            LENGTH=$4                                                  
  LABEL="I:Revenue code 28 (from data source)"                                  
                                                                                
  REVCD29            LENGTH=$4                                                  
  LABEL="I:Revenue code 29 (from data source)"                                  
                                                                                
  REVCD30            LENGTH=$4                                                  
  LABEL="I:Revenue code 30 (from data source)"                                  
                                                                                
  REVCD31            LENGTH=$4                                                  
  LABEL="I:Revenue code 31 (from data source)"                                  
                                                                                
  REVCD32            LENGTH=$4                                                  
  LABEL="I:Revenue code 32 (from data source)"                                  
                                                                                
  REVCD33            LENGTH=$4                                                  
  LABEL="I:Revenue code 33 (from data source)"                                  
                                                                                
  REVCD34            LENGTH=$4                                                  
  LABEL="I:Revenue code 34 (from data source)"                                  
                                                                                
  REVCD35            LENGTH=$4                                                  
  LABEL="I:Revenue code 35 (from data source)"                                  
                                                                                
  REVCD36            LENGTH=$4                                                  
  LABEL="I:Revenue code 36 (from data source)"                                  
                                                                                
  REVCD37            LENGTH=$4                                                  
  LABEL="I:Revenue code 37 (from data source)"                                  
                                                                                
  REVCD38            LENGTH=$4                                                  
  LABEL="I:Revenue code 38 (from data source)"                                  
                                                                                
  REVCD39            LENGTH=$4                                                  
  LABEL="I:Revenue code 39 (from data source)"                                  
                                                                                
  REVCD40            LENGTH=$4                                                  
  LABEL="I:Revenue code 40 (from data source)"                                  
                                                                                
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
                                                                                
  UNIT36             LENGTH=4                                                   
  LABEL="I:Units of service 36 (from data source)"                              
                                                                                
  UNIT37             LENGTH=4                                                   
  LABEL="I:Units of service 37 (from data source)"                              
                                                                                
  UNIT38             LENGTH=4                                                   
  LABEL="I:Units of service 38 (from data source)"                              
                                                                                
  UNIT39             LENGTH=4                                                   
  LABEL="I:Units of service 39 (from data source)"                              
                                                                                
  UNIT40             LENGTH=4                                                   
  LABEL="I:Units of service 40 (from data source)"                              
                                                                                
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
                                                                                
  CHG36              LENGTH=6                                                   
  LABEL="I:Detailed charges 36 (from data source)"                              
                                                                                
  CHG37              LENGTH=6                                                   
  LABEL="I:Detailed charges 37 (from data source)"                              
                                                                                
  CHG38              LENGTH=6                                                   
  LABEL="I:Detailed charges 38 (from data source)"                              
                                                                                
  CHG39              LENGTH=6                                                   
  LABEL="I:Detailed charges 39 (from data source)"                              
                                                                                
  CHG40              LENGTH=6                                                   
  LABEL="I:Detailed charges 40 (from data source)"                              
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
      @112    REVCD26             $CHAR4.                                       
      @116    REVCD27             $CHAR4.                                       
      @120    REVCD28             $CHAR4.                                       
      @124    REVCD29             $CHAR4.                                       
      @128    REVCD30             $CHAR4.                                       
      @132    REVCD31             $CHAR4.                                       
      @136    REVCD32             $CHAR4.                                       
      @140    REVCD33             $CHAR4.                                       
      @144    REVCD34             $CHAR4.                                       
      @148    REVCD35             $CHAR4.                                       
      @152    REVCD36             $CHAR4.                                       
      @156    REVCD37             $CHAR4.                                       
      @160    REVCD38             $CHAR4.                                       
      @164    REVCD39             $CHAR4.                                       
      @168    REVCD40             $CHAR4.                                       
      @172    UNIT1               N8PF.                                         
      @180    UNIT2               N8PF.                                         
      @188    UNIT3               N8PF.                                         
      @196    UNIT4               N8PF.                                         
      @204    UNIT5               N8PF.                                         
      @212    UNIT6               N8PF.                                         
      @220    UNIT7               N8PF.                                         
      @228    UNIT8               N8PF.                                         
      @236    UNIT9               N8PF.                                         
      @244    UNIT10              N8PF.                                         
      @252    UNIT11              N8PF.                                         
      @260    UNIT12              N8PF.                                         
      @268    UNIT13              N8PF.                                         
      @276    UNIT14              N8PF.                                         
      @284    UNIT15              N8PF.                                         
      @292    UNIT16              N8PF.                                         
      @300    UNIT17              N8PF.                                         
      @308    UNIT18              N8PF.                                         
      @316    UNIT19              N8PF.                                         
      @324    UNIT20              N8PF.                                         
      @332    UNIT21              N8PF.                                         
      @340    UNIT22              N8PF.                                         
      @348    UNIT23              N8PF.                                         
      @356    UNIT24              N8PF.                                         
      @364    UNIT25              N8PF.                                         
      @372    UNIT26              N8PF.                                         
      @380    UNIT27              N8PF.                                         
      @388    UNIT28              N8PF.                                         
      @396    UNIT29              N8PF.                                         
      @404    UNIT30              N8PF.                                         
      @412    UNIT31              N8PF.                                         
      @420    UNIT32              N8PF.                                         
      @428    UNIT33              N8PF.                                         
      @436    UNIT34              N8PF.                                         
      @444    UNIT35              N8PF.                                         
      @452    UNIT36              N8PF.                                         
      @460    UNIT37              N8PF.                                         
      @468    UNIT38              N8PF.                                         
      @476    UNIT39              N8PF.                                         
      @484    UNIT40              N8PF.                                         
      @492    CHG1                N12P2F.                                       
      @504    CHG2                N12P2F.                                       
      @516    CHG3                N12P2F.                                       
      @528    CHG4                N12P2F.                                       
      @540    CHG5                N12P2F.                                       
      @552    CHG6                N12P2F.                                       
      @564    CHG7                N12P2F.                                       
      @576    CHG8                N12P2F.                                       
      @588    CHG9                N12P2F.                                       
      @600    CHG10               N12P2F.                                       
      @612    CHG11               N12P2F.                                       
      @624    CHG12               N12P2F.                                       
      @636    CHG13               N12P2F.                                       
      @648    CHG14               N12P2F.                                       
      @660    CHG15               N12P2F.                                       
      @672    CHG16               N12P2F.                                       
      @684    CHG17               N12P2F.                                       
      @696    CHG18               N12P2F.                                       
      @708    CHG19               N12P2F.                                       
      @720    CHG20               N12P2F.                                       
      @732    CHG21               N12P2F.                                       
      @744    CHG22               N12P2F.                                       
      @756    CHG23               N12P2F.                                       
      @768    CHG24               N12P2F.                                       
      @780    CHG25               N12P2F.                                       
      @792    CHG26               N12P2F.                                       
      @804    CHG27               N12P2F.                                       
      @816    CHG28               N12P2F.                                       
      @828    CHG29               N12P2F.                                       
      @840    CHG30               N12P2F.                                       
      @852    CHG31               N12P2F.                                       
      @864    CHG32               N12P2F.                                       
      @876    CHG33               N12P2F.                                       
      @888    CHG34               N12P2F.                                       
      @900    CHG35               N12P2F.                                       
      @912    CHG36               N12P2F.                                       
      @924    CHG37               N12P2F.                                       
      @936    CHG38               N12P2F.                                       
      @948    CHG39               N12P2F.                                       
      @960    CHG40               N12P2F.                                       
      ;                                                                         
                                                                                
                                                                                
RUN;
