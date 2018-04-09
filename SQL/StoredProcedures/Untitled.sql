USE WarpAdmin2017;


SELECT * FROM ShoppingCart; 
CALL getCart('{"Command": "GetCart", "AuID":1,"IuID":1,"MemberID":3}');
CALL getCartPendingItemsOnly('{"Command": "GetCart", "AuID":1,"IuID":1,"MemberID":3}');
CALL getCartSoldItemsOnly('{"Command": "GetCart", "AuID":1,"IuID":1,"MemberID":3}');

CALL setMemberSolution('{"Command": "SetMemberSolution", "AuID":1,"IuID":1,"MemberID":2}');
CALL getMemberSolution('{"Command": "SetMemberSolution", "AuID":1,"IuID":1,"MemberID":2}');

SELECT * FROM ctlRecordStatus;

SELECT * 
FROM EntitySolution;

INSERT INTO EntitySolution (SolutionID, EntityID, BillingEventID, StartDate)
SELECT SolutionID, EntityID, 0, MAX(CreateDate) AS StartDate
FROM ShoppingCart
WHERE RecordStatusID = 51
  AND EntityID = 2
GROUP BY SolutionID, EntityID
;



SELECT * FROM Solution;


UPDATE Solution 
SET SolutionCost = SolutionCost * 100
WHERE ID > 0;
