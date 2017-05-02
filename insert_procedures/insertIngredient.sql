DROP PROCEDURE IF EXISTS insertIngredient;
DELIMITER //
CREATE PROCEDURE insertIngredient(
  IN name     TEXT,
  IN supplier TEXT
)
  BEGIN
    SET @id = IFNULL((SELECT MAX(ingredient_id)
                      FROM ingredient), 0) + 1;
    SET @nam = name;
    SET @sup = supplier;
    SET @s = 'INSERT INTO ingredient(ingredient_id, ingredient_name, supplier) VALUES (?, ?, ?)';
    
	PREPARE statement FROM @s;
    EXECUTE statement
    USING @id, @nam, @sup;
    DEALLOCATE PREPARE statement;
  END//
DELIMITER ;