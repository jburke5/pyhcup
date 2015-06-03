/*******************************************************************            
*   CA_SID_1995_CORE.SAS:                                                       
*      THE SAS CODE SHOWN BELOW WILL LOAD THE ASCII                             
*      INPATIENT STAY CORE FILE INTO SAS                                        
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
DATA CA_SIDC_1995_CORE;                                                         
INFILE 'CA_SID_1995_CORE.ASC' LRECL = 883;                                      
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  PROCESS            LENGTH=6                                                   
  LABEL="I:HCUP discharge processing ID number"                                 
                                                                                
  YEAR               LENGTH=3                                                   
  LABEL="Calendar year"                                                         
                                                                                
  DSNUM              LENGTH=3                                                   
  LABEL="I:Data source ID number"                                               
                                                                                
  DSTYPE             LENGTH=3                                                   
  LABEL="I:Data source type"                                                    
                                                                                
  HOSPST             LENGTH=$2                                                  
  LABEL="Hospital state postal code"                                            
                                                                                
  AGE                LENGTH=3                                                   
  LABEL="I:Age in years at admission"                                           
                                                                                
  AGEDAY             LENGTH=3                                                   
  LABEL="I:Age in days (when < 1 year)"                                         
                                                                                
  SEX                LENGTH=3                                                   
  LABEL="I:Sex"                                                                 
                                                                                
  RACE               LENGTH=3                                                   
  LABEL="I:Race"                                                                
                                                                                
  ADAYWK             LENGTH=3                                                   
  LABEL="I:Admission day of week"                                               
                                                                                
  AMONTH             LENGTH=3                                                   
  LABEL="I:Admission month"                                                     
                                                                                
  DQTR               LENGTH=3                                                   
  LABEL="I:Discharge quarter"                                                   
                                                                                
  LOS                LENGTH=3                                                   
  LABEL="I:Length of stay (cleaned)"                                            
                                                                                
  LOS_X              LENGTH=4                                                   
  LABEL="I:Length of stay (uncleaned)"                                          
                                                                                
  DISP               LENGTH=3                                                   
  LABEL="I:Disposition of patient"                                              
                                                                                
  DIED               LENGTH=3                                                   
  LABEL="I:Died during hospitalization"                                         
                                                                                
  NEOMAT             LENGTH=3                                                   
  LABEL="I:Neonatal and/or maternal DX and/or PR"                               
                                                                                
  ASOURCE            LENGTH=3                                                   
  LABEL="I:Admission source"                                                    
                                                                                
  DXSYS              LENGTH=3                                                   
  LABEL="I:Diagnosis coding system"                                             
                                                                                
  DSNDX              LENGTH=3                                                   
  LABEL="I:Max number of diagnoses from source"                                 
                                                                                
  NDX                LENGTH=3                                                   
  LABEL="I:Number of diagnoses on this discharge"                               
                                                                                
  DX1                LENGTH=$5                                                  
  LABEL="I:Principal diagnosis"                                                 
                                                                                
  DX2                LENGTH=$5                                                  
  LABEL="I:Diagnosis 2"                                                         
                                                                                
  DX3                LENGTH=$5                                                  
  LABEL="I:Diagnosis 3"                                                         
                                                                                
  DX4                LENGTH=$5                                                  
  LABEL="I:Diagnosis 4"                                                         
                                                                                
  DX5                LENGTH=$5                                                  
  LABEL="I:Diagnosis 5"                                                         
                                                                                
  DX6                LENGTH=$5                                                  
  LABEL="I:Diagnosis 6"                                                         
                                                                                
  DX7                LENGTH=$5                                                  
  LABEL="I:Diagnosis 7"                                                         
                                                                                
  DX8                LENGTH=$5                                                  
  LABEL="I:Diagnosis 8"                                                         
                                                                                
  DX9                LENGTH=$5                                                  
  LABEL="I:Diagnosis 9"                                                         
                                                                                
  DX10               LENGTH=$5                                                  
  LABEL="I:Diagnosis 10"                                                        
                                                                                
  DX11               LENGTH=$5                                                  
  LABEL="I:Diagnosis 11"                                                        
                                                                                
  DX12               LENGTH=$5                                                  
  LABEL="I:Diagnosis 12"                                                        
                                                                                
  DX13               LENGTH=$5                                                  
  LABEL="I:Diagnosis 13"                                                        
                                                                                
  DX14               LENGTH=$5                                                  
  LABEL="I:Diagnosis 14"                                                        
                                                                                
  DX15               LENGTH=$5                                                  
  LABEL="I:Diagnosis 15"                                                        
                                                                                
  DX16               LENGTH=$5                                                  
  LABEL="I:Diagnosis 16"                                                        
                                                                                
  DX17               LENGTH=$5                                                  
  LABEL="I:Diagnosis 17"                                                        
                                                                                
  DX18               LENGTH=$5                                                  
  LABEL="I:Diagnosis 18"                                                        
                                                                                
  DX19               LENGTH=$5                                                  
  LABEL="I:Diagnosis 19"                                                        
                                                                                
  DX20               LENGTH=$5                                                  
  LABEL="I:Diagnosis 20"                                                        
                                                                                
  DX21               LENGTH=$5                                                  
  LABEL="I:Diagnosis 21"                                                        
                                                                                
  DX22               LENGTH=$5                                                  
  LABEL="I:Diagnosis 22"                                                        
                                                                                
  DX23               LENGTH=$5                                                  
  LABEL="I:Diagnosis 23"                                                        
                                                                                
  DX24               LENGTH=$5                                                  
  LABEL="I:Diagnosis 24"                                                        
                                                                                
  DX25               LENGTH=$5                                                  
  LABEL="I:Diagnosis 25"                                                        
                                                                                
  DX26               LENGTH=$5                                                  
  LABEL="I:Diagnosis 26"                                                        
                                                                                
  DX27               LENGTH=$5                                                  
  LABEL="I:Diagnosis 27"                                                        
                                                                                
  DX28               LENGTH=$5                                                  
  LABEL="I:Diagnosis 28"                                                        
                                                                                
  DX29               LENGTH=$5                                                  
  LABEL="I:Diagnosis 29"                                                        
                                                                                
  DX30               LENGTH=$5                                                  
  LABEL="I:Diagnosis 30"                                                        
                                                                                
  DXV1               LENGTH=3                                                   
  LABEL="I:Validity flag: principal diagnosis"                                  
                                                                                
  DXV2               LENGTH=3                                                   
  LABEL="I:Validity flag: diagnosis 2"                                          
                                                                                
  DXV3               LENGTH=3                                                   
  LABEL="I:Validity flag: diagnosis 3"                                          
                                                                                
  DXV4               LENGTH=3                                                   
  LABEL="I:Validity flag: diagnosis 4"                                          
                                                                                
  DXV5               LENGTH=3                                                   
  LABEL="I:Validity flag: diagnosis 5"                                          
                                                                                
  DXV6               LENGTH=3                                                   
  LABEL="I:Validity flag: diagnosis 6"                                          
                                                                                
  DXV7               LENGTH=3                                                   
  LABEL="I:Validity flag: diagnosis 7"                                          
                                                                                
  DXV8               LENGTH=3                                                   
  LABEL="I:Validity flag: diagnosis 8"                                          
                                                                                
  DXV9               LENGTH=3                                                   
  LABEL="I:Validity flag: diagnosis 9"                                          
                                                                                
  DXV10              LENGTH=3                                                   
  LABEL="I:Validity flag: diagnosis 10"                                         
                                                                                
  DXV11              LENGTH=3                                                   
  LABEL="I:Validity flag: diagnosis 11"                                         
                                                                                
  DXV12              LENGTH=3                                                   
  LABEL="I:Validity flag: diagnosis 12"                                         
                                                                                
  DXV13              LENGTH=3                                                   
  LABEL="I:Validity flag: diagnosis 13"                                         
                                                                                
  DXV14              LENGTH=3                                                   
  LABEL="I:Validity flag: diagnosis 14"                                         
                                                                                
  DXV15              LENGTH=3                                                   
  LABEL="I:Validity flag: diagnosis 15"                                         
                                                                                
  DXV16              LENGTH=3                                                   
  LABEL="I:Validity flag: diagnosis 16"                                         
                                                                                
  DXV17              LENGTH=3                                                   
  LABEL="I:Validity flag: diagnosis 17"                                         
                                                                                
  DXV18              LENGTH=3                                                   
  LABEL="I:Validity flag: diagnosis 18"                                         
                                                                                
  DXV19              LENGTH=3                                                   
  LABEL="I:Validity flag: diagnosis 19"                                         
                                                                                
  DXV20              LENGTH=3                                                   
  LABEL="I:Validity flag: diagnosis 20"                                         
                                                                                
  DXV21              LENGTH=3                                                   
  LABEL="I:Validity flag: diagnosis 21"                                         
                                                                                
  DXV22              LENGTH=3                                                   
  LABEL="I:Validity flag: diagnosis 22"                                         
                                                                                
  DXV23              LENGTH=3                                                   
  LABEL="I:Validity flag: diagnosis 23"                                         
                                                                                
  DXV24              LENGTH=3                                                   
  LABEL="I:Validity flag: diagnosis 24"                                         
                                                                                
  DXV25              LENGTH=3                                                   
  LABEL="I:Validity flag: diagnosis 25"                                         
                                                                                
  DXV26              LENGTH=3                                                   
  LABEL="I:Validity flag: diagnosis 26"                                         
                                                                                
  DXV27              LENGTH=3                                                   
  LABEL="I:Validity flag: diagnosis 27"                                         
                                                                                
  DXV28              LENGTH=3                                                   
  LABEL="I:Validity flag: diagnosis 28"                                         
                                                                                
  DXV29              LENGTH=3                                                   
  LABEL="I:Validity flag: diagnosis 29"                                         
                                                                                
  DXV30              LENGTH=3                                                   
  LABEL="I:Validity flag: diagnosis 30"                                         
                                                                                
  DCCHPR1            LENGTH=3                                                   
  LABEL="I:CCHPR: principal diagnosis"                                          
                                                                                
  DCCHPR2            LENGTH=3                                                   
  LABEL="I:CCHPR: diagnosis 2"                                                  
                                                                                
  DCCHPR3            LENGTH=3                                                   
  LABEL="I:CCHPR: diagnosis 3"                                                  
                                                                                
  DCCHPR4            LENGTH=3                                                   
  LABEL="I:CCHPR: diagnosis 4"                                                  
                                                                                
  DCCHPR5            LENGTH=3                                                   
  LABEL="I:CCHPR: diagnosis 5"                                                  
                                                                                
  DCCHPR6            LENGTH=3                                                   
  LABEL="I:CCHPR: diagnosis 6"                                                  
                                                                                
  DCCHPR7            LENGTH=3                                                   
  LABEL="I:CCHPR: diagnosis 7"                                                  
                                                                                
  DCCHPR8            LENGTH=3                                                   
  LABEL="I:CCHPR: diagnosis 8"                                                  
                                                                                
  DCCHPR9            LENGTH=3                                                   
  LABEL="I:CCHPR: diagnosis 9"                                                  
                                                                                
  DCCHPR10           LENGTH=3                                                   
  LABEL="I:CCHPR: diagnosis 10"                                                 
                                                                                
  DCCHPR11           LENGTH=3                                                   
  LABEL="I:CCHPR: diagnosis 11"                                                 
                                                                                
  DCCHPR12           LENGTH=3                                                   
  LABEL="I:CCHPR: diagnosis 12"                                                 
                                                                                
  DCCHPR13           LENGTH=3                                                   
  LABEL="I:CCHPR: diagnosis 13"                                                 
                                                                                
  DCCHPR14           LENGTH=3                                                   
  LABEL="I:CCHPR: diagnosis 14"                                                 
                                                                                
  DCCHPR15           LENGTH=3                                                   
  LABEL="I:CCHPR: diagnosis 15"                                                 
                                                                                
  DCCHPR16           LENGTH=3                                                   
  LABEL="I:CCHPR: diagnosis 16"                                                 
                                                                                
  DCCHPR17           LENGTH=3                                                   
  LABEL="I:CCHPR: diagnosis 17"                                                 
                                                                                
  DCCHPR18           LENGTH=3                                                   
  LABEL="I:CCHPR: diagnosis 18"                                                 
                                                                                
  DCCHPR19           LENGTH=3                                                   
  LABEL="I:CCHPR: diagnosis 19"                                                 
                                                                                
  DCCHPR20           LENGTH=3                                                   
  LABEL="I:CCHPR: diagnosis 20"                                                 
                                                                                
  DCCHPR21           LENGTH=3                                                   
  LABEL="I:CCHPR: diagnosis 21"                                                 
                                                                                
  DCCHPR22           LENGTH=3                                                   
  LABEL="I:CCHPR: diagnosis 22"                                                 
                                                                                
  DCCHPR23           LENGTH=3                                                   
  LABEL="I:CCHPR: diagnosis 23"                                                 
                                                                                
  DCCHPR24           LENGTH=3                                                   
  LABEL="I:CCHPR: diagnosis 24"                                                 
                                                                                
  DCCHPR25           LENGTH=3                                                   
  LABEL="I:CCHPR: diagnosis 25"                                                 
                                                                                
  DCCHPR26           LENGTH=3                                                   
  LABEL="I:CCHPR: diagnosis 26"                                                 
                                                                                
  DCCHPR27           LENGTH=3                                                   
  LABEL="I:CCHPR: diagnosis 27"                                                 
                                                                                
  DCCHPR28           LENGTH=3                                                   
  LABEL="I:CCHPR: diagnosis 28"                                                 
                                                                                
  DCCHPR29           LENGTH=3                                                   
  LABEL="I:CCHPR: diagnosis 29"                                                 
                                                                                
  DCCHPR30           LENGTH=3                                                   
  LABEL="I:CCHPR: diagnosis 30"                                                 
                                                                                
  PRSYS              LENGTH=3                                                   
  LABEL="I:Procedure coding system"                                             
                                                                                
  DSNPR              LENGTH=3                                                   
  LABEL="I:Max number of procedures from source"                                
                                                                                
  NPR                LENGTH=3                                                   
  LABEL="I:Number of procedures on this discharge"                              
                                                                                
  PR1                LENGTH=$4                                                  
  LABEL="I:Principal procedure"                                                 
                                                                                
  PR2                LENGTH=$4                                                  
  LABEL="I:Procedure 2"                                                         
                                                                                
  PR3                LENGTH=$4                                                  
  LABEL="I:Procedure 3"                                                         
                                                                                
  PR4                LENGTH=$4                                                  
  LABEL="I:Procedure 4"                                                         
                                                                                
  PR5                LENGTH=$4                                                  
  LABEL="I:Procedure 5"                                                         
                                                                                
  PR6                LENGTH=$4                                                  
  LABEL="I:Procedure 6"                                                         
                                                                                
  PR7                LENGTH=$4                                                  
  LABEL="I:Procedure 7"                                                         
                                                                                
  PR8                LENGTH=$4                                                  
  LABEL="I:Procedure 8"                                                         
                                                                                
  PR9                LENGTH=$4                                                  
  LABEL="I:Procedure 9"                                                         
                                                                                
  PR10               LENGTH=$4                                                  
  LABEL="I:Procedure 10"                                                        
                                                                                
  PR11               LENGTH=$4                                                  
  LABEL="I:Procedure 11"                                                        
                                                                                
  PR12               LENGTH=$4                                                  
  LABEL="I:Procedure 12"                                                        
                                                                                
  PR13               LENGTH=$4                                                  
  LABEL="I:Procedure 13"                                                        
                                                                                
  PR14               LENGTH=$4                                                  
  LABEL="I:Procedure 14"                                                        
                                                                                
  PR15               LENGTH=$4                                                  
  LABEL="I:Procedure 15"                                                        
                                                                                
  PR16               LENGTH=$4                                                  
  LABEL="I:Procedure 16"                                                        
                                                                                
  PR17               LENGTH=$4                                                  
  LABEL="I:Procedure 17"                                                        
                                                                                
  PR18               LENGTH=$4                                                  
  LABEL="I:Procedure 18"                                                        
                                                                                
  PR19               LENGTH=$4                                                  
  LABEL="I:Procedure 19"                                                        
                                                                                
  PR20               LENGTH=$4                                                  
  LABEL="I:Procedure 20"                                                        
                                                                                
  PR21               LENGTH=$4                                                  
  LABEL="I:Procedure 21"                                                        
                                                                                
  PRV1               LENGTH=3                                                   
  LABEL="I:Validity flag: principal procedure"                                  
                                                                                
  PRV2               LENGTH=3                                                   
  LABEL="I:Validity flag: procedure 2"                                          
                                                                                
  PRV3               LENGTH=3                                                   
  LABEL="I:Validity flag: procedure 3"                                          
                                                                                
  PRV4               LENGTH=3                                                   
  LABEL="I:Validity flag: procedure 4"                                          
                                                                                
  PRV5               LENGTH=3                                                   
  LABEL="I:Validity flag: procedure 5"                                          
                                                                                
  PRV6               LENGTH=3                                                   
  LABEL="I:Validity flag: procedure 6"                                          
                                                                                
  PRV7               LENGTH=3                                                   
  LABEL="I:Validity flag: procedure 7"                                          
                                                                                
  PRV8               LENGTH=3                                                   
  LABEL="I:Validity flag: procedure 8"                                          
                                                                                
  PRV9               LENGTH=3                                                   
  LABEL="I:Validity flag: procedure 9"                                          
                                                                                
  PRV10              LENGTH=3                                                   
  LABEL="I:Validity flag: procedure 10"                                         
                                                                                
  PRV11              LENGTH=3                                                   
  LABEL="I:Validity flag: procedure 11"                                         
                                                                                
  PRV12              LENGTH=3                                                   
  LABEL="I:Validity flag: procedure 12"                                         
                                                                                
  PRV13              LENGTH=3                                                   
  LABEL="I:Validity flag: procedure 13"                                         
                                                                                
  PRV14              LENGTH=3                                                   
  LABEL="I:Validity flag: procedure 14"                                         
                                                                                
  PRV15              LENGTH=3                                                   
  LABEL="I:Validity flag: procedure 15"                                         
                                                                                
  PRV16              LENGTH=3                                                   
  LABEL="I:Validity flag: procedure 16"                                         
                                                                                
  PRV17              LENGTH=3                                                   
  LABEL="I:Validity flag: procedure 17"                                         
                                                                                
  PRV18              LENGTH=3                                                   
  LABEL="I:Validity flag: procedure 18"                                         
                                                                                
  PRV19              LENGTH=3                                                   
  LABEL="I:Validity flag: procedure 19"                                         
                                                                                
  PRV20              LENGTH=3                                                   
  LABEL="I:Validity flag: procedure 20"                                         
                                                                                
  PRV21              LENGTH=3                                                   
  LABEL="I:Validity flag: procedure 21"                                         
                                                                                
  PCCHPR1            LENGTH=3                                                   
  LABEL="I:CCHPR: principal procedure"                                          
                                                                                
  PCCHPR2            LENGTH=3                                                   
  LABEL="I:CCHPR: procedure 2"                                                  
                                                                                
  PCCHPR3            LENGTH=3                                                   
  LABEL="I:CCHPR: procedure 3"                                                  
                                                                                
  PCCHPR4            LENGTH=3                                                   
  LABEL="I:CCHPR: procedure 4"                                                  
                                                                                
  PCCHPR5            LENGTH=3                                                   
  LABEL="I:CCHPR: procedure 5"                                                  
                                                                                
  PCCHPR6            LENGTH=3                                                   
  LABEL="I:CCHPR: procedure 6"                                                  
                                                                                
  PCCHPR7            LENGTH=3                                                   
  LABEL="I:CCHPR: procedure 7"                                                  
                                                                                
  PCCHPR8            LENGTH=3                                                   
  LABEL="I:CCHPR: procedure 8"                                                  
                                                                                
  PCCHPR9            LENGTH=3                                                   
  LABEL="I:CCHPR: procedure 9"                                                  
                                                                                
  PCCHPR10           LENGTH=3                                                   
  LABEL="I:CCHPR: procedure 10"                                                 
                                                                                
  PCCHPR11           LENGTH=3                                                   
  LABEL="I:CCHPR: procedure 11"                                                 
                                                                                
  PCCHPR12           LENGTH=3                                                   
  LABEL="I:CCHPR: procedure 12"                                                 
                                                                                
  PCCHPR13           LENGTH=3                                                   
  LABEL="I:CCHPR: procedure 13"                                                 
                                                                                
  PCCHPR14           LENGTH=3                                                   
  LABEL="I:CCHPR: procedure 14"                                                 
                                                                                
  PCCHPR15           LENGTH=3                                                   
  LABEL="I:CCHPR: procedure 15"                                                 
                                                                                
  PCCHPR16           LENGTH=3                                                   
  LABEL="I:CCHPR: procedure 16"                                                 
                                                                                
  PCCHPR17           LENGTH=3                                                   
  LABEL="I:CCHPR: procedure 17"                                                 
                                                                                
  PCCHPR18           LENGTH=3                                                   
  LABEL="I:CCHPR: procedure 18"                                                 
                                                                                
  PCCHPR19           LENGTH=3                                                   
  LABEL="I:CCHPR: procedure 19"                                                 
                                                                                
  PCCHPR20           LENGTH=3                                                   
  LABEL="I:CCHPR: procedure 20"                                                 
                                                                                
  PCCHPR21           LENGTH=3                                                   
  LABEL="I:CCHPR: procedure 21"                                                 
                                                                                
  PRDAY1             LENGTH=3                                                   
  LABEL="I:No. of days from admission to PR1"                                   
                                                                                
  PRDAY2             LENGTH=3                                                   
  LABEL="I:No. of days from admission to PR2"                                   
                                                                                
  PRDAY3             LENGTH=3                                                   
  LABEL="I:No. of days from admission to PR3"                                   
                                                                                
  PRDAY4             LENGTH=3                                                   
  LABEL="I:No. of days from admission to PR4"                                   
                                                                                
  PRDAY5             LENGTH=3                                                   
  LABEL="I:No. of days from admission to PR5"                                   
                                                                                
  PRDAY6             LENGTH=3                                                   
  LABEL="I:No. of days from admission to PR6"                                   
                                                                                
  PRDAY7             LENGTH=3                                                   
  LABEL="I:No. of days from admission to PR7"                                   
                                                                                
  PRDAY8             LENGTH=3                                                   
  LABEL="I:No. of days from admission to PR8"                                   
                                                                                
  PRDAY9             LENGTH=3                                                   
  LABEL="I:No. of days from admission to PR9"                                   
                                                                                
  PRDAY10            LENGTH=3                                                   
  LABEL="I:No. of days from admission to PR10"                                  
                                                                                
  PRDAY11            LENGTH=3                                                   
  LABEL="I:No. of days from admission to PR11"                                  
                                                                                
  PRDAY12            LENGTH=3                                                   
  LABEL="I:No. of days from admission to PR12"                                  
                                                                                
  PRDAY13            LENGTH=3                                                   
  LABEL="I:No. of days from admission to PR13"                                  
                                                                                
  PRDAY14            LENGTH=3                                                   
  LABEL="I:No. of days from admission to PR14"                                  
                                                                                
  PRDAY15            LENGTH=3                                                   
  LABEL="I:No. of days from admission to PR15"                                  
                                                                                
  PRDAY16            LENGTH=3                                                   
  LABEL="I:No. of days from admission to PR16"                                  
                                                                                
  PRDAY17            LENGTH=3                                                   
  LABEL="I:No. of days from admission to PR17"                                  
                                                                                
  PRDAY18            LENGTH=3                                                   
  LABEL="I:No. of days from admission to PR18"                                  
                                                                                
  PRDAY19            LENGTH=3                                                   
  LABEL="I:No. of days from admission to PR19"                                  
                                                                                
  PRDAY20            LENGTH=3                                                   
  LABEL="I:No. of days from admission to PR20"                                  
                                                                                
  PRDAY21            LENGTH=3                                                   
  LABEL="I:No. of days from admission to PR21"                                  
                                                                                
  DRG                LENGTH=3                                                   
  LABEL="I:DRG in effect on discharge date"                                     
                                                                                
  MDC                LENGTH=3                                                   
  LABEL="I:MDC in effect on discharge date"                                     
                                                                                
  DRGVER             LENGTH=3                                                   
  LABEL="I:DRG grouper version used on disch date"                              
                                                                                
  DRG10              LENGTH=3                                                   
  LABEL="I:DRG, Version 10"                                                     
                                                                                
  MDC10              LENGTH=3                                                   
  LABEL="I:MDC, Version 10"                                                     
                                                                                
  PAY1               LENGTH=3                                                   
  LABEL="I:Primary expected payer, uniform"                                     
                                                                                
  PAY1_N             LENGTH=3                                                   
  LABEL="I:Primary expected payer, nonuniform"                                  
                                                                                
  TOTCHG             LENGTH=6                                                   
  LABEL="I:Total charges (cleaned)"                                             
                                                                                
  TOTCHG_X           LENGTH=7                                                   
  LABEL="I:Total charges (from data source)"                                    
                                                                                
  PNUM_S             LENGTH=$17                                                 
  LABEL="I:Person number (synthetic)"                                           
                                                                                
  PAY1_X             LENGTH=$17                                                 
  LABEL="I:Primary exp. payer (from data source)"                               
                                                                                
  ADRG               LENGTH=3                                                   
  LABEL="I:All Patient Refined DRG"                                             
                                                                                
  ADRGSEV            LENGTH=3                                                   
  LABEL="I:All Patient Refined DRG severity level"                              
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      PROCESS             N11PF.                                        
      @12     YEAR                N4PF.                                         
      @16     DSNUM               N3PF.                                         
      @19     DSTYPE              N3PF.                                         
      @22     HOSPST              $CHAR2.                                       
      @24     AGE                 N3PF.                                         
      @27     AGEDAY              N3PF.                                         
      @30     SEX                 N3PF.                                         
      @33     RACE                N2PF.                                         
      @35     ADAYWK              N3PF.                                         
      @38     AMONTH              N2PF.                                         
      @40     DQTR                N2PF.                                         
      @42     LOS                 N5PF.                                         
      @47     LOS_X               N6PF.                                         
      @53     DISP                N2PF.                                         
      @55     DIED                N2PF.                                         
      @57     NEOMAT              N2PF.                                         
      @59     ASOURCE             N2PF.                                         
      @61     DXSYS               N3PF.                                         
      @64     DSNDX               N3PF.                                         
      @67     NDX                 N2PF.                                         
      @69     DX1                 $CHAR5.                                       
      @74     DX2                 $CHAR5.                                       
      @79     DX3                 $CHAR5.                                       
      @84     DX4                 $CHAR5.                                       
      @89     DX5                 $CHAR5.                                       
      @94     DX6                 $CHAR5.                                       
      @99     DX7                 $CHAR5.                                       
      @104    DX8                 $CHAR5.                                       
      @109    DX9                 $CHAR5.                                       
      @114    DX10                $CHAR5.                                       
      @119    DX11                $CHAR5.                                       
      @124    DX12                $CHAR5.                                       
      @129    DX13                $CHAR5.                                       
      @134    DX14                $CHAR5.                                       
      @139    DX15                $CHAR5.                                       
      @144    DX16                $CHAR5.                                       
      @149    DX17                $CHAR5.                                       
      @154    DX18                $CHAR5.                                       
      @159    DX19                $CHAR5.                                       
      @164    DX20                $CHAR5.                                       
      @169    DX21                $CHAR5.                                       
      @174    DX22                $CHAR5.                                       
      @179    DX23                $CHAR5.                                       
      @184    DX24                $CHAR5.                                       
      @189    DX25                $CHAR5.                                       
      @194    DX26                $CHAR5.                                       
      @199    DX27                $CHAR5.                                       
      @204    DX28                $CHAR5.                                       
      @209    DX29                $CHAR5.                                       
      @214    DX30                $CHAR5.                                       
      @219    DXV1                N4PF.                                         
      @223    DXV2                N4PF.                                         
      @227    DXV3                N4PF.                                         
      @231    DXV4                N4PF.                                         
      @235    DXV5                N4PF.                                         
      @239    DXV6                N4PF.                                         
      @243    DXV7                N4PF.                                         
      @247    DXV8                N4PF.                                         
      @251    DXV9                N4PF.                                         
      @255    DXV10               N4PF.                                         
      @259    DXV11               N4PF.                                         
      @263    DXV12               N4PF.                                         
      @267    DXV13               N4PF.                                         
      @271    DXV14               N4PF.                                         
      @275    DXV15               N4PF.                                         
      @279    DXV16               N4PF.                                         
      @283    DXV17               N4PF.                                         
      @287    DXV18               N4PF.                                         
      @291    DXV19               N4PF.                                         
      @295    DXV20               N4PF.                                         
      @299    DXV21               N4PF.                                         
      @303    DXV22               N4PF.                                         
      @307    DXV23               N4PF.                                         
      @311    DXV24               N4PF.                                         
      @315    DXV25               N4PF.                                         
      @319    DXV26               N4PF.                                         
      @323    DXV27               N4PF.                                         
      @327    DXV28               N4PF.                                         
      @331    DXV29               N4PF.                                         
      @335    DXV30               N4PF.                                         
      @339    DCCHPR1             N4PF.                                         
      @343    DCCHPR2             N4PF.                                         
      @347    DCCHPR3             N4PF.                                         
      @351    DCCHPR4             N4PF.                                         
      @355    DCCHPR5             N4PF.                                         
      @359    DCCHPR6             N4PF.                                         
      @363    DCCHPR7             N4PF.                                         
      @367    DCCHPR8             N4PF.                                         
      @371    DCCHPR9             N4PF.                                         
      @375    DCCHPR10            N4PF.                                         
      @379    DCCHPR11            N4PF.                                         
      @383    DCCHPR12            N4PF.                                         
      @387    DCCHPR13            N4PF.                                         
      @391    DCCHPR14            N4PF.                                         
      @395    DCCHPR15            N4PF.                                         
      @399    DCCHPR16            N4PF.                                         
      @403    DCCHPR17            N4PF.                                         
      @407    DCCHPR18            N4PF.                                         
      @411    DCCHPR19            N4PF.                                         
      @415    DCCHPR20            N4PF.                                         
      @419    DCCHPR21            N4PF.                                         
      @423    DCCHPR22            N4PF.                                         
      @427    DCCHPR23            N4PF.                                         
      @431    DCCHPR24            N4PF.                                         
      @435    DCCHPR25            N4PF.                                         
      @439    DCCHPR26            N4PF.                                         
      @443    DCCHPR27            N4PF.                                         
      @447    DCCHPR28            N4PF.                                         
      @451    DCCHPR29            N4PF.                                         
      @455    DCCHPR30            N4PF.                                         
      @459    PRSYS               N3PF.                                         
      @462    DSNPR               N3PF.                                         
      @465    NPR                 N2PF.                                         
      @467    PR1                 $CHAR4.                                       
      @471    PR2                 $CHAR4.                                       
      @475    PR3                 $CHAR4.                                       
      @479    PR4                 $CHAR4.                                       
      @483    PR5                 $CHAR4.                                       
      @487    PR6                 $CHAR4.                                       
      @491    PR7                 $CHAR4.                                       
      @495    PR8                 $CHAR4.                                       
      @499    PR9                 $CHAR4.                                       
      @503    PR10                $CHAR4.                                       
      @507    PR11                $CHAR4.                                       
      @511    PR12                $CHAR4.                                       
      @515    PR13                $CHAR4.                                       
      @519    PR14                $CHAR4.                                       
      @523    PR15                $CHAR4.                                       
      @527    PR16                $CHAR4.                                       
      @531    PR17                $CHAR4.                                       
      @535    PR18                $CHAR4.                                       
      @539    PR19                $CHAR4.                                       
      @543    PR20                $CHAR4.                                       
      @547    PR21                $CHAR4.                                       
      @551    PRV1                N3PF.                                         
      @554    PRV2                N3PF.                                         
      @557    PRV3                N3PF.                                         
      @560    PRV4                N3PF.                                         
      @563    PRV5                N3PF.                                         
      @566    PRV6                N3PF.                                         
      @569    PRV7                N3PF.                                         
      @572    PRV8                N3PF.                                         
      @575    PRV9                N3PF.                                         
      @578    PRV10               N3PF.                                         
      @581    PRV11               N3PF.                                         
      @584    PRV12               N3PF.                                         
      @587    PRV13               N3PF.                                         
      @590    PRV14               N3PF.                                         
      @593    PRV15               N3PF.                                         
      @596    PRV16               N3PF.                                         
      @599    PRV17               N3PF.                                         
      @602    PRV18               N3PF.                                         
      @605    PRV19               N3PF.                                         
      @608    PRV20               N3PF.                                         
      @611    PRV21               N3PF.                                         
      @614    PCCHPR1             N4PF.                                         
      @618    PCCHPR2             N4PF.                                         
      @622    PCCHPR3             N4PF.                                         
      @626    PCCHPR4             N4PF.                                         
      @630    PCCHPR5             N4PF.                                         
      @634    PCCHPR6             N4PF.                                         
      @638    PCCHPR7             N4PF.                                         
      @642    PCCHPR8             N4PF.                                         
      @646    PCCHPR9             N4PF.                                         
      @650    PCCHPR10            N4PF.                                         
      @654    PCCHPR11            N4PF.                                         
      @658    PCCHPR12            N4PF.                                         
      @662    PCCHPR13            N4PF.                                         
      @666    PCCHPR14            N4PF.                                         
      @670    PCCHPR15            N4PF.                                         
      @674    PCCHPR16            N4PF.                                         
      @678    PCCHPR17            N4PF.                                         
      @682    PCCHPR18            N4PF.                                         
      @686    PCCHPR19            N4PF.                                         
      @690    PCCHPR20            N4PF.                                         
      @694    PCCHPR21            N4PF.                                         
      @698    PRDAY1              N5PF.                                         
      @703    PRDAY2              N5PF.                                         
      @708    PRDAY3              N5PF.                                         
      @713    PRDAY4              N5PF.                                         
      @718    PRDAY5              N5PF.                                         
      @723    PRDAY6              N5PF.                                         
      @728    PRDAY7              N5PF.                                         
      @733    PRDAY8              N5PF.                                         
      @738    PRDAY9              N5PF.                                         
      @743    PRDAY10             N5PF.                                         
      @748    PRDAY11             N5PF.                                         
      @753    PRDAY12             N5PF.                                         
      @758    PRDAY13             N5PF.                                         
      @763    PRDAY14             N5PF.                                         
      @768    PRDAY15             N5PF.                                         
      @773    PRDAY16             N5PF.                                         
      @778    PRDAY17             N5PF.                                         
      @783    PRDAY18             N5PF.                                         
      @788    PRDAY19             N5PF.                                         
      @793    PRDAY20             N5PF.                                         
      @798    PRDAY21             N5PF.                                         
      @803    DRG                 N3PF.                                         
      @806    MDC                 N2PF.                                         
      @808    DRGVER              N2PF.                                         
      @810    DRG10               N3PF.                                         
      @813    MDC10               N2PF.                                         
      @815    PAY1                N2PF.                                         
      @817    PAY1_N              N3PF.                                         
      @820    TOTCHG              N10PF.                                        
      @830    TOTCHG_X            N15P2F.                                       
      @845    PNUM_S              $CHAR17.                                      
      @862    PAY1_X              $CHAR17.                                      
      @879    ADRG                N3PF.                                         
      @882    ADRGSEV             N2PF.                                         
      ;                                                                         
                                                                                
                                                                                
RUN;
