USE WarpAdmin2017;


-- Creating a new UserAccount Entity
-- Create the Enity record of type UserAccount 
INSERT INTO Entity (CreateUserID, LastModifyUserID, EntityTypeID) VALUES (1,1, 6);
SELECT * FROM Entity;
-- Asssign UserAccount Name
INSERT INTO EntityName (CreateUserID, LastModifyUserID, EntityID, EntityNameTypeID, EntityName) VALUES (1, 1, 2, 1, 'john.arp@warpww.com');
-- Assign eContact account information.
INSERT INTO eContact (CreateUserID, LastModifyUserID, EntityID, ContactTypeID, eContactIdentifier, CountryID) VALUES (1, 1, 2, 1, 'john.arp@warpww.com', 236);


SELECT * FROM ctlEntityType;
SELECT * FROM ctlEntityNameType; 
SELECT * FROM ctlEContactType;
SELECT * FROM ctlCountry;
SELECT * FROM Entity;
SELECT * FROM EntityName;
SELECT * FROM eContact;

CALL registerUserAccount(1, 'grace.arp@warpww.com', 'Gracie', 'ABCD', @TEST NVARCHAR);

/*
	IN UserID BIGINT, 
    IN eContactName NVARCHAR(255), 
    IN UserAccountName NVARCHAR(255), 
    IN passPhraseHash NVARCHAR(255), 
    INOUT ResponseData NVARCHAR(255)
*/


SELECT JSON_ARRAY(1, "abc", NULL, TRUE, CURTIME());

SELECT JSON_OBJECT(
	'EntityID', e.ID, 
    'EntityStatusID', e.RecordStatusID, 
    'CreateDate', e.CreateDate, 
    'CreateUserID', e.CreateUserID,
    'LastModifyDate', e.LastModifyDate,
    'LastModifyuserID', e.LastModifyUserID,
    'EntityTypeID', e.EntityTypeID,
    'EntityTypeName', cet.EntityTypeName
    ) 
FROM Entity e
-- Account Type Information
  LEFT JOIN ctlEntityType cet
    ON e.EntityTypeID = cet.ID
    -- Account Name Information
  LEFT JOIN EntityName en 
	  LEFT JOIN ctlEntityNameType cent
		ON en.EntityNameTypeID = cent.ID
	ON e.ID = en.EntityID
-- Account Contact Information
  LEFT JOIN eContact ec
	  LEFT JOIN ctlEContactType cect
		ON ec.ContactTypeID = cect.ID 
    ON e.ID = ec.EntityID
    -- Selection Criteria
WHERE e.EntityTypeID = 6    -- Retrieve only UserAccount Entity Types
;
/*
	Get UserAccount
*/
SELECT
-- * 
 e.ID as EntityID, e.RecordStatusID as EntityStatusID, e.CreateDate, e.CreateUserID, e.LastModifyDate, e.LastModifyUserID, e.EntityTypeID, cet.EntityTypeName
-- JSON_ARRAY(e.ID as EntityID, e.RecordStatusID as EntityStatusID, e.CreateDate, e.CreateUserID, e.LastModifyDate, e.LastModifyUserID, e.EntityTypeID, cet.EntityTypeName)
FROM Entity e
-- Account Type Information
  LEFT JOIN ctlEntityType cet
    ON e.EntityTypeID = cet.ID
-- Account Name Information
  LEFT JOIN EntityName en 
	  LEFT JOIN ctlEntityNameType cent
		ON en.EntityNameTypeID = cent.ID
	ON e.ID = en.EntityID
-- Account Contact Information
  LEFT JOIN eContact ec
	  LEFT JOIN ctlEContactType cect
		ON ec.ContactTypeID = cect.ID 
    ON e.ID = ec.EntityID
-- Selection Criteria
WHERE e.EntityTypeID = 6    -- Retrieve only UserAccount Entity Types
;