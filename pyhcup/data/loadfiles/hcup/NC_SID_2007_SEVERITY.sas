/*******************************************************************            
*   NC_SID_2007_SEVERITY.SAS:                                                   
*      THE SAS CODE SHOWN BELOW WILL LOAD THE ASCII                             
*      INPATIENT STAY SEVERITY FILE INTO SAS                                    
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
  INVALUE N11PF                                                                 
    '-9999999999' = .                                                           
    '-8888888888' = .A                                                          
    '-6666666666' = .C                                                          
    OTHER = (|11.|)                                                             
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
  INVALUE N13PF                                                                 
    '-999999999999' = .                                                         
    '-888888888888' = .A                                                        
    '-666666666666' = .C                                                        
    OTHER = (|13.|)                                                             
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
DATA NC_SIDC_2007_SEVERITY;                                                     
INFILE 'NC_SID_2007_SEVERITY.ASC' LRECL = 72;                                   
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  KEY                        LENGTH=8                 FORMAT=Z14.               
  LABEL="HCUP record identifier"                                                
                                                                                
  CM_AIDS                    LENGTH=3                                           
  LABEL="AHRQ comorbidity measure: Acquired immune deficiency syndrome"         
                                                                                
  CM_ALCOHOL                 LENGTH=3                                           
  LABEL="AHRQ comorbidity measure: Alcohol abuse"                               
                                                                                
  CM_ANEMDEF                 LENGTH=3                                           
  LABEL="AHRQ comorbidity measure: Deficiency anemias"                          
                                                                                
  CM_ARTH                    LENGTH=3                                           
  LABEL=                                                                        
  "AHRQ comorbidity measure: Rheumatoid arthritis/collagen vascular diseases"   
                                                                                
  CM_BLDLOSS                 LENGTH=3                                           
  LABEL="AHRQ comorbidity measure: Chronic blood loss anemia"                   
                                                                                
  CM_CHF                     LENGTH=3                                           
  LABEL="AHRQ comorbidity measure: Congestive heart failure"                    
                                                                                
  CM_CHRNLUNG                LENGTH=3                                           
  LABEL="AHRQ comorbidity measure: Chronic pulmonary disease"                   
                                                                                
  CM_COAG                    LENGTH=3                                           
  LABEL="AHRQ comorbidity measure: Coagulopathy"                                
                                                                                
  CM_DEPRESS                 LENGTH=3                                           
  LABEL="AHRQ comorbidity measure: Depression"                                  
                                                                                
  CM_DM                      LENGTH=3                                           
  LABEL="AHRQ comorbidity measure: Diabetes, uncomplicated"                     
                                                                                
  CM_DMCX                    LENGTH=3                                           
  LABEL="AHRQ comorbidity measure: Diabetes with chronic complications"         
                                                                                
  CM_DRUG                    LENGTH=3                                           
  LABEL="AHRQ comorbidity measure: Drug abuse"                                  
                                                                                
  CM_HTN_C                   LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"AHRQ comorbidity measure: Hypertension (combine uncomplicated and complicated)"
                                                                                
  CM_HYPOTHY                 LENGTH=3                                           
  LABEL="AHRQ comorbidity measure: Hypothyroidism"                              
                                                                                
  CM_LIVER                   LENGTH=3                                           
  LABEL="AHRQ comorbidity measure: Liver disease"                               
                                                                                
  CM_LYMPH                   LENGTH=3                                           
  LABEL="AHRQ comorbidity measure: Lymphoma"                                    
                                                                                
  CM_LYTES                   LENGTH=3                                           
  LABEL="AHRQ comorbidity measure: Fluid and electrolyte disorders"             
                                                                                
  CM_METS                    LENGTH=3                                           
  LABEL="AHRQ comorbidity measure: Metastatic cancer"                           
                                                                                
  CM_NEURO                   LENGTH=3                                           
  LABEL="AHRQ comorbidity measure: Other neurological disorders"                
                                                                                
  CM_OBESE                   LENGTH=3                                           
  LABEL="AHRQ comorbidity measure: Obesity"                                     
                                                                                
  CM_PARA                    LENGTH=3                                           
  LABEL="AHRQ comorbidity measure: Paralysis"                                   
                                                                                
  CM_PERIVASC                LENGTH=3                                           
  LABEL="AHRQ comorbidity measure: Peripheral vascular disorders"               
                                                                                
  CM_PSYCH                   LENGTH=3                                           
  LABEL="AHRQ comorbidity measure: Psychoses"                                   
                                                                                
  CM_PULMCIRC                LENGTH=3                                           
  LABEL="AHRQ comorbidity measure: Pulmonary circulation disorders"             
                                                                                
  CM_RENLFAIL                LENGTH=3                                           
  LABEL="AHRQ comorbidity measure: Renal failure"                               
                                                                                
  CM_TUMOR                   LENGTH=3                                           
  LABEL="AHRQ comorbidity measure: Solid tumor without metastasis"              
                                                                                
  CM_ULCER                   LENGTH=3                                           
  LABEL="AHRQ comorbidity measure: Peptic ulcer disease excluding bleeding"     
                                                                                
  CM_VALVE                   LENGTH=3                                           
  LABEL="AHRQ comorbidity measure: Valvular disease"                            
                                                                                
  CM_WGHTLOSS                LENGTH=3                                           
  LABEL="AHRQ comorbidity measure: Weight loss"                                 
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      KEY                      14.                                      
      @15     CM_AIDS                  N2PF.                                    
      @17     CM_ALCOHOL               N2PF.                                    
      @19     CM_ANEMDEF               N2PF.                                    
      @21     CM_ARTH                  N2PF.                                    
      @23     CM_BLDLOSS               N2PF.                                    
      @25     CM_CHF                   N2PF.                                    
      @27     CM_CHRNLUNG              N2PF.                                    
      @29     CM_COAG                  N2PF.                                    
      @31     CM_DEPRESS               N2PF.                                    
      @33     CM_DM                    N2PF.                                    
      @35     CM_DMCX                  N2PF.                                    
      @37     CM_DRUG                  N2PF.                                    
      @39     CM_HTN_C                 N2PF.                                    
      @41     CM_HYPOTHY               N2PF.                                    
      @43     CM_LIVER                 N2PF.                                    
      @45     CM_LYMPH                 N2PF.                                    
      @47     CM_LYTES                 N2PF.                                    
      @49     CM_METS                  N2PF.                                    
      @51     CM_NEURO                 N2PF.                                    
      @53     CM_OBESE                 N2PF.                                    
      @55     CM_PARA                  N2PF.                                    
      @57     CM_PERIVASC              N2PF.                                    
      @59     CM_PSYCH                 N2PF.                                    
      @61     CM_PULMCIRC              N2PF.                                    
      @63     CM_RENLFAIL              N2PF.                                    
      @65     CM_TUMOR                 N2PF.                                    
      @67     CM_ULCER                 N2PF.                                    
      @69     CM_VALVE                 N2PF.                                    
      @71     CM_WGHTLOSS              N2PF.                                    
      ;                                                                         
                                                                                
                                                                                
RUN;
