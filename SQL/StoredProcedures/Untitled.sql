USE WarpAdmin2017;


SELECT * FROM ShoppingCart; 
CALL getCart('{"Command": "GetCart", "AuID":1,"IuID":1,"MemberID":2}');
CALL getCartByReceipt('{"Command": "GetCart", "AuID":1,"IuID":1,"MemberID":2, "ReceiptNumber":"A2F9A846-3942"}');
CALL getCartByReceipt('{"Command":"GetCartByReceipt","AuID":1,"IuID":1,"MemberID":2}');

