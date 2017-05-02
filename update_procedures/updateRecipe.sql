DROP PROCEDURE IF EXISTS updateRecipe;
DELIMITER //
CREATE PROCEDURE updateRecipe(
  IN id   INT(11),
  IN name TEXT
)
  BEGIN
    SET @recipe_id = id;
    SET @name_v = name;
    SET @s = 'UPDATE recipe
      SET recipe_name = ?
      WHERE recipe_id = ?';
    PREPARE statement FROM @s;
    EXECUTE statement USING @name_v, @recipe_id;
    DEALLOCATE PREPARE statement;
  END//
DELIMITER ;