CREATE OR REPLACE FUNCTION GET_MODULE_NAME (mid module.crn%type)
RETURN VARCHAR2 AS 

mnam module.name%type;

BEGIN

SELECT NAME INTO mnam FROM module
WHERE CRN = mid;

RETURN mnam;

EXCEPTION
WHEN no_data_found then

dbms_output.put_line('Module not found, incorrect CRN number');
RETURN ' ';

END GET_MODULE_NAME;