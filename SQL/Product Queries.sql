USE WarpAdmin2017;

	TRUNCATE TABLE Product;

	/* *************************************************************************************************** */
    /* Peterson's ILRN
    /* *************************************************************************************************** */
	INSERT INTO Product (ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES ('PILR-001', 'N/A', 'GMAT', 0.00);  
    INSERT INTO Product (ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES ('PILR-002', 'N/A', 'GRE', 0.00);  
	INSERT INTO Product (ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES ('PILR-003', 'N/A', 'SAT Practice Test', 0.00); 
	INSERT INTO Product (ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES ('PILR-004', 'N/A', 'TOEFL', 0.00);  
	INSERT INTO Product (ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES ('PILR-005', 'N/A', 'STEM - SCIENCE HUB', 0.00); 
	INSERT INTO Product (ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES ('PILR-006', 'N/A', 'STEM - NURSING HUB', 0.00); 
	INSERT INTO Product (ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES ('PILR-007', 'N/A', 'STEM - MATH HUB', 0.00); 
	INSERT INTO Product (ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES ('PILR-008', 'N/A', 'STEM - PRE-ENGINEERING HUB', 0.00); 
	INSERT INTO Product (ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES ('PILR-009', 'N/A', 'STEM - TECHNOLOGY HUB', 0.00); 
	INSERT INTO Product (ProductCode, ProductExternalKey, ProductName, ProductCost) VALUES ('PILR-010', 'N/A', 'STEM - SOCIAL SCIENCE HUB', 0.00); 

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
	INSERT INTO Solution (SolutionCode, SolutionName, SolutionCost) VALUES ('WARP-STEM-001', 'STEM Science Hub', 249.00);
    INSERT INTO Solution (SolutionCode, SolutionName, SolutionCost) VALUES ('WARP-STEM-002', 'STEM Mathematics Hub', 249.00);
    INSERT INTO Solution (SolutionCode, SolutionName, SolutionCost) VALUES ('WARP-STEM-003', 'STEM Technology Hub', 199.00);
    INSERT INTO Solution (SolutionCode, SolutionName, SolutionCost) VALUES ('WARP-STEM-004', 'STEM Social Science Hub', 199.00);
    INSERT INTO Solution (SolutionCode, SolutionName, SolutionCost) VALUES ('WARP-STEM-005', 'STEM Medical Hub', 199.00);
    INSERT INTO Solution (SolutionCode, SolutionName, SolutionCost) VALUES ('WARP-STEM-006', 'STEM Pre-Engineering Hub', 199.00);
    
    INSERT INTO Solution (SolutionCode, SolutionName, SolutionCost) VALUES ('WARP-STEM-007', 'STEM Summer Camps', 0.00);

	INSERT INTO Solution (SolutionCode, SolutionName, SolutionCost) VALUES ('WARP-EL-001', 'Elementary OASC', 249.00);
    
    INSERT INTO Solution (SolutionCode, SolutionName, SolutionCost) VALUES ('WARP-ML-001', 'Middle School Online Academic Learning', 349.00);
	INSERT INTO Solution (SolutionCode, SolutionName, SolutionCost) VALUES ('WARP-ML-002', 'Middle School SSAT', 79.00);
    
    INSERT INTO Solution (SolutionCode, SolutionName, SolutionCost) VALUES ('WARP-HL-001', 'SAT Online Preparation', 199.00);
    INSERT INTO Solution (SolutionCode, SolutionName, SolutionCost) VALUES ('WARP-HL-002', 'ACT Online Preparation', 199.00);
	INSERT INTO Solution (SolutionCode, SolutionName, SolutionCost) VALUES ('WARP-HL-003', 'ACT Online Preparation', 49.00);
    INSERT INTO Solution (SolutionCode, SolutionName, SolutionCost) VALUES ('WARP-HL-004', 'ACT Online Preparation', 99.00);
    INSERT INTO Solution (SolutionCode, SolutionName, SolutionCost) VALUES ('WARP-HL-005', 'ACT Online Preparation', 79.00);
    INSERT INTO Solution (SolutionCode, SolutionName, SolutionCost) VALUES ('WARP-HL-006', 'ACT Online Preparation', 349.00);
    INSERT INTO Solution (SolutionCode, SolutionName, SolutionCost) VALUES ('WARP-HL-007', 'ACT Online Preparation', 79.00);
    INSERT INTO Solution (SolutionCode, SolutionName, SolutionCost) VALUES ('WARP-HL-008', 'ACT Online Preparation', 79.00);
    INSERT INTO Solution (SolutionCode, SolutionName, SolutionCost) VALUES ('WARP-HL-009', 'ACT Online Preparation', 79.00);
    INSERT INTO Solution (SolutionCode, SolutionName, SolutionCost) VALUES ('WARP-HL-010', 'ACT Online Preparation', 379.00);
    
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
    
    
    SELECT * FROM SolutionProduct;
    
	SELECT JSON_OBJECT(
                     'SolutionCode', s.SolutionCode, 
                     'ProductCode', p.ProductCode, 
                     'SolutionName', s.SolutionName, 
                     'ProductName', p.ProductName, 
                     'SolutionCost', s.SolutionCost
				) AS CommandResult
	FROM Solution s
		LEFT JOIN SolutionProduct sp
		  ON s.SolutionCode = sp.SolutionCode
		LEFT JOIN Product p
		  ON sp.ProductCode = p.ProductCode
	;
    
    	SELECT 
                     s.SolutionCode, 
                     sp.ProductCode
                     /*
                     s.SolutionName, 
                     p.ProductName, 
                     s.SolutionCost
					 */
	FROM (Solution s
		INNER JOIN SolutionProduct sp
		  ON s.SolutionCode = sp.SolutionCode)
		LEFT JOIN Product p
		  ON sp.ProductCode = p.ProductCode
	;
;



/* 
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