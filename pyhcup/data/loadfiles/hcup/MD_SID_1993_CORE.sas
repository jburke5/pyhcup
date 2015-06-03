/*******************************************************************            
*   MD_SID_1993_CORE.SAS:                                                       
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
DATA MD_SIDC_1993_CORE;                                                         
INFILE 'MD_SID_1993_CORE.ASC' LRECL = 637;                                      
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  AGE                LENGTH=3                                                   
  LABEL="I:Age in years at admission"                                           
                                                                                
  AGEDAY             LENGTH=3                                                   
  LABEL="I:Age in days (when < 1 year)"                                         
                                                                                
  SEX                LENGTH=3                                                   
  LABEL="I:Sex"                                                                 
                                                                                
  RACE               LENGTH=3                                                   
  LABEL="I:Race"                                                                
                                                                                
  DQTR               LENGTH=3                                                   
  LABEL="I:Discharge quarter"                                                   
                                                                                
  LOS                LENGTH=4                                                   
  LABEL="I:Length of stay (cleaned)"                                            
                                                                                
  DISP               LENGTH=3                                                   
  LABEL="I:Disposition of patient"                                              
                                                                                
  DIED               LENGTH=3                                                   
  LABEL="I:Died during hospitalization"                                         
                                                                                
  ATYPE              LENGTH=3                                                   
  LABEL="I:Admission type"                                                      
                                                                                
  ASOURCE            LENGTH=3                                                   
  LABEL="I:Admission source"                                                    
                                                                                
  NDX                LENGTH=3                                                   
  LABEL="I:Number of diagnoses on this discharge"                               
                                                                                
  DX1                LENGTH=$5                                                  
  LABEL="I:Principal diagnosis"                                                 
                                                                                
  DXV1               LENGTH=3                                                   
  LABEL="I:Validity flag: principal diagnosis"                                  
                                                                                
  DCCHPR1            LENGTH=3                                                   
  LABEL="I:CCHPR: principal diagnosis"                                          
                                                                                
  NPR                LENGTH=3                                                   
  LABEL="I:Number of procedures on this discharge"                              
                                                                                
  PR1                LENGTH=$4                                                  
  LABEL="I:Principal procedure"                                                 
                                                                                
  PRV1               LENGTH=3                                                   
  LABEL="I:Validity flag: principal procedure"                                  
                                                                                
  PCCHPR1            LENGTH=3                                                   
  LABEL="I:CCHPR: principal procedure"                                          
                                                                                
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
                                                                                
  TOTCHG             LENGTH=6                                                   
  LABEL="I:Total charges (cleaned)"                                             
                                                                                
  PROCESS            LENGTH=6                                                   
  LABEL="I:HCUP-3 discharge processing ID number"                               
                                                                                
  YEAR               LENGTH=3                                                   
  LABEL="Calendar year"                                                         
                                                                                
  DSHOSPID           LENGTH=$13                                                 
  LABEL="I:Data source hospital ID number"                                      
                                                                                
  DSNUM              LENGTH=3                                                   
  LABEL="I:Data source ID number"                                               
                                                                                
  DSTYPE             LENGTH=3                                                   
  LABEL="I:Data source type"                                                    
                                                                                
  HOSPST             LENGTH=$2                                                  
  LABEL="Hospital state postal code"                                            
                                                                                
  MDID_S             LENGTH=$16                                                 
  LABEL="I:Attending physician number (synthetic)"                              
                                                                                
  SURGID_S           LENGTH=$16                                                 
  LABEL="I:Primary surgeon number (synthetic)"                                  
                                                                                
  ADAYWK             LENGTH=3                                                   
  LABEL="I:Admission day of week"                                               
                                                                                
  LOS_X              LENGTH=4                                                   
  LABEL="I:Length of stay (uncleaned)"                                          
                                                                                
  NEOMAT             LENGTH=3                                                   
  LABEL="I:Neonatal and/or maternal DX and/or PR"                               
                                                                                
  DXSYS              LENGTH=3                                                   
  LABEL="I:Diagnosis coding system"                                             
                                                                                
  DSNDX              LENGTH=3                                                   
  LABEL="I:Max number of diagnoses from source"                                 
                                                                                
  PRSYS              LENGTH=3                                                   
  LABEL="I:Procedure coding system"                                             
                                                                                
  DSNPR              LENGTH=3                                                   
  LABEL="I:Max number of procedures from source"                                
                                                                                
  PRDAY1             LENGTH=4                                                   
  LABEL="I:No. of days from admission to PR1"                                   
                                                                                
  PAY1_N             LENGTH=3                                                   
  LABEL="I:Primary expected payer, nonuniform"                                  
                                                                                
  PAY2               LENGTH=3                                                   
  LABEL="I:Secondary expected payer, uniform"                                   
                                                                                
  PAY2_N             LENGTH=3                                                   
  LABEL="I:Secondary expected payer, nonuniform"                                
                                                                                
  TOTCHG_X           LENGTH=6                                                   
  LABEL="I:Total charges (from data source)"                                    
                                                                                
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
                                                                                
  PRDAY2             LENGTH=4                                                   
  LABEL="I:No. of days from admission to PR2"                                   
                                                                                
  PRDAY3             LENGTH=4                                                   
  LABEL="I:No. of days from admission to PR3"                                   
                                                                                
  PRDAY4             LENGTH=4                                                   
  LABEL="I:No. of days from admission to PR4"                                   
                                                                                
  PRDAY5             LENGTH=4                                                   
  LABEL="I:No. of days from admission to PR5"                                   
                                                                                
  PRDAY6             LENGTH=4                                                   
  LABEL="I:No. of days from admission to PR6"                                   
                                                                                
  PRDAY7             LENGTH=4                                                   
  LABEL="I:No. of days from admission to PR7"                                   
                                                                                
  PRDAY8             LENGTH=4                                                   
  LABEL="I:No. of days from admission to PR8"                                   
                                                                                
  PRDAY9             LENGTH=4                                                   
  LABEL="I:No. of days from admission to PR9"                                   
                                                                                
  PRDAY10            LENGTH=4                                                   
  LABEL="I:No. of days from admission to PR10"                                  
                                                                                
  PRDAY11            LENGTH=4                                                   
  LABEL="I:No. of days from admission to PR11"                                  
                                                                                
  PRDAY12            LENGTH=4                                                   
  LABEL="I:No. of days from admission to PR12"                                  
                                                                                
  PRDAY13            LENGTH=4                                                   
  LABEL="I:No. of days from admission to PR13"                                  
                                                                                
  PRDAY14            LENGTH=4                                                   
  LABEL="I:No. of days from admission to PR14"                                  
                                                                                
  PRDAY15            LENGTH=4                                                   
  LABEL="I:No. of days from admission to PR15"                                  
                                                                                
  MRN_S              LENGTH=$17                                                 
  LABEL="I:Medical record number (synthetic)"                                   
                                                                                
  BWT                LENGTH=3                                                   
  LABEL="I:Birthweight in grams"                                                
                                                                                
  PAY1_X             LENGTH=$2                                                  
  LABEL="I:Primary exp. payer (from data source)"                               
                                                                                
  PAY2_X             LENGTH=$2                                                  
  LABEL="I:Secondary exp. payer (from data source"                              
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      AGE                 N3PF.                                         
      @4      AGEDAY              N3PF.                                         
      @7      SEX                 N3PF.                                         
      @10     RACE                N2PF.                                         
      @12     DQTR                N2PF.                                         
      @14     LOS                 N5PF.                                         
      @19     DISP                N2PF.                                         
      @21     DIED                N2PF.                                         
      @23     ATYPE               N2PF.                                         
      @25     ASOURCE             N2PF.                                         
      @27     NDX                 N2PF.                                         
      @29     DX1                 $CHAR5.                                       
      @34     DXV1                N4PF.                                         
      @38     DCCHPR1             N4PF.                                         
      @42     NPR                 N2PF.                                         
      @44     PR1                 $CHAR4.                                       
      @48     PRV1                N3PF.                                         
      @51     PCCHPR1             N4PF.                                         
      @55     DRG                 N3PF.                                         
      @58     MDC                 N2PF.                                         
      @60     DRGVER              N2PF.                                         
      @62     DRG10               N3PF.                                         
      @65     MDC10               N2PF.                                         
      @67     PAY1                N2PF.                                         
      @69     TOTCHG              N10PF.                                        
      @79     PROCESS             11.                                           
      @90     YEAR                N4PF.                                         
      @94     DSHOSPID            $CHAR13.                                      
      @107    DSNUM               N3PF.                                         
      @110    DSTYPE              N3PF.                                         
      @113    HOSPST              $CHAR2.                                       
      @115    MDID_S              $CHAR16.                                      
      @131    SURGID_S            $CHAR16.                                      
      @147    ADAYWK              N3PF.                                         
      @150    LOS_X               N5PF.                                         
      @155    NEOMAT              N2PF.                                         
      @157    DXSYS               N3PF.                                         
      @160    DSNDX               N3PF.                                         
      @163    PRSYS               N3PF.                                         
      @166    DSNPR               N3PF.                                         
      @169    PRDAY1              N5PF.                                         
      @174    PAY1_N              N3PF.                                         
      @177    PAY2                N2PF.                                         
      @179    PAY2_N              N3PF.                                         
      @182    TOTCHG_X            N12P2F.                                       
      @194    DX2                 $CHAR5.                                       
      @199    DX3                 $CHAR5.                                       
      @204    DX4                 $CHAR5.                                       
      @209    DX5                 $CHAR5.                                       
      @214    DX6                 $CHAR5.                                       
      @219    DX7                 $CHAR5.                                       
      @224    DX8                 $CHAR5.                                       
      @229    DX9                 $CHAR5.                                       
      @234    DX10                $CHAR5.                                       
      @239    DX11                $CHAR5.                                       
      @244    DX12                $CHAR5.                                       
      @249    DX13                $CHAR5.                                       
      @254    DX14                $CHAR5.                                       
      @259    DX15                $CHAR5.                                       
      @264    DX16                $CHAR5.                                       
      @269    DXV2                N4PF.                                         
      @273    DXV3                N4PF.                                         
      @277    DXV4                N4PF.                                         
      @281    DXV5                N4PF.                                         
      @285    DXV6                N4PF.                                         
      @289    DXV7                N4PF.                                         
      @293    DXV8                N4PF.                                         
      @297    DXV9                N4PF.                                         
      @301    DXV10               N4PF.                                         
      @305    DXV11               N4PF.                                         
      @309    DXV12               N4PF.                                         
      @313    DXV13               N4PF.                                         
      @317    DXV14               N4PF.                                         
      @321    DXV15               N4PF.                                         
      @325    DXV16               N4PF.                                         
      @329    DCCHPR2             N4PF.                                         
      @333    DCCHPR3             N4PF.                                         
      @337    DCCHPR4             N4PF.                                         
      @341    DCCHPR5             N4PF.                                         
      @345    DCCHPR6             N4PF.                                         
      @349    DCCHPR7             N4PF.                                         
      @353    DCCHPR8             N4PF.                                         
      @357    DCCHPR9             N4PF.                                         
      @361    DCCHPR10            N4PF.                                         
      @365    DCCHPR11            N4PF.                                         
      @369    DCCHPR12            N4PF.                                         
      @373    DCCHPR13            N4PF.                                         
      @377    DCCHPR14            N4PF.                                         
      @381    DCCHPR15            N4PF.                                         
      @385    DCCHPR16            N4PF.                                         
      @389    PR2                 $CHAR4.                                       
      @393    PR3                 $CHAR4.                                       
      @397    PR4                 $CHAR4.                                       
      @401    PR5                 $CHAR4.                                       
      @405    PR6                 $CHAR4.                                       
      @409    PR7                 $CHAR4.                                       
      @413    PR8                 $CHAR4.                                       
      @417    PR9                 $CHAR4.                                       
      @421    PR10                $CHAR4.                                       
      @425    PR11                $CHAR4.                                       
      @429    PR12                $CHAR4.                                       
      @433    PR13                $CHAR4.                                       
      @437    PR14                $CHAR4.                                       
      @441    PR15                $CHAR4.                                       
      @445    PRV2                N3PF.                                         
      @448    PRV3                N3PF.                                         
      @451    PRV4                N3PF.                                         
      @454    PRV5                N3PF.                                         
      @457    PRV6                N3PF.                                         
      @460    PRV7                N3PF.                                         
      @463    PRV8                N3PF.                                         
      @466    PRV9                N3PF.                                         
      @469    PRV10               N3PF.                                         
      @472    PRV11               N3PF.                                         
      @475    PRV12               N3PF.                                         
      @478    PRV13               N3PF.                                         
      @481    PRV14               N3PF.                                         
      @484    PRV15               N3PF.                                         
      @487    PCCHPR2             N4PF.                                         
      @491    PCCHPR3             N4PF.                                         
      @495    PCCHPR4             N4PF.                                         
      @499    PCCHPR5             N4PF.                                         
      @503    PCCHPR6             N4PF.                                         
      @507    PCCHPR7             N4PF.                                         
      @511    PCCHPR8             N4PF.                                         
      @515    PCCHPR9             N4PF.                                         
      @519    PCCHPR10            N4PF.                                         
      @523    PCCHPR11            N4PF.                                         
      @527    PCCHPR12            N4PF.                                         
      @531    PCCHPR13            N4PF.                                         
      @535    PCCHPR14            N4PF.                                         
      @539    PCCHPR15            N4PF.                                         
      @543    PRDAY2              N5PF.                                         
      @548    PRDAY3              N5PF.                                         
      @553    PRDAY4              N5PF.                                         
      @558    PRDAY5              N5PF.                                         
      @563    PRDAY6              N5PF.                                         
      @568    PRDAY7              N5PF.                                         
      @573    PRDAY8              N5PF.                                         
      @578    PRDAY9              N5PF.                                         
      @583    PRDAY10             N5PF.                                         
      @588    PRDAY11             N5PF.                                         
      @593    PRDAY12             N5PF.                                         
      @598    PRDAY13             N5PF.                                         
      @603    PRDAY14             N5PF.                                         
      @608    PRDAY15             N5PF.                                         
      @613    MRN_S               $CHAR17.                                      
      @630    BWT                 N4PF.                                         
      @634    PAY1_X              $CHAR2.                                       
      @636    PAY2_X              $CHAR2.                                       
      ;                                                                         
                                                                                
                                                                                
RUN;
