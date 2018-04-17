USE WarpAdmin2017;

SELECT * FROM Version;

/*
	SELECT DATA TO CSV, Import CSV to new schema tables, Compare
*/

SELECT TABLE_NAME FROM information_schema.tables WHERE TABLE_SCHEMA = 'WarpAdmin2017';

SELECT TABLE_NAME, COLUMN_NAME, ORDINAL_POSITION, COLUMN_DEFAULT, IS_NULLABLE, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, CHARACTER_SET_NAME, COLLATION_NAME, COLUMN_TYPE, COLUMN_KEY 
FROM information_schema.columns 
WHERE TABLE_SCHEMA = 'WarpAdmin2017';


SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'warpadmin2017';

select * from mysql.proc where db = 'warpadmin2017';


SHOW VARIABLES LIKE "secure_file_priv";

/* SELECT TO CSV */
SELECT TABLE_NAME 
FROM information_schema.tables 
WHERE TABLE_SCHEMA = 'WarpAdmin2017'
INTO OUTFILE '/var/lib/mysql-files/orders.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';