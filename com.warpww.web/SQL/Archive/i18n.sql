/*
 Com.warpww.web.filecounter.i18n                                                                             
(text_es.properties)
(text.properties)
(text_zh.properties)
*/

DROP TABLE IF EXISTS i18n;
CREATE TABLE i18n (
	ID 									BIGINT PRIMARY KEY AUTO_INCREMENT,
	ForeignKeyID 						BIGINT,
    RecordStatusID						BIGINT, 
    CreateDate 							DATETIME,
    CreateUserID 						BIGINT,
	LastModifiyDate 					DATETIME,
    LastModifyUserID 					BIGINT,
    LanguageCode						NVARCHAR(5), -- ISO 639-1 Language Code
    CountryCode							NVARCHAR(5), -- ISO 3166-1 Alpha-2 Country Code
    Namespace							NVARCHAR(100),
    ServletJspName						NVARCHAR(100),
    KeyText								NVARCHAR(100),
    ValueText							NVARCHAR(1000),
    StatusCode							NVARCHAR(3), 		-- Pend/Commit/Publish
    EndValue							BIT);
    
CREATE TABLE  USERDETAILS   
   ( NAME VARCHAR(100),   
    PASSWORD VARCHAR(50),   
    EMAIL VARCHAR(50),   
    LANGUAGE VARCHAR(50)  
   ); 