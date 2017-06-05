DROP PROCEDURE IF EXISTS insertIngredient;
DELIMITER //
CREATE PROCEDURE insertIngredient(
  IN name          TEXT,
  IN supplier      TEXT
)
  BEGIN
    SET @ingredient_id_v = (SELECT IFNULL(MAX(ingredient_id),0)+1 FROM ingredient);
    SET @name_v = name;
    SET @supplier_v = supplier;
    SET @s = 'INSERT INTO ingredient(ingredient_id, ingredient_name, supplier) VALUES (?, ?, ?)';

    PREPARE statement FROM @s;
    EXECUTE statement
    USING @ingredient_id_v, @name_v, @supplier_v;
    DEALLOCATE PREPARE statement;

    SELECT @ingredient_id_v AS ingredient_id;
  END//
DELIMITER ;