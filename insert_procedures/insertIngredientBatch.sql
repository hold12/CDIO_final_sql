USE dbweight;

DROP PROCEDURE IF EXISTS insertIngredientbatch;

DELIMITER //

CREATE PROCEDURE insertIngredientbatch(
  IN ingredient_id INT(11),
  IN amount        DOUBLE
)
  BEGIN
    SET @id = IFNULL((SELECT MAX(ingredientbatch_id)
               FROM ingredientbatch),0)+1;
    SET @ingredient_id_v = ingredient_id;
    SET @amount_v = amount;
    SET @s = 'INSERT INTO ingredientbatch(ingredientbatch_id, ingredient_id, amount) VALUES (?,?,?);';
    PREPARE statement FROM @s;
    EXECUTE statement USING @id, @ingredient_id_v, @amount_v;
    DEALLOCATE PREPARE statement;

  END//

DELIMITER ;