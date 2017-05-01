USE dbweight;

DROP PROCEDURE IF EXISTS deleteOperator;

DELIMITER //

CREATE PROCEDURE deleteOperator (
  IN id INT(11)
)
BEGIN
  SET @operator_id = id;
  SET @s = 'DELETE FROM operator
  WHERE operator_id = ?;';

  PREPARE statement FROM @s;
  EXECUTE statement USING @operator_id;
  DEALLOCATE PREPARE statement;

END//

DELIMITER ;