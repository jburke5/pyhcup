/*******************************************************************            
*   NJ_SID_2007_CHGS.SAS:                                                       
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
  INVALUE N5P2F                                                                 
    '-9.99' = .                                                                 
    '-8.88' = .A                                                                
    '-6.66' = .C                                                                
    OTHER = (|5.2|)                                                             
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
  INVALUE N9PF                                                                  
    '-99999999' = .                                                             
    '-88888888' = .A                                                            
    '-66666666' = .C                                                            
    OTHER = (|9.|)                                                              
  ;                                                                             
  INVALUE N9P2F                                                                 
    '-99999.99' = .                                                             
    '-88888.88' = .A                                                            
    '-66666.66' = .C                                                            
    OTHER = (|9.2|)                                                             
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
  INVALUE N10P5F                                                                
    '-999.99999' = .                                                            
    '-888.88888' = .A                                                           
    '-666.66666' = .C                                                           
    OTHER = (|10.5|)                                                            
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
  INVALUE N12P5F                                                                
    '-99999.99999' = .                                                          
    '-88888.88888' = .A                                                         
    '-66666.66666' = .C                                                         
    OTHER = (|12.5|)                                                            
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
DATA NJ_SIDC_2007_CHGS;                                                         
INFILE 'NJ_SID_2007_CHGS.ASC' LRECL = 714;                                      
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  CHG1                       LENGTH=6                                           
  LABEL="Detailed charges 1 (as received from source)"                          
                                                                                
  CHG2                       LENGTH=6                                           
  LABEL="Detailed charges 2 (as received from source)"                          
                                                                                
  CHG3                       LENGTH=6                                           
  LABEL="Detailed charges 3 (as received from source)"                          
                                                                                
  CHG4                       LENGTH=6                                           
  LABEL="Detailed charges 4 (as received from source)"                          
                                                                                
  CHG5                       LENGTH=6                                           
  LABEL="Detailed charges 5 (as received from source)"                          
                                                                                
  CHG6                       LENGTH=6                                           
  LABEL="Detailed charges 6 (as received from source)"                          
                                                                                
  CHG7                       LENGTH=6                                           
  LABEL="Detailed charges 7 (as received from source)"                          
                                                                                
  CHG8                       LENGTH=6                                           
  LABEL="Detailed charges 8 (as received from source)"                          
                                                                                
  CHG9                       LENGTH=6                                           
  LABEL="Detailed charges 9 (as received from source)"                          
                                                                                
  CHG10                      LENGTH=6                                           
  LABEL="Detailed charges 10 (as received from source)"                         
                                                                                
  CHG11                      LENGTH=6                                           
  LABEL="Detailed charges 11 (as received from source)"                         
                                                                                
  CHG12                      LENGTH=6                                           
  LABEL="Detailed charges 12 (as received from source)"                         
                                                                                
  CHG13                      LENGTH=6                                           
  LABEL="Detailed charges 13 (as received from source)"                         
                                                                                
  CHG14                      LENGTH=6                                           
  LABEL="Detailed charges 14 (as received from source)"                         
                                                                                
  CHG15                      LENGTH=6                                           
  LABEL="Detailed charges 15 (as received from source)"                         
                                                                                
  CHG16                      LENGTH=6                                           
  LABEL="Detailed charges 16 (as received from source)"                         
                                                                                
  CHG17                      LENGTH=6                                           
  LABEL="Detailed charges 17 (as received from source)"                         
                                                                                
  CHG18                      LENGTH=6                                           
  LABEL="Detailed charges 18 (as received from source)"                         
                                                                                
  CHG19                      LENGTH=6                                           
  LABEL="Detailed charges 19 (as received from source)"                         
                                                                                
  CHG20                      LENGTH=6                                           
  LABEL="Detailed charges 20 (as received from source)"                         
                                                                                
  CHG21                      LENGTH=6                                           
  LABEL="Detailed charges 21 (as received from source)"                         
                                                                                
  CHG22                      LENGTH=6                                           
  LABEL="Detailed charges 22 (as received from source)"                         
                                                                                
  CHG23                      LENGTH=6                                           
  LABEL="Detailed charges 23 (as received from source)"                         
                                                                                
  CHG24                      LENGTH=6                                           
  LABEL="Detailed charges 24 (as received from source)"                         
                                                                                
  CHG25                      LENGTH=6                                           
  LABEL="Detailed charges 25 (as received from source)"                         
                                                                                
  CHG26                      LENGTH=6                                           
  LABEL="Detailed charges 26 (as received from source)"                         
                                                                                
  CHG27                      LENGTH=6                                           
  LABEL="Detailed charges 27 (as received from source)"                         
                                                                                
  CHG28                      LENGTH=6                                           
  LABEL="Detailed charges 28 (as received from source)"                         
                                                                                
  CHG29                      LENGTH=6                                           
  LABEL="Detailed charges 29 (as received from source)"                         
                                                                                
  CHG30                      LENGTH=6                                           
  LABEL="Detailed charges 30 (as received from source)"                         
                                                                                
  CHG31                      LENGTH=6                                           
  LABEL="Detailed charges 31 (as received from source)"                         
                                                                                
  CHG32                      LENGTH=6                                           
  LABEL="Detailed charges 32 (as received from source)"                         
                                                                                
  CHG33                      LENGTH=6                                           
  LABEL="Detailed charges 33 (as received from source)"                         
                                                                                
  CHG34                      LENGTH=6                                           
  LABEL="Detailed charges 34 (as received from source)"                         
                                                                                
  CHG35                      LENGTH=6                                           
  LABEL="Detailed charges 35 (as received from source)"                         
                                                                                
  KEY                        LENGTH=8                 FORMAT=Z14.               
  LABEL="HCUP record identifier"                                                
                                                                                
  UNIT1                      LENGTH=4                                           
  LABEL="Units of service 1 (as received from source)"                          
                                                                                
  UNIT2                      LENGTH=4                                           
  LABEL="Units of service 2 (as received from source)"                          
                                                                                
  UNIT3                      LENGTH=4                                           
  LABEL="Units of service 3 (as received from source)"                          
                                                                                
  UNIT4                      LENGTH=4                                           
  LABEL="Units of service 4 (as received from source)"                          
                                                                                
  UNIT5                      LENGTH=4                                           
  LABEL="Units of service 5 (as received from source)"                          
                                                                                
  UNIT6                      LENGTH=4                                           
  LABEL="Units of service 6 (as received from source)"                          
                                                                                
  UNIT7                      LENGTH=4                                           
  LABEL="Units of service 7 (as received from source)"                          
                                                                                
  UNIT8                      LENGTH=4                                           
  LABEL="Units of service 8 (as received from source)"                          
                                                                                
  UNIT9                      LENGTH=4                                           
  LABEL="Units of service 9 (as received from source)"                          
                                                                                
  UNIT10                     LENGTH=4                                           
  LABEL="Units of service 10 (as received from source)"                         
                                                                                
  UNIT11                     LENGTH=4                                           
  LABEL="Units of service 11 (as received from source)"                         
                                                                                
  UNIT12                     LENGTH=4                                           
  LABEL="Units of service 12 (as received from source)"                         
                                                                                
  UNIT13                     LENGTH=4                                           
  LABEL="Units of service 13 (as received from source)"                         
                                                                                
  UNIT14                     LENGTH=4                                           
  LABEL="Units of service 14 (as received from source)"                         
                                                                                
  UNIT15                     LENGTH=4                                           
  LABEL="Units of service 15 (as received from source)"                         
                                                                                
  UNIT16                     LENGTH=4                                           
  LABEL="Units of service 16 (as received from source)"                         
                                                                                
  UNIT17                     LENGTH=4                                           
  LABEL="Units of service 17 (as received from source)"                         
                                                                                
  UNIT18                     LENGTH=4                                           
  LABEL="Units of service 18 (as received from source)"                         
                                                                                
  UNIT19                     LENGTH=4                                           
  LABEL="Units of service 19 (as received from source)"                         
                                                                                
  UNIT20                     LENGTH=4                                           
  LABEL="Units of service 20 (as received from source)"                         
                                                                                
  UNIT21                     LENGTH=4                                           
  LABEL="Units of service 21 (as received from source)"                         
                                                                                
  UNIT22                     LENGTH=4                                           
  LABEL="Units of service 22 (as received from source)"                         
                                                                                
  UNIT23                     LENGTH=4                                           
  LABEL="Units of service 23 (as received from source)"                         
                                                                                
  UNIT24                     LENGTH=4                                           
  LABEL="Units of service 24 (as received from source)"                         
                                                                                
  UNIT25                     LENGTH=4                                           
  LABEL="Units of service 25 (as received from source)"                         
                                                                                
  UNIT26                     LENGTH=4                                           
  LABEL="Units of service 26 (as received from source)"                         
                                                                                
  UNIT27                     LENGTH=4                                           
  LABEL="Units of service 27 (as received from source)"                         
                                                                                
  UNIT28                     LENGTH=4                                           
  LABEL="Units of service 28 (as received from source)"                         
                                                                                
  UNIT29                     LENGTH=4                                           
  LABEL="Units of service 29 (as received from source)"                         
                                                                                
  UNIT30                     LENGTH=4                                           
  LABEL="Units of service 30 (as received from source)"                         
                                                                                
  UNIT31                     LENGTH=4                                           
  LABEL="Units of service 31 (as received from source)"                         
                                                                                
  UNIT32                     LENGTH=4                                           
  LABEL="Units of service 32 (as received from source)"                         
                                                                                
  UNIT33                     LENGTH=4                                           
  LABEL="Units of service 33 (as received from source)"                         
                                                                                
  UNIT34                     LENGTH=4                                           
  LABEL="Units of service 34 (as received from source)"                         
                                                                                
  UNIT35                     LENGTH=4                                           
  LABEL="Units of service 35 (as received from source)"                         
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      CHG1                     N12P2F.                                  
      @13     CHG2                     N12P2F.                                  
      @25     CHG3                     N12P2F.                                  
      @37     CHG4                     N12P2F.                                  
      @49     CHG5                     N12P2F.                                  
      @61     CHG6                     N12P2F.                                  
      @73     CHG7                     N12P2F.                                  
      @85     CHG8                     N12P2F.                                  
      @97     CHG9                     N12P2F.                                  
      @109    CHG10                    N12P2F.                                  
      @121    CHG11                    N12P2F.                                  
      @133    CHG12                    N12P2F.                                  
      @145    CHG13                    N12P2F.                                  
      @157    CHG14                    N12P2F.                                  
      @169    CHG15                    N12P2F.                                  
      @181    CHG16                    N12P2F.                                  
      @193    CHG17                    N12P2F.                                  
      @205    CHG18                    N12P2F.                                  
      @217    CHG19                    N12P2F.                                  
      @229    CHG20                    N12P2F.                                  
      @241    CHG21                    N12P2F.                                  
      @253    CHG22                    N12P2F.                                  
      @265    CHG23                    N12P2F.                                  
      @277    CHG24                    N12P2F.                                  
      @289    CHG25                    N12P2F.                                  
      @301    CHG26                    N12P2F.                                  
      @313    CHG27                    N12P2F.                                  
      @325    CHG28                    N12P2F.                                  
      @337    CHG29                    N12P2F.                                  
      @349    CHG30                    N12P2F.                                  
      @361    CHG31                    N12P2F.                                  
      @373    CHG32                    N12P2F.                                  
      @385    CHG33                    N12P2F.                                  
      @397    CHG34                    N12P2F.                                  
      @409    CHG35                    N12P2F.                                  
      @421    KEY                      14.                                      
      @435    UNIT1                    N8PF.                                    
      @443    UNIT2                    N8PF.                                    
      @451    UNIT3                    N8PF.                                    
      @459    UNIT4                    N8PF.                                    
      @467    UNIT5                    N8PF.                                    
      @475    UNIT6                    N8PF.                                    
      @483    UNIT7                    N8PF.                                    
      @491    UNIT8                    N8PF.                                    
      @499    UNIT9                    N8PF.                                    
      @507    UNIT10                   N8PF.                                    
      @515    UNIT11                   N8PF.                                    
      @523    UNIT12                   N8PF.                                    
      @531    UNIT13                   N8PF.                                    
      @539    UNIT14                   N8PF.                                    
      @547    UNIT15                   N8PF.                                    
      @555    UNIT16                   N8PF.                                    
      @563    UNIT17                   N8PF.                                    
      @571    UNIT18                   N8PF.                                    
      @579    UNIT19                   N8PF.                                    
      @587    UNIT20                   N8PF.                                    
      @595    UNIT21                   N8PF.                                    
      @603    UNIT22                   N8PF.                                    
      @611    UNIT23                   N8PF.                                    
      @619    UNIT24                   N8PF.                                    
      @627    UNIT25                   N8PF.                                    
      @635    UNIT26                   N8PF.                                    
      @643    UNIT27                   N8PF.                                    
      @651    UNIT28                   N8PF.                                    
      @659    UNIT29                   N8PF.                                    
      @667    UNIT30                   N8PF.                                    
      @675    UNIT31                   N8PF.                                    
      @683    UNIT32                   N8PF.                                    
      @691    UNIT33                   N8PF.                                    
      @699    UNIT34                   N8PF.                                    
      @707    UNIT35                   N8PF.                                    
      ;                                                                         
                                                                                
                                                                                
RUN;
