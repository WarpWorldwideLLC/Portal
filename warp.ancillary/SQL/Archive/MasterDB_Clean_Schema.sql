/* MasterDB Clean Schema */
-- /* Clean the Schema in the correct order to address foreign keys. 
-- DROP TABLE IF EXISTS CtlRecordStatus;   
USE  WarpMaster;


DROP TABLE IF EXISTS Entity;
    
DROP TABLE IF EXISTS EntityName;    

DROP TABLE IF EXISTS Hierarchy;    

DROP TABLE IF EXISTS HierarchyXref;

DROP TABLE IF EXISTS BillingEvent;    

DROP TABLE IF EXISTS BillingEventType;    

DROP TABLE IF EXISTS Country;  

DROP TABLE IF EXISTS CountrySubdivision;    

DROP TABLE IF EXISTS PostalAddress;    

DROP TABLE IF EXISTS PostalAddressLine;    

DROP TABLE IF EXISTS City;    

 
DROP TABLE IF EXISTS Phone;        
        
DROP TABLE IF EXISTS eContact;        

 DROP TABLE IF EXISTS Role;
 
 DROP TABLE IF EXISTS RoleInheritance;
 
 DROP TABLE IF EXISTS UserRole;
 
 DROP TABLE IF EXISTS Solution;
 
 DROP TABLE IF EXISTS ctlEntityNameType;
 
 DROP TABLE IF EXISTS ctlEntityType; 
 
 DROP TABLE IF EXISTS ctlPostalCode;   
 
 DROP TABLE IF EXISTS ctlRecordStatus;    
 
 DROP TABLE IF EXISTS ctlEContactTypeID;

-- */ 