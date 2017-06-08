DROP PROCEDURE IF EXISTS updateIngredientbatch;
DELIMITER //
CREATE PROCEDURE updateIngredientbatch(
  IN ingredientbatch_id INT(11),
  IN ingredient_id      INT(11),
  IN amount             DOUBLE
)
  BEGIN
    SET @ingredientbatch_id_v = ingredientbatch_id;
    SET @ingredient_id_v = ingredient_id;
    SET @amount_v = amount;
    SET @s = 'UPDATE ingredientbatch
      SET ingredient_id = ?
        , amount = ?
      WHERE ingredientbatch_id = ?;';

    PREPARE statement FROM @s;
    EXECUTE statement
    USING @ingredient_id_v, @amount_v, @ingredientbatch_id_v;
    DEALLOCATE PREPARE statement;
  END//
DELIMITER ;