USE dbweight;

DROP PROCEDURE IF EXISTS deleteIngredient;

DELIMITER //

CREATE PROCEDURE deleteIngredient (
  IN id INT(11)
)
BEGIN
  SET @s = CONCAT('
  DELETE FROM ingredient
  WHERE ingredient_id = ',id,';');

  PREPARE statement FROM @s;
  EXECUTE statement;
  DEALLOCATE PREPARE statement;

END//

DELIMITER ;