USE dbweight;

DROP PROCEDURE IF EXISTS updateIngredientbatch;

DELIMITER //

CREATE PROCEDURE updateIngredientbatch(
  IN id            INT(11),
  IN ingredient_id INT(11),
  IN amount        DOUBLE
)
  BEGIN

    SET @s = CONCAT('
      UPDATE ingredientbatch
      SET ingredient_id = ', ingredient_id, '
        , amount = ', amount, '
      WHERE ingredientbatch_id = ', id, ';');
    PREPARE statement FROM @s;
    EXECUTE statement;
    DEALLOCATE PREPARE statement;

  END//

DELIMITER ;