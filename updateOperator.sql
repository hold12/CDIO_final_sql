USE dbweight;

DROP PROCEDURE IF EXISTS updateOperator;

DELIMITER //

CREATE PROCEDURE updateOperator (
  IN id INT(11),
  IN fieldToUpdate TEXT,
  IN newValue TEXT
)
BEGIN
  SET @s = CONCAT('
  UPDATE operator
  SET ',fieldToUpdate,' = ''',newValue,'''
  WHERE operator_id = ''',id,''';');
  PREPARE statement FROM @s;
  EXECUTE statement;
  DEALLOCATE PREPARE statement;

END//

DELIMITER ;
