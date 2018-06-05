
SELECT * FROM Entity;
SELECT * FROM EntityName;

CALL registerMember('{"Command":"RegisterMember","AuID":1,"IuID":1,"MemberName":"JohnnyWarp2","EmailAddress":"john.arp@warpww.com","PassphraseHash":"1000:3b7a47b638ac371df6e8502367a6c1b6ecf103ca8600ebce:dcaf0e2e6a7a6da0d4e480da7857ea75a749654bee179cff","PhoneNumber":"4028900168","FirsName":"Johnny","LastName":"Warp","CountryID":"46"}');

CALL validateSignon(' {"Command":"ValidateSignon","AuID":1,"IuID":1,"MemberName":"JohnnyWarp","PassphraseHash":"1000:4533f38cdcd4286506f66cb454826a9ee91665fdba201bfd:32169d7d74bb94972363c22355cd70482435ba96ddd60a6c"}');

CALL getGreeting(' {"Command":"GetGreeting","AuID":1,"IuID":1,"MemberID":2}');

CALL getSolutionList('{}');

CALL addSolutionToCart('{"CommandName":"AddSolutionToCart","AuID":1,"IuID":1,"MemberID":2, "SolutionID":1, "BillingEventID":0}');

SELECT * FROM EntitySolution;

 SET CommandName := TRIM(JSON_UNQUOTE(JSON_EXTRACT(query, '$.CommandName')));
 	SET MemberID := TRIM(JSON_UNQUOTE(JSON_EXTRACT(query, '$.MemberID')));
	SET SolutionID := TRIM(JSON_UNQUOTE(JSON_EXTRACT(query, '$.SolutionID')));
    SET BillingEventID := TRIM(JSON_UNQUOTE(JSON_EXTRACT(query, '$.BillingEventID')));



SELECT en1.EntityName AS FirstName, en2.EntityName AS LastName
FROM Entity e
  INNER JOIN EntityName en1
    ON e.ID = en1.EntityID
    AND en1.EntityNameTypeID = 3
  INNER JOIN EntityName en2
    ON e.ID = en2.EntityID
    AND en2.EntityNameTypeID = 5
    
    ;
    
    
    	SELECT JSON_OBJECT(
                     'MemberNumber', e.ID,
                     'FirstName', en1.EntityName, 
                     'LastName', en2.EntityName,
                     'MemberSince', DATE_FORMAT(e.CreateDate, "%M %Y")
				) AS CommandResult
	FROM Entity e
	  INNER JOIN EntityName en1
		ON e.ID = en1.EntityID
		AND en1.EntityNameTypeID = 3
	  INNER JOIN EntityName en2
		ON e.ID = en2.EntityID
		AND en2.EntityNameTypeID = 5
        ;


SELECT *
FROM 