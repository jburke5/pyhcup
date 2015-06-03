/*******************************************************************            
*   OR_SID_1994_CORE.SAS:                                                       
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
DATA OR_SIDC_1994_CORE;                                                         
INFILE 'OR_SID_1994_CORE.ASC' LRECL = 339;                                      
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  SEQ_SID            LENGTH=7          FORMAT=Z13.                              
  LABEL="I:HCUP-3 SID record sequence number"                                   
                                                                                
  AGE                LENGTH=3                                                   
  LABEL="I:Age in years at admission"                                           
                                                                                
  AGEDAY             LENGTH=3                                                   
  LABEL="I:Age in days (when < 1 year)"                                         
                                                                                
  SEX                LENGTH=3                                                   
  LABEL="I:Sex"                                                                 
                                                                                
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
                                                                                
  ADAYWK             LENGTH=3                                                   
  LABEL="I:Admission day of week"                                               
                                                                                
  AMONTH             LENGTH=3                                                   
  LABEL="I:Admission month"                                                     
                                                                                
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
                                                                                
  DXV2               LENGTH=3                                                   
  LABEL="I:Validity flag: diagnosis 2"                                          
                                                                                
  DXV3               LENGTH=3                                                   
  LABEL="I:Validity flag: diagnosis 3"                                          
                                                                                
  DXV4               LENGTH=3                                                   
  LABEL="I:Validity flag: diagnosis 4"                                          
                                                                                
  DXV5               LENGTH=3                                                   
  LABEL="I:Validity flag: diagnosis 5"                                          
                                                                                
  DCCHPR2            LENGTH=3                                                   
  LABEL="I:CCHPR: diagnosis 2"                                                  
                                                                                
  DCCHPR3            LENGTH=3                                                   
  LABEL="I:CCHPR: diagnosis 3"                                                  
                                                                                
  DCCHPR4            LENGTH=3                                                   
  LABEL="I:CCHPR: diagnosis 4"                                                  
                                                                                
  DCCHPR5            LENGTH=3                                                   
  LABEL="I:CCHPR: diagnosis 5"                                                  
                                                                                
  PR2                LENGTH=$4                                                  
  LABEL="I:Procedure 2"                                                         
                                                                                
  PR3                LENGTH=$4                                                  
  LABEL="I:Procedure 3"                                                         
                                                                                
  PR4                LENGTH=$4                                                  
  LABEL="I:Procedure 4"                                                         
                                                                                
  PR5                LENGTH=$4                                                  
  LABEL="I:Procedure 5"                                                         
                                                                                
  PRV2               LENGTH=3                                                   
  LABEL="I:Validity flag: procedure 2"                                          
                                                                                
  PRV3               LENGTH=3                                                   
  LABEL="I:Validity flag: procedure 3"                                          
                                                                                
  PRV4               LENGTH=3                                                   
  LABEL="I:Validity flag: procedure 4"                                          
                                                                                
  PRV5               LENGTH=3                                                   
  LABEL="I:Validity flag: procedure 5"                                          
                                                                                
  PCCHPR2            LENGTH=3                                                   
  LABEL="I:CCHPR: procedure 2"                                                  
                                                                                
  PCCHPR3            LENGTH=3                                                   
  LABEL="I:CCHPR: procedure 3"                                                  
                                                                                
  PCCHPR4            LENGTH=3                                                   
  LABEL="I:CCHPR: procedure 4"                                                  
                                                                                
  PCCHPR5            LENGTH=3                                                   
  LABEL="I:CCHPR: procedure 5"                                                  
                                                                                
  PRDAY2             LENGTH=4                                                   
  LABEL="I:No. of days from admission to PR2"                                   
                                                                                
  PRDAY3             LENGTH=4                                                   
  LABEL="I:No. of days from admission to PR3"                                   
                                                                                
  PRDAY4             LENGTH=4                                                   
  LABEL="I:No. of days from admission to PR4"                                   
                                                                                
  PRDAY5             LENGTH=4                                                   
  LABEL="I:No. of days from admission to PR5"                                   
                                                                                
  ZIP                LENGTH=$5                                                  
  LABEL="I:Patient zip code"                                                    
                                                                                
  PAY1_X             LENGTH=$2                                                  
  LABEL="I:Primary exp. payer (from data source)"                               
                                                                                
  AYEAR              LENGTH=3                                                   
  LABEL="Admission year"                                                        
                                                                                
  DMONTH             LENGTH=3                                                   
  LABEL="Discharge month"                                                       
                                                                                
  BMONTH             LENGTH=3                                                   
  LABEL="Birth month"                                                           
                                                                                
  BYEAR              LENGTH=3                                                   
  LABEL="Birth year"                                                            
                                                                                
  PRMONTH1           LENGTH=3                                                   
  LABEL="Month of procedure 1"                                                  
                                                                                
  PRMONTH2           LENGTH=3                                                   
  LABEL="Month of procedure 2"                                                  
                                                                                
  PRMONTH3           LENGTH=3                                                   
  LABEL="Month of procedure 3"                                                  
                                                                                
  PRMONTH4           LENGTH=3                                                   
  LABEL="Month of procedure 4"                                                  
                                                                                
  PRMONTH5           LENGTH=3                                                   
  LABEL="Month of procedure 5"                                                  
                                                                                
  PRYEAR1            LENGTH=3                                                   
  LABEL="Year of procedure 1"                                                   
                                                                                
  PRYEAR2            LENGTH=3                                                   
  LABEL="Year of procedure 2"                                                   
                                                                                
  PRYEAR3            LENGTH=3                                                   
  LABEL="Year of procedure 3"                                                   
                                                                                
  PRYEAR4            LENGTH=3                                                   
  LABEL="Year of procedure 4"                                                   
                                                                                
  PRYEAR5            LENGTH=3                                                   
  LABEL="Year of procedure 5"                                                   
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      SEQ_SID             13.                                           
      @14     AGE                 N3PF.                                         
      @17     AGEDAY              N3PF.                                         
      @20     SEX                 N3PF.                                         
      @23     DQTR                N2PF.                                         
      @25     LOS                 N5PF.                                         
      @30     DISP                N2PF.                                         
      @32     DIED                N2PF.                                         
      @34     ATYPE               N2PF.                                         
      @36     ASOURCE             N2PF.                                         
      @38     NDX                 N2PF.                                         
      @40     DX1                 $CHAR5.                                       
      @45     DXV1                N4PF.                                         
      @49     DCCHPR1             N4PF.                                         
      @53     NPR                 N2PF.                                         
      @55     PR1                 $CHAR4.                                       
      @59     PRV1                N3PF.                                         
      @62     PCCHPR1             N4PF.                                         
      @66     DRG                 N3PF.                                         
      @69     MDC                 N2PF.                                         
      @71     DRGVER              N2PF.                                         
      @73     DRG10               N3PF.                                         
      @76     MDC10               N2PF.                                         
      @78     PAY1                N2PF.                                         
      @80     TOTCHG              N10PF.                                        
      @90     PROCESS             11.                                           
      @101    YEAR                N4PF.                                         
      @105    DSHOSPID            $CHAR13.                                      
      @118    DSNUM               N3PF.                                         
      @121    DSTYPE              N3PF.                                         
      @124    HOSPST              $CHAR2.                                       
      @126    ADAYWK              N3PF.                                         
      @129    AMONTH              N2PF.                                         
      @131    LOS_X               N5PF.                                         
      @136    NEOMAT              N2PF.                                         
      @138    DXSYS               N3PF.                                         
      @141    DSNDX               N3PF.                                         
      @144    PRSYS               N3PF.                                         
      @147    DSNPR               N3PF.                                         
      @150    PRDAY1              N5PF.                                         
      @155    PAY1_N              N3PF.                                         
      @158    PAY2                N2PF.                                         
      @160    PAY2_N              N3PF.                                         
      @163    TOTCHG_X            N12P2F.                                       
      @175    DX2                 $CHAR5.                                       
      @180    DX3                 $CHAR5.                                       
      @185    DX4                 $CHAR5.                                       
      @190    DX5                 $CHAR5.                                       
      @195    DXV2                N4PF.                                         
      @199    DXV3                N4PF.                                         
      @203    DXV4                N4PF.                                         
      @207    DXV5                N4PF.                                         
      @211    DCCHPR2             N4PF.                                         
      @215    DCCHPR3             N4PF.                                         
      @219    DCCHPR4             N4PF.                                         
      @223    DCCHPR5             N4PF.                                         
      @227    PR2                 $CHAR4.                                       
      @231    PR3                 $CHAR4.                                       
      @235    PR4                 $CHAR4.                                       
      @239    PR5                 $CHAR4.                                       
      @243    PRV2                N3PF.                                         
      @246    PRV3                N3PF.                                         
      @249    PRV4                N3PF.                                         
      @252    PRV5                N3PF.                                         
      @255    PCCHPR2             N4PF.                                         
      @259    PCCHPR3             N4PF.                                         
      @263    PCCHPR4             N4PF.                                         
      @267    PCCHPR5             N4PF.                                         
      @271    PRDAY2              N5PF.                                         
      @276    PRDAY3              N5PF.                                         
      @281    PRDAY4              N5PF.                                         
      @286    PRDAY5              N5PF.                                         
      @291    ZIP                 $CHAR5.                                       
      @296    PAY1_X              $CHAR2.                                       
      @298    AYEAR               N4PF.                                         
      @302    DMONTH              N2PF.                                         
      @304    BMONTH              N2PF.                                         
      @306    BYEAR               N4PF.                                         
      @310    PRMONTH1            N2PF.                                         
      @312    PRMONTH2            N2PF.                                         
      @314    PRMONTH3            N2PF.                                         
      @316    PRMONTH4            N2PF.                                         
      @318    PRMONTH5            N2PF.                                         
      @320    PRYEAR1             N4PF.                                         
      @324    PRYEAR2             N4PF.                                         
      @328    PRYEAR3             N4PF.                                         
      @332    PRYEAR4             N4PF.                                         
      @336    PRYEAR5             N4PF.                                         
      ;                                                                         
                                                                                
                                                                                
RUN;
