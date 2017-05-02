DROP PROCEDURE IF EXISTS deleteOperator;
DELIMITER //
CREATE PROCEDURE deleteOperator (
  IN id INT(11)
)
BEGIN
  SET @operator_id = id;
  SET @s = 'UPDATE operator
  SET is_active = 0
  WHERE operator_id = ?;';

  PREPARE statement FROM @s;
  EXECUTE statement USING @operator_id;
  DEALLOCATE PREPARE statement;
END//
DELIMITER ;