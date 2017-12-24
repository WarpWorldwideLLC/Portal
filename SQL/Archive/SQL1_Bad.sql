SELECT * FROM sys.sys_config;


SELECT Version();

CREATE DATABASE WARP_M
	DEFAULT CHARACTER SET = ''
	DEFAULT COLLATE = ''
;

CREATE DATABASE WARP_S
;

/* Client Format
*** Allow unlimited sub-clients. Sub-Clients have all the rignts of clients for 
*** Entities below them in the hierarchy. All clients are 

Client_ID - int64 
Parent_Client_ID

*/


/* Account Format
Account_ID - Int64
Parent_Account_ID
Client_ID

*/

/* Mailbox Format
Mailbox_ID - Int64
Parent_Mailbox_ID
Account_ID

*/


/* ADDRESS Format
Address_ID
recipient
street address 1...street address n
postal code
city/town/locality
state/province
country name

*/

/*
 Identity - represents and actual person. A legal entity, such as a corporation or government agency, is a Client. 
 
 An account can be assocaited with mutliple identiites. 
 
 Users log in wiht Identity credentials, and access their accounts and other resources accordingly. 

*/


/* Access Rules

Mailbox inherits from Account
Account inherits from Client

Each Account represents at most 1 person. 
Each Account is linked to 1 or more clients
Each Mailbox is linked to 1 or more accounts. 

Need seperate entites for Accounts and Persons?



*/