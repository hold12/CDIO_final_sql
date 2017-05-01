USE dbweight;

DROP PROCEDURE IF EXISTS deleteRecipe;

DELIMITER //

CREATE PROCEDURE deleteRecipe (
  IN id INT(11)
)
BEGIN
  SET @recipe_id = id;
  SET @s = 'DELETE FROM recipe
  WHERE recipe_id = ?;';

  PREPARE statement FROM @s;
  EXECUTE statement USING @recipe_id;
  DEALLOCATE PREPARE statement;

END//

DELIMITER ;