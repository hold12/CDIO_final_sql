USE dbweight;

DROP PROCEDURE IF EXISTS insertIngredientbatch;

DELIMITER //

CREATE PROCEDURE insertIngredientbatch(
  IN ingredient_id INT(11),
  IN amount        DOUBLE
)
  BEGIN
    SET @id = IFNULL((SELECT MAX(ingredientbatch_id)
               FROM ingredientbatch),0);
    SET @s = CONCAT(
        'INSERT INTO ingredientbatch(ingredientbatch_id, ingredient_id, amount) VALUES(
        ', @id + 1, ',', ingredient_id, ',', amount, ');'
    );
    PREPARE statement FROM @s;
    EXECUTE statement;
    DEALLOCATE PREPARE statement;

  END//

DELIMITER ;