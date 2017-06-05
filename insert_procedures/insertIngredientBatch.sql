DROP PROCEDURE IF EXISTS insertIngredientbatch;
DELIMITER //
CREATE PROCEDURE insertIngredientbatch(
  IN ingredient_id      INT(11),
  IN amount             DOUBLE
)
  BEGIN
    SET @ingredientbatch_id_v = (SELECT IFNULL(MAX(ingredientbatch_id),0)+1 FROM ingredientbatch);
    SET @ingredient_id_v = ingredient_id;
    SET @amount_v = amount;
    SET @s = 'INSERT INTO ingredientbatch(ingredientbatch_id, ingredient_id, amount) VALUES (?,?,?);';

    PREPARE statement FROM @s;
    EXECUTE statement
    USING @ingredientbatch_id_v, @ingredient_id_v, @amount_v;
    DEALLOCATE PREPARE statement;

    SELECT @ingredientbatch_id_v AS ingredientbatch_id;
  END//
DELIMITER ;