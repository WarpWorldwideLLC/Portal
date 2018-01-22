/* 
CREATE Schema WarpAdmin2017;
*/
DROP DATABASE IF EXISTS WarpMaster;
CREATE DATABASE WarpMaster CHARACTER SET utf8 COLLATE utf8_general_ci;
USE  WarpMaster;



-- /* Clean the Schema in the correct order to address foreign keys. 
-- DROP TABLE IF EXISTS CtlRecordStatus;   

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

/*                                                                                                     */
/* Just an empty table used as a template for building new tables */
/*                                                                                                 
DROP TABLE IF EXISTS TableTemplate;
CREATE TABLE Entity (
	PrimaryKeyID 						BIGINT PRIMARY KEY AUTO_INCREMENT,
	ForeignKeyID 						BIGINT,
    RecordStatusID							BIGINT, 
    CreateDate 							DATETIME,
    CreateUserID 						BIGINT,
	LastModifyDate 					DATETIME,
    LastModifyUserID 					BIGINT
    
    ALTER TABLE tbl_name 
    ADD CONSTRAINT FOREIGN KEY (RecordStatusID)
    REFERENCES 
    
    Ctl = Control Table - full of values that will be referenced elsewhere.
    
    
    );
*/


/*******************************************************************************************************/
/* Begin Control Tables                                                                                */
/*******************************************************************************************************/

DROP TABLE IF EXISTS ctlRecordStatus;    
CREATE TABLE ctlRecordStatus (
	ID 									BIGINT PRIMARY KEY AUTO_INCREMENT,
    CreateDate 							DATETIME DEFAULT CURRENT_TIMESTAMP,
    CreateUserID 						BIGINT DEFAULT -1,
	LastModifyDate 						DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    LastModifyUserID 					BIGINT DEFAULT -1,
    RecordStatusName					NVARCHAR(20),
    RecordStatusCode					NVARCHAR(4)
	)
    AUTO_INCREMENT = 10000,
    ENGINE = InnoDB;

INSERT INTO ctlRecordStatus (ID, RecordStatusName, RecordStatusCode) VALUES (10, 'ACTIVE', 'ACT');
INSERT INTO ctlRecordStatus (ID, RecordStatusName, RecordStatusCode) VALUES (20, 'INACTIVE', 'INA');
INSERT INTO ctlRecordStatus (ID, RecordStatusName, RecordStatusCode) VALUES (30, 'PENDING', 'PEN');			-- Record Pending approval or confirmation
INSERT INTO ctlRecordStatus (ID, RecordStatusName, RecordStatusCode) VALUES (80, 'PURGE', 'PURG');				-- Records to be Physically Deleted.
INSERT INTO ctlRecordStatus (ID, RecordStatusName, RecordStatusCode) VALUES (90, 'DELETED', 'DEL');			-- Records to be treated as Logically Deleted.
INSERT INTO ctlRecordStatus (ID, RecordStatusName, RecordStatusCode) VALUES (99, 'RESTRICTED', 'RES');

SELECT * FROM ctlRecordStatus;

DROP TABLE IF EXISTS ctlEntityType;    
CREATE TABLE ctlEntityType (
	ID 									BIGINT PRIMARY KEY AUTO_INCREMENT,
    RecordStatusID						BIGINT DEFAULT 10, 
    CreateDate 							DATETIME DEFAULT CURRENT_TIMESTAMP,
    CreateUserID 						BIGINT DEFAULT -1,
	LastModifyDate 						DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    LastModifyUserID 					BIGINT DEFAULT -1,
    EntityTypeName						NVARCHAR(100)
	);

ALTER TABLE ctlEntityType 
    ADD CONSTRAINT FOREIGN KEY (RecordStatusID)
    REFERENCES ctlRecordStatus(ID);  

INSERT INTO ctlEntityType (ID, EntityTypeName) VALUES (1, 'Master'); 
INSERT INTO ctlEntityType (ID, EntityTypeName) VALUES (2, 'Client'); 
INSERT INTO ctlEntityType (ID, EntityTypeName) VALUES (3, 'Customer'); 
INSERT INTO ctlEntityType (ID, EntityTypeName) VALUES (4, 'Group'); 
INSERT INTO ctlEntityType (ID, EntityTypeName) VALUES (5, 'Contact');   
INSERT INTO ctlEntityType (ID, EntityTypeName) VALUES (6, 'UserAccount');  

SELECT * FROM ctlEntityType;

DROP TABLE IF EXISTS ctlEntityNameType;    
CREATE TABLE ctlEntityNameType (
	ID 									BIGINT PRIMARY KEY AUTO_INCREMENT,
    RecordStatusID						BIGINT DEFAULT 10, 
    CreateDate 							DATETIME DEFAULT CURRENT_TIMESTAMP,
    CreateUserID 						BIGINT DEFAULT -1,
	LastModifyDate 						DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    LastModifyUserID 					BIGINT DEFAULT -1,
    EntityNameTypeName					NVARCHAR(100)
	);

