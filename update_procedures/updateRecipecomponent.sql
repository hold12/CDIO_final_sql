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
    SET @recipe_id_v = recipe_id;
    SET @ingredient_id_v = ingredient_id;
    SET @nominated_net_weight_v = nominated_net_weight;
    SET @tolerance_v = tolerance;
    SET @s = 'UPDATE recipecomponent
      SET nominated_net_weight = ?
        , tolerance = ?
      WHERE recipe_id = ?
        AND ingredient_id = ?';
    PREPARE statement FROM @s;
    EXECUTE statement USING @nominated_net_weight_v, @tolerance_v, @recipe_id_v, @ingredient_id_v;
    DEALLOCATE PREPARE statement;

  END//

DELIMITER ;