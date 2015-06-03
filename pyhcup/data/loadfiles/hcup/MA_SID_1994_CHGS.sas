/*******************************************************************            
*   MA_SID_1994_CHGS.SAS:                                                       
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
DATA MA_SIDC_1994_CHGS;                                                         
INFILE 'MA_SID_1994_CHGS.ASC' LRECL = 1644;                                     
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  SEQ_SID            LENGTH=8          FORMAT=Z13.                              
  LABEL="I:HCUP-3 SID record sequence number"                                   
                                                                                
  PROCESS            LENGTH=7                                                   
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
                                                                                
  UNIT41             LENGTH=4                                                   
  LABEL="I:Units of service 41 (from data source)"                              
                                                                                
  UNIT42             LENGTH=4                                                   
  LABEL="I:Units of service 42 (from data source)"                              
                                                                                
  UNIT43             LENGTH=4                                                   
  LABEL="I:Units of service 43 (from data source)"                              
                                                                                
  UNIT44             LENGTH=4                                                   
  LABEL="I:Units of service 44 (from data source)"                              
                                                                                
  UNIT45             LENGTH=4                                                   
  LABEL="I:Units of service 45 (from data source)"                              
                                                                                
  UNIT46             LENGTH=4                                                   
  LABEL="I:Units of service 46 (from data source)"                              
                                                                                
  UNIT47             LENGTH=4                                                   
  LABEL="I:Units of service 47 (from data source)"                              
                                                                                
  UNIT48             LENGTH=4                                                   
  LABEL="I:Units of service 48 (from data source)"                              
                                                                                
  UNIT49             LENGTH=4                                                   
  LABEL="I:Units of service 49 (from data source)"                              
                                                                                
  UNIT50             LENGTH=4                                                   
  LABEL="I:Units of service 50 (from data source)"                              
                                                                                
  UNIT51             LENGTH=4                                                   
  LABEL="I:Units of service 51 (from data source)"                              
                                                                                
  UNIT52             LENGTH=4                                                   
  LABEL="I:Units of service 52 (from data source)"                              
                                                                                
  UNIT53             LENGTH=4                                                   
  LABEL="I:Units of service 53 (from data source)"                              
                                                                                
  UNIT54             LENGTH=4                                                   
  LABEL="I:Units of service 54 (from data source)"                              
                                                                                
  UNIT55             LENGTH=4                                                   
  LABEL="I:Units of service 55 (from data source)"                              
                                                                                
  UNIT56             LENGTH=4                                                   
  LABEL="I:Units of service 56 (from data source)"                              
                                                                                
  UNIT57             LENGTH=4                                                   
  LABEL="I:Units of service 57 (from data source)"                              
                                                                                
  UNIT58             LENGTH=4                                                   
  LABEL="I:Units of service 58 (from data source)"                              
                                                                                
  UNIT59             LENGTH=4                                                   
  LABEL="I:Units of service 59 (from data source)"                              
                                                                                
  UNIT60             LENGTH=4                                                   
  LABEL="I:Units of service 60 (from data source)"                              
                                                                                
  UNIT61             LENGTH=4                                                   
  LABEL="I:Units of service 61 (from data source)"                              
                                                                                
  UNIT62             LENGTH=4                                                   
  LABEL="I:Units of service 62 (from data source)"                              
                                                                                
  UNIT63             LENGTH=4                                                   
  LABEL="I:Units of service 63 (from data source)"                              
                                                                                
  UNIT64             LENGTH=4                                                   
  LABEL="I:Units of service 64 (from data source)"                              
                                                                                
  UNIT65             LENGTH=4                                                   
  LABEL="I:Units of service 65 (from data source)"                              
                                                                                
  UNIT66             LENGTH=4                                                   
  LABEL="I:Units of service 66 (from data source)"                              
                                                                                
  UNIT67             LENGTH=4                                                   
  LABEL="I:Units of service 67 (from data source)"                              
                                                                                
  UNIT68             LENGTH=4                                                   
  LABEL="I:Units of service 68 (from data source)"                              
                                                                                
  UNIT69             LENGTH=4                                                   
  LABEL="I:Units of service 69 (from data source)"                              
                                                                                
  UNIT70             LENGTH=4                                                   
  LABEL="I:Units of service 70 (from data source)"                              
                                                                                
  UNIT71             LENGTH=4                                                   
  LABEL="I:Units of service 71 (from data source)"                              
                                                                                
  UNIT72             LENGTH=4                                                   
  LABEL="I:Units of service 72 (from data source)"                              
                                                                                
  UNIT73             LENGTH=4                                                   
  LABEL="I:Units of service 73 (from data source)"                              
                                                                                
  UNIT74             LENGTH=4                                                   
  LABEL="I:Units of service 74 (from data source)"                              
                                                                                
  UNIT75             LENGTH=4                                                   
  LABEL="I:Units of service 75 (from data source)"                              
                                                                                
  UNIT76             LENGTH=4                                                   
  LABEL="I:Units of service 76 (from data source)"                              
                                                                                
  UNIT77             LENGTH=4                                                   
  LABEL="I:Units of service 77 (from data source)"                              
                                                                                
  UNIT78             LENGTH=4                                                   
  LABEL="I:Units of service 78 (from data source)"                              
                                                                                
  UNIT79             LENGTH=4                                                   
  LABEL="I:Units of service 79 (from data source)"                              
                                                                                
  UNIT80             LENGTH=4                                                   
  LABEL="I:Units of service 80 (from data source)"                              
                                                                                
  UNIT81             LENGTH=4                                                   
  LABEL="I:Units of service 81 (from data source)"                              
                                                                                
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
                                                                                
  CHG41              LENGTH=6                                                   
  LABEL="I:Detailed charges 41 (from data source)"                              
                                                                                
  CHG42              LENGTH=6                                                   
  LABEL="I:Detailed charges 42 (from data source)"                              
                                                                                
  CHG43              LENGTH=6                                                   
  LABEL="I:Detailed charges 43 (from data source)"                              
                                                                                
  CHG44              LENGTH=6                                                   
  LABEL="I:Detailed charges 44 (from data source)"                              
                                                                                
  CHG45              LENGTH=6                                                   
  LABEL="I:Detailed charges 45 (from data source)"                              
                                                                                
  CHG46              LENGTH=6                                                   
  LABEL="I:Detailed charges 46 (from data source)"                              
                                                                                
  CHG47              LENGTH=6                                                   
  LABEL="I:Detailed charges 47 (from data source)"                              
                                                                                
  CHG48              LENGTH=6                                                   
  LABEL="I:Detailed charges 48 (from data source)"                              
                                                                                
  CHG49              LENGTH=6                                                   
  LABEL="I:Detailed charges 49 (from data source)"                              
                                                                                
  CHG50              LENGTH=6                                                   
  LABEL="I:Detailed charges 50 (from data source)"                              
                                                                                
  CHG51              LENGTH=6                                                   
  LABEL="I:Detailed charges 51 (from data source)"                              
                                                                                
  CHG52              LENGTH=6                                                   
  LABEL="I:Detailed charges 52 (from data source)"                              
                                                                                
  CHG53              LENGTH=6                                                   
  LABEL="I:Detailed charges 53 (from data source)"                              
                                                                                
  CHG54              LENGTH=6                                                   
  LABEL="I:Detailed charges 54 (from data source)"                              
                                                                                
  CHG55              LENGTH=6                                                   
  LABEL="I:Detailed charges 55 (from data source)"                              
                                                                                
  CHG56              LENGTH=6                                                   
  LABEL="I:Detailed charges 56 (from data source)"                              
                                                                                
  CHG57              LENGTH=6                                                   
  LABEL="I:Detailed charges 57 (from data source)"                              
                                                                                
  CHG58              LENGTH=6                                                   
  LABEL="I:Detailed charges 58 (from data source)"                              
                                                                                
  CHG59              LENGTH=6                                                   
  LABEL="I:Detailed charges 59 (from data source)"                              
                                                                                
  CHG60              LENGTH=6                                                   
  LABEL="I:Detailed charges 60 (from data source)"                              
                                                                                
  CHG61              LENGTH=6                                                   
  LABEL="I:Detailed charges 61 (from data source)"                              
                                                                                
  CHG62              LENGTH=6                                                   
  LABEL="I:Detailed charges 62 (from data source)"                              
                                                                                
  CHG63              LENGTH=6                                                   
  LABEL="I:Detailed charges 63 (from data source)"                              
                                                                                
  CHG64              LENGTH=6                                                   
  LABEL="I:Detailed charges 64 (from data source)"                              
                                                                                
  CHG65              LENGTH=6                                                   
  LABEL="I:Detailed charges 65 (from data source)"                              
                                                                                
  CHG66              LENGTH=6                                                   
  LABEL="I:Detailed charges 66 (from data source)"                              
                                                                                
  CHG67              LENGTH=6                                                   
  LABEL="I:Detailed charges 67 (from data source)"                              
                                                                                
  CHG68              LENGTH=6                                                   
  LABEL="I:Detailed charges 68 (from data source)"                              
                                                                                
  CHG69              LENGTH=6                                                   
  LABEL="I:Detailed charges 69 (from data source)"                              
                                                                                
  CHG70              LENGTH=6                                                   
  LABEL="I:Detailed charges 70 (from data source)"                              
                                                                                
  CHG71              LENGTH=6                                                   
  LABEL="I:Detailed charges 71 (from data source)"                              
                                                                                
  CHG72              LENGTH=6                                                   
  LABEL="I:Detailed charges 72 (from data source)"                              
                                                                                
  CHG73              LENGTH=6                                                   
  LABEL="I:Detailed charges 73 (from data source)"                              
                                                                                
  CHG74              LENGTH=6                                                   
  LABEL="I:Detailed charges 74 (from data source)"                              
                                                                                
  CHG75              LENGTH=6                                                   
  LABEL="I:Detailed charges 75 (from data source)"                              
                                                                                
  CHG76              LENGTH=6                                                   
  LABEL="I:Detailed charges 76 (from data source)"                              
                                                                                
  CHG77              LENGTH=6                                                   
  LABEL="I:Detailed charges 77 (from data source)"                              
                                                                                
  CHG78              LENGTH=6                                                   
  LABEL="I:Detailed charges 78 (from data source)"                              
                                                                                
  CHG79              LENGTH=6                                                   
  LABEL="I:Detailed charges 79 (from data source)"                              
                                                                                
  CHG80              LENGTH=6                                                   
  LABEL="I:Detailed charges 80 (from data source)"                              
                                                                                
  CHG81              LENGTH=6                                                   
  LABEL="I:Detailed charges 81 (from data source)"                              
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
      @305    UNIT36              N8PF.                                         
      @313    UNIT37              N8PF.                                         
      @321    UNIT38              N8PF.                                         
      @329    UNIT39              N8PF.                                         
      @337    UNIT40              N8PF.                                         
      @345    UNIT41              N8PF.                                         
      @353    UNIT42              N8PF.                                         
      @361    UNIT43              N8PF.                                         
      @369    UNIT44              N8PF.                                         
      @377    UNIT45              N8PF.                                         
      @385    UNIT46              N8PF.                                         
      @393    UNIT47              N8PF.                                         
      @401    UNIT48              N8PF.                                         
      @409    UNIT49              N8PF.                                         
      @417    UNIT50              N8PF.                                         
      @425    UNIT51              N8PF.                                         
      @433    UNIT52              N8PF.                                         
      @441    UNIT53              N8PF.                                         
      @449    UNIT54              N8PF.                                         
      @457    UNIT55              N8PF.                                         
      @465    UNIT56              N8PF.                                         
      @473    UNIT57              N8PF.                                         
      @481    UNIT58              N8PF.                                         
      @489    UNIT59              N8PF.                                         
      @497    UNIT60              N8PF.                                         
      @505    UNIT61              N8PF.                                         
      @513    UNIT62              N8PF.                                         
      @521    UNIT63              N8PF.                                         
      @529    UNIT64              N8PF.                                         
      @537    UNIT65              N8PF.                                         
      @545    UNIT66              N8PF.                                         
      @553    UNIT67              N8PF.                                         
      @561    UNIT68              N8PF.                                         
      @569    UNIT69              N8PF.                                         
      @577    UNIT70              N8PF.                                         
      @585    UNIT71              N8PF.                                         
      @593    UNIT72              N8PF.                                         
      @601    UNIT73              N8PF.                                         
      @609    UNIT74              N8PF.                                         
      @617    UNIT75              N8PF.                                         
      @625    UNIT76              N8PF.                                         
      @633    UNIT77              N8PF.                                         
      @641    UNIT78              N8PF.                                         
      @649    UNIT79              N8PF.                                         
      @657    UNIT80              N8PF.                                         
      @665    UNIT81              N8PF.                                         
      @673    CHG1                N12P2F.                                       
      @685    CHG2                N12P2F.                                       
      @697    CHG3                N12P2F.                                       
      @709    CHG4                N12P2F.                                       
      @721    CHG5                N12P2F.                                       
      @733    CHG6                N12P2F.                                       
      @745    CHG7                N12P2F.                                       
      @757    CHG8                N12P2F.                                       
      @769    CHG9                N12P2F.                                       
      @781    CHG10               N12P2F.                                       
      @793    CHG11               N12P2F.                                       
      @805    CHG12               N12P2F.                                       
      @817    CHG13               N12P2F.                                       
      @829    CHG14               N12P2F.                                       
      @841    CHG15               N12P2F.                                       
      @853    CHG16               N12P2F.                                       
      @865    CHG17               N12P2F.                                       
      @877    CHG18               N12P2F.                                       
      @889    CHG19               N12P2F.                                       
      @901    CHG20               N12P2F.                                       
      @913    CHG21               N12P2F.                                       
      @925    CHG22               N12P2F.                                       
      @937    CHG23               N12P2F.                                       
      @949    CHG24               N12P2F.                                       
      @961    CHG25               N12P2F.                                       
      @973    CHG26               N12P2F.                                       
      @985    CHG27               N12P2F.                                       
      @997    CHG28               N12P2F.                                       
      @1009   CHG29               N12P2F.                                       
      @1021   CHG30               N12P2F.                                       
      @1033   CHG31               N12P2F.                                       
      @1045   CHG32               N12P2F.                                       
      @1057   CHG33               N12P2F.                                       
      @1069   CHG34               N12P2F.                                       
      @1081   CHG35               N12P2F.                                       
      @1093   CHG36               N12P2F.                                       
      @1105   CHG37               N12P2F.                                       
      @1117   CHG38               N12P2F.                                       
      @1129   CHG39               N12P2F.                                       
      @1141   CHG40               N12P2F.                                       
      @1153   CHG41               N12P2F.                                       
      @1165   CHG42               N12P2F.                                       
      @1177   CHG43               N12P2F.                                       
      @1189   CHG44               N12P2F.                                       
      @1201   CHG45               N12P2F.                                       
      @1213   CHG46               N12P2F.                                       
      @1225   CHG47               N12P2F.                                       
      @1237   CHG48               N12P2F.                                       
      @1249   CHG49               N12P2F.                                       
      @1261   CHG50               N12P2F.                                       
      @1273   CHG51               N12P2F.                                       
      @1285   CHG52               N12P2F.                                       
      @1297   CHG53               N12P2F.                                       
      @1309   CHG54               N12P2F.                                       
      @1321   CHG55               N12P2F.                                       
      @1333   CHG56               N12P2F.                                       
      @1345   CHG57               N12P2F.                                       
      @1357   CHG58               N12P2F.                                       
      @1369   CHG59               N12P2F.                                       
      @1381   CHG60               N12P2F.                                       
      @1393   CHG61               N12P2F.                                       
      @1405   CHG62               N12P2F.                                       
      @1417   CHG63               N12P2F.                                       
      @1429   CHG64               N12P2F.                                       
      @1441   CHG65               N12P2F.                                       
      @1453   CHG66               N12P2F.                                       
      @1465   CHG67               N12P2F.                                       
      @1477   CHG68               N12P2F.                                       
      @1489   CHG69               N12P2F.                                       
      @1501   CHG70               N12P2F.                                       
      @1513   CHG71               N12P2F.                                       
      @1525   CHG72               N12P2F.                                       
      @1537   CHG73               N12P2F.                                       
      @1549   CHG74               N12P2F.                                       
      @1561   CHG75               N12P2F.                                       
      @1573   CHG76               N12P2F.                                       
      @1585   CHG77               N12P2F.                                       
      @1597   CHG78               N12P2F.                                       
      @1609   CHG79               N12P2F.                                       
      @1621   CHG80               N12P2F.                                       
      @1633   CHG81               N12P2F.                                       
      ;                                                                         
                                                                                
                                                                                
RUN;
