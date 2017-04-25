USE dbweight;

DROP PROCEDURE IF EXISTS updateRecipe;

DELIMITER //

CREATE PROCEDURE updateRecipe(
  IN id   INT(11),
  IN name TEXT
)
  BEGIN
    SET @s = CONCAT('
      UPDATE recipe
      SET recipe_name = ''', name, '''
      WHERE recipe_id = ', id, ';');
    PREPARE statement FROM @s;
    EXECUTE statement;
    DEALLOCATE PREPARE statement;

  END//

DELIMITER ;