USE WarpAdmin2017;

DROP PROCEDURE IF EXISTS setMemberSolution;

DELIMITER $$
CREATE PROCEDURE setMemberSolution(query JSON)
BEGIN

	DECLARE AuID BIGINT DEFAULT NULL;
	DECLARE IuID BIGINT DEFAULT NULL;
    DECLARE MemberID BIGINT DEFAULT NULL;
    DECLARE Command NVARCHAR(255) DEFAULT NULL;

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

	SET AuID := JSON_EXTRACT(query, '$.AuID');
    SET IuID := JSON_EXTRACT(query, '$.PuID');
    SET MemberID := JSON_EXTRACT(query, '$.MemberID');
    SET Command := JSON_EXTRACT(query, '$.Command');
    
    DELETE FROM EntitySolution WHERE EntityID = MemberID AND ID > 0;


	INSERT INTO EntitySolution (SolutionID, EntityID, BillingEventID, StartDate)
	SELECT SolutionID, EntityID, 0, MAX(CreateDate) AS StartDate
	FROM ShoppingCart
	WHERE RecordStatusID = 51
	  AND EntityID = MemberID
      AND ID > 0
	GROUP BY SolutionID, EntityID
	;
    
    
	SELECT JSON_OBJECT(
                     'MemberID', MemberID,
                     'Command', Command,
                     'CommandResults', ProcStatus,
                     'Count', COUNT(*)
				) AS CommandResult
	FROM EntitySolution es
	WHERE es.EntityID = MemberID

	;
        
END $$
DELIMITER ;