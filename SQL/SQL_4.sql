USE  WarpAdmin2017;
USE WarpAdmin_CN;

SELECT * FROM Solution;
SELECT * FROM Product;
SELECT * FROM SolutionProduct;

    
    UPDATE Product SET ProductExternalKey = '999999' WHERE ID >= 17;
    
    
    CALL getGreeting('{"Command":"GetGreeting","AuID":1,"IuID":1,"MemberID":2}');
    
    CALL adminGetColumns();
    
    
    SELECT * FROM EntityName;
    
    
    SElECT * FROM ShoppingCart WHERE ID >= 77;
    
    UPDATE ShoppingCart SET RecordStatusID = 50 WHERE ID >= 77;
    
    
    SELECT * FROM EntityName;
    SELECT * FROM Entity;
    
    SELECT * FROM Version;
    
    INSERT INTO Version (VersionNumber, Location) VALUES ('成员名字', 'China');