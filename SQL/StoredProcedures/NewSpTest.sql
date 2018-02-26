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

CALL saveCampData('{"AuID": 1, "IuID": 1, "travelerName": "John Arp", "parentName": "Esther Myers", "travelerAddress": "Some Address", "travelerPrimaryPhoneNumber": "Phone1", "travelerAlternatePhoneNumber": "Phone2", 
		"travelerEMailAddress": "EmailAddress", "travelerGender": "Male", "travelerDateOfBirth": "01/01/1901", "travelerComments": "Some comments.", "paymentType": "full", 
        "paymentAmountText": "$ 5,990.00", "paymentAmount": "599000", "paymentDescription": "2018 Summer Camp", "paymentNotes": "Payment Succeeded."}');

SELECT * FROM CampData;

CALL saveStripeCampData('{"AuID": 1, "IuID": 1, "stripeToken": "tok_1BkGAZDm8rfcoBsJt8IWbrxr", "stripeTokenType": "card", "stripeEmail": "john.arp@warpww.com", "stripeBillingName": "John Arp", "stripeBillingAddressCountry": "United States", "stripeBillingAddressCountryCode": "US", 
		"stripeBillingAddressZip": "9999", "stripeBillingAddressLine1": "steeet", "stripeBillingAddressCity": "coty"}');

SELECT * FROM StripeCampData;

CALL addEntitySolution ('{"AuID": 1, "IuID": 1, "MemberID": 1, "SolutionID": 1, "BillingEventID": 1 }');

SELECT * FROM EntitySolution;

CALL addSolutionToCart ('{"AuID": 1, "IuID": 1, "MemberID": 1, "SolutionID": 1, "BillingEventID": 1 }');


SELECT * FROM ShoppingCart;

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
      