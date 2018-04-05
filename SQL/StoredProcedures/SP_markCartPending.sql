USE WarpAdmin2017;

DROP PROCEDURE IF EXISTS markCartPending;

DELIMITER $$
CREATE PROCEDURE markCartPending(query JSON)
BEGIN

	DECLARE AuID BIGINT DEFAULT NULL;
	DECLARE IuID BIGINT DEFAULT NULL;
    DECLARE MemberID BIGINT DEFAULT NULL;
    DECLARE ReceiptNumber NVARCHAR(100) DEFAULT NULL;


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
		SET ProcStatus := 'ERROR';
		SET ProcMessage := CONCAT(lErrNumber, " (", lSqlState, "): ", lMessageText);
		SELECT JSON_OBJECT('MessageSource', 'DB0', 'CommandResults', ProcStatus, 'MessageCode', lErrNumber, 'ProcMessage', ProcMessage);

	  ROLLBACK;
	END;

	DECLARE exit handler for sqlwarning
	 BEGIN
		-- WARNING
	 ROLLBACK;
	END;

	-- group_concat defaults to 1024 charaters; expand it for this query. 
	SET SESSION group_concat_max_len := 1000000;
    SET SQL_SAFE_UPDATES = 0;

	SET AuID := JSON_EXTRACT(query, '$.AuID');
    SET IuID := JSON_EXTRACT(query, '$.PuID');
    SET MemberID := JSON_EXTRACT(query, '$.MemberID');
    SET ReceiptNumber = UPPER(SUBSTRING(UUID(), 1, 13));



	UPDATE ShoppingCart SET RecordStatusID = 50, ReceiptNumber = ReceiptNumber WHERE RecordStatusID IN (10, 50) AND EntityID = MemberID;

	SELECT JSON_OBJECT(
                     'MemberID', MemberID, 
                     'ReceiptNumber', ReceiptNumber,
                     'CommandResults', ProcStatus
                     
				) AS CommandResult

        
		;
	SET SQL_SAFE_UPDATES = 1;
END $$
DELIMITER ;