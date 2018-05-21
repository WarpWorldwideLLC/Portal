USE WarpAdmin2017;


	TRUNCATE TABLE Product;

	/* *************************************************************************************************** */
    /* Peterson's ILRN
    /* *************************************************************************************************** */
	INSERT INTO Product (ID,ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES (1, 'PILR-001', 'ILR:http://warpauth.petersons.com//TestPrep/index?testid=3', 'GMAT', 0.00);  
    INSERT INTO Product (ID,ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES (2, 'PILR-002', 'ILR:http://warpauth.petersons.com//TestPrep/index?testid=2', 'GRE', 0.00);  
	INSERT INTO Product (ID,ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES (3, 'PILR-003', 'ILR:http://warpauth.petersons.com//TestPrep/index?testid=123', 'SSAT Practice Test', 0.00); 
	INSERT INTO Product (ID,ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES (4, 'PILR-004', 'ILR:http://warpauth.petersons.com//TestPrep/index?testid=347', 'TOEFL', 0.00);  
	INSERT INTO Product (ID,ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES (5, 'PILR-005', 'ILR:http://warpauth.petersons.com//TestPrep/index?testid=321', 'STEM - SCIENCE HUB', 0.00); 
	INSERT INTO Product (ID,ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES (6, 'PILR-006', 'ILR:http://warpauth.petersons.com//TestPrep/index?testid=332', 'STEM - NURSING HUB', 0.00); 
	INSERT INTO Product (ID,ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES (7, 'PILR-007', 'ILR:http://warpauth.petersons.com//TestPrep/index?testid=333', 'STEM - MATH HUB', 0.00); 
	INSERT INTO Product (ID,ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES (8, 'PILR-008', 'ILR:http://warpauth.petersons.com//TestPrep/index?testid=334', 'STEM - PRE-ENGINEERING HUB', 0.00); 
	INSERT INTO Product (ID,ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES (9, 'PILR-009', 'ILR:http://warpauth.petersons.com//TestPrep/index?testid=335', 'STEM - TECHNOLOGY HUB', 0.00); 
	INSERT INTO Product (ID,ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES (10, 'PILR-010', 'ILR:http://warpauth.petersons.com//TestPrep/index?testid=336', 'STEM - SOCIAL SCIENCE HUB', 0.00); 

	/* *************************************************************************************************** */
    /* Peterson's OLC
    /* *************************************************************************************************** */    
    INSERT INTO Product (ID,ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES (11, 'POLC-001', 'OLC:SAT2016', 'SAT 2016', 0.00);
    INSERT INTO Product (ID,ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES (12, 'POLC-002', 'OLC:ACT2016', 'ACT 2016', 0.00);    
    INSERT INTO Product (ID,ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES (13, 'POLC-003', 'OLC:CPST', 'CPST - College Placement Skills Training', 0.00);  
    INSERT INTO Product (ID,ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES (14, 'POLC-004', 'OLC:OCAD', 'OCAD - Online Course for Academic Development', 0.00);    
    INSERT INTO Product (ID,ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES (15, 'POLC-005', 'OLC:ASVAB06', 'Online Course for the ASVAB', 0.00);    
    INSERT INTO Product (ID,ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES (16, 'POLC-006', 'OLC:GRE07', 'Online Course for the GRE', 0.00);    
 
 	/* *************************************************************************************************** */
    /* Pathways Products
    /* *************************************************************************************************** */    
	INSERT INTO Product (ID,ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES (17, 'BV-18101', '999999', 'Business Analytics Pathway Certificate', 0);
    INSERT INTO Product (ID,ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES (18, 'BV-18102', '999999', 'Project Management Pathway Certificate', 0);
    
 	/* *************************************************************************************************** */
    /* Lingo ELL Products
    /* *************************************************************************************************** */    
	INSERT INTO Product (ID,ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES (19, 'ESL-1810103', '999999', 'Winnie''s World (3 Month)', 0);
    INSERT INTO Product (ID,ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES (20, 'ESL-1810106', '999999', 'Winnie''s World (6 Month)', 0);
    INSERT INTO Product (ID,ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES (21, 'ESL-1810112', '999999', 'Winnie''s World (12 Month)', 0);
    INSERT INTO Product (ID,ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES (22, 'ESL-1810212', '999999', 'English Academy', 0);
    INSERT INTO Product (ID,ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES (23, 'ESL-1810303', '999999', 'English For Success (EFS) (3 Month)', 0);
	INSERT INTO Product (ID,ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES (24, 'ESL-1810306', '999999', 'English For Success (EFS) (6 Month)', 0);
    INSERT INTO Product (ID,ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES (25, 'ESL-1810312', '999999', 'English For Success (EFS) (12 Month)', 0);

    INSERT INTO Product (ID,ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES (26, 'ESL-1810403', '999999', 'Master English (3 Month)', 0);
    INSERT INTO Product (ID,ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES (27, 'ESL-1810406', '999999', 'Master English (6 Month)', 0);
    INSERT INTO Product (ID,ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES (28, 'ESL-1810412', '999999', 'Master English (12 Month)', 0);
    
    INSERT INTO Product (ID,ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES (29, 'ESL-1810512', '999999', 'Business English', 0);

	
    SELECT * FROM Product;
    

	TRUNCATE TABLE Solution;
    
	/* *************************************************************************************************** */
    /* WARP Solutions
    /* *************************************************************************************************** */  
	INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (1, 'WARP-STEM-001', 'STEM Science Hub', 24900);
    INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (2, 'WARP-STEM-002', 'STEM Mathematics Hub', 24900);
    INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (3, 'WARP-STEM-003', 'STEM Technology Hub', 19900);
    INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (4, 'WARP-STEM-004', 'STEM Social Science Hub', 19900);
    INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (5, 'WARP-STEM-005', 'STEM Medical Hub', 19900);
    INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (6, 'WARP-STEM-006', 'STEM Pre-Engineering Hub', 19900);
    
    INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (7, 'WARP-STEM-007', 'STEM Summer Camps', 000);

	INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (8, 'WARP-EL-001', 'Elementary OASC', 24900);
    
    INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (9, 'WARP-ML-001', 'Middle School Online Academic Learning', 34900);
	INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (10, 'WARP-ML-002', 'Middle School SSAT', 7900);
    
    INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (11, 'WARP-HL-001', 'SAT Online Preparation', 19900);
    INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (12, 'WARP-HL-002', 'ACT Online Preparation', 19900);
	INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (13, 'WARP-HL-003', 'SAT/ACY Flashcards', 4900);
    INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (14, 'WARP-HL-004', 'PSAT Online Preparation', 9900);
    INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (15, 'WARP-HL-005', 'SAT Subject Test Online Preparation', 7900);
    INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (16, 'WARP-HL-006', 'High School Online Academy Skils Course', 34900);
    INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (17, 'WARP-HL-007', 'High School SSAT/ISEE', 7900);
    INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (18, 'WARP-HL-008', 'AP Practice Tests', 7900);
    INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (19, 'WARP-HL-009', 'ISEE', 7900);
    INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (20, 'WARP-HL-010', 'College Placement Skills Training', 37900);

    INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (21, 'WARP-US-001', 'Test of Education as a Foreign Language (TOEFL)', 999);
	INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (22, 'WARP-US-002', 'Graduate Record Examination', 5900);
	INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (23, 'WARP-US-003', 'Graduation Management Admission Test (GMAT)', 5900);
    
	INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (24, 'WARP-CERT-001', 'Business Analytics Pathway Certificate', 615500);
	INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (25, 'WARP-CERT-002', 'Project Management Pathway Certificate', 615500);
    
	INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (26, 'WARP-ESL-00103', 'Winnie''s World (3 mos)', 24900);
	INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (27, 'WARP-ESL-00106', 'Winnie''s World (6 mos)', 45800);
	INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (28, 'WARP-ESL-00112', 'Winnie''s World (12 mos)', 86900);
    
	INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (29, 'WARP-ESL-00212', 'English Academy', 97800);
    
	INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (30, 'WARP-ESL-00303', 'English For Success (EFS) (3 mos)', 29900);
	INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (31, 'WARP-ESL-00306', 'English For Success (EFS) (6 mos)', 57800);
	INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (32, 'WARP-ESL-00312', 'English For Success (EFS) (12 mos)', 98800);
    
	INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (33, 'WARP-ESL-00403', 'Master English (3 mos)', 29900);
	INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (34, 'WARP-ESL-00406', 'Master English (6 mos)', 57800);
	INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (35, 'WARP-ESL-00412', 'Master English (12 mos)', 98800);
    
	INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (36, 'WARP-ESL-00512', 'Business English', 98800);
            
-- 	INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (500, 'WARP-US-999', 'Graduation Management Admission Test (GMAT)', 59.00);

    
    SELECT * FROM Solution;

	TRUNCATE TABLE SolutionProduct;
	/* *************************************************************************************************** */
    /* WARP SolutionProduct Cross-Reference
    /* *************************************************************************************************** */  

 	INSERT INTO SolutionProduct (ID,SolutionCode, ProductCode) VALUES (1, 'WARP-STEM-001', 'PILR-005');
    INSERT INTO SolutionProduct (ID,SolutionCode, ProductCode) VALUES (2, 'WARP-STEM-002', 'PILR-007');
    INSERT INTO SolutionProduct (ID,SolutionCode, ProductCode) VALUES (3, 'WARP-STEM-003', 'PILR-009');
    INSERT INTO SolutionProduct (ID,SolutionCode, ProductCode) VALUES (4, 'WARP-STEM-004', 'PILR-010');
    INSERT INTO SolutionProduct (ID,SolutionCode, ProductCode) VALUES (5, 'WARP-STEM-005', 'PILR-006');
    INSERT INTO SolutionProduct (ID,SolutionCode, ProductCode) VALUES (6, 'WARP-STEM-006', 'PILR-008');
    

    -- SSAT
    INSERT INTO SolutionProduct (ID, SolutionCode, ProductCode) VALUES (7, 'WARP-ML-002', 'PILR-003');
    -- SAT
    INSERT INTO SolutionProduct (ID, SolutionCode, ProductCode) VALUES (8, 'WARP-HL-001', 'POLC-001');
    -- ACT
    INSERT INTO SolutionProduct (ID, SolutionCode, ProductCode) VALUES (9, 'WARP-HL-002', 'POLC-002');

    -- SSAT (Duplicate)
    -- INSERT INTO SolutionProduct (ID, SolutionCode, ProductCode) VALUES (10, 'WARP-HL-007', 'PILR-003');
    
    -- SSAT/ACT Flashcards
    -- INSERT INTO SolutionProduct (ID, SolutionCode, ProductCode) VALUES (X, 'WARP-HL-003', 'POLC-XXX');
    -- PSAT
    -- INSERT INTO SolutionProduct (ID, SolutionCode, ProductCode) VALUES (X, 'WARP-HL-004', 'POLC-XXX');
    -- SSAT Subject Tests
	-- INSERT INTO SolutionProduct (ID, SolutionCode, ProductCode) VALUES (X, 'WARP-HL-005', 'POLC-XXX');
    -- OASC (Duplicate)
	-- INSERT INTO SolutionProduct (ID, SolutionCode, ProductCode) VALUES (X, 'WARP-HL-006', 'POLC-XXX');
    -- AP Practice Tests
    -- INSERT INTO SolutionProduct (ID, SolutionCode, ProductCode) VALUES (X, 'WARP-HL-008', 'POLC-XXX');
    -- ISEE
    -- INSERT INTO SolutionProduct (ID, SolutionCode, ProductCode) VALUES (X, 'WARP-HL-009', 'PILR-XXX');
    
    -- CPST
    INSERT INTO SolutionProduct (ID, SolutionCode, ProductCode) VALUES (11, 'WARP-HL-010', 'POLC-003');
    -- TOEFL
    INSERT INTO SolutionProduct (ID, SolutionCode, ProductCode) VALUES (12, 'WARP-US-001', 'PILR-004');
    -- GRE
    INSERT INTO SolutionProduct (ID, SolutionCode, ProductCode) VALUES (13, 'WARP-US-002', 'PILR-002');
    -- GMAT 
    INSERT INTO SolutionProduct (ID, SolutionCode, ProductCode) VALUES (14, 'WARP-US-003', 'PILR-004');
     -- OASC
    INSERT INTO SolutionProduct (ID, SolutionCode, ProductCode) VALUES (15, 'WARP-ML-001', 'POLC-004'); 
    -- Business Analytics
	INSERT INTO SolutionProduct (ID, SolutionCode, ProductCode) VALUES (16, 'WARP-CERT-001', 'BV-18101'); 
	-- Project Management
	INSERT INTO SolutionProduct (ID, SolutionCode, ProductCode) VALUES (17, 'WARP-CERT-002', 'BV-18102'); 
    
	-- Winnie's World
	INSERT INTO SolutionProduct (ID, SolutionCode, ProductCode) VALUES (18, 'WARP-ESL-00103', 'ESL-1810103'); 
	INSERT INTO SolutionProduct (ID, SolutionCode, ProductCode) VALUES (19, 'WARP-ESL-00106', 'ESL-1810106'); 
	INSERT INTO SolutionProduct (ID, SolutionCode, ProductCode) VALUES (20, 'WARP-ESL-00112', 'ESL-1810112'); 
    
    	-- English Academy
	INSERT INTO SolutionProduct (ID, SolutionCode, ProductCode) VALUES (21, 'WARP-ESL-00212', 'ESL-1810212'); 
    
    	-- English For Success (EFS)
	INSERT INTO SolutionProduct (ID, SolutionCode, ProductCode) VALUES (22, 'WARP-ESL-00303', 'ESL-1810303'); 
 	INSERT INTO SolutionProduct (ID, SolutionCode, ProductCode) VALUES (23, 'WARP-ESL-00306', 'ESL-1810306'); 
	INSERT INTO SolutionProduct (ID, SolutionCode, ProductCode) VALUES (24, 'WARP-ESL-00312', 'ESL-1810312'); 
   
    	-- Master English
	INSERT INTO SolutionProduct (ID, SolutionCode, ProductCode) VALUES (25, 'WARP-ESL-00403', 'ESL-1810403'); 
	INSERT INTO SolutionProduct (ID, SolutionCode, ProductCode) VALUES (26, 'WARP-ESL-00406', 'ESL-1810406'); 
	INSERT INTO SolutionProduct (ID, SolutionCode, ProductCode) VALUES (27, 'WARP-ESL-00412', 'ESL-1810412'); 
    
    	-- Business English
	INSERT INTO SolutionProduct (ID, SolutionCode, ProductCode) VALUES (28, 'WARP-ESL-00512', 'ESL-1810512'); 
    
    
    SELECT * FROM SolutionProduct;
    
    SELECT * FROM Product;

	
/* 

 DROP TABLE IF EXISTS EntitySolution;
 CREATE TABLE EntitySolution (

	SolutionID							BIGINT, 
    EntityID							BIGINT,
    BillingEventID						BIGINT
	);

	TRUNCATE TABLE Product;

    
	INSERT INTO EntitySolution(SolutionID, EntityID, BillingEventID, StartDate) VALUES (24, 2, 0, '2018-04-11');

	INSERT INTO Solution (SolutionCode, SolutionName, SolutionCost) VALUES ('WARP-17001', 'Petersons Suite', 15.55);
      
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-001');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-002');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-003');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-004');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-005');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-006');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-007');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-008');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-009');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-010');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-011');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-012');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-013');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-014');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-015');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-016');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-017');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-018');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-019');

      
	INSERT INTO Solution (SolutionCode, SolutionName, SolutionCost) VALUES ('WARP-18001', 'Business Analytics Pathway Certificate', 5000);
    INSERT INTO Solution (SolutionCode, SolutionName, SolutionCost) VALUES ('WARP-18002', 'Project Management Pathway Certificate', 5000);
        
    
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-001');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-002');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-003');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-004');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-005');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-006');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-007');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-008');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-009');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-010');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-011');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-012');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-013');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-014');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-015');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-016');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-017');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-018');
 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-17001', 'NES-019');



 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-18001', 'BV-18101');
    INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-18002', 'BV-18102');

*/	

/*
SELECT * FROM Product;

SELECT * FROM Solution;

SELECT * FROM SolutionProduct;
*/