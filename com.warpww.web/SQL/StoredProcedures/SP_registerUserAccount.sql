USE WarpAdmin2017;

DROP PROCEDURE IF EXISTS registerUserAccount;

DELIMITER $$
CREATE PROCEDURE registerUserAccount(query JSON)
BEGIN 
	
    DECLARE AuID BIGINT DEFAULT NULL;
	DECLARE IuID BIGINT DEFAULT NULL;
	DECLARE CommandName NVARCHAR(25);
    DECLARE MemberName NVARCHAR(255) DEFAULT NULL;
    DECLARE EmailAddress NVARCHAR(255) DEFAULT NULL; 
    DECLARE PassphraseHash NVARCHAR(255) DEFAULT NULL;

	DECLARE ProcStatus NVARCHAR(10) DEFAULT 'SUCCESS';
    DECLARE ProcMessage NVARCHAR(999) DEFAULT '';

	DECLARE exit handler for sqlexception
	  BEGIN
		-- ERROR
        GET DIAGNOSTICS CONDITION 1
			@sqlstate = RETURNED_SQLSTATE, 
			@errno = MYSQL_ERRNO, 
            @text = MESSAGE_TEXT;
		SET ProcStatus = 'ERROR';
		SET ProcMessage = CONCAT(@errno, " (", @sqlstate, "): ", @text);
		SELECT JSON_OBJECT('UserAccountID', @ID, 'ProcStatus', ProcStatus, 'ProcMessage', ProcMessage);

	  ROLLBACK;
	END;

	DECLARE exit handler for sqlwarning
	 BEGIN
		-- WARNING
	 ROLLBACK;
	END;

	SET AuID = JSON_EXTRACT(query, '$.AuID');
    SET IuID = JSON_EXTRACT(query, '$.IuID');
    SET MemberName = UPPER(JSON_UNQUOTE(JSON_EXTRACT(query, '$.MemberName')));
    SET EmailAddress = JSON_UNQUOTE(JSON_EXTRACT(query, '$.EmailAddress'));
    SET PassphraseHash = JSON_UNQUOTE(JSON_EXTRACT(query, '$.PassphraseHash'));
	
    SET @ID := 0;

	START TRANSACTION;
	-- Creating a new UserAccount Entity
	-- Create the Enity record of type UserAccount 
	INSERT INTO Entity (AuiD, IuID, LastAuID, LastIuID, EntityTypeID) VALUES (AuID, IuID, AuID, IuID, 6);
    
	SET @ID := LAST_INSERT_ID();
    SET @UserAccountName := IFNULL(MemberName, eMailAddress);
    
    
	-- SELECT * FROM Entity;
	-- Asssign UserAccount Name
	INSERT INTO EntityName (AuiD, IuID, LastAuID, LastIuID, EntityID, EntityNameTypeID, EntityName)
      VALUES (AuID, IuID, AuID, IuID, @ID, 2, @UserAccountName);
	-- Assign eContact account information.
	INSERT INTO eContact (AuiD, IuID, LastAuID, LastIuID, EntityID, ContactTypeID, eContactIdentifier, CountryID) 
      VALUES (AuID, IuID, AuID, IuID, @ID, 1, EmailAddress, 999);
	-- Assign Passphrase for account.
	INSERT INTO Passphrase (AuiD, IuID, LastAuID, LastIuID, EntityID, PassphraseHash) 
      VALUES (AuID, IuID, AuID, IuID, @ID, PassphraseHash);
	
    COMMIT;
	

    SELECT JSON_OBJECT('UserAccountID', @ID, 'ProcStatus', ProcStatus, 'ProcMessage', ProcMessage);

END $$
DELIMITER ;
