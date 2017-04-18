USE dbweight;

DROP PROCEDURE IF EXISTS insertOperator;

DELIMITER //

CREATE PROCEDURE insertOperator (
  IN firstname TEXT,
  IN lastname TEXT,
  IN initials TEXT,
  IN cpr TEXT,
  IN password TEXT
)
BEGIN
  SET @id = (SELECT MAX(operator_id) FROM operator);
  SET @s = CONCAT(
    'INSERT INTO operator(operator_id, operator_firstname, operator_lastname, initials, cpr, password) VALUES('''
    ,@id+1,''',''',firstname,''',''',lastname,''',''',initials,''',''',cpr,''',''',password,''');'
  );
  SELECT @s;
  PREPARE statement FROM @s;
  EXECUTE statement;
  DEALLOCATE PREPARE statement;

END//

DELIMITER ;

CALL insertOperator('Hans','GH','FGH','210195-0000','hello');

SELECT * FROM operator;