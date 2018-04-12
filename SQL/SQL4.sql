
	SELECT JSON_OBJECT(
					 'CommandResults', 'Success',
                     'MemberNumber', e.ID,
                     'MemberName', en0.EntityName,
                     'FirstName', en1.EntityName, 
                     'LastName', en2.EntityName,
                     'EMail', ec.eContactIdentifier,
                     'MemberSince', DATE_FORMAT(e.CreateDate, "%M %Y")
				) AS CommandResult
	FROM Entity e
	  INNER JOIN EntityName en0
		ON e.ID = en0.EntityID
		AND en0.EntityNameTypeID = 2
	  INNER JOIN EntityName en1
		ON e.ID = en1.EntityID
		AND en1.EntityNameTypeID = 3
	  INNER JOIN EntityName en2
		ON e.ID = en2.EntityID
		AND en2.EntityNameTypeID = 5
	  INNER JOIN eContact ec
        ON ec.EntityID = 2 
          AND ec.ContactTypeID = 1
    WHERE e.ID = 2    
		;
        
        
        SELECT * FROM EntityName;