INSERT INTO ctlEntityNameType (ID, EntityNameTypeName) VALUES (1, 'Legal Name');
INSERT INTO ctlEntityNameType (ID, EntityNameTypeName) VALUES (2, 'Account Name');
INSERT INTO ctlEntityNameType (ID, EntityNameTypeName) VALUES (3, 'First Name');
INSERT INTO ctlEntityNameType (ID, EntityNameTypeName) VALUES (4, 'Middle Name');
INSERT INTO ctlEntityNameType (ID, EntityNameTypeName) VALUES (5, 'Last Name');

SELECT * FROM ctlEntityNameType;

DROP TABLE IF EXISTS ctlEContactType;    
CREATE TABLE ctlEContactType (
	ID 									BIGINT PRIMARY KEY AUTO_INCREMENT,
    RecordStatusID						BIGINT DEFAULT 10, 
    CreateDate 							DATETIME DEFAULT CURRENT_TIMESTAMP,
    CreateUserID 						BIGINT DEFAULT -1,
	LastModifyDate 						DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    LastModifyUserID 					BIGINT DEFAULT -1,
    EContactTypeName					NVARCHAR(100)
);

INSERT INTO ctlEContactType (ID, EContactTypeName) VALUES (1, "eMail");
INSERT INTO ctlEContactType (ID, EContactTypeName) VALUES (2, "SMS");
INSERT INTO ctlEContactType (ID, EContactTypeName) VALUES (3, "Facebook");
INSERT INTO ctlEContactType (ID, EContactTypeName) VALUES (4, "Twitter");
INSERT INTO ctlEContactType (ID, EContactTypeName) VALUES (5, "YouTube");
INSERT INTO ctlEContactType (ID, EContactTypeName) VALUES (6, "Instagram");
INSERT INTO ctlEContactType (ID, EContactTypeName) VALUES (7, "Google+");
INSERT INTO ctlEContactType (ID, EContactTypeName) VALUES (8, "LinkedIn");
INSERT INTO ctlEContactType (ID, EContactTypeName) VALUES (9, "WeChat");
INSERT INTO ctlEContactType (ID, EContactTypeName) VALUES (10, "Weibo");
INSERT INTO ctlEContactType (ID, EContactTypeName) VALUES (11, "QQ");




DROP TABLE IF EXISTS ctlBillingEventType;    
CREATE TABLE ctlBillingEventType (
	ID 									BIGINT PRIMARY KEY AUTO_INCREMENT,
    RecordStatusID						BIGINT DEFAULT 10, 
    CreateDate 							DATETIME DEFAULT CURRENT_TIMESTAMP,
    CreateUserID 						BIGINT DEFAULT -1,
	LastModifyDate 						DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    LastModifyUserID 					BIGINT DEFAULT -1,
    BillingEventName					NVARCHAR(100),
    BillingEventDescr					NVARCHAR(100)
);



/* ISO-3166-1 Country Code Information */
DROP TABLE IF EXISTS ctlCountry;    
CREATE TABLE ctlCountry (
	ID 									BIGINT PRIMARY KEY AUTO_INCREMENT,
    RecordStatusID						BIGINT DEFAULT 10, 
    CreateDate 							DATETIME DEFAULT CURRENT_TIMESTAMP,
    CreateUserID 						BIGINT DEFAULT -1,
	LastModifyDate 						DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    LastModifyUserID 					BIGINT DEFAULT -1,
    CustomEntry							BOOLEAN,
    CountryNameEng						NVARCHAR(255),
    Alpha2Code							NVARCHAR(255),
    Alpha3Code							NVARCHAR(255),
    NumericCode							BIGINT
    );


-- INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
LOAD DATA LOCAL INFILE '/Users/jarp/Dropbox/Personal/WARP Worldwide/WARP Source/SQL/CountryCodes.txt' 
INTO TABLE ctlCountry  
    FIELDS TERMINATED BY ',' 
           OPTIONALLY ENCLOSED BY '"'
    LINES  TERMINATED BY '\n'
(ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode);

SELECT * FROM ctlCountry;

  

/* ISO 3166-2 Country Sub-Divison Information */
DROP TABLE IF EXISTS CountrySubdivision;    
CREATE TABLE CountrySubdivision (
	ID 									BIGINT PRIMARY KEY AUTO_INCREMENT,
    RecordStatusID						BIGINT DEFAULT 10, 
    CreateDate 							DATETIME DEFAULT CURRENT_TIMESTAMP,
    CreateUserID 						BIGINT DEFAULT -1,
	LastModifyDate 						DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    LastModifyUserID 					BIGINT DEFAULT -1
    );

