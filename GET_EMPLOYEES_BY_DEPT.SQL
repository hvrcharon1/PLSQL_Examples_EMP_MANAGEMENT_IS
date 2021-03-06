-- returns names of employees for the given deparment
CREATE OR REPLACE FUNCTION GET_EMPLOYEES_BY_DEPT (P_DEPTID NUMBER) 
RETURN VARCHAR2
IS
  CURSOR EMPCUR IS
    SELECT FIRST_NAME FROM EMPLOYEES WHERE DEPARTMENT_ID = P_DEPTID;
  V_NAMES VARCHAR2(2000) := '';  
BEGIN
  FOR EMPREC IN EMPCUR
  LOOP
      V_NAMES := V_NAMES || EMPREC.FIRST_NAME || ',';
  END LOOP;
  
  RETURN RTRIM(V_NAMES,',');
END;

-- call it from PL/SQL block
SET SERVEROUTPUT ON

BEGIN
   DBMS_OUTPUT.PUT_LINE( GET_EMPLOYEES_BY_DEPT(80));
END;   

-- Call it from SQL SELECT
SELECT DEPARTMENT_NAME, GET_EMPLOYEES_BY_DEPT(DEPARTMENT_ID) FROM  DEPARTMENTS WHERE DEPARTMENT_ID IN ( SELECT DEPARTMENT_ID FROM EMPLOYEES)

