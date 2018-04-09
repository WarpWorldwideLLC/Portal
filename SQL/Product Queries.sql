USE WarpAdmin2017;

	TRUNCATE TABLE Product;

	/* *************************************************************************************************** */
    /* Peterson's ILRN
    /* *************************************************************************************************** */
	INSERT INTO Product (ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES ('PILR-001', 'http://warpauth.petersons.com//TestPrep/index?testid=3', 'GMAT', 0.00);  
    INSERT INTO Product (ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES ('PILR-002', 'http://warpauth.petersons.com//TestPrep/index?testid=2', 'GRE', 0.00);  
	INSERT INTO Product (ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES ('PILR-003', 'http://warpauth.petersons.com//TestPrep/index?testid=123', 'SSAT Practice Test', 0.00); 
	INSERT INTO Product (ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES ('PILR-004', 'http://warpauth.petersons.com//TestPrep/index?testid=347', 'TOEFL', 0.00);  
	INSERT INTO Product (ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES ('PILR-005', 'http://warpauth.petersons.com//TestPrep/index?testid=321', 'STEM - SCIENCE HUB', 0.00); 
	INSERT INTO Product (ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES ('PILR-006', 'http://warpauth.petersons.com//TestPrep/index?testid=332', 'STEM - NURSING HUB', 0.00); 
	INSERT INTO Product (ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES ('PILR-007', 'http://warpauth.petersons.com//TestPrep/index?testid=333', 'STEM - MATH HUB', 0.00); 
	INSERT INTO Product (ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES ('PILR-008', 'http://warpauth.petersons.com//TestPrep/index?testid=334', 'STEM - PRE-ENGINEERING HUB', 0.00); 
	INSERT INTO Product (ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES ('PILR-009', 'http://warpauth.petersons.com//TestPrep/index?testid=335', 'STEM - TECHNOLOGY HUB', 0.00); 
	INSERT INTO Product (ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES ('PILR-010', 'http://warpauth.petersons.com//TestPrep/index?testid=336', 'STEM - SOCIAL SCIENCE HUB', 0.00); 

	/* *************************************************************************************************** */
    /* Peterson's OLC
    /* *************************************************************************************************** */    
    INSERT INTO Product (ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES ('POLC-001', 'N/A', 'SAT 2016', 0.00);
    INSERT INTO Product (ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES ('POLC-002', 'N/A', 'ACT 2016', 0.00);    
    INSERT INTO Product (ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES ('POLC-003', 'N/A', 'CPST - College Placement Skills Training', 0.00);  
    INSERT INTO Product (ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES ('POLC-004', 'N/A', 'OCAD - Online Course for Academic Development', 0.00);    
    INSERT INTO Product (ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES ('POLC-005', 'N/A', 'Online Course for the ASVAB', 0.00);    
    INSERT INTO Product (ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES ('POLC-006', 'N/A', 'Online Course for the GRE', 0.00);    
 
 	/* *************************************************************************************************** */
    /* Pathways Products
    /* *************************************************************************************************** */    
	INSERT INTO Product (ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES ('BV-18101', 'N/A', 'Business Analytics Pathway Certificate', 0);
    INSERT INTO Product (ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES ('BV-18102', 'N/A', 'Project Management Pathway Certificate', 0);
    
    SELECT * FROM Product;
    

	TRUNCATE TABLE Solution;
    
	/* *************************************************************************************************** */
    /* WARP Solutions
    /* *************************************************************************************************** */  
	INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (1, 'WARP-STEM-001', 'STEM Science Hub', 249.00);
    INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (2, 'WARP-STEM-002', 'STEM Mathematics Hub', 249.00);
    INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (3, 'WARP-STEM-003', 'STEM Technology Hub', 199.00);
    INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (4, 'WARP-STEM-004', 'STEM Social Science Hub', 199.00);
    INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (5, 'WARP-STEM-005', 'STEM Medical Hub', 199.00);
    INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (6, 'WARP-STEM-006', 'STEM Pre-Engineering Hub', 199.00);
    
    INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (7, 'WARP-STEM-007', 'STEM Summer Camps', 0.00);

	INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (8, 'WARP-EL-001', 'Elementary OASC', 249.00);
    
    INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (9, 'WARP-ML-001', 'Middle School Online Academic Learning', 349.00);
	INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (10, 'WARP-ML-002', 'Middle School SSAT', 79.00);
    
    INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (11, 'WARP-HL-001', 'SAT Online Preparation', 199.00);
    INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (12, 'WARP-HL-002', 'ACT Online Preparation', 199.00);
	INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (13, 'WARP-HL-003', 'SAT/ACY Flashcards', 49.00);
    INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (14, 'WARP-HL-004', 'PSAT Online Preparation', 99.00);
    INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (15, 'WARP-HL-005', 'SAT Subject Test Online Preparation', 79.00);
    INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (16, 'WARP-HL-006', 'High School Online Academy Skils Course', 349.00);
    INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (17, 'WARP-HL-007', 'High School SSAT/ISEE', 79.00);
    INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (18, 'WARP-HL-008', 'AP Practice Tests', 79.00);
    INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (19, 'WARP-HL-009', 'ISEE', 79.00);
    INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (20, 'WARP-HL-010', 'College Placement Skills Training', 379.00);

    INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (21, 'WARP-US-001', 'Test of Education as a Foreign Language (TOEFL)', 9.99);
	INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (22, 'WARP-US-002', 'Graduate Record Examination', 59.00);
	INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (23, 'WARP-US-003', 'Graduation Management Admission Test (GMAT)', 59.00);
    
-- 	INSERT INTO Solution (ID, SolutionCode, SolutionName, SolutionCost) VALUES (500, 'WARP-US-999', 'Graduation Management Admission Test (GMAT)', 59.00);

    
    SELECT * FROM Solution;

	TRUNCATE TABLE SolutionProduct;
	/* *************************************************************************************************** */
    /* WARP SolutionProduct Cross-Reference
    /* *************************************************************************************************** */  

 	INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-STEM-001', 'PILR-005');
    INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-STEM-002', 'PILR-007');
    INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-STEM-003', 'PILR-009');
    INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-STEM-004', 'PILR-010');
    INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-STEM-005', 'PILR-006');
    INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-STEM-006', 'PILR-008');
    
    -- OASC
    INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-ML-001', 'POLC-004');
    -- SSAT
    INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-ML-002', 'PILR-003');
    -- SAT
    INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-HL-001', 'POLC-001');
    -- ACT
    INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-HL-002', 'POLC-002');
    -- SSAT/ACT Flashcards
    -- INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-HL-003', 'POLC-XXX');
    -- PSAT
    -- INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-HL-004', 'POLC-XXX');
    -- SSAT Subject Tests
	-- INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-HL-005', 'POLC-XXX');
    -- OASC (Duplicate)
	-- INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-HL-006', 'POLC-XXX');
    -- SSAT (Duplicate)
    -- INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-HL-007', 'PILR-003');
    -- AP Practice Tests
    -- INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-HL-008', 'POLC-XXX');
    -- ISEE
    -- INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-HL-009', 'PILR-XXX');
    -- CPST
    INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-HL-010', 'POLC-003');
    -- TOEFL
    INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-US-001', 'PILR-004');
    -- GRE
    INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-US-002', 'PILR-002');
    -- GMAT 
    INSERT INTO SolutionProduct (SolutionCode, ProductCode) VALUES ('WARP-US-003', 'PILR-004');
    
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