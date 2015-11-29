--SELECTION
--Return a list of all modules
SELECT NAME FROM MODULE;

--INNER JOIN
--Return roomNo, start_time and duration for History module
SELECT NAME, ROOMNO, START_TIME, DURATION
FROM MODULE
INNER JOIN MODULE_TIME
ON MODULE.CRN = MODULE_TIME.CRN
WHERE NAME = 'History';

--OUTER JOIN
--Return full details of all modules
SELECT *
FROM MODULE
FULL OUTER JOIN MODULE_TIME
ON MODULE.CRN = MODULE_TIME.CRN;

--SUB QUERY
--Return details of module wheremore than 50 students enrolled
SELECT CRN, NAME, COURSECODE, NOOFSTUDENTS
FROM MODULE WHERE CRN IN 
(SELECT CRN FROM MODULE WHERE NOOFSTUDENTS > 50) ;

--INTERSECT
--Return the staff ids of all those lecturers who teach modules
SELECT STAFFID FROM MODULE
INTERSECT
SELECT STAFFID FROM LECTURER;

--UNION
SELECT NAME FROM MODULE
UNION
SELECT NAME FROM LECTURER;

--AGGREGATION
--count the number of buildings
SELECT COUNT(buildingPrefix) FROM Building;
