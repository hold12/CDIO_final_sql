USE dbweight;

DROP PROCEDURE IF EXISTS deleteOperator;

DELIMITER //

CREATE PROCEDURE deleteOperator (
  IN id INT(11)
)
BEGIN
  SET @s = CONCAT('
  DELETE FROM operator
  WHERE operator_id = ',id,';');

  PREPARE statement FROM @s;
  EXECUTE statement;
  DEALLOCATE PREPARE statement;

END//

DELIMITER ;