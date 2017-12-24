USE WarpAdmin2017;

-- CALL registerUserAccount(1, 'grace.arp@warpww.com', 'Gracie', 'ABCD', @TEST);

CALL getUserAccountByID('{"AuID": 1, "IuID": 1, "UserAccountID": 2}');


SELECT CURRENT_TIMESTAMP, DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 4 HOUR);

SELECT * FROM Entity;
SELECT * FROM EntityName;
SELECT * FROM eContact;
SELECT * FROM Passphrase;

CALL registerUserAccount('{"AuID": 1, "IuID": 1, "MemberName": "JohnnyWarp", "EmailAddress": "jarp@ansebbian.com", "PassphraseHash": "Pengy"}');

CALL registerUserAccount('{"AuID": 1, "IuID": 1, "MemberName": "GracieWarp", "EmailAddress": "grace@ansebbian.com", "PassphraseHash": "Pengy"}');
  
CALL registerUserAccount('{"AuID": 1, "IuID": 1, "MemberName": "JonWarp", "EmailAddress": "jon@ansebbian.com", "PassphraseHash": "Pengy"}');
  
CALL registerUserAccount('{"AuID": 1, "IuID": 1, "MemberName": "SuperJWarp", "EmailAddress": "superj@ansebbian.com", "PassphraseHash": "Pengy"}');
  
CALL registerUserAccount('{"AuID": 1, "IuID": 1, "MemberName": "ZeZeWarp", "EmailAddress": "zeze@ansebbian.com", "PassphraseHash": "Pengy"}');

CALL registerUserAccount('{"AuID": 1, "IuID": 1, "MemberName": "KikyoWarp", "EmailAddress": "kikyo@ansebbian.com", "PassphraseHash": "Pengy"}');
  
  
CALL test2('{"AuID": 1, "IuID": 1, "UserAccountID": 2}');

/* 
	A BLOB type in MySQL can store up to 65,534 bytes, if you try to store more than this much data MySQL will truncate the data. 
	MEDIUMBLOB can store up to 16,777,213 bytes, and 
	LONGBLOB can store up to 4,294,967,292 bytes.
*/

