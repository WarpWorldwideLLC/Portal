USE WarpAdmin2017;

SELECT * FROM Version;

/*
INSERT INTO Version (ID, CreateDate, VersionNumber, Location) 
VALUES (2, '2018-04-16', '2018.04.16.1500', 'DEV-000');
*/

-- User Role creates connection between user and role. Connection is many-to-many.
 DROP TABLE IF EXISTS UserRole;
 DROP TABLE IF EXISTS EntityRole;
 CREATE TABLE EntityRole (
 	ID 									BIGINT PRIMARY KEY AUTO_INCREMENT,
    RecordStatusID						BIGINT DEFAULT 10, 
    CreateDate 							DATETIME DEFAULT CURRENT_TIMESTAMP,
    AuID 								BIGINT DEFAULT -1,
	IuID 								BIGINT DEFAULT -1,
	LastModifyDate 						DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	LastAuID 							BIGINT DEFAULT -1,
	LastIuID 							BIGINT DEFAULT -1,
	EntityID							BIGINT, 
    RoleID								BIGINT,
    ExpirationDate						DATETIME DEFAULT '9999-12-31'
	);
    
    INSERT INTO EntityRole (EntityID, RoleID) VALUES(3, 1);
    
    SELECT * FROM EntityRole;