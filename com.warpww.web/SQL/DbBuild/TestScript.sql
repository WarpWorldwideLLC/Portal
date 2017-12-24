

USE WarpAdmin2017;

SELECT * FROM Entity;




SELECT CONCAT(
    '[', 
    GROUP_CONCAT(json_object('ID', ID, 'CreateDate', CreateDate)),
    ']')
FROM Entity;

-- CALL registerUserAccount ('{"CommandText":"RegisterUserAccount","AuID":1,"IuID":1,"MemberName":"GracieWarp3","EmailAddress":"grace.arp@warpww.com","PassphraseHash":"1000:dd47287a430d50a93a5e39e5184090661a1c13297395d6fb:67391a09d9dbf3b267f1b983796104928119dd873b7eecb7"}');
 CALL getUserAccountByID('{"AuID": 1, "IuID": 1, "UserAccountID": 2}');
 CALL getMemberList('{"AuID": 1, "IuID": 1}');

 CALL validateSignon('{"AuID": 1, "IuID": 1, "MemberName": "JonLi", "PassphraseHash": "1000:3f22383290d03985476ba3721ba0fde9c4c10946d459f857:26262b7bdd19c0fb2fc309d0fbbc1594b28ae4e3aa38530b"}');

-- SHOW VARIABLES LIKE 'datadir';

/* 

Error Code: 1305. PROCEDURE warpadmin2017.SP_registerUserAccount does not exist
Error Code: 1305. PROCEDURE warpadmin2017.validateSignon does not exist


*/