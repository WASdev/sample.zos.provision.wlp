//*******************************************************                      
//* Delete the proc                     
//*******************************************************  
//DEALLOC   EXEC PGM=IDCAMS
//SYSPRINT DD   SYSOUT=*                      
//SYSUDUMP DD   SYSOUT=*                      
//AMSDUMP  DD   SYSOUT=*       
//SYSIN    DD   * 
 LISTDS '${instance-PROCLIB}(${_workflow-softwareServiceInstanceName})'
 IF MAXCC EQ 0 THEN DO
   ALLOCATE FILE(DD1) DATASET('${instance-PROCLIB}') SHR
   DELETE '${instance-PROCLIB}(${_workflow-softwareServiceInstanceName})' FILE(DD1)
   FREE FILE(DD1)
   END
 ELSE SET MAXCC = 0
/*