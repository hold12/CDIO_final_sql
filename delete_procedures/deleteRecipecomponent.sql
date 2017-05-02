DROP PROCEDURE IF EXISTS deleteRecipecomponent;
DELIMITER //
CREATE PROCEDURE deleteRecipecomponent (
  IN recipe_id INT(11),
  IN ingredient_id INT(11)
)
BEGIN
  SET @recipe_id_v = recipe_id;
  SET @ingredient_id_v = ingredient_id;
  SET @s = 'DELETE FROM recipecomponent
  WHERE recipe_id = ?
  AND ingredient_id = ?;';

  PREPARE statement FROM @s;
  EXECUTE statement USING @recipe_id_v, @ingredient_id_v;
  DEALLOCATE PREPARE statement;
END//
DELIMITER ;