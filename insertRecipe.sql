USE dbweight;

DROP PROCEDURE IF EXISTS insertRecipe;

DELIMITER //

CREATE PROCEDURE insertRecipe(
  IN name TEXT
)
  BEGIN
    SET @id = (SELECT MAX(recipe_id)
               FROM recipe);
    SET @s = CONCAT(
        'INSERT INTO recipe(recipe_id, recipe_name) VALUES(
        ', @id + 1, ',''', name, '''
        );'
    );
    PREPARE statement FROM @s;
    EXECUTE statement;
    DEALLOCATE PREPARE statement;

  END//

DELIMITER ;