DROP TABLE IF EXISTS cltPostalCode;    
CREATE TABLE ctlPostalCode (
	ID 									BIGINT PRIMARY KEY AUTO_INCREMENT,
    RecordStatusID						BIGINT DEFAULT 10, 
    CreateDate 							DATETIME DEFAULT CURRENT_TIMESTAMP,
    CreateUserID 						BIGINT DEFAULT -1,
	LastModifyDate 						DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    LastModifyUserID 					BIGINT DEFAULT -1,
	PostalCode1							NVARCHAR(255),
    PostalCode2							NVARCHAR(255)
);



/* ISO 639-1 Language Codes */
-- The Accept-Language Header is in the format ISO 639-1 Language Code, optionally followed by "-" and the ISO 3166-2 Country Code.


/*******************************************************************************************************/
/* End Control Tables                                                                                  */
/*******************************************************************************************************/


/*******************************************************************************************************/
/* Begin Billing Tables                                                                                */
/*******************************************************************************************************/


DROP TABLE IF EXISTS BillingEvent;    
CREATE TABLE BillingEvent (
	ID 									BIGINT PRIMARY KEY AUTO_INCREMENT,
    RecordStatusID						BIGINT DEFAULT 10, 
    CreateDate 							DATETIME DEFAULT CURRENT_TIMESTAMP,
    CreateUserID 						BIGINT DEFAULT -1,
	LastModifyDate 						DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    LastModifyUserID 					BIGINT DEFAULT -1,
    BillingEventTypeID 					BIGINT,
    EventEntityID						BIGINT
);
    
/*******************************************************************************************************/
/* End Billing Tables                                                                                  */
/*******************************************************************************************************/

    

/*******************************************************************************************************/
/* Begin HIerarchy Tables                                                                              */
/*******************************************************************************************************/
/* Any Entity type can participate in the Hierarchy table, but only Entity Types can do so.            */
/* http://mikehillyer.com/articles/managing-hierarchical-data-in-mysql/                                */
/*-----------------------------------------------------------------------------------------------------*/

DROP TABLE IF EXISTS Hierarchy;    
CREATE TABLE Hierarchy (
	ID 									BIGINT PRIMARY KEY AUTO_INCREMENT,
    RecordStatusID						BIGINT DEFAULT 10, 
    CreateDate 							DATETIME DEFAULT CURRENT_TIMESTAMP,
    CreateUserID 						BIGINT DEFAULT -1,
	LastModifyDate 						DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    LastModifyUserID 					BIGINT DEFAULT -1,
	HierarchyName						NVARCHAR(100),
    HieararchyDescr 					NVARCHAR(1000)
	);
    
/* 
	Note that A ChildEntity can have only one ParentEntityID in any given hierarchy, 
	but a ParentEntityID may have unlimited ChildEnityIDs
*/

DROP TABLE IF EXISTS HierarchyXref;
CREATE TABLE HierarchyXref (
	ID 									BIGINT PRIMARY KEY AUTO_INCREMENT,
    RecordStatusID						BIGINT DEFAULT 10, 
    CreateDate 							DATETIME DEFAULT CURRENT_TIMESTAMP,
    CreateUserID 						BIGINT DEFAULT -1,
	LastModifyDate 						DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    LastModifyUserID 					BIGINT DEFAULT -1,
    HierarchyID							BIGINT UNIQUE,
	ParentEntityID						BIGINT,
    ChildEntityID						BIGINT
); 
/*  HierarchyID; ParentEntityID;     ChildEntityID	are compound unique index. They are FK back to their individual tables */
    

/*******************************************************************************************************/
/* End Hierarchy Tables                                                                                  */
/*******************************************************************************************************/


DROP TABLE IF EXISTS Entity;
CREATE TABLE Entity (
	ID 									BIGINT PRIMARY KEY AUTO_INCREMENT,
    RecordStatusID						BIGINT DEFAULT 10, 
    CreateDate 							DATETIME DEFAULT CURRENT_TIMESTAMP,
    CreateUserID 						BIGINT DEFAULT -1,
	LastModifyDate 						DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    LastModifyUserID 					BIGINT DEFAULT -1,
	EntityTypeID 						BIGINT
    );
    
INSERT INTO Entity (ID, RecordStatusID, EntityTypeID) VALUES (1, 10, 1);
    
SELECT * FROM Entity;    
    
DROP TABLE IF EXISTS EntityName;    
CREATE TABLE EntityName (
	ID 									BIGINT PRIMARY KEY AUTO_INCREMENT,
    RecordStatusID						BIGINT DEFAULT 10, 
    CreateDate 							DATETIME DEFAULT CURRENT_TIMESTAMP,
    CreateUserID 						BIGINT DEFAULT -1,
	LastModifyDate 						DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    LastModifyUserID 					BIGINT DEFAULT -1,
    EntityID							BIGINT, 
    EntityNameTypeID					BIGINT, 
    EntityName							NVARCHAR(100),
    DefaultName							NVARCHAR(1) DEFAULT 'N'
	);
   
   
