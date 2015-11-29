create or replace PROCEDURE UPDATE_ROOM (mid in module.crn%type, rNum in  MODULE_TIME.ROOMNO%type) AS 


BEGIN

UPDATE MODULE_TIME
SET RoomNo = rNum
WHERE CRN = mid;



  NULL;
END UPDATE_ROOM;