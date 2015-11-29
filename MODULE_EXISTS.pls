CREATE OR REPLACE FUNCTION MODULE_EXISTS (mid module.crn%type)
RETURN BOOLEAN AS 

mnam module.name%type;

BEGIN

  SELECT name into mnam FROM MODULE
  WHERE CRN = mid;
  
  RETURN true;

EXCEPTION

  WHEN no_data_found then
  RETURN false;
  
END MODULE_EXISTS;