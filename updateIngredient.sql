USE dbweight;

DROP PROCEDURE IF EXISTS updateIngredient;

DELIMITER //

CREATE PROCEDURE updateIngredient(
  IN id       INT(11),
  IN name     TEXT,
  IN supplier TEXT
)
  BEGIN
    
    SET @s = CONCAT('
      UPDATE ingredient
      SET ingredient_name = ''',name,'''
        , supplier = ''',supplier,'''
      WHERE ingredient_id = ', id, ';');
    PREPARE statement FROM @s;
    EXECUTE statement;
    DEALLOCATE PREPARE statement;

  END//

DELIMITER ;