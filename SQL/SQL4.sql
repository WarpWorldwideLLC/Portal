
	SELECT JSON_OBJECT(
					 'CommandResults', ProcStatus,
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
    WHERE e.ID = MemberID    
		;