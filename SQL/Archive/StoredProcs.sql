USE WarpAdmin2017;


DELIMITER //
CREATE PROCEDURE getEntity
( IN entityID BIGINT)
BEGIN
	SELECT e.ID, e.EntityTypeID, en.EntityNameTypeID, en.EntityName, cet.EntityTypeName AS EntityType, cent.EntityNameTypeName AS EntityNameType
	FROM Entity e
	  LEFT JOIN EntityName en
		  LEFT JOIN ctlEntityNameType cent 
			ON en.EntityNameTypeID = cent.ID
		 ON e.ID = en.EntityID 
	  LEFT JOIN ctlEntityType cet
		 ON e.EntityTypeID = cet.ID;
END //
DELIMITER ;

CALL getEntity(1);

DELIMITER //
CREATE PROCEDURE registerUserAccount(
	IN UserID BIGINT,
    IN eContactName NVARCHAR, 
    IN UserAccountName NVARCHAR, 
    IN passPhraseHash NVARCHAR, 
    INOUT ResponseData NVARCHAR
    )
BEGIN
	-- Creating a new UserAccount Entity
	-- Create the Enity record of type UserAccount 
	INSERT INTO Entity (CreateUserID, LastModifyUserID, EntityTypeID) VALUES (UserID, UserID, 6);
    
	SELECT @ID := LAST_INSERT_ID();
    SELECT @UserAccountName := IFNULL(UserAccountName, eContactName);
    
    
	-- SELECT * FROM Entity;
	-- Asssign UserAccount Name
	INSERT INTO EntityName (CreateUserID, LastModifyUserID, EntityID, EntityNameTypeID, EntityName) VALUES (UserID, UserID, @ID, 1, @UserAccountName);
	-- Assign eContact account information.
	INSERT INTO eContact (CreateUserID, LastModifyUserID, EntityID, ContactTypeID, eContactIdentifier, CountryID) VALUES (UserID, UserID, @ID, 1, eContactName, 999);


END
DELIMITER ;


 -- https://dev.mysql.com/doc/connector-net/en/connector-net-tutorials-stored-procedures.html
 
/* 

SET myParam = IFNULL(myParam, 0);
Explanation: IFNULL(expression_1, expression_2)

The IFNULL function returns expression_1 if expression_1 is not NULL; otherwise it returns expression_2. The IFNULL function returns a string or a numeric based on the context where it is used.
*/