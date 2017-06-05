DROP PROCEDURE IF EXISTS insertRecipe;
DELIMITER //
CREATE PROCEDURE insertRecipe(
  IN name      TEXT
)
  BEGIN
    SET @recipe_id_v = (SELECT IFNULL(MAX(recipe_id),0)+1 FROM recipe);
    SET @name_v = name;
    SET @s = 'INSERT INTO recipe(recipe_id, recipe_name) VALUES(?,?);';

    PREPARE statement FROM @s;
    EXECUTE statement
    USING @recipe_id_v, @name_v;
    DEALLOCATE PREPARE statement;
    
    SELECT @recipe_id_v AS recipe_id;
  END//
DELIMITER ;