USE dbweight;

DROP PROCEDURE IF EXISTS updateOperator;

DELIMITER //

CREATE PROCEDURE updateOperator (
  IN op_id INT(11),
  IN fieldToUpdate TEXT,
  IN newValue TEXT
)
BEGIN
  SET @s = CONCAT('
  UPDATE operator
  SET ',fieldToUpdate,' = ''',newValue,'''
  WHERE operator_id = ''',op_id,''';');
  PREPARE statement FROM @s;
  EXECUTE statement;
  DEALLOCATE PREPARE statement;

END//

DELIMITER ;

CALL insertOperator('Freya','H','FGH','210195-0000','Hello');
CALL updateOperator(4,'operator_firstname','Freys');

SELECT * FROM operator;