ALTER TABLE EntityName
	ADD CONSTRAINT uniqueName UNIQUE (EntityNameTypeID, EntityName);
   
INSERT INTO EntityName (ID, EntityID, EntityNameTypeID, EntityName, DefaultName) VALUES (1, 1, 1, 'WARP Worldwide, LLC', 'Y');

SELECT * FROM EntityName;   
SELECT * FROM ctlEntityNameType;
SELECT * FROM Entity;
SELECT * FROM ctlEntityType;

/* 
Use no more than 5 lines, including:
Addressee's name.
Street address or P.O. box number.
City or town, principal subdivision such as province, state, or county, and postal code. In some countries, the postal code may precede the city or town.
Country name.
https://blink.ucsd.edu/facilities/services/mail/international/addressing/index.html

~ http://www.columbia.edu/~fdc/postal/ ~
Frank's Compulsive Guide to Postal Addresses


As a basis for discussion, let's begin by looking at a typical international address:

JOE BLOGGS							Person's name
COMPUTER CENTER						Department (if any)
CURTIN UNIVERSITY OF TECHNOLOGY    	Institution or Company (if any)
309 KENT STREET						Street Address (or Post Office Box)
BENTLEY WA  6102					City Line (WA = Western Australia)
AUSTRALIA							Country Name
It illustrates several points, all of which are discussed later in greater detail:

*/

DROP TABLE IF EXISTS PostalAddress;    
CREATE TABLE PostalAddress (
	ID 									BIGINT PRIMARY KEY AUTO_INCREMENT,
    RecordStatusID						BIGINT DEFAULT 10, 
    CreateDate 							DATETIME DEFAULT CURRENT_TIMESTAMP,
    CreateUserID 						BIGINT DEFAULT -1,
	LastModifyDate 						DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    LastModifyUserID 					BIGINT DEFAULT -1,
	ContactTypeID						BIGINT,
	CityID								BIGINT, 
    PostalCodeID						BIGINT
);

DROP TABLE IF EXISTS PostalAddressLine;    
CREATE TABLE PostalAddressLine (
	ID 									BIGINT PRIMARY KEY AUTO_INCREMENT,
    RecordStatusID						BIGINT DEFAULT 10, 
    CreateDate 							DATETIME DEFAULT CURRENT_TIMESTAMP,
    CreateUserID 						BIGINT DEFAULT -1,
	LastModifyDate 						DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    LastModifyUserID 					BIGINT DEFAULT -1,
	PostalAddressID						BIGINT,
    PostalAddressLineSeq				BIGINT,
	PostalAddressLine					NVARCHAR(255)
);

DROP TABLE IF EXISTS City;    
CREATE TABLE City (
	ID 									BIGINT PRIMARY KEY AUTO_INCREMENT,
    RecordStatusID						BIGINT DEFAULT 10, 
    CreateDate 							DATETIME DEFAULT CURRENT_TIMESTAMP,
    CreateUserID 						BIGINT DEFAULT -1,
	LastModifyDate 						DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    LastModifyUserID 					BIGINT DEFAULT -1,
    CityName							NVARCHAR(100),
	StateProvID							BIGINT,
	CountryID							BIGINT
);

DROP TABLE IF EXISTS Phone;        
CREATE TABLE Phone (
	ID 									BIGINT PRIMARY KEY AUTO_INCREMENT,
    RecordStatusID						BIGINT DEFAULT 10, 
    CreateDate 							DATETIME DEFAULT CURRENT_TIMESTAMP,
    CreateUserID 						BIGINT DEFAULT -1,
	LastModifyDate 						DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    LastModifyUserID 					BIGINT DEFAULT -1,
    ContactTypeID						BIGINT,
    PhoneTypeID							BIGINT,
	PhoneNumber							BIGINT,
	CountryID							BIGINT
    );
        
DROP TABLE IF EXISTS eContact;        
CREATE TABLE eContact (
	ID 									BIGINT PRIMARY KEY AUTO_INCREMENT,
    RecordStatusID						BIGINT DEFAULT 10, 
    CreateDate 							DATETIME DEFAULT CURRENT_TIMESTAMP,
    CreateUserID 						BIGINT DEFAULT -1,
	LastModifyDate 						DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    LastModifyUserID 					BIGINT DEFAULT -1,
    EntityID							BIGINT,
    ContactTypeID						BIGINT,
	eContactIdentifier					NVARCHAR(255),
	CountryID							BIGINT
    );

 DROP TABLE IF EXISTS Role;
 CREATE TABLE Role (
 	ID 									BIGINT PRIMARY KEY AUTO_INCREMENT,
    RecordStatusID						BIGINT DEFAULT 10, 
    CreateDate 							DATETIME DEFAULT CURRENT_TIMESTAMP,
    CreateUserID 						BIGINT DEFAULT -1,
	LastModifyDate 						DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    LastModifyUserID 					BIGINT DEFAULT -1,
	RoleName							NVARCHAR(100),
    AllowInheritance					BOOL
	);

