USE dbweight;

DROP PROCEDURE IF EXISTS insertIngredient;

DELIMITER //

CREATE PROCEDURE insertIngredient(
  IN name     TEXT,
  IN supplier TEXT
)
  BEGIN
    SET @id = IFNULL((SELECT MAX(ingredient_id)
               FROM ingredient),0);
    SET @s = CONCAT(
        'INSERT INTO ingredient(ingredient_id, ingredient_name, supplier) VALUES(
        ', @id + 1, ',''', name, ''',''', supplier, ''');'
    );
    PREPARE statement FROM @s;
    EXECUTE statement;
    DEALLOCATE PREPARE statement;

  END//

DELIMITER ;