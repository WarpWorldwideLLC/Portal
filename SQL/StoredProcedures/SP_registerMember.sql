USE WarpAdmin2017;

DROP PROCEDURE IF EXISTS registerMember;

DELIMITER $$
CREATE PROCEDURE registerMember(query JSON)
BEGIN 
	
    DECLARE AuID BIGINT DEFAULT NULL;
	DECLARE IuID BIGINT DEFAULT NULL;
	DECLARE CommandName NVARCHAR(25);
    DECLARE MemberName NVARCHAR(255) DEFAULT NULL;
	DECLARE NewMemberName NVARCHAR(255) DEFAULT NULL;
	DECLARE MemberNameKey NVARCHAR(255) DEFAULT NULL;
    DECLARE EmailAddress NVARCHAR(255) DEFAULT NULL; 
    DECLARE PassphraseHash NVARCHAR(255) DEFAULT NULL;
    DECLARE EntityID BIGINT DEFAULT 0;

	-- Error and Warning Block Variables 
	DECLARE ProcStatus NVARCHAR(10) DEFAULT 'SUCCESS';
    DECLARE ProcMessage NVARCHAR(999) DEFAULT '';
	DECLARE lSqlState NVARCHAR(255) DEFAULT '';
    DECLARE lErrNumber NVARCHAR(255) DEFAULT '';
	DECLARE lMessageText NVARCHAR(255) DEFAULT '';

	DECLARE exit handler for sqlexception
	  BEGIN
		-- ERROR
        GET DIAGNOSTICS CONDITION 1
			lSqlState = RETURNED_SQLSTATE, 
			lErrNumber = MYSQL_ERRNO, 
            lMessageText = MESSAGE_TEXT;
		SET ProcStatus = 'ERROR';
		SET ProcMessage = CONCAT(lErrNumber, " (", lSqlState, "): ", lMessageText);
		SELECT JSON_OBJECT('MessageSource', 'DB0', 'MemberID', EntityID, 'ProcStatus', ProcStatus, 'MessageCode', lErrNumber, 'ProcMessage', ProcMessage);

	  ROLLBACK;
	END;

	DECLARE exit handler for sqlwarning
	 BEGIN
		-- WARNING
	 ROLLBACK;
	END;
    
	-- group_concat defaults to 1024 charaters; expand it for this query. 
	SET SESSION group_concat_max_len = 1000000;

	SET AuID := JSON_EXTRACT(query, '$.AuID');
    SET IuID := JSON_EXTRACT(query, '$.IuID');
    SET MemberName := TRIM(JSON_UNQUOTE(JSON_EXTRACT(query, '$.MemberName')));
    SET EmailAddress := JSON_UNQUOTE(JSON_EXTRACT(query, '$.EmailAddress'));
    SET PassphraseHash := JSON_UNQUOTE(JSON_EXTRACT(query, '$.PassphraseHash'));
	
    SET EntityID := 0;

	START TRANSACTION;
	-- Creating a new Member Entity
	-- Create the Entity record with type UserAccount 
	INSERT INTO Entity (AuiD, IuID, LastAuID, LastIuID, EntityTypeID) VALUES (AuID, IuID, AuID, IuID, 6);
    
	/* Get the EntityID and store it in @ID */
	SET EntityID := LAST_INSERT_ID();
    
    /* If no MemberName was submitted, use the email address as the member name */
    SET NewMemberName := CASE WHEN COALESCE(MemberName, '') = '' THEN EmailAddress ELSE MemberName END;
	SET MemberNameKey := NewMemberName;
    
	-- SELECT * FROM Entity;
	-- Asssign UserAccount Name
	INSERT INTO EntityName (AuiD, IuID, LastAuID, LastIuID, EntityID, EntityNameTypeID, EntityName, EntityNameKey)
      VALUES (AuID, IuID, AuID, IuID, EntityID, 2, NewMemberName, MemberNameKey);
	-- Assign eContact account information.
	INSERT INTO eContact (AuiD, IuID, LastAuID, LastIuID, EntityID, ContactTypeID, eContactIdentifier, CountryID) 
      VALUES (AuID, IuID, AuID, IuID, EntityID, 1, EmailAddress, 999);
	-- Assign Passphrase for account.
	INSERT INTO Passphrase (AuiD, IuID, LastAuID, LastIuID, EntityID, PassphraseHash) 
      VALUES (AuID, IuID, AuID, IuID, EntityID, PassphraseHash);
	
    COMMIT;
	
    SELECT JSON_OBJECT('MemberID', EntityID, 'MemberName', NewMemberName, 'EmailAddress', EmailAddress, 'ProcStatus', ProcStatus, 'ProcMessage', ProcMessage) AS CommandResult;

END $$
DELIMITER ;
