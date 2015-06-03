/*******************************************************************            
*   NJ_SID_1994_CORE.SAS:                                                       
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
DATA NJ_SIDC_1994_CORE;                                                         
INFILE 'NJ_SID_1994_CORE.ASC' LRECL = 480;                                      
                                                                                
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
                                                                                
  ZIP                LENGTH=$5                                                  
  LABEL="I:Patient zip code"                                                    
                                                                                
  MDSPEC             LENGTH=$1                                                  
  LABEL="I:Physician specialty"                                                 
                                                                                
  MRN_S              LENGTH=$17                                                 
  LABEL="I:Medical record number (synthetic)"                                   
                                                                                
  PSTCO              LENGTH=4                                                   
  LABEL="I:Patient state/county FIPS code"                                      
                                                                                
  READMIT            LENGTH=3                                                   
  LABEL="I:Readmission"                                                         
                                                                                
  BWT                LENGTH=3                                                   
  LABEL="I:Birthweight in grams"                                                
                                                                                
  PAY1_X             LENGTH=$3                                                  
  LABEL="I:Primary exp. payer (from data source)"                               
                                                                                
  PAY2_X             LENGTH=$3                                                  
  LABEL="I:Secondary exp. payer (from data source"                              
                                                                                
  PAY3_X             LENGTH=$3                                                  
  LABEL="I:Tertiary exp. payer (from data source)"                              
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      SEQ_SID             13.                                           
      @14     AGE                 N3PF.                                         
      @17     AGEDAY              N3PF.                                         
      @20     SEX                 N3PF.                                         
      @23     RACE                N2PF.                                         
      @25     DQTR                N2PF.                                         
      @27     LOS                 N5PF.                                         
      @32     DISP                N2PF.                                         
      @34     DIED                N2PF.                                         
      @36     ATYPE               N2PF.                                         
      @38     ASOURCE             N2PF.                                         
      @40     NDX                 N2PF.                                         
      @42     DX1                 $CHAR5.                                       
      @47     DXV1                N4PF.                                         
      @51     DCCHPR1             N4PF.                                         
      @55     NPR                 N2PF.                                         
      @57     PR1                 $CHAR4.                                       
      @61     PRV1                N3PF.                                         
      @64     PCCHPR1             N4PF.                                         
      @68     DRG                 N3PF.                                         
      @71     MDC                 N2PF.                                         
      @73     DRGVER              N2PF.                                         
      @75     DRG10               N3PF.                                         
      @78     MDC10               N2PF.                                         
      @80     PAY1                N2PF.                                         
      @82     TOTCHG              N10PF.                                        
      @92     PROCESS             11.                                           
      @103    YEAR                N4PF.                                         
      @107    DSHOSPID            $CHAR13.                                      
      @120    DSNUM               N3PF.                                         
      @123    DSTYPE              N3PF.                                         
      @126    HOSPST              $CHAR2.                                       
      @128    MDID_S              $CHAR16.                                      
      @144    SURGID_S            $CHAR16.                                      
      @160    ADAYWK              N3PF.                                         
      @163    AMONTH              N2PF.                                         
      @165    LOS_X               N5PF.                                         
      @170    NEOMAT              N2PF.                                         
      @172    DXSYS               N3PF.                                         
      @175    DSNDX               N3PF.                                         
      @178    PRSYS               N3PF.                                         
      @181    DSNPR               N3PF.                                         
      @184    PRDAY1              N5PF.                                         
      @189    PAY1_N              N3PF.                                         
      @192    PAY2                N2PF.                                         
      @194    PAY2_N              N3PF.                                         
      @197    TOTCHG_X            N12P2F.                                       
      @209    DX2                 $CHAR5.                                       
      @214    DX3                 $CHAR5.                                       
      @219    DX4                 $CHAR5.                                       
      @224    DX5                 $CHAR5.                                       
      @229    DX6                 $CHAR5.                                       
      @234    DX7                 $CHAR5.                                       
      @239    DX8                 $CHAR5.                                       
      @244    DX9                 $CHAR5.                                       
      @249    DX10                $CHAR5.                                       
      @254    DXV2                N4PF.                                         
      @258    DXV3                N4PF.                                         
      @262    DXV4                N4PF.                                         
      @266    DXV5                N4PF.                                         
      @270    DXV6                N4PF.                                         
      @274    DXV7                N4PF.                                         
      @278    DXV8                N4PF.                                         
      @282    DXV9                N4PF.                                         
      @286    DXV10               N4PF.                                         
      @290    DCCHPR2             N4PF.                                         
      @294    DCCHPR3             N4PF.                                         
      @298    DCCHPR4             N4PF.                                         
      @302    DCCHPR5             N4PF.                                         
      @306    DCCHPR6             N4PF.                                         
      @310    DCCHPR7             N4PF.                                         
      @314    DCCHPR8             N4PF.                                         
      @318    DCCHPR9             N4PF.                                         
      @322    DCCHPR10            N4PF.                                         
      @326    PR2                 $CHAR4.                                       
      @330    PR3                 $CHAR4.                                       
      @334    PR4                 $CHAR4.                                       
      @338    PR5                 $CHAR4.                                       
      @342    PR6                 $CHAR4.                                       
      @346    PR7                 $CHAR4.                                       
      @350    PR8                 $CHAR4.                                       
      @354    PRV2                N3PF.                                         
      @357    PRV3                N3PF.                                         
      @360    PRV4                N3PF.                                         
      @363    PRV5                N3PF.                                         
      @366    PRV6                N3PF.                                         
      @369    PRV7                N3PF.                                         
      @372    PRV8                N3PF.                                         
      @375    PCCHPR2             N4PF.                                         
      @379    PCCHPR3             N4PF.                                         
      @383    PCCHPR4             N4PF.                                         
      @387    PCCHPR5             N4PF.                                         
      @391    PCCHPR6             N4PF.                                         
      @395    PCCHPR7             N4PF.                                         
      @399    PCCHPR8             N4PF.                                         
      @403    PRDAY2              N5PF.                                         
      @408    PRDAY3              N5PF.                                         
      @413    PRDAY4              N5PF.                                         
      @418    PRDAY5              N5PF.                                         
      @423    PRDAY6              N5PF.                                         
      @428    PRDAY7              N5PF.                                         
      @433    PRDAY8              N5PF.                                         
      @438    ZIP                 $CHAR5.                                       
      @443    MDSPEC              $CHAR1.                                       
      @444    MRN_S               $CHAR17.                                      
      @461    PSTCO               N5PF.                                         
      @466    READMIT             N2PF.                                         
      @468    BWT                 N4PF.                                         
      @472    PAY1_X              $CHAR3.                                       
      @475    PAY2_X              $CHAR3.                                       
      @478    PAY3_X              $CHAR3.                                       
      ;                                                                         
                                                                                
                                                                                
RUN;
