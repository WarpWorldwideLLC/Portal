/* Used to store the ELL License Codes for ELL products */
DROP TABLE IF EXISTS EllLicense;  
CREATE TABLE EllLicense (
	ID 									BIGINT PRIMARY KEY AUTO_INCREMENT,
    RecordStatusID						BIGINT DEFAULT 10, 
    CreateDate 							DATETIME DEFAULT CURRENT_TIMESTAMP,
    AuID 								BIGINT DEFAULT -1,
	IuID 								BIGINT DEFAULT -1,
	LastModifyDate 						DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	LastAuID 							BIGINT DEFAULT -1,
	LastIuID 							BIGINT DEFAULT -1,
    SystemMode							NVARCHAR(100),
    WarpSolutionCode					NVARCHAR(255),
    EllLicenseCode						NVARCHAR(100)
);
   
  
   
-- Winnie's World
INSERT INTO EllLicense (SystemMode, WarpSolutionCode, EllLicenseCode) VALUES ('Test', 'WARP-ESLC-00103', '1542');
INSERT INTO EllLicense (SystemMode, WarpSolutionCode, EllLicenseCode) VALUES ('Test', 'WARP-ESLC-00106', '1542');
INSERT INTO EllLicense (SystemMode, WarpSolutionCode, EllLicenseCode) VALUES ('Test', 'WARP-ESLC-00112', '1542');
    
-- English Academy
INSERT INTO EllLicense (SystemMode, WarpSolutionCode, EllLicenseCode) VALUES ('Test', 'WARP-ESLC-00212', '1542');    
    
-- EFS
INSERT INTO EllLicense (SystemMode, WarpSolutionCode, EllLicenseCode) VALUES ('Test', 'WARP-ESLC-00303', '1542');
INSERT INTO EllLicense (SystemMode, WarpSolutionCode, EllLicenseCode) VALUES ('Test', 'WARP-ESLC-00306', '1542');
INSERT INTO EllLicense (SystemMode, WarpSolutionCode, EllLicenseCode) VALUES ('Test', 'WARP-ESLC-00312', '1542');

INSERT INTO EllLicense (SystemMode, WarpSolutionCode, EllLicenseCode) VALUES ('Prod', 'WARP-ESLC-00303', '3390');
INSERT INTO EllLicense (SystemMode, WarpSolutionCode, EllLicenseCode) VALUES ('Prod', 'WARP-ESLC-00306', '3389');
INSERT INTO EllLicense (SystemMode, WarpSolutionCode, EllLicenseCode) VALUES ('Prod', 'WARP-ESLC-00312', '3387');

-- Master English
INSERT INTO EllLicense (SystemMode, WarpSolutionCode, EllLicenseCode) VALUES ('Test', 'WARP-ESLC-00403', '1551');
INSERT INTO EllLicense (SystemMode, WarpSolutionCode, EllLicenseCode) VALUES ('Test', 'WARP-ESLC-00406', '1551');
INSERT INTO EllLicense (SystemMode, WarpSolutionCode, EllLicenseCode) VALUES ('Test', 'WARP-ESLC-00412', '1551');

INSERT INTO EllLicense (SystemMode, WarpSolutionCode, EllLicenseCode) VALUES ('Prod', 'WARP-ESLC-00403', '3394');
INSERT INTO EllLicense (SystemMode, WarpSolutionCode, EllLicenseCode) VALUES ('Prod', 'WARP-ESLC-00406', '3393');
INSERT INTO EllLicense (SystemMode, WarpSolutionCode, EllLicenseCode) VALUES ('Prod', 'WARP-ESLC-00412', '3392');

-- Business English
INSERT INTO EllLicense (SystemMode, WarpSolutionCode, EllLicenseCode) VALUES ('Test', 'WARP-ESLC-00512', '1542');    

INSERT INTO EllLicense (SystemMode, WarpSolutionCode, EllLicenseCode) VALUES ('Prod', 'WARP-ESLC-00512', '3391');    


-- Mobile App
INSERT INTO EllLicense (SystemMode, WarpSolutionCode, EllLicenseCode) VALUES ('Test', 'WARP-ESLC-00612', '1552');    

INSERT INTO EllLicense (SystemMode, WarpSolutionCode, EllLicenseCode) VALUES ('Prod', 'WARP-ESLC-00612', '3397');    



