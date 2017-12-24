
USE WarpAdmin2017;

SELECT * FROM Entity;
SELECT * FROM ctlEntityType;

SELECT e.ID AS EntityID, en.EntityName, cet.EntityTypeName, ec.eContactIdentifier AS EMailAddress,  cect.EContactTypeName 
FROM Entity e
  INNER JOIN EntityName en
    ON e.ID = en.EntityID
      AND e.EntityTypeID = 6
  INNER JOIN ctlEntityType cet
    ON e.EntityTypeID = cet.ID
  INNER JOIN eContact ec
    ON e.ID = ec.EntityID
  INNER JOIN ctlEContactType cect
    ON ec.ContactTypeID = cect.ID
    ;
  
  
  SELECT JSON_OBJECT(
				'AccountID', e.ID, 
                'MemberName', en.EntityName, 
                'EMailAddress', ec.eContactIdentifier
                )
	FROM Entity e
	  INNER JOIN EntityName en
		ON e.ID = en.EntityID
		  AND e.EntityTypeID = 6
	  INNER JOIN ctlEntityType cet
		ON e.EntityTypeID = cet.ID
	  INNER JOIN eContact ec
		ON e.ID = ec.EntityID
	  INNER JOIN ctlEContactType cect
		ON ec.ContactTypeID = cect.ID
	-- WHERE ec.eContactIdentifier = 'john.arp@warpww.com';
	WHERE ec.eContactIdentifier = EMailAddress;
  /*
  ctlEContactType
  INSERT INTO ctlEContactType (ID, EContactTypeName) VALUES (1, "eMail");
  eContact
*/
  
  SELECT * FROM eContact;
  
  CALL getMemberNamesFromEmailAddress('{"EMailAddress": "john.arp@warpww.com"}');
  
  CALL getUserAccountByID('{"AuID": 1, "IuID": 1, "UserAccountID": 2}');
  
  
