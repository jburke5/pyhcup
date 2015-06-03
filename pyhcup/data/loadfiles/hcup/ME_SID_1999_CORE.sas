/*******************************************************************            
*   ME_SID_1999_CORE.SAS:                                                       
*      THE SAS CODE SHOWN BELOW WILL CONVERT THE ASCII                          
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
DATA ME_SIDC_1999_CORE;                                                         
INFILE 'ME_SIDC_1999_CORE.ASC' LRECL = 416;                                     
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  KEY                LENGTH=8                                                   
  LABEL="HCUP record identifier"                                   FORMAT=Z14.  
  ADRG               LENGTH=3                                                   
  LABEL="All Patient Refined DRG"                                               
  AGE                LENGTH=3                                                   
  LABEL="Age in years at admission"                                             
  AGEDAY             LENGTH=3                                                   
  LABEL="Age in days (when age < 1 year)"                                       
  AGEMONTH           LENGTH=3                                                   
  LABEL="Age in months (when age < 11 years)"                                   
  AMDC               LENGTH=3                                                   
  LABEL="All Patient Refined MDC"                                               
  AMONTH             LENGTH=3                                                   
  LABEL="Admission month"                                                       
  AWEEKEND           LENGTH=3                                                   
  LABEL="Admission day is a weekend"                                            
  BWT                LENGTH=4                                                   
  LABEL="Birth weight in grams"                                                 
  DIED               LENGTH=3                                                   
  LABEL="Died during hospitalization"                                           
  DISPUB92           LENGTH=3                                                   
  LABEL="Disposition of patient (UB-92 standard coding)"                        
  DISPUNIFORM        LENGTH=3                                                   
  LABEL="Disposition of patient (uniform)"                                      
  DISP_X             LENGTH=$1                                                  
  LABEL="Disposition of patient (as received from source)"                      
  DQTR               LENGTH=3                                                   
  LABEL="Discharge quarter"                                                     
  DRG                LENGTH=3                                                   
  LABEL="DRG in effect on discharge date"                                       
  DRG10              LENGTH=3                                                   
  LABEL="DRG, version 10"                                                       
  DRG18              LENGTH=3                                                   
  LABEL="DRG, version 18"                                                       
  DRGVER             LENGTH=3                                                   
  LABEL="DRG grouper version used on discharge date"                            
  DSHOSPID           LENGTH=$13                                                 
  LABEL="Data source hospital identifier"                                       
  DX1                LENGTH=$5                                                  
  LABEL="Principal diagnosis"                                                   
  DX2                LENGTH=$5                                                  
  LABEL="Diagnosis 2"                                                           
  DX3                LENGTH=$5                                                  
  LABEL="Diagnosis 3"                                                           
  DX4                LENGTH=$5                                                  
  LABEL="Diagnosis 4"                                                           
  DX5                LENGTH=$5                                                  
  LABEL="Diagnosis 5"                                                           
  DX6                LENGTH=$5                                                  
  LABEL="Diagnosis 6"                                                           
  DX7                LENGTH=$5                                                  
  LABEL="Diagnosis 7"                                                           
  DX8                LENGTH=$5                                                  
  LABEL="Diagnosis 8"                                                           
  DX9                LENGTH=$5                                                  
  LABEL="Diagnosis 9"                                                           
  DX10               LENGTH=$5                                                  
  LABEL="Diagnosis 10"                                                          
  DXCCS1             LENGTH=4                                                   
  LABEL="CCS: principal diagnosis"                                              
  DXCCS2             LENGTH=4                                                   
  LABEL="CCS: diagnosis 2"                                                      
  DXCCS3             LENGTH=4                                                   
  LABEL="CCS: diagnosis 3"                                                      
  DXCCS4             LENGTH=4                                                   
  LABEL="CCS: diagnosis 4"                                                      
  DXCCS5             LENGTH=4                                                   
  LABEL="CCS: diagnosis 5"                                                      
  DXCCS6             LENGTH=4                                                   
  LABEL="CCS: diagnosis 6"                                                      
  DXCCS7             LENGTH=4                                                   
  LABEL="CCS: diagnosis 7"                                                      
  DXCCS8             LENGTH=4                                                   
  LABEL="CCS: diagnosis 8"                                                      
  DXCCS9             LENGTH=4                                                   
  LABEL="CCS: diagnosis 9"                                                      
  DXCCS10            LENGTH=4                                                   
  LABEL="CCS: diagnosis 10"                                                     
  FEMALE             LENGTH=3                                                   
  LABEL="Indicator of sex"                                                      
  HOSPST             LENGTH=$2                                                  
  LABEL="Hospital state postal code"                                            
  LOS                LENGTH=4                                                   
  LABEL="Length of stay (cleaned)"                                              
  LOS_X              LENGTH=4                                                   
  LABEL="Length of stay (uncleaned)"                                            
  MDC                LENGTH=3                                                   
  LABEL="MDC in effect on discharge date"                                       
  MDC10              LENGTH=3                                                   
  LABEL="MDC, version 10"                                                       
  MDC18              LENGTH=3                                                   
  LABEL="MDC, version 18"                                                       
  MDSPEC             LENGTH=$2                                                  
  LABEL="Physician specialty (as received from source)"                         
  MRN_S              LENGTH=$17                                                 
  LABEL="Medical record number (synthetic)"                                     
  NDX                LENGTH=3                                                   
  LABEL="Number of diagnoses on this record"                                    
  NEOMAT             LENGTH=3                                                   
  LABEL="Neonatal and/or maternal DX and/or PR"                                 
  NPR                LENGTH=3                                                   
  LABEL="Number of procedures on this record"                                   
  PAY1               LENGTH=3                                                   
  LABEL="Primary expected payer (uniform)"                                      
  PAY1_X             LENGTH=$2                                                  
  LABEL="Primary expected payer (as received from source)"                      
  PR1                LENGTH=$4                                                  
  LABEL="Principal procedure"                                                   
  PR2                LENGTH=$4                                                  
  LABEL="Procedure 2"                                                           
  PR3                LENGTH=$4                                                  
  LABEL="Procedure 3"                                                           
  PR4                LENGTH=$4                                                  
  LABEL="Procedure 4"                                                           
  PR5                LENGTH=$4                                                  
  LABEL="Procedure 5"                                                           
  PR6                LENGTH=$4                                                  
  LABEL="Procedure 6"                                                           
  PR7                LENGTH=$4                                                  
  LABEL="Procedure 7"                                                           
  PR8                LENGTH=$4                                                  
  LABEL="Procedure 8"                                                           
  PR9                LENGTH=$4                                                  
  LABEL="Procedure 9"                                                           
  PR10               LENGTH=$4                                                  
  LABEL="Procedure 10"                                                          
  PRCCS1             LENGTH=3                                                   
  LABEL="CCS: principal procedure"                                              
  PRCCS2             LENGTH=3                                                   
  LABEL="CCS: procedure 2"                                                      
  PRCCS3             LENGTH=3                                                   
  LABEL="CCS: procedure 3"                                                      
  PRCCS4             LENGTH=3                                                   
  LABEL="CCS: procedure 4"                                                      
  PRCCS5             LENGTH=3                                                   
  LABEL="CCS: procedure 5"                                                      
  PRCCS6             LENGTH=3                                                   
  LABEL="CCS: procedure 6"                                                      
  PRCCS7             LENGTH=3                                                   
  LABEL="CCS: procedure 7"                                                      
  PRCCS8             LENGTH=3                                                   
  LABEL="CCS: procedure 8"                                                      
  PRCCS9             LENGTH=3                                                   
  LABEL="CCS: procedure 9"                                                      
  PRCCS10            LENGTH=3                                                   
  LABEL="CCS: procedure 10"                                                     
  PRDAY1             LENGTH=4                                                   
  LABEL="Number of days from admission to PR1"                                  
  PRDAY2             LENGTH=4                                                   
  LABEL="Number of days from admission to PR2"                                  
  PRDAY3             LENGTH=4                                                   
  LABEL="Number of days from admission to PR3"                                  
  PRDAY4             LENGTH=4                                                   
  LABEL="Number of days from admission to PR4"                                  
  PRDAY5             LENGTH=4                                                   
  LABEL="Number of days from admission to PR5"                                  
  PRDAY6             LENGTH=4                                                   
  LABEL="Number of days from admission to PR6"                                  
  PRDAY7             LENGTH=4                                                   
  LABEL="Number of days from admission to PR7"                                  
  PRDAY8             LENGTH=4                                                   
  LABEL="Number of days from admission to PR8"                                  
  PRDAY9             LENGTH=4                                                   
  LABEL="Number of days from admission to PR9"                                  
  PRDAY10            LENGTH=4                                                   
  LABEL="Number of days from admission to PR10"                                 
  PSTCO              LENGTH=4                                                   
  LABEL="Patient state/county FIPS code"                                        
  SURGSPEC           LENGTH=$2                                                  
  LABEL="Primary surgeon specialty code"                                        
  TOTCHG             LENGTH=6                                                   
  LABEL="Total charges (cleaned)"                                               
  TOTCHG_X           LENGTH=7                                                   
  LABEL="Total charges (as received from source)"                               
  YEAR               LENGTH=3                                                   
  LABEL="Calendar year"                                                         
  ZIP_S              LENGTH=$5                                                  
  LABEL="Patient zip code (synthetic)"                                          
  AYEAR              LENGTH=3                                                   
  LABEL="Admission year"                                                        
  DMONTH             LENGTH=3                                                   
  LABEL="Discharge month"                                                       
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
  PRMONTH6           LENGTH=3                                                   
  LABEL="Month of procedure 6"                                                  
  PRMONTH7           LENGTH=3                                                   
  LABEL="Month of procedure 7"                                                  
  PRMONTH8           LENGTH=3                                                   
  LABEL="Month of procedure 8"                                                  
  PRMONTH9           LENGTH=3                                                   
  LABEL="Month of procedure 9"                                                  
  PRMONTH10          LENGTH=3                                                   
  LABEL="Month of procedure 10"                                                 
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
  PRYEAR6            LENGTH=3                                                   
  LABEL="Year of procedure 6"                                                   
  PRYEAR7            LENGTH=3                                                   
  LABEL="Year of procedure 7"                                                   
  PRYEAR8            LENGTH=3                                                   
  LABEL="Year of procedure 8"                                                   
  PRYEAR9            LENGTH=3                                                   
  LABEL="Year of procedure 9"                                                   
  PRYEAR10           LENGTH=3                                                   
  LABEL="Year of procedure 10"                                                  
;                                                                               
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      KEY                 14.                                           
      @15     ADRG                N3PF.                                         
      @18     AGE                 N3PF.                                         
      @21     AGEDAY              N3PF.                                         
      @24     AGEMONTH            N3PF.                                         
      @27     AMDC                N2PF.                                         
      @29     AMONTH              N2PF.                                         
      @31     AWEEKEND            N2PF.                                         
      @33     BWT                 N4PF.                                         
      @37     DIED                N2PF.                                         
      @39     DISPUB92            N2PF.                                         
      @41     DISPUNIFORM         N2PF.                                         
      @43     DISP_X              $CHAR1.                                       
      @44     DQTR                N2PF.                                         
      @46     DRG                 N3PF.                                         
      @49     DRG10               N3PF.                                         
      @52     DRG18               N3PF.                                         
      @55     DRGVER              N2PF.                                         
      @57     DSHOSPID            $CHAR13.                                      
      @70     DX1                 $CHAR5.                                       
      @75     DX2                 $CHAR5.                                       
      @80     DX3                 $CHAR5.                                       
      @85     DX4                 $CHAR5.                                       
      @90     DX5                 $CHAR5.                                       
      @95     DX6                 $CHAR5.                                       
      @100    DX7                 $CHAR5.                                       
      @105    DX8                 $CHAR5.                                       
      @110    DX9                 $CHAR5.                                       
      @115    DX10                $CHAR5.                                       
      @120    DXCCS1              N4PF.                                         
      @124    DXCCS2              N4PF.                                         
      @128    DXCCS3              N4PF.                                         
      @132    DXCCS4              N4PF.                                         
      @136    DXCCS5              N4PF.                                         
      @140    DXCCS6              N4PF.                                         
      @144    DXCCS7              N4PF.                                         
      @148    DXCCS8              N4PF.                                         
      @152    DXCCS9              N4PF.                                         
      @156    DXCCS10             N4PF.                                         
      @160    FEMALE              N2PF.                                         
      @162    HOSPST              $CHAR2.                                       
      @164    LOS                 N5PF.                                         
      @169    LOS_X               N6PF.                                         
      @175    MDC                 N2PF.                                         
      @177    MDC10               N2PF.                                         
      @179    MDC18               N2PF.                                         
      @181    MDSPEC              $CHAR2.                                       
      @183    MRN_S               $CHAR17.                                      
      @200    NDX                 N2PF.                                         
      @202    NEOMAT              N2PF.                                         
      @204    NPR                 N2PF.                                         
      @206    PAY1                N2PF.                                         
      @208    PAY1_X              $CHAR2.                                       
      @210    PR1                 $CHAR4.                                       
      @214    PR2                 $CHAR4.                                       
      @218    PR3                 $CHAR4.                                       
      @222    PR4                 $CHAR4.                                       
      @226    PR5                 $CHAR4.                                       
      @230    PR6                 $CHAR4.                                       
      @234    PR7                 $CHAR4.                                       
      @238    PR8                 $CHAR4.                                       
      @242    PR9                 $CHAR4.                                       
      @246    PR10                $CHAR4.                                       
      @250    PRCCS1              N3PF.                                         
      @253    PRCCS2              N3PF.                                         
      @256    PRCCS3              N3PF.                                         
      @259    PRCCS4              N3PF.                                         
      @262    PRCCS5              N3PF.                                         
      @265    PRCCS6              N3PF.                                         
      @268    PRCCS7              N3PF.                                         
      @271    PRCCS8              N3PF.                                         
      @274    PRCCS9              N3PF.                                         
      @277    PRCCS10             N3PF.                                         
      @280    PRDAY1              N3PF.                                         
      @283    PRDAY2              N3PF.                                         
      @286    PRDAY3              N3PF.                                         
      @289    PRDAY4              N3PF.                                         
      @292    PRDAY5              N3PF.                                         
      @295    PRDAY6              N3PF.                                         
      @298    PRDAY7              N3PF.                                         
      @301    PRDAY8              N3PF.                                         
      @304    PRDAY9              N3PF.                                         
      @307    PRDAY10             N3PF.                                         
      @310    PSTCO               N5PF.                                         
      @315    SURGSPEC            $CHAR2.                                       
      @317    TOTCHG              N10PF.                                        
      @327    TOTCHG_X            N15P2F.                                       
      @342    YEAR                N4PF.                                         
      @346    ZIP_S               $CHAR5.                                       
      @351    AYEAR               N4PF.                                         
      @355    DMONTH              N2PF.                                         
      @357    PRMONTH1            N2PF.                                         
      @359    PRMONTH2            N2PF.                                         
      @361    PRMONTH3            N2PF.                                         
      @363    PRMONTH4            N2PF.                                         
      @365    PRMONTH5            N2PF.                                         
      @367    PRMONTH6            N2PF.                                         
      @369    PRMONTH7            N2PF.                                         
      @371    PRMONTH8            N2PF.                                         
      @373    PRMONTH9            N2PF.                                         
      @375    PRMONTH10           N2PF.                                         
      @377    PRYEAR1             N4PF.                                         
      @381    PRYEAR2             N4PF.                                         
      @385    PRYEAR3             N4PF.                                         
      @389    PRYEAR4             N4PF.                                         
      @393    PRYEAR5             N4PF.                                         
      @397    PRYEAR6             N4PF.                                         
      @401    PRYEAR7             N4PF.                                         
      @405    PRYEAR8             N4PF.                                         
      @409    PRYEAR9             N4PF.                                         
      @413    PRYEAR10            N4PF.                                         
;                                                                               
                                                                                
                                                                                
RUN;
