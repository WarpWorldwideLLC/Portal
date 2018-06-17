

SELECT * FROM ShoppingCart;


SELECT * FROM EntitySolution;

DELETE FROM EntitySolution 


CALL registerMember('{"Command":"RegisterMember","AuID":1,"IuID":1,"MemberName":"TestWarp3","EmailAddress":"test@test.tst","PassphraseHash":"1000:60abc45ad3b737509f90223273b10333eaae57fe07b54da2:742fd94a7ca04298529ed4a7808c31114a3c186872ec996f","PhoneNumber":"‭1 (778) 986-9268‬","FirstName":"Susie","LastName":"Warp","BirthDate":"2000-01-01","CountryID":"46"}');



SELECT 
	es.SolutionID, es.EntityID, es.ProductExternalKey, s.SolutionCode, s.SolutionName, el.SystemMode, el.EllLicenseCode
FROM EntitySolution es
  LEFT JOIN Solution s
    ON es.SolutionID = s.ID
    
  LEFT JOIN EllLicense el
    ON s.SolutionCode = el.WarpSolutionCode
WHERE es.EntityID = 2
  AND el.SystemMode = 'Test'

;

SELECT * FROM EntityName;

SELECT * FROM EntityMiscellany;

TRUNCATE TABLE EntityMiscellany;

CALL getEllNewUserData('{"Command":"GetGreeting","AuID":1,"IuID":1,"MemberID":7}');
    
SELECT * FROM EntityName;
SELECT * FROM eContact;
SELECT * FROM EntityBirthDate;
    
 		SELECT JSON_OBJECT(
			'UserAccountID', e.ID,
			'StatusID', e.RecordStatusID, 
			'CreateDate', e.CreateDate, 
			'AuID', e.AuID,
            'IuID', e.IuID,
			'LastModifyDate', e.LastModifyDate,
			'LastAuID', e.LastAuID,
			'LastIuID', e.LastIuID,
            'MemberName', en.EntityName,
            'Password', "abcdef",
            'Email', ec.eContactIdentifier,
            'FirstName', en1.EntityName,
            'LastName', en2.EntityName,
            'BirthDate', IFNULL(ebd.EntityBirthDate, '1900-01-01'),
            'Language', 'english',
            'Country', 'China'
			) 
		FROM Entity e
			-- Account Name Information
		  LEFT JOIN EntityName en 
			ON e.ID = en.EntityID
				AND en.EntityNameTypeID = 2
			-- Account Name Information
		  LEFT JOIN EntityName en1
			ON e.ID = en1.EntityID
				AND en1.EntityNameTypeID = 3
			-- Account Name Information
		  LEFT JOIN EntityName en2 
			ON e.ID = en2.EntityID
				AND en2.EntityNameTypeID = 5
		-- Email Information
		  LEFT JOIN eContact ec
			ON e.ID = ec.EntityID
				AND ec.ContactTypeID = 1
		  LEFT JOIN EntityBirthDate ebd
            ON e.ID = ebd.EntityID
		-- Selection Criteria
		WHERE e.ID = 2
              AND e.EntityTypeID = 6    -- Retrieve only UserAccount Entity Types
		;
    
/*    
    
    
    
    SELECT * FROM Solution;
	SELECT * FROM Product;
	SELECT * FROM SolutionProduct;

    
    
    
    UPDATE Product SET ProductExternalKey = '999999' WHERE ID >= 17;
    
    
    CALL adminGetColumns();
    
    SELECT * FROM EntityBirthDate;
    
    SELECT * FROM EntityName;
     TRUNCATE TABLE EntitySolution;
    -- TRUNCATE TABLE ShoppingCart;
    SElECT * FROM ShoppingCart;
    SELECT * FROM EntitySolution;
    SELECT * FROM Product;
    SELECT * FROM Solution;
    SELECT * FROM SolutionProduct;
    
    UPDATE EntitySolution SET KeySet = 0 WHERE ID > 0;
    
    
	UPDATE EntitySolution 
    SET KeySet = 1,
		ProductExternalKey = 
    (SELECT p.ProductExternalKey
    FROM (SELECT SolutionID From EntitySolution) es
		INNER JOIN Solution s
          ON es.SolutionID = s.ID
		INNER JOIN SolutionProduct sp
          ON s.SolutionCode = sp.SolutionCode
		INNER JOIN Product p
          ON sp.ProductCode = p.ProductCode)
	WHERE ID > 0
      AND EntityID = 2
      AND KeySet = 0
	;
    
    UPDATE ShoppingCasetMemberSolutionrt SET RecordStatusID = 50 WHERE ID >= 77;
    
    -- Error Code: 1093. You can't specify target table 'EntitySolution' for update in FROM clause
	-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.
	SET SQL_SAFE_UPDATES = 0;
	UPDATE EntitySolution es
		INNER JOIN Solution s
          ON es.SolutionID = s.ID
		INNER JOIN SolutionProduct sp
          ON s.SolutionCode = sp.SolutionCode
		INNER JOIN Product p
          ON sp.ProductCode = p.ProductCode
	SET es.KeySet = 1,
		es.ProductExternalKey =p.ProductExternalKey
	WHERE es.ID > 0
      AND es.EntityID = 2
      AND es.KeySet = 0
	;
    SET SQL_SAFE_UPDATES = 1;
    
    
    
    SELECT * FROM EntityName;
    SELECT * FROM Entity;
    
    SELECT * FROM Version;
    
    INSERT INTO Version (VersionNumber, Location) VALUES ('成员名字', 'China');
    
       -- Set ShoppingCart Status to resolved. 
    UPDATE ShoppingCart
    SET RecordStatusID = 999
	WHERE RecordStatusID = 51
	  AND EntityID = 2
      AND ID > 0;
    
    
-- TRUNCATE TABLE EntitySolution;
    
    SELECT * FROM EntitySolution;
    
    SELECT * FROM Product;
*/
    