CREATE TABLE LOGTABLE
 (
 tabname VARCHAR2(20),
 opname CHAR(3) CHECK (opname IN ('INS','UPD','DEL')),
 Uname VARCHAR2(20),
 Sdate DATE
 );
 
