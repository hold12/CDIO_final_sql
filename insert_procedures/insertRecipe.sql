USE dbweight;

DROP PROCEDURE IF EXISTS insertRecipe;

DELIMITER //

CREATE PROCEDURE insertRecipe(
  IN name TEXT
)
  BEGIN
    SET @id = IFNULL((SELECT MAX(recipe_id)
               FROM recipe),0)+1;
    SET @name_v = name;
    SET @s = 'INSERT INTO recipe(recipe_id, recipe_name) VALUES(?,?);';
    PREPARE statement FROM @s;
    EXECUTE statement USING @id, @name_v;
    DEALLOCATE PREPARE statement;

  END//

DELIMITER ;