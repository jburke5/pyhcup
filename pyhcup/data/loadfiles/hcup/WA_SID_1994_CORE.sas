/*******************************************************************            
*   WA_SID_1994_CORE.SAS:                                                       
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
DATA WA_SIDC_1994_CORE;                                                         
INFILE 'WA_SID_1994_CORE.ASC' LRECL = 416;                                      
                                                                                
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
                                                                                
  ZIP                LENGTH=$5                                                  
  LABEL="I:Patient zip code"                                                    
                                                                                
  PNUM_S             LENGTH=$17                                                 
  LABEL="I:Person number (synthetic)"                                           
                                                                                
  PAY1_X             LENGTH=$3                                                  
  LABEL="I:Primary exp. payer (from data source)"                               
                                                                                
  PAY2_X             LENGTH=$3                                                  
  LABEL="I:Secondary exp. payer (from data source"                              
                                                                                
  RDRG               LENGTH=4                                                   
  LABEL="I:Refined DRG"                                                         
                                                                                
  RDRGWT             LENGTH=5                                                   
  LABEL="I:Refined DRG weight"                                                  
                                                                                
  AYEAR              LENGTH=3                                                   
  LABEL="Admission year"                                                        
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
      @126    MDID_S              $CHAR16.                                      
      @142    SURGID_S            $CHAR16.                                      
      @158    ADAYWK              N3PF.                                         
      @161    AMONTH              N2PF.                                         
      @163    LOS_X               N5PF.                                         
      @168    NEOMAT              N2PF.                                         
      @170    DXSYS               N3PF.                                         
      @173    DSNDX               N3PF.                                         
      @176    PRSYS               N3PF.                                         
      @179    DSNPR               N3PF.                                         
      @182    PAY1_N              N3PF.                                         
      @185    PAY2                N2PF.                                         
      @187    PAY2_N              N3PF.                                         
      @190    TOTCHG_X            N12P2F.                                       
      @202    DX2                 $CHAR5.                                       
      @207    DX3                 $CHAR5.                                       
      @212    DX4                 $CHAR5.                                       
      @217    DX5                 $CHAR5.                                       
      @222    DX6                 $CHAR5.                                       
      @227    DX7                 $CHAR5.                                       
      @232    DX8                 $CHAR5.                                       
      @237    DX9                 $CHAR5.                                       
      @242    DX10                $CHAR5.                                       
      @247    DXV2                N4PF.                                         
      @251    DXV3                N4PF.                                         
      @255    DXV4                N4PF.                                         
      @259    DXV5                N4PF.                                         
      @263    DXV6                N4PF.                                         
      @267    DXV7                N4PF.                                         
      @271    DXV8                N4PF.                                         
      @275    DXV9                N4PF.                                         
      @279    DXV10               N4PF.                                         
      @283    DCCHPR2             N4PF.                                         
      @287    DCCHPR3             N4PF.                                         
      @291    DCCHPR4             N4PF.                                         
      @295    DCCHPR5             N4PF.                                         
      @299    DCCHPR6             N4PF.                                         
      @303    DCCHPR7             N4PF.                                         
      @307    DCCHPR8             N4PF.                                         
      @311    DCCHPR9             N4PF.                                         
      @315    DCCHPR10            N4PF.                                         
      @319    PR2                 $CHAR4.                                       
      @323    PR3                 $CHAR4.                                       
      @327    PR4                 $CHAR4.                                       
      @331    PR5                 $CHAR4.                                       
      @335    PR6                 $CHAR4.                                       
      @339    PRV2                N3PF.                                         
      @342    PRV3                N3PF.                                         
      @345    PRV4                N3PF.                                         
      @348    PRV5                N3PF.                                         
      @351    PRV6                N3PF.                                         
      @354    PCCHPR2             N4PF.                                         
      @358    PCCHPR3             N4PF.                                         
      @362    PCCHPR4             N4PF.                                         
      @366    PCCHPR5             N4PF.                                         
      @370    PCCHPR6             N4PF.                                         
      @374    ZIP                 $CHAR5.                                       
      @379    PNUM_S              $CHAR17.                                      
      @396    PAY1_X              $CHAR3.                                       
      @399    PAY2_X              $CHAR3.                                       
      @402    RDRG                N4PF.                                         
      @406    RDRGWT              N7P4F.                                        
      @413    AYEAR               N4PF.                                         
      ;                                                                         
                                                                                
                                                                                
RUN;
