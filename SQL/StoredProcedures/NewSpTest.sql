USE WarpAdmin2017;

SELECT * FROM Entity WHERE EntityTypeID = 6;
SELECT * FROM ctlEntityType;
SELECT * FROM EntityName;
SELECT * FROM ctlEntityNameType;
SELECT * FROM eContact;
SELECT * FROM ctlEContactType;



UPDATE EntityName 
SET EntityNameTypeID = 2
WHERE ID > 0
;

DELETE FROM EntityName WHERE ID = 12;

/* 

Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.

*/

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
		  AND en.EntityName = 'JohnnyWarp'
		  AND p.PassphraseHash = PassphraseHash
		  AND e.RecordStatusID = 10;
      