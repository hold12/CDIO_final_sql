USE dbweight;

DROP PROCEDURE IF EXISTS updateRecipecomponent;

DELIMITER //

CREATE PROCEDURE updateRecipecomponent(
  IN recipe_id            INT(11),
  IN ingredient_id        INT(11),
  IN nominated_net_weight DOUBLE,
  IN tolerance            DOUBLE
)
  BEGIN

    SET @s = CONCAT('
      UPDATE recipecomponent
      SET nominated_net_weight = ', nominated_net_weight, '
        , tolerance = ', tolerance, '
      WHERE recipe_id = ', recipe_id, '
        AND ingredient_id = ', ingredient_id, ';');
    PREPARE statement FROM @s;
    EXECUTE statement;
    DEALLOCATE PREPARE statement;

  END//

DELIMITER ;