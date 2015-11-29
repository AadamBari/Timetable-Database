

--SELECT * FROM MODULE;
--check if staff exists, return their name

/*
Aadam can move a module to a different room, he does this by editing the room number in the module time table. 
To select the module he has to input the correct CRN number.
However the room capacity needs to be less than or equal to the capacity that the user requests
(The user enters the desired capacity).

The new room of the module can't clash with another room occupied at the same time.


*/

set serveroutput on

declare

ModID module.crn%type:='&Enter_Module_CRN';
ModName module.name%type;
newRoom MODULE_TIME.ROOMNO%type:='&Enter_New_Module_Room'; 

BEGIN
  
  IF MODULE_EXISTS(ModID) then
    ModName := GET_MODULE_NAME(ModID);
    
    UPDATE_ROOM(ModID, newRoom);
    
    dbms_output.put_line(Modname||' room sucessfully updated');
    
  ELSE
    dbms_output.put_line('Module not found');

  END IF;
  EXCEPTION
  WHEN no_data_found then
    dbms_output.put_line('Insert valid information');
    
END;




