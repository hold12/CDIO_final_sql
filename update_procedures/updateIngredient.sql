USE dbweight;

DROP PROCEDURE IF EXISTS updateIngredient;

DELIMITER //

CREATE PROCEDURE updateIngredient(
  IN id       INT(11),
  IN name     TEXT,
  IN supplier TEXT
)
  BEGIN
    SET @ingredient_id = id;
    SET @name_v = name;
    SET @supplier_v = supplier;
    SET @s = 'UPDATE ingredient
      SET ingredient_name = ?
        , supplier = ?
      WHERE ingredient_id = ?;';
    PREPARE statement FROM @s;
    EXECUTE statement USING @name_v, @supplier_v, @ingredient_id;
    DEALLOCATE PREPARE statement;

  END//

DELIMITER ;