-- Which Roles does this role inherit from
 DROP TABLE IF EXISTS RoleInheritance;
 CREATE TABLE RoleInheritance (
 	ID 									BIGINT PRIMARY KEY AUTO_INCREMENT,
    RecordStatusID						BIGINT DEFAULT 10, 
    CreateDate 							DATETIME DEFAULT CURRENT_TIMESTAMP,
    CreateUserID 						BIGINT DEFAULT -1,
	LastModifyDate 						DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    LastModifyUserID 					BIGINT DEFAULT -1,
	RoleIDParent						BIGINT,
    RoleIDChild							BIGINT
	);

-- User Role creates connection between user and role. Connection is many-to-many.
 DROP TABLE IF EXISTS UserRole;
 CREATE TABLE UserRole (
 	ID 									BIGINT PRIMARY KEY AUTO_INCREMENT,
    RecordStatusID						BIGINT DEFAULT 10, 
    CreateDate 							DATETIME DEFAULT CURRENT_TIMESTAMP,
    CreateUserID 						BIGINT DEFAULT -1,
	LastModifyDate 						DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    LastModifyUserID 					BIGINT DEFAULT -1,
	UserID								BIGINT, 
    RoleID								BIGINT
	);

-- No Group table for roles,just user hierarchies?


-- Solutions are the products we sell.         
 DROP TABLE IF EXISTS Solution;
 CREATE TABLE Solution (
 	ID 									BIGINT PRIMARY KEY AUTO_INCREMENT,
    RecordStatusID						BIGINT DEFAULT 10, 
    CreateDate 							DATETIME DEFAULT CURRENT_TIMESTAMP,
    CreateUserID 						BIGINT DEFAULT -1,
	LastModifyDate 						DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    LastModifyUserID 					BIGINT DEFAULT -1,
	SolutionName						NVARCHAR(100)
	);
    
