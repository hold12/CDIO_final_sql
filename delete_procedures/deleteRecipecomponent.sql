USE dbweight;

DROP PROCEDURE IF EXISTS deleteRecipecomponent;

DELIMITER //

CREATE PROCEDURE deleteRecipecomponent (
  IN recipe_id INT(11),
  IN ingredient_id INT(11)
)
BEGIN
  SET @s = CONCAT('
  DELETE FROM recipecomponent
  WHERE recipe_id = ',recipe_id,'
  AND ingredient_id = ',ingredient_id,';');

  PREPARE statement FROM @s;
  EXECUTE statement;
  DEALLOCATE PREPARE statement;

END//

DELIMITER ;