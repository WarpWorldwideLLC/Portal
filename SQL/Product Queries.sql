USE WarpAdmin2017;


	/* *************************************************************************************************** */
    /* Peterson's ILRN
    /* *************************************************************************************************** */
	INSERT INTO Product (ProductCode, ProductName, ProductCost) VALUES ('PILR-001', 'GMAT', 0.00);  
    INSERT INTO Product (ProductCode, ProductName, ProductCost) VALUES ('PILR-002', 'GRE', 0.00);  
	INSERT INTO Product (ProductCode, ProductName, ProductCost) VALUES ('PILR-003', 'SAT Practice Test', 0.00); 
	INSERT INTO Product (ProductCode, ProductName, ProductCost) VALUES ('PILR-004', 'TOEFL', 0.00);  
	INSERT INTO Product (ProductCode, ProductName, ProductCost) VALUES ('PILR-005', 'STEM - SCIENCE HUB', 0.00); 
	INSERT INTO Product (ProductCode, ProductName, ProductCost) VALUES ('PILR-006', 'STEM - NURSING HUB', 0.00); 
	INSERT INTO Product (ProductCode, ProductName, ProductCost) VALUES ('PILR-007', 'STEM - MATH HUB', 0.00); 
	INSERT INTO Product (ProductCode, ProductName, ProductCost) VALUES ('PILR-008', 'STEM - PRE-ENGINEERING HUB', 0.00); 
	INSERT INTO Product (ProductCode, ProductName, ProductCost) VALUES ('PILR-009', 'STEM - TECHNOLOGY HUB', 0.00); 
	INSERT INTO Product (ProductCode, ProductName, ProductCost) VALUES ('PILR-010', 'STEM - SOCIAL SCIENCE HUB', 0.00); 

	/* *************************************************************************************************** */
    /* Peterson's OLC
    /* *************************************************************************************************** */    
    INSERT INTO Product (ProductCode, ProductName, ProductCost) VALUES ('POLC-001', 'SAT 2016', 0.00);
    INSERT INTO Product (ProductCode, ProductName, ProductCost) VALUES ('POLC-002', 'ACT 2016', 0.00);    
    INSERT INTO Product (ProductCode, ProductName, ProductCost) VALUES ('POLC-003', 'CPST - College Placement Skills Training', 0.00);  
    INSERT INTO Product (ProductCode, ProductName, ProductCost) VALUES ('POLC-004', 'OCAD - Online Course for Academic Development', 0.00);    
    INSERT INTO Product (ProductCode, ProductName, ProductCost) VALUES ('POLC-005', 'Online Course for the ASVAB', 0.00);    
    INSERT INTO Product (ProductCode, ProductName, ProductCost) VALUES ('POLC-006', 'Online Course for the GRE', 0.00);    
 
 	/* *************************************************************************************************** */
    /* Pathways Products
    /* *************************************************************************************************** */    
	INSERT INTO Product (ProductCode, ProductName, ProductCost) VALUES ('BV-18101', 'Business Analytics Pathway Certificate', 0);
    INSERT INTO Product (ProductCode, ProductName, ProductCost) VALUES ('BV-18102', 'Project Management Pathway Certificate', 0);
    
    SELECT * FROM Product;

/* 

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


SELECT * FROM Product;

SELECT * FROM Solution;

SELECT * FROM SolutionProduct;