USE WarpAdmin2017;

DROP PROCEDURE IF EXISTS validateSignon;

DELIMITER $$
CREATE PROCEDURE validateSignon(query JSON)
BEGIN

	DECLARE AuID BIGINT DEFAULT NULL;
	DECLARE IuID BIGINT DEFAULT NULL;
    DECLARE MemberName NVARCHAR(255);
    DECLARE PassphraseHash NVARCHAR(255);

	-- group_concat defaults to 1024 charaters; expand it for this query. 
	SET SESSION group_concat_max_len = 1000000;

	SET AuID = JSON_EXTRACT(query, '$.AuID');
    SET IuID = JSON_EXTRACT(query, '$.PuID');
    SET MemberName = JSON_EXTRACT(query, '$.MemberName');
    SET PassphraseHash = JSON_EXTRACT(query, '$.PassphraseHash');

	SELECT JSON_OBJECT (
					'TAG', 'TAG',
                    'Member Number', e.ID, 
                    'Member Since', DATE_FORMAT(e.CreateDate, "%Y.%m.%d"), 
                    'Member Name', en.EntityName 
				)
		FROM Entity e
			LEFT JOIN Passphrase p
			  ON e.ID = p.EntityID
				AND p.RecordStatusID = 10
			LEFT JOIN EntityName en
			  ON e.ID = en.EntityID
				AND  EntityNameTypeID = 2
				AND en.RecordStatusID = 10
		WHERE e.EntityTypeID = 6
		  AND en.EntityName = MemberName
		  AND p.PassphraseHash = PassphraseHash
		  AND e.RecordStatusID = 10;
		  
    

END $$
DELIMITER ;