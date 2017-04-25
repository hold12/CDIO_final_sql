USE dbweight;

DROP PROCEDURE IF EXISTS deleteRecipe;

DELIMITER //

CREATE PROCEDURE deleteRecipe (
  IN id INT(11)
)
BEGIN
  SET @s = CONCAT('
  DELETE FROM recipe
  WHERE recipe_id = ',id,';');

  PREPARE statement FROM @s;
  EXECUTE statement;
  DEALLOCATE PREPARE statement;

END//

DELIMITER ;