/*******************************************************************            
*   HI_SID_2005_DX_PR_GRPS.SAS:                                                 
*      THE SAS CODE SHOWN BELOW WILL LOAD THE ASCII                             
*      INPATIENT STAY DX_PR_GRPS FILE INTO SAS                                  
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
DATA HI_SIDC_2005_DX_PR_GRPS;                                                   
INFILE 'HI_SID_2005_DX_PR_GRPS.ASC' LRECL = 292;                                
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  KEY                        LENGTH=8                 FORMAT=Z14.               
  LABEL="HCUP record identifier"                                                
                                                                                
  CCSMGN1                    LENGTH=3                                           
  LABEL="CCS-MHSA general category: principal diagnosis"                        
                                                                                
  CCSMGN2                    LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 2"                                
                                                                                
  CCSMGN3                    LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 3"                                
                                                                                
  CCSMGN4                    LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 4"                                
                                                                                
  CCSMGN5                    LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 5"                                
                                                                                
  CCSMGN6                    LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 6"                                
                                                                                
  CCSMGN7                    LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 7"                                
                                                                                
  CCSMGN8                    LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 8"                                
                                                                                
  CCSMGN9                    LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 9"                                
                                                                                
  CCSMGN10                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 10"                               
                                                                                
  CCSMGN11                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 11"                               
                                                                                
  CCSMGN12                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 12"                               
                                                                                
  CCSMGN13                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 13"                               
                                                                                
  CCSMGN14                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 14"                               
                                                                                
  CCSMGN15                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 15"                               
                                                                                
  CCSMGN16                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 16"                               
                                                                                
  CCSMGN17                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 17"                               
                                                                                
  CCSMGN18                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 18"                               
                                                                                
  CCSMGN19                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 19"                               
                                                                                
  CCSMGN20                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: diagnosis 20"                               
                                                                                
  CCSMSP1                    LENGTH=3                                           
  LABEL="CCS-MHSA specific category: principal diagnosis"                       
                                                                                
  CCSMSP2                    LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 2"                               
                                                                                
  CCSMSP3                    LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 3"                               
                                                                                
  CCSMSP4                    LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 4"                               
                                                                                
  CCSMSP5                    LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 5"                               
                                                                                
  CCSMSP6                    LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 6"                               
                                                                                
  CCSMSP7                    LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 7"                               
                                                                                
  CCSMSP8                    LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 8"                               
                                                                                
  CCSMSP9                    LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 9"                               
                                                                                
  CCSMSP10                   LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 10"                              
                                                                                
  CCSMSP11                   LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 11"                              
                                                                                
  CCSMSP12                   LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 12"                              
                                                                                
  CCSMSP13                   LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 13"                              
                                                                                
  CCSMSP14                   LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 14"                              
                                                                                
  CCSMSP15                   LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 15"                              
                                                                                
  CCSMSP16                   LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 16"                              
                                                                                
  CCSMSP17                   LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 17"                              
                                                                                
  CCSMSP18                   LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 18"                              
                                                                                
  CCSMSP19                   LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 19"                              
                                                                                
  CCSMSP20                   LENGTH=3                                           
  LABEL="CCS-MHSA specific category: diagnosis 20"                              
                                                                                
  CHRON1                     LENGTH=3                                           
  LABEL="Chronic condition indicator 1"                                         
                                                                                
  CHRON2                     LENGTH=3                                           
  LABEL="Chronic condition indicator 2"                                         
                                                                                
  CHRON3                     LENGTH=3                                           
  LABEL="Chronic condition indicator 3"                                         
                                                                                
  CHRON4                     LENGTH=3                                           
  LABEL="Chronic condition indicator 4"                                         
                                                                                
  CHRON5                     LENGTH=3                                           
  LABEL="Chronic condition indicator 5"                                         
                                                                                
  CHRON6                     LENGTH=3                                           
  LABEL="Chronic condition indicator 6"                                         
                                                                                
  CHRON7                     LENGTH=3                                           
  LABEL="Chronic condition indicator 7"                                         
                                                                                
  CHRON8                     LENGTH=3                                           
  LABEL="Chronic condition indicator 8"                                         
                                                                                
  CHRON9                     LENGTH=3                                           
  LABEL="Chronic condition indicator 9"                                         
                                                                                
  CHRON10                    LENGTH=3                                           
  LABEL="Chronic condition indicator 10"                                        
                                                                                
  CHRON11                    LENGTH=3                                           
  LABEL="Chronic condition indicator 11"                                        
                                                                                
  CHRON12                    LENGTH=3                                           
  LABEL="Chronic condition indicator 12"                                        
                                                                                
  CHRON13                    LENGTH=3                                           
  LABEL="Chronic condition indicator 13"                                        
                                                                                
  CHRON14                    LENGTH=3                                           
  LABEL="Chronic condition indicator 14"                                        
                                                                                
  CHRON15                    LENGTH=3                                           
  LABEL="Chronic condition indicator 15"                                        
                                                                                
  CHRON16                    LENGTH=3                                           
  LABEL="Chronic condition indicator 16"                                        
                                                                                
  CHRON17                    LENGTH=3                                           
  LABEL="Chronic condition indicator 17"                                        
                                                                                
  CHRON18                    LENGTH=3                                           
  LABEL="Chronic condition indicator 18"                                        
                                                                                
  CHRON19                    LENGTH=3                                           
  LABEL="Chronic condition indicator 19"                                        
                                                                                
  CHRON20                    LENGTH=3                                           
  LABEL="Chronic condition indicator 20"                                        
                                                                                
  CHRONB1                    LENGTH=3                                           
  LABEL="Chronic condition body system 1"                                       
                                                                                
  CHRONB2                    LENGTH=3                                           
  LABEL="Chronic condition body system 2"                                       
                                                                                
  CHRONB3                    LENGTH=3                                           
  LABEL="Chronic condition body system 3"                                       
                                                                                
  CHRONB4                    LENGTH=3                                           
  LABEL="Chronic condition body system 4"                                       
                                                                                
  CHRONB5                    LENGTH=3                                           
  LABEL="Chronic condition body system 5"                                       
                                                                                
  CHRONB6                    LENGTH=3                                           
  LABEL="Chronic condition body system 6"                                       
                                                                                
  CHRONB7                    LENGTH=3                                           
  LABEL="Chronic condition body system 7"                                       
                                                                                
  CHRONB8                    LENGTH=3                                           
  LABEL="Chronic condition body system 8"                                       
                                                                                
  CHRONB9                    LENGTH=3                                           
  LABEL="Chronic condition body system 9"                                       
                                                                                
  CHRONB10                   LENGTH=3                                           
  LABEL="Chronic condition body system 10"                                      
                                                                                
  CHRONB11                   LENGTH=3                                           
  LABEL="Chronic condition body system 11"                                      
                                                                                
  CHRONB12                   LENGTH=3                                           
  LABEL="Chronic condition body system 12"                                      
                                                                                
  CHRONB13                   LENGTH=3                                           
  LABEL="Chronic condition body system 13"                                      
                                                                                
  CHRONB14                   LENGTH=3                                           
  LABEL="Chronic condition body system 14"                                      
                                                                                
  CHRONB15                   LENGTH=3                                           
  LABEL="Chronic condition body system 15"                                      
                                                                                
  CHRONB16                   LENGTH=3                                           
  LABEL="Chronic condition body system 16"                                      
                                                                                
  CHRONB17                   LENGTH=3                                           
  LABEL="Chronic condition body system 17"                                      
                                                                                
  CHRONB18                   LENGTH=3                                           
  LABEL="Chronic condition body system 18"                                      
                                                                                
  CHRONB19                   LENGTH=3                                           
  LABEL="Chronic condition body system 19"                                      
                                                                                
  CHRONB20                   LENGTH=3                                           
  LABEL="Chronic condition body system 20"                                      
                                                                                
  ECCSMGN1                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: E Code 1"                                   
                                                                                
  ECCSMGN2                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: E Code 2"                                   
                                                                                
  ECCSMGN3                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: E Code 3"                                   
                                                                                
  ECCSMGN4                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: E Code 4"                                   
                                                                                
  ECCSMGN5                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: E Code 5"                                   
                                                                                
  ECCSMGN6                   LENGTH=3                                           
  LABEL="CCS-MHSA general category: E Code 6"                                   
                                                                                
  PCLASS1                    LENGTH=3                                           
  LABEL="Principal procedure class"                                             
                                                                                
  PCLASS2                    LENGTH=3                                           
  LABEL="Procedure class 2"                                                     
                                                                                
  PCLASS3                    LENGTH=3                                           
  LABEL="Procedure class 3"                                                     
                                                                                
  PCLASS4                    LENGTH=3                                           
  LABEL="Procedure class 4"                                                     
                                                                                
  PCLASS5                    LENGTH=3                                           
  LABEL="Procedure class 5"                                                     
                                                                                
  PCLASS6                    LENGTH=3                                           
  LABEL="Procedure class 6"                                                     
                                                                                
  PCLASS7                    LENGTH=3                                           
  LABEL="Procedure class 7"                                                     
                                                                                
  PCLASS8                    LENGTH=3                                           
  LABEL="Procedure class 8"                                                     
                                                                                
  PCLASS9                    LENGTH=3                                           
  LABEL="Procedure class 9"                                                     
                                                                                
  PCLASS10                   LENGTH=3                                           
  LABEL="Procedure class 10"                                                    
                                                                                
  PCLASS11                   LENGTH=3                                           
  LABEL="Procedure class 11"                                                    
                                                                                
  PCLASS12                   LENGTH=3                                           
  LABEL="Procedure class 12"                                                    
                                                                                
  PCLASS13                   LENGTH=3                                           
  LABEL="Procedure class 13"                                                    
                                                                                
  PCLASS14                   LENGTH=3                                           
  LABEL="Procedure class 14"                                                    
                                                                                
  PCLASS15                   LENGTH=3                                           
  LABEL="Procedure class 15"                                                    
                                                                                
  PCLASS16                   LENGTH=3                                           
  LABEL="Procedure class 16"                                                    
                                                                                
  PCLASS17                   LENGTH=3                                           
  LABEL="Procedure class 17"                                                    
                                                                                
  PCLASS18                   LENGTH=3                                           
  LABEL="Procedure class 18"                                                    
                                                                                
  PCLASS19                   LENGTH=3                                           
  LABEL="Procedure class 19"                                                    
                                                                                
  PCLASS20                   LENGTH=3                                           
  LABEL="Procedure class 20"                                                    
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      KEY                      14.                                      
      @15     CCSMGN1                  N3PF.                                    
      @18     CCSMGN2                  N3PF.                                    
      @21     CCSMGN3                  N3PF.                                    
      @24     CCSMGN4                  N3PF.                                    
      @27     CCSMGN5                  N3PF.                                    
      @30     CCSMGN6                  N3PF.                                    
      @33     CCSMGN7                  N3PF.                                    
      @36     CCSMGN8                  N3PF.                                    
      @39     CCSMGN9                  N3PF.                                    
      @42     CCSMGN10                 N3PF.                                    
      @45     CCSMGN11                 N3PF.                                    
      @48     CCSMGN12                 N3PF.                                    
      @51     CCSMGN13                 N3PF.                                    
      @54     CCSMGN14                 N3PF.                                    
      @57     CCSMGN15                 N3PF.                                    
      @60     CCSMGN16                 N3PF.                                    
      @63     CCSMGN17                 N3PF.                                    
      @66     CCSMGN18                 N3PF.                                    
      @69     CCSMGN19                 N3PF.                                    
      @72     CCSMGN20                 N3PF.                                    
      @75     CCSMSP1                  N4PF.                                    
      @79     CCSMSP2                  N4PF.                                    
      @83     CCSMSP3                  N4PF.                                    
      @87     CCSMSP4                  N4PF.                                    
      @91     CCSMSP5                  N4PF.                                    
      @95     CCSMSP6                  N4PF.                                    
      @99     CCSMSP7                  N4PF.                                    
      @103    CCSMSP8                  N4PF.                                    
      @107    CCSMSP9                  N4PF.                                    
      @111    CCSMSP10                 N4PF.                                    
      @115    CCSMSP11                 N4PF.                                    
      @119    CCSMSP12                 N4PF.                                    
      @123    CCSMSP13                 N4PF.                                    
      @127    CCSMSP14                 N4PF.                                    
      @131    CCSMSP15                 N4PF.                                    
      @135    CCSMSP16                 N4PF.                                    
      @139    CCSMSP17                 N4PF.                                    
      @143    CCSMSP18                 N4PF.                                    
      @147    CCSMSP19                 N4PF.                                    
      @151    CCSMSP20                 N4PF.                                    
      @155    CHRON1                   N2PF.                                    
      @157    CHRON2                   N2PF.                                    
      @159    CHRON3                   N2PF.                                    
      @161    CHRON4                   N2PF.                                    
      @163    CHRON5                   N2PF.                                    
      @165    CHRON6                   N2PF.                                    
      @167    CHRON7                   N2PF.                                    
      @169    CHRON8                   N2PF.                                    
      @171    CHRON9                   N2PF.                                    
      @173    CHRON10                  N2PF.                                    
      @175    CHRON11                  N2PF.                                    
      @177    CHRON12                  N2PF.                                    
      @179    CHRON13                  N2PF.                                    
      @181    CHRON14                  N2PF.                                    
      @183    CHRON15                  N2PF.                                    
      @185    CHRON16                  N2PF.                                    
      @187    CHRON17                  N2PF.                                    
      @189    CHRON18                  N2PF.                                    
      @191    CHRON19                  N2PF.                                    
      @193    CHRON20                  N2PF.                                    
      @195    CHRONB1                  N2PF.                                    
      @197    CHRONB2                  N2PF.                                    
      @199    CHRONB3                  N2PF.                                    
      @201    CHRONB4                  N2PF.                                    
      @203    CHRONB5                  N2PF.                                    
      @205    CHRONB6                  N2PF.                                    
      @207    CHRONB7                  N2PF.                                    
      @209    CHRONB8                  N2PF.                                    
      @211    CHRONB9                  N2PF.                                    
      @213    CHRONB10                 N2PF.                                    
      @215    CHRONB11                 N2PF.                                    
      @217    CHRONB12                 N2PF.                                    
      @219    CHRONB13                 N2PF.                                    
      @221    CHRONB14                 N2PF.                                    
      @223    CHRONB15                 N2PF.                                    
      @225    CHRONB16                 N2PF.                                    
      @227    CHRONB17                 N2PF.                                    
      @229    CHRONB18                 N2PF.                                    
      @231    CHRONB19                 N2PF.                                    
      @233    CHRONB20                 N2PF.                                    
      @235    ECCSMGN1                 N3PF.                                    
      @238    ECCSMGN2                 N3PF.                                    
      @241    ECCSMGN3                 N3PF.                                    
      @244    ECCSMGN4                 N3PF.                                    
      @247    ECCSMGN5                 N3PF.                                    
      @250    ECCSMGN6                 N3PF.                                    
      @253    PCLASS1                  N2PF.                                    
      @255    PCLASS2                  N2PF.                                    
      @257    PCLASS3                  N2PF.                                    
      @259    PCLASS4                  N2PF.                                    
      @261    PCLASS5                  N2PF.                                    
      @263    PCLASS6                  N2PF.                                    
      @265    PCLASS7                  N2PF.                                    
      @267    PCLASS8                  N2PF.                                    
      @269    PCLASS9                  N2PF.                                    
      @271    PCLASS10                 N2PF.                                    
      @273    PCLASS11                 N2PF.                                    
      @275    PCLASS12                 N2PF.                                    
      @277    PCLASS13                 N2PF.                                    
      @279    PCLASS14                 N2PF.                                    
      @281    PCLASS15                 N2PF.                                    
      @283    PCLASS16                 N2PF.                                    
      @285    PCLASS17                 N2PF.                                    
      @287    PCLASS18                 N2PF.                                    
      @289    PCLASS19                 N2PF.                                    
      @291    PCLASS20                 N2PF.                                    
      ;                                                                         
                                                                                
                                                                                
RUN;