-- EntitySolution shows which Entities have access to which Solutions, and which billing method is assigned.     
 DROP TABLE IF EXISTS EntitySolution;
 CREATE TABLE EntitySolution (
 	ID 									BIGINT PRIMARY KEY AUTO_INCREMENT,
    RecordStatusID						BIGINT DEFAULT 10, 
    CreateDate 							DATETIME DEFAULT CURRENT_TIMESTAMP,
    CreateUserID 						BIGINT DEFAULT -1,
	LastModifyDate 						DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    LastModifyUserID 					BIGINT DEFAULT -1,
	SolutionID							BIGINT, 
    EntityID							BIGINT,
    BillingEventID						BIGINT
	);
    
    
    /*
INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (999, 'Unknown', '??', '???', '000');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (1, 'Afghanistan', 'AF', 'AFG', '004');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (2, 'Åland Islands', 'AX', 'ALA', '248');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (3, 'Albania', 'AL', 'ALB', '008');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (4, 'Algeria', 'DZ', 'DZA', '012');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (5, 'American Samoa', 'AS', 'ASM', '016');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (6, 'Andorra', 'AD', 'AND', '020');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (7, 'Angola', 'AO', 'AGO', '024');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (8, 'Anguilla', 'AI', 'AIA', '660');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (9, 'Antarctica', 'AQ', 'ATA', '010');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (10, 'Antigua and Barbuda', 'AG', 'ATG', '028');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (11, 'Argentina', 'AR', 'ARG', '032');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (12, 'Armenia', 'AM', 'ARM', '051');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (13, 'Aruba', 'AW', 'ABW', '533');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (14, 'Australia', 'AU', 'AUS', '036');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (15, 'Austria', 'AT', 'AUT', '040');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (16, 'Azerbaijan', 'AZ', 'AZE', '031');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (17, 'Bahamas', 'BS', 'BHS', '044');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (18, 'Bahrain', 'BH', 'BHR', '048');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (19, 'Bangladesh', 'BD', 'BGD', '050');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (20, 'Barbados', 'BB', 'BRB', '052');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (21, 'Belarus', 'BY', 'BLR', '112');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (22, 'Belgium', 'BE', 'BEL', '056');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (23, 'Belize', 'BZ', 'BLZ', '084');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (24, 'Benin', 'BJ', 'BEN', '204');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (25, 'Bermuda', 'BM', 'BMU', '060');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (26, 'Bhutan', 'BT', 'BTN', '064');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (27, 'Bolivia (Plurinational State of)', 'BO', 'BOL', '068');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (28, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '535');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (29, 'Bosnia and Herzegovina', 'BA', 'BIH', '070');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (30, 'Botswana', 'BW', 'BWA', '072');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (31, 'Bouvet Island', 'BV', 'BVT', '074');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (32, 'Brazil', 'BR', 'BRA', '076');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (33, 'British Indian Ocean Territory', 'IO', 'IOT', '086');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (34, 'Brunei Darussalam', 'BN', 'BRN', '096');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (35, 'Bulgaria', 'BG', 'BGR', '100');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (36, 'Burkina Faso', 'BF', 'BFA', '854');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (37, 'Burundi', 'BI', 'BDI', '108');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (38, 'Cabo Verde', 'CV', 'CPV', '132');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (39, 'Cambodia', 'KH', 'KHM', '116');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (40, 'Cameroon', 'CM', 'CMR', '120');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (41, 'Canada', 'CA', 'CAN', '124');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (42, 'Cayman Islands', 'KY', 'CYM', '136');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (43, 'Central African Republic', 'CF', 'CAF', '140');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (44, 'Chad', 'TD', 'TCD', '148');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (45, 'Chile', 'CL', 'CHL', '152');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (46, 'China', 'CN', 'CHN', '156');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (47, 'Christmas Island', 'CX', 'CXR', '162');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (48, 'Cocos (Keeling) Islands', 'CC', 'CCK', '166');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (49, 'Colombia', 'CO', 'COL', '170');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (50, 'Comoros', 'KM', 'COM', '174');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (51, 'Congo', 'CG', 'COG', '178');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (52, 'Congo (Democratic Republic of the)', 'CD', 'COD', '180');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (53, 'Cook Islands', 'CK', 'COK', '184');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (54, 'Costa Rica', 'CR', 'CRI', '188');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (55, 'Côte d''Ivoire', 'CI', 'CIV', '384');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (56, 'Croatia', 'HR', 'HRV', '191');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (57, 'Cuba', 'CU', 'CUB', '192');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (58, 'Curaçao', 'CW', 'CUW', '531');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (59, 'Cyprus', 'CY', 'CYP', '196');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (60, 'Czechia', 'CZ', 'CZE', '203');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (61, 'Denmark', 'DK', 'DNK', '208');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (62, 'Djibouti', 'DJ', 'DJI', '262');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (63, 'Dominica', 'DM', 'DMA', '212');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (64, 'Dominican Republic', 'DO', 'DOM', '214');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (65, 'Ecuador', 'EC', 'ECU', '218');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (66, 'Egypt', 'EG', 'EGY', '818');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (67, 'El Salvador', 'SV', 'SLV', '222');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (68, 'Equatorial Guinea', 'GQ', 'GNQ', '226');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (69, 'Eritrea', 'ER', 'ERI', '232');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (70, 'Estonia', 'EE', 'EST', '233');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (71, 'Ethiopia', 'ET', 'ETH', '231');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (72, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '238');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (73, 'Faroe Islands', 'FO', 'FRO', '234');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (74, 'Fiji', 'FJ', 'FJI', '242');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (75, 'Finland', 'FI', 'FIN', '246');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (76, 'France', 'FR', 'FRA', '250');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (77, 'French Guiana', 'GF', 'GUF', '254');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (78, 'French Polynesia', 'PF', 'PYF', '258');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (79, 'French Southern Territories', 'TF', 'ATF', '260');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (80, 'Gabon', 'GA', 'GAB', '266');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (81, 'Gambia', 'GM', 'GMB', '270');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (82, 'Georgia', 'GE', 'GEO', '268');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (83, 'Germany', 'DE', 'DEU', '276');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (84, 'Ghana', 'GH', 'GHA', '288');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (85, 'Gibraltar', 'GI', 'GIB', '292');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (86, 'Greece', 'GR', 'GRC', '300');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (87, 'Greenland', 'GL', 'GRL', '304');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (88, 'Grenada', 'GD', 'GRD', '308');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (89, 'Guadeloupe', 'GP', 'GLP', '312');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (90, 'Guam', 'GU', 'GUM', '316');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (91, 'Guatemala', 'GT', 'GTM', '320');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (92, 'Guernsey', 'GG', 'GGY', '831');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (93, 'Guinea', 'GN', 'GIN', '324');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (94, 'Guinea-Bissau', 'GW', 'GNB', '624');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (95, 'Guyana', 'GY', 'GUY', '328');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (96, 'Haiti', 'HT', 'HTI', '332');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (97, 'Heard Island and McDonald Islands', 'HM', 'HMD', '334');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (98, 'Holy See', 'VA', 'VAT', '336');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (99, 'Honduras', 'HN', 'HND', '340');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (100, 'Hong Kong', 'HK', 'HKG', '344');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (101, 'Hungary', 'HU', 'HUN', '348');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (102, 'Iceland', 'IS', 'ISL', '352');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (103, 'India', 'IN', 'IND', '356');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (104, 'Indonesia', 'ID', 'IDN', '360');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (105, 'Iran (Islamic Republic of)', 'IR', 'IRN', '364');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (106, 'Iraq', 'IQ', 'IRQ', '368');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (107, 'Ireland', 'IE', 'IRL', '372');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (108, 'Isle of Man', 'IM', 'IMN', '833');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (109, 'Israel', 'IL', 'ISR', '376');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (110, 'Italy', 'IT', 'ITA', '380');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (111, 'Jamaica', 'JM', 'JAM', '388');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (112, 'Japan', 'JP', 'JPN', '392');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (113, 'Jersey', 'JE', 'JEY', '832');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (114, 'Jordan', 'JO', 'JOR', '400');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (115, 'Kazakhstan', 'KZ', 'KAZ', '398');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (116, 'Kenya', 'KE', 'KEN', '404');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (117, 'Kiribati', 'KI', 'KIR', '296');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (118, 'Korea (Democratic People''s Republic of)', 'KP', 'PRK', '408');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (119, 'Korea (Republic of)', 'KR', 'KOR', '410');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (120, 'Kuwait', 'KW', 'KWT', '414');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (121, 'Kyrgyzstan', 'KG', 'KGZ', '417');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (122, 'Lao People''s Democratic Republic', 'LA', 'LAO', '418');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (123, 'Latvia', 'LV', 'LVA', '428');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (124, 'Lebanon', 'LB', 'LBN', '422');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (125, 'Lesotho', 'LS', 'LSO', '426');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (126, 'Liberia', 'LR', 'LBR', '430');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (127, 'Libya', 'LY', 'LBY', '434');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (128, 'Liechtenstein', 'LI', 'LIE', '438');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (129, 'Lithuania', 'LT', 'LTU', '440');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (130, 'Luxembourg', 'LU', 'LUX', '442');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (131, 'Macao', 'MO', 'MAC', '446');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (132, 'Macedonia (the former Yugoslav Republic of)', 'MK', 'MKD', '807');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (133, 'Madagascar', 'MG', 'MDG', '450');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (134, 'Malawi', 'MW', 'MWI', '454');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (135, 'Malaysia', 'MY', 'MYS', '458');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (136, 'Maldives', 'MV', 'MDV', '462');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (137, 'Mali', 'ML', 'MLI', '466');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (138, 'Malta', 'MT', 'MLT', '470');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (139, 'Marshall Islands', 'MH', 'MHL', '584');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (140, 'Martinique', 'MQ', 'MTQ', '474');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (141, 'Mauritania', 'MR', 'MRT', '478');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (142, 'Mauritius', 'MU', 'MUS', '480');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (143, 'Mayotte', 'YT', 'MYT', '175');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (144, 'Mexico', 'MX', 'MEX', '484');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (145, 'Micronesia (Federated States of)', 'FM', 'FSM', '583');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (146, 'Moldova (Republic of)', 'MD', 'MDA', '498');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (147, 'Monaco', 'MC', 'MCO', '492');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (148, 'Mongolia', 'MN', 'MNG', '496');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (149, 'Montenegro', 'ME', 'MNE', '499');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (150, 'Montserrat', 'MS', 'MSR', '500');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (151, 'Morocco', 'MA', 'MAR', '504');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (152, 'Mozambique', 'MZ', 'MOZ', '508');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (153, 'Myanmar', 'MM', 'MMR', '104');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (154, 'Namibia', 'NA', 'NAM', '516');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (155, 'Nauru', 'NR', 'NRU', '520');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (156, 'Nepal', 'NP', 'NPL', '524');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (157, 'Netherlands', 'NL', 'NLD', '528');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (158, 'New Caledonia', 'NC', 'NCL', '540');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (159, 'New Zealand', 'NZ', 'NZL', '554');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (160, 'Nicaragua', 'NI', 'NIC', '558');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (161, 'Niger', 'NE', 'NER', '562');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (162, 'Nigeria', 'NG', 'NGA', '566');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (163, 'Niue', 'NU', 'NIU', '570');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (164, 'Norfolk Island', 'NF', 'NFK', '574');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (165, 'Northern Mariana Islands', 'MP', 'MNP', '580');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (166, 'Norway', 'NO', 'NOR', '578');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (167, 'Oman', 'OM', 'OMN', '512');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (168, 'Pakistan', 'PK', 'PAK', '586');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (169, 'Palau', 'PW', 'PLW', '585');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (170, 'Palestine, State of', 'PS', 'PSE', '275');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (171, 'Panama', 'PA', 'PAN', '591');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (172, 'Papua New Guinea', 'PG', 'PNG', '598');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (173, 'Paraguay', 'PY', 'PRY', '600');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (174, 'Peru', 'PE', 'PER', '604');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (175, 'Philippines', 'PH', 'PHL', '608');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (176, 'Pitcairn', 'PN', 'PCN', '612');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (177, 'Poland', 'PL', 'POL', '616');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (178, 'Portugal', 'PT', 'PRT', '620');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (179, 'Puerto Rico', 'PR', 'PRI', '630');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (180, 'Qatar', 'QA', 'QAT', '634');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (181, 'Réunion', 'RE', 'REU', '638');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (182, 'Romania', 'RO', 'ROU', '642');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (183, 'Russian Federation', 'RU', 'RUS', '643');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (184, 'Rwanda', 'RW', 'RWA', '646');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (185, 'Saint Barthélemy', 'BL', 'BLM', '652');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (186, 'Saint Helena, Ascension and Tristan da Cunha', 'SH', 'SHN', '654');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (187, 'Saint Kitts and Nevis', 'KN', 'KNA', '659');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (188, 'Saint Lucia', 'LC', 'LCA', '662');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (189, 'Saint Martin (French part)', 'MF', 'MAF', '663');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (190, 'Saint Pierre and Miquelon', 'PM', 'SPM', '666');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (191, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '670');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (192, 'Samoa', 'WS', 'WSM', '882');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (193, 'San Marino', 'SM', 'SMR', '674');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (194, 'Sao Tome and Principe', 'ST', 'STP', '678');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (195, 'Saudi Arabia', 'SA', 'SAU', '682');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (196, 'Senegal', 'SN', 'SEN', '686');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (197, 'Serbia', 'RS', 'SRB', '688');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (198, 'Seychelles', 'SC', 'SYC', '690');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (199, 'Sierra Leone', 'SL', 'SLE', '694');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (200, 'Singapore', 'SG', 'SGP', '702');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (201, 'Sint Maarten (Dutch part)', 'SX', 'SXM', '534');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (202, 'Slovakia', 'SK', 'SVK', '703');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (203, 'Slovenia', 'SI', 'SVN', '705');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (204, 'Solomon Islands', 'SB', 'SLB', '090');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (205, 'Somalia', 'SO', 'SOM', '706');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (206, 'South Africa', 'ZA', 'ZAF', '710');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (207, 'South Georgia and the South Sandwich Islands', 'GS', 'SGS', '239');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (208, 'South Sudan', 'SS', 'SSD', '728');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (209, 'Spain', 'ES', 'ESP', '724');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (210, 'Sri Lanka', 'LK', 'LKA', '144');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (211, 'Sudan', 'SD', 'SDN', '729');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (212, 'Suriname', 'SR', 'SUR', '740');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (213, 'Svalbard and Jan Mayen', 'SJ', 'SJM', '744');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (214, 'Swaziland', 'SZ', 'SWZ', '748');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (215, 'Sweden', 'SE', 'SWE', '752');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (216, 'Switzerland', 'CH', 'CHE', '756');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (217, 'Syrian Arab Republic', 'SY', 'SYR', '760');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (218, 'Taiwan, Province of China[a]', 'TW', 'TWN', '158');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (219, 'Tajikistan', 'TJ', 'TJK', '762');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (220, 'Tanzania, United Republic of', 'TZ', 'TZA', '834');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (221, 'Thailand', 'TH', 'THA', '764');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (222, 'Timor-Leste', 'TL', 'TLS', '626');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (223, 'Togo', 'TG', 'TGO', '768');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (224, 'Tokelau', 'TK', 'TKL', '772');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (225, 'Tonga', 'TO', 'TON', '776');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (226, 'Trinidad and Tobago', 'TT', 'TTO', '780');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (227, 'Tunisia', 'TN', 'TUN', '788');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (228, 'Turkey', 'TR', 'TUR', '792');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (229, 'Turkmenistan', 'TM', 'TKM', '795');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (230, 'Turks and Caicos Islands', 'TC', 'TCA', '796');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (231, 'Tuvalu', 'TV', 'TUV', '798');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (232, 'Uganda', 'UG', 'UGA', '800');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (233, 'Ukraine', 'UA', 'UKR', '804');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (234, 'United Arab Emirates', 'AE', 'ARE', '784');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (235, 'United Kingdom of Great Britain and Northern Ireland', 'GB', 'GBR', '826');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (236, 'United States of America', 'US', 'USA', '840');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (237, 'United States Minor Outlying Islands', 'UM', 'UMI', '581');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (238, 'Uruguay', 'UY', 'URY', '858');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (239, 'Uzbekistan', 'UZ', 'UZB', '860');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (240, 'Vanuatu', 'VU', 'VUT', '548');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (241, 'Venezuela (Bolivarian Republic of)', 'VE', 'VEN', '862');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (242, 'Viet Nam', 'VN', 'VNM', '704');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (243, 'Virgin Islands (British)', 'VG', 'VGB', '092');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (244, 'Virgin Islands (U.S.)', 'VI', 'VIR', '850');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (245, 'Wallis and Futuna', 'WF', 'WLF', '876');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (246, 'Western Sahara', 'EH', 'ESH', '732');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (247, 'Yemen', 'YE', 'YEM', '887');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (248, 'Zambia', 'ZM', 'ZMB', '894');

INSERT INTO ctlCountry (ID, CountryNameEng, Alpha2Code, Alpha3Code, NumericCode)
	VALUE (249, 'Zimbabwe', 'ZW', 'ZWE', '716');  
  
